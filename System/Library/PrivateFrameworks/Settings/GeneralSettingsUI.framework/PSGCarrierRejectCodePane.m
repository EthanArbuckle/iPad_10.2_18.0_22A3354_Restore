@implementation PSGCarrierRejectCodePane

- (void)setPreferenceSpecifier:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSGCarrierRejectCodePane;
  -[PSEditingPane setPreferenceSpecifier:](&v11, sel_setPreferenceSpecifier_, a3);
  -[PSEditingPane preferenceSpecifier](self, "preferenceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("CauseCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  switch(v6)
  {
    case 6:
      PSG_BundleForGeneralSettingsUIFramework();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("REGISTRATION_CAUSE_CODE_6");
      goto LABEL_7;
    case 3:
      PSG_BundleForGeneralSettingsUIFramework();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("REGISTRATION_CAUSE_CODE_3");
      goto LABEL_7;
    case 2:
      PSG_BundleForGeneralSettingsUIFramework();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("REGISTRATION_CAUSE_CODE_2");
LABEL_7:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24F9C95C8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_rejectMessage, "setText:", v10);

      return;
  }
  -[UILabel setText:](self->_rejectMessage, "setText:", 0);
}

- (void)layoutSubviews
{
  -[UILabel frame](self->_rejectMessage, "frame");
  -[UILabel setFrame:](self->_rejectMessage, "setFrame:", 19.0, 100.0);
  -[UILabel sizeToFit](self->_rejectMessage, "sizeToFit");
}

- (PSGCarrierRejectCodePane)initWithFrame:(CGRect)a3
{
  PSGCarrierRejectCodePane *v3;
  id v4;
  uint64_t v5;
  UILabel *rejectMessage;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSGCarrierRejectCodePane;
  v3 = -[PSEditingPane initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    rejectMessage = v3->_rejectMessage;
    v3->_rejectMessage = (UILabel *)v5;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_rejectMessage, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_rejectMessage, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_rejectMessage, "setTextColor:", v9);

    -[PSGCarrierRejectCodePane addSubview:](v3, "addSubview:", v3->_rejectMessage);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectMessage, 0);
}

@end
