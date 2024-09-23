@implementation TUIWelcomeSplashScreenModel

- (TUIWelcomeSplashScreenModel)init
{
  TUIWelcomeSplashScreenModel *v2;
  TUIWelcomeSplashScreenModel *v3;
  NSString *symbolName;
  void *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  NSString *detailText;
  void *v11;
  uint64_t v12;
  NSString *primaryButton;
  void *v14;
  uint64_t v15;
  NSString *secondaryButton;
  void *v17;
  uint64_t v18;
  NSString *helpLinkTitle;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TUIWelcomeSplashScreenModel;
  v2 = -[TUIWelcomeSplashScreenModel init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    symbolName = v2->_symbolName;
    v2->_symbolName = (NSString *)CFSTR("person.crop.circle.badge.checkmark");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_SPECIFIER_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v3->_title;
    v3->_title = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_WELCOME_FOOTER"), &stru_251A5E438, CFSTR("Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_251A5E438, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryButton = v3->_primaryButton;
    v3->_primaryButton = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SETUP_LATER"), &stru_251A5E438, CFSTR("Localizable"));
    v15 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = (NSString *)v15;

    objc_storeStrong((id *)&v3->_helpLinkURL, CFSTR("https://support.apple.com/ht213465"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v3->_helpLinkTitle;
    v3->_helpLinkTitle = (NSString *)v18;

  }
  return v3;
}

- (id)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
