@implementation WBSWebExtensionTabPosition

- (WBSWebExtensionTabPosition)initWithTab:(id)a3
{
  id v4;
  WBSWebExtensionTabPosition *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  WBSWebExtensionTabPosition *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSWebExtensionTabPosition;
  v5 = -[WBSWebExtensionTabPosition init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "webExtensionWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "idForWebExtensions");
      v5->_windowID = v8;
      objc_msgSend(v7, "webExtensionTabs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_index = objc_msgSend(v9, "indexOfObject:", v4);

    }
    else
    {
      v5->_windowID = -1.0;
      v5->_index = 0;
    }
    v10 = v5;

  }
  return v5;
}

- (double)windowID
{
  return self->_windowID;
}

- (unint64_t)index
{
  return self->_index;
}

@end
