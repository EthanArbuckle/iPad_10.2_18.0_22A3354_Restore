@implementation PKPaymentSetupFieldPicker

- (unint64_t)fieldType
{
  return 5;
}

- (void)updateWithAttribute:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *pickerItems;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentSetupFieldPicker;
  -[PKPaymentSetupField updateWithAttribute:](&v21, sel_updateWithAttribute_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "pickerItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          +[PKPaymentSetupFieldPickerItem _itemWithDIAttributePickerItem:](PKPaymentSetupFieldPickerItem, "_itemWithDIAttributePickerItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      v13 = (NSArray *)objc_msgSend(v6, "copy");
      pickerItems = self->_pickerItems;
      self->_pickerItems = v13;

    }
    objc_msgSend(v5, "defaultValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
      -[PKPaymentSetupFieldPicker setDefaultValue:](self, "setDefaultValue:", v16);

  }
  -[PKPaymentSetupFieldPicker _commonUpdate](self, "_commonUpdate");

}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  PKPaymentSetupFieldPickerItem *v14;
  PKPaymentSetupFieldPickerItem *v15;
  NSArray *v16;
  NSArray *pickerItems;
  __CFString *v18;
  __CFString *v19;
  char v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  char v24;
  __CFString *v25;
  __CFString *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPaymentSetupFieldPicker;
  -[PKPaymentSetupField updateWithConfiguration:](&v35, sel_updateWithConfiguration_, v4);
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("pickerItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v14 = [PKPaymentSetupFieldPickerItem alloc];
          v15 = -[PKPaymentSetupFieldPickerItem initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v31);
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v16 = (NSArray *)objc_msgSend(v7, "copy");
    pickerItems = self->_pickerItems;
    self->_pickerItems = v16;

  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("pickerType"), (_QWORD)v31);
  v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 == CFSTR("radio"))
    goto LABEL_15;
  if (!v18)
    goto LABEL_22;
  v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("radio"));

  if ((v20 & 1) != 0)
  {
LABEL_15:
    v21 = 1;
    goto LABEL_23;
  }
  v22 = v19;
  if (v22 == CFSTR("multilevelList")
    || (v23 = v22,
        v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("multilevelList")),
        v23,
        (v24 & 1) != 0))
  {
    v21 = 2;
    goto LABEL_23;
  }
  v25 = v23;
  if (v25 == CFSTR("menu")
    || (v26 = v25, v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("menu")), v26, v27))
  {
    v21 = 3;
  }
  else
  {
LABEL_22:
    v21 = 0;
  }
LABEL_23:

  self->_pickerType = v21;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");
  if (v29)
    v30 = (void *)objc_msgSend(v28, "copy");
  else
    v30 = 0;
  objc_storeStrong((id *)&self->_localizedDescription, v30);
  if (v29)

  -[PKPaymentSetupFieldPicker _commonUpdate](self, "_commonUpdate");
}

- (void)_commonUpdate
{
  -[PKPaymentSetupField setLocalizedPlaceholder:](self, "setLocalizedPlaceholder:", 0);
  -[PKPaymentSetupField setDisplayFormat:](self, "setDisplayFormat:", 0);
  -[PKPaymentSetupFieldPicker _updateCurrentValuePickerItem](self, "_updateCurrentValuePickerItem");
}

- (void)setCurrentValue:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *currentValue;
  NSObject *v11;

  v4 = a3;
  v5 = v4;
  if (self->super._currentValue != v4)
  {
    v11 = v4;
    if (!v4 || (v6 = -[NSArray containsObject:](self->_pickerItems, "containsObject:", v4), v5 = v11, v6))
    {
      -[PKPaymentSetupField attribute](self, "attribute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject attributePickerItem](v11, "attributePickerItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCurrentValue:", v8);

      v9 = -[NSObject copyWithZone:](v11, "copyWithZone:", 0);
      currentValue = self->super._currentValue;
      self->super._currentValue = v9;

      -[PKPaymentSetupField noteCurrentValueChanged](self, "noteCurrentValueChanged");
      v5 = v11;
    }
  }

}

- (void)setDefaultValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldPicker;
  -[PKPaymentSetupField setDefaultValue:](&v4, sel_setDefaultValue_, a3);
  -[PKPaymentSetupFieldPicker _updateCurrentValuePickerItem](self, "_updateCurrentValuePickerItem");
}

- (id)defaultPickerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupField defaultValue](self, "defaultValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[PKPaymentSetupField defaultValue](self, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickerItemMatchingValue:pickerItems:", v5, self->_pickerItems);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setPickerItems:(id)a3
{
  NSArray *v5;
  NSArray *pickerItems;
  NSArray *v7;

  v5 = (NSArray *)a3;
  pickerItems = self->_pickerItems;
  v7 = v5;
  if (v5 && pickerItems)
  {
    if ((-[NSArray isEqual:](v5, "isEqual:") & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (pickerItems != v5)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_pickerItems, a3);
    -[PKPaymentSetupFieldPicker _updateCurrentValuePickerItem](self, "_updateCurrentValuePickerItem");
  }
LABEL_7:

}

- (PKPaymentSetupFieldPickerItem)currentValue
{
  return (PKPaymentSetupFieldPickerItem *)self->super._currentValue;
}

+ (id)pickerItemMatchingValue:(id)a3 pickerItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PKPaymentSetupFieldPicker_pickerItemMatchingValue_pickerItems___block_invoke;
  v9[3] = &unk_1E2AC1610;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __65__PKPaymentSetupFieldPicker_pickerItemMatchingValue_pickerItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "submissionValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {
    v10 = 1;
    v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  v9 = objc_msgSend(v6, "caseInsensitiveCompare:", v7);

  if (v9)
  {
LABEL_8:
    objc_msgSend(v3, "localizedDisplayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    v11 = v12;
    v14 = v13;
    v15 = v14;
    if (v11 == v14)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v11 && v14)
        v10 = objc_msgSend(v11, "caseInsensitiveCompare:", v14) == 0;
    }

    goto LABEL_14;
  }
  v10 = 1;
LABEL_15:

  return v10;
}

- (void)_updateCurrentValuePickerItem
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupField defaultValue](self, "defaultValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "pickerItemMatchingValue:pickerItems:", v3, self->_pickerItems);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "submissionValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Setting picker currentValue to %@", (uint8_t *)&v7, 0xCu);

      }
      -[PKPaymentSetupFieldPicker setCurrentValue:](self, "setCurrentValue:", v4);
    }

  }
}

- (id)displayString
{
  return (id)-[NSObject localizedDisplayName](self->super._currentValue, "localizedDisplayName");
}

- (id)_submissionStringForValue:(id)a3
{
  return (id)objc_msgSend(a3, "submissionValue");
}

- (BOOL)submissionStringMeetsAllRequirements
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupField submissionString](self, "submissionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldPicker;
  v4 = -[PKPaymentSetupField copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 18) = self->_pickerType;
  objc_storeStrong((id *)v4 + 17, self->_pickerItems);
  return v4;
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (unint64_t)pickerType
{
  return self->_pickerType;
}

- (void)setPickerType:(unint64_t)a3
{
  self->_pickerType = a3;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_pickerItems, 0);
}

@end
