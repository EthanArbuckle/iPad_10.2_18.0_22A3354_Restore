@implementation UITableView(Tea)

- (void)deferWhenTouchingWithBlock:()Tea
{
  void (**v4)(void);

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "_deferWhenTouchingWithBlock:", v4);
  else
    v4[2]();

}

@end
