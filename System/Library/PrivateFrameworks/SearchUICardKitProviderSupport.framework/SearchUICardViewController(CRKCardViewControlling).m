@implementation SearchUICardViewController(CRKCardViewControlling)

- (id)cardSectionViewSource
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, sel_cardSectionViewSource);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCardSectionViewSource:()CRKCardViewControlling
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__SearchUICardViewController_CRKCardViewControlling__setCardSectionViewSource___block_invoke;
  v10[3] = &unk_24E385DC0;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x2207BBA58](v10);
  v9 = (void *)MEMORY[0x2207BBA58](v5, v6, v7, v8);
  objc_setAssociatedObject(a1, sel_cardSectionViewSource, v9, (void *)0x303);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (id)cardViewControllerDelegate
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, sel_cardViewControllerDelegate);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCardViewControllerDelegate:()CRKCardViewControlling
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__SearchUICardViewController_CRKCardViewControlling__setCardViewControllerDelegate___block_invoke;
  v10[3] = &unk_24E385DE8;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x2207BBA58](v10);
  v9 = (void *)MEMORY[0x2207BBA58](v5, v6, v7, v8);
  objc_setAssociatedObject(a1, sel_cardViewControllerDelegate, v9, (void *)0x303);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (id)defaultFeedbackAdapter
{
  return objc_getAssociatedObject(a1, sel_defaultFeedbackAdapter);
}

- (void)setDefaultFeedbackAdapter:()CRKCardViewControlling
{
  objc_setAssociatedObject(a1, sel_defaultFeedbackAdapter, a3, (void *)0x301);
}

- (void)presentViewController:()CRKCardViewControlling
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "cardViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:forCardViewController:", v7, a1);

  }
}

- (void)willDismissViewController:()CRKCardViewControlling
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "cardViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardViewController:willDismissViewController:", a1, v7);

  }
}

- (void)presentViewControllerForCard:()CRKCardViewControlling animate:
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "asynchronous")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21ECF4000, v5, OS_LOG_TYPE_INFO, "Started loading asynchronous card\n    Card: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke;
    v11[3] = &unk_24E385E10;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    objc_msgSend(v12, "loadCardWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v6 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Presenting view controller for synchronous card\n    Card: %@", buf, 0xCu);
    }
    v7 = objc_alloc_init(MEMORY[0x24BE154F0]);
    objc_msgSend(v7, "setNextCard:", v4);
    objc_msgSend(a1, "cardViewControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(a1, "cardViewControllerDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performNextCardCommand:forCardViewController:", v7, a1);

    }
  }

}

- (void)cardSectionView:()CRKCardViewControlling willProcessEngagementFeedback:
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionView:willProcessEngagementFeedback:", v10, v6);

  }
}

- (void)userDidEngageCardSection:()CRKCardViewControlling withEngagementFeedback:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = a1;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Card section engaged with feedback: %@  from cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(a1, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userDidEngageCardSection:withEngagementFeedback:", v6, v7);

  }
}

- (void)commandWasPerformed:()CRKCardViewControlling
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = a1;
    _os_log_impl(&dword_21ECF4000, v5, OS_LOG_TYPE_INFO, "Command was performed with feedback: %@ from cardViewController %@ ", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a1, "cardViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commandWasPerformed:", v4);

  }
}

- (void)cardViewDidAppearForCard:()CRKCardViewControlling withAppearanceFeedback:
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardViewDidAppearForCard:withAppearanceFeedback:", v10, v6);

  }
}

- (void)cardViewDidDisappearForCard:()CRKCardViewControlling withDisappearanceFeedback:
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardViewDidDisappearForCard:withDisappearanceFeedback:", v10, v6);

  }
}

- (void)cardSectionViewDidInvalidateSizeForCardSection:()CRKCardViewControlling
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(a1, "cardViewControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardViewControllerBoundsDidChange:", a1);

  }
}

- (void)userDidReportFeedback:()CRKCardViewControlling fromCardSection:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = a1;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Card section did report feedback: %@  from cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(a1, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userDidReportFeedback:fromCardSection:", v6, v7);

  }
}

- (void)cardSectionViewWillAppearForCardSection:()CRKCardViewControlling withAppearanceFeedback:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = a1;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Card section will appear : %@  from cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(a1, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardSectionViewWillAppearForCardSection:withAppearanceFeedback:", v6, v7);

  }
}

- (void)cardSectionViewDidAppearForCardSection:()CRKCardViewControlling withAppearanceFeedback:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = a1;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Card section did appear: %@  in cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(a1, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardSectionViewDidAppearForCardSection:withAppearanceFeedback:", v6, v7);

  }
}

- (void)cardSectionViewDidDisappearForCardSection:()CRKCardViewControlling withDisappearanceFeedback:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = a1;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Card section did disappear: %@  in cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(a1, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardSectionViewDidDisappearForCardSection:withDisappearanceFeedback:", v6, v7);

  }
}

@end
