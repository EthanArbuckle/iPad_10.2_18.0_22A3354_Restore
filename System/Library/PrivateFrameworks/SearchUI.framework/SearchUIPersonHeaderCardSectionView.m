@implementation SearchUIPersonHeaderCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  SearchUIPersonHeaderViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SearchUIPersonHeaderCardSectionView setBoxView:](self, "setBoxView:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDelegate:", self);
  v5 = -[SearchUIPersonHeaderViewController initWithDowntimeButton:]([SearchUIPersonHeaderViewController alloc], "initWithDowntimeButton:", 1);
  -[SearchUIPersonHeaderCardSectionView setViewControllerWithDowntimeButton:](self, "setViewControllerWithDowntimeButton:", v5);

  -[SearchUIPersonHeaderCardSectionView setViewControllerWithPayButton:](self, "setViewControllerWithPayButton:", v4);
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIPersonHeaderCardSectionView boxView](self, "boxView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArrangedSubviews:", v7);

  -[SearchUIPersonHeaderCardSectionView setViewController:](self, "setViewController:", v4);
  -[SearchUIPersonHeaderCardSectionView boxView](self, "boxView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateWithContact:(id)a3 person:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SearchUIPersonHeaderCardSectionView *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke;
  v10[3] = &unk_1EA1F6518;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v10);

}

void __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke(uint64_t a1)
{
  BOOL v2;
  void *v3;
  BOOL v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v2 = +[SearchUIDowntimeManager screenTimeIsEnabledForContact:](SearchUIDowntimeManager, "screenTimeIsEnabledForContact:", *(_QWORD *)(a1 + 32));
  +[SearchUIDowntimeManager familyMemberForContact:isMe:](SearchUIDowntimeManager, "familyMemberForContact:isMe:", *(_QWORD *)(a1 + 32), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[SearchUIDowntimeManager isChildOrTeenFamilyMember:](SearchUIDowntimeManager, "isChildOrTeenFamilyMember:", v3);

  +[SearchUIDowntimeManager familyMemberForContact:isMe:](SearchUIDowntimeManager, "familyMemberForContact:isMe:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGuardian");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke_2;
  v9[3] = &unk_1EA1F66D0;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 32);
  v13 = v2 & v6 & v4;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v9);

}

void __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    objc_msgSend(v4, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayName");
  }
  else
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  objc_msgSend(*(id *)(a1 + 40), "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  v13 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v13, "viewControllerWithDowntimeButton");
  else
    objc_msgSend(v13, "viewControllerWithPayButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v14)
    v16 = v12;
  else
    v16 = 0;
  if (v8 && (v16 & 1) == 0)
  {
    if (v15 != v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "setViewController:", v14);
      objc_msgSend(v14, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "boxView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setArrangedSubviews:", v18);

    }
    objc_msgSend(*(id *)(a1 + 40), "viewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWithContact:isActualContact:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32) != 0);

  }
}

- (void)updateWithPerson:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SearchUIPersonHeaderCardSectionView *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke;
  v6[3] = &unk_1EA1F6210;
  v7 = v4;
  v8 = self;
  v5 = v4;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v6);

}

void __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke(int8x16_t *a1)
{
  void *v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;

  +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke_2;
  v4[3] = &unk_1EA1F66F8;
  v3 = a1[2];
  v5 = vextq_s8(v3, v3, 8uLL);
  objc_msgSend(v2, "fetchContactForPerson:completionHandler:", (id)v3.i64[0], v4);

}

uint64_t __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithContact:person:", a2, *(_QWORD *)(a1 + 40));
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SearchUIPersonHeaderCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v14, sel_updateWithRowModel_, a3);
  -[SearchUIPersonHeaderCardSectionView contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    -[SearchUIPersonHeaderCardSectionView viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithContact:isActualContact:", 0, 0);

    if (v7)
    {
      +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke;
      v12[3] = &unk_1EA1F66F8;
      v12[4] = self;
      v13 = v6;
      objc_msgSend(v11, "fetchContactForIdentifier:completionHandler:", v7, v12);

    }
    else
    {
      -[SearchUIPersonHeaderCardSectionView updateWithPerson:](self, "updateWithPerson:", v6);
    }
  }

}

void __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke_2;
    v9 = &unk_1EA1F6210;
    v10 = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v11 = v5;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", &v6);
    objc_msgSend(*(id *)(a1 + 32), "updateWithContact:person:", v5, 0, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithPerson:", *(_QWORD *)(a1 + 40));
  }

}

void __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  objc_msgSend(*(id *)(a1 + 32), "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v6)
  {
    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateWithContact:isActualContact:", *(_QWORD *)(a1 + 40), 1);

    }
  }
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v3 = v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (id)contact
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SearchUIPersonHeaderCardSectionView viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sendCommandEngagementFeedbackWithType:(id)a3 didSelectFromOptionsMenu:(BOOL)a4 didDisplayHandleOptions:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v5 = a5;
  v6 = a4;
  v17 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setDidSelectFromOptionsMenu:", v6);
  objc_msgSend(v8, "setDidDisplayHandleOptions:", v5);
  if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96618]) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96658]) & 1) != 0)
  {
    v9 = 3;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C965F8]) & 1) != 0)
  {
    v9 = 4;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96638]) & 1) != 0)
  {
    v9 = 5;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96648]) & 1) != 0)
  {
    v9 = 6;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96630]) & 1) != 0)
  {
    v9 = 7;
  }
  else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96608]) & 1) != 0)
  {
    v9 = 8;
  }
  else if (objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0C96610]))
  {
    v9 = 9;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v8, "setContactActionType:", v9);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommand:", v8);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5)
    v16 = 3;
  else
    v16 = 2;
  objc_msgSend(v14, "wasPerformedWithTriggerEvent:punchout:destination:", 2, 0, v16);

}

- (void)groupIdentityHeaderViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4
{
  -[SearchUIPersonHeaderCardSectionView sendCommandEngagementFeedbackWithType:didSelectFromOptionsMenu:didDisplayHandleOptions:](self, "sendCommandEngagementFeedbackWithType:didSelectFromOptionsMenu:didDisplayHandleOptions:", a4, 0, 1);
}

- (void)groupIdentityHeaderViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5
{
  -[SearchUIPersonHeaderCardSectionView sendCommandEngagementFeedbackWithType:didSelectFromOptionsMenu:didDisplayHandleOptions:](self, "sendCommandEngagementFeedbackWithType:didSelectFromOptionsMenu:didDisplayHandleOptions:", a4, a5, 0);
}

- (SearchUIPersonHeaderViewController)viewControllerWithDowntimeButton
{
  return (SearchUIPersonHeaderViewController *)objc_getProperty(self, a2, 792, 1);
}

- (void)setViewControllerWithDowntimeButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (SearchUIPersonHeaderViewController)viewControllerWithPayButton
{
  return (SearchUIPersonHeaderViewController *)objc_getProperty(self, a2, 800, 1);
}

- (void)setViewControllerWithPayButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (SearchUIPersonHeaderViewController)viewController
{
  return (SearchUIPersonHeaderViewController *)objc_getProperty(self, a2, 808, 1);
}

- (void)setViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (SearchUIPersonHeaderBoxView)boxView
{
  return (SearchUIPersonHeaderBoxView *)objc_getProperty(self, a2, 816, 1);
}

- (void)setBoxView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_viewControllerWithPayButton, 0);
  objc_storeStrong((id *)&self->_viewControllerWithDowntimeButton, 0);
}

@end
