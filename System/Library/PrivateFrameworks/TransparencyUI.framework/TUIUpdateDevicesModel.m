@implementation TUIUpdateDevicesModel

- (TUIUpdateDevicesModel)init
{
  TUIUpdateDevicesModel *v2;
  TUIUpdateDevicesModel *v3;
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
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TUIUpdateDevicesModel;
  v2 = -[TUIUpdateDevicesModel init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    symbolName = v2->_symbolName;
    v2->_symbolName = (NSString *)CFSTR("exclamationmark.triangle");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UPDATE_DEVICES_ERROR_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v3->_title;
    v3->_title = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UPDATE_DEVICES_ERROR_DETAIL"), &stru_251A5E438, CFSTR("Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UPDATE_DEVICES_ERROR_PRIMARY_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryButton = v3->_primaryButton;
    v3->_primaryButton = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UPDATE_DEVICES_ERROR_SECONDARY_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
    v15 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = (NSString *)v15;

    helpLinkTitle = v3->_helpLinkTitle;
    v3->_helpLinkTitle = 0;

    helpLinkURL = v3->_helpLinkURL;
    v3->_helpLinkURL = 0;

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

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
