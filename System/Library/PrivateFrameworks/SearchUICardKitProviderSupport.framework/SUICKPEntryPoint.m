@implementation SUICKPEntryPoint

- (SUICKPEntryPoint)init
{
  SUICKPEntryPoint *v2;
  SUICKPCardViewControllerProvider *v3;
  SUICKPCardViewControllerProvider *cardViewControllerProvider;
  SUICKPCATExecutor *v5;
  SUICKPCATExecutor *catExecutor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUICKPEntryPoint;
  v2 = -[SUICKPEntryPoint init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUICKPCardViewControllerProvider);
    cardViewControllerProvider = v2->_cardViewControllerProvider;
    v2->_cardViewControllerProvider = v3;

    v5 = objc_alloc_init(SUICKPCATExecutor);
    catExecutor = v2->_catExecutor;
    v2->_catExecutor = v5;

    +[CRKCardSectionViewController _registerWithCardKit](SUICKPActivityIndicatorCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPAudioPlaybackCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPInteractiveCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPMapCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPMediaInfoCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPMediaPunchoutCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPWatchListCardSectionViewController, "_registerWithCardKit");
  }
  return v2;
}

- (SUICKPEntryPoint)initWithCATExecutor:(id)a3
{
  id v5;
  SUICKPEntryPoint *v6;
  SUICKPCardViewControllerProvider *v7;
  SUICKPCardViewControllerProvider *cardViewControllerProvider;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUICKPEntryPoint;
  v6 = -[SUICKPEntryPoint init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(SUICKPCardViewControllerProvider);
    cardViewControllerProvider = v6->_cardViewControllerProvider;
    v6->_cardViewControllerProvider = v7;

    objc_storeStrong((id *)&v6->_catExecutor, a3);
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPActivityIndicatorCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPAudioPlaybackCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPInteractiveCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPMapCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPMediaInfoCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPMediaPunchoutCardSectionViewController, "_registerWithCardKit");
    +[CRKCardSectionViewController _registerWithCardKit](SUICKPWatchListCardSectionViewController, "_registerWithCardKit");
  }

  return v6;
}

- (id)cardViewControllerForCard:(id)a3
{
  return -[SUICKPCardViewControllerProvider cardViewControllerForCard:](self->_cardViewControllerProvider, "cardViewControllerForCard:", a3);
}

- (void)unregisterCardViewController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUICKPCardViewControllerProvider unregisterCardViewController:](self->_cardViewControllerProvider, "unregisterCardViewController:", v4);

}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return -[SUICKPCardViewControllerProvider displayPriorityForCard:](self->_cardViewControllerProvider, "displayPriorityForCard:", a3);
}

- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUICKPCardViewControllerProvider presentation:didApplyCardSectionViewSource:toCardViewController:](self->_cardViewControllerProvider, "presentation:didApplyCardSectionViewSource:toCardViewController:", v10, v8, v9);

}

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__SUICKPEntryPoint_requestCardSectionViewProviderForCard_delegate_reply___block_invoke;
  v10[3] = &unk_24E385F28;
  v11 = v8;
  v9 = v8;
  -[SUICKPEntryPoint requestIdentifiedCardSectionViewProviderForCard:delegate:reply:](self, "requestIdentifiedCardSectionViewProviderForCard:delegate:reply:", a3, a4, v10);

}

uint64_t __73__SUICKPEntryPoint_requestCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v8, "resolvedCardSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __83__SUICKPEntryPoint_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke;
    v12[3] = &unk_24E385F50;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    -[SUICKPEntryPoint mutateResponseSections:completion:](self, "mutateResponseSections:completion:", v11, v12);

  }
}

void __83__SUICKPEntryPoint_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke(_QWORD *a1)
{
  SUICKPCardSectionViewProvider *v2;

  v2 = -[SUICKPCardSectionViewProvider initWithCard:]([SUICKPCardSectionViewProvider alloc], "initWithCard:", a1[4]);
  -[SUICKPCardSectionViewProvider setDelegate:](v2, "setDelegate:", a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)mutateResponseSections:(id)a3 completion:(id)a4
{
  id v6;
  dispatch_group_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *queue;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  dispatch_group_t v22;
  SUICKPEntryPoint *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = a4;
  v7 = dispatch_group_create();
  queue = dispatch_queue_create("com.apple.siri.cardKit.visualCatExecution", MEMORY[0x24BDAC9C0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "backingCardSection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke;
          block[3] = &unk_24E385FA0;
          v22 = v7;
          v23 = self;
          v24 = v15;
          dispatch_group_async(v22, queue, block);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_21;
  v19[3] = &unk_24E385FC8;
  v20 = v17;
  v16 = v17;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], v19);

}

void __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(*(id *)(a1 + 48), "catModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2;
  v4[3] = &unk_24E385F78;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "responseProtoFromCATModel:completion:", v3, v4);

}

void __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "visualResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 || !v7)
  {
    v10 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2_cold_1(a1, v10, v6);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "visualResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVisualCATOutput:", v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.SearchUICardKitProvider");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catExecutor, 0);
  objc_storeStrong((id *)&self->_cardViewControllerProvider, 0);
}

void __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "catModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "catIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_21ECF4000, v5, OS_LOG_TYPE_ERROR, "Error loading VisualCAT with id: %@. Failed with error: %@", (uint8_t *)&v9, 0x16u);

}

@end
