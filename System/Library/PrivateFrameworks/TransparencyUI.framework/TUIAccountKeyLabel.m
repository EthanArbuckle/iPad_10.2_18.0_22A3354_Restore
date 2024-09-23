@implementation TUIAccountKeyLabel

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (NSSelectorFromString(CFSTR("_define:")) == a3)
  {
    v7 = 0;
  }
  else if (sel_copy_ == a3)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIAccountKeyLabel;
    v7 = -[TUIAccountKeyLabel canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TUIAccountKeyLabel text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

}

@end
