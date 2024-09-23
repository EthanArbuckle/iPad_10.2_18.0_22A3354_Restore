@implementation SearchUICollectionPeekDelegate

- (SearchUICollectionPeekDelegate)initWithViewController:(id)a3
{
  id v4;
  SearchUICollectionPeekDelegate *v5;
  SearchUICollectionPeekDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUICollectionPeekDelegate;
  v5 = -[SearchUICollectionPeekDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SearchUICollectionPeekDelegate setCollectionViewController:](v5, "setCollectionViewController:", v4);

  return v6;
}

- (void)setCollectionViewController:(id)a3
{
  objc_storeWeak((id *)&self->_collectionViewController, a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;

  y = a4.y;
  x = a4.x;
  -[SearchUICollectionPeekDelegate collectionViewController](self, "collectionViewController", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", v8))
  {
    objc_msgSend(v8, "hitTest:withEvent:", 0, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemIdentifierForIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "identifyingResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:](SearchUIUtilities, "bundleIdentifierIsBlockedForScreenTimeExpiration:", v14)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v10, "isThreeDTouchEnabled") & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }

    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      && objc_msgSend(v10, "isDescendantOfView:", v17)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = objc_msgSend(v17, "searchui_focusStyle");
      objc_msgSend(v7, "commandEnvironmentForIndexPath:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 == 7)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(v7, "commandEnvironmentForIndexPath:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
        goto LABEL_15;
    }
    if (+[SearchUICommandHandler hasValidHandlerForRowModel:environment:](SearchUICommandHandler, "hasValidHandlerForRowModel:environment:", v12, v19))
    {
      goto LABEL_19;
    }
    objc_msgSend(v12, "cardSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "previewButtonItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

      goto LABEL_19;
    }
    if ((objc_msgSend(v12, "supportsCustomUserReportRequestAfforance") & 1) != 0)
    {
      v16 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v12, "cardSection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "userReportRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
LABEL_19:
      +[SearchUICommandHandler previewHandlerForRowModel:environment:](SearchUICommandHandler, "previewHandlerForRowModel:environment:", v12, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionPeekDelegate setCommandHandler:](self, "setCommandHandler:", v22);

      v23 = (void *)objc_opt_class();
      -[SearchUICollectionPeekDelegate commandHandler](self, "commandHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "menuConfigurationForCommandHandler:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
LABEL_15:
    v16 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

+ (id)menuConfigurationForCommandHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC36B8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SearchUICollectionPeekDelegate_menuConfigurationForCommandHandler___block_invoke;
  v9[3] = &unk_1EA1F6DD0;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v5, "actionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __69__SearchUICollectionPeekDelegate_menuConfigurationForCommandHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  char isKindOfClass;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "prepareViewController:forTriggerEvent:", v2, 5);
    if (!+[SearchUIUtilities canShowViewController:](SearchUIUtilities, "canShowViewController:", v2)
      || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5 = v2, (isKindOfClass & 1) != 0))
    {
      +[SearchUIUtilities requestDeviceUnlock:](SearchUIUtilities, "requestDeviceUnlock:", 0);
      v5 = 0;
    }
    v3 = v5;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return -[SearchUICollectionPeekDelegate generateTargetPreviewForInteraction:forItemWithIdentifier:](self, "generateTargetPreviewForInteraction:forItemWithIdentifier:", a3, a5);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  return -[SearchUICollectionPeekDelegate generateTargetPreviewForInteraction:forItemWithIdentifier:](self, "generateTargetPreviewForInteraction:forItemWithIdentifier:", a3, a5);
}

- (id)generateTargetPreviewForInteraction:(id)a3 forItemWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v5 = a3;
  -[SearchUICollectionPeekDelegate collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = 0;
  if (objc_msgSend(v7, "pointInside:withEvent:", 0, v9, v11))
  {
    objc_msgSend(v7, "indexPathForItemAtPoint:", v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v7, "cellForItemAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v15 = v14;
    objc_msgSend(v15, "highlightReferenceView");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v15;
    v19 = v18;

    v20 = (void *)objc_opt_new();
    objc_msgSend(v15, "backgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

    }
    else
    {
      -[SearchUICollectionPeekDelegate commandHandler](self, "commandHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "viewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v24);

LABEL_14:
    objc_msgSend(v15, "rowModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "rowModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "supportsCustomHighlightBehavior");

      if (!v27)
      {
LABEL_18:
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v19, v20);

        goto LABEL_19;
      }
      objc_msgSend(v15, "contentView");
      v28 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0DC3508];
      objc_msgSend(v15, "highlightFrame");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      objc_msgSend(v15, "highlightFrameCornerRadius");
      objc_msgSend(v29, "bezierPathWithRoundedRect:cornerRadius:", v31, v33, v35, v37, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setVisiblePath:", v25);
      v19 = (id)v28;
    }

    goto LABEL_18;
  }
LABEL_21:

  return v12;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  v7 = (void *)objc_opt_class();
  -[SearchUICollectionPeekDelegate commandHandler](self, "commandHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextMenuInteractionWillDisplayMenuForCommandHandler:animator:", v8, v6);

}

+ (void)contextMenuInteractionWillDisplayMenuForCommandHandler:(id)a3 animator:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__SearchUICollectionPeekDelegate_contextMenuInteractionWillDisplayMenuForCommandHandler_animator___block_invoke;
  v7[3] = &unk_1EA1F62F0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a4, "addAnimations:", v7);
  objc_msgSend(v6, "didPreview");

}

void __98__SearchUICollectionPeekDelegate_contextMenuInteractionWillDisplayMenuForCommandHandler_animator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.75);

}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  v7 = (void *)objc_opt_class();
  -[SearchUICollectionPeekDelegate commandHandler](self, "commandHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:animator:", v8, v6);

}

+ (void)contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:(id)a3 animator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredCommitStyle:", v7 != 0);

  objc_msgSend(v5, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "command");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
    {
      v12 = objc_msgSend(v5, "prefersModalPresentation");

      if ((v12 & 1) == 0)
        goto LABEL_9;
    }
    else
    {

    }
  }
  else if (!objc_msgSend(v5, "prefersModalPresentation"))
  {
    goto LABEL_9;
  }
  objc_msgSend(v5, "rowModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v5 = (id)v15;
LABEL_9:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __115__SearchUICollectionPeekDelegate_contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler_animator___block_invoke;
  v17[3] = &unk_1EA1F62F0;
  v18 = v5;
  v16 = v5;
  objc_msgSend(v6, "addAnimations:", v17);

}

uint64_t __115__SearchUICollectionPeekDelegate_contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeWithTriggerEvent:", 6);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  v7 = (void *)objc_opt_class();
  -[SearchUICollectionPeekDelegate commandHandler](self, "commandHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextMenuInteractionWillEndForCommandHandler:animator:", v8, v6);

  -[SearchUICollectionPeekDelegate setCommandHandler:](self, "setCommandHandler:", 0);
}

+ (void)contextMenuInteractionWillEndForCommandHandler:(id)a3 animator:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__SearchUICollectionPeekDelegate_contextMenuInteractionWillEndForCommandHandler_animator___block_invoke;
  v7[3] = &unk_1EA1F62F0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a4, "addAnimations:", v7);

}

void __90__SearchUICollectionPeekDelegate_contextMenuInteractionWillEndForCommandHandler_animator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (SearchUICollectionViewController)collectionViewController
{
  return (SearchUICollectionViewController *)objc_loadWeakRetained((id *)&self->_collectionViewController);
}

- (SearchUICommandHandler)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
  objc_storeStrong((id *)&self->_commandHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandHandler, 0);
  objc_destroyWeak((id *)&self->_collectionViewController);
}

@end
