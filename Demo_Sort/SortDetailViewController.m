//
//  SortDetailViewController.m
//  Demo_Sort
//
//  Created by Claris on 2016.03.28.Monday.
//  Copyright © 2016 tickCoder. All rights reserved.
//

#import "SortDetailViewController.h"

@interface SortDetailViewController ()
@property (nonatomic, copy) NSString *codeText;
@property (nonatomic, copy) NSString *desText;
@property (nonatomic, copy) NSString *preText;
@property (nonatomic, copy) NSString *afterText;
@end

@implementation SortDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _codeLabel.text = @"xxxx";
    _desLabel.text = @"zzzz";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.desLabel.text = self.desText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)desText {
    if ([self.title hasPrefix:@"选择排序"]) {
        _desText = @"先找到序列中最大元素并将它与序列中最后一个元素交换，然后找下一个最大元素并与倒数第二个元素交换，依次类推。";
        _codeText = @"- (NSString *)sort_selection:(NSArray *)input {\n    NSInteger maxNumber = 0;\n    NSInteger maxIndex = 0;\n    NSMutableArray *sortedList = [[NSMutableArray alloc] initWithArray:input];\n    for (NSInteger i=sortedList.count-1; i>0; i--) {\n        maxNumber = [sortedList[0] integerValue];\n        maxIndex = 0;\n        for (NSInteger j=0; j<=i; j++) {\n            if (maxNumber < [sortedList[j] integerValue]) {\n                maxNumber = [sortedList[j] integerValue];\n                maxIndex = j;\n            }\n        }\n        [sortedList exchangeObjectAtIndex:i withObjectAtIndex:maxIndex];\n    }\n    return [sortedList componentsJoinedByString:@\", \"];\n}";
    } else if ([self.title hasPrefix:@"插入排序"]) {
        _desText = @"1.从第一个元素开始，该元素可以认为已经被排序。\n2.取出下一个元素，在已经排序的元素序列中从后向前扫描。\n3.如果该元素（已排序）大于新元素，将该元素移到下一位置。\n4.重复步骤3，直到找到已排序的元素小于或者等于新元素的位置。\n5.将新元素插入到下一位置。\n6.重复步骤2。";
    } else if ([self.title hasPrefix:@"冒泡排序"]) {
        _desText = @"依次比较相邻的两个数，将小数放在前面，大数放在后面。即在第一趟：先比较第1个和第2个数，将小数放前，大数放后。然后比较第2个和第3个数，小数放前，大数放后……，直到比较最后两个数，将小数放前，大数放后。至此第一趟结束，将最大的数放到了最后。在第二趟，仍从第一个数开始比较（因为可能由于第2个数和第3个数的交换，使得第1个数不再小于第2个数），将小数放前，大数放后，一只比较到到数第2个数（到数第1的位置已经最大），第二趟结束，在到数第2的位置上的到一个新的最大数（其实在整个数列中的第2大的数）。如此下去，重复以上过程，直至最终完成排序";
    } else if ([self.title hasPrefix:@"合并排序"]) {
        _desText = @"在此之前，先介绍下递归设计的技术，称为“分治法”。分治法的核心思想是：当问题比较小时，直接解决。当问题比较大时，将问题氛围两个较小的子问题，每个子问题约为缘来的一半。使用递归调用解决每个子问题。递归调用结束后，常常需要额外的处理，将较小的问题的结果合并，的到较大问题的答案。\n合并排序算法在接近数组中间的位置划分数组，然后使用递归运算对两个一半元素的数组进行排序，最后将两个子数组进行合并，形成一个新的已排序好的数组。";
    } else if ([self.title hasPrefix:@"快速排序"]) {
        _desText = @"快速排序与合并排序有着很多相似性。将要排序的数组分成两个子数组，通过两次递归调用分别对两个数组进行排序，再将已经排序好的两个数组合并成一个独立的有序数组。但是将数组一分为二的做法比合并排序中使用的简单方法复杂的多。它需要将所有小于或者等于基准元素的元素放倒基准元素前面的位置，将大于基准的元素放到基准后面的位置。";
    } else if ([self.title hasPrefix:@"堆排序"]) {
        _desText = @"堆排序(Heapsort)是指利用堆积树（堆）这种数据结构所设计的一种排序算法，它是选择排序的一种。可以利用数组的特点快速定位指定索引的元素。堆分为大根堆和小根堆，是完全二叉树。大根堆的要求是每个节点的值都不大于其父节点的值，即A[PARENT[i]] >= A[i]。在数组的非降序排序中，需要使用的就是大根堆，因为根据大根堆的要求可知，最大的值一定在堆顶。";
    } else {
        _desText = @"---";
    }
    return _desText;
}

- (IBAction)sortBtnAction:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 产生新数组
        NSMutableArray *numberList = [[NSMutableArray alloc] init];
        NSMutableString *preText = [[NSMutableString alloc] init];
        int randomCount = arc4random() % 9 + 10;// 10-18
        for (int i=0; i<randomCount; i++) {
            @autoreleasepool {
                int randomNumber = arc4random() % 80 + 1;// 1-80
                [numberList addObject:@(randomNumber)];
                if (i == randomCount -1) {
                    [preText appendFormat:@"%d ", randomNumber];
                } else {
                    [preText appendFormat:@"%d, ", randomNumber];
                }
            }
        }
        self.preText = preText;
        
        // 排列新数组
        NSString *sortedStr;
        if ([self.title hasPrefix:@"选择排序"]) {
            sortedStr = [self sort_selection:numberList];
        } else if ([self.title hasPrefix:@"插入排序"]) {
            sortedStr = [self sort_insertion:numberList];
        } else if ([self.title hasPrefix:@"冒泡排序"]) {
            sortedStr = [self sort_bubble:numberList];
        } else if ([self.title hasPrefix:@"合并排序"]) {
            sortedStr = [self sort_merge:numberList];
        } else if ([self.title hasPrefix:@"快速排序"]) {
            sortedStr = [self sort_quick:numberList];
        } else if ([self.title hasPrefix:@"堆排序"]) {
            sortedStr = [self sort_heap:numberList];
        } else {
        }
        self.afterText = sortedStr;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _preLabel.text = self.preText;
            _afterLabel.text = self.afterText;
            _codeLabel.text = self.codeText;
        });
        
    });
}

#pragma mark - 排序
/**
 *  选择排序
 *
 */
- (NSString *)sort_selection:(NSArray *)input {
    NSInteger maxNumber = 0;
    NSInteger maxIndex = 0;
    NSMutableArray *sortedList = [[NSMutableArray alloc] initWithArray:input];
    for (NSInteger i=sortedList.count-1; i>0; i--) {
        maxNumber = [sortedList[0] integerValue];
        maxIndex = 0;
        for (NSInteger j=0; j<=i; j++) {
            if (maxNumber < [sortedList[j] integerValue]) {
                maxNumber = [sortedList[j] integerValue];
                maxIndex = j;
            }
        }
        [sortedList exchangeObjectAtIndex:i withObjectAtIndex:maxIndex];
    }
    return [sortedList componentsJoinedByString:@", "];
}

/**
 *  插入排序
 *
 */
- (NSString *)sort_insertion:(NSArray *)input {
    return [NSString stringWithFormat:@"%s", __FUNCTION__];
}

/**
 *  冒泡排序
 *
 */
- (NSString *)sort_bubble:(NSArray *)input {
    return [NSString stringWithFormat:@"%s", __FUNCTION__];
}

/**
 *  合并排序
 *
 */
- (NSString *)sort_merge:(NSArray *)input {
    return [NSString stringWithFormat:@"%s", __FUNCTION__];
}

/**
 *  快速排序
 *
 */
- (NSString *)sort_quick:(NSArray *)input {
    return [NSString stringWithFormat:@"%s", __FUNCTION__];
}

/**
 *  堆排序
 *
 */
- (NSString *)sort_heap:(NSArray *)input {
    return [NSString stringWithFormat:@"%s", __FUNCTION__];
}


@end
