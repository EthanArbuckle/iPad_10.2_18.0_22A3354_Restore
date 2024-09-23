@implementation SearchUIButtonItemViewController

+ (id)buttonItemViewControllerForButtonItem:(id)a3
{
  objc_msgSend(a3, "searchUI_viewControllerClass");
  return (id)objc_opt_new();
}

- (SearchUIButtonItemViewController)init
{
  SearchUIButtonItemViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItemViewController;
  v2 = -[SearchUIButtonItemViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SearchUIButtonItemViewController setView:](v2, "setView:", v3);

  }
  return v2;
}

- (SearchUIButtonItemView)buttonItemView
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char isKindOfClass;
  char v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[SearchUIButtonItemViewController buttonItemViewStyle](self, "buttonItemViewStyle") > 4)
    v3 = 0;
  else
    v3 = objc_opt_class();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SearchUIButtonItemViewController view](self, "view", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {

    v8 = 0;
LABEL_17:
    v15 = (void *)objc_opt_new();

    objc_msgSend(v15, "setDelegate:", self);
    objc_msgSend(v15, "addTarget:action:", self, sel_buttonPressed);
    -[SearchUIButtonItemViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addArrangedSubview:", v15);

    v8 = v15;
    goto LABEL_18;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      isKindOfClass = objc_opt_isKindOfClass();
      v13 = ~isKindOfClass;
      objc_msgSend(v11, "setHidden:", (isKindOfClass & 1) == 0);
      if ((v13 & 1) == 0)
      {
        v14 = v11;

        v8 = v14;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  if (!v8 || (objc_msgSend(v8, "isMemberOfClass:", v3) & 1) == 0)
    goto LABEL_17;
LABEL_18:
  -[SearchUIButtonItemViewController setButtonItemView:](self, "setButtonItemView:", v8);
  return (SearchUIButtonItemView *)v8;
}

- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4
{
  -[SearchUIButtonItemViewController updateWithButtonItem:buttonItemViewType:isStatusUpdate:](self, "updateWithButtonItem:buttonItemViewType:isStatusUpdate:", a3, a4, 0);
}

- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4 isStatusUpdate:(BOOL)a5
{
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v9 = a3;
  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10)
    && -[SearchUIButtonItemViewController buttonItemViewStyle](self, "buttonItemViewStyle") == a4)
  {

    if (!a5)
      goto LABEL_7;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_buttonItem, a3);
  self->_buttonItemViewStyle = a4;
  objc_msgSend(v9, "setDelegate:", self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__SearchUIButtonItemViewController_updateWithButtonItem_buttonItemViewType_isStatusUpdate___block_invoke;
  v11[3] = &unk_1EA1F6620;
  v11[4] = self;
  v12 = v9;
  v13 = a4;
  v14 = a5;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v11);

LABEL_7:
}

void __91__SearchUIButtonItemViewController_updateWithButtonItem_buttonItemViewType_isStatusUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "buttonItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "isEqual:", *(_QWORD *)(a1 + 40)))
    goto LABEL_16;
  v2 = objc_msgSend(*(id *)(a1 + 32), "buttonItemViewStyle");
  v3 = *(_QWORD *)(a1 + 48);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "buttonItemView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "buttonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewButtonItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = objc_msgSend(*(id *)(a1 + 40), "showsMenuAsPrimaryAction");
    if ((v7 & 1) != 0 || !v6)
    {
      objc_msgSend(v21, "setShowsMenuAsPrimaryAction:", v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "buttonItem", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "command");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShowsMenuAsPrimaryAction:", v9 == 0);

    }
    objc_msgSend(v21, "setContextMenuInteractionEnabled:", objc_msgSend(v21, "showsMenuAsPrimaryAction"));
    objc_msgSend(*(id *)(a1 + 40), "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "buttonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v10);

    if ((v12 & 1) == 0)
      objc_msgSend(v21, "setButtonTitle:", v10);
    objc_msgSend(*(id *)(a1 + 32), "updateImageForStatusUpdate:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "buttonAppearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setButtonAppearance:", v13);

    objc_msgSend(v21, "setIsCompact:", objc_msgSend(*(id *)(a1 + 32), "isCompact"));
    objc_msgSend(*(id *)(a1 + 32), "buttonFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setButtonFont:", v14);

    objc_msgSend(*(id *)(a1 + 40), "command");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rowModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "feedbackDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SearchUICommandHandler hasValidHandlerForCommand:rowModel:environment:](SearchUICommandHandler, "hasValidHandlerForCommand:rowModel:environment:", v15, v16, v18))
    {

    }
    else
    {
      v19 = objc_msgSend(*(id *)(a1 + 40), "isMemberOfClass:", objc_opt_class());

      if ((v19 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "previewButtonItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setEnabled:", objc_msgSend(v20, "count") != 0);

LABEL_15:
        objc_msgSend(v21, "invalidateIntrinsicContentSize");

LABEL_16:
        return;
      }
    }
    objc_msgSend(v21, "setEnabled:", 1);
    goto LABEL_15;
  }
}

- (void)updateImageForStatusUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = a3;
  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemViewController buttonItemView](self, "buttonItemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SearchUIButtonItemViewController buttonItemViewStyle](self, "buttonItemViewStyle") == 3
    && -[SearchUIButtonItemViewController isCompact](self, "isCompact")
    && !objc_msgSend(v17, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v17, "buttonAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "preferNoFallbackImage");

  }
  objc_msgSend(v17, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if ((objc_msgSend(v5, "drawsBackgroundPlatter") & 1) != 0)
    {
      if ((v7 & 1) == 0)
      {
LABEL_8:
        objc_msgSend(v17, "fallbackImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else if (((objc_msgSend(v5, "drawsIconBackgroundPlatter") ^ 1 | v7) & 1) == 0)
    {
      goto LABEL_8;
    }
    v8 = 0;
  }
LABEL_11:
  +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sfImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if ((v11 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "useDefaultSymbolFillStyle");

      if (v14)
        objc_msgSend(v12, "setPreferredFill:", 1);

      if (!v3)
        goto LABEL_17;
    }
    else
    {
      v12 = v9;
      if (!v3)
      {
LABEL_17:
        v15 = 0;
LABEL_24:
        objc_msgSend(v5, "setSfImage:animateTransition:", v12, v15);
        goto LABEL_25;
      }
    }
    objc_msgSend(v5, "buttonTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      v15 = objc_msgSend(v5, "drawsTitle") ^ 1;
    else
      v15 = 1;

    goto LABEL_24;
  }
  v12 = v9;
LABEL_25:

}

- (void)setbuttonItemViewStyle:(unint64_t)a3
{
  id v5;

  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemViewController updateWithButtonItem:buttonItemViewType:](self, "updateWithButtonItem:buttonItemViewType:", v5, a3);

}

- (void)setIsCompact:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_isCompact != a3)
  {
    v3 = a3;
    self->_isCompact = a3;
    -[SearchUIButtonItemViewController buttonItemView](self, "buttonItemView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsCompact:", v3);

    -[SearchUIButtonItemViewController updateImageForStatusUpdate:](self, "updateImageForStatusUpdate:", 0);
  }
}

- (void)buttonPressed
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIButtonItemViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v4);

  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    v5 = 3;
  else
    v5 = 2;
  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v6 = objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemViewController rowModel](self, "rowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v6, v7, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "executeWithTriggerEvent:", v5);
  -[SearchUIButtonItemViewController buttonDelegate](self, "buttonDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SearchUIButtonItemViewController buttonDelegate](self, "buttonDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buttonItemPressed:", v11);

  }
  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buttonPressed");

}

- (id)previewCommandHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SearchUIButtonItemViewController feedbackDelegate](self, "feedbackDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemViewController rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)customPreviewMenu
{
  void *v2;
  void *v3;

  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)stateDidChangeForButtonItem:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isEqual:", v4);

  if (v5)
  {
    -[SearchUIButtonItemViewController buttonDelegate](self, "buttonDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SearchUIButtonItemViewController buttonDelegate](self, "buttonDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stateDidChangeForButtonItem:", v9);

    }
    -[SearchUIButtonItemViewController updateWithButtonItem:buttonItemViewType:isStatusUpdate:](self, "updateWithButtonItem:buttonItemViewType:isStatusUpdate:", v9, -[SearchUIButtonItemViewController buttonItemViewStyle](self, "buttonItemViewStyle"), 1);
  }

}

- (BOOL)supportsContextMenuConfiguration
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUIButtonItemViewController buttonItemView](self, "buttonItemView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "drawsTitle");

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 1;
  }

  -[SearchUIButtonItemViewController buttonItem](self, "buttonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowsContextMenu"))
  {
    -[SearchUIButtonItemViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", v8);
    if (((v9 ^ 1 | v6) & 1) == 0)
    {
      -[SearchUIButtonItemViewController buttonItemView](self, "buttonItemView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v10, "showsMenuAsPrimaryAction");

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NUIContainerBoxView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (SearchUIButtonItem)buttonItem
{
  return self->_buttonItem;
}

- (void)setButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItem, a3);
}

- (unint64_t)buttonItemViewStyle
{
  return self->_buttonItemViewStyle;
}

- (void)setButtonItemViewStyle:(unint64_t)a3
{
  self->_buttonItemViewStyle = a3;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (SearchUIRowModel)rowModel
{
  return (SearchUIRowModel *)objc_loadWeakRetained((id *)&self->_rowModel);
}

- (void)setRowModel:(id)a3
{
  objc_storeWeak((id *)&self->_rowModel, a3);
}

- (SearchUIButtonItemViewControllerDelegate)buttonDelegate
{
  return (SearchUIButtonItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (void)setButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_buttonFont, a3);
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)setButtonItemView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItemView, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
  objc_destroyWeak((id *)&self->_rowModel);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
