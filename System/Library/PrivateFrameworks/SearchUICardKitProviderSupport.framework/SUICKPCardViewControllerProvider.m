@implementation SUICKPCardViewControllerProvider

- (SUICKPCardViewControllerProvider)init
{
  SUICKPCardViewControllerProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cardsByCardSectionIdentifiers;
  NSMutableDictionary *v5;
  NSMutableDictionary *cardViewControllersByCardIdentifiers;
  NSMutableDictionary *v7;
  NSMutableDictionary *feedbackDelegateDemultiplexersByCardIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUICKPCardViewControllerProvider;
  v2 = -[SUICKPCardViewControllerProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cardsByCardSectionIdentifiers = v2->_cardsByCardSectionIdentifiers;
    v2->_cardsByCardSectionIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cardViewControllersByCardIdentifiers = v2->_cardViewControllersByCardIdentifiers;
    v2->_cardViewControllersByCardIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    feedbackDelegateDemultiplexersByCardIdentifiers = v2->_feedbackDelegateDemultiplexersByCardIdentifiers;
    v2->_feedbackDelegateDemultiplexersByCardIdentifiers = v7;

  }
  return v2;
}

- (id)cardViewControllerForCard:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  dispatch_time_t v11;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  self->_preferredContentSize = (CGSize)*MEMORY[0x24BDBF148];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    if (v5
      && objc_msgSend(v5, "type") == 2
      && objc_msgSend(v5, "source") == 1
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v5, "cardSections"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
    {
      objc_initWeak(&location, self);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke;
      v13[3] = &unk_24E385D98;
      objc_copyWeak(&v18, &location);
      v16 = &v24;
      v14 = v5;
      v17 = &v20;
      v15 = v6;
      objc_msgSend(v14, "loadCardWithCompletion:", v13);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SUICKPCardViewControllerProvider _createCardViewControllerForCard:](self, "_createCardViewControllerForCard:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v25[5];
      v25[5] = v8;

      if (*((_BYTE *)v21 + 24))
      {
        dispatch_group_leave(v6);
        *((_BYTE *)v21 + 24) = 0;
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      {
        -[SUICKPCardViewControllerProvider cardViewControllerForCard:].cold.2();
      }
    }
    v11 = dispatch_time(0, 200000000);
    if (dispatch_group_wait(v6, v11) && os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPCardViewControllerProvider cardViewControllerForCard:].cold.1();
    v10 = (id)v25[5];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPCardViewControllerProvider cardViewControllerForCard:].cold.3();
    v10 = 0;
  }

  return v10;
}

void __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x24BE15490];
  v5 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v3;
    _os_log_impl(&dword_21ECF4000, v5, OS_LOG_TYPE_DEFAULT, "Asynchronous card loading completed for first level card\n    Card: %@", (uint8_t *)&v27, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(v3, "cardSections");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(WeakRetained, "_createCardViewControllerForCard:", v3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else
    {
      v13 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_2(a1, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_1(a1, v20, v21, v22, v23, v24, v25, v26);
  }

}

- (void)unregisterCardViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *cardsByCardSectionIdentifiers;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "card");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_cardViewControllersByCardIdentifiers, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v4)
    {
      objc_msgSend(v4, "card");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v8;
        v25 = 2112;
        v26 = v4;
        _os_log_impl(&dword_21ECF4000, v9, OS_LOG_TYPE_INFO, "Unregistering SearchUICardViewController\n    Card: %@\n    Card view controller: %@", buf, 0x16u);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v17 = v8;
      objc_msgSend(v8, "resolvedCardSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "cardSectionIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](cardsByCardSectionIdentifiers, "removeObjectForKey:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_feedbackDelegateDemultiplexersByCardIdentifiers, "removeObjectForKey:", v6);
      objc_msgSend(v4, "setDelegate:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_cardViewControllersByCardIdentifiers, "removeObjectForKey:", v6);

    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
    {
      -[SUICKPCardViewControllerProvider unregisterCardViewController:].cold.2();
    }

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
  {
    -[SUICKPCardViewControllerProvider unregisterCardViewController:].cold.1();
  }

}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return 2;
}

- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSMutableDictionary *cardsByCardSectionIdentifiers;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SUICKPFeedbackAdapter *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id obj;
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v42 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "feedbackListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
    {
      v10 = v9;
      objc_msgSend(v7, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "conformsToProtocol:", &unk_255491D30))
      {
        objc_msgSend(v10, "setSnippetUIDelegate:", v11);
        v40 = v11;
      }
      else
      {
        v40 = 0;
      }

    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }
  v37 = v7;
  v12 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECF4000, v12, OS_LOG_TYPE_INFO, "Configuring demuxes and weeding out empty card section views", buf, 2u);
  }
  objc_msgSend(v8, "card", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resolvedCardSections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v15)
  {
    v16 = v15;
    v41 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v42, "viewConfigurationForCardSection:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
          objc_msgSend(v18, "cardSectionIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](cardsByCardSectionIdentifiers, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "cardIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_feedbackDelegateDemultiplexersByCardIdentifiers, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc_init(SUICKPFeedbackAdapter);
          objc_msgSend(v19, "_cardKitCardSectionViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setDelegate:", self);
          -[SUICKPFeedbackAdapter setFeedbackDelegate:](v25, "setFeedbackDelegate:", v26);
          objc_msgSend(v24, "feedbackDelegatesByCardSectionIdentifiers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "cardSection");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cardSectionIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKey:", v25, v29);

          objc_msgSend(v19, "cardSectionView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "cardSectionViewIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v24, "feedbackDelegatesByCardSectionViewIds");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "cardSectionView");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "cardSectionViewIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKey:", v25, v34);

          }
          objc_msgSend(v24, "setSnippetUIDelegate:", v40);
          v35 = *MEMORY[0x24BE15490];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v24;
            v49 = 2112;
            v50 = v19;
            _os_log_impl(&dword_21ECF4000, v35, OS_LOG_TYPE_INFO, "Configured demux %@ for card section view configuration: %@", buf, 0x16u);
          }

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v16);
  }

}

- (id)customViewControllerForCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSectionViewSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewConfigurationForCardSection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (os_log_t *)MEMORY[0x24BE15490];
  v9 = (void *)*MEMORY[0x24BE15490];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = v9;
      objc_msgSend(v7, "_providerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v12;
      _os_log_impl(&dword_21ECF4000, v11, OS_LOG_TYPE_DEFAULT, "Found custom card section view configuration to provide to SearchUI from provider: %@", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(v7, "_cardKitCardSectionViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_providerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.cards.SearchUICardKitProvider"));

    v16 = *v8;
    v17 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        v22 = 138412802;
        v23 = v4;
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_21ECF4000, v16, OS_LOG_TYPE_DEFAULT, "NOT providing custom view controller for card section to SearchUI because it originated from the SearchUI provider\n    Card section: %@\n    Card section view controller: %@\n    Card view controller: %@", (uint8_t *)&v22, 0x20u);
      }
      v18 = 0;
    }
    else
    {
      if (v17)
      {
        v22 = 138412802;
        v23 = v4;
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_21ECF4000, v16, OS_LOG_TYPE_DEFAULT, "Providing custom view controller for card section to SearchUI\n    Card section: %@\n    Card section view controller: %@\n    Card view controller: %@", (uint8_t *)&v22, 0x20u);
      }
      v18 = v13;
    }

  }
  else
  {
    if (v10)
    {
      v19 = v9;
      objc_msgSend(v5, "cardSectionViewSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v4;
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_21ECF4000, v19, OS_LOG_TYPE_DEFAULT, "NOT providing custom view controller for card section to SearchUI because card section view provider manager didn't vend a configuration\n    Card section: %@\n    Card section view provider manager: %@\n    Card view controller: %@", (uint8_t *)&v22, 0x20u);

    }
    v18 = 0;
  }

  return v18;
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  double height;
  double width;
  id v8;
  char isKindOfClass;
  id v11;
  void *v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  if (self->_preferredContentSize.width != width || self->_preferredContentSize.height != height)
  {
    self->_preferredContentSize.width = width;
    self->_preferredContentSize.height = height;
    v13 = v8;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = v13;
      objc_msgSend(v11, "cardViewControllerDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardViewControllerBoundsDidChange:", v11);

      v8 = v13;
    }
  }

}

- (id)customInteractionsForCardSection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
}

- (id)customLayerForCardSection:(id)a3
{
  return 0;
}

- (id)extractLinkID:(id)a3
{
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "resultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)MEMORY[0x24BE15490];
  v5 = *MEMORY[0x24BE15490];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21ECF4000, v5, OS_LOG_TYPE_DEFAULT, "ResultIdentifier on card section set, using that for Link Identifier", (uint8_t *)&v10, 2u);
    }
    v6 = v3;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPCardViewControllerProvider extractLinkID:].cold.1(v5);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_DEFAULT, "Using linkIdentifier: %@", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (id)_cardViewControllerForCardSection:(id)a3
{
  NSMutableDictionary *cardViewControllersByCardIdentifiers;
  NSMutableDictionary *cardsByCardSectionIdentifiers;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
  cardViewControllersByCardIdentifiers = self->_cardViewControllersByCardIdentifiers;
  objc_msgSend(a3, "cardSectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cardsByCardSectionIdentifiers, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cardViewControllersByCardIdentifiers, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_askDelegateToPerformReferentialCommand:(id)a3 forCardSection:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  char v13;
  void *v14;

  v7 = a3;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();
  if ((v10 & 1) != 0
    && (objc_msgSend(v8, "cardViewControllerDelegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v4, "canPerformReferentialCommand:forCardViewController:", v7, v8)))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      goto LABEL_7;
  }

LABEL_7:
  v13 = 0;
  if (v7 && (v12 & 1) != 0)
  {
    objc_msgSend(v8, "cardViewControllerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "performReferentialCommand:forCardViewController:", v7, v8);

  }
  return v13;
}

- (id)_createCardViewControllerForCard:(id)a3
{
  id v4;
  SUICKPFeedbackDelegateDemultiplexer *v5;
  void *v6;
  SUICKPFeedbackAdapter *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *cardsByCardSectionIdentifiers;
  void *v15;
  NSMutableDictionary *feedbackDelegateDemultiplexersByCardIdentifiers;
  void *v17;
  NSMutableDictionary *cardViewControllersByCardIdentifiers;
  void *v19;
  SUICKPFeedbackDelegateDemultiplexer *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(SUICKPFeedbackDelegateDemultiplexer);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85238]), "initWithCard:feedbackListener:", v4, v5);
  v7 = objc_alloc_init(SUICKPFeedbackAdapter);
  -[SUICKPFeedbackAdapter setFeedbackDelegate:](v7, "setFeedbackDelegate:", v6);
  v21 = v5;
  -[SUICKPFeedbackDelegateDemultiplexer setDefaultDelegate:](v5, "setDefaultDelegate:", v7);
  objc_msgSend(v6, "setDefaultFeedbackAdapter:", v7);
  objc_msgSend(v6, "setScrollEnabled:", 0);
  objc_msgSend(v6, "setThreeDTouchEnabled:", 0);
  objc_msgSend(v6, "setDelegate:", self);
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v4;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Instantiating SearchUICardViewController\n    Card: %@\n    Card view controller: %@", buf, 0x16u);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "resolvedCardSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "cardSectionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](cardsByCardSectionIdentifiers, "setObject:forKey:", v4, v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  feedbackDelegateDemultiplexersByCardIdentifiers = self->_feedbackDelegateDemultiplexersByCardIdentifiers;
  objc_msgSend(v4, "cardIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](feedbackDelegateDemultiplexersByCardIdentifiers, "setObject:forKey:", v21, v17);

  cardViewControllersByCardIdentifiers = self->_cardViewControllersByCardIdentifiers;
  objc_msgSend(v4, "cardIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](cardViewControllersByCardIdentifiers, "setObject:forKey:", v6, v19);

  return v6;
}

- (BOOL)performCommand:(id)a3 forCardSectionViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v33;
  void *v34;
  id v35;
  SUICKPCardViewControllerProvider *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v6;
    v49 = 2112;
    v50 = v7;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Got command %@ from card section view controller: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255499458))
  {
    v9 = v6;
    v35 = v7;
    objc_msgSend(v7, "cardSection");
    v36 = self;
    v33 = objc_claimAutoreleasedReturnValue();
    -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "card");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissalCommands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_255499458))
          {
            objc_msgSend(v16, "referenceIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "referenceIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqualToString:", v18);

            if ((v19 & 1) != 0)
            {

              v39 = 0u;
              v40 = 0u;
              v37 = 0u;
              v38 = 0u;
              v23 = v36->_pendingDismissalCommands;
              v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v38;
                while (2)
                {
                  for (j = 0; j != v25; ++j)
                  {
                    if (*(_QWORD *)v38 != v26)
                      objc_enumerationMutation(v23);
                    v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                    objc_msgSend(v28, "referenceIdentifier");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "referenceIdentifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v29, "isEqualToString:", v30);

                    if (v31)
                    {
                      -[NSMutableArray removeObject:](v36->_pendingDismissalCommands, "removeObject:", v28);
                      goto LABEL_28;
                    }
                  }
                  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                  if (v25)
                    continue;
                  break;
                }
              }
LABEL_28:

              -[NSMutableArray addObject:](v36->_pendingDismissalCommands, "addObject:", v9);
              v21 = 1;
              v20 = (void *)v33;
              goto LABEL_29;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v13)
          continue;
        break;
      }
    }

    v20 = (void *)v33;
    v21 = -[SUICKPCardViewControllerProvider _askDelegateToPerformReferentialCommand:forCardSection:](v36, "_askDelegateToPerformReferentialCommand:forCardSection:", v9, v33);
LABEL_29:

    v7 = v35;
    goto LABEL_30;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255492258))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "cardSection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v22);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "cardViewControllerDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v6, "handleForCardViewController:cardViewControllerDelegate:", v9, v20);
LABEL_30:

      goto LABEL_31;
    }
  }
  v21 = 0;
LABEL_31:

  return v21;
}

- (void)presentViewController:(id)a3 forCardSectionViewController:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "cardSection");
  v6 = objc_claimAutoreleasedReturnValue();
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cardViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:forCardViewController:", v10, v7);

  }
}

- (void)cardSectionViewController:(id)a3 didSelectPreferredPunchoutIndex:(int64_t)a4
{
  self->_preferredPunchoutIndex = a4;
}

- (int64_t)preferredPunchoutIndexForCardSectionViewController:(id)a3
{
  return self->_preferredPunchoutIndex;
}

- (CGSize)boundingSizeForCardSectionViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardViewController:boundingSizeForCardSectionViewController:", v6, v4);
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = *MEMORY[0x24BDBF148];
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSectionView:willProcessEngagementFeedback:", v11, v6);

  }
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userDidEngageCardSection:withEngagementFeedback:", v11, v6);

  }
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSectionViewWillAppearForCardSection:withAppearanceFeedback:", v11, v6);

  }
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSectionViewDidAppearForCardSection:withAppearanceFeedback:", v11, v6);

  }
}

- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "cardViewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSectionViewDidDisappearForCardSection:withDisappearanceFeedback:", v11, v6);

  }
}

- (NSMutableDictionary)feedbackDelegateDemultiplexersByCardIdentifiers
{
  return self->_feedbackDelegateDemultiplexersByCardIdentifiers;
}

- (void)setFeedbackDelegateDemultiplexersByCardIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackDelegateDemultiplexersByCardIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackDelegateDemultiplexersByCardIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingDismissalCommands, 0);
  objc_storeStrong((id *)&self->_cardViewControllersByCardIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardsByCardSectionIdentifiers, 0);
}

- (void)cardViewControllerForCard:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21ECF4000, v0, v1, "Timed out loading card : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cardViewControllerForCard:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21ECF4000, v0, v1, "Attempted to double-leave dispatch group loading card: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cardViewControllerForCard:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21ECF4000, v0, v1, "SearchUI couldn't fetch cardViewController for card: %@ as the card is not a search foundation card.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21ECF4000, a2, a3, "Attempted to double-leave dispatch group loading card: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21ECF4000, a2, a3, "Error loading asynchrounous first level card: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterCardViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21ECF4000, v0, v1, "Failed to unregister view controller due to invalid identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterCardViewController:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21ECF4000, v0, v1, "Failed to unregister view controller: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extractLinkID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21ECF4000, log, OS_LOG_TYPE_ERROR, "ResultIdentifier on card section not set, generating UUID for Link Identifier", v1, 2u);
}

@end
