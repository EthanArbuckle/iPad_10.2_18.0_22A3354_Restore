@implementation PKPaymentPreferenceSectionController

- (PKPaymentPreferenceSectionController)initWithPreference:(id)a3 style:(int64_t)a4 preferencesChangedHandler:(id)a5
{
  id v9;
  PKPaymentPreferenceSectionController *v10;
  PKPaymentPreferenceSectionController *v11;
  id *p_preference;
  void *v13;
  id handler;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *items;
  unint64_t i;
  void *v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  UICollectionViewCellRegistration *listRegistration;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  UICollectionViewCellRegistration *textFieldRegistration;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v9 = a5;
  v51.receiver = self;
  v51.super_class = (Class)PKPaymentPreferenceSectionController;
  v10 = -[PKPaymentPreferenceSectionController init](&v51, sel_init);
  v11 = v10;
  if (v10)
  {
    p_preference = (id *)&v10->_preference;
    objc_storeStrong((id *)&v10->_preference, a3);
    v13 = _Block_copy(v9);
    handler = v11->_handler;
    v11->_handler = v13;

    v11->_style = a4;
    v11->_isEditingFieldThatWasOriginallyInvalid = 0;
    -[PKPaymentPreferenceSectionController sectionIdentifier](v11, "sectionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setIdentifiers:](v11, "setIdentifiers:", v16);

    objc_msgSend(*p_preference, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setHeaderText:](v11, "setHeaderText:", v17);

    objc_msgSend(*p_preference, "footer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setFooterText:](v11, "setFooterText:", v18);

    objc_initWeak(&location, v11);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v11->_items;
    v11->_items = v19;

    for (i = 0; ; ++i)
    {
      objc_msgSend(*p_preference, "preferences");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = i < objc_msgSend(v22, "count");

      v24 = *p_preference;
      if (!v23)
        break;
      objc_msgSend(v24, "preferences");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndex:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = -[PKPaymentPreferenceSectionController newOptionItemForSubPreference:](v11, "newOptionItemForSubPreference:", v26);
      -[NSMutableArray addObject:](v11->_items, "addObject:", v27);

    }
    objc_msgSend(v24, "preferences");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v29, "isHideMyEmail") & 1) == 0)
    {
      v30 = v11->_items;
      -[PKPaymentPreferenceSectionController addPreferenceItems](v11, "addPreferenceItems");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", v31);

    }
    v32 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke;
    v48[3] = &unk_1E3E64EA8;
    objc_copyWeak(&v49, &location);
    -[PKDynamicListSectionController setTrailingSwipeActionsConfigurationProvider:](v11, "setTrailingSwipeActionsConfigurationProvider:", v48);
    aBlock[0] = v32;
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_4;
    aBlock[3] = &unk_1E3E64ED0;
    objc_copyWeak(&v47, &location);
    v33 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    listRegistration = v11->_listRegistration;
    v11->_listRegistration = (UICollectionViewCellRegistration *)v34;

    v36 = (void *)MEMORY[0x1E0DC35C8];
    v37 = objc_opt_class();
    v43[0] = v32;
    v43[1] = 3221225472;
    v43[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_5;
    v43[3] = &unk_1E3E64EF8;
    v38 = v33;
    v44 = v38;
    objc_copyWeak(&v45, &location);
    objc_msgSend(v36, "registrationWithCellClass:configurationHandler:", v37, v43);
    v39 = objc_claimAutoreleasedReturnValue();
    textFieldRegistration = v11->_textFieldRegistration;
    v11->_textFieldRegistration = (UICollectionViewCellRegistration *)v39;

    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);

    objc_destroyWeak(&location);
  }

  return v11;
}

id __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id *v26;
  id v27;
  id v28;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[15], "objectAtIndex:", objc_msgSend(v3, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_msgSend(v6, "supportsSwipeActionType:", 0);
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E0DC36C8];
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_DELETE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_2;
      v25[3] = &unk_1E3E64E80;
      v26 = v5;
      v27 = v6;
      v28 = v3;
      objc_msgSend(v10, "contextualActionWithStyle:title:handler:", 1, v11, v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

    }
    if (objc_msgSend(v6, "supportsSwipeActionType:", 1))
    {
      v13 = (void *)MEMORY[0x1E0DC36C8];
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v19 = 3221225472;
      v20 = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_3;
      v21 = &unk_1E3E64E80;
      v22 = v5;
      v23 = v6;
      v24 = v3;
      objc_msgSend(v13, "contextualActionWithStyle:title:handler:", 0, v14, &v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15, v18, v19, v20, v21);

    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteItem:forRow:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "row"));
}

uint64_t __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "editItem:forRow:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "row"));
}

void __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id *WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a2;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "defaultAccessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  LODWORD(v11) = objc_msgSend(v7, "isOptionItem");
  if ((_DWORD)v11)
  {
    if (WeakRetained)
    {
      v13 = objc_msgSend(WeakRetained[12], "selectedIndex");
      if (v13 == objc_msgSend(v15, "row"))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0DC3548]);
        objc_msgSend(v14, "setDisplayedState:", 2);
        objc_msgSend(v12, "addObject:", v14);

      }
    }
  }
  objc_msgSend(v8, "setAccessories:", v12);
  objc_msgSend(v8, "setContentConfiguration:", v9);

}

void __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, id, uint64_t, uint64_t);
  id v9;
  id WeakRetained;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void (**)(uint64_t, id, uint64_t, uint64_t))(v7 + 16);
  v9 = a2;
  v8(v7, v9, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "setDelegate:", WeakRetained);

}

- (id)sectionIdentifier
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[PKPaymentPreference title](self->_preference, "title");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("unknown");
  v4 = v2;

  return v4;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[NSMutableArray count](self->_items, "count") > a3)
  {
    v5 = -[PKPaymentPreference selectedIndex](self->_preference, "selectedIndex");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_items, "replaceObjectAtIndex:withObject:", v6, v8);
    }
    -[PKPaymentPreference setSelectedIndex:](self->_preference, "setSelectedIndex:", a3);
    -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "copy");

    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_items, "replaceObjectAtIndex:withObject:", a3, v10);
  }
}

- (id)appendNewItemForEditing
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**handler)(id, PKPaymentPreferenceSectionController *, id);

  -[PKPaymentPreferenceSectionController appendNewSubPreference](self, "appendNewSubPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaymentPreferenceSectionController newOptionItemForSubPreference:](self, "newOptionItemForSubPreference:", v3);
  -[PKPaymentPreference preferences](self->_preference, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHideMyEmail");

  if (v7)
    v8 = 2;
  else
    v8 = 1;
  -[PKPaymentPreference preferences](self->_preference, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == v8)
  {
    v10 = 0;
  }
  else
  {
    -[PKPaymentPreference preferences](self->_preference, "preferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count") - v8;

  }
  -[NSMutableArray insertObject:atIndex:](self->_items, "insertObject:atIndex:", v4, v10);
  -[PKPaymentPreferenceSectionController _updateSelectedIndexIfNeededFromNewItemIndex:](self, "_updateSelectedIndexIfNeededFromNewItemIndex:", v10);
  handler = (void (**)(id, PKPaymentPreferenceSectionController *, id))self->_handler;
  if (handler)
    handler[2](handler, self, v4);

  return v4;
}

- (void)_updateSelectedIndexIfNeededFromNewItemIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;

  if (-[PKPaymentPreference selectedIndex](self->_preference, "selectedIndex") == a3)
  {
    -[PKPaymentPreference preferences](self->_preference, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHideMyEmail");

    if (v7)
      -[PKPaymentPreference setSelectedIndex:](self->_preference, "setSelectedIndex:", a3 + 1);
  }
}

- (id)newOptionItemForSubPreference:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentPreferenceSectionController_newOptionItemForSubPreference___block_invoke;
  v7[3] = &unk_1E3E64F20;
  objc_copyWeak(&v8, &location);
  v5 = -[PKPaymentPreferenceSectionController newOptionItemForSubPreference:hasErrorHandler:](self, "newOptionItemForSubPreference:hasErrorHandler:", v4, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __70__PKPaymentPreferenceSectionController_newOptionItemForSubPreference___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_showErrorForTextField:", v3);

  return v5;
}

- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4
{
  id v6;
  id v7;
  PKPaymentPreferenceOptionListItem *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPaymentPreferenceOptionListItem initWithPreference:inSectionPreference:hasErrorHandler:]([PKPaymentPreferenceOptionListItem alloc], "initWithPreference:inSectionPreference:hasErrorHandler:", v7, self->_preference, v6);

  return v8;
}

- (id)addPreferenceItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)editedTextFieldHasError:(id)a3
{
  return 0;
}

- (BOOL)_showErrorForTextField:(id)a3
{
  return self->_isEditingFieldThatWasOriginallyInvalid
      && -[PKPaymentPreferenceSectionController editedTextFieldHasError:](self, "editedTextFieldHasError:", a3);
}

- (id)appendNewSubPreference
{
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4
{
  void *v5;

  -[PKPaymentPreferenceSectionController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditing:animated:forSectionController:", 0, 1, self);

  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3 forListCell:(id)a4
{
  self->_isEditingFieldThatWasOriginallyInvalid = -[PKPaymentPreferenceSectionController editedTextFieldHasError:](self, "editedTextFieldHasError:", a3, a4);
}

- (void)textFieldDidEndEditing:(id)a3 forListCell:(id)a4
{
  self->_isEditingFieldThatWasOriginallyInvalid = 0;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPreferenceSectionController;
  -[PKDynamicListSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v5, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellRegistrationForItem:(id)a3
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "supportsInlineEditing");
  v5 = 5;
  if (v4)
    v5 = 6;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR___PKPaymentPreferenceSectionController__preference[v5]));
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] == v9)
  {
    -[PKDynamicListSectionController configureSupplementaryRegistration:elementKind:sectionIdentifier:](&v13, sel_configureSupplementaryRegistration_elementKind_sectionIdentifier_, v8, v9, v10, v12.receiver, v12.super_class, self, PKPaymentPreferenceSectionController);
  }
  else if ((id)*MEMORY[0x1E0DC48A0] == v9)
  {
    if (-[PKPaymentPreferenceSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v10))
    {
      -[PKPaymentPreferenceSectionController configureFooterView:forSectionIdentifier:](self, "configureFooterView:forSectionIdentifier:", v8, v10);
    }
    else
    {
      -[PKPaymentPreference footer](self->_preference, "footer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[PKDynamicListSectionController configureSupplementaryRegistration:elementKind:sectionIdentifier:](&v12, sel_configureSupplementaryRegistration_elementKind_sectionIdentifier_, v8, v9, v10, self, PKPaymentPreferenceSectionController, v13.receiver, v13.super_class);
    }
  }

}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPaymentPreferenceSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v6);
  v9 = (id)*MEMORY[0x1E0DC48A0];

  if (v9 != v7 || v8 == 0)
    objc_opt_class();
  else
    -[PKPaymentPreferenceSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v11;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[PKPaymentPreferenceSectionController footerContentForSectionIdentifier:](self, "footerContentForSectionIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPaymentPreferenceSectionController footerContentForSectionIdentifier:](self, "footerContentForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_initWeak(&location, self);
      v9 = v6;
      v10 = objc_loadWeakRetained(&location);
      objc_msgSend(v10, "preference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "footerLinkActionBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __81__PKPaymentPreferenceSectionController_configureFooterView_forSectionIdentifier___block_invoke;
      v21 = &unk_1E3E64F48;
      v13 = v12;
      v22 = v13;
      +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:linkTapped:](PKTextRangeHyperlink, "hyperlinkSourcesFromApplyFooter:linkTapped:", v8, &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "edgeInsets", v18, v19, v20, v21);
      v16 = v15;
      objc_msgSend(v9, "edgeInsets");
      objc_msgSend(v9, "setEdgeInsets:", 0.0, v16, 0.0);
      objc_msgSend(v8, "footerText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v17);

      objc_msgSend(v9, "setTextAlignment:", 4);
      objc_msgSend(v9, "setSources:", v14);

      objc_destroyWeak(&location);
    }
  }

}

uint64_t __81__PKPaymentPreferenceSectionController_configureFooterView_forSectionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentPreference footer](self->_preference, "footer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPaymentPreference footerLinkRange](self->_preference, "footerLinkRange");
  if (v4)
    v7 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 1;
  if (v7)
  {
    v10 = 0;
  }
  else
  {
    v8 = v5;
    v9 = v6;
    v10 = objc_alloc_init(MEMORY[0x1E0D66B00]);
    v11 = objc_alloc_init(MEMORY[0x1E0D66B08]);
    objc_msgSend(v4, "substringWithRange:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLinkText:", v12);

    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLinks:", v13);

    objc_msgSend(v10, "setFooterText:", v4);
  }

  return v10;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_items);
  return v5;
}

- (void)didSelectItem:(id)a3
{
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void (**v8)(void);
  char v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void (**handler)(id, PKPaymentPreferenceSectionController *, id);
  void *v23;
  id v24;

  v24 = a3;
  if (objc_msgSend(v24, "isOptionItem"))
  {
    v4 = -[NSMutableArray indexOfObject:](self->_items, "indexOfObject:", v24);
    -[PKPaymentPreferenceSectionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "collectionViewIsEditingForSectionController:", self))
    {
      if ((objc_msgSend(v24, "supportsSwipeActionType:", 1) & 1) != 0)
      {

LABEL_15:
        -[PKPaymentPreferenceSectionController editItem:forRow:](self, "editItem:forRow:", v24, v4);
        goto LABEL_24;
      }
      v17 = objc_msgSend(v24, "supportsInlineEditing");

      if ((v17 & 1) != 0)
        goto LABEL_15;
    }
    else
    {

    }
    v9 = -[PKPaymentPreference isReadOnly](self->_preference, "isReadOnly");
    v7 = v24;
    if ((v9 & 1) == 0)
    {
      v10 = -[PKPaymentPreference selectedIndex](self->_preference, "selectedIndex");
      if (v4 != v10)
      {
        v18 = v10;
        if (-[PKPaymentPreferenceSectionController _preferenceIsHideMyEmail:](self, "_preferenceIsHideMyEmail:", v24))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0D66DC8]);
          if ((objc_msgSend(v19, "isAccountConfigured") & 1) == 0)
          {
            -[PKPaymentPreferenceSectionController delegate](self, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "presentHideMyEmailAlertController");

            goto LABEL_24;
          }

        }
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v20, "copy");

          -[NSMutableArray replaceObjectAtIndex:withObject:](self->_items, "replaceObjectAtIndex:withObject:", v18, v21);
        }
        v14 = (void *)objc_msgSend(v24, "copy");
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_items, "replaceObjectAtIndex:withObject:", v4, v14);
        -[PKPaymentPreference setSelectedIndex:](self->_preference, "setSelectedIndex:", v4);
        handler = (void (**)(id, PKPaymentPreferenceSectionController *, id))self->_handler;
        if (handler)
          handler[2](handler, self, v24);
        goto LABEL_23;
      }
      -[PKPaymentPreference preferences](self->_preference, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v7 = v24;
      if (v4 < v12)
      {
        -[PKPaymentPreference preferences](self->_preference, "preferences");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentPreference errorsForPreference:](self->_preference, "errorsForPreference:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if ((-[PKPaymentPreference isReadOnly](self->_preference, "isReadOnly") & 1) == 0 && v16)
          -[PKPaymentPreferenceSectionController editItem:forRow:](self, "editItem:forRow:", v24, v4);
LABEL_23:

        goto LABEL_24;
      }
    }
  }
  else
  {
    v6 = objc_msgSend(v24, "isAddItem");
    v7 = v24;
    if (v6)
    {
      objc_msgSend(v24, "handler");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

LABEL_24:
      v7 = v24;
    }
  }

}

- (BOOL)_preferenceIsHideMyEmail:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "contactPreference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHideMyEmail");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PKPaymentPreference)preference
{
  return self->_preference;
}

- (PKPaymentPreferenceSectionControllerDelegate)delegate
{
  return (PKPaymentPreferenceSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)handler
{
  return self->_handler;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (PKPaymentPreferenceSectionController)linkedSectionController
{
  return (PKPaymentPreferenceSectionController *)objc_loadWeakRetained((id *)&self->_linkedSectionController);
}

- (void)setLinkedSectionController:(id)a3
{
  objc_storeWeak((id *)&self->_linkedSectionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkedSectionController);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_textFieldRegistration, 0);
  objc_storeStrong((id *)&self->_listRegistration, 0);
}

@end
