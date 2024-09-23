@implementation WBSWebExtensionToolbarItem

- (WBSWebExtensionToolbarItem)initWithWebExtension:(id)a3 extensionsController:(id)a4
{
  id v6;
  id v7;
  WBSWebExtensionToolbarItem *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  UIImage *image;
  uint64_t v14;
  NSString *label;
  void *v16;
  WBSWebExtensionToolbarItem *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WBSWebExtensionToolbarItem;
  v8 = -[WBSWebExtensionToolbarItem init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "webKitContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionForTab:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v7, "toolbarItemIdealPointSize");
    objc_msgSend(v10, "iconForSize:", (double)v11, (double)v11);
    v12 = objc_claimAutoreleasedReturnValue();
    image = v8->_image;
    v8->_image = (UIImage *)v12;

    objc_msgSend(v10, "label");
    v14 = objc_claimAutoreleasedReturnValue();
    label = v8->_label;
    v8->_label = (NSString *)v14;

    v8->_enabled = objc_msgSend(v10, "isEnabled");
    objc_storeWeak((id *)&v8->_extensionsController, v7);
    objc_storeWeak((id *)&v8->_webExtension, v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel__webKitExtensionActionDidChange_, *MEMORY[0x1E0CEF828], 0);

    v17 = v8;
  }

  return v8;
}

- (void)_webKitExtensionActionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webExtensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(v8, "associatedTab");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionToolbarItem webKitExtensionAction:didChangeForTab:](self, "webKitExtensionAction:didChangeForTab:", v8, v7);

  }
}

- (id)popupWebViewInspectionNameForAction:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "popupWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  v7 = objc_loadWeakRetained((id *)&self->_extensionsController);
  if ((objc_msgSend(v7, "hasNamedProfiles") & 1) != 0)
  {
    objc_msgSend(v7, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "displayShortName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "displayShortName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v8, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)badgeTextForTab:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  objc_msgSend(WeakRetained, "webKitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionForTab:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "badgeText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didViewBadgeInTab:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  objc_msgSend(WeakRetained, "webKitContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionForTab:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setHasUnreadBadgeText:", 0);

}

- (BOOL)hasUpdatedBadgeTextInTab:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  objc_msgSend(WeakRetained, "webKitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionForTab:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "hasUnreadBadgeText");
  else
    v8 = 0;

  return v8;
}

- (id)titleForTab:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  objc_msgSend(WeakRetained, "webKitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionForTab:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEnabledForTab:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  objc_msgSend(WeakRetained, "webKitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionForTab:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabled");

  return v8;
}

- (id)iconForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toolbarItemIdealPointSize");

  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  objc_msgSend(WeakRetained, "webKitContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionForTab:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconForSize:", (double)v7, (double)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)shouldRequestAccessForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "urlForExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "safari_isHTTPFamilyURL") & 1) != 0)
  {
    -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "domainIsManaged:forComposedIdentifier:", v8, v9);

    v11 = (v10 & 1) == 0 && (unint64_t)(objc_msgSend(v6, "permissionStateForURL:inTab:", v5, v4) + 1) < 2;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WBSWebExtensionData)webExtension
{
  return (WBSWebExtensionData *)objc_loadWeakRetained((id *)&self->_webExtension);
}

- (_WKWebExtensionAction)webKitAction
{
  return self->_webKitAction;
}

- (void)setWebKitAction:(id)a3
{
  objc_storeStrong((id *)&self->_webKitAction, a3);
}

- (WKWebView)popupWebView
{
  return self->_popupWebView;
}

- (BOOL)showingExtensionPopup
{
  return self->_showingExtensionPopup;
}

- (NSString)label
{
  return self->_label;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_popupWebView, 0);
  objc_storeStrong((id *)&self->_webKitAction, 0);
  objc_destroyWeak((id *)&self->_webExtension);
  objc_destroyWeak((id *)&self->_extensionsController);
}

@end
