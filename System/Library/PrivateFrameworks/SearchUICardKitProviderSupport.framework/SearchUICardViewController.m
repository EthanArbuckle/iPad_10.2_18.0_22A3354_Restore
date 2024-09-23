@implementation SearchUICardViewController

id __79__SearchUICardViewController_CRKCardViewControlling__setCardSectionViewSource___block_invoke(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

id __84__SearchUICardViewController_CRKCardViewControlling__setCardViewControllerDelegate___block_invoke(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

void __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x24BE15490];
  v5 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v3;
    _os_log_impl(&dword_21ECF4000, v5, OS_LOG_TYPE_DEFAULT, "Asynchronous card loading completed for card\n    Card: %@", (uint8_t *)&v23, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "resolvedCardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BE154F0]);
      objc_msgSend(v8, "setNextCard:", v3);
      objc_msgSend(WeakRetained, "cardViewControllerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "cardViewControllerDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "performNextCardCommand:forCardViewController:", v8, WeakRetained);

      }
      objc_msgSend(WeakRetained, "cardViewControllerDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v14 = objc_alloc_init(MEMORY[0x24BE154A0]);
        objc_msgSend(WeakRetained, "cardViewControllerDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "cardViewControllerDelegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "baseCardForCardViewController:", WeakRetained);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(v14, "setBaseCard:", v18);
        objc_msgSend(v14, "setRequestedCard:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v14, "setReceivedCard:", v3);
        objc_msgSend(WeakRetained, "cardViewControllerDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "controllerForCard:didReceiveAsyncCard:withAsyncCardReceiptFeedback:", *(_QWORD *)(a1 + 32), v3, v14);

      }
      goto LABEL_16;
    }
    v19 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke_cold_1(a1, v19);
    objc_msgSend(WeakRetained, "cardViewControllerDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "cardViewControllerDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cardViewController:didFailToLoadCard:", WeakRetained, *(_QWORD *)(a1 + 32));
LABEL_16:

    }
  }

}

void __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21ECF4000, a2, OS_LOG_TYPE_ERROR, "Failed to load card view controller for card\n    Card: %@", (uint8_t *)&v3, 0xCu);
}

@end
