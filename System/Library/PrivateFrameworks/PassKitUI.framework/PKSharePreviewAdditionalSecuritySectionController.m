@implementation PKSharePreviewAdditionalSecuritySectionController

- (PKSharePreviewAdditionalSecuritySectionController)init
{

  return 0;
}

- (PKSharePreviewAdditionalSecuritySectionController)initWithInitiationContext:(id)a3 delegate:(id)a4
{
  return (PKSharePreviewAdditionalSecuritySectionController *)-[PKSharePreviewAdditionalSecuritySectionController _initWithMode:activationOptions:context:delegate:](self, "_initWithMode:activationOptions:context:delegate:", 0, 0, a3, a4);
}

- (PKSharePreviewAdditionalSecuritySectionController)initWithMode:(unint64_t)a3 activationOptions:(id)a4 delegate:(id)a5
{
  return (PKSharePreviewAdditionalSecuritySectionController *)-[PKSharePreviewAdditionalSecuritySectionController _initWithMode:activationOptions:context:delegate:](self, "_initWithMode:activationOptions:context:delegate:", a3, a4, 0, a5);
}

- (id)_initWithMode:(unint64_t)a3 activationOptions:(id)a4 context:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKSharePreviewAdditionalSecuritySectionController *v14;
  id *p_isa;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, void *);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKSharePreviewAdditionalSecuritySectionController;
  v14 = -[PKPassShareSectionController initWithIdentifiers:](&v26, sel_initWithIdentifiers_, &unk_1E3FAEAD0);
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_activationOptions, a4);
    objc_storeStrong(p_isa + 11, a5);
    objc_storeWeak(p_isa + 12, v13);
    objc_initWeak(&location, p_isa);
    v16 = (void *)MEMORY[0x1E0DC35C8];
    v17 = objc_opt_class();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __102__PKSharePreviewAdditionalSecuritySectionController__initWithMode_activationOptions_context_delegate___block_invoke;
    v23 = &unk_1E3E62748;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v16, "registrationWithCellClass:configurationHandler:", v17, &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setCellRegistration:", v18, v20, v21, v22, v23);

    objc_msgSend(p_isa, "reloadItemsAnimated:", 0);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return p_isa;
}

void __102__PKSharePreviewAdditionalSecuritySectionController__initWithMode_activationOptions_context_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forRowItem:", v9, v6);

  }
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  -[PKSharePreviewAdditionalSecuritySectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 0);
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  PKPassShareActivationOptions *activationOptions;
  PKPassShareActivationOptions *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *footerText;
  PKPassShareInitiationContext *context;
  _BOOL4 v15;
  id v16;
  PKSharePreviewRowItem *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  int v21;
  uint64_t v22;
  char v23;
  char v24;
  PKSharePreviewRowItem *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  PKSharePreviewRowItem *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  id WeakRetained;
  uint64_t v39;
  PKPassShareActivationOptions *v40;
  _BOOL4 v41;
  void *v42;

  v3 = a3;
  activationOptions = self->_activationOptions;
  if (activationOptions)
  {
    v6 = activationOptions;
LABEL_4:
    v8 = 1;
    v40 = v6;
    v9 = v40;
    goto LABEL_5;
  }
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activationOptions");
  v6 = (PKPassShareActivationOptions *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  -[PKPassShareInitiationContext availableActivationOptions](self->_context, "availableActivationOptions");
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    -[PKPaymentSetupListSectionController setItems:](self, "setItems:", MEMORY[0x1E0C9AA60]);
    return;
  }
  v9 = (void *)v39;
  v8 = 0;
  v40 = 0;
LABEL_5:
  PKPassShareActivationOptionActivationCodeTypes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "optionOfTypes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "value");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "optionsOfType:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  footerText = self->_footerText;
  self->_footerText = 0;

  context = self->_context;
  v41 = v3;
  if (context)
  {
    v15 = -[PKPassShareInitiationContext areActivationOptionsUserEditable](context, "areActivationOptionsUserEditable");
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v15)
    {
      v17 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("ActivationCodeToggleRowItem"));
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("number.circle.fill"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setIcon:](v17, "setIcon:", v18);

      if (v11)
        v19 = CFSTR("SHARE_OVERVIEW_ACTIVATION_CODE_TITLE");
      else
        v19 = CFSTR("SHARE_OVERVIEW_ACTIVATION_CODE_EXTERNAL_KEY_TITLE");
      PKLocalizedShareableCredentialString(&v19->isa);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setTitle:](v17, "setTitle:", v20);

      v21 = 1;
      if (v8)
        v22 = 1;
      else
        v22 = 2;
      -[PKSharePreviewRowItem setDisplayToggleState:](v17, "setDisplayToggleState:", v22);
      objc_msgSend(v16, "addObject:", v17);

      goto LABEL_16;
    }
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  v21 = 0;
LABEL_16:
  v23 = v8 ^ 1;
  if (v11)
    v24 = v23;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    v25 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("ActivationCodePreviewRowItem"));
    if (v21)
    {
      PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_ACTIVATION_CODE_VALUE"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("number.circle.fill"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setIcon:](v25, "setIcon:", v26);

      objc_msgSend(v11, "localizedName");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitle:](v25, "setTitle:", v27);

    -[PKSharePreviewRowItem setIsShowingSensitiveContent:](v25, "setIsShowingSensitiveContent:", 1);
    if (v42)
    {
      -[PKSharePreviewRowItem setSubtitle:](v25, "setSubtitle:");
    }
    else
    {
      PKPANMask();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setSubtitle:](v25, "setSubtitle:", v28);

    }
    objc_msgSend(v16, "addObject:", v25);

  }
  if (objc_msgSend(v12, "count"))
    v29 = v23;
  else
    v29 = 1;
  if ((v29 & 1) == 0 && v12)
  {
    v30 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("ActivationExistingKeyPreviewRowItem"));
    PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_NAME_SECONDARYKEY"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitle:](v30, "setTitle:", v31);

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("key"), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setIcon:](v30, "setIcon:", v32);

    }
    -[PKSharePreviewRowItem setIsShowingSensitiveContent:](v30, "setIsShowingSensitiveContent:", 1);
    objc_msgSend(v16, "addObject:", v30);

  }
  v33 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "localizationKeyPostfix");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("SHARE_OVERVIEW_ACTIVATION_FOOTER_%@"), v34);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(v35);
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  v37 = self->_footerText;
  self->_footerText = v36;

  -[PKPaymentSetupListSectionController setItems:](self, "setItems:", v16);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", v41);

}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v6;
  id v7;
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
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v10);

  objc_msgSend(v8, "secondaryTextProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v12);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v7, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v14);

    objc_msgSend(v8, "imageProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("number.circle.fill"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v16);

    objc_msgSend(v8, "imageProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v17);

  objc_msgSend(v6, "setContentConfiguration:", v8);
  if (self->_mode == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __81__PKSharePreviewAdditionalSecuritySectionController_decorateListCell_forRowItem___block_invoke;
  v30[3] = &unk_1E3E6C1F8;
  v19 = v18;
  v31 = v19;
  objc_msgSend(v6, "setConfigurationUpdateHandler:", v30);
  if (objc_msgSend(v7, "displayChevron"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    if (!v20)
    {
LABEL_15:
      objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
      goto LABEL_16;
    }
  }
  else
  {
    v21 = objc_msgSend(v7, "displayToggleState");
    if (!v21)
      goto LABEL_15;
    v22 = v21;
    v23 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v7, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = PKEqualObjects();

    if (v25)
      objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__activationCodeSwitchValueChanged_, 4096);
    objc_msgSend(v23, "setOn:", v22 == 1);
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v23, 1);
    objc_msgSend(v20, "setMaintainsFixedSize:", 1);

    if (!v20)
      goto LABEL_15;
  }
  v32[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessories:", v26);

LABEL_16:
  v27 = objc_msgSend(v7, "isShowingSensitiveContent");
  objc_msgSend(v6, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pkui_setExcludedFromScreenCapture:andBroadcasting:", v27, v27);

  return v8;
}

void __81__PKSharePreviewAdditionalSecuritySectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1E0DC34D8];
  v6 = a2;
  objc_msgSend(v5, "listGroupedCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  else
  {
    objc_msgSend(v7, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v6, "setBackgroundConfiguration:", v7);

}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  __CFString *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (self->_mode == 2)
    v3 = CFSTR("SHARE_OVERVIEW_ACTIVATION_CODE_VIEWING_HEADER");
  else
    v3 = CFSTR("SHARE_OVERVIEW_ACTIVATION_CODE_HEADER");
  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = v3;
  v6 = [v4 alloc];
  PKLocalizedShareableCredentialString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v10);

  return v11;
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  id v4;
  NSString *footerText;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!self->_footerText)
    return 0;
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  footerText = self->_footerText;
  v11[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4900]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithString:attributes:", footerText, v8);

  return v9;
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "deselectCells");

}

- (void)_activationCodeSwitchValueChanged:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend(a3, "isOn");
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    -[PKPassShareInitiationContext availableActivationOptions](self->_context, "availableActivationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActivationOptions:", v7);

  }
  else
  {
    objc_msgSend(v5, "setActivationOptions:", 0);
  }

  -[PKSharePreviewAdditionalSecuritySectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_activationOptions, 0);
}

@end
