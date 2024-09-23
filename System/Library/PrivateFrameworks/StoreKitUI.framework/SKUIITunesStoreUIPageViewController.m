@implementation SKUIITunesStoreUIPageViewController

- (void)dealloc
{
  SKUIITunesStoreUIPageViewController *v3;
  objc_super v4;

  -[SUBarButtonItem target](self->_cancelButtonItem, "target");
  v3 = (SKUIITunesStoreUIPageViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[SUBarButtonItem setTarget:](self->_cancelButtonItem, "setTarget:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIITunesStoreUIPageViewController;
  -[SUStorePageViewController dealloc](&v4, sel_dealloc);
}

- (void)handleFailureWithError:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIITunesStoreUIPageViewController handleFailureWithError:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (-[SUViewController isVisible](self, "isVisible"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIITunesStoreUIPageViewController;
    -[SUStorePageViewController handleFailureWithError:](&v13, sel_handleFailureWithError_, v4);
  }

}

- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  objc_super v19;

  v4 = a4;
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIITunesStoreUIPageViewController presentDialogForError:pendUntilVisible:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIITunesStoreUIPageViewController productPageViewController](self, "productPageViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "productPageStyle");

  if (v16 == 1)
  {
    v17 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SKUIITunesStoreUIPageViewController;
    v17 = -[SUViewController presentDialogForError:pendUntilVisible:](&v19, sel_presentDialogForError_pendUntilVisible_, v6, v4);
  }

  return v17;
}

- (void)resetNavigationItem:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIITunesStoreUIPageViewController resetNavigationItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIITunesStoreUIPageViewController;
  -[SUStorePageViewController resetNavigationItem:](&v13, sel_resetNavigationItem_, v4);
  if (-[SKUIITunesStoreUIPageViewController showsCancelButton](self, "showsCancelButton"))
    -[SKUIITunesStoreUIPageViewController _addCancelButtonToNavigationItem:](self, "_addCancelButtonToNavigationItem:", v4);

}

- (void)viewWillLayoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_addCancelButtonToNavigationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SKUIITunesStoreUIPageViewController _cancelButtonItem](self, "_cancelButtonItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUViewController clientInterface](self, "clientInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleBarButtonItem:", v7);

  objc_msgSend(v4, "setLeftBarButtonItem:animated:", v7, 0);
}

- (id)_cancelButtonItem
{
  SUBarButtonItem *v3;
  SUBarButtonItem *cancelButtonItem;
  SUBarButtonItem *v5;
  void *v6;
  void *v7;

  if (!self->_cancelButtonItem)
  {
    v3 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DDC1F0]);
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v3;

    -[SUBarButtonItem setAction:](self->_cancelButtonItem, "setAction:", sel__storeSheetCancelButtonAction_);
    -[SUBarButtonItem setStyle:](self->_cancelButtonItem, "setStyle:", 2);
    -[SUBarButtonItem setTarget:](self->_cancelButtonItem, "setTarget:", self);
    v5 = self->_cancelButtonItem;
    if (self->_cancelButtonTitle)
    {
      -[SUBarButtonItem setTitle:](self->_cancelButtonItem, "setTitle:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CLOSE_SHEET_BUTTON"), &stru_1E73A9FB0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUBarButtonItem setTitle:](v5, "setTitle:", v7);

    }
  }
  return self->_cancelButtonItem;
}

- (void)_storeSheetCancelButtonAction:(id)a3
{
  id v3;

  -[SKUIITunesStoreUIPageViewController productPageViewController](self, "productPageViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendDidFinishWithResult:", 0);

}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1328);
}

- (SKProductPageViewController)productPageViewController
{
  return (SKProductPageViewController *)objc_loadWeakRetained((id *)&self->_productPageViewController);
}

- (void)setProductPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_productPageViewController, a3);
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  self->_showsCancelButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_productPageViewController);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
}

- (void)handleFailureWithError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)presentDialogForError:(uint64_t)a3 pendUntilVisible:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)resetNavigationItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
