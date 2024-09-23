@implementation PXUIPeopleBootstrapFlowController

- (void)computeViewControllersForBootstrapFlow
{
  _BOOL4 v3;
  _BOOL4 v4;
  id v5;
  PXUIPeopleBootstrapNamingViewController *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXPeopleBootstrapFlowController context](self, "context");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXPeopleBootstrapFlowController shouldPresentNaming](self, "shouldPresentNaming");
  v4 = -[PXPeopleBootstrapFlowController shouldPresentPostNaming](self, "shouldPresentPostNaming");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    v6 = -[PXUIPeopleBootstrapNamingViewController initWithContext:]([PXUIPeopleBootstrapNamingViewController alloc], "initWithContext:", v9);
    objc_msgSend(v5, "addObject:", v6);

  }
  if (v4)
  {
    -[PXUIPeopleBootstrapFlowController _postNamingViewControllers](self, "_postNamingViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  v8 = (void *)objc_msgSend(v5, "copy");
  -[PXPeopleBootstrapFlowController setViewControllers:](self, "setViewControllers:", v8);

}

- (void)recomputeViewControllersForChangeInKeyPath:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[PXPeopleBootstrapFlowController viewControllerIndex](self, "viewControllerIndex");
  v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("nameSelection"));

  if (v6 && !v5)
  {
    -[PXPeopleBootstrapFlowController viewControllers](self, "viewControllers");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subarrayWithRange:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
    -[PXUIPeopleBootstrapFlowController _postNamingViewControllers](self, "_postNamingViewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v9);
    v10 = (void *)objc_msgSend(v8, "copy");
    -[PXPeopleBootstrapFlowController setViewControllers:](self, "setViewControllers:", v10);

  }
}

- (void)done:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  id v15;
  PXUIPeopleBootstrapFlowController *v16;

  v4 = a3;
  -[PXUIPeopleBootstrapFlowController sourcePerson](self, "sourcePerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapFlowController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __42__PXUIPeopleBootstrapFlowController_done___block_invoke;
  v14 = &unk_1E5147B40;
  v7 = v4;
  v15 = v7;
  v16 = self;
  +[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:](PXPeopleBootstrap, "performBootstrapWithSourcePerson:context:synchronous:completion:", v5, v6, 0, &v11);
  if (-[PXPeopleBootstrapFlowController shouldPresentNaming](self, "shouldPresentNaming", v11, v12, v13, v14))
  {
    objc_msgSend(v6, "nameSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      objc_msgSend(v5, "px_localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.naming.skipped"), MEMORY[0x1E0C9AA70]);
    }
  }

}

- (PHPerson)sourcePerson
{
  void *v2;
  void *v3;
  id v4;

  -[PXPeopleBootstrapFlowController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourcePerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (PHPerson *)v4;
}

- (PXPeopleBootstrapConfirmationViewController)confirmationViewController
{
  PXPeopleBootstrapConfirmationViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  PXPeopleSuggestionDataSource *v7;
  PXPeopleSuggestionDataSource *v8;

  v3 = self->_confirmationViewController;
  if (!v3)
  {
    -[PXPeopleBootstrapFlowController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prefetchedDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
    v8 = v7;

    -[PXPeopleSuggestionDataSource setInitialPageLimit:](v8, "setInitialPageLimit:", 9);
    -[PXPeopleSuggestionDataSource setSuggestionFetchType:](v8, "setSuggestionFetchType:", 0);
    v3 = -[PXPeopleBootstrapConfirmationViewController initWithContext:dataSource:]([PXPeopleBootstrapConfirmationViewController alloc], "initWithContext:dataSource:", v4, v8);
    -[PXUIPeopleBootstrapFlowController setConfirmationViewController:](self, "setConfirmationViewController:", v3);

  }
  return v3;
}

- (PXPeopleBootstrapSummaryViewController)summaryViewController
{
  PXPeopleBootstrapSummaryViewController *v3;
  void *v4;

  v3 = self->_summaryViewController;
  if (!v3)
  {
    -[PXPeopleBootstrapFlowController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PXPeopleBootstrapSummaryViewController initWithContext:]([PXPeopleBootstrapSummaryViewController alloc], "initWithContext:", v4);
    -[PXUIPeopleBootstrapFlowController setSummaryViewController:](self, "setSummaryViewController:", v3);

  }
  return v3;
}

- (id)_postNamingViewControllers
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void **v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PXUIPeopleBootstrapFlowController sourcePerson](self, "sourcePerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPeopleBootstrapFlowController shouldPresentConfirmationForPerson:](self, "shouldPresentConfirmationForPerson:", v3);

  if (v4)
  {
    -[PXUIPeopleBootstrapFlowController confirmationViewController](self, "confirmationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v6 = (void **)v10;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (-[PXPeopleBootstrapFlowController shouldPresentNaming](self, "shouldPresentNaming"))
  {
    -[PXUIPeopleBootstrapFlowController summaryViewController](self, "summaryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v6 = &v9;
    goto LABEL_5;
  }
  return 0;
}

- (void)setConfirmationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationViewController, a3);
}

- (void)setSummaryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_summaryViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryViewController, 0);
  objc_storeStrong((id *)&self->_confirmationViewController, 0);
}

void __42__PXUIPeopleBootstrapFlowController_done___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = *(_QWORD *)(a1 + 32);
  v8.receiver = *(id *)(a1 + 40);
  v8.super_class = (Class)PXUIPeopleBootstrapFlowController;
  objc_msgSendSuper2(&v8, sel_done_, v4);
  if (a2)
  {
    v5 = *(id *)(a1 + 32);
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v6, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeAllActions");
  }
}

@end
