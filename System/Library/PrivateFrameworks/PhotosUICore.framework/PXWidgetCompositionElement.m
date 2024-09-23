@implementation PXWidgetCompositionElement

- (PXWidgetCompositionElement)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionElement.m"), 56, CFSTR("invalid initializer"));

  return 0;
}

- (PXWidgetCompositionElement)initWithWidget:(id)a3 scrollViewController:(id)a4
{
  id v7;
  id v8;
  PXWidgetCompositionElement *v9;
  uint64_t v10;
  NSHashTable *observers;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id WeakRetained;
  uint64_t v21;
  PXWidgetBar *header;
  id v23;
  id v24;
  uint64_t v25;
  PXWidgetBar *footer;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PXWidgetCompositionElement;
  v9 = -[PXWidgetCompositionElement init](&v28, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v9->__observers;
    v9->__observers = (NSHashTable *)v10;

    objc_storeStrong((id *)&v9->_widget, a3);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");
      if (v14 >= 1)
      {
        v15 = v14;
        v16 = 0;
        v17 = 0;
        do
        {
          v18 = v16 + 1;
          v17 += (v16 + 1) * objc_msgSend(v13, "characterAtIndex:");
          v16 = v18;
        }
        while (v15 != v18);
      }
      kdebug_trace();

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setWidgetDelegate:", v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9->__isClassOfViewElement = 1;
    v9->_widgetContentSize = *(CGSize *)off_1E50B8810;
    objc_storeWeak((id *)&v9->_scrollViewController, v8);
    v19 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "headerBarClass"));
    WeakRetained = objc_loadWeakRetained((id *)&v9->_scrollViewController);
    v21 = objc_msgSend(v19, "initWithScrollViewController:", WeakRetained);
    header = v9->__header;
    v9->__header = (PXWidgetBar *)v21;

    -[PXWidgetBar setDelegate:](v9->__header, "setDelegate:", v9);
    v23 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "footerBarClass"));
    v24 = objc_loadWeakRetained((id *)&v9->_scrollViewController);
    v25 = objc_msgSend(v23, "initWithScrollViewController:", v24);
    footer = v9->__footer;
    v9->__footer = (PXWidgetBar *)v25;

    -[PXWidgetBar setDelegate:](v9->__footer, "setDelegate:", v9);
  }

  return v9;
}

- (void)prepare
{
  -[PXWidgetCompositionElement _updateHeader](self, "_updateHeader");
  -[PXWidgetCompositionElement _updateFooter](self, "_updateFooter");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTransitionToViewControllerPreferredTransitionType = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPresentationEnvironment = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setSpec:(id)a3
{
  PXWidgetCompositionSpec *v5;
  PXWidgetCompositionSpec *v6;

  v5 = (PXWidgetCompositionSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXWidgetCompositionElement _invalidateHeader](self, "_invalidateHeader");
    -[PXWidgetCompositionElement _invalidateFooter](self, "_invalidateFooter");
    v5 = v6;
  }

}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXWidgetCompositionElement _observers](self, "_observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXWidgetCompositionElement _observers](self, "_observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (PXTilingController)contentTilingController
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionElement.m"), 129, CFSTR("must be implemented by concrete subclass"));

  return 0;
}

- (PXTilingController)headerTilingController
{
  void *v2;
  void *v3;

  -[PXWidgetCompositionElement _header](self, "_header");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXTilingController *)v3;
}

- (PXTilingController)footerTilingController
{
  void *v2;
  void *v3;

  -[PXWidgetCompositionElement _footer](self, "_footer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXTilingController *)v3;
}

- (void)setWidgetContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;
  uint8_t buf[4];
  PXWidgetCompositionElement *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  CGSize v22;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3.width != self->_widgetContentSize.width || a3.height != self->_widgetContentSize.height)
  {
    self->_widgetContentSize = a3;
    -[PXWidgetCompositionElement widget](self, "widget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLRelatedGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v22.width = width;
      v22.height = height;
      NSStringFromCGSize(v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = self;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "[%@] set content size for widget=%@ size=%@", buf, 0x20u);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PXWidgetCompositionElement_setWidgetContentSize___block_invoke;
    v11[3] = &unk_1E5149060;
    v12 = v7;
    v13 = width;
    v14 = height;
    v10 = v7;
    -[PXWidgetCompositionElement _notifyWidgetUsingBlock:](self, "_notifyWidgetUsingBlock:", v11);

  }
}

- (void)setShouldLoadWidgetContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  uint8_t buf[4];
  PXWidgetCompositionElement *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_shouldLoadWidgetContent != a3)
  {
    v3 = a3;
    self->_shouldLoadWidgetContent = a3;
    -[PXWidgetCompositionElement widget](self, "widget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLRelatedGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v12 = self;
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[%@] set should load content=%i for widget=%@ ", buf, 0x1Cu);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PXWidgetCompositionElement_setShouldLoadWidgetContent___block_invoke;
    v8[3] = &unk_1E5144398;
    v10 = v3;
    v9 = v5;
    v7 = v5;
    -[PXWidgetCompositionElement _notifyWidgetUsingBlock:](self, "_notifyWidgetUsingBlock:", v8);

  }
}

- (void)_notifyWidgetUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PXWidgetCompositionElement _isNotifyingWidget](self, "_isNotifyingWidget");
  -[PXWidgetCompositionElement _setNotifyingWidget:](self, "_setNotifyingWidget:", 1);
  v4[2](v4);

  -[PXWidgetCompositionElement _setNotifyingWidget:](self, "_setNotifyingWidget:", v5);
}

- (void)_performContentChangeWhenSafe:(id)a3
{
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (-[PXWidgetCompositionElement _isNotifyingWidget](self, "_isNotifyingWidget")
    || -[PXWidgetCompositionElement _isViewElementAndCheckingInTile](self, "_isViewElementAndCheckingInTile"))
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PXWidgetCompositionElement__performContentChangeWhenSafe___block_invoke;
    block[3] = &unk_1E5146480;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, PXWidgetCompositionElement *))v4 + 2))(v4, self);
  }

}

- (void)_updateHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;

  -[PXWidgetCompositionElement widget](self, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "localizedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "localizedSubtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "localizedCaption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PXWidgetCompositionElement spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "disclosureLocation") == 1)
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "localizedDisclosureTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {

  }
  v9 = 0;
LABEL_15:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v3, "allowUserInteractionWithSubtitle");
  else
    v10 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v3, "contentLayoutStyle");
  else
    v11 = 0;
  -[PXWidgetCompositionElement spec](self, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "headerSpecForWidgetContentLayoutStyle:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXWidgetCompositionElement _header](self, "_header");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__PXWidgetCompositionElement__updateHeader__block_invoke;
  v21[3] = &unk_1E5128DB8;
  v22 = v14;
  v23 = v4;
  v24 = v5;
  v25 = v6;
  v26 = v9;
  v27 = v13;
  v28 = v10;
  v15 = v13;
  v16 = v9;
  v17 = v6;
  v18 = v5;
  v19 = v4;
  v20 = v14;
  objc_msgSend(v20, "performChanges:", v21);

}

- (void)_updateFooter
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  -[PXWidgetCompositionElement widget](self, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetCompositionElement spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "disclosureLocation") != 2)
  {

    goto LABEL_5;
  }
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "localizedDisclosureTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  -[PXWidgetCompositionElement spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXWidgetCompositionElement _footer](self, "_footer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__PXWidgetCompositionElement__updateFooter__block_invoke;
  v13[3] = &unk_1E51457C8;
  v14 = v9;
  v15 = v6;
  v16 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v12, "performChanges:", v13);

}

- (void)_performChanges:(id)a3 withAnimationOptions:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  _BOOL4 isPerformingChanges;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void (**v16)(_QWORD);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  if (v6)
    v6[2](v6);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    v16 = v6;
    -[PXWidgetCompositionElement animationOptionsOriginatingTilingController](self, "animationOptionsOriginatingTilingController");
    v9 = objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PXWidgetCompositionElement _observers](self, "_observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "elementNeedsLayout:preferredAnimationOptions:originatingTilingController:", self, v7, v9);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v12);
    }

    v6 = v16;
    goto LABEL_17;
  }
  if (v7)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "ignoring nested animation options %@", buf, 0xCu);
    }
LABEL_17:

  }
}

- (BOOL)_isViewElementAndCheckingInTile
{
  int v3;

  v3 = -[PXWidgetCompositionElement _isClassOfViewElement](self, "_isClassOfViewElement");
  if (v3)
    LOBYTE(v3) = -[PXWidgetCompositionElement isCheckingInTile](self, "isCheckingInTile");
  return v3;
}

- (id)widgetViewHostingGestureRecognizers:(id)a3
{
  void *v3;
  void *v4;

  -[PXWidgetCompositionElement scrollViewController](self, "scrollViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)widgetViewControllerHostingWidget:(id)a3
{
  void *v4;
  void *v5;

  -[PXWidgetCompositionElement delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)widget:(id)a3 animateChanges:(id)a4 withAnimationOptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  if (!v8)
  {
    +[PXBasicTileAnimationOptions defaultAnimationOptions](PXBasicTileAnimationOptions, "defaultAnimationOptions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PXWidgetCompositionElement_widget_animateChanges_withAnimationOptions___block_invoke;
  v11[3] = &unk_1E5128DE0;
  v12 = v8;
  v13 = v7;
  v11[4] = self;
  v9 = v8;
  v10 = v7;
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", v11);

}

- (void)widgetLocalizedTitleDidChange:(id)a3
{
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", &__block_literal_global_117892);
}

- (void)widgetLocalizedSubtitleDidChange:(id)a3
{
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", &__block_literal_global_45);
}

- (void)widgetLocalizedCaptionDidChange:(id)a3
{
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", &__block_literal_global_46);
}

- (void)widgetLocalizedDisclosureTitleDidChange:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PXWidgetCompositionElement_widgetLocalizedDisclosureTitleDidChange___block_invoke;
  v3[3] = &unk_1E5128E88;
  v3[4] = self;
  v3[5] = a2;
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", v3);
}

- (void)widgetPreferredContentHeightForWidthDidChange:(id)a3
{
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", &__block_literal_global_49);
}

- (void)widgetHasLoadedContentDataDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke;
  v6[3] = &unk_1E5128ED0;
  v7 = v4;
  v5 = v4;
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", v6);

}

- (void)widgetRequestFocus:(id)a3
{
  id v3;

  -[PXWidgetCompositionElement contentTilingController](self, "contentTilingController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocus");

}

- (void)widgetInvalidateContentLayoutStyle:(id)a3
{
  -[PXWidgetCompositionElement _performContentChangeWhenSafe:](self, "_performContentChangeWhenSafe:", &__block_literal_global_55);
}

- (int64_t)widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v9;

  v5 = a3;
  -[PXWidgetCompositionElement spec](self, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disclosureLocation");

  if (v7 != 1 && v7 != 2)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionElement.m"), 404, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)widget:(id)a3 transitionToViewController:(id)a4 withTransitionType:(int64_t)a5
{
  id v7;
  void *v8;

  if (!self->_delegateFlags.respondsToTransitionToViewControllerPreferredTransitionType)
    return 0;
  v7 = a4;
  -[PXWidgetCompositionElement delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "element:transitionToViewController:withTransitionType:", self, v7, a5);

  return a5;
}

- (BOOL)widget:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  uint64_t v4;
  void *v6;

  if (!self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated)
    return 0;
  v4 = a4;
  -[PXWidgetCompositionElement delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "element:requestViewControllerDismissalAnimated:", self, v4);

  return v4;
}

- (id)presentationEnvironmentForWidget:(id)a3
{
  void *v4;
  void *v5;

  if (self->_delegateFlags.respondsToPresentationEnvironment)
  {
    -[PXWidgetCompositionElement delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationEnvironmentForElement:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)widgetUndoManager:(id)a3
{
  void *v4;
  void *v5;

  -[PXWidgetCompositionElement delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementUndoManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)widgetBarDidSelectSubtitle:(id)a3
{
  id v4;

  -[PXWidgetCompositionElement widget](self, "widget", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXWidgetCompositionElement widgetRequestFocus:](self, "widgetRequestFocus:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userDidSelectSubtitle");

}

- (void)widgetBarDidSelectDisclosureAffordance:(id)a3
{
  id v4;

  -[PXWidgetCompositionElement widget](self, "widget", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXWidgetCompositionElement widgetRequestFocus:](self, "widgetRequestFocus:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userDidSelectDisclosureControl");

}

- (PXWidget)widget
{
  return self->_widget;
}

- (PXScrollViewController)scrollViewController
{
  return (PXScrollViewController *)objc_loadWeakRetained((id *)&self->_scrollViewController);
}

- (PXWidgetCompositionElementDelegate)delegate
{
  return (PXWidgetCompositionElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXWidgetCompositionSpec)spec
{
  return self->_spec;
}

- (CGSize)widgetContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_widgetContentSize.width;
  height = self->_widgetContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldLoadWidgetContent
{
  return self->_shouldLoadWidgetContent;
}

- (PXTilingController)animationOptionsOriginatingTilingController
{
  return self->_animationOptionsOriginatingTilingController;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (PXWidgetBar)_header
{
  return self->__header;
}

- (PXWidgetBar)_footer
{
  return self->__footer;
}

- (BOOL)_isNotifyingWidget
{
  return self->__isNotifyingWidget;
}

- (void)_setNotifyingWidget:(BOOL)a3
{
  self->__isNotifyingWidget = a3;
}

- (BOOL)_isClassOfViewElement
{
  return self->__isClassOfViewElement;
}

- (void)set_isClassOfViewElement:(BOOL)a3
{
  self->__isClassOfViewElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__footer, 0);
  objc_storeStrong((id *)&self->__header, 0);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_animationOptionsOriginatingTilingController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollViewController);
  objc_storeStrong((id *)&self->_widget, 0);
}

uint64_t __65__PXWidgetCompositionElement_widgetInvalidateContentLayoutStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateHeader");
}

void __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke_2;
  v5[3] = &unk_1E5148D08;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_msgSend(v4, "_performChanges:withAnimationOptions:", v5, 0);

}

void __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "hasLoadedContentData"))
    kdebug_trace();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "elementHasLoadedContentDataDidChange:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __76__PXWidgetCompositionElement_widgetPreferredContentHeightForWidthDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__PXWidgetCompositionElement_widgetPreferredContentHeightForWidthDidChange___block_invoke_2;
  v4[3] = &unk_1E5149198;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "_performChanges:withAnimationOptions:", v4, 0);

}

void __76__PXWidgetCompositionElement_widgetPreferredContentHeightForWidthDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  PXTilingLayoutInvalidationContext *v4;

  v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateVisibleRect](v4, "invalidateVisibleRect");
  objc_msgSend(*(id *)(a1 + 32), "contentTilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayoutWithContext:", v4);

}

void __70__PXWidgetCompositionElement_widgetLocalizedDisclosureTitleDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disclosureLocation");

  if (v4 == 1)
  {
    objc_msgSend(v7, "_invalidateHeader");
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    objc_msgSend(v7, "_invalidateFooter");
    goto LABEL_7;
  }
  v5 = v7;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXWidgetCompositionElement.m"), 347, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

uint64_t __62__PXWidgetCompositionElement_widgetLocalizedCaptionDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateHeader");
}

uint64_t __63__PXWidgetCompositionElement_widgetLocalizedSubtitleDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateHeader");
}

uint64_t __60__PXWidgetCompositionElement_widgetLocalizedTitleDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateHeader");
}

uint64_t __73__PXWidgetCompositionElement_widget_animateChanges_withAnimationOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performChanges:withAnimationOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __43__PXWidgetCompositionElement__updateFooter__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisclosureTitle:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setSpec:", *(_QWORD *)(a1 + 48));
}

uint64_t __43__PXWidgetCompositionElement__updateHeader__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCaption:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setDisclosureTitle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setSpec:", *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 32), "setAllowUserInteractionWithSubtitle:", *(unsigned __int8 *)(a1 + 80));
}

void __60__PXWidgetCompositionElement__performContentChangeWhenSafe___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

uint64_t __57__PXWidgetCompositionElement_setShouldLoadWidgetContent___block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(a1 + 40))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");
      if (v5 >= 1)
      {
        v6 = v5;
        v7 = 0;
        v8 = 0;
        do
        {
          v9 = v7 + 1;
          v8 += (v7 + 1) * objc_msgSend(v4, "characterAtIndex:");
          v7 = v9;
        }
        while (v6 != v9);
      }
      kdebug_trace();

      return objc_msgSend(*(id *)(a1 + 32), "loadContentData");
    }
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "unloadContentData");
  }
  return result;
}

uint64_t __51__PXWidgetCompositionElement_setWidgetContentSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return result;
}

+ (id)elementWithWidget:(id)a3 scrollViewController:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (objc_class *)objc_opt_class();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXWidgetCompositionElement.m"), 49, CFSTR("widget must provide either contentView or contentTilingController"));

    v9 = 0;
  }
  v11 = (void *)objc_msgSend([v9 alloc], "initWithWidget:scrollViewController:", v7, v8);

  return v11;
}

- (id)extendedTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[PXWidgetCompositionElement delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (Class)headerBarClass
{
  return (Class)objc_opt_class();
}

+ (Class)footerBarClass
{
  return (Class)objc_opt_class();
}

@end
