@implementation UITableView

uint64_t __75__UITableView_PKUIUtilities__pkui_groupedStyleDefaultRoundedCornerBehavior__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (qword_1ED06C650 != -1)
    dispatch_once(&qword_1ED06C650, &__block_literal_global_45);
  result = objc_msgSend(*(id *)(a1 + 32), "pkui_groupedStyleWithRoundedCorners:", (qword_1ED06C648 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  pkui_groupedStyleDefaultRoundedCornerBehavior_groupedStyle = result;
  return result;
}

@end
