@implementation WSNanoWebSheetDetailViewController

- (WSNanoWebSheetDetailViewController)initWithURL:(id)a3 ssid:(id)a4 isSecure:(BOOL)a5 hasEVCert:(BOOL)a6
{
  id v11;
  id v12;
  WSNanoWebSheetDetailViewController *v13;
  WSNanoWebSheetDetailViewController *v14;
  WSNanoWebSheetDetailViewController *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WSNanoWebSheetDetailViewController;
  v13 = -[WSNanoWebSheetDetailViewController init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v14->_ssid, a4);
    v14->_isSecure = a5;
    v14->_hasEVCert = a6;
    v15 = v14;
  }

  return v14;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (void)loadView
{
  WSNanoWebSheetDetailView *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WSNanoWebSheetDetailViewController;
  -[WSNanoWebSheetDetailViewController loadView](&v5, sel_loadView);
  v3 = -[WSNanoWebSheetDetailView initWithURL:ssid:isSecure:hasEVCert:]([WSNanoWebSheetDetailView alloc], "initWithURL:ssid:isSecure:hasEVCert:", self->_url, self->_ssid, self->_isSecure, self->_hasEVCert);
  -[WSNanoWebSheetDetailViewController setView:](self, "setView:", v3);

  GetLocalizedString((uint64_t)"Log In");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSNanoWebSheetDetailViewController setTitle:](self, "setTitle:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WSNanoWebSheetDetailViewController;
  -[WSNanoWebSheetDetailViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
