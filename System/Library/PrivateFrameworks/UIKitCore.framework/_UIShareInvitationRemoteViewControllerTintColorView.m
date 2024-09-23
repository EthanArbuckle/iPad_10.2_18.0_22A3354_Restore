@implementation _UIShareInvitationRemoteViewControllerTintColorView

- (void)tintColorDidChange
{
  id *v3;
  void *v4;
  id v5;

  -[UIView superview](self, "superview");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIView __viewDelegate](v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_tintColorDidChangeToColor:", v4);

  }
}

@end
