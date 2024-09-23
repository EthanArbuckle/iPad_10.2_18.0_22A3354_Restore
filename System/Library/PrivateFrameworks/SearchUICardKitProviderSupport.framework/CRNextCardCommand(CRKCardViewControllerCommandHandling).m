@implementation CRNextCardCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE154A8]);
    objc_msgSend(v6, "card");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nextCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseCard:", v9);
    objc_msgSend(v8, "setRequestedCard:", v10);
    objc_msgSend(v7, "controllerForCard:didRequestAsyncCard:withAsyncCardRequestFeedback:", v9, v10, v8);

  }
  v17.receiver = a1;
  v17.super_class = (Class)&off_255492870;
  v11 = objc_msgSendSuper2(&v17, sel_handleForCardViewController_cardViewControllerDelegate_, v6, v7);
  objc_msgSend(a1, "nextCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "nextCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "asynchronous");

  }
  else
  {
    v14 = 0;
  }

  v15 = v14 & v11;
  if ((v14 & 1) == 0 && ((v11 ^ 1) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v7, "performNextCardCommand:forCardViewController:", a1, v6);
    else
      v15 = 0;
  }

  return v15;
}

@end
