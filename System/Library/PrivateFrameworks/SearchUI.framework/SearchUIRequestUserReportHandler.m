@implementation SearchUIRequestUserReportHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userReportRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v4, "supportsCustomUserReportRequestAfforance") & 1) == 0)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setUserReportRequest:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "userReportRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIRequestUserReportUtility createUserReportViewControllerWith:rowModel:environment:](SearchUIRequestUserReportUtility, "createUserReportViewControllerWith:rowModel:environment:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)prefersContextMenu
{
  return 1;
}

- (id)contextMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SearchUICommandHandler rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifyingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userReportRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  -[SearchUICommandHandler environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextMenuForCardSection:result:feedbackRequest:environment:", v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)contextMenuForCardSection:(id)a3 result:(id)a4 feedbackRequest:(id)a5 environment:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id val;
  id v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id location;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v28 = a4;
  v9 = a5;
  v26 = a6;
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v27 = v9;
  objc_msgSend(v9, "userReportOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  objc_msgSend(v26, "feedbackDelegate");
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v9, "userReportOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __97__SearchUIRequestUserReportHandler_contextMenuForCardSection_result_feedbackRequest_environment___block_invoke;
        v30[3] = &unk_1EA1F8BF8;
        v30[4] = v17;
        objc_copyWeak(&v33, &location);
        v31 = v28;
        v32 = v29;
        objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v19, 0, 0, v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v20);
        objc_destroyWeak(&v33);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v12, "count"))
  {
    v21 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(v27, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuWithTitle:children:", v22, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  objc_destroyWeak(&location);

  return v23;
}

void __97__SearchUIRequestUserReportHandler_contextMenuForCardSection_result_feedbackRequest_environment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "preferredOpenableURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    +[SearchUIUtilities openPunchout:](SearchUIUtilities, "openPunchout:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C810]), "initWithSelection:result:cardSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "didReportUserResponseFeedback:", v3);

  }
}

- (unint64_t)destination
{
  return 3;
}

- (id)defaultSymbolName
{
  return CFSTR("exclamationmark.bubble");
}

@end
