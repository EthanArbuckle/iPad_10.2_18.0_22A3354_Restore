@implementation SBBannerSourceListenerTemplatePresentableViewController

- (SBBannerSourceListenerTemplatePresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBBannerSourceListenerTemplatePresentableViewController *v13;
  SBBannerSourceListenerTemplatePresentableViewController *v14;
  SBBannerCustomTransitioningDelegate *v15;
  SBBannerCustomTransitioningDelegate *customTransitioningDelegate;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v10, "providesTemplateContent") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerSourceListenerTemplatePresentableViewController.m"), 37, CFSTR("Presentable specification doesn't specify a presentable that provides template content: %@"), v10);

  }
  v19.receiver = self;
  v19.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  v13 = -[BNBannerSourceListenerPresentableViewController initWithSpecification:serviceDomain:readyCompletion:](&v19, sel_initWithSpecification_serviceDomain_readyCompletion_, v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_templateContentProvidingSpecification, a3);
    v15 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = v14->_customTransitioningDelegate;
    v14->_customTransitioningDelegate = v15;

    -[SBBannerSourceListenerTemplatePresentableViewController setTransitioningDelegate:](v14, "setTransitioningDelegate:", v14->_customTransitioningDelegate);
  }

  return v14;
}

- (SBBannerSourceListenerTemplatePresentableViewController)initWithPresentable:(id)a3
{
  SBBannerSourceListenerTemplatePresentableViewController *v3;
  SBBannerCustomTransitioningDelegate *v4;
  SBBannerCustomTransitioningDelegate *customTransitioningDelegate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  v3 = -[BNBannerSourceListenerPresentableViewController initWithPresentable:](&v7, sel_initWithPresentable_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = v3->_customTransitioningDelegate;
    v3->_customTransitioningDelegate = v4;

    -[SBBannerSourceListenerTemplatePresentableViewController setTransitioningDelegate:](v3, "setTransitioningDelegate:", v3->_customTransitioningDelegate);
  }
  return v3;
}

- (BOOL)isTemplateContent
{
  return 1;
}

- (BOOL)providesTemplateContent
{
  return 1;
}

- (id)leadingTemplateViewProvider
{
  void *v2;
  void *v3;

  -[SBBannerSourceListenerTemplatePresentableViewController _templateContentProvider](self, "_templateContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "leadingTemplateViewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)trailingTemplateViewProvider
{
  void *v2;
  void *v3;

  -[SBBannerSourceListenerTemplatePresentableViewController _templateContentProvider](self, "_templateContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "trailingTemplateViewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)primaryTemplateItemProvider
{
  void *v2;
  void *v3;

  -[SBBannerSourceListenerTemplatePresentableViewController _templateContentProvider](self, "_templateContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "primaryTemplateItemProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)secondaryTemplateItemProvider
{
  void *v2;
  void *v3;

  -[SBBannerSourceListenerTemplatePresentableViewController _templateContentProvider](self, "_templateContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "secondaryTemplateItemProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  -[BNBannerSourceListenerPresentableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBBannerSourceListenerTemplatePresentableViewController _pillView](self, "_pillView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSourceListenerPresentableViewController _setContentView:](self, "_setContentView:", v3);
  objc_msgSend(v3, "intrinsicContentSize");
  -[SBBannerSourceListenerTemplatePresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[SBBannerSourceListenerTemplatePresentableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  -[SBBannerSourceListenerTemplatePresentableViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[SBBannerSourceListenerTemplatePresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[SBBannerSourceListenerTemplatePresentableViewController bannerContentOutsets](self, "bannerContentOutsets");
  UIRectInset();
  -[PLPillView setFrame:](self->_pillView, "setFrame:");
}

- (UIEdgeInsets)bannerContentOutsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[SBBannerSourceListenerTemplatePresentableViewController _pillView](self, "_pillView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOutsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  void *v2;
  char v3;

  -[SBBannerSourceListenerTemplatePresentableViewController _templateContentProvider](self, "_templateContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldAcquireWindowLevelAssertion");
  else
    v3 = 0;

  return v3;
}

- (id)_templateContentProvider
{
  void *v3;
  char v4;
  BNTemplateContentProvidingSpecifying *templateContentProvidingSpecification;
  BNTemplateContentProvidingSpecifying *v6;

  -[BNBannerSourceListenerPresentableViewController presentable](self, "presentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v4 = objc_msgSend(v3, "providesTemplateContent"),
        templateContentProvidingSpecification = (BNTemplateContentProvidingSpecifying *)v3,
        (v4 & 1) == 0))
  {
    templateContentProvidingSpecification = self->_templateContentProvidingSpecification;
  }
  v6 = templateContentProvidingSpecification;

  return v6;
}

- (void)_handleButtonPrimaryAction:(id)a3 forEvent:(int64_t)a4
{
  -[BNBannerSourceListenerPresentableViewController handleTemplateContentEvent:](self, "handleTemplateContentEvent:", a4);
}

- (void)_handleTapOnPillView:(id)a3
{
  -[BNBannerSourceListenerPresentableViewController handleTemplateContentEvent:](self, "handleTemplateContentEvent:", 0);
}

- (id)_pillView
{
  PLPillView *pillView;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PLPillView *v9;
  PLPillView *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void (**v12)(_QWORD, _QWORD, _QWORD);
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PLPillView *v20;
  char v21;
  void *v22;
  PLPillView *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location[2];

  pillView = self->_pillView;
  if (!pillView)
  {
    -[SBBannerSourceListenerTemplatePresentableViewController _templateContentProvider](self, "_templateContentProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "leadingTemplateViewProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_initWeak(location, self);
    v6 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke;
    v36[3] = &unk_1E8EA9FA0;
    objc_copyWeak(&v37, location);
    SBTemplateItemViewFromProvider(v5, v36);
    v7 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "trailingTemplateViewProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v34[0] = v6;
    v34[1] = 3221225472;
    v34[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_3;
    v34[3] = &unk_1E8EA9FA0;
    objc_copyWeak(&v35, location);
    SBTemplateItemViewFromProvider(v8, v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    v28 = v5;
    v9 = (PLPillView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3E0]), "initWithLeadingAccessoryView:trailingAccessoryView:", v7, v30);
    v10 = self->_pillView;
    self->_pillView = v9;

    -[PLPillView setMaterialGroupNameBase:](self->_pillView, "setMaterialGroupNameBase:", CFSTR("SBBannerSourceListenerTemplatePresentableViewControllerMaterialGroup"));
    v33[0] = v6;
    v33[1] = 3221225472;
    v33[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_5;
    v33[3] = &unk_1E8EA9FC8;
    v33[4] = self;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v33);
    v26 = (void *)v7;
    ((void (**)(_QWORD, uint64_t, void *))v11)[2](v11, v7, v5);
    ((void (**)(_QWORD, void *, void *))v11)[2](v11, v30, v27);
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_6;
    v31[3] = &unk_1E8EAA040;
    objc_copyWeak(&v32, location);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v31);
    v13 = objc_opt_respondsToSelector();
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v4, "primaryTemplateItemProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v14, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)

    v15 = objc_opt_respondsToSelector();
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v4, "secondaryTemplateItemProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 & 1) != 0)

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v19 = v18;
    if (v29)
      objc_msgSend(v18, "addObject:", v29);
    if (v17)
      objc_msgSend(v19, "addObject:", v17);
    -[PLPillView setCenterContentItems:](self->_pillView, "setCenterContentItems:", v19);
    v20 = self->_pillView;
    v21 = objc_opt_respondsToSelector();
    if ((v21 & 1) != 0)
    {
      objc_msgSend(v4, "presentableAccessibilityIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    -[PLPillView setAccessibilityIdentifier:](v20, "setAccessibilityIdentifier:", v22);
    if ((v21 & 1) != 0)

    v23 = self->_pillView;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapOnPillView_);
    -[PLPillView addGestureRecognizer:](v23, "addGestureRecognizer:", v24);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak(location);

    pillView = self->_pillView;
  }
  return pillView;
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  v1 = (void *)MEMORY[0x1E0CEA2A8];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_2;
  v4[3] = &unk_1E8EA3C88;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_msgSend(v1, "actionWithHandler:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  return v2;
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleButtonPrimaryAction:forEvent:", v3, 1);

}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  v1 = (void *)MEMORY[0x1E0CEA2A8];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_4;
  v4[3] = &unk_1E8EA3C88;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_msgSend(v1, "actionWithHandler:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  return v2;
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleButtonPrimaryAction:forEvent:", v3, 2);

}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "visualStyleCategory") >= 1 && objc_msgSend(v5, "visualStyle") >= 1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "visualStylingProviderForCategory:", objc_msgSend(v5, "visualStyleCategory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "visualStyle");
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "_visualStylingForStyle:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v14;
      objc_msgSend(v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "background");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visualEffect");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setVisualEffect:", v13);

      objc_msgSend(v11, "setBackground:", v12);
      objc_msgSend(v10, "setConfiguration:", v11);

      v7 = v9;
    }
    else
    {
      objc_msgSend(v7, "automaticallyUpdateView:withStyle:", v14, v8);
    }

  }
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_6(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  char v23;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "templateItemText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || ((v8 = objc_alloc(MEMORY[0x1E0D7D3D0]), a3) ? (v9 = 1) : (v9 = 2),
          (v10 = (void *)objc_msgSend(v8, "initWithText:style:", v7, v9)) == 0))
    {
      objc_msgSend(v6, "templateItemAttributedText");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || ((v12 = (void *)v11, v13 = objc_alloc(MEMORY[0x1E0D7D3D0]), a3) ? (v14 = 1) : (v14 = 2),
            v10 = (void *)objc_msgSend(v13, "initWithAttributedText:style:", v12, v14),
            v12,
            !v10))
      {
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_7;
        v21 = &unk_1E8EAA018;
        objc_copyWeak(&v22, (id *)(a1 + 32));
        v23 = a3;
        SBTemplateItemViewFromProvider(v6, &v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_alloc(MEMORY[0x1E0D7D3D0]);
          v10 = (void *)objc_msgSend(v16, "initWithAccessoryView:", v15, v18, v19, v20, v21);
        }
        else
        {
          v10 = 0;
        }

        objc_destroyWeak(&v22);
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = (void *)MEMORY[0x1E0CEA2A8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_8;
  v5[3] = &unk_1E8EA9FF0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v7 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v2, "actionWithHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  return v3;
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_8(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v7 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
    v6 = 3;
  else
    v6 = 4;
  objc_msgSend(WeakRetained, "_handleButtonPrimaryAction:forEvent:", v4, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_templateContentProvidingSpecification, 0);
}

@end
