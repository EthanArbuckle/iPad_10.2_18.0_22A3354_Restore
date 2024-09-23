@implementation SUWebDocumentView

- (SUWebDocumentView)initWithFrame:(CGRect)a3
{
  SUWebDocumentView *v3;
  SUWebDocumentView *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUWebDocumentView;
  v3 = -[UIWebTiledView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BDF71B8];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.super.super.isa + v5), "setFrameLoadDelegate:", v3);
    objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.isa + v5), "setPolicyDelegate:", v4);
    -[SUWebDocumentView setAutoresizes:](v4, "setAutoresizes:", 1);
    -[UIWebTiledView setTilingEnabled:](v4, "setTilingEnabled:", 0);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = (int)*MEMORY[0x24BDF71B8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setFrameLoadDelegate:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setPolicyDelegate:", 0);

  self->_stylesheet = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUWebDocumentView;
  -[UIWebTiledView dealloc](&v4, sel_dealloc);
}

- (void)setPlaintextString:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  if (a3)
    v4 = (__CFString *)a3;
  else
    v4 = &stru_24DE83F60;
  v5 = SUCreateHTMLForPlainText(v4, (uint64_t)self->_stylesheet);
  -[SUWebDocumentView loadHTMLString:baseURL:](self, "loadHTMLString:baseURL:", v5, 0);

}

- (void)setHTMLFragment:(id)a3
{
  void *v5;
  NSString *stylesheet;
  const __CFString *v7;
  id v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("<html>"));
  stylesheet = self->_stylesheet;
  v8 = v5;
  if (stylesheet)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("<head><style type=\"text/css\">%@</style></head>"), stylesheet);
    v5 = v8;
  }
  v7 = &stru_24DE83F60;
  if (a3)
    v7 = (const __CFString *)a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("<body>%@</body></html>"), v7);
  -[SUWebDocumentView loadHTMLString:baseURL:](self, "loadHTMLString:baseURL:", v8, 0);

}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  if ((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BDF71B8]), "mainFrame", a3) == a4)objc_msgSend(self->_loadDelegate, "webViewDidFinishLoading:", self);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BDFAA18]), "integerValue"))
  {
    objc_msgSend(a7, "use");
  }
  else
  {
    objc_msgSend(a7, "ignore");
    SUOpenExternalURL(objc_msgSend(a5, "URL"), +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
  }
}

- (id)loadDelegate
{
  return self->_loadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->_loadDelegate = a3;
}

- (NSString)stylesheet
{
  return self->_stylesheet;
}

- (void)setStylesheet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1504);
}

@end
