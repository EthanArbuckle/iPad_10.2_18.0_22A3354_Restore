@implementation SPUILockScreenFooterView

- (SPUILockScreenFooterView)init
{
  void *v3;
  void *v4;
  SPUILockScreenFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SPUILockScreenFooterView;
  v5 = -[NUIContainerBoxView initWithArrangedSubviews:](&v12, sel_initWithArrangedSubviews_, v4);

  if (v5)
  {
    objc_msgSend(v3, "setProminence:", 2);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v6);

    objc_msgSend(v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v3, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 2);

    objc_msgSend(v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 1);

    objc_msgSend(v3, "addTarget:action:", v5, sel_unlockButtonPressed_);
    objc_msgSend(v3, "setMinimumLayoutSize:", 44.0, 44.0);
    -[SPUILockScreenFooterView setUnlockScreenButton:](v5, "setUnlockScreenButton:", v3);
    -[SPUILockScreenFooterView setLayoutMarginsRelativeArrangement:](v5, "setLayoutMarginsRelativeArrangement:", 1);
    -[SPUILockScreenFooterView setLayoutMargins:](v5, "setLayoutMargins:", 16.0, 24.0, 16.0, 24.0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_updateTitle, *MEMORY[0x24BEBE088], 0);

    -[SPUILockScreenFooterView updateTitle](v5, "updateTitle");
  }

  return v5;
}

- (void)unlockButtonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x24BE85288], "requestDeviceUnlockWithSuccessHandler:", 0);
}

- (void)updateTitle
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOCK_SCREEN_TEXT"), &stru_24F9D6A70, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUILockScreenFooterView unlockScreenButton](self, "unlockScreenButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (TLKTextButton)unlockScreenButton
{
  return (TLKTextButton *)objc_getProperty(self, a2, 672, 1);
}

- (void)setUnlockScreenButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockScreenButton, 0);
}

@end
