@implementation PKAddressEditorViewController

- (PKAddressEditorViewController)initWithContact:(id)a3 style:(int64_t)a4
{
  id v6;
  PKAddressEditorViewController *v7;
  uint64_t v8;
  NSString *originalGivenName;
  uint64_t v10;
  NSString *originalFamilyName;
  uint64_t v12;
  NSString *givenName;
  uint64_t v14;
  NSString *familyName;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *originalPhoneticGivenName;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *originalPhoneticFamilyName;
  uint64_t v24;
  NSString *phoneticGivenName;
  uint64_t v26;
  NSString *phoneticFamilyName;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  CNMutablePostalAddress *originalAddress;
  void *v39;
  uint64_t v40;
  CNMutablePostalAddress *inputAddress;
  uint64_t v42;
  NSString *inputLabel;
  CNMutablePostalAddress *v44;
  CNMutablePostalAddress *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  CNMutablePostalAddress *v51;
  uint64_t v52;
  NSString *originalCountry;
  CNMutablePostalAddress *v54;
  void *v55;
  CNMutablePostalAddress *v56;
  void *v57;
  MKLocalSearchCompleter *v58;
  MKLocalSearchCompleter *searchCompleter;
  uint64_t v60;
  BOOL v61;
  NSArray *highlightedFieldKeys;
  NSArray *v63;
  NSArray *requiredFieldKeys;
  id v65;
  void *v66;
  void *v67;
  void *v68;

  v6 = a3;
  v7 = -[PKAddressEditorViewController initWithStyle:](self, "initWithStyle:", 0);
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "givenName");
      v8 = objc_claimAutoreleasedReturnValue();
      originalGivenName = v7->_originalGivenName;
      v7->_originalGivenName = (NSString *)v8;

      objc_msgSend(v6, "familyName");
      v10 = objc_claimAutoreleasedReturnValue();
      originalFamilyName = v7->_originalFamilyName;
      v7->_originalFamilyName = (NSString *)v10;

      v12 = -[NSString copy](v7->_originalGivenName, "copy");
      givenName = v7->_givenName;
      v7->_givenName = (NSString *)v12;

      v14 = -[NSString copy](v7->_originalFamilyName, "copy");
      familyName = v7->_familyName;
      v7->_familyName = (NSString *)v14;

      objc_msgSend(v6, "nameComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "phoneticRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "givenName");
      v18 = objc_claimAutoreleasedReturnValue();
      originalPhoneticGivenName = v7->_originalPhoneticGivenName;
      v7->_originalPhoneticGivenName = (NSString *)v18;

      objc_msgSend(v6, "nameComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "phoneticRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "familyName");
      v22 = objc_claimAutoreleasedReturnValue();
      originalPhoneticFamilyName = v7->_originalPhoneticFamilyName;
      v7->_originalPhoneticFamilyName = (NSString *)v22;

      v24 = -[NSString copy](v7->_originalPhoneticGivenName, "copy");
      phoneticGivenName = v7->_phoneticGivenName;
      v7->_phoneticGivenName = (NSString *)v24;

      v26 = -[NSString copy](v7->_originalPhoneticFamilyName, "copy");
      phoneticFamilyName = v7->_phoneticFamilyName;
      v7->_phoneticFamilyName = (NSString *)v26;

      v28 = (void *)MEMORY[0x1E0C97218];
      v29 = objc_alloc_init(MEMORY[0x1E0C97200]);
      v7->_displayGivenNameFirst = objc_msgSend(v28, "nameOrderForContact:", v29) == 1;

    }
    objc_msgSend(v6, "postalAddresses");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      objc_msgSend(v6, "postalAddresses");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "postalAddresses");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "value");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "mutableCopy");
      originalAddress = v7->_originalAddress;
      v7->_originalAddress = (CNMutablePostalAddress *)v37;

      objc_msgSend(v33, "value");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "mutableCopy");
      inputAddress = v7->_inputAddress;
      v7->_inputAddress = (CNMutablePostalAddress *)v40;

      objc_msgSend(v33, "label");
      v42 = objc_claimAutoreleasedReturnValue();
      inputLabel = v7->_inputLabel;
      v7->_inputLabel = (NSString *)v42;

    }
    else
    {
      v44 = (CNMutablePostalAddress *)objc_alloc_init(MEMORY[0x1E0C97378]);
      v45 = v7->_inputAddress;
      v7->_inputAddress = v44;

    }
    if (!-[NSString length](v7->_inputLabel, "length"))
      objc_storeStrong((id *)&v7->_inputLabel, (id)*MEMORY[0x1E0C96FF8]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutablePostalAddress ISOCountryCode](v7->_inputAddress, "ISOCountryCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "length");

    if (v48 == 2)
      -[CNMutablePostalAddress ISOCountryCode](v7->_inputAddress, "ISOCountryCode");
    else
      PKCurrentRegion();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "displayNameForKey:value:", *MEMORY[0x1E0C997B0], v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v7->_originalAddress;
    if (v51)
    {
      -[CNMutablePostalAddress country](v51, "country");
      v52 = objc_claimAutoreleasedReturnValue();
      originalCountry = v7->_originalCountry;
      v7->_originalCountry = (NSString *)v52;

      v54 = v7->_originalAddress;
      v55 = (void *)objc_msgSend(v50, "copy");
      -[CNMutablePostalAddress setCountry:](v54, "setCountry:", v55);

      v56 = v7->_originalAddress;
      v57 = (void *)objc_msgSend(v49, "copy");
      -[CNMutablePostalAddress setISOCountryCode:](v56, "setISOCountryCode:", v57);

    }
    -[CNMutablePostalAddress setCountry:](v7->_inputAddress, "setCountry:", v50);
    -[CNMutablePostalAddress setISOCountryCode:](v7->_inputAddress, "setISOCountryCode:", v49);
    v58 = (MKLocalSearchCompleter *)objc_alloc_init(MEMORY[0x1E0CC17F8]);
    searchCompleter = v7->_searchCompleter;
    v7->_searchCompleter = v58;

    -[MKLocalSearchCompleter setDelegate:](v7->_searchCompleter, "setDelegate:", v7);
    -[MKLocalSearchCompleter setResultTypes:](v7->_searchCompleter, "setResultTypes:", 2);
    v60 = -[NSString length](v7->_givenName, "length");
    v61 = 1;
    if (!v60)
      v61 = -[NSString length](v7->_familyName, "length") != 0;
    v7->_preselectedNameField = v61;
    highlightedFieldKeys = v7->_highlightedFieldKeys;
    v63 = (NSArray *)MEMORY[0x1E0C9AA60];
    v7->_highlightedFieldKeys = (NSArray *)MEMORY[0x1E0C9AA60];

    requiredFieldKeys = v7->_requiredFieldKeys;
    v7->_requiredFieldKeys = v63;

    v7->_style = a4;
    v7->_countryIsEditable = 1;
    v7->_isEditingBlankField = 0;
    v65 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("DONE"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v65, "initWithTitle:style:target:action:", v66, 2, v7, sel_donePressed);

    -[PKAddressEditorViewController navigationItem](v7, "navigationItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setRightBarButtonItem:", v67);

    -[PKAddressEditorViewController recomputeEditingFields](v7, "recomputeEditingFields");
  }

  return v7;
}

- (PKAddressEditorViewController)initWithContact:(id)a3 requiredKeys:(id)a4 highlightedKeys:(id)a5 errors:(id)a6 style:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  PKAddressEditorViewController *v15;
  uint64_t v16;
  NSArray *highlightedFieldKeys;
  uint64_t v18;
  NSArray *requiredFieldKeys;
  uint64_t v20;
  NSArray *errors;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[PKAddressEditorViewController initWithContact:style:](self, "initWithContact:style:", a3, a7);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    highlightedFieldKeys = v15->_highlightedFieldKeys;
    v15->_highlightedFieldKeys = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    requiredFieldKeys = v15->_requiredFieldKeys;
    v15->_requiredFieldKeys = (NSArray *)v18;

    v15->_displayPhoneticName = -[NSArray containsObject:](v15->_requiredFieldKeys, "containsObject:", *MEMORY[0x1E0D69BE8]);
    v20 = objc_msgSend(v14, "copy");
    errors = v15->_errors;
    v15->_errors = (NSArray *)v20;

    -[PKAddressEditorViewController recomputeEditingFields](v15, "recomputeEditingFields");
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddressEditorViewController;
  -[PKAddressEditorViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKAddressEditorViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 0);
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67880]);
  -[PKAddressEditorViewController _validateAddressRequirements](self, "_validateAddressRequirements");

}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAddressEditorViewController;
  -[PKAddressEditorViewController willMoveToParentViewController:](&v9, sel_willMoveToParentViewController_, a3);
  -[PKAddressEditorViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    -[PKAddressEditorViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:animated:", v7, 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAddressEditorViewController;
  -[PKAddressEditorViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PKAddressEditorViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  -[PKAddressEditorViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endUpdates");

  -[PKAddressEditorViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  -[PKAddressEditorViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)viewDidAppear:(BOOL)a3
{
  PKAddressTextField *previouslySelectedField;
  PKAddressTextField *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddressEditorViewController;
  -[PKAddressEditorViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_presentedCountrySelector)
  {
    self->_presentedCountrySelector = 0;
    previouslySelectedField = self->_previouslySelectedField;
    if (previouslySelectedField)
    {
      v5 = previouslySelectedField;
    }
    else
    {
      v5 = self->_firstTextFieldForName;
      if (!v5)
        return;
    }
    -[PKAddressTextField becomeFirstResponder](v5, "becomeFirstResponder");
    -[PKAddressTextField resignFirstResponder](v5, "resignFirstResponder");

  }
  else if (!self->_preselectedNameField && !self->_readOnly)
  {
    -[PKAddressTextField becomeFirstResponder](self->_firstTextFieldForName, "becomeFirstResponder");
    self->_preselectedNameField = 1;
  }
}

- (void)donePressed
{
  void *v3;
  id v4;
  NSString *givenName;
  NSString *familyName;
  id v7;
  NSString *phoneticGivenName;
  NSString *phoneticFamilyName;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_requirementsMet)
  {
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", self->_inputLabel, self->_inputAddress);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    if (-[NSString length](self->_givenName, "length"))
      givenName = self->_givenName;
    else
      givenName = 0;
    objc_msgSend(v4, "setGivenName:", givenName);
    if (-[NSString length](self->_familyName, "length"))
      familyName = self->_familyName;
    else
      familyName = 0;
    objc_msgSend(v4, "setFamilyName:", familyName);
    if (-[NSString length](self->_phoneticGivenName, "length")
      || -[NSString length](self->_phoneticFamilyName, "length"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      if (-[NSString length](self->_phoneticGivenName, "length"))
        phoneticGivenName = self->_phoneticGivenName;
      else
        phoneticGivenName = 0;
      objc_msgSend(v7, "setGivenName:", phoneticGivenName);
      if (-[NSString length](self->_phoneticFamilyName, "length"))
        phoneticFamilyName = self->_phoneticFamilyName;
      else
        phoneticFamilyName = 0;
      objc_msgSend(v7, "setFamilyName:", phoneticFamilyName);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "setPhoneticRepresentation:", v7);
    v10 = (void *)MEMORY[0x1E0C97200];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkContactWithNameComponents:postalAddresses:emailAddresses:phoneNumbers:", v4, v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAddressEditorViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addressEditorViewController:selectedContact:", self, v12);

  }
}

- (void)cancel
{
  id v3;

  -[PKAddressEditorViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressEditorViewControllerDidCancel:", self);

}

- (void)recomputeEditingFields
{
  void *v3;
  void *v4;
  void *v5;
  CNPostalAddressFormattingSpecification *v6;
  CNPostalAddressFormattingSpecification *addressFormatter;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CNMutablePostalAddress *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  CNMutablePostalAddress *v33;
  void *v34;
  void *v35;
  CNMutablePostalAddress *inputAddress;
  CNMutablePostalAddress *v37;
  NSArray *v38;
  NSArray *editingFields;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C973B0];
  -[CNMutablePostalAddress ISOCountryCode](self->_inputAddress, "ISOCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specificationForCountry:", v5);
  v6 = (CNPostalAddressFormattingSpecification *)objc_claimAutoreleasedReturnValue();
  addressFormatter = self->_addressFormatter;
  self->_addressFormatter = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = *MEMORY[0x1E0D69BD8];
  if (!-[NSArray containsObject:](self->_requiredFieldKeys, "containsObject:", *MEMORY[0x1E0D69BD8])
    && !self->_displayPhoneticName)
  {
    goto LABEL_27;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0D67750]);
  v11 = objc_alloc_init(MEMORY[0x1E0D67750]);
  if (!self->_displayPhoneticName)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0D67750]);
  if (!self->_displayPhoneticName)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0D67750]);
LABEL_8:
  objc_msgSend(v10, "setKey:", v9);
  objc_msgSend(v10, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 0));
  -[PKAddressEditorViewController assignErrorToField:](self, "assignErrorToField:", v10);
  objc_msgSend(v11, "setKey:", v9);
  objc_msgSend(v11, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 1));
  -[PKAddressEditorViewController assignErrorToField:](self, "assignErrorToField:", v11);
  if (self->_displayPhoneticName)
  {
    v14 = *MEMORY[0x1E0D69BE8];
    objc_msgSend(v12, "setKey:", *MEMORY[0x1E0D69BE8]);
    objc_msgSend(v12, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 2));
    -[PKAddressEditorViewController assignErrorToField:](self, "assignErrorToField:", v12);
    objc_msgSend(v13, "setKey:", v14);
    objc_msgSend(v13, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 3));
    -[PKAddressEditorViewController assignErrorToField:](self, "assignErrorToField:", v13);
  }
  if (self->_displayGivenNameFirst)
    v15 = v10;
  else
    v15 = v11;
  objc_msgSend(v8, "safelyAddObject:", v15);
  if (self->_displayPhoneticName)
  {
    if (self->_displayGivenNameFirst)
      v16 = v12;
    else
      v16 = v13;
    objc_msgSend(v8, "safelyAddObject:", v16);
  }
  if (self->_displayGivenNameFirst)
    v17 = v11;
  else
    v17 = v10;
  objc_msgSend(v8, "safelyAddObject:", v17);
  if (self->_displayPhoneticName)
  {
    if (self->_displayGivenNameFirst)
      v18 = v13;
    else
      v18 = v12;
    objc_msgSend(v8, "safelyAddObject:", v18);
  }

LABEL_27:
  v19 = (CNMutablePostalAddress *)objc_alloc_init(MEMORY[0x1E0C97378]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[CNPostalAddressFormattingSpecification editingFieldArrangement](self->_addressFormatter, "editingFieldArrangement");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v52;
    v46 = *MEMORY[0x1E0C970C8];
    v20 = *MEMORY[0x1E0C970A0];
    v21 = (void *)*MEMORY[0x1E0C970A8];
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(obj);
        v43 = v22;
        v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v22);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v44 = v23;
        v24 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v24)
        {
          v25 = v24;
          v45 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v48 != v45)
                objc_enumerationMutation(v44);
              v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              v28 = objc_alloc_init(MEMORY[0x1E0D67750]);
              objc_msgSend(v28, "setKey:", v27);
              objc_msgSend(v28, "setIndex:", 0);
              v29 = v8;
              objc_msgSend(v8, "addObject:", v28);
              -[PKAddressEditorViewController assignErrorToField:](self, "assignErrorToField:", v28);
              if (objc_msgSend(v27, "isEqualToString:", v46))
              {
                v30 = objc_alloc_init(MEMORY[0x1E0D67750]);
                objc_msgSend(v30, "setKey:", v46);
                objc_msgSend(v30, "setIndex:", 1);
                objc_msgSend(v29, "addObject:", v30);
                -[PKAddressEditorViewController assignErrorToField:](self, "assignErrorToField:", v30);

              }
              if ((objc_msgSend(v27, "isEqualToString:", v20) & 1) != 0
                || objc_msgSend(v27, "isEqualToString:", v21))
              {
                -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", v20);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[CNMutablePostalAddress setValue:forKey:](v19, "setValue:forKey:", v31, v20);

                -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", v21);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v19;
                v34 = v32;
                v35 = v21;
              }
              else
              {
                -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v19;
                v34 = v32;
                v35 = v27;
              }
              -[CNMutablePostalAddress setValue:forKey:](v33, "setValue:forKey:", v34, v35);

              v8 = v29;
            }
            v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v25);
        }

        v22 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v42);
  }

  inputAddress = self->_inputAddress;
  self->_inputAddress = v19;
  v37 = v19;

  v38 = (NSArray *)objc_msgSend(v8, "copy");
  editingFields = self->_editingFields;
  self->_editingFields = v38;

}

- (void)assignErrorToField:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  id v26;
  CNMutablePostalAddress *originalAddress;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PKAddressEditorViewController *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *obj;
  void *v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = self;
  obj = self->_errors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v6)
    goto LABEL_42;
  v7 = v6;
  v8 = *(_QWORD *)v46;
  v9 = *MEMORY[0x1E0D6AD28];
  v41 = *MEMORY[0x1E0D6AD38];
  v39 = *MEMORY[0x1E0D6AD20];
  v40 = *MEMORY[0x1E0D6AD18];
  v10 = *MEMORY[0x1E0C970A8];
  v37 = v4;
  v38 = (void *)*MEMORY[0x1E0C970A0];
  v43 = v5;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v46 != v8)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v12, "domain", v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqualToString:", v9))
        goto LABEL_18;
      if (objc_msgSend(v12, "code") == 1)
      {

LABEL_11:
        objc_msgSend(v12, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v41);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v40);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "userInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "PKBoolForKey:", v39);

        if (objc_msgSend(v13, "isEqualToString:", v10))
        {
          PKLogFacilityTypeGetObject();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "Error for ISO Country Code was supplied, displaying as Country", buf, 2u);
          }

          v22 = v38;
          v13 = v22;
        }
        v5 = v43;
        if ((objc_msgSend(v13, "isEqualToString:", v43) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", v43) & 1) != 0)
        {
          v4 = v37;
          objc_msgSend(v37, "setError:", v12);
          v23 = *MEMORY[0x1E0D69BD8];
          if ((objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D69BD8]) & 1) != 0
            || objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D69BE8]))
          {
            v24 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](v36, "_nameComponentForFieldIndex:", objc_msgSend(v37, "index"));
            if (objc_msgSend(v43, "isEqualToString:", v23))
            {
              if (v24)
              {
                if (v24 == 1)
                {
                  v25 = &OBJC_IVAR___PKAddressEditorViewController__originalFamilyName;
                  goto LABEL_39;
                }
LABEL_32:
                v26 = 0;
LABEL_40:
                objc_msgSend(v4, "setInvalidText:", v26);
LABEL_41:

                objc_msgSend(v4, "setFormatIsInvalid:", v20);
                goto LABEL_42;
              }
              v25 = &OBJC_IVAR___PKAddressEditorViewController__originalGivenName;
            }
            else
            {
              if (!objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D69BE8]))
                goto LABEL_32;
              if (v24 == 2)
              {
                v25 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticGivenName;
              }
              else
              {
                if (v24 != 3)
                  goto LABEL_32;
                v25 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticFamilyName;
              }
            }
LABEL_39:
            v26 = *(id *)((char *)&v36->super.super.super.super.isa + *v25);
            goto LABEL_40;
          }
          originalAddress = v36->_originalAddress;
          objc_msgSend(v37, "key");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNMutablePostalAddress valueForKey:](originalAddress, "valueForKey:", v28);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (!v26 || !objc_msgSend(v26, "length") || (objc_msgSend(v26, "isEqualToString:", CFSTR("\n")) & 1) != 0)
          {
            objc_msgSend(v37, "setInvalidText:", &stru_1E3E7D690);
            v5 = v43;
            goto LABEL_41;
          }
          objc_msgSend(v37, "key");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0C970C8]);

          if (!v30)
          {
            v5 = v43;
            goto LABEL_40;
          }
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsSeparatedByCharactersInSet:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v37, "index") && objc_msgSend(v32, "count"))
          {
            objc_msgSend(v32, "firstObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_53;
          }
          if (objc_msgSend(v37, "index") == 1 && (unint64_t)objc_msgSend(v32, "count") >= 2)
          {
            objc_msgSend(v32, "firstObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "pk_arrayByRemovingObject:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v34;
            v4 = v37;
LABEL_53:

            v5 = v43;
            if (objc_msgSend(v4, "index") == 1 && (!v35 || !objc_msgSend(v35, "length")))
LABEL_56:
              v20 = 0;
          }
          else
          {

            v35 = 0;
            v5 = v43;
            if (objc_msgSend(v37, "index") == 1)
              goto LABEL_56;
          }

          v26 = v35;
          goto LABEL_40;
        }

LABEL_18:
        continue;
      }
      v14 = objc_msgSend(v12, "code");

      v15 = v14 == 2;
      v5 = v43;
      if (v15)
        goto LABEL_11;
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    v4 = v37;
    if (v7)
      continue;
    break;
  }
LABEL_42:

}

- (void)setContactFormatValidator:(id)a3
{
  PKContactFormatValidator *v5;
  PKContactFormatValidator *v6;

  v5 = (PKContactFormatValidator *)a3;
  if (self->_contactFormatValidator != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contactFormatValidator, a3);
    v5 = v6;
  }

}

- (void)_updateWithPostalAddress:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_inputAddress, a3);
  v5 = a3;
  -[PKAddressEditorViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginUpdates");

  -[PKAddressEditorViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "reloadSections:withRowAnimation:", v8, 100);
  -[PKAddressEditorViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endUpdates");

}

- (void)_presentCountryPickerIfEditable
{
  void *v3;
  PKCountryPickerViewController *v4;

  if (-[PKAddressEditorViewController _canChangeCountry](self, "_canChangeCountry"))
  {
    if (!self->_presentedCountrySelector)
    {
      self->_presentedCountrySelector = 1;
      v4 = -[PKCountryPickerViewController initWithStyle:]([PKCountryPickerViewController alloc], "initWithStyle:", self->_style);
      -[PKCountryPickerViewController setDelegate:](v4, "setDelegate:", self);
      -[PKAddressEditorViewController navigationController](self, "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pushViewController:animated:", v4, 1);

    }
  }
}

- (void)_presentPickerForAddressTextField:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PKAddressEditorViewController *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  objc_msgSend(v4, "contactFieldConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") == 2)
  {
    v6 = v5;
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pickerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__61;
    v26 = __Block_byref_object_dispose__61;
    v27 = 0;
    v9 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke;
      v19[3] = &unk_1E3E78FD8;
      v20 = v7;
      v21 = &v22;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);

    }
    objc_msgSend(v6, "pickerItems", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23[5];
    v12 = objc_msgSend(v4, "isInvalid") ^ 1;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke_2;
    v16[3] = &unk_1E3E79000;
    v17 = v4;
    v18 = self;
    +[PKAddressFieldPickerViewHosting loadViewControllerWithAllowedValues:selectedValue:isValid:onCommit:](_TtC9PassKitUI31PKAddressFieldPickerViewHosting, "loadViewControllerWithAllowedValues:selectedValue:isValid:onCommit:", v10, v11, v12, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAddressEditorViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushViewController:animated:", v13, 1);

    _Block_object_dispose(&v22, 8);
  }

}

void __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isValueAccepted:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a2, "submissionValue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setText:", v9);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  objc_msgSend(*(id *)(a1 + 32), "addressField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, v5);

  objc_msgSend(*(id *)(a1 + 40), "addressTextField:textDidChange:", *(_QWORD *)(a1 + 32), v9);
  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (unint64_t)_nameComponentForFieldIndex:(unint64_t)a3
{
  unint64_t result;
  _BOOL8 displayPhoneticName;
  _BOOL4 displayGivenNameFirst;
  uint64_t v7;
  uint64_t v8;

  result = 0;
  displayPhoneticName = self->_displayPhoneticName;
  displayGivenNameFirst = self->_displayGivenNameFirst;
  v7 = !displayGivenNameFirst && displayPhoneticName + 1;
  v8 = displayGivenNameFirst && displayPhoneticName + 1;
  if (v7 != a3)
  {
    if (v8 == a3)
      result = 1;
    else
      result = 4;
    if (displayPhoneticName && v8 != a3)
    {
      if (v7 + 1 == a3)
      {
        return 2;
      }
      else if (v8 + 1 == a3)
      {
        return 3;
      }
      else
      {
        return 4;
      }
    }
  }
  return result;
}

- (int64_t)_fieldIndexForNameComponent:(unint64_t)a3
{
  _BOOL8 displayPhoneticName;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;

  displayPhoneticName = self->_displayPhoneticName;
  v4 = !self->_displayGivenNameFirst && displayPhoneticName + 1;
  v5 = self->_displayGivenNameFirst && displayPhoneticName + 1;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 2)
    v6 = v4 + 1;
  if (a3 == 3)
    v6 = v5 + 1;
  if (self->_displayPhoneticName)
    v7 = v6;
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 1)
    v7 = v5;
  if (a3)
    return v7;
  else
    return v4;
}

- (void)_validateAddressRequirements
{
  NSArray *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int *v33;
  void *v34;
  uint64_t v35;
  NSArray *v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v3 = self->_requiredFieldKeys;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  v5 = (uint64_t *)MEMORY[0x1E0D69BD8];
  v6 = (uint64_t *)MEMORY[0x1E0D69BE8];
  if (!v4)
  {
    v16 = 1;
    goto LABEL_21;
  }
  v7 = v4;
  v8 = *(_QWORD *)v55;
  v9 = *MEMORY[0x1E0D69BD8];
  v10 = *MEMORY[0x1E0D69BE8];
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v55 != v8)
        objc_enumerationMutation(v3);
      v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      if (objc_msgSend(v12, "isEqualToString:", v9))
      {
        if (-[NSString length](self->_givenName, "length"))
          continue;
        v13 = 1048;
LABEL_12:
        if (!objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v13), "length"))
          goto LABEL_18;
        continue;
      }
      if (objc_msgSend(v12, "isEqualToString:", v10))
      {
        if (-[NSString length](self->_phoneticGivenName, "length"))
          continue;
        v13 = 1064;
        goto LABEL_12;
      }
      -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (!v15)
      {
LABEL_18:
        v16 = 0;
        goto LABEL_19;
      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v7)
      continue;
    break;
  }
  v16 = 1;
LABEL_19:
  v6 = (uint64_t *)MEMORY[0x1E0D69BE8];
  v5 = (uint64_t *)MEMORY[0x1E0D69BD8];
LABEL_21:

  v17 = 1072;
  -[CNMutablePostalAddress ISOCountryCode](self->_inputAddress, "ISOCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKContactFormatRequiredPostalAddressKeysForCountryCode();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v51;
LABEL_23:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v23)
        objc_enumerationMutation(v20);
      -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v24));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v25, "length");

      if (!v16)
        break;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v22)
          goto LABEL_23;
        v16 = 1;
        break;
      }
    }
  }
  v42 = v20;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v26 = self->_editingFields;
  v45 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (!v45)
    goto LABEL_51;
  v27 = *(_QWORD *)v47;
  v28 = *v5;
  v43 = *v5;
  v44 = *v6;
  while (2)
  {
    v29 = 0;
    while (2)
    {
      if (*(_QWORD *)v47 != v27)
        objc_enumerationMutation(v26);
      if ((v16 & 1) == 0)
      {
        v16 = 0;
        goto LABEL_51;
      }
      v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v29);
      objc_msgSend(v30, "key", v42);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        goto LABEL_46;
      if (objc_msgSend(v31, "isEqualToString:", v28))
      {
        if (-[NSString isEqualToString:](self->_originalGivenName, "isEqualToString:", self->_givenName))
        {
          v33 = &OBJC_IVAR___PKAddressEditorViewController__originalFamilyName;
          goto LABEL_43;
        }
        goto LABEL_46;
      }
      if (objc_msgSend(v31, "isEqualToString:", v44))
      {
        if (-[NSString isEqualToString:](self->_originalPhoneticGivenName, "isEqualToString:", self->_phoneticGivenName))
        {
          v33 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticFamilyName;
LABEL_43:
          if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v33), "isEqualToString:", *(Class *)((char *)&self->super.super.super.super.isa + v33[2])) & 1) != 0)goto LABEL_44;
        }
LABEL_46:
        v16 = objc_msgSend(v30, "formatIsInvalid") ^ 1;
      }
      else
      {
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v17), "valueForKey:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "invalidText");
        v35 = v27;
        v36 = v26;
        v37 = v17;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v34, "isEqualToString:", v38);

        v17 = v37;
        v26 = v36;
        v27 = v35;
        v28 = v43;

        if ((v39 & 1) == 0)
          goto LABEL_46;
LABEL_44:
        v16 = 0;
      }

      if (v45 != ++v29)
        continue;
      break;
    }
    v45 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v45)
      continue;
    break;
  }
LABEL_51:

  self->_requirementsMet = v16;
  -[PKAddressEditorViewController navigationItem](self, "navigationItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rightBarButtonItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEnabled:", v16);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PKAddressEditorTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  PKAddressTextField *v21;
  PKAddressTextField *v22;
  void *v23;
  void *v24;
  int v25;
  int *v26;
  int *v27;
  _QWORD *v28;
  __CFString *v29;
  void *v30;
  int v31;
  void *v32;
  int *v33;
  void *v34;
  CNPostalAddressFormattingSpecification *addressFormatter;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  NSArray *highlightedFieldKeys;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  _QWORD *v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  int v80;
  void *v81;
  unsigned int v82;
  void *v83;
  void *v84;
  int v85;
  NSString *originalCountry;
  void *v87;
  BOOL v88;
  PKAddressTextField *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  _BOOL4 v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  _QWORD v110[2];

  v110[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("field"));
  v7 = (PKAddressEditorTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[PKAddressEditorTableViewCell initWithStyle:reuseIdentifier:]([PKAddressEditorTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("field"));
  -[PKAddressEditorTableViewCell stackView](v7, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_editingFields, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  -[CNMutablePostalAddress ISOCountryCode](self->_inputAddress, "ISOCountryCode");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D69BD8];
  v105 = (void *)v12;
  v102 = *MEMORY[0x1E0D69BD8];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D69BD8]))
  {
    if (v11 != -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 0))
    {
      if (v11 == -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 1))
      {
        -[PKContactFormatValidator contactFieldConfigurationForFamilyNameForCountryCode:](self->_contactFormatValidator, "contactFieldConfigurationForFamilyNameForCountryCode:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v15 = (void *)v14;
LABEL_15:
        v108 = 0;
        goto LABEL_16;
      }
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D69BE8]))
  {
    if (v11 != -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 2))
    {
      if (v11 == -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 3))
      {
        -[PKContactFormatValidator contactFieldConfigurationForPhoneticFamilyNameForCountryCode:](self->_contactFormatValidator, "contactFieldConfigurationForPhoneticFamilyNameForCountryCode:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
LABEL_38:
      v108 = 0;
      v15 = 0;
      goto LABEL_16;
    }
LABEL_9:
    -[PKContactFormatValidator contactFieldConfigurationForGivenNameForCountryCode:](self->_contactFormatValidator, "contactFieldConfigurationForGivenNameForCountryCode:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[PKContactFormatValidator contactFieldConfigurationForPostalField:forCountryCode:](self->_contactFormatValidator, "contactFieldConfigurationForPostalField:forCountryCode:", v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16
    || (v108 = v16, v18 = objc_msgSend(v16, "length"), v17 = v108, !v18)
    || (v19 = objc_msgSend(v108, "isEqualToString:", CFSTR("\n")), v17 = v108, (v19 & 1) != 0))
  {

    goto LABEL_15;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C970C8]))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "componentsSeparatedByCharactersInSet:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "index") || !objc_msgSend(v45, "count"))
    {
      if (objc_msgSend(v9, "index") == 1 && (unint64_t)objc_msgSend(v45, "count") >= 2)
      {
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "pk_arrayByRemovingObject:", v46);
        v47 = v15;
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = objc_claimAutoreleasedReturnValue();
        v45 = v48;
        v15 = v47;
      }
      else
      {
        v49 = 0;
      }
    }
    else
    {
      objc_msgSend(v45, "firstObject");
      v49 = objc_claimAutoreleasedReturnValue();
    }

    v108 = (void *)v49;
    v13 = v102;
  }
LABEL_16:
  objc_msgSend(v9, "key");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = *MEMORY[0x1E0C970A0];
  v106 = v10;
  if (objc_msgSend(v20, "isEqualToString:"))
    v103 = -[PKAddressEditorViewController _canChangeCountry](self, "_canChangeCountry");
  else
    v103 = 0;

  v107 = objc_msgSend(v15, "type");
  v21 = [PKAddressTextField alloc];
  v22 = -[PKAddressTextField initWithFrame:style:](v21, "initWithFrame:style:", self->_style, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PKAddressTextField setDelegate:](v22, "setDelegate:", self);
  -[PKAddressTextField setAddressDelegate:](v22, "setAddressDelegate:", self);
  -[PKAddressTextField setAutocapitalizationType:](v22, "setAutocapitalizationType:", 1);
  -[PKAddressTextField setAddressField:](v22, "setAddressField:", v9);
  -[PKAddressTextField setContactFieldConfiguration:](v22, "setContactFieldConfiguration:", v15);
  -[PKAddressTextField setEnabled:](v22, "setEnabled:", !self->_readOnly);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddressTextField setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[PKAddressTextField setAutocorrectionType:](v22, "setAutocorrectionType:", 1);
  -[PKAddressTextField addTarget:action:forControlEvents:](v22, "addTarget:action:forControlEvents:", self, sel_textDidChange_, 0x20000);
  objc_msgSend(v9, "key");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", v13);

  v104 = v15;
  if (v25)
  {
    if (v11 == -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 0))
    {
      v26 = &OBJC_IVAR___PKAddressEditorViewController__givenName;
      v27 = &OBJC_IVAR___PKAddressEditorViewController__givenNameTextField;
      v28 = (_QWORD *)MEMORY[0x1E0DC5438];
      v29 = CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_GIVENNAME_TITLE");
    }
    else
    {
      if (v11 != -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 1))goto LABEL_28;
      v26 = &OBJC_IVAR___PKAddressEditorViewController__familyName;
      v27 = &OBJC_IVAR___PKAddressEditorViewController__familyNameTextField;
      v28 = (_QWORD *)MEMORY[0x1E0DC5428];
      v29 = CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_FAMILYNAME_TITLE");
    }
    PKLocalizedPaymentString(&v29->isa);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressTextField setPlaceholder:](v22, "setPlaceholder:", v34);

    -[PKAddressTextField setTextContentType:](v22, "setTextContentType:", *v28);
    -[PKAddressTextField setText:](v22, "setText:", *(Class *)((char *)&self->super.super.super.super.isa + *v26));
    objc_storeWeak((id *)((char *)&self->super.super.super.super.isa + *v27), v22);
LABEL_28:
    if (!v11)
      objc_storeStrong((id *)&self->_firstTextFieldForName, v22);
    goto LABEL_71;
  }
  objc_msgSend(v9, "key");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0D69BE8]);

  if (v31)
  {
    if (v11 == -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 2))
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_PHONETICGIVENNAME_TITLE"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAddressTextField setPlaceholder:](v22, "setPlaceholder:", v32);

      v33 = &OBJC_IVAR___PKAddressEditorViewController__phoneticGivenName;
    }
    else
    {
      if (v11 != -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 3))goto LABEL_71;
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_PHONETICFAMILYNAME_TITLE"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAddressTextField setPlaceholder:](v22, "setPlaceholder:", v40);

      v33 = &OBJC_IVAR___PKAddressEditorViewController__phoneticFamilyName;
    }
    -[PKAddressTextField setText:](v22, "setText:", *(Class *)((char *)&self->super.super.super.super.isa + *v33));
    objc_storeWeak((id *)((char *)&self->super.super.super.super.isa + v33[26]), v22);
  }
  else
  {
    addressFormatter = self->_addressFormatter;
    objc_msgSend(v9, "key");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPostalAddressFormattingSpecification localizedPlaceholderForKey:](addressFormatter, "localizedPlaceholderForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressTextField setPlaceholder:](v22, "setPlaceholder:", v37);

    -[PKAddressTextField setText:](v22, "setText:", v108);
    v38 = v107 == 2 || v103;
    if (v38 == 1)
    {
      if (self->_style == 2)
      {
        PKBridgeTableViewCellAccessoryColor();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }
      v41 = objc_alloc(MEMORY[0x1E0DC3890]);
      PKUISmallChevronImage();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithImage:", v42);

      if (v39)
      {
        objc_msgSend(v43, "setTintColor:", v39);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setTintColor:", v50);

      }
      -[PKAddressTextField setRightViewMode:](v22, "setRightViewMode:", 3);
      -[PKAddressTextField setRightView:](v22, "setRightView:", v43);
      if (v103)
        objc_storeWeak((id *)&self->_countryTextField, v22);

    }
    objc_msgSend(v9, "key");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isEqualToString:", *MEMORY[0x1E0C970C8]);

    if (v52)
    {
      if (objc_msgSend(v9, "index"))
      {
        -[PKAddressTextField setTextContentType:](v22, "setTextContentType:", *MEMORY[0x1E0DC5480]);
        objc_storeWeak((id *)&self->_street2TextField, v22);
        PKLocalizedPaymentString(CFSTR("STREET_ADDRESS_SECOND_LINE_PLACEHOLDER"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAddressTextField setPlaceholder:](v22, "setPlaceholder:", v53);

      }
      else
      {
        -[PKAddressTextField setTextContentType:](v22, "setTextContentType:", *MEMORY[0x1E0DC5478]);
        objc_storeWeak((id *)&self->_street1TextField, v22);
      }
    }
    highlightedFieldKeys = self->_highlightedFieldKeys;
    objc_msgSend(v9, "key");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray containsObject:](highlightedFieldKeys, "containsObject:", v55))
    {
      v56 = objc_msgSend(v9, "index");

      if (!v56)
      {
        v109 = *MEMORY[0x1E0DC1140];
        objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "colorWithAlphaComponent:", 0.7);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v110[0] = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[PKAddressTextField placeholder](v22, "placeholder");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v60, "initWithString:attributes:", v61, v59);

        -[PKAddressTextField setAttributedPlaceholder:](v22, "setAttributedPlaceholder:", v62);
      }
    }
    else
    {

    }
    objc_msgSend(v9, "key");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C970D8]);

    if (v64)
    {
      v65 = (_QWORD *)MEMORY[0x1E0DC5488];
    }
    else
    {
      objc_msgSend(v9, "key");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "isEqualToString:", *MEMORY[0x1E0C97098]);

      if (v67)
      {
        v65 = (_QWORD *)MEMORY[0x1E0DC5400];
      }
      else
      {
        objc_msgSend(v9, "key");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "isEqualToString:", *MEMORY[0x1E0C970C0]);

        if (v69)
        {
          v65 = (_QWORD *)MEMORY[0x1E0DC5408];
        }
        else
        {
          objc_msgSend(v9, "key");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "isEqualToString:", *MEMORY[0x1E0C970B0]);

          if (!v71)
            goto LABEL_71;
          v65 = (_QWORD *)MEMORY[0x1E0DC5470];
        }
      }
    }
    -[PKAddressTextField setTextContentType:](v22, "setTextContentType:", *v65);
  }
LABEL_71:
  objc_msgSend(v9, "invalidText");
  v72 = objc_claimAutoreleasedReturnValue();
  if (!v72)
    goto LABEL_78;
  v73 = (void *)v72;
  objc_msgSend(v9, "invalidText");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddressTextField text](v22, "text");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v74, "isEqualToString:", v75) & 1) == 0)
  {
    objc_msgSend(v9, "invalidText");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "length"))
    {

    }
    else
    {
      v100 = v8;
      -[PKAddressTextField text](v22, "text");
      v92 = objc_claimAutoreleasedReturnValue();
      if (!v92)
      {

        goto LABEL_73;
      }
      v93 = (void *)v92;
      -[PKAddressTextField text](v22, "text");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v94, "length");

      v8 = v100;
      if (!v99)
        goto LABEL_74;
    }
LABEL_78:
    -[PKAddressTextField setIsInvalid:showErrorGlyph:](v22, "setIsInvalid:showErrorGlyph:", 0, 0);
    v80 = v107 == 2 || v103;
    if (v80 != 1)
      goto LABEL_99;
    -[PKAddressTextField setRightViewMode:](v22, "setRightViewMode:", 3);
    goto LABEL_97;
  }
LABEL_73:

LABEL_74:
  v76 = objc_msgSend(v9, "index");
  objc_msgSend(v9, "key");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v77, "isEqualToString:", v102) & 1) != 0)
  {
    v78 = 1;
  }
  else
  {
    objc_msgSend(v9, "key");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "isEqualToString:", *MEMORY[0x1E0D69BE8]);

    if (v76)
      v78 = v82;
    else
      v78 = 1;
  }

  -[PKAddressTextField setIsInvalid:showErrorGlyph:](v22, "setIsInvalid:showErrorGlyph:", 1, v78);
  objc_msgSend(v9, "key");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v83, "isEqualToString:", v101))
  {

  }
  else
  {
    objc_msgSend(v9, "key");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "isEqualToString:", *MEMORY[0x1E0C970A8]);

    if (!v85)
      goto LABEL_97;
  }
  originalCountry = self->_originalCountry;
  if (originalCountry
    && (-[CNMutablePostalAddress country](self->_inputAddress, "country"),
        v87 = (void *)objc_claimAutoreleasedReturnValue(),
        v88 = -[NSString isEqualToString:](originalCountry, "isEqualToString:", v87),
        v87,
        !v88))
  {
    v89 = v22;
    v90 = 1;
    v91 = v78;
  }
  else
  {
    v89 = v22;
    v90 = 0;
    v91 = 0;
  }
  -[PKAddressTextField setIsInvalid:showErrorGlyph:](v89, "setIsInvalid:showErrorGlyph:", v90, v91);
LABEL_97:
  if (v107 == 2)
  {
    -[PKAddressTextField setSecureTextEntry:](v22, "setSecureTextEntry:", 1);
    -[PKAddressTextField setDisplaySecureTextUsingPlainText:](v22, "setDisplaySecureTextUsingPlainText:", 1);
  }
LABEL_99:
  objc_msgSend(v8, "addArrangedSubview:", v22);
  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v95, v22);

    PKBridgeAppearanceGetAppearanceSpecifier();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v96, v7);

  }
  objc_msgSend(v9, "key");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddressEditorTableViewCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v97);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_editingFields, "count", a3, a4);
}

- (void)setReadOnly:(BOOL)a3
{
  id v3;

  self->_readOnly = a3;
  -[PKAddressEditorViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (BOOL)_canChangeCountry
{
  return !self->_readOnly && self->_countryIsEditable;
}

- (void)textDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressEditorViewController addressTextField:textDidChange:](self, "addressTextField:textDidChange:", v5, v4);

  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_countryTextField);

  if (WeakRetained == v9)
  {
    objc_msgSend(v9, "resignFirstResponder");
    -[PKAddressEditorViewController _presentCountryPickerIfEditable](self, "_presentCountryPickerIfEditable");
  }
  else
  {
    objc_msgSend(v9, "contactFieldConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (v7 == 2)
    {
      objc_msgSend(v9, "resignFirstResponder");
      -[PKAddressEditorViewController _presentPickerForAddressTextField:](self, "_presentPickerForAddressTextField:", v9);
    }
    else
    {
      objc_storeStrong((id *)&self->_currentlySelectedField, a3);
      -[PKAddressTextField text](self->_currentlySelectedField, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isEditingBlankField = objc_msgSend(v8, "length") == 0;

    }
  }

}

- (void)textFieldDidEndEditing:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PKAddressTextField *currentlySelectedField;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_countryTextField);

  v5 = v11;
  if (WeakRetained != v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v11;
    else
      v6 = 0;
    objc_msgSend(v6, "contactFieldConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 != 2)
    {
      objc_storeStrong((id *)&self->_previouslySelectedField, self->_currentlySelectedField);
      currentlySelectedField = self->_currentlySelectedField;
      self->_currentlySelectedField = 0;

      self->_isEditingBlankField = 0;
      if (v6)
      {
        objc_msgSend(v6, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAddressEditorViewController addressTextField:didEndEditing:](self, "addressTextField:didEndEditing:", v6, v10);

      }
    }

    v5 = v11;
  }

}

- (void)addressTextField:(id)a3 textDidChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  MKLocalSearchCompleter *searchCompleter;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int *v15;
  int64_t v16;
  BOOL v17;
  uint64_t v18;
  int *v19;
  int64_t v20;
  BOOL v21;
  id WeakRetained;
  id v23;
  id v24;

  v24 = a4;
  v6 = a3;
  objc_msgSend(v6, "addressField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddressEditorViewController _updateUniqueAddressField:withNewString:](self, "_updateUniqueAddressField:withNewString:", v7, v24);
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C970C8]))
  {
    searchCompleter = self->_searchCompleter;
    -[CNMutablePostalAddress street](self->_inputAddress, "street");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLocalSearchCompleter setQueryFragment:](searchCompleter, "setQueryFragment:", v10);

  }
  objc_msgSend(v7, "invalidText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v24);

  v13 = objc_msgSend(v7, "index");
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D69BD8]))
  {
    if (v13 == -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 0))
    {
      if ((v12 & 1) == 0)
      {
        v18 = 0;
        goto LABEL_21;
      }
      v14 = &OBJC_IVAR___PKAddressEditorViewController__originalFamilyName;
    }
    else
    {
      v16 = -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 1);
      v17 = v13 == v16;
      if (v13 == v16)
        v18 = 0;
      else
        v18 = v12;
      if (!v17 || ((v12 ^ 1) & 1) != 0)
        goto LABEL_21;
      v14 = &OBJC_IVAR___PKAddressEditorViewController__originalGivenName;
    }
    v18 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v14), "isEqualToString:", *(Class *)((char *)&self->super.super.super.super.isa + v14[2]));
LABEL_21:
    v19 = &OBJC_IVAR___PKAddressEditorViewController__givenNameTextField;
LABEL_32:
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.isa + *v19));
    objc_msgSend(WeakRetained, "setIsInvalid:showErrorGlyph:", v18, v18);

    v23 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.isa + v19[1]));
    objc_msgSend(v23, "setIsInvalid:showErrorGlyph:", v18, v18);

    goto LABEL_33;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D69BE8]))
  {
    if (v13 == -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 2))
    {
      if ((v12 & 1) == 0)
      {
        v18 = 0;
        goto LABEL_31;
      }
      v15 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticFamilyName;
    }
    else
    {
      v20 = -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 3);
      v21 = v13 == v20;
      if (v13 == v20)
        v18 = 0;
      else
        v18 = v12;
      if (!v21 || ((v12 ^ 1) & 1) != 0)
        goto LABEL_31;
      v15 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticGivenName;
    }
    v18 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v15), "isEqualToString:", *(Class *)((char *)&self->super.super.super.super.isa + v15[2]));
LABEL_31:
    v19 = &OBJC_IVAR___PKAddressEditorViewController__phoneticGivenNameTextField;
    goto LABEL_32;
  }
  objc_msgSend(v6, "setIsInvalid:showErrorGlyph:", v12, v12);
LABEL_33:
  -[PKAddressEditorViewController _checkFormatOfAddressTextField:](self, "_checkFormatOfAddressTextField:", v6);

  -[PKAddressEditorViewController _validateAddressRequirements](self, "_validateAddressRequirements");
}

- (void)addressTextField:(id)a3 didEndEditing:(id)a4
{
  -[PKAddressEditorViewController _checkFormatOfAddressTextField:](self, "_checkFormatOfAddressTextField:", a3, a4);
  -[PKAddressEditorViewController _validateAddressRequirements](self, "_validateAddressRequirements");
}

- (void)_checkFormatOfAddressTextField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  PKContactFormatValidator *v8;
  int v9;
  unint64_t v10;
  PKContactFormatValidator *v11;
  uint64_t v12;
  int v13;
  PKContactFormatValidator *v14;
  void *v15;
  PKAddressTextField **p_street2TextField;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  PKContactFormatValidator *contactFormatValidator;
  void *v27;
  PKContactFormatValidator *v28;
  id v29;

  v29 = a3;
  objc_msgSend(v29, "addressField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutablePostalAddress ISOCountryCode](self->_inputAddress, "ISOCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69BD8]))
  {
    v7 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", objc_msgSend(v4, "index"));
    if (v7 == 1)
    {
      contactFormatValidator = self->_contactFormatValidator;
      if (contactFormatValidator)
      {
        v9 = -[PKContactFormatValidator isFamilyName:validFormatForCountryCode:](contactFormatValidator, "isFamilyName:validFormatForCountryCode:", self->_familyName, v6);
        goto LABEL_25;
      }
    }
    else if (!v7)
    {
      v8 = self->_contactFormatValidator;
      if (v8)
      {
        v9 = -[PKContactFormatValidator isGivenName:validFormatForCountryCode:](v8, "isGivenName:validFormatForCountryCode:", self->_givenName, v6);
LABEL_25:
        v14 = (PKContactFormatValidator *)(v9 ^ 1u);
        goto LABEL_27;
      }
    }
    goto LABEL_26;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69BE8]))
  {
    v10 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", objc_msgSend(v4, "index"));
    if (v10 == 3)
    {
      v28 = self->_contactFormatValidator;
      if (v28)
      {
        v9 = -[PKContactFormatValidator isPhoneticFamilyName:validFormatForCountryCode:](v28, "isPhoneticFamilyName:validFormatForCountryCode:", self->_phoneticFamilyName, v6);
        goto LABEL_25;
      }
    }
    else if (v10 == 2)
    {
      v11 = self->_contactFormatValidator;
      if (v11)
      {
        v9 = -[PKContactFormatValidator isPhoneticGivenName:validFormatForCountryCode:](v11, "isPhoneticGivenName:validFormatForCountryCode:", self->_phoneticGivenName, v6);
        goto LABEL_25;
      }
    }
LABEL_26:
    v14 = 0;
LABEL_27:
    objc_msgSend(v4, "setFormatIsInvalid:", v14);
    if (!self->_isEditingBlankField)
      objc_msgSend(v29, "setIsInvalid:showErrorGlyph:", v14, v14);
    goto LABEL_29;
  }
  v12 = *MEMORY[0x1E0C970C8];
  v13 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C970C8]);
  v14 = self->_contactFormatValidator;
  if (!v13)
  {
    if (v14)
    {
      -[CNMutablePostalAddress valueForKey:](self->_inputAddress, "valueForKey:", v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (PKContactFormatValidator *)(-[PKContactFormatValidator isPostalAddressFieldEntry:validForPostalFieldKey:forCountryCode:](v14, "isPostalAddressFieldEntry:validForPostalFieldKey:forCountryCode:", v27, v5, v6) ^ 1);

    }
    goto LABEL_27;
  }
  if (v14)
  {
    -[CNMutablePostalAddress street](self->_inputAddress, "street");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (PKContactFormatValidator *)(-[PKContactFormatValidator isPostalAddressFieldEntry:validForPostalFieldKey:forCountryCode:](v14, "isPostalAddressFieldEntry:validForPostalFieldKey:forCountryCode:", v15, v12, v6) ^ 1);

  }
  p_street2TextField = &self->_street2TextField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_street2TextField);
  objc_msgSend(WeakRetained, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
    v19 = v14;
  else
    v19 = 0;

  v20 = objc_loadWeakRetained((id *)&self->_street1TextField);
  objc_msgSend(v20, "addressField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFormatIsInvalid:", v14);

  v22 = objc_loadWeakRetained((id *)&self->_street2TextField);
  objc_msgSend(v22, "addressField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFormatIsInvalid:", v19);

  if (!self->_isEditingBlankField)
  {
    v24 = objc_loadWeakRetained((id *)&self->_street1TextField);
    objc_msgSend(v24, "setIsInvalid:showErrorGlyph:", v14, v14);

    v25 = objc_loadWeakRetained((id *)p_street2TextField);
    objc_msgSend(v25, "setIsInvalid:showErrorGlyph:", v19, v19);

  }
LABEL_29:

}

- (void)_updateUniqueAddressField:(id)a3 withNewString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  CNMutablePostalAddress *inputAddress;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D69BD8]))
  {
    v9 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", objc_msgSend(v6, "index"));
    if (v9 == 1)
    {
      v10 = 1048;
      goto LABEL_15;
    }
    if (!v9)
    {
      v10 = 1040;
LABEL_15:
      objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + v10), a4);
    }
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D69BE8]))
  {
    v11 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", objc_msgSend(v6, "index"));
    if (v11 == 3)
    {
      v10 = 1064;
      goto LABEL_15;
    }
    if (v11 == 2)
    {
      v10 = 1056;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C970C8]);
    inputAddress = self->_inputAddress;
    if (v12)
    {
      -[CNMutablePostalAddress street](inputAddress, "street");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      if (objc_msgSend(v6, "index") == 1)
      {
        v18 = objc_msgSend(v17, "count") - 1;
        v21[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "replaceObjectsInRange:withObjectsFromArray:", 1, v18, v19);

      }
      else
      {
        objc_msgSend(v17, "replaceObjectAtIndex:withObject:", 0, v7);
      }
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMutablePostalAddress setStreet:](self->_inputAddress, "setStreet:", v20);

    }
    else
    {
      -[CNMutablePostalAddress setValue:forKey:](inputAddress, "setValue:forKey:", v7, v8);
    }
  }

}

- (void)completerDidUpdateResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAddressTextField inputDelegate](self->_currentlySelectedField, "inputDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_226);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        PKLogFacilityTypeGetObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "mapItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Search completion item map item: %@", buf, 0xCu);

        }
        v17 = (void *)MEMORY[0x1E0DC3E40];
        objc_msgSend(v13, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "textSuggestionWithInputText:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v19);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  objc_msgSend(v20, "setSuggestions:", v7);
}

BOOL __59__PKAddressEditorViewController_completerDidUpdateResults___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  if (a3 >= 3)
    *a4 = 1;
  return objc_msgSend(a2, "_type") == 2;
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed completion", (uint8_t *)&v9, 2u);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)countryPicker:(id)a3 didPickCountryCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  PKAddressEditorViewController *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *originalCountry;
  PKAddressTextField *previouslySelectedField;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  NSArray *obj;
  PKAddressEditorViewController *v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedStringForCountryCode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 1072;
  -[CNMutablePostalAddress setCountry:](self->_inputAddress, "setCountry:", v7);
  -[CNMutablePostalAddress setISOCountryCode:](self->_inputAddress, "setISOCountryCode:", v5);
  -[PKAddressEditorViewController recomputeEditingFields](self, "recomputeEditingFields");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v43 = self;
  obj = self->_editingFields;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    v12 = *MEMORY[0x1E0C970A0];
    v13 = *MEMORY[0x1E0C970A8];
    v40 = v7;
    v41 = v5;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(obj);
        v15 = v8;
        v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v16, "key");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", v12))
        {

LABEL_12:
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v44 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          v21 = v43;
          if (v20)
          {
            v22 = v20;
            v23 = *(_QWORD *)v47;
            v24 = *MEMORY[0x1E0C997B0];
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v47 != v23)
                  objc_enumerationMutation(v44);
                v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
                objc_msgSend(v45, "displayNameForKey:value:", v24, v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)((char *)&v21->super.super.super.super.isa + v15), "country");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v28, "compare:options:", v27, 129))
                {

                }
                else
                {
                  objc_msgSend(*(id *)((char *)&v21->super.super.super.super.isa + v15), "ISOCountryCode");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "compare:options:", v26, 129);

                  v21 = v43;
                  if (!v30)
                  {
                    objc_msgSend(v16, "setFormatIsInvalid:", 0);
                    objc_msgSend(v16, "error");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PKAddressEditorViewController errors](v43, "errors");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "pk_arrayByRemovingObject:", v31);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PKAddressEditorViewController setErrors:](v43, "setErrors:", v33);

                    objc_msgSend(v16, "setError:", 0);
                    objc_msgSend(*(id *)((char *)&v43->super.super.super.super.isa + v15), "country");
                    v34 = objc_claimAutoreleasedReturnValue();
                    originalCountry = v43->_originalCountry;
                    v43->_originalCountry = (NSString *)v34;

                    goto LABEL_24;
                  }
                }

              }
              v22 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              if (v22)
                continue;
              break;
            }
          }
LABEL_24:

          v7 = v40;
          v5 = v41;
          goto LABEL_25;
        }
        objc_msgSend(v16, "key");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v13);

        if (v19)
          goto LABEL_12;
        v8 = v15;
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      v7 = v40;
      v5 = v41;
      if (v10)
        continue;
      break;
    }
  }
LABEL_25:

  -[PKAddressEditorViewController _validateAddressRequirements](v43, "_validateAddressRequirements");
  previouslySelectedField = v43->_previouslySelectedField;
  v43->_previouslySelectedField = 0;

  -[PKAddressEditorViewController tableView](v43, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "reloadData");

  -[PKAddressEditorViewController navigationController](v43, "navigationController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v38, "popViewControllerAnimated:", 1);

}

- (PKAddressEditorViewControllerDelegate)delegate
{
  return (PKAddressEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BOOL)countryIsEditable
{
  return self->_countryIsEditable;
}

- (void)setCountryIsEditable:(BOOL)a3
{
  self->_countryIsEditable = a3;
}

- (PKContactFormatValidator)contactFormatValidator
{
  return self->_contactFormatValidator;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_givenName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticGivenName, a3);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticFamilyName, a3);
}

- (CNMutablePostalAddress)inputAddress
{
  return self->_inputAddress;
}

- (void)setInputAddress:(id)a3
{
  objc_storeStrong((id *)&self->_inputAddress, a3);
}

- (NSString)inputLabel
{
  return self->_inputLabel;
}

- (void)setInputLabel:(id)a3
{
  objc_storeStrong((id *)&self->_inputLabel, a3);
}

- (NSString)originalGivenName
{
  return self->_originalGivenName;
}

- (void)setOriginalGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_originalGivenName, a3);
}

- (NSString)originalFamilyName
{
  return self->_originalFamilyName;
}

- (void)setOriginalFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_originalFamilyName, a3);
}

- (NSString)originalPhoneticGivenName
{
  return self->_originalPhoneticGivenName;
}

- (void)setOriginalPhoneticGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_originalPhoneticGivenName, a3);
}

- (NSString)originalPhoneticFamilyName
{
  return self->_originalPhoneticFamilyName;
}

- (void)setOriginalPhoneticFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_originalPhoneticFamilyName, a3);
}

- (NSString)originalCountry
{
  return self->_originalCountry;
}

- (void)setOriginalCountry:(id)a3
{
  objc_storeStrong((id *)&self->_originalCountry, a3);
}

- (CNMutablePostalAddress)originalAddress
{
  return self->_originalAddress;
}

- (void)setOriginalAddress:(id)a3
{
  objc_storeStrong((id *)&self->_originalAddress, a3);
}

- (CNPostalAddressFormattingSpecification)addressFormatter
{
  return self->_addressFormatter;
}

- (void)setAddressFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_addressFormatter, a3);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (MKLocalSearchCompleter)searchCompleter
{
  return self->_searchCompleter;
}

- (void)setSearchCompleter:(id)a3
{
  objc_storeStrong((id *)&self->_searchCompleter, a3);
}

- (PKAddressTextField)currentlySelectedField
{
  return self->_currentlySelectedField;
}

- (void)setCurrentlySelectedField:(id)a3
{
  objc_storeStrong((id *)&self->_currentlySelectedField, a3);
}

- (PKAddressTextField)previouslySelectedField
{
  return self->_previouslySelectedField;
}

- (void)setPreviouslySelectedField:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySelectedField, a3);
}

- (PKAddressTextField)firstTextFieldForName
{
  return self->_firstTextFieldForName;
}

- (void)setFirstTextFieldForName:(id)a3
{
  objc_storeStrong((id *)&self->_firstTextFieldForName, a3);
}

- (NSArray)editingFields
{
  return self->_editingFields;
}

- (void)setEditingFields:(id)a3
{
  objc_storeStrong((id *)&self->_editingFields, a3);
}

- (NSArray)highlightedFieldKeys
{
  return self->_highlightedFieldKeys;
}

- (void)setHighlightedFieldKeys:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedFieldKeys, a3);
}

- (NSArray)requiredFieldKeys
{
  return self->_requiredFieldKeys;
}

- (void)setRequiredFieldKeys:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFieldKeys, a3);
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (PKAddressTextField)givenNameTextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_givenNameTextField);
}

- (void)setGivenNameTextField:(id)a3
{
  objc_storeWeak((id *)&self->_givenNameTextField, a3);
}

- (PKAddressTextField)familyNameTextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_familyNameTextField);
}

- (void)setFamilyNameTextField:(id)a3
{
  objc_storeWeak((id *)&self->_familyNameTextField, a3);
}

- (PKAddressTextField)phoneticGivenNameTextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_phoneticGivenNameTextField);
}

- (void)setPhoneticGivenNameTextField:(id)a3
{
  objc_storeWeak((id *)&self->_phoneticGivenNameTextField, a3);
}

- (PKAddressTextField)phoneticFamilyNameTextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_phoneticFamilyNameTextField);
}

- (void)setPhoneticFamilyNameTextField:(id)a3
{
  objc_storeWeak((id *)&self->_phoneticFamilyNameTextField, a3);
}

- (PKAddressTextField)street1TextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_street1TextField);
}

- (void)setStreet1TextField:(id)a3
{
  objc_storeWeak((id *)&self->_street1TextField, a3);
}

- (PKAddressTextField)street2TextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_street2TextField);
}

- (void)setStreet2TextField:(id)a3
{
  objc_storeWeak((id *)&self->_street2TextField, a3);
}

- (PKAddressTextField)countryTextField
{
  return (PKAddressTextField *)objc_loadWeakRetained((id *)&self->_countryTextField);
}

- (void)setCountryTextField:(id)a3
{
  objc_storeWeak((id *)&self->_countryTextField, a3);
}

- (BOOL)requirementsMet
{
  return self->_requirementsMet;
}

- (void)setRequirementsMet:(BOOL)a3
{
  self->_requirementsMet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_countryTextField);
  objc_destroyWeak((id *)&self->_street2TextField);
  objc_destroyWeak((id *)&self->_street1TextField);
  objc_destroyWeak((id *)&self->_phoneticFamilyNameTextField);
  objc_destroyWeak((id *)&self->_phoneticGivenNameTextField);
  objc_destroyWeak((id *)&self->_familyNameTextField);
  objc_destroyWeak((id *)&self->_givenNameTextField);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_requiredFieldKeys, 0);
  objc_storeStrong((id *)&self->_highlightedFieldKeys, 0);
  objc_storeStrong((id *)&self->_editingFields, 0);
  objc_storeStrong((id *)&self->_firstTextFieldForName, 0);
  objc_storeStrong((id *)&self->_previouslySelectedField, 0);
  objc_storeStrong((id *)&self->_currentlySelectedField, 0);
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_addressFormatter, 0);
  objc_storeStrong((id *)&self->_originalAddress, 0);
  objc_storeStrong((id *)&self->_originalCountry, 0);
  objc_storeStrong((id *)&self->_originalPhoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_originalPhoneticGivenName, 0);
  objc_storeStrong((id *)&self->_originalFamilyName, 0);
  objc_storeStrong((id *)&self->_originalGivenName, 0);
  objc_storeStrong((id *)&self->_inputLabel, 0);
  objc_storeStrong((id *)&self->_inputAddress, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
