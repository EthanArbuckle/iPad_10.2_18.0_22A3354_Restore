@implementation UIView(StatusBarAdditions_Internal)

- (uint64_t)_ui_addSubLayoutItem:()StatusBarAdditions_Internal
{
  return objc_msgSend(a3, "_ui_addToView:atIndex:", a1, -1);
}

- (void)_ui_addToView:()StatusBarAdditions_Internal atIndex:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((a4 & 0x8000000000000000) == 0)
  {
    objc_msgSend(v8, "insertSubview:atIndex:", a1, a4);
LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  objc_msgSend(a1, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 != v8)
  {
    objc_msgSend(v8, "addSubview:", a1);
    goto LABEL_5;
  }
LABEL_6:

}

- (uint64_t)_ui_insertSubLayoutItem:()StatusBarAdditions_Internal atIndex:
{
  return objc_msgSend(a3, "_ui_addToView:atIndex:", a1);
}

@end
