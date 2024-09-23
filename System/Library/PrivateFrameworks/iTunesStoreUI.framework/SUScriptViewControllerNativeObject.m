@implementation SUScriptViewControllerNativeObject

- (void)dealloc
{
  objc_super v3;

  -[SUUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptViewControllerNativeObject;
  -[SUScriptViewControllerNativeObject dealloc](&v3, sel_dealloc);
}

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUViewControllerParentViewControllerDidChangeNotification"), 0);
  -[SUScriptObject setVisible:](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "setVisible:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptViewControllerNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)setScriptObject:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptViewControllerNativeObject;
  -[SUScriptNativeObject setScriptObject:](&v5, sel_setScriptObject_);
  if (a3)
    objc_msgSend((id)-[SUScriptViewControllerNativeObject mainThreadProxy](self, "mainThreadProxy"), "_reloadVisibility");
}

- (void)setupNativeObject
{
  id v3;
  objc_super v4;

  v3 = -[SUScriptNativeObject object](self, "object");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__parentViewControllerChangeNotification_, CFSTR("SUViewControllerParentViewControllerDidChangeNotification"), v3);
  -[SUScriptViewControllerNativeObject _reloadVisibility](self, "_reloadVisibility");
  v4.receiver = self;
  v4.super_class = (Class)SUScriptViewControllerNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v4, sel_setupNativeObject);
}

- (void)passbookLoaderDidFinish:(id)a3
{
  SUScriptObject *i;
  SUScriptObject *v6;

  for (i = -[SUScriptNativeObject scriptObject](self, "scriptObject");
        ;
        i = -[SUScriptObject parentScriptObject](v6, "parentScriptObject"))
  {
    v6 = i;
    if (!-[SUScriptObject parentScriptObject](i, "parentScriptObject"))
      break;
  }
  if (v6)
    -[SUScriptObject dispatchEvent:forName:](v6, "dispatchEvent:forName:", 0, CFSTR("didreappear"));
  if (self->_passbookLoader == a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);

    self->_passbookLoader = 0;
  }
}

- (void)_loadPassbookPassWithURL:(id)a3
{
  SUUIPassbookLoader *passbookLoader;
  uint64_t v6;
  id v7;
  uint64_t v8;
  SUUIPassbookLoader *v9;

  passbookLoader = self->_passbookLoader;
  if (!passbookLoader)
  {
    v6 = ISUIMobileStoreUIFramework();
    v7 = ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v6);
    v8 = ISUIMobileStoreUIFramework();
    v9 = (SUUIPassbookLoader *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIPassbookLoader"), v8)), "initWithClientContext:", objc_msgSend(v7, "defaultContext"));
    self->_passbookLoader = v9;
    -[SUUIPassbookLoader setDelegate:](v9, "setDelegate:", self);
    passbookLoader = self->_passbookLoader;
  }
  -[SUUIPassbookLoader loadPassWithURL:](passbookLoader, "loadPassWithURL:", a3);
}

- (void)_reloadVisibility
{
  id v3;
  _BOOL8 v4;

  v3 = -[SUScriptNativeObject object](self, "object");
  if (objc_msgSend(v3, "parentViewController"))
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isViewLoaded"))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "view"), "window") != 0;
  }
  else
  {
    v4 = 0;
  }
  -[SUScriptObject setVisible:](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "setVisible:", v4);
}

@end
