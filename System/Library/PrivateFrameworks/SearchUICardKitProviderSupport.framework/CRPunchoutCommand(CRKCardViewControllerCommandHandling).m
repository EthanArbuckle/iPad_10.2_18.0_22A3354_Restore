@implementation CRPunchoutCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:
{
  id v6;
  id v7;
  uint64_t v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = a1;
  v10.super_class = (Class)&off_255492A80;
  if (objc_msgSendSuper2(&v10, sel_handleForCardViewController_cardViewControllerDelegate_, v6, v7)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "performPunchoutCommand:forCardViewController:", a1, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
