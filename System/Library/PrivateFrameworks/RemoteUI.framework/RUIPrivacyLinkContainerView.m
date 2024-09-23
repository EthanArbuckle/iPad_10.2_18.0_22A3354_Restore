@implementation RUIPrivacyLinkContainerView

- (RUIPrivacyLinkContainerView)initWithAttributes:(id)a3
{
  id v5;
  RUIPrivacyLinkContainerView *v6;
  RUIPrivacyLinkContainerView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RUIPrivacyLinkContainerView;
  v6 = -[RUIPrivacyLinkContainerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributes, a3);

  return v7;
}

- (id)_viewController
{
  RUIPrivacyLinkContainerView *v2;
  uint64_t v3;

  v2 = self;
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[RUIPrivacyLinkContainerView nextResponder](v2, "nextResponder");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (RUIPrivacyLinkContainerView *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)didMoveToWindow
{
  id v3;

  -[OBPrivacyLinkController removeFromParentViewController](self->_linkController, "removeFromParentViewController");
  -[RUIPrivacyLinkContainerView _viewController](self, "_viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addChildViewController:", self->_linkController);
  -[OBPrivacyLinkController didMoveToParentViewController:](self->_linkController, "didMoveToParentViewController:", v3);

}

- (void)configureInPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  OBPrivacyLinkController *v8;
  OBPrivacyLinkController *linkController;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[6];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  if (v33)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("privacyBundleIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("privacyBundleIdentifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(", "));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0;
      v36 = &v35;
      v37 = 0x2050000000;
      v6 = (void *)getOBPrivacyLinkControllerClass_softClass;
      v38 = getOBPrivacyLinkControllerClass_softClass;
      if (!getOBPrivacyLinkControllerClass_softClass)
      {
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __getOBPrivacyLinkControllerClass_block_invoke;
        v34[3] = &unk_24C297758;
        v34[4] = &v35;
        __getOBPrivacyLinkControllerClass_block_invoke((uint64_t)v34);
        v6 = (void *)v36[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v35, 8);
      objc_msgSend(v7, "linkWithBundleIdentifiers:", v32);
      v8 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue();
      linkController = self->_linkController;
      self->_linkController = v8;

      -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("hidePrivacyIcon"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
      {
        -[OBPrivacyLinkController setDisplayIcon:](self->_linkController, "setDisplayIcon:", 0);
        -[OBPrivacyLinkController setDisplayCaptionText:](self->_linkController, "setDisplayCaptionText:", 0);
      }
      -[OBPrivacyLinkController view](self->_linkController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPrivacyLinkContainerView addSubview:](self, "addSubview:", v12);

      -[OBPrivacyLinkController view](self->_linkController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v24 = (void *)MEMORY[0x24BDD1628];
      -[OBPrivacyLinkController view](self->_linkController, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPrivacyLinkContainerView topAnchor](self, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 10.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v28;
      -[OBPrivacyLinkController view](self->_linkController, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPrivacyLinkContainerView bottomAnchor](self, "bottomAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -10.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v14;
      -[OBPrivacyLinkController view](self->_linkController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPrivacyLinkContainerView leadingAnchor](self, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v18;
      -[OBPrivacyLinkController view](self->_linkController, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPrivacyLinkContainerView trailingAnchor](self, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateConstraints:", v23);

    }
  }

}

- (double)footerHeightForWidth:(double)a3 inView:(id)a4
{
  double v4;
  double v5;
  double v6;

  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[RUIPrivacyLinkContainerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, a3, *(double *)(MEMORY[0x24BEBE588] + 8), v4, v5);
  return v6;
}

- (OBPrivacyLinkController)linkController
{
  return (OBPrivacyLinkController *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkController, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
