@implementation SearchUIStoreButtonItemViewController

- (SearchUIStoreButtonItemViewController)init
{
  SearchUIStoreButtonItemViewController *v2;
  void *v3;
  void *v4;
  SearchUILockupViewContainer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIStoreButtonItemViewController;
  v2 = -[SearchUIButtonItemViewController init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "lockupViewGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGroup:", v4);

    objc_msgSend(v3, "setSize:", *MEMORY[0x1E0CF9B70]);
    objc_msgSend(v3, "setDelegate:", v2);
    -[SearchUIStoreButtonItemViewController setLockupView:](v2, "setLockupView:", v3);
    v5 = -[SearchUILockupViewContainer initWithLockupView:]([SearchUILockupViewContainer alloc], "initWithLockupView:", v3);
    -[SearchUIButtonItemViewController setView:](v2, "setView:", v5);

  }
  return v2;
}

- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  SearchUIStoreButtonItemViewController *v32;
  _QWORD v33[5];
  id v34;

  v5 = a3;
  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[SearchUIButtonItemViewController setButtonItem:](self, "setButtonItem:", v5);
    -[SearchUIStoreButtonItemViewController currentStoreButtonIdentifier](self, "currentStoreButtonIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SearchUIStoreButtonItemViewController currentStoreButtonIdentifierType](self, "currentStoreButtonIdentifierType");
    if (!v8)
    {
      -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlpha:", 0.0);

LABEL_12:
      goto LABEL_13;
    }
    v10 = v9;
    objc_msgSend((id)objc_opt_class(), "lockupCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIStoreButtonItemViewController storeButtonItem](self, "storeButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0DBDA48];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke;
      v33[3] = &unk_1EA1F6210;
      v33[4] = self;
      v34 = v13;
      objc_msgSend(v14, "performWithoutAnimations:", v33);
      v15 = v34;
    }
    else
    {
      -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAlpha:", 0.0);

      -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLockup:", 0);

      -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "id");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "isEqualToString:", v22);

      if ((v23 & 1) != 0)
        goto LABEL_11;
      if (v10 != 1)
      {
        if (!v10)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9B88]), "initWithStringValue:", v8);
          -[SearchUIStoreButtonItemViewController setAdamID:](self, "setAdamID:", v8);
          v25 = objc_alloc(MEMORY[0x1E0CF9BC0]);
          v26 = (void *)objc_msgSend(v25, "initWithID:kind:context:", v24, *MEMORY[0x1E0CF9B38], *MEMORY[0x1E0CF9B10]);
          -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setRequest:", v26);

        }
        goto LABEL_11;
      }
      -[SearchUIStoreButtonItemViewController setAdamID:](self, "setAdamID:", 0);
      objc_msgSend((id)objc_opt_class(), "lockupViewGroup");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *MEMORY[0x1E0CF9B10];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_2;
      v30[3] = &unk_1EA1F87C0;
      v31 = v5;
      v32 = self;
      objc_msgSend(v28, "_lockupRequestForBundleID:withContext:completionBlock:", v8, v29, v30);

      v15 = v31;
    }

LABEL_11:
    goto LABEL_12;
  }
LABEL_13:

}

void __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "lockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequest:", 0);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lockupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLockup:", v3);

  objc_msgSend(*(id *)(a1 + 32), "lockupView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

}

void __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DBDA48];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_3;
  v8[3] = &unk_1EA1F6518;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v4, "dispatchMainIfNecessary:", v8);

}

void __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "buttonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "id");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAdamID:", v5);

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "lockupView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequest:", v6);

  }
}

- (id)buttonItemView
{
  return 0;
}

- (id)storeButtonItem
{
  void *v2;
  void *v3;

  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sfButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentStoreButtonIdentifier
{
  void *v2;
  void *v3;

  -[SearchUIStoreButtonItemViewController storeButtonItem](self, "storeButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)currentStoreButtonIdentifierType
{
  void *v2;
  int v3;

  -[SearchUIStoreButtonItemViewController storeButtonItem](self, "storeButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identifierType");

  return v3;
}

+ (id)lockupCache
{
  if (lockupCache_onceToken != -1)
    dispatch_once(&lockupCache_onceToken, &__block_literal_global_38);
  return (id)lockupCache_lockupCache;
}

void __52__SearchUIStoreButtonItemViewController_lockupCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)lockupCache_lockupCache;
  lockupCache_lockupCache = v0;

}

+ (id)lockupViewGroup
{
  if (lockupViewGroup_onceToken[0] != -1)
    dispatch_once(lockupViewGroup_onceToken, &__block_literal_global_40);
  return (id)lockupViewGroup_group;
}

void __56__SearchUIStoreButtonItemViewController_lockupViewGroup__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF9BD0]), "initWithName:", CFSTR("com.apple.SearchUI.LockupViewGroup"));
  v1 = (void *)lockupViewGroup_group;
  lockupViewGroup_group = v0;

}

- (id)presentingViewControllerForLockupView:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUIStoreButtonItemViewController environment](self, "environment", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)environment
{
  void *v2;
  void *v3;

  -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SearchUIStoreButtonItemViewController *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DBDA48];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke;
  v7[3] = &unk_1EA1F6210;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "dispatchMainIfNecessary:", v7);

}

void __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "lockup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "isEqualToString:", v5);

  if ((_DWORD)v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke_2;
    v9[3] = &unk_1EA1F62F0;
    v10 = *(id *)(a1 + 32);
    +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v9);
    objc_msgSend((id)objc_opt_class(), "lockupCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lockup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
}

uint64_t __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  objc_msgSend(a3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v9 = 74.0;
  if (v5 >= 74.0)
    v9 = v5;
  if (!v8)
    v5 = v9;
  -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setLayoutSize:withContentPriority:", v5, v7, v11);

  -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomAlignmentRectInsets:", 10.0, 0.0, 10.0, 0.0);

}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lockup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lockupViewForAppIdentifier:didFailRequestWithError:", v12, v6);

  }
}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  -[SearchUIButtonItemViewController buttonPressed](self, "buttonPressed");
  -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lockup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockupViewEngagedForAppIdentifier:", v11);

  }
  -[SearchUIStoreButtonItemViewController lockupView](self, "lockupView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appearMetricsActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF9A50]))
  {
    -[SearchUIStoreButtonItemViewController setStartedInstalling:](self, "setStartedInstalling:", 1);
  }
  else if (-[SearchUIStoreButtonItemViewController startedInstalling](self, "startedInstalling"))
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF9A58]))
    {
      -[SearchUIStoreButtonItemViewController storeButtonItem](self, "storeButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "shouldOpenAppAfterInstallCompletes");

      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x1E0CA5870]);
        objc_msgSend(v21, "lockup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "id");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v9, "initWithStoreItemIdentifier:error:", objc_msgSend(v11, "int64value"), 0);

        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIStoreButtonItemViewController environment](self, "environment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUILaunchAppHandler openApplicationWithBundleIdentifier:environment:](SearchUILaunchAppHandler, "openApplicationWithBundleIdentifier:environment:", v13, v14);

      }
    }
  }
  -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lockup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lockupViewForAppIdentifier:didChangeState:", v20, v6);

  }
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (BOOL)startedInstalling
{
  return self->_startedInstalling;
}

- (void)setStartedInstalling:(BOOL)a3
{
  self->_startedInstalling = a3;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
