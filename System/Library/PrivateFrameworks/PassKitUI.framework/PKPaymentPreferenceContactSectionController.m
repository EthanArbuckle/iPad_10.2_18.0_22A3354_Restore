@implementation PKPaymentPreferenceContactSectionController

- (PKPaymentPreferenceContactSectionController)initWithContactPreference:(id)a3 contactFormatValidator:(id)a4 style:(int64_t)a5 preferencesChangedHandler:(id)a6
{
  id v11;
  PKPaymentPreferenceContactSectionController *v12;
  PKPaymentPreferenceContactSectionController *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentPreferenceContactSectionController;
  v12 = -[PKPaymentPreferenceSectionController initWithPreference:style:preferencesChangedHandler:](&v15, sel_initWithPreference_style_preferencesChangedHandler_, a3, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_contactFormatValidator, a4);

  return v13;
}

- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4
{
  id v6;
  id v7;
  PKPaymentPreferenceContactOptionListItem *v8;
  void *v9;
  PKPaymentPreferenceContactOptionListItem *v10;

  v6 = a4;
  v7 = a3;
  v8 = [PKPaymentPreferenceContactOptionListItem alloc];
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentPreferenceOptionListItem initWithPreference:inSectionPreference:hasErrorHandler:](v8, "initWithPreference:inSectionPreference:hasErrorHandler:", v7, v9, v6);

  return v10;
}

- (id)addPreferenceItems
{
  PKPaymentPreferenceAddListItem *v3;
  void *v4;
  uint64_t v5;
  PKPaymentPreferenceAddListItem *v6;
  PKPaymentPreferenceAddListItem *v7;
  void *v8;
  PKPaymentPreferenceAddListItem *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = [PKPaymentPreferenceAddListItem alloc];
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke;
  v27[3] = &unk_1E3E61310;
  objc_copyWeak(&v28, &location);
  v6 = -[PKPaymentPreferenceAddListItem initWithAddPreferenceType:forSectionPreference:handler:](v3, "initWithAddPreferenceType:forSectionPreference:handler:", 0, v4, v27);

  v7 = [PKPaymentPreferenceAddListItem alloc];
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke_2;
  v25[3] = &unk_1E3E61310;
  objc_copyWeak(&v26, &location);
  v9 = -[PKPaymentPreferenceAddListItem initWithAddPreferenceType:forSectionPreference:handler:](v7, "initWithAddPreferenceType:forSectionPreference:handler:", 1, v8, v25);

  if (-[PKPaymentPreferenceSectionController style](self, "style") == 2)
  {
    PKBridgeButtonTextColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPreferenceAddListItem setButtonTextColor:](v6, "setButtonTextColor:", v10);
    -[PKPaymentPreferenceAddListItem setButtonTextColor:](v9, "setButtonTextColor:", v10);

  }
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if (v13)
  {
    v31[0] = v6;
    v14 = v31;
    v15 = 1;
  }
  else
  {
    -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contactKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {

    }
    else
    {
      -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contactKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0C966A8]);

      if (!v20)
      {
        v24.receiver = self;
        v24.super_class = (Class)PKPaymentPreferenceContactSectionController;
        -[PKPaymentPreferenceSectionController addPreferenceItems](&v24, sel_addPreferenceItems);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    v30[0] = v6;
    v30[1] = v9;
    v14 = v30;
    v15 = 2;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, v15);
  v21 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v22 = (void *)v21;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
  return v22;
}

void __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "linkedSectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_loadWeakRetained(v1);
  v12 = v5;

  objc_msgSend(v12, "contactPreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  objc_msgSend(v12, "contactDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v12, "contactPreference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showAddressPickerForPreference:inSectionController:", v11, v12);

  }
  else
  {
    objc_msgSend(v9, "startInlineEditingForContactItem:inSectionController:", 0, v12);
  }

}

void __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "linkedSectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_loadWeakRetained(v1);
  v8 = v5;

  objc_msgSend(v8, "contactDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactPreference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showContactsPickerForPreference:inSectionController:", v7, v8);

}

- (void)deleteItem:(id)a3 forRow:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;

  v19 = a3;
  if (!objc_msgSend(v19, "isOptionItem"))
    goto LABEL_14;
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceSectionController items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectAtIndex:", a4);

  objc_msgSend(v19, "preference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recentContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteRecent:", v10);

  objc_msgSend(v6, "contactKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967F0]) && !objc_msgSend(v6, "type"))
  {
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteDefaultBillingAddress:", v8);
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "contactSource") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteDefaultForContactKey:", v11);
LABEL_7:

  }
  objc_msgSend(v6, "preferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = objc_msgSend(v6, "selectedIndex");
  if (v15 >= objc_msgSend(v14, "count"))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v6, "selectedIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "removeObjectAtIndex:", a4);
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreferences:", v14);

  if (v16)
    objc_msgSend(v6, "setSelectedIndex:", objc_msgSend(v14, "indexOfObject:", v16));
  -[PKPaymentPreferenceSectionController handler](self, "handler");
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, PKPaymentPreferenceContactSectionController *, id))v18)[2](v18, self, v19);

LABEL_14:
}

- (void)editItem:(id)a3 forRow:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v6, "contactKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C967F0];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if (v10)
  {
    objc_msgSend(v7, "contactPreference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "contactSource");
    -[PKPaymentPreferenceContactSectionController contactDelegate](self, "contactDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == 1)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__PKPaymentPreferenceContactSectionController_editItem_forRow___block_invoke;
      v18[3] = &unk_1E3E61388;
      v18[4] = self;
      v19 = v7;
      objc_msgSend(v14, "presentMeCardAlertControllerWithContact:contactKey:handler:", v11, v9, v18);

    }
    else
    {
      objc_msgSend(v13, "showAddressEditorForContactItem:inSectionController:", v7, self);

    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "contactKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {

LABEL_8:
    -[PKPaymentPreferenceContactSectionController contactDelegate](self, "contactDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startInlineEditingForContactItem:inSectionController:", v7, self);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v6, "contactKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v17)
    goto LABEL_8;
LABEL_10:

}

void __63__PKPaymentPreferenceContactSectionController_editItem_forRow___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contactDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showAddressEditorForContactItem:inSectionController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (BOOL)editedTextFieldHasError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v4);
      v8 = objc_alloc(MEMORY[0x1E0C97398]);
      objc_msgSend(v7, "digits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithStringValue:", v9);

      v11 = -[PKContactFormatValidator phoneNumberIsValid:forCountryCode:](self->_contactFormatValidator, "phoneNumberIsValid:forCountryCode:", v10, 0) ^ 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C966A8]))
    {
      v11 = -[PKContactFormatValidator emailAddressIsValid:](self->_contactFormatValidator, "emailAddressIsValid:", v4) ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)appendNewSubPreference
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc_init(MEMORY[0x1E0C97200]);
  objc_msgSend(v5, "setContactSource:", 3);
  objc_msgSend(v2, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHideMyEmail");

  objc_msgSend(v2, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertObject:atIndex:", v5, objc_msgSend(v9, "count") - v8);

  objc_msgSend(v2, "setPreferences:", v4);
  return v5;
}

- (void)saveContact:(id)a3 forItem:(id)a4 withContactKey:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  if (v10)
  {
    -[PKPaymentPreferenceContactSectionController contactItems](self, "contactItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", v10);

  }
  else
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PKPaymentPreferenceContactSectionController contactPreference](self, "contactPreference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PKPaymentPreferenceContactSectionController _saveUpdatedContact:contactKey:preference:atIndex:](self, "_saveUpdatedContact:contactKey:preference:atIndex:", v22, v11, v15, v14))
  {
    v16 = 0;
    if (!v12)
      goto LABEL_14;
    goto LABEL_13;
  }
  v16 = -[PKPaymentPreferenceSectionController newOptionItemForSubPreference:](self, "newOptionItemForSubPreference:", v22);
  -[PKPaymentPreferenceSectionController items](self, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10)
  {
    objc_msgSend(v17, "replaceObjectAtIndex:withObject:", v14, v16);
  }
  else
  {
    if (objc_msgSend(v15, "selectedIndex") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PKPaymentPreferenceContactSectionController contactItems](self, "contactItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v15, "selectedIndex"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");

      objc_msgSend(v18, "replaceObjectAtIndex:withObject:", objc_msgSend(v15, "selectedIndex"), v21);
    }
    objc_msgSend(v18, "insertObject:atIndex:", v16, 0);
    objc_msgSend(v15, "setSelectedIndex:", 0);
  }

  if (v12)
LABEL_13:
    v12[2](v12, v16);
LABEL_14:

}

- (BOOL)_saveUpdatedContact:(id)a3 contactKey:(id)a4 preference:(id)a5 atIndex:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setContactSource:", objc_msgSend(v13, "contactSource"));
  }
  objc_msgSend(v12, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (!v13)
    goto LABEL_13;
  if (objc_msgSend(v13, "contactSource") != 1)
  {
    if (objc_msgSend(v13, "contactSource") == 2)
    {
      objc_msgSend(v13, "recentContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "recentContact");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "deleteRecent:", v19);

      }
      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C966A8]))
      {
        objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDefaultContactEmail:", v9);
      }
      else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C967C0]))
      {
        objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDefaultContactPhone:", v9);
      }
      else
      {
        if (objc_msgSend(v12, "type") != 1)
        {
LABEL_27:
          objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "saveContactToCoreRecents:preference:", v9, v12);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "setRecentContact:", v30);
          objc_msgSend(v16, "replaceObjectAtIndex:withObject:", a6, v9);

          goto LABEL_28;
        }
        objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDefaultShippingAddress:", v9);
      }

      goto LABEL_27;
    }
LABEL_13:
    objc_msgSend(v13, "recentContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recentContact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deleteRecent:", v23);

    }
    objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "saveContactToCoreRecents:preference:", v9, v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setContactSource:", 3);
    objc_msgSend(v9, "setRecentContact:", v25);
    if (v13)
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", a6, v9);
    else
      objc_msgSend(v16, "insertObject:atIndex:", v9, 0);

    goto LABEL_28;
  }
  if ((PKUpdateMeContact() & 1) != 0)
  {
    objc_msgSend(v16, "replaceObjectAtIndex:withObject:", a6, v9);
LABEL_28:
    v28 = 1;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "saveContactToCoreRecents:preference:", v9, v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRecentContact:", v27);
  objc_msgSend(v9, "setContactSource:", 3);
  objc_msgSend(v16, "addObject:", v9);
  if (objc_msgSend(v12, "selectedIndex") == a6)
    objc_msgSend(v12, "setSelectedIndex:", objc_msgSend(v16, "indexOfObject:", v9));

  v28 = 0;
LABEL_29:
  v31 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v12, "setPreferences:", v31);

  return v28;
}

- (PKPaymentPreferenceContactSectionControllerDelegate)contactDelegate
{
  return (PKPaymentPreferenceContactSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
}

@end
