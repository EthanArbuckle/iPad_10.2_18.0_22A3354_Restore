@implementation PKPaymentSetupAppExtensionsSectionController

- (PKPaymentSetupAppExtensionsSectionController)init
{
  char *v2;
  id v3;
  void *v4;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupAppExtensionsSectionController;
  v2 = -[PKPaymentSetupListSectionController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v3;

    __asm { FMOV            V0.2D, #28.0 }
    *(_OWORD *)(v2 + 72) = _Q0;
  }
  return (PKPaymentSetupAppExtensionsSectionController *)v2;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  double *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = (double *)self;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupAppExtensionsSectionController;
  v6 = a3;
  -[PKPaymentSetupListSectionController decoratePaymentSetListCell:forItem:](&v10, sel_decoratePaymentSetListCell_forItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageProperties", v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 += 9;
  objc_msgSend(v8, "setMaximumSize:", *v5, v5[1]);
  objc_msgSend(v8, "setReservedLayoutSize:", *v5, v5[1]);
  objc_msgSend(v8, "setCornerRadius:", 6.0);
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v7;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a3;
  objc_msgSend(v5, "plainHeaderConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v15[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PAYMENT_SETUP_APP_EXTENSION_HEADER"), 0);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  PKLocalizedPaymentString(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v10);
  objc_msgSend(v7, "setAttributedText:", v14);

  objc_msgSend(v6, "setContentConfiguration:", v7);
}

- (void)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, int);
  void *v13;
  PKPaymentSetupAppExtensionsSectionController *v14;
  id v15;

  self->_didHideLoadingIndicators = 0;
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __62__PKPaymentSetupAppExtensionsSectionController_didSelectItem___block_invoke;
  v13 = &unk_1E3E619E0;
  v14 = self;
  v9 = v5;
  v15 = v9;
  LODWORD(v5) = objc_msgSend(WeakRetained, "didSelectAppExtensionWithIdentifier:title:completion:", v7, v8, &v10);

  if ((_DWORD)v5 && !self->_didHideLoadingIndicators)
    -[PKPaymentSetupAppExtensionsSectionController _updateItemIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemIdentifier:loadingIndicatorVisibility:animated:", v9, 1, 1, v10, v11, v12, v13, v14);

}

uint64_t __62__PKPaymentSetupAppExtensionsSectionController_didSelectItem___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateItemIdentifier:loadingIndicatorVisibility:animated:", *(_QWORD *)(result + 40), 0, 1);
  return result;
}

- (void)_updateItemIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v6 = a4;
  v18 = a3;
  -[NSMutableDictionary objectForKey:](self->_keyedListItems, "objectForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "loadingIndicatorVisible") != v6)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "setLoadingIndicatorVisible:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_keyedListItems, "setObject:forKey:", v10, v18);
    -[PKPaymentSetupListSectionController items](self, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v13 = objc_msgSend(v12, "indexOfObject:", v9);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v13, v10);
    v14 = (void *)objc_msgSend(v12, "copy");
    -[PKPaymentSetupListSectionController setItems:](self, "setItems:", v14);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reloadRequiredForSectionIdentifier:animated:", v17, v5);

  }
}

- (void)hideLoadingIndicatorsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_didHideLoadingIndicators = 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_keyedListItems, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PKPaymentSetupAppExtensionsSectionController _updateItemIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemIdentifier:loadingIndicatorVisibility:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)updateWithRequirements:(unint64_t)a3 paymentSetupProductModel:(id)a4
{
  char v4;
  id v6;
  unint64_t shouldDisplay;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PKPaymentSetupAppExtensionsListItem *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  PKPaymentSetupAppExtensionsListItem *v22;
  void *v23;
  uint64_t v24;
  PKPaymentSetupAppExtensionsSectionController *v25;
  id v26;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  shouldDisplay = self->_shouldDisplay;
  if (shouldDisplay)
  {
    v8 = shouldDisplay == 1;
  }
  else if ((v4 & 0x40) != 0)
  {
    v28 = 88;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v6;
    objc_msgSend(v6, "setupProductsOfType:", 6);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        v13 = 0;
        v30 = v11;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
          objc_msgSend(v14, "productIdentifier", v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_keyedListItems, "objectForKey:", v15);
          v16 = (PKPaymentSetupAppExtensionsListItem *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_15;
          v17 = v9;
          objc_msgSend(v14, "thumbnailCachedImageForSize:completion:", 0, self->_iconSize.width, self->_iconSize.height);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = v18;
          }
          else
          {
            PKUIImageNamed(CFSTR("default_welcome_icon"));
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v21 = v20;

          v22 = [PKPaymentSetupAppExtensionsListItem alloc];
          objc_msgSend(v14, "displayName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v22, "initWithTitle:subtitle:icon:", v23, 0, v21);

          -[PKPaymentSetupListItem setIdentifier:](v16, "setIdentifier:", v15);
          -[PKPaymentSetupListItem setDisplayChevron:](v16, "setDisplayChevron:", 1);
          -[NSMutableDictionary setObject:forKey:](self->_keyedListItems, "setObject:forKey:", v16, v15);

          v9 = v17;
          v11 = v30;
          if (v16)
          {
LABEL_15:
            objc_msgSend(v9, "addObject:", v16);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

    v24 = objc_msgSend(v9, "count");
    v8 = v24 != 0;
    if (v24)
    {
      *(Class *)((char *)&self->super.super.isa + v28) = (Class)1;
      v25 = self;
      v26 = v9;
    }
    else
    {
      *(Class *)((char *)&self->super.super.isa + v28) = (Class)2;
      v26 = (id)MEMORY[0x1E0C9AA60];
      v25 = self;
    }
    -[PKPaymentSetupListSectionController setItems:](v25, "setItems:", v26, v28);

    v6 = v29;
  }
  else
  {
    -[PKPaymentSetupListSectionController setItems:](self, "setItems:", MEMORY[0x1E0C9AA60]);
    v8 = 0;
  }

  return v8;
}

- (PKPaymentSetupAppExtensionsSectionControllerDelegate)delegate
{
  return (PKPaymentSetupAppExtensionsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyedListItems, 0);
}

@end
