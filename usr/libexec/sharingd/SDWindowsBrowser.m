@implementation SDWindowsBrowser

- (SDWindowsBrowser)initWithWorkgroup:(id)a3
{
  id v5;
  SDWindowsBrowser *v6;
  SDWindowsBrowser *v7;
  SDBonjourBrowser *browser;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SDWindowsBrowser;
  v6 = -[SDWindowsBrowser init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    browser = v6->_browser;
    v6->_browser = 0;

    objc_storeStrong((id *)&v7->_workgroup, a3);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SDWindowsBrowser stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDWindowsBrowser;
  -[SDWindowsBrowser dealloc](&v3, "dealloc");
}

- (NSArray)nodes
{
  return -[SDBonjourBrowser nodes](self->_browser, "nodes");
}

- (void)bonjourNodesDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "windowsNodesDidChange:", self);

}

- (void)start
{
  SDBonjourBrowser *v3;
  NSString *workgroup;
  void *v5;
  SDBonjourBrowser *v6;
  SDBonjourBrowser *browser;
  const __CFString *v8;

  if (!self->_browser)
  {
    v3 = [SDBonjourBrowser alloc];
    workgroup = self->_workgroup;
    v8 = CFSTR("_netbios._udp.");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    v6 = -[SDBonjourBrowser initWithDomain:types:](v3, "initWithDomain:types:", workgroup, v5);
    browser = self->_browser;
    self->_browser = v6;

    -[SDBonjourBrowser setDelegate:](self->_browser, "setDelegate:", self);
    -[SDBonjourBrowser start](self->_browser, "start");
  }
}

- (void)stop
{
  SDBonjourBrowser *browser;
  SDBonjourBrowser *v4;

  browser = self->_browser;
  if (browser)
  {
    -[SDBonjourBrowser setDelegate:](browser, "setDelegate:", 0);
    -[SDBonjourBrowser invalidate](self->_browser, "invalidate");
    v4 = self->_browser;
    self->_browser = 0;

  }
}

- (NSString)workgroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SDWindowsBrowserDelegate)delegate
{
  return (SDWindowsBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workgroup, 0);
  objc_storeStrong((id *)&self->_browser, 0);
}

@end
