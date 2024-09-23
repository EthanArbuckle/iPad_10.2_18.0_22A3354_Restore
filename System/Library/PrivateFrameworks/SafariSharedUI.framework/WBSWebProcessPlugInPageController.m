@implementation WBSWebProcessPlugInPageController

- (WKWebProcessPlugInBrowserContextController)browserContextController
{
  return self->_browserContextController;
}

- (WBSWebProcessPlugIn)webProcessPlugIn
{
  return self->_webProcessPlugIn;
}

- (WBSWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v7;
  id v8;
  WBSWebProcessPlugInPageController *v9;
  WBSWebProcessPlugInPageController *v10;
  WBSWebProcessPlugInPageController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSWebProcessPlugInPageController;
  v9 = -[WBSWebProcessPlugInPageController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webProcessPlugIn, a3);
    objc_storeStrong((id *)&v10->_browserContextController, a4);
    -[WKWebProcessPlugInBrowserContextController setLoadDelegate:](v10->_browserContextController, "setLoadDelegate:", v10);
    v11 = v10;
  }

  return v10;
}

- (WBSWebProcessPlugInPageController)init
{

  return 0;
}

- (void)willDestroyBrowserContextController:(id)a3
{
  WKWebProcessPlugInBrowserContextController *browserContextController;

  -[WKWebProcessPlugInBrowserContextController setLoadDelegate:](self->_browserContextController, "setLoadDelegate:", 0);
  browserContextController = self->_browserContextController;
  self->_browserContextController = 0;

}

- (WKWebProcessPlugInFrame)mainFrame
{
  return (WKWebProcessPlugInFrame *)-[WKWebProcessPlugInBrowserContextController mainFrame](self->_browserContextController, "mainFrame");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessPlugIn, 0);
  objc_storeStrong((id *)&self->_browserContextController, 0);
}

@end
