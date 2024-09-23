@implementation SUSSoftwareUpdateReleaseNotesDetail

- (SUSSoftwareUpdateReleaseNotesDetail)init
{
  SUSSoftwareUpdateReleaseNotesDetail *v3;
  SUSSoftwareUpdateReleaseNotesDetail *v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  SEL v9;
  SUSSoftwareUpdateReleaseNotesDetail *v10;

  v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)SUSSoftwareUpdateReleaseNotesDetail;
  v10 = -[SUSSoftwareUpdateReleaseNotesDetail init](&v8, sel_init);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = v10;
    v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("ABOUT_THIS_UPDATE"));
    v5 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:");
    -[SUSSoftwareUpdateReleaseNotesDetail setTitle:](v4, "setTitle:");

  }
  v3 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v3;
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  WKWebView *webView;
  id v5;
  void *v6;
  id v7;
  id v8;
  WKWebView *v9;
  WKWebView *v10;
  WKWebView *v11;
  WKWebView *v12;
  id v13;
  WKWebView *v14;
  WKWebView *v15;
  WKWebView *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WKWebView *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  WKWebView *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  WKWebView *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  WKWebView *v41;
  objc_super v42;
  id v43[2];
  SUSSoftwareUpdateReleaseNotesDetail *v44;

  v44 = self;
  v43[1] = (id)a2;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RELEASE_NOTES_HTML_FONT"), &stru_24F764478, CFSTR("Software Update"));
  v43[0] = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("<span style=\"%@\">%@</span>"), v7, v44->_releaseNotes);

  v2 = objc_alloc(MEMORY[0x24BDFA918]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  webView = v44->_webView;
  v44->_webView = (WKWebView *)v3;

  v9 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  -[WKWebView setNavigationDelegate:](v9, "setNavigationDelegate:", v44);

  v10 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  v5 = -[WKWebView loadHTMLString:baseURL:](v10, "loadHTMLString:baseURL:", v43[0]);

  v11 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  -[WKWebView setOpaque:](v12, "setOpaque:", 0);

  v14 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  v13 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  -[WKWebView setBackgroundColor:](v14, "setBackgroundColor:");

  v15 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  -[WKWebView setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateReleaseNotesDetailReleaseNotes"));

  v17 = (id)-[SUSSoftwareUpdateReleaseNotesDetail view](v44, "view");
  v16 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  objc_msgSend(v17, "addSubview:");

  v23 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  v22 = (id)-[WKWebView topAnchor](v23, "topAnchor");
  v21 = (id)-[SUSSoftwareUpdateReleaseNotesDetail view](v44, "view");
  v20 = (id)objc_msgSend(v21, "safeAreaLayoutGuide");
  v19 = (id)objc_msgSend(v20, "topAnchor");
  v18 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  objc_msgSend(v18, "setActive:", 1);

  v29 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  v28 = (id)-[WKWebView leadingAnchor](v29, "leadingAnchor");
  v27 = (id)-[SUSSoftwareUpdateReleaseNotesDetail view](v44, "view");
  v26 = (id)objc_msgSend(v27, "safeAreaLayoutGuide");
  v25 = (id)objc_msgSend(v26, "leadingAnchor");
  v24 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
  objc_msgSend(v24, "setActive:", 1);

  v35 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  v34 = (id)-[WKWebView trailingAnchor](v35, "trailingAnchor");
  v33 = (id)-[SUSSoftwareUpdateReleaseNotesDetail view](v44, "view");
  v32 = (id)objc_msgSend(v33, "safeAreaLayoutGuide");
  v31 = (id)objc_msgSend(v32, "trailingAnchor");
  v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
  objc_msgSend(v30, "setActive:", 1);

  v41 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v44, "webView");
  v40 = (id)-[WKWebView bottomAnchor](v41, "bottomAnchor");
  v39 = (id)-[SUSSoftwareUpdateReleaseNotesDetail view](v44, "view");
  v38 = (id)objc_msgSend(v39, "safeAreaLayoutGuide");
  v37 = (id)objc_msgSend(v38, "bottomAnchor");
  v36 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  objc_msgSend(v36, "setActive:", 1);

  v42.receiver = v44;
  v42.super_class = (Class)SUSSoftwareUpdateReleaseNotesDetail;
  -[SUSSoftwareUpdateReleaseNotesDetail viewDidLoad](&v42, sel_viewDidLoad);
  objc_storeStrong(v43, 0);
}

- (id)specifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array", a2, self);
}

- (void)setReleaseNotes:(id)a3
{
  id v3;
  SUSReleaseNotesProcessor *v4;
  WKWebView *v5;
  id v6;
  id location[2];
  SUSSoftwareUpdateReleaseNotesDetail *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v8->_releaseNotes)
  {
    objc_storeStrong((id *)&v8->_releaseNotes, location[0]);
    v4 = +[SUSReleaseNotesProcessor sharedInstance](SUSReleaseNotesProcessor, "sharedInstance");
    v6 = -[SUSReleaseNotesProcessor normalizeHtmlReleaseNotes:](v4, "normalizeHtmlReleaseNotes:", v8->_releaseNotes);

    v5 = -[SUSSoftwareUpdateReleaseNotesDetail webView](v8, "webView");
    v3 = -[WKWebView loadHTMLString:baseURL:](v5, "loadHTMLString:baseURL:", v6);

    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v10;
  id v11;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  if (objc_msgSend(v11, "navigationType"))
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
  else
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v6 = (id)objc_msgSend(v11, "request");
    v5 = (id)objc_msgSend(v6, "URL");
    objc_msgSend(v7, "openURL:options:completionHandler:");

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (NSString)releaseNotes
{
  return self->_releaseNotes;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
}

@end
