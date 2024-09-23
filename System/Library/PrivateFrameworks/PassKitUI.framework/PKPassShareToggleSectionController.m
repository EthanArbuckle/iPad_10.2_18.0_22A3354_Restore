@implementation PKPassShareToggleSectionController

- (PKPassShareToggleSectionController)initWithIdentifier:(id)a3 title:(id)a4 toggleValue:(BOOL)a5 isEditable:(BOOL)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  PKPassShareToggleSectionController *v17;
  void *v18;
  objc_super v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v22[0] = CFSTR("ToggleSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)PKPassShareToggleSectionController;
  v17 = -[PKPassShareSectionController initWithIdentifiers:](&v20, sel_initWithIdentifiers_, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_title, a4);
    v17->_toggleValue = a5;
    v17->_isEditable = a6;
    objc_storeWeak((id *)&v17->_delegate, v15);
    v21 = CFSTR("ToggleRow");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setItems:](v17, "setItems:", v18);

  }
  return v17;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC35C8];
  v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PKPassShareToggleSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E62748;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __62__PKPassShareToggleSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "decorateCell:forIdentifier:", v8, v6);

  }
}

- (void)decorateCell:(id)a3 forIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = v7;
  if (v7 == CFSTR("ToggleRow")
    || v7 && (v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("ToggleRow")), v8, v9))
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v11, "setOn:", self->_toggleValue);
    objc_msgSend(v11, "setEnabled:", self->_isEditable);
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_toggleValueDidChange_, 4096);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v11, 1);
    objc_msgSend(v12, "setMaintainsFixedSize:", 1);
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v13);

    objc_msgSend(v10, "setText:", self->_title);
    objc_msgSend(v10, "setImage:", self->_icon);
    objc_msgSend(v10, "imageProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    objc_msgSend(v6, "setContentConfiguration:", v10);
    objc_msgSend(v6, "setConfigurationUpdateHandler:", &__block_literal_global_6);

  }
}

void __65__PKPassShareToggleSectionController_decorateCell_forIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC34D8];
  v3 = a2;
  objc_msgSend(v2, "listGroupedCellConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setBackgroundConfiguration:", v5);
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  id v4;
  NSString **p_footerText;
  id WeakRetained;
  __CFString *v7;
  __CFString *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_footerText = &self->_footerText;
  WeakRetained = objc_loadWeakRetained((id *)p_footerText);
  if (WeakRetained)
  {
    v7 = (__CFString *)v4;
    if (v7 == CFSTR("ToggleSection"))
    {

    }
    else
    {
      v8 = v7;
      if (!v7)
      {

LABEL_9:
        WeakRetained = 0;
        goto LABEL_10;
      }
      v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("ToggleSection"));

      if (!v9)
        goto LABEL_9;
    }
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    v11 = objc_loadWeakRetained((id *)p_footerText);
    v16[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4900]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v16[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id)objc_msgSend(v10, "initWithString:attributes:", v11, v14);

  }
LABEL_10:

  return WeakRetained;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)toggleValueDidChange:(id)a3
{
  id WeakRetained;

  self->_toggleValue = objc_msgSend(a3, "isOn");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "toggle:valueDidChange:", self->_identifier, self->_toggleValue);

}

- (PKPassShareToggleSectionControllerDelegate)delegate
{
  return (PKPassShareToggleSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)footerText
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_footerText);
}

- (void)setFooterText:(id)a3
{
  objc_storeWeak((id *)&self->_footerText, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)toggleValue
{
  return self->_toggleValue;
}

- (void)setToggleValue:(BOOL)a3
{
  self->_toggleValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_footerText);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
