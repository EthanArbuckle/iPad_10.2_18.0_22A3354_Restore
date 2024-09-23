@implementation PKPaymentCredentialMetadataTableController

- (PKPaymentCredentialMetadataTableController)initWithMetadata:(id)a3 setupContext:(int64_t)a4 cellStyle:(int64_t)a5
{
  id v8;
  PKPaymentCredentialMetadataTableController *v9;
  uint64_t v10;
  NSArray *metadata;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentCredentialMetadataTableController;
  v9 = -[PKPaymentCredentialMetadataTableController init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    metadata = v9->_metadata;
    v9->_metadata = (NSArray *)v10;

    v9->_setupContext = a4;
    v9->_cellStyle = a5;
  }

  return v9;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return -[NSArray count](self->_metadata, "count", a3);
}

- (id)cellForRowAtIndexPath:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *metadata;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char IsBridge;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = (objc_class *)MEMORY[0x1E0DC3D50];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStyle:reuseIdentifier:", self->_cellStyle, CFSTR("summaryCell"));
  PKProvisioningSecondaryBackgroundColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v9);

  metadata = self->_metadata;
  v11 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndex:](metadata, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  objc_msgSend(v6, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v15, "setMinimumScaleFactor:", 0.75);
  objc_msgSend(v15, "setNumberOfLines:", 2);
  objc_msgSend(v6, "setSelectionStyle:", 0);
  if (self->_cellStyle == 3)
  {
    IsBridge = PKPaymentSetupContextIsBridge();
    objc_msgSend(v6, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((IsBridge & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextColor:", v19);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFont:", v20);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextColor:", v21);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFont:", v22);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v23);

    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A90], 0, 0, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v24);

  }
  return v6;
}

- (void)willDisplayCell:(id)a3 forRowAtIndexPath:(id)a4
{
  PKPaymentSetupApplyContextAppearance(self->_setupContext, a3);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4, a5.x, a5.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E0DC36B8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v13[3] = &unk_1E3E6D5A8;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  v4 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v11[3] = &unk_1E3E6D580;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC39D0];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "menuWithTitle:children:", &stru_1E3E7D690, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

void __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
