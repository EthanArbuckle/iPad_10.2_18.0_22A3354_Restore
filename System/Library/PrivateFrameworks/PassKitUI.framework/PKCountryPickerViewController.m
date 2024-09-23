@implementation PKCountryPickerViewController

- (PKCountryPickerViewController)initWithStyle:(int64_t)a3
{
  PKCountryPickerViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCountryPickerViewController;
  result = -[PKCountryPickerViewController initWithStyle:](&v5, sel_initWithStyle_, 0);
  if (result)
    result->_style = a3;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCountryPickerViewController;
  -[PKCountryPickerViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKCountryPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);

  -[PKCountryPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedRowHeight:", 44.0);

  -[PKCountryPickerViewController _loadCountryCodes](self, "_loadCountryCodes");
}

- (void)_loadCountryCodes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PKCountryInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *countries;
  void *v18;
  PKCountryPickerViewController *v19;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v19 = self;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
          v10 = objc_alloc_init(PKCountryInfo);
          PKLocalizedStringForCountryCode();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKCountryInfo setCountryCode:](v10, "setCountryCode:", v9);
          -[PKCountryInfo setLocalizedCountryName:](v10, "setLocalizedCountryName:", v11);
          objc_msgSend(MEMORY[0x1E0D13B08], "addressFormats");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("EDIT_FORMAT"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v21, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    v16 = objc_msgSend(v21, "copy");
    self = v19;
    countries = v19->_countries;
    v19->_countries = (NSArray *)v16;

    v3 = v18;
  }
  -[PKCountryPickerViewController _configureSections](self, "_configureSections", v18);

}

- (void)_configureSections
{
  UILocalizedIndexedCollation *v3;
  UILocalizedIndexedCollation *collation;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v3 = (UILocalizedIndexedCollation *)objc_claimAutoreleasedReturnValue();
  collation = self->_collation;
  self->_collation = v3;

  -[PKCountryPickerViewController collation](self, "collation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    do
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v8, "addObject:", v10);

      --v9;
    }
    while (v9);
  }
  v24 = v7;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PKCountryPickerViewController countries](self, "countries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[PKCountryPickerViewController collation](self, "collation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "sectionForObject:collationStringSelector:", v16, sel_localizedCountryName);

        objc_msgSend(v8, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  if (v7)
  {
    v20 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCountryPickerViewController collation](self, "collation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sortedArrayFromArray:collationStringSelector:", v21, sel_localizedCountryName);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v23, v20);

      ++v20;
    }
    while (v24 != v20);
  }
  -[PKCountryPickerViewController setSections:](self, "setSections:", v8);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[UILocalizedIndexedCollation sectionTitles](self->_collation, "sectionTitles", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;

  if (-[PKCountryPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) < 1)
  {
    v7 = 0;
  }
  else
  {
    -[UILocalizedIndexedCollation sectionTitles](self->_collation, "sectionTitles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v3;
  void *v4;

  -[PKCountryPickerViewController collation](self, "collation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIndexTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v6;
  int64_t v7;

  -[PKCountryPickerViewController collation](self, "collation", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionForSectionIndexTitleAtIndex:", a5);

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
    objc_msgSend(v7, "setSelectionStyle:", 3);
    objc_msgSend(v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  }
  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedCountryName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v14, v7);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  sections = self->_sections;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "row");

  objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCountryPickerViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "countryPicker:didPickCountryCode:", self, v12);

  objc_msgSend(v8, "indexPathForSelectedRow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v13, 1);

}

- (PKCountryPickerViewControllerDelegate)delegate
{
  return (PKCountryPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (void)setCollation:(id)a3
{
  objc_storeStrong((id *)&self->_collation, a3);
}

- (NSArray)countries
{
  return self->_countries;
}

- (void)setCountries:(id)a3
{
  objc_storeStrong((id *)&self->_countries, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_countries, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
