@implementation SUSSoftwareUpdateLicenseViewController

- (SUSSoftwareUpdateLicenseViewController)initWithLicense:(id)a3
{
  id v3;
  id v5;
  id v6;
  SUSSoftwareUpdateLicenseViewController *v7;
  objc_super v8;
  id location[2];
  id v10;
  SUSSoftwareUpdateLicenseViewController *v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)v10 + 127, location[0]);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)SUSSoftwareUpdateLicenseViewController;
  v7 = -[SUSSoftwareUpdateLicenseViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0);
  v10 = v7;
  objc_storeStrong(&v10, v7);
  if (v7)
  {
    v6 = (id)objc_msgSend(v10, "view");
    v5 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    objc_msgSend(v6, "setBackgroundColor:");

    v11 = (SUSSoftwareUpdateLicenseViewController *)v10;
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v11;
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  UITextView *licenseTextView;
  UITextView *v5;
  id v6;
  UITextView *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  SEL v29;
  SUSSoftwareUpdateLicenseViewController *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v30 = self;
  v29 = a2;
  v28.receiver = self;
  v28.super_class = (Class)SUSSoftwareUpdateLicenseViewController;
  -[SUSSoftwareUpdateLicenseViewController viewDidLoad](&v28, sel_viewDidLoad);
  v2 = objc_alloc(MEMORY[0x24BEBDA88]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  licenseTextView = v30->_licenseTextView;
  v30->_licenseTextView = (UITextView *)v3;

  v5 = v30->_licenseTextView;
  v6 = (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
  -[UITextView setFont:](v5, "setFont:");

  -[UITextView setContentToHTMLString:](v30->_licenseTextView, "setContentToHTMLString:", v30->_licenseTextInfo);
  v7 = v30->_licenseTextView;
  v8 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  -[UITextView setTextColor:](v7, "setTextColor:");

  -[UITextView setEditable:](v30->_licenseTextView, "setEditable:", 0);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v30->_licenseTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setAccessibilityIdentifier:](v30->_licenseTextView, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateLicenseViewControllerLicenseText"));
  v9 = (id)-[SUSSoftwareUpdateLicenseViewController view](v30, "view");
  objc_msgSend(v9, "addSubview:", v30->_licenseTextView);

  -[UITextView setContentOffset:](v30->_licenseTextView, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v10 = (id)-[SUSSoftwareUpdateLicenseViewController view](v30, "view");
  v27 = (id)objc_msgSend(v10, "safeAreaLayoutGuide");

  v11 = (id)-[SUSSoftwareUpdateLicenseViewController view](v30, "view");
  v26 = (id)objc_msgSend(v11, "layoutMarginsGuide");

  v13 = (id)-[UITextView leadingAnchor](v30->_licenseTextView, "leadingAnchor");
  v12 = (id)objc_msgSend(v26, "leadingAnchor");
  v25 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:");

  v15 = (id)-[UITextView trailingAnchor](v30->_licenseTextView, "trailingAnchor");
  v14 = (id)objc_msgSend(v26, "trailingAnchor");
  v24 = (id)objc_msgSend(v15, "constraintEqualToAnchor:constant:", 1.0);

  v17 = (id)-[UITextView topAnchor](v30->_licenseTextView, "topAnchor");
  v16 = (id)objc_msgSend(v27, "topAnchor");
  v23 = (id)objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);

  v19 = (id)objc_msgSend(v27, "bottomAnchor");
  v18 = (id)-[UITextView bottomAnchor](v30->_licenseTextView, "bottomAnchor");
  v22 = (id)objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);

  v20 = (void *)MEMORY[0x24BDD1628];
  v31[0] = v25;
  v31[1] = v24;
  v31[2] = v23;
  v31[3] = v22;
  v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  objc_msgSend(v20, "activateConstraints:");

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;
  SEL v3;
  SUSSoftwareUpdateLicenseViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSSoftwareUpdateLicenseViewController;
  -[SUSSoftwareUpdateLicenseViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)setLicenseText:(id)a3
{
  id location[2];
  SUSSoftwareUpdateLicenseViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_licenseTextInfo, location[0]);
  objc_storeStrong(location, 0);
}

- (NSString)licenseTextInfo
{
  return self->_licenseTextInfo;
}

- (void)setLicenseTextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_licenseTextInfo, a3);
}

- (UITextView)licenseTextView
{
  return self->_licenseTextView;
}

- (void)setLicenseTextView:(id)a3
{
  objc_storeStrong((id *)&self->_licenseTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_licenseTextView, 0);
  objc_storeStrong((id *)&self->_licenseTextInfo, 0);
}

@end
