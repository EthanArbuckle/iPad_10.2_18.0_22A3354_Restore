@implementation RUITopLevelElementProvider

- (RUITopLevelElementProvider)initWithParentElement:(id)a3
{
  id v4;
  RUITopLevelElementProvider *v5;
  RUITopLevelElementProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUITopLevelElementProvider;
  v5 = -[RUITopLevelElementProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parentElement, v4);

  return v6;
}

- (RUIObjectModel)objectModel
{
  void *v2;
  void *v3;
  void *v4;

  -[RUITopLevelElementProvider pageElement](self, "pageElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUIObjectModel *)v4;
}

- (RUIPageElement)pageElement
{
  void *v2;
  void *v3;

  -[RUITopLevelElementProvider parentElement](self, "parentElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUIPageElement *)v3;
}

- (id)makeWebViewOM
{
  RUIWebView *v3;
  void *v4;
  RUIWebView *v5;
  RUIWebView *webViewOM;
  RUIWebView *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (!self->_webViewOM)
  {
    v3 = [RUIWebView alloc];
    -[RUITopLevelElementProvider pageElement](self, "pageElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RUIElement initWithAttributes:parent:](v3, "initWithAttributes:parent:", 0, v4);
    webViewOM = self->_webViewOM;
    self->_webViewOM = v5;

    v7 = self->_webViewOM;
    -[RUITopLevelElementProvider objectModel](self, "objectModel");
    v8 = objc_claimAutoreleasedReturnValue();
    -[RUIWebView setDelegate:](v7, "setDelegate:", v8);

    -[RUITopLevelElementProvider delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[RUITopLevelElementProvider delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topLevelElementProvider:didCreateWebView:", self, self->_webViewOM);

    }
  }
  return self->_webViewOM;
}

- (BOOL)hasWebView
{
  return self->_webViewOM != 0;
}

- (id)makeTableViewOM
{
  RUITableView *v3;
  void *v4;
  RUITableView *v5;
  RUITableView *tableViewOM;
  RUITableView *v7;
  void *v8;
  RUITableView *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  if (!self->_tableViewOM)
  {
    v3 = [RUITableView alloc];
    -[RUITopLevelElementProvider pageElement](self, "pageElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RUITableView initWithAttributes:parent:](v3, "initWithAttributes:parent:", 0, v4);
    tableViewOM = self->_tableViewOM;
    self->_tableViewOM = v5;

    v7 = self->_tableViewOM;
    -[RUITopLevelElementProvider objectModel](self, "objectModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableView setObjectModel:](v7, "setObjectModel:", v8);

    v9 = self->_tableViewOM;
    -[RUITopLevelElementProvider pageElement](self, "pageElement");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "page");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableView setPage:](v9, "setPage:", v11);

    -[RUITopLevelElementProvider delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[RUITopLevelElementProvider delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "topLevelElementProvider:didCreateTableView:", self, self->_tableViewOM);

    }
  }
  return self->_tableViewOM;
}

- (void)setPrimaryElement:(id)a3
{
  RUITopLevelPageElement *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = self->_primaryElement;
  objc_storeStrong((id *)&self->_primaryElement, a3);
  -[RUITopLevelElementProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[RUITopLevelElementProvider delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topLevelElementProvider:didSetPrimaryElement:previousElement:", self, v9, v5);

  }
}

- (BOOL)hasTableView
{
  void *v2;
  BOOL v3;

  -[RUITopLevelElementProvider tableViewOM](self, "tableViewOM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isPrimaryElementNilOrKindOf:(Class)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;

  -[RUITopLevelElementProvider primaryElement](self, "primaryElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RUITopLevelElementProvider primaryElement](self, "primaryElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (id)makePasscodeViewOM
{
  RUIPasscodeView *v3;
  void *v4;
  RUIPasscodeView *v5;
  RUIPasscodeView *passcodeViewOM;
  RUIPasscodeView *v7;
  void *v8;
  RUIPasscodeView *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  if (!self->_passcodeViewOM)
  {
    v3 = [RUIPasscodeView alloc];
    -[RUITopLevelElementProvider pageElement](self, "pageElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RUIPasscodeView initWithAttributes:parent:](v3, "initWithAttributes:parent:", 0, v4);
    passcodeViewOM = self->_passcodeViewOM;
    self->_passcodeViewOM = v5;

    v7 = self->_passcodeViewOM;
    -[RUITopLevelElementProvider objectModel](self, "objectModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPasscodeView setObjectModel:](v7, "setObjectModel:", v8);

    v9 = self->_passcodeViewOM;
    -[RUITopLevelElementProvider pageElement](self, "pageElement");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "page");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPasscodeView setPage:](v9, "setPage:", v11);

    -[RUITopLevelElementProvider delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[RUITopLevelElementProvider delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "topLevelElementProvider:didCreatePasscodeView:", self, self->_passcodeViewOM);

    }
  }
  return self->_passcodeViewOM;
}

- (BOOL)hasPasscodeView
{
  return self->_passcodeViewOM != 0;
}

- (id)makeSpinnerViewOM
{
  RUISpinnerView *v3;
  void *v4;
  RUISpinnerView *v5;
  RUISpinnerView *spinnerViewOM;
  RUISpinnerView *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (!self->_spinnerViewOM)
  {
    v3 = [RUISpinnerView alloc];
    -[RUITopLevelElementProvider pageElement](self, "pageElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RUIElement initWithAttributes:parent:](v3, "initWithAttributes:parent:", 0, v4);
    spinnerViewOM = self->_spinnerViewOM;
    self->_spinnerViewOM = v5;

    v7 = self->_spinnerViewOM;
    -[RUITopLevelElementProvider objectModel](self, "objectModel");
    v8 = objc_claimAutoreleasedReturnValue();
    -[RUISpinnerView setObjectModel:](v7, "setObjectModel:", v8);

    -[RUITopLevelElementProvider delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[RUITopLevelElementProvider delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topLevelElementProvider:didCreateSpinnerView:", self, self->_spinnerViewOM);

    }
  }
  return self->_spinnerViewOM;
}

- (BOOL)hasSpinnerView
{
  return self->_spinnerViewOM != 0;
}

- (RUITopLevelPageElement)primaryElement
{
  return self->_primaryElement;
}

- (RUITableView)tableViewOM
{
  return self->_tableViewOM;
}

- (RUIWebView)webViewOM
{
  return self->_webViewOM;
}

- (RUIPasscodeView)passcodeViewOM
{
  return self->_passcodeViewOM;
}

- (RUISpinnerView)spinnerViewOM
{
  return self->_spinnerViewOM;
}

- (RUIElement)parentElement
{
  return (RUIElement *)objc_loadWeakRetained((id *)&self->_parentElement);
}

- (void)setParentElement:(id)a3
{
  objc_storeWeak((id *)&self->_parentElement, a3);
}

- (RUITopLevelElementProviderDelegate)delegate
{
  return (RUITopLevelElementProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasChoiceView
{
  return self->_hasChoiceView;
}

- (BOOL)hasMultiChoiceView
{
  return self->_hasMultiChoiceView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentElement);
  objc_storeStrong((id *)&self->_spinnerViewOM, 0);
  objc_storeStrong((id *)&self->_passcodeViewOM, 0);
  objc_storeStrong((id *)&self->_webViewOM, 0);
  objc_storeStrong((id *)&self->_tableViewOM, 0);
  objc_storeStrong((id *)&self->_primaryElement, 0);
}

@end
