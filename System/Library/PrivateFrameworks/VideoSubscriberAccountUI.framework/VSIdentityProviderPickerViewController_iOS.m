@implementation VSIdentityProviderPickerViewController_iOS

- (VSIdentityProviderPickerViewController_iOS)initWithStyle:(int64_t)a3
{
  VSIdentityProviderPickerViewController_iOS *v3;
  VSIdentityProviderPickerViewController_iOS *v4;
  NSArray *identityProviders;
  NSArray *v6;
  NSArray *identityProvidersToDisplay;
  NSString *searchString;
  VSFontCenter *v9;
  VSFontCenter *fontCenter;
  VSOnboardingInfoCenter *v11;
  VSOnboardingInfoCenter *onboardingInfoCenter;
  VSIdentityProviderFilter *v13;
  VSIdentityProviderFilter *filter;
  VSStorefrontFilter *v15;
  VSStorefrontFilter *storefrontFilter;
  VSSearchBarDelegate *v17;
  VSSearchBarDelegate *searchBarDelegate;
  VSSearchBarDelegate *v19;
  void *v20;
  VSIdentityProviderTableViewDataSource *v21;
  VSIdentityProviderTableViewDataSource *unfilteredDataSource;
  VSIdentityProviderTableViewDataSource *v23;
  VSIdentityProviderTableViewDataSource *filteredDataSource;
  VSIdentityProviderTableViewDataSource *v25;
  VSIdentityProviderFilter *v26;
  void *v27;
  VSIdentityProviderTableViewDataSource *v28;
  void *v29;
  VSIdentityProviderTableViewDataSource *v30;
  VSStorefrontFilter *v31;
  void *v32;
  VSIdentityProviderFilter *v33;
  void *v34;
  VSIdentityProviderTableViewDataSource *v35;
  VSIdentityProviderFilter *v36;
  void *v37;
  VSIdentityProviderTableViewDataSource *v38;
  void *v39;
  VSStorefrontFilter *v40;
  void *v41;
  VSIdentityProviderTableViewDataSource *v42;
  VSStorefrontFilter *v43;
  void *v44;
  void *v45;
  id v46;
  objc_super v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v48.receiver = self;
  v48.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  v3 = -[VSIdentityProviderPickerViewController_iOS initWithStyle:](&v48, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
  {
    identityProviders = v3->_identityProviders;
    v6 = (NSArray *)MEMORY[0x24BDBD1A8];
    v3->_identityProviders = (NSArray *)MEMORY[0x24BDBD1A8];

    identityProvidersToDisplay = v4->_identityProvidersToDisplay;
    v4->_identityProvidersToDisplay = v6;

    searchString = v4->_searchString;
    v4->_searchString = (NSString *)&stru_24FE1B848;

    v9 = -[VSFontCenter initWithTraitEnvironment:]([VSFontCenter alloc], "initWithTraitEnvironment:", v4);
    fontCenter = v4->_fontCenter;
    v4->_fontCenter = v9;

    v11 = objc_alloc_init(VSOnboardingInfoCenter);
    onboardingInfoCenter = v4->_onboardingInfoCenter;
    v4->_onboardingInfoCenter = v11;

    v13 = objc_alloc_init(VSIdentityProviderFilter);
    filter = v4->_filter;
    v4->_filter = v13;

    v15 = objc_alloc_init(VSStorefrontFilter);
    storefrontFilter = v4->_storefrontFilter;
    v4->_storefrontFilter = v15;

    v17 = objc_alloc_init(VSSearchBarDelegate);
    searchBarDelegate = v4->_searchBarDelegate;
    v4->_searchBarDelegate = v17;

    v19 = v4->_searchBarDelegate;
    VSMainConcurrencyBindingOptions();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderPickerViewController_iOS vs_bind:toObject:withKeyPath:options:](v4, "vs_bind:toObject:withKeyPath:options:", CFSTR("searchString"), v19, CFSTR("text"), v20);

    v21 = objc_alloc_init(VSIdentityProviderTableViewDataSource);
    unfilteredDataSource = v4->_unfilteredDataSource;
    v4->_unfilteredDataSource = v21;

    v23 = objc_alloc_init(VSIdentityProviderTableViewDataSource);
    filteredDataSource = v4->_filteredDataSource;
    v4->_filteredDataSource = v23;

    v25 = v4->_unfilteredDataSource;
    v26 = v4->_filter;
    VSMainConcurrencyBindingOptions();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderTableViewDataSource vs_bind:toObject:withKeyPath:options:](v25, "vs_bind:toObject:withKeyPath:options:", CFSTR("identityProviders"), v26, CFSTR("filteredIdentityProviders"), v27);

    v28 = v4->_unfilteredDataSource;
    VSMainConcurrencyBindingOptions();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderTableViewDataSource vs_bind:toObject:withKeyPath:options:](v28, "vs_bind:toObject:withKeyPath:options:", CFSTR("additionalProvidersMode"), v4, CFSTR("additionalProvidersMode"), v29);

    v30 = v4->_unfilteredDataSource;
    v31 = v4->_storefrontFilter;
    VSMainConcurrencyBindingOptions();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderTableViewDataSource vs_bind:toObject:withKeyPath:options:](v30, "vs_bind:toObject:withKeyPath:options:", CFSTR("tvProviderSupportedStorefronts"), v31, CFSTR("filteredStorefronts"), v32);

    v33 = v4->_filter;
    VSMainConcurrencyBindingOptions();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderFilter vs_bind:toObject:withKeyPath:options:](v33, "vs_bind:toObject:withKeyPath:options:", CFSTR("allIdentityProviders"), v4, CFSTR("identityProvidersToDisplay"), v34);

    v35 = v4->_filteredDataSource;
    v36 = v4->_filter;
    VSMainConcurrencyBindingOptions();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderTableViewDataSource vs_bind:toObject:withKeyPath:options:](v35, "vs_bind:toObject:withKeyPath:options:", CFSTR("identityProviders"), v36, CFSTR("filteredIdentityProviders"), v37);

    v38 = v4->_filteredDataSource;
    VSMainConcurrencyBindingOptions();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderTableViewDataSource vs_bind:toObject:withKeyPath:options:](v38, "vs_bind:toObject:withKeyPath:options:", CFSTR("additionalProvidersMode"), v4, CFSTR("additionalProvidersMode"), v39);

    v40 = v4->_storefrontFilter;
    VSMainConcurrencyBindingOptions();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStorefrontFilter vs_bind:toObject:withKeyPath:options:](v40, "vs_bind:toObject:withKeyPath:options:", CFSTR("storefronts"), v4, CFSTR("tvProviderSupportedStorefronts"), v41);

    v42 = v4->_filteredDataSource;
    v43 = v4->_storefrontFilter;
    VSMainConcurrencyBindingOptions();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderTableViewDataSource vs_bind:toObject:withKeyPath:options:](v42, "vs_bind:toObject:withKeyPath:options:", CFSTR("tvProviderSupportedStorefronts"), v43, CFSTR("filteredStorefronts"), v44);

    -[VSIdentityProviderPickerViewController_iOS setDefinesPresentationContext:](v4, "setDefinesPresentationContext:", 1);
    v49[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (id)-[VSIdentityProviderPickerViewController_iOS registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v45, &__block_literal_global_15);

  }
  return v4;
}

- (VSIdentityProviderPickerViewController_iOS)init
{
  return -[VSIdentityProviderPickerViewController_iOS initWithStyle:](self, "initWithStyle:", 1);
}

- (void)setResourceTitle:(id)a3
{
  NSString *v4;
  NSString *resourceTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  resourceTitle = self->_resourceTitle;
  self->_resourceTitle = v4;

  -[VSIdentityProviderPickerViewController_iOS _updateTableHeaderTitle](self, "_updateTableHeaderTitle");
}

- (void)setAdditionalProvidersMode:(unint64_t)a3
{
  self->_additionalProvidersMode = a3;
  -[VSIdentityProviderPickerViewController_iOS _updateTableHeaderTitle](self, "_updateTableHeaderTitle");
}

- (void)setRequestingAppDisplayName:(id)a3
{
  NSString *v4;
  NSString *requestingAppDisplayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  requestingAppDisplayName = self->_requestingAppDisplayName;
  self->_requestingAppDisplayName = v4;

  -[VSIdentityProviderPickerViewController_iOS _updateTableHeaderTitle](self, "_updateTableHeaderTitle");
}

- (void)setSearchString:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_searchString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_searchString, a3);
    if (-[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode") == 6)
      -[VSIdentityProviderPickerViewController_iOS storefrontFilter](self, "storefrontFilter");
    else
      -[VSIdentityProviderPickerViewController_iOS filter](self, "filter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSearchQuery:", v6);

  }
}

- (void)setRequestedStorefrontCountryCode:(id)a3
{
  -[VSIdentityProviderPickerViewController_iOS setRequestedStorefrontCountryCode:defaultToDeveloperProviders:](self, "setRequestedStorefrontCountryCode:defaultToDeveloperProviders:", a3, 0);
}

- (void)setRequestedStorefrontCountryCode:(id)a3 defaultToDeveloperProviders:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  void *v8;
  void *v9;
  VSIdentityProviderStorefrontParser *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;

  v4 = a4;
  v23 = a3;
  objc_storeStrong((id *)&self->_requestedStorefrontCountryCode, a3);
  v7 = -[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode");
  if (v23 || v7 - 5 < 2)
  {
    -[VSIdentityProviderPickerViewController_iOS providersByStorefrontCountryCode](self, "providersByStorefrontCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(VSIdentityProviderStorefrontParser);
      -[VSIdentityProviderPickerViewController_iOS identityProviders](self, "identityProviders");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSIdentityProviderStorefrontParser setAllIdentityProviders:](v10, "setAllIdentityProviders:", v11);

      -[VSIdentityProviderPickerViewController_iOS allStorefronts](self, "allStorefronts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[VSIdentityProviderStorefrontParser setAllStorefronts:withCurrentStorefrontCode:](v10, "setAllStorefronts:withCurrentStorefrontCode:", v12, v23);
      -[VSIdentityProviderStorefrontParser identityProvidersByStorefront](v10, "identityProvidersByStorefront");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSIdentityProviderStorefrontParser tvProviderSupportedStorefronts](v10, "tvProviderSupportedStorefronts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSIdentityProviderPickerViewController_iOS setProvidersByStorefrontCountryCode:](self, "setProvidersByStorefrontCountryCode:", v13);
      -[VSIdentityProviderPickerViewController_iOS setTvProviderSupportedStorefronts:](self, "setTvProviderSupportedStorefronts:", v14);

    }
    -[VSIdentityProviderPickerViewController_iOS providersByStorefrontCountryCode](self, "providersByStorefrontCountryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The requestedStorefrontCountryCode parameter must not be nil."));
    objc_msgSend(v15, "valueForKey:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderPickerViewController_iOS providersByStorefrontCountryCode](self, "providersByStorefrontCountryCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", CFSTR("__"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4
      && v17
      && (objc_msgSend(v17, "allIdentityProviders"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v19))
    {
      objc_msgSend(v17, "allIdentityProviders");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v8)
      {
        v22 = 6;
        goto LABEL_18;
      }
      v21 = v8;
      objc_msgSend(v21, "featureProvidersInCurrentStorefront");
      objc_msgSend(v21, "allIdentityProviders");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[VSIdentityProviderPickerViewController_iOS setIdentityProvidersToDisplay:](self, "setIdentityProvidersToDisplay:", v20);

    v22 = 5;
LABEL_18:
    -[VSIdentityProviderPickerViewController_iOS setAdditionalProvidersMode:](self, "setAdditionalProvidersMode:", v22);

    goto LABEL_19;
  }
  -[VSIdentityProviderPickerViewController_iOS identityProviders](self, "identityProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderPickerViewController_iOS setIdentityProvidersToDisplay:](self, "setIdentityProvidersToDisplay:", v8);
LABEL_19:

}

- (UITableViewHeaderFooterView)firstSectionHeaderView
{
  UITableViewHeaderFooterView *firstSectionHeaderView;
  void *v4;
  UITableViewHeaderFooterView *v5;
  void *v6;
  UITableViewHeaderFooterView *v7;

  firstSectionHeaderView = self->_firstSectionHeaderView;
  if (!firstSectionHeaderView)
  {
    -[VSIdentityProviderPickerViewController_iOS _titleForTableHeaderView](self, "_titleForTableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x24BDF6E78]);
      -[VSIdentityProviderPickerViewController_iOS _createTableHeaderContentConfiguration:](self, "_createTableHeaderContentConfiguration:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewHeaderFooterView setContentConfiguration:](v5, "setContentConfiguration:", v6);

    }
    else
    {
      if (-[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode") == 3)
      {
LABEL_7:

        firstSectionHeaderView = self->_firstSectionHeaderView;
        return firstSectionHeaderView;
      }
      v5 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x24BDF6E78]);
    }
    v7 = self->_firstSectionHeaderView;
    self->_firstSectionHeaderView = v5;

    goto LABEL_7;
  }
  return firstSectionHeaderView;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  -[VSIdentityProviderPickerViewController_iOS tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (!a4 && v7 == v6)
  {
    -[VSIdentityProviderPickerViewController_iOS firstSectionHeaderView](self, "firstSectionHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_createTableHeaderContentConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDF6B80];
  v4 = a3;
  objc_msgSend(v3, "groupedHeaderConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v4);

  return v5;
}

- (void)_updateTableHeaderTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[VSIdentityProviderPickerViewController_iOS _titleForTableHeaderView](self, "_titleForTableHeaderView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[VSIdentityProviderPickerViewController_iOS firstSectionHeaderView](self, "firstSectionHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderPickerViewController_iOS _createTableHeaderContentConfiguration:](self, "_createTableHeaderContentConfiguration:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContentConfiguration:", v4);

    -[VSIdentityProviderPickerViewController_iOS parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderPickerViewController_iOS _titleForViewController](self, "_titleForViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

    -[VSIdentityProviderPickerViewController_iOS _titleForViewController](self, "_titleForViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderPickerViewController_iOS setTitle:](self, "setTitle:", v7);

  }
}

- (id)_titleForTableHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;

  if (-[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode") != 3)
  {
    -[VSIdentityProviderPickerViewController_iOS resourceTitle](self, "resourceTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("IDENTITY_PROVIDER_PICKER_APP_MESSAGE_FORMAT"), 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x24BDD17C8];
      -[VSIdentityProviderPickerViewController_iOS requestingAppDisplayName](self, "requestingAppDisplayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v6, v4, v8);
    }
    else
    {
      -[VSIdentityProviderPickerViewController_iOS requestingAppDisplayName](self, "requestingAppDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v12 = -[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode");
        objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13;
        if (v12 == 6)
          v14 = CFSTR("REGIONS_PICKER_SETTINGS_MESSAGE_TV");
        else
          v14 = CFSTR("IDENTITY_PROVIDER_PICKER_HEADER");
        objc_msgSend(v13, "localizedStringForKey:value:table:", v14, 0, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("IDENTITY_PROVIDER_PICKER_APP_MESSAGE_NO_RESOURCE_TITLE_FORMAT"), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v6, v15);
    }
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v3 = (void *)v10;

    return v3;
  }
  v3 = 0;
  return v3;
}

- (id)titleForTableFooterView
{
  unint64_t v2;
  void *v3;
  void *v4;

  v2 = -[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode");
  v3 = 0;
  if (v2 <= 6 && ((1 << v2) & 0x64) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IDENTITY_PROVIDER_PICKER_SETTINGS_FOOTER"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_titleForViewController
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode");
  if (v2 >= 6)
  {
    if (v2 != 6)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("REGIONS_PICKER_TITLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("TV_PROVIDER_TITLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_didPickIdentityProvider:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VSIdentityProviderPickerViewController_iOS delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "identityProviderPickerViewController:didPickIdentityProvider:", self, v5);

}

- (void)_didPickAdditionalIdentityProviders
{
  unint64_t v3;
  void *v4;
  id v5;

  -[VSIdentityProviderPickerViewController_iOS delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode");
  if ((objc_opt_respondsToSelector() & 1) != 0 && v3 - 7 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v5, "identityProviderPickerViewControllerDidPickAdditionalIdentityProviders:", self);
  }
  else
  {
    -[VSIdentityProviderPickerViewController_iOS searchBarDelegate](self, "searchBarDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearText");

    -[VSIdentityProviderPickerViewController_iOS setAdditionalProvidersMode:](self, "setAdditionalProvidersMode:", 6);
    -[VSIdentityProviderPickerViewController_iOS _updateTableHeaderTitle](self, "_updateTableHeaderTitle");
  }

}

- (void)_didPickStorefront:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSIdentityProviderPickerViewController_iOS searchBarDelegate](self, "searchBarDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearText");

  objc_msgSend(v4, "identitifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderPickerViewController_iOS setRequestedStorefrontCountryCode:](self, "setRequestedStorefrontCountryCode:", v6);
  -[VSIdentityProviderPickerViewController_iOS _updateTableHeaderTitle](self, "_updateTableHeaderTitle");
}

- (void)dismissSearchControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[VSIdentityProviderPickerViewController_iOS searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resignFirstResponder");

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__VSIdentityProviderPickerViewController_iOS_dismissSearchControllerAnimated_completion___block_invoke;
  v9[3] = &unk_24FE1AD78;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[VSIdentityProviderPickerViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v9);

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  -[VSIdentityProviderPickerViewController_iOS delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "identityProviderPickerViewControllerDidCancel:", self);

}

- (void)_showAboutPrivacy:(id)a3
{
  id v4;

  -[VSIdentityProviderPickerViewController_iOS onboardingInfoCenter](self, "onboardingInfoCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentDetailsFromViewController:", self);

}

- (void)_performSelectionForIdentityProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4)
    -[VSIdentityProviderPickerViewController_iOS _didPickIdentityProvider:](self, "_didPickIdentityProvider:", v4);
  else
    -[VSIdentityProviderPickerViewController_iOS _didPickAdditionalIdentityProviders](self, "_didPickAdditionalIdentityProviders");

}

- (void)setCancellationAllowed:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_cancellationAllowed != a3)
  {
    self->_cancellationAllowed = a3;
    if (a3)
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
    else
      v5 = 0;
    -[VSIdentityProviderPickerViewController_iOS navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v5);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, tableViewDataSource was %@, instead of VSIdentityProviderTableViewDataSource."), v10);

  }
  v11 = v6;
  if (objc_msgSend(v11, "additionalProvidersMode") == 6)
  {
    objc_msgSend(v11, "storefrontAtIndexPath:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderPickerViewController_iOS _didPickStorefront:](self, "_didPickStorefront:", v12);
  }
  else
  {
    objc_msgSend(v11, "identityProviderForRowAtIndexPath:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderPickerViewController_iOS searchController](self, "searchController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isActive"))
    {
      -[VSIdentityProviderPickerViewController_iOS setSelectedIdentityProvider:](self, "setSelectedIdentityProvider:", v12);
      -[VSIdentityProviderPickerViewController_iOS dismissSearchControllerAnimated:completion:](self, "dismissSearchControllerAnimated:completion:", 1, 0);
    }
    else
    {
      -[VSIdentityProviderPickerViewController_iOS _performSelectionForIdentityProvider:](self, "_performSelectionForIdentityProvider:", v12);
    }

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BDF7DE0];
}

- (void)tableViewDidFinishReload:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "contentOffset");
  v4 = v3;
  objc_msgSend(v7, "tableHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v7, "convertRect:fromView:", v6);
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
LABEL_5:
    objc_msgSend(v7, "setNeedsFocusUpdate");
    goto LABEL_6;
  }
  if (v4 > 0.0)
  {
    objc_msgSend(v7, "vs_scrollToTopAnimated:", 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (UISearchController)searchController
{
  -[VSIdentityProviderPickerViewController_iOS loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_searchController;
}

- (void)deselectSelectedProviderAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
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
  v15 = *MEMORY[0x24BDAC8D0];
  -[VSIdentityProviderPickerViewController_iOS tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "indexPathsForSelectedRows", 0);
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
        objc_msgSend(v4, "deselectRowAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  objc_super v35;
  NSRange v36;

  v35.receiver = self;
  v35.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  -[VSIdentityProviderPickerViewController_iOS viewDidLoad](&v35, sel_viewDidLoad);
  -[VSIdentityProviderPickerViewController_iOS tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSectionIndexBackgroundColor:", v4);

  -[VSIdentityProviderPickerViewController_iOS unfilteredDataSource](self, "unfilteredDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTableView:", v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E68]), "initWithStyle:", objc_msgSend(v3, "style"));
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSectionIndexBackgroundColor:", v8);

  objc_msgSend(v7, "setDelegate:", self);
  -[VSIdentityProviderPickerViewController_iOS filteredDataSource](self, "filteredDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTableView:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D68]), "initWithSearchResultsController:", v6);
  -[VSIdentityProviderPickerViewController_iOS setSearchController:](self, "setSearchController:", v10);
  objc_msgSend(v10, "searchBar");
  v11 = objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderPickerViewController_iOS searchBarDelegate](self, "searchBarDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v11;
  objc_msgSend(v12, "setSearchBar:", v11);

  v13 = -[VSIdentityProviderPickerViewController_iOS additionalProvidersMode](self, "additionalProvidersMode");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderPickerViewController_iOS titleForTableFooterView](self, "titleForTableFooterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v14, "addObject:", v15);
  v32 = v6;
  if (v13 == 3)
  {
    v16 = 0;
  }
  else
  {
    -[VSIdentityProviderPickerViewController_iOS onboardingInfoCenter](self, "onboardingInfoCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tvProviderPrivacyButtonViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v9;
      v19 = v5;
      objc_msgSend(v18, "flow");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedButtonTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v14, "addObject:", v16);
      v5 = v19;
      v9 = v29;
    }
    else
    {
      v16 = 0;
    }

  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __57__VSIdentityProviderPickerViewController_iOS_viewDidLoad__block_invoke;
  v33[3] = &unk_24FE1ADA0;
  v22 = v21;
  v34 = v22;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v33);
  if (objc_msgSend(v22, "length"))
  {
    v28 = v5;
    v30 = v9;
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("footer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", v22, *MEMORY[0x24BE75A58]);
    if (v16)
    {
      v36.location = objc_msgSend(v22, "rangeOfString:", v16);
      NSStringFromRange(v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setProperty:forKey:", v24, *MEMORY[0x24BE75A40]);

      NSStringFromSelector(sel_showPrivacySheet_);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setProperty:forKey:", v25, *MEMORY[0x24BE75A38]);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setProperty:forKey:", v26, *MEMORY[0x24BE75A50]);

    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE754F8]), "initWithSpecifier:", v23);
    objc_msgSend(v27, "setPreservesSuperviewLayoutMargins:", 1);
    -[VSIdentityProviderPickerViewController_iOS setFooterView:](self, "setFooterView:", v27);

    v5 = v28;
    v9 = v30;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  -[VSIdentityProviderPickerViewController_iOS viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VSIdentityProviderPickerViewController_iOS setReadyToHandleDeepLinks:](self, "setReadyToHandleDeepLinks:", 1);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;

  if (objc_msgSend(a3, "numberOfSections") - 1 == a4)
  {
    -[VSIdentityProviderPickerViewController_iOS footerView](self, "footerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)filteredTableView
{
  void *v2;
  void *v3;

  -[VSIdentityProviderPickerViewController_iOS filteredDataSource](self, "filteredDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLayoutMarginsFollowReadableWidth:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[VSIdentityProviderPickerViewController_iOS tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutMarginsFollowReadableWidth:", v3);

  -[VSIdentityProviderPickerViewController_iOS filteredTableView](self, "filteredTableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayoutMarginsFollowReadableWidth:", v3);

}

- (void)setSectionContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  id v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[VSIdentityProviderPickerViewController_iOS tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSectionContentInset:", top, left, bottom, right);

  -[VSIdentityProviderPickerViewController_iOS filteredTableView](self, "filteredTableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSectionContentInset:", top, left, bottom, right);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    -[VSIdentityProviderPickerViewController_iOS presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[VSIdentityProviderPickerViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  -[VSIdentityProviderPickerViewController_iOS willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v4);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  -[VSIdentityProviderPickerViewController_iOS viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[VSIdentityProviderPickerViewController_iOS setLayoutMarginsFollowReadableWidth:](self, "setLayoutMarginsFollowReadableWidth:", -[VSIdentityProviderPickerViewController_iOS _shouldInsetListView](self, "_shouldInsetListView"));
  -[VSIdentityProviderPickerViewController_iOS tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSectionContentInsetFollowsLayoutMargins:", -[VSIdentityProviderPickerViewController_iOS _shouldInsetListView](self, "_shouldInsetListView"));

  -[VSIdentityProviderPickerViewController_iOS filteredTableView](self, "filteredTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSectionContentInsetFollowsLayoutMargins:", -[VSIdentityProviderPickerViewController_iOS _shouldInsetListView](self, "_shouldInsetListView"));

}

- (BOOL)_shouldInsetListView
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  double Width;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  int v12;
  CGRect v15;

  -[VSIdentityProviderPickerViewController_iOS view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
    goto LABEL_2;
  if (!_os_feature_enabled_impl())
    goto LABEL_15;
  objc_msgSend(v2, "frame");
  Width = CGRectGetWidth(v15);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDF7680], *MEMORY[0x24BDF7678], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  v10 = objc_msgSend(v4, "horizontalSizeClass");
  if (Width <= 320.0 && (v9 & 1) != 0)
    goto LABEL_15;
  v11 = Width <= 320.0;
  if (Width <= 320.0)
    v12 = 1;
  else
    v12 = v9;
  if (v10 != 2)
    v11 = 1;
  if ((v11 | v9 ^ 1) != 1 || v12 == 0)
LABEL_2:
    v5 = 1;
  else
LABEL_15:
    v5 = 0;

  return v5;
}

- (void)showPrivacySheet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSIdentityProviderPickerViewController_iOS presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VSIdentityProviderPickerViewController_iOS presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__VSIdentityProviderPickerViewController_iOS_showPrivacySheet___block_invoke;
    v7[3] = &unk_24FE19E30;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else
  {
    -[VSIdentityProviderPickerViewController_iOS _showPrivacySheet:](self, "_showPrivacySheet:", v4);
  }

}

- (void)_showPrivacySheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", 0x24FE1CBE8);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)handleDestination:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v11, "isEqual:", CFSTR("signIn")))
  {
    -[VSIdentityProviderPickerViewController_iOS handleSignInActionWithCompletion:](self, "handleSignInActionWithCompletion:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[VSIdentityProviderPickerViewController_iOS debugDescription](self, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected destination %@ for %@"), v11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VSDestinationError(2, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v10);

  }
}

- (void)handleSignInActionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke;
  v6[3] = &unk_24FE1AD78;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIViewController vs_makeTopmostInNavigationStack:completion:](self, "vs_makeTopmostInNavigationStack:completion:", 1, v6);

}

- (VSIdentityProviderPickerViewControllerDelegate)delegate
{
  return (VSIdentityProviderPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (NSArray)identityProviders
{
  return self->_identityProviders;
}

- (void)setIdentityProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (unint64_t)additionalProvidersMode
{
  return self->_additionalProvidersMode;
}

- (NSString)requestingAppDisplayName
{
  return self->_requestingAppDisplayName;
}

- (NSString)resourceTitle
{
  return self->_resourceTitle;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (NSString)requestedStorefrontCountryCode
{
  return self->_requestedStorefrontCountryCode;
}

- (NSArray)allStorefronts
{
  return self->_allStorefronts;
}

- (void)setAllStorefronts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (VSOnboardingInfoCenter)onboardingInfoCenter
{
  return self->_onboardingInfoCenter;
}

- (void)setOnboardingInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingInfoCenter, a3);
}

- (VSIdentityProviderFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (VSSearchBarDelegate)searchBarDelegate
{
  return self->_searchBarDelegate;
}

- (void)setSearchBarDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarDelegate, a3);
}

- (VSIdentityProviderTableViewDataSource)unfilteredDataSource
{
  return self->_unfilteredDataSource;
}

- (void)setUnfilteredDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredDataSource, a3);
}

- (VSIdentityProviderTableViewDataSource)filteredDataSource
{
  return self->_filteredDataSource;
}

- (void)setFilteredDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_filteredDataSource, a3);
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
  objc_storeStrong((id *)&self->_fontCenter, a3);
}

- (VSIdentityProvider)selectedIdentityProvider
{
  return self->_selectedIdentityProvider;
}

- (void)setSelectedIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIdentityProvider, a3);
}

- (BOOL)sectionContentInsetInitialized
{
  return self->_sectionContentInsetInitialized;
}

- (void)setSectionContentInsetInitialized:(BOOL)a3
{
  self->_sectionContentInsetInitialized = a3;
}

- (NSDictionary)providersByStorefrontCountryCode
{
  return self->_providersByStorefrontCountryCode;
}

- (void)setProvidersByStorefrontCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_providersByStorefrontCountryCode, a3);
}

- (NSArray)tvProviderSupportedStorefronts
{
  return self->_tvProviderSupportedStorefronts;
}

- (void)setTvProviderSupportedStorefronts:(id)a3
{
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, a3);
}

- (NSArray)identityProvidersToDisplay
{
  return self->_identityProvidersToDisplay;
}

- (void)setIdentityProvidersToDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvidersToDisplay, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (VSStorefrontFilter)storefrontFilter
{
  return self->_storefrontFilter;
}

- (void)setStorefrontFilter:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontFilter, a3);
}

- (void)setFirstSectionHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_firstSectionHeaderView, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (BOOL)isReadyToHandleDeepLinks
{
  return self->_readyToHandleDeepLinks;
}

- (void)setReadyToHandleDeepLinks:(BOOL)a3
{
  self->_readyToHandleDeepLinks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_firstSectionHeaderView, 0);
  objc_storeStrong((id *)&self->_storefrontFilter, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_identityProvidersToDisplay, 0);
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, 0);
  objc_storeStrong((id *)&self->_providersByStorefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_selectedIdentityProvider, 0);
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_filteredDataSource, 0);
  objc_storeStrong((id *)&self->_unfilteredDataSource, 0);
  objc_storeStrong((id *)&self->_searchBarDelegate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_onboardingInfoCenter, 0);
  objc_storeStrong((id *)&self->_allStorefronts, 0);
  objc_storeStrong((id *)&self->_requestedStorefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_resourceTitle, 0);
  objc_storeStrong((id *)&self->_requestingAppDisplayName, 0);
  objc_storeStrong((id *)&self->_identityProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
