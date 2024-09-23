@implementation UIContextMenuLoadingCellContentView

UIColor *__58___UIContextMenuLoadingCellContentView__contentsTintColor__block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", dbl_186684660[v2], dbl_186684660[v2], dbl_186684660[v2], 1.0);
}

@end
