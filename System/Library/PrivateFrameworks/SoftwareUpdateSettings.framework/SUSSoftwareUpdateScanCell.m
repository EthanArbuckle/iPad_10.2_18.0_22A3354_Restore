@implementation SUSSoftwareUpdateScanCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SUSSoftwareUpdateScanCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SUSSoftwareUpdateScanCell *v5;
  SUSSoftwareUpdateScanCell *v7;
  SUSSoftwareUpdateScanCell *v8;
  id v9;
  objc_super v11;
  id v12;
  id location;
  int64_t v14;
  SEL v15;
  SUSSoftwareUpdateScanCell *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v16;
  v16 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSSoftwareUpdateScanCell;
  v16 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, v14, location, v12);
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    -[SUSSoftwareUpdateScanCell setSelectionStyle:](v16, "setSelectionStyle:", 0);
    v8 = v16;
    v9 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    -[SUSSoftwareUpdateScanCell setBackgroundColor:](v8, "setBackgroundColor:");

    -[SUSSoftwareUpdateScanCell setHoverStyle:](v16, "setHoverStyle:", 0);
    v16->_state = -1;
  }
  v7 = v16;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v7;
}

- (void)setState:(int)a3
{
  id v3;

  if (a3 != self->_state)
  {
    self->_state = a3;
    v3 = -[SUSSoftwareUpdateScanCell contentUnavailableConfigurationForState:](self, "contentUnavailableConfigurationForState:", a3);
    -[SUSSoftwareUpdateScanCell setContentConfiguration:](self, "setContentConfiguration:");

    -[SUSSoftwareUpdateScanCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)preferredHeightWithTable:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return -1.0;
}

- (void)layoutSubviews
{
  id v3;
  objc_super v4;
  SEL v5;
  SUSSoftwareUpdateScanCell *v6;

  v6 = self;
  v5 = a2;
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  -[SUSSoftwareUpdateScanCell setSeparatorColor:](self, "setSeparatorColor:");

  v4.receiver = v6;
  v4.super_class = (Class)SUSSoftwareUpdateScanCell;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);
}

- (id)contentUnavailableConfigurationForState:(int)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int v23;
  SEL v24;
  SUSSoftwareUpdateScanCell *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = 0;
  if (a3 == 1)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BEBD4E8], "loadingConfiguration");
    v4 = v22;
    v22 = v3;

    v20 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (id)objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CHECKING_FOR_UPDATES"), &stru_24F764478, CFSTR("Software Update"));
    objc_msgSend(v22, "setText:");

  }
  else if (v23 && v23 != 5)
  {
    if (v23 == 4)
    {
      v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MANAGED_DEVICE_HIDDEN_WITHIN_DELAY"), &stru_24F764478, CFSTR("Software Update"));

      v7 = (id)objc_msgSend(MEMORY[0x24BEBD4E8], "emptyConfiguration");
      v8 = v22;
      v22 = v7;

      objc_msgSend(v22, "setText:", v25->_currentVersion);
      objc_msgSend(v22, "setSecondaryText:", v21);
      objc_storeStrong(&v21, 0);
    }
    else if (v23 == 2)
    {
      v9 = (id)objc_msgSend(MEMORY[0x24BEBD4E8], "emptyConfiguration");
      v10 = v22;
      v22 = v9;

      objc_msgSend(v22, "setText:", v25->_errorTitle);
      objc_msgSend(v22, "setSecondaryText:", v25->_errorMessage);
      if (v25->_errorPrimaryButton)
      {
        if (v25->_errorPrimaryButtonAction)
        {
          v13 = (id)objc_msgSend(v22, "button");
          objc_msgSend(v13, "setTitle:", v25->_errorPrimaryButton);

          v14 = (id)objc_msgSend(v22, "buttonProperties");
          objc_msgSend(v14, "setPrimaryAction:", v25->_errorPrimaryButtonAction);

        }
      }
    }
  }
  else
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BEBD4E8], "emptyConfiguration");
    v6 = v22;
    v22 = v5;

    objc_msgSend(v22, "setText:", v25->_currentVersion);
    if (-[SUSSoftwareUpdateScanCell updatesDeferred](v25, "updatesDeferred")
      || -[SUSSoftwareUpdateScanCell suPathsRestricted](v25, "suPathsRestricted"))
    {
      v18 = -[SUSSoftwareUpdateScanCell upToDateManagedText](v25, "upToDateManagedText");
      objc_msgSend(v22, "setSecondaryText:");

    }
    else if (v23 == 5)
    {
      v17 = -[SUSSoftwareUpdateScanCell upToDateWithAlternate](v25, "upToDateWithAlternate");
      objc_msgSend(v22, "setSecondaryText:");

    }
    else
    {
      v16 = -[SUSSoftwareUpdateScanCell upToDateText](v25, "upToDateText");
      objc_msgSend(v22, "setSecondaryText:");

    }
  }
  v12 = v22;
  objc_storeStrong(&v22, 0);
  return v12;
}

- (id)upToDateText
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UP_TO_DATE"));
  v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (id)upToDateWithAlternate
{
  id v2;
  id v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;
  id v13[3];

  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  v11 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  location = (id)objc_msgSend(v11, "systemVersion");

  if (location)
  {
    v10 = (id)objc_msgSend(location, "componentsSeparatedByString:", CFSTR("."));
    v2 = (id)objc_msgSend(v10, "firstObject");
    v3 = v13[0];
    v13[0] = v2;

  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UP_TO_DATE_WITH_ALTERNATE"));
  v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  v9 = (id)objc_msgSend(v5, "stringWithFormat:", v13[0]);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v9;
}

- (id)upToDateManagedText
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("MANAGED_DEVICE_DELAY_EXPIRED_UNAVAILABLE"));
  v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
  objc_storeStrong((id *)&self->_errorTitle, a3);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSString)errorPrimaryButton
{
  return self->_errorPrimaryButton;
}

- (void)setErrorPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_errorPrimaryButton, a3);
}

- (UIAction)errorPrimaryButtonAction
{
  return self->_errorPrimaryButtonAction;
}

- (void)setErrorPrimaryButtonAction:(id)a3
{
  objc_storeStrong((id *)&self->_errorPrimaryButtonAction, a3);
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentVersion, a3);
}

- (NSError)scanError
{
  return self->_scanError;
}

- (void)setScanError:(id)a3
{
  objc_storeStrong((id *)&self->_scanError, a3);
}

- (BOOL)updatesDeferred
{
  return self->_updatesDeferred;
}

- (void)setUpdatesDeferred:(BOOL)a3
{
  self->_updatesDeferred = a3;
}

- (BOOL)suPathsRestricted
{
  return self->_suPathsRestricted;
}

- (void)setSuPathsRestricted:(BOOL)a3
{
  self->_suPathsRestricted = a3;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanError, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_errorPrimaryButtonAction, 0);
  objc_storeStrong((id *)&self->_errorPrimaryButton, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
}

@end
