@implementation UIBarButtonItem

- (void)ttr_hideManageButton
{
  void *v3;
  char v4;
  id v5;

  if ((objc_opt_respondsToSelector(self, "collaborationButtonView") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem collaborationButtonView](self, "collaborationButtonView"));
    v4 = objc_opt_respondsToSelector(v3, "setShowManageButton:");

    if ((v4 & 1) != 0)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem collaborationButtonView](self, "collaborationButtonView"));
      objc_msgSend(v5, "setShowManageButton:", 0);

    }
  }
}

@end
