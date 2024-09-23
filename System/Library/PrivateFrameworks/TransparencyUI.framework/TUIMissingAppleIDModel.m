@implementation TUIMissingAppleIDModel

- (TUIMissingAppleIDModel)init
{
  return -[TUIMissingAppleIDModel initWithFlow:](self, "initWithFlow:", 0);
}

- (TUIMissingAppleIDModel)initWithFlow:(unint64_t)a3
{
  TUIMissingAppleIDModel *v4;
  TUIMissingAppleIDModel *v5;
  NSString *symbolName;
  void *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSString *detailText;
  void *v15;
  uint64_t v16;
  NSString *primaryButton;
  void *v18;
  uint64_t v19;
  NSString *secondaryButton;
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TUIMissingAppleIDModel;
  v4 = -[TUIMissingAppleIDModel init](&v24, sel_init);
  v5 = v4;
  if (v4)
  {
    symbolName = v4->_symbolName;
    v4->_symbolName = (NSString *)CFSTR("bubble.left.and.bubble.right");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MISSING_APPLEID_ERROR_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 2)
    {
      v11 = v10;
      v12 = CFSTR("MISSING_APPLEID_OPTOUT_ERROR_DETAIL");
    }
    else
    {
      v11 = v10;
      v12 = CFSTR("MISSING_APPLEID_OPTIN_ERROR_DETAIL");
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_251A5E438, CFSTR("Localizable"));
    v13 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MISSING_APPLEID_ERROR_PRIMARY_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
    v16 = objc_claimAutoreleasedReturnValue();
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SETUP_LATER"), &stru_251A5E438, CFSTR("Localizable"));
    v19 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v19;

    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = 0;

    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = 0;

  }
  return v5;
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
