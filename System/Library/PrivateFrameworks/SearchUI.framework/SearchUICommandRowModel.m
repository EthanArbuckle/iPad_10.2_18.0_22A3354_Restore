@implementation SearchUICommandRowModel

- (SearchUICommandRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v11;
  SearchUICommandRowModel *v12;
  void *v13;
  uint64_t v14;
  TLKRichText *title;
  void *v16;
  uint64_t v17;
  TLKRichText *toggledTitle;
  void *v19;
  uint64_t v20;
  TLKRichText *subtitle;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *sportsCanonicalID;
  objc_super v27;

  v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SearchUICommandRowModel;
  v12 = -[SearchUICardSectionRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:](&v27, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, a3, v11, 1, a6, a7);
  if (v12)
  {
    objc_msgSend(v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    title = v12->_title;
    v12->_title = (TLKRichText *)v14;

    objc_msgSend(v11, "toggledTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    toggledTitle = v12->_toggledTitle;
    v12->_toggledTitle = (TLKRichText *)v17;

    objc_msgSend(v11, "subtitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    subtitle = v12->_subtitle;
    v12->_subtitle = (TLKRichText *)v20;

    objc_msgSend(v11, "command");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "domainSubscriptionRequestItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "canonicalIdentifier");
        v24 = objc_claimAutoreleasedReturnValue();
        sportsCanonicalID = v12->_sportsCanonicalID;
        v12->_sportsCanonicalID = (NSString *)v24;

      }
    }

  }
  return v12;
}

- (void)checkIfCommandIsValidWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[SearchUICommandRowModel subscriptionType](self, "subscriptionType") == 1)
  {
    if (-[SearchUICommandRowModel commandSupported](self, "commandSupported"))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __70__SearchUICommandRowModel_checkIfCommandIsValidWithCompletionHandler___block_invoke;
      v5[3] = &unk_1EA1F6EB8;
      v6 = v4;
      +[SearchUISportsKitWrapper liveActivitiesEnabledWithCompletionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "liveActivitiesEnabledWithCompletionBlock:", v5);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }
  else
  {
    (*((void (**)(id, BOOL))v4 + 2))(v4, -[SearchUICommandRowModel commandSupported](self, "commandSupported"));
  }

}

uint64_t __70__SearchUICommandRowModel_checkIfCommandIsValidWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)subscriptionType
{
  return -[NSString length](self->_sportsCanonicalID, "length") != 0;
}

- (void)getSubscriptionStatus:(id)a3
{
  NSString *sportsCanonicalID;
  void (**v5)(id, _QWORD);
  NSObject *v6;

  sportsCanonicalID = self->_sportsCanonicalID;
  if (sportsCanonicalID)
  {
    +[SearchUISportsKitWrapper checkForSessionWithCanonicalId:completionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "checkForSessionWithCanonicalId:completionBlock:", sportsCanonicalID, a3);
  }
  else
  {
    v5 = (void (**)(id, _QWORD))a3;
    SearchUIGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SearchUICommandRowModel getSubscriptionStatus:].cold.1(v6);

    v5[2](v5, 0);
  }

}

- (BOOL)commandSupported
{
  return self->_sportsCanonicalID != 0;
}

- (TLKRichText)title
{
  int *v2;

  if (self->_toggled)
    v2 = &OBJC_IVAR___SearchUICommandRowModel__toggledTitle;
  else
    v2 = &OBJC_IVAR___SearchUICommandRowModel__title;
  return (TLKRichText *)*(id *)((char *)&self->super.super.super.isa + *v2);
}

- (TLKRichText)subtitle
{
  return self->_subtitle;
}

- (BOOL)toggled
{
  return self->_toggled;
}

- (void)safelyUpdateView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SearchUICommandRowModel *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DBDA48];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SearchUICommandRowModel_safelyUpdateView___block_invoke;
  v7[3] = &unk_1EA1F6210;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "dispatchMainIfNecessary:", v7);

}

void __44__SearchUICommandRowModel_safelyUpdateView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "updateWithRowModel:", *(_QWORD *)(a1 + 40));
}

- (void)updateStateWithCommandCardSectionView:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[SearchUICommandRowModel commandSupported](self, "commandSupported"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__SearchUICommandRowModel_updateStateWithCommandCardSectionView___block_invoke;
    v5[3] = &unk_1EA1F63E0;
    v5[4] = self;
    v6 = v4;
    -[SearchUICommandRowModel getSubscriptionStatus:](self, "getSubscriptionStatus:", v5);

  }
}

uint64_t __65__SearchUICommandRowModel_updateStateWithCommandCardSectionView___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "safelyUpdateView:", *(_QWORD *)(a1 + 40));
}

- (void)toggleStateWithDetailedSectionView:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  _QWORD v7[4];
  NSString *v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (-[SearchUICommandRowModel commandSupported](self, "commandSupported"))
  {
    v5 = self->_sportsCanonicalID;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke;
    v7[3] = &unk_1EA1F7978;
    v6 = v5;
    v8 = v6;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    -[SearchUICommandRowModel getSubscriptionStatus:](self, "getSubscriptionStatus:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke(id *a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD aBlock[4];
  id v12;
  id v13;
  char v14;

  if (a1[4])
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2;
    aBlock[3] = &unk_1EA1F7950;
    v14 = a2;
    objc_copyWeak(&v13, a1 + 6);
    v12 = a1[5];
    v5 = _Block_copy(aBlock);
    v6 = (void *)MEMORY[0x1E0DBDA48];
    if (a2)
    {
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_16;
      v10[3] = &unk_1EA1F6908;
      v7 = v10;
      v10[4] = a1[4];
      v10[5] = v5;
      objc_msgSend(v6, "dispatchAsyncIfNecessary:", v10);
    }
    else
    {
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_17;
      v9[3] = &unk_1EA1F6908;
      v7 = v9;
      v9[4] = a1[4];
      v9[5] = v5;
      objc_msgSend(v6, "dispatchAsyncIfNecessary:", v9);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    SearchUIGeneralLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_cold_1(a2, v8);

  }
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateStateWithCommandCardSectionView:", *(_QWORD *)(a1 + 32));

}

uint64_t __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_16(uint64_t a1)
{
  return +[SearchUISportsKitWrapper destroySessionWithCanonicalId:completionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "destroySessionWithCanonicalId:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_17(uint64_t a1)
{
  return +[SearchUISportsKitWrapper createSessionWithCanonicalId:completionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "createSessionWithCanonicalId:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sportsCanonicalID, 0);
}

- (void)getSubscriptionStatus:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUICommandRowModel: Unknown type, can't get status", v1, 2u);
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_cold_1(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("subscribe");
  if ((a1 & 1) != 0)
    v2 = CFSTR("unsubscribe");
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "SearchUICommandRowModel: Unknown %@ command type", (uint8_t *)&v3, 0xCu);
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("unsubscribe");
  if (!*(_BYTE *)(a1 + 48))
    v3 = CFSTR("subscribe");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUICommandRowModel: SportsKit %@ command error : %@", (uint8_t *)&v4, 0x16u);
}

@end
