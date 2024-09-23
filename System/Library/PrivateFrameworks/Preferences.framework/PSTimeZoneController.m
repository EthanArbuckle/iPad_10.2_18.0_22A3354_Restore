@implementation PSTimeZoneController

+ (void)setTimeZone:(id)a3
{
  id v3;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  if (tzlink())
    NSLog(CFSTR("Failed to set the timezone to %@"), v3);

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
  void *v11;
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
  NSArray *v22;
  NSArray *cities;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PSTimeZoneController;
  -[PSTimeZoneController viewDidLoad](&v24, sel_viewDidLoad);
  PS_LocalizedString(CFSTR("TIME_ZONE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTimeZoneController setTitle:](self, "setTitle:", v3);

  -[PSTimeZoneController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDisplaysCellContentStringsOnTapAndHold:", 1);

  -[PSTimeZoneController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("TIMEZONE_CELL"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA980]), "initWithSearchResultsController:", 0);
  -[PSTimeZoneController setSearchController:](self, "setSearchController:", v6);

  -[PSTimeZoneController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchResultsUpdater:", self);

  -[PSTimeZoneController searchController](self, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDimsBackgroundDuringPresentation:", 0);

  -[PSTimeZoneController searchController](self, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutocapitalizationType:", 0);

  -[PSTimeZoneController searchController](self, "searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeyboardType:", 0);

  -[PSTimeZoneController searchController](self, "searchController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutocorrectionType:", 1);

  -[PSTimeZoneController searchController](self, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTimeZoneController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSearchController:", v15);

  -[PSTimeZoneController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidesSearchBarWhenScrolling:", 0);

  -[PSTimeZoneController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[PSTimeZoneController currentTimeZoneCityName](self, "currentTimeZoneCityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    -[PSTimeZoneController searchController](self, "searchController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPlaceholder:", v18);

    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "citiesMatchingName:", v18);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cities = self->_cities;
    self->_cities = v22;

  }
}

- (id)currentTimeZoneCityName
{
  void *v2;
  void *v3;
  void *v4;

  -[PSTimeZoneController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PSCityForSpecifier(v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "displayNameIncludingCountry:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSTimeZoneController;
  -[PSTimeZoneController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PSTimeZoneController_viewDidAppear___block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __38__PSTimeZoneController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "searchController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_cities, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *cities;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TIMEZONE_CELL"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  cities = self->_cities;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](cities, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCity:", v10);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[NSArray objectAtIndex:](self->_cities, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSRootController setPreferenceValue:specifier:](PSRootController, "setPreferenceValue:specifier:", v5, self->_specifier);

  -[PSSpecifier performSetterWithValue:](self->_specifier, "performSetterWithValue:", v9);
  -[PSTimeZoneController parentController](self, "parentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSpecifier:", self->_specifier);

  -[PSTimeZoneController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *cities;
  void *v10;
  id v11;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v5 = v11;
  }
  else
  {
    -[PSTimeZoneController currentTimeZoneCityName](self, "currentTimeZoneCityName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "citiesMatchingName:", v6);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cities = self->_cities;
  self->_cities = v8;

  -[PSTimeZoneController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (PSListController)parentController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_cities, 0);
}

@end
