@implementation SBHStackConfigurationBackgroundViewController

- (void)loadView
{
  SBHTouchPassThroughView *v3;
  void *v4;
  SBHTouchPassThroughView *v5;

  v3 = [SBHTouchPassThroughView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[SBHTouchPassThroughView initWithFrame:](v3, "initWithFrame:");

  -[SBHTouchPassThroughView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[SBHStackConfigurationBackgroundViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SBHStackConfigurationBackgroundViewController;
  -[SBHStackConfigurationBackgroundViewController viewDidLoad](&v17, sel_viewDidLoad);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v3 = (void *)getCCUICustomContentModuleBackgroundViewControllerClass_softClass;
  v22 = getCCUICustomContentModuleBackgroundViewControllerClass_softClass;
  if (!getCCUICustomContentModuleBackgroundViewControllerClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke;
    v18[3] = &unk_1E8D85AF8;
    v18[4] = &v19;
    __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke((uint64_t)v18);
    v3 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v19, 8);
  v5 = objc_alloc_init(v4);
  -[SBHStackConfigurationBackgroundViewController setBackgroundViewController:](self, "setBackgroundViewController:", v5);
  -[SBHStackConfigurationBackgroundViewController bs_addChildViewController:](self, "bs_addChildViewController:", v5);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  objc_msgSend(v5, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue");
        objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", 4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setVisualStylingProvider:forCategory:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    }
    while (v8);
  }

}

- (void)setApertureSize:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  -[SBHStackConfigurationBackgroundViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[SBHStackConfigurationBackgroundViewController backgroundViewController](self, "backgroundViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpandedContentModuleWidth:", width);
  objc_msgSend(v6, "setExpandedContentModuleHeight:", height);

}

- (void)setFooterButtons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SBHStackConfigurationBackgroundViewController backgroundViewController](self, "backgroundViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
  {
    objc_msgSend(v5, "bs_reverse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFooterButtons:", v6);

  }
  else
  {
    objc_msgSend(v7, "setFooterButtons:", v5);
  }

}

id __66__SBHStackConfigurationBackgroundViewController_setFooterButtons___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  Class v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = NSClassFromString(CFSTR("CCUILabeledRoundButtonViewController"));
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (CGSize)apertureSize
{
  double width;
  double height;
  CGSize result;

  width = self->_apertureSize.width;
  height = self->_apertureSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CCUICustomContentModuleBackgroundViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
}

@end
