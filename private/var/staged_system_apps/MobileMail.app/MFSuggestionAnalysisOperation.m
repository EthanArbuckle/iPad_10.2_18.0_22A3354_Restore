@implementation MFSuggestionAnalysisOperation

- (MFSuggestionAnalysisOperation)initWithDelegate:(id)a3 presenter:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MFSuggestionAnalysisOperation *v11;
  MFSuggestionAnalysisOperation *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFSuggestionAnalysisOperation;
  v11 = -[MFSuggestionAnalysisOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_suggestionPresenter, v9);
    objc_storeWeak((id *)&v12->_scheduler, v10);
  }

  return v12;
}

- (void)cancel
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = -[MFSuggestionAnalysisOperation isCancelled](self, "isCancelled");
  -[MFSuggestionAnalysisOperation setCancelled:](self, "setCancelled:", 1);
  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionAnalysisOperation suggestionPresenter](self, "suggestionPresenter"));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestions", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "removeSuggestion:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)handleContentRepresentation:(id)a3 allowUnsubscribe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned __int8 v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v4 = a4;
  v6 = a3;
  v7 = -[MFSuggestionAnalysisOperation isCancelled](self, "isCancelled");
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionAnalysisOperation suggestionPresenter](self, "suggestionPresenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchableItem"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "suggestions", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v9, "removeSuggestion:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    if (v10
      && +[MSSiriIntelligenceSettings canShowSiriSuggestions](MSSiriIntelligenceSettings, "canShowSiriSuggestions"))
    {
      v15 = objc_msgSend(v10, "copy");
      v22 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      objc_msgSend(v9, "addSuggestionsFromSearchableItems:options:filter:", v16, 0, 0);

    }
    if (v4)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionAnalysisOperation _unsubscribeSuggestionForContentRepresentation:](self, "_unsubscribeSuggestionForContentRepresentation:", v6));
      if (v17)
        objc_msgSend(v9, "addSuggestion:", v17);
    }
    else
    {
      v17 = 0;
    }

  }
}

- (id)_concatenatedStringFromContent:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v17 = a3;
  v18 = objc_alloc_init((Class)MFStringAccumulator);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = v17;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16, v17);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(MFWebMessageDocument);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v9 = v7;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "htmlData"));
          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredCharacterSet"));
            v12 = MFEncodingForCharset();
            v13 = (void *)MFCreateStringWithData(v10, v12, 0);
            if (v13)
              v14 = 1;
            else
              v14 = (_DWORD)v12 == -1;
            if (!v14)
              v13 = (void *)MFCreateStringWithData(v10, 0xFFFFFFFFLL, 0);
            if (v13)
              objc_msgSend(v18, "appendString:", v13);

          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "string"));
  return v15;
}

- (id)_unsubscribeSuggestionForContentRepresentation:(id)a3
{
  id v4;
  void *v5;
  MFListUnsubscribeSuggestion_iOS *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unsubscribeCommand"));
  if (v5)
  {
    v6 = objc_alloc_init(MFListUnsubscribeSuggestion_iOS);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionAnalysisOperation delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFListUnsubscribeSuggestion_iOS suggestion](v6, "suggestion"));
    objc_msgSend(v8, "setSuggestionDelegate:", v7);

    -[MFListUnsubscribeSuggestion_iOS setListUnsubscribeCommand:](v6, "setListUnsubscribeCommand:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionAnalysisOperation suggestionPresenter](self, "suggestionPresenter"));
    -[MFListUnsubscribeSuggestion_iOS setSuggestionPresenter:](v6, "setSuggestionPresenter:", v9);

    -[MFListUnsubscribeSuggestion_iOS setContentRepresentation:](v6, "setContentRepresentation:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFListUnsubscribeSuggestion_iOS suggestion](v6, "suggestion"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (SGSuggestionDelegate)delegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EFScheduler)scheduler
{
  return (EFScheduler *)objc_loadWeakRetained((id *)&self->_scheduler);
}

- (void)setScheduler:(id)a3
{
  objc_storeWeak((id *)&self->_scheduler, a3);
}

- (SGFoundInSuggestionPresenter)suggestionPresenter
{
  return (SGFoundInSuggestionPresenter *)objc_loadWeakRetained((id *)&self->_suggestionPresenter);
}

- (void)setSuggestionPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionPresenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionPresenter);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
