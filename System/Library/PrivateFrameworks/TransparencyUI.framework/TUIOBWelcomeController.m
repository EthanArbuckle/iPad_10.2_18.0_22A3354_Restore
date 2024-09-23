@implementation TUIOBWelcomeController

- (TUIOBWelcomeController)initWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TUIOBWelcomeController *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)TUIOBWelcomeController;
  v8 = -[TUIOBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v10, sel_initWithTitle_detailText_symbolName_contentLayout_, v5, v6, v7, objc_msgSend(v4, "contentViewLayout"));

  if (v8)
  {
    -[TUIOBWelcomeController _addContentViewWithViewModel:](v8, "_addContentViewWithViewModel:", v4);
    -[TUIOBWelcomeController _addPrimaryButtonWithViewModel:](v8, "_addPrimaryButtonWithViewModel:", v4);
    -[TUIOBWelcomeController _addSecondaryButtonWithViewModel:](v8, "_addSecondaryButtonWithViewModel:", v4);
    -[TUIOBWelcomeController _addHelpLinkButtonWithViewModel:](v8, "_addHelpLinkButtonWithViewModel:", v4);
  }

  return v8;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIOBWelcomeController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[TUIOBWelcomeController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (void)_addContentViewWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOBWelcomeController addChildViewController:](self, "addChildViewController:", v6);

    objc_msgSend(v4, "contentViewController");
    v29 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIOBWelcomeController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    v21 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOBWelcomeController contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    objc_msgSend(v8, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOBWelcomeController contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v20;
    objc_msgSend(v8, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOBWelcomeController contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v12;
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOBWelcomeController contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v17);

    v4 = v29;
    objc_msgSend(v29, "contentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didMoveToParentViewController:", self);

  }
}

- (void)_addPrimaryButtonWithViewModel:(id)a3
{
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *primaryButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    v7 = self->_primaryButton;
    objc_msgSend(v10, "primaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    -[TUIOBWelcomeController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", self->_primaryButton);

  }
}

- (void)_addSecondaryButtonWithViewModel:(id)a3
{
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *secondaryButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "secondaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    v7 = self->_secondaryButton;
    objc_msgSend(v10, "secondaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    -[TUIOBWelcomeController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", self->_secondaryButton);

  }
}

- (void)_addHelpLinkButtonWithViewModel:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *helpLinkURL;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "helpLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "helpLinkURL");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    helpLinkURL = self->_helpLinkURL;
    self->_helpLinkURL = v5;

    objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "helpLinkTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);

    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__openHelpLink, 64);
    -[TUIOBWelcomeController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAccessoryButton:", v7);

  }
}

- (void)_openHelpLink
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_helpLinkURL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "openURL:options:completionHandler:", v2, MEMORY[0x24BDBD1B8], 0);

}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_storeStrong((id *)&self->_helpLinkURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end
