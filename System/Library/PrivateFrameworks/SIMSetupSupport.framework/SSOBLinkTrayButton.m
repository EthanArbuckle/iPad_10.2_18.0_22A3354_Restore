@implementation SSOBLinkTrayButton

- (void)_showLoading
{
  void *v3;
  NSString *v4;
  NSString *normalStateTitle;
  SSSpinner *v6;
  SSSpinner *spinner;
  void *v8;
  void *v9;

  -[SSOBLinkTrayButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  normalStateTitle = self->_normalStateTitle;
  self->_normalStateTitle = v4;

  -[SSOBLinkTrayButton setTitle:forState:](self, "setTitle:forState:", CFSTR(" "), 0);
  if (!self->_spinner)
  {
    v6 = -[SSSpinner initWithText:]([SSSpinner alloc], "initWithText:", self->_normalStateTitle);
    spinner = self->_spinner;
    self->_spinner = v6;

    -[SSSpinner setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SSOBLinkTrayButton spinner](self, "spinner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSOBLinkTrayButton addSubview:](self, "addSubview:", v8);

    -[SSOBLinkTrayButton _centerActivityIndicatorInButton](self, "_centerActivityIndicatorInButton");
  }
  -[SSOBLinkTrayButton spinner](self, "spinner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimating");

  -[SSOBLinkTrayButton setEnabled:](self, "setEnabled:", 0);
}

- (void)_hideLoading
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SSOBLinkTrayButton__hideLoading__block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __34__SSOBLinkTrayButton__hideLoading__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "normalStateTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "normalStateTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:forState:", v4, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "spinner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimating");

}

- (void)_centerActivityIndicatorInButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSOBLinkTrayButton spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBLinkTrayButton centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[SSOBLinkTrayButton spinner](self, "spinner");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBLinkTrayButton centerYAnchor](self, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

}

- (SSSpinner)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSString)normalStateTitle
{
  return (NSString *)objc_getProperty(self, a2, 768, 1);
}

- (void)setNormalStateTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalStateTitle, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
