@implementation SUICKPCardSectionViewProvider

- (SUICKPCardSectionViewProvider)initWithCard:(id)a3
{
  id v5;
  SUICKPCardSectionViewProvider *v6;
  SUICKPCardSectionViewProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUICKPCardSectionViewProvider;
  v6 = -[SUICKPCardSectionViewProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_card, a3);

  return v7;
}

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.SearchUICardKitProvider");
}

- (NSArray)viewConfigurations
{
  CRCard *card;
  NSArray *viewConfigurations;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  SUICKPFeedbackDelegateDemultiplexer *v14;
  SUICKPFeedbackDelegateDemultiplexer *feedbackDelegateDemux;
  id WeakRetained;
  char v17;
  id v18;
  void *v19;
  SUICKPFeedbackAdapter *v20;
  void *v21;
  id v22;
  NSArray *v23;
  id v24;
  NSArray *v25;
  NSArray *v26;
  SUICKPCardSectionViewProvider *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  SUICKPCardSectionViewProvider *v32;
  NSArray *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  card = self->_card;
  if (card)
  {
    viewConfigurations = self->_viewConfigurations;
    if (!viewConfigurations)
    {
      v28 = self;
      -[CRCard resolvedCardSections](card, "resolvedCardSections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v35 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v11, "backingCardSection");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (objc_msgSend(v12, "visualCATOutput"),
                      v13 = (void *)objc_claimAutoreleasedReturnValue(),
                      v13,
                      v13))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      objc_msgSend(v29, "addObject:", v12);
                  }
                }
              }
            }
            else
            {
              v12 = 0;
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v8);
      }

      v14 = objc_alloc_init(SUICKPFeedbackDelegateDemultiplexer);
      feedbackDelegateDemux = v28->_feedbackDelegateDemux;
      v28->_feedbackDelegateDemux = v14;

      WeakRetained = objc_loadWeakRetained((id *)&v28->_delegate);
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v18 = objc_loadWeakRetained((id *)&v28->_delegate);
        objc_msgSend(v18, "defaultFeedbackDelegateForProvider:", v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = objc_alloc_init(SUICKPFeedbackAdapter);
          -[SUICKPFeedbackAdapter setFeedbackDelegate:](v20, "setFeedbackDelegate:", v19);
          -[SUICKPFeedbackDelegateDemultiplexer setDefaultDelegate:](v28->_feedbackDelegateDemux, "setDefaultDelegate:", v20);

        }
      }
      objc_msgSend(MEMORY[0x24BE85210], "viewsForCardSections:feedbackListener:", v29, v28->_feedbackDelegateDemux);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke;
      v30[3] = &unk_24E385E38;
      v31 = v21;
      v32 = v28;
      v23 = (NSArray *)v22;
      v33 = v23;
      v24 = v21;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v30);
      v25 = v28->_viewConfigurations;
      v28->_viewConfigurations = v23;
      v26 = v23;

      viewConfigurations = v28->_viewConfigurations;
    }
    card = viewConfigurations;
  }
  return (NSArray *)card;
}

void __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  SUICKPFeedbackAdapter *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x24BE15458]);
  v7 = objc_alloc_init(SUICKPFeedbackAdapter);
  objc_msgSend(v6, "setCardSection:", v5);
  objc_msgSend(v6, "setFeedbackDelegateProxy:", v7);
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v11 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v28 = 134217984;
      v29 = a3;
      _os_log_impl(&dword_21ECF4000, v11, OS_LOG_TYPE_INFO, "No cardSectionView was found for backingCardSection at index %lu", (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCardSectionView:", v8);
    objc_msgSend(v8, "cardSectionViewIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "feedbackDelegatesByCardSectionViewIds");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v7, v9);

    }
    else
    {
      v12 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_2((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
    }

  }
  objc_msgSend(v5, "cardSectionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "feedbackDelegatesByCardSectionIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v7, v19);

  }
  else
  {
    v21 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_1((uint64_t)v5, v21, v22, v23, v24, v25, v26, v27);
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return 0;
}

- (CRCard)card
{
  return self->_card;
}

- (CRKCardSectionViewProviderDelegate)delegate
{
  return (CRKCardSectionViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_feedbackDelegateDemux, 0);
}

void __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21ECF4000, a2, a3, "No card section identifier available for card section: %@. Unable to hook up to demux for user interaction. This is a bad state and needs a radar!", a5, a6, a7, a8, 2u);
}

void __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21ECF4000, a2, a3, "No card section view identifier available for card section view: %@. Unable to hook up to demux for user interaction. This is a bad state and needs a radar!", a5, a6, a7, a8, 2u);
}

@end
