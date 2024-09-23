@implementation PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController

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
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSArray *v26;
  NSArray *persons;
  PUWallpaperNightlySuggestionsPosterConfiguration *v28;
  void *v29;
  PUWallpaperNightlySuggestionsPosterConfiguration *v30;
  PUWallpaperNightlySuggestionsPosterConfiguration *customConfiguration;
  PUWallpaperNightlySuggestionsPosterConfiguration *v32;
  void *v33;
  PUWallpaperNightlySuggestionsPosterConfiguration *v34;
  void *v35;
  PUWallpaperNightlySuggestionsPosterConfiguration *v36;
  PUWallpaperNightlySuggestionsPosterConfiguration *v37;
  void *v38;
  PUWallpaperNightlySuggestionsPosterConfiguration *v39;
  PUWallpaperNightlySuggestionsPosterConfiguration *v40;
  void *v41;
  PUWallpaperNightlySuggestionsPosterConfiguration *v42;
  PUWallpaperNightlySuggestionsPosterConfiguration *v43;
  void *v44;
  PUWallpaperNightlySuggestionsPosterConfiguration *v45;
  PUWallpaperNightlySuggestionsPosterConfiguration *v46;
  NSArray *v47;
  NSArray *posterConfigurations;
  PUWallpaperNightlySuggestionsViewController *v49;
  PUPassiveContentDebugViewSpec *v50;
  PUWallpaperNightlySuggestionsViewController *v51;
  PUWallpaperNightlySuggestionsViewController *suggestionViewController;
  void *v53;
  void *v54;
  void *v55;
  PUWallpaperNightlySuggestionsPosterConfiguration *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _QWORD v70[6];
  _BYTE v71[128];
  _QWORD v72[5];

  v72[3] = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController;
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController viewDidLoad](&v69, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subtype = %d"), 652);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("context != nil"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v10);

  v62 = v4;
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v66;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v66 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v17), "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v12, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchPersonsWithLocalIdentifiers:options:", v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "fetchedObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __84__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController_viewDidLoad__block_invoke;
  v63[3] = &unk_1E589DD48;
  v25 = v12;
  v64 = v25;
  objc_msgSend(v24, "sortedArrayUsingComparator:", v63);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  persons = self->_persons;
  self->_persons = v26;

  if (-[NSArray count](self->_persons, "count"))
  {
    v28 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PUWallpaperNightlySuggestionsPosterConfiguration initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:](v28, "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", CFSTR("Custom…"), v29, 1, 0, 0);
    customConfiguration = self->_customConfiguration;
    self->_customConfiguration = v30;

    v32 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    v33 = (void *)MEMORY[0x1E0C99E60];
    -[NSArray firstObject](self->_persons, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "localIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithObject:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[PUWallpaperNightlySuggestionsPosterConfiguration initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:](v32, "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", CFSTR("Top Person"), v57, 0, 0, 0);
    v70[0] = v56;
    v61 = v20;
    v34 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    v60 = v25;
    v35 = (void *)MEMORY[0x1E0C99E60];
    -[NSArray objectAtIndexedSubscript:](self->_persons, "objectAtIndexedSubscript:", arc4random_uniform(-[NSArray count](self->_persons, "count")));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithObject:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[PUWallpaperNightlySuggestionsPosterConfiguration initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:](v34, "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", CFSTR("Non-Top Person"), v53, 0, 0, 0);
    v70[1] = v36;
    v37 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PUWallpaperNightlySuggestionsPosterConfiguration initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:](v37, "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", CFSTR("Pets"), v38, 1, 0, 0);
    v70[2] = v39;
    v40 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[PUWallpaperNightlySuggestionsPosterConfiguration initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:](v40, "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", CFSTR("Landscapes"), v41, 0, 1, 0);
    v70[3] = v42;
    v43 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[PUWallpaperNightlySuggestionsPosterConfiguration initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:](v43, "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", CFSTR("Cityscapes"), v44, 0, 0, 1);
    v46 = self->_customConfiguration;
    v70[4] = v45;
    v70[5] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 6);
    v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
    posterConfigurations = self->_posterConfigurations;
    self->_posterConfigurations = v47;

    v20 = v61;
    v25 = v60;

  }
  v49 = [PUWallpaperNightlySuggestionsViewController alloc];
  v50 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v51 = -[PUWallpaperNightlySuggestionsViewController initWithSpec:](v49, "initWithSpec:", v50);
  suggestionViewController = self->_suggestionViewController;
  self->_suggestionViewController = v51;

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *posterConfigurations;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v15)
  {
    objc_msgSend(v15, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAccessoryType:", 3);
    -[PUWallpaperNightlySuggestionsPosterConfiguration personLocalIdentifiers](self->_customConfiguration, "personLocalIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personLocalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperNightlySuggestionsPosterConfiguration setPersonLocalIdentifiers:](self->_customConfiguration, "setPersonLocalIdentifiers:", v11);

LABEL_6:
    goto LABEL_7;
  }
  posterConfigurations = self->_posterConfigurations;
  v13 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndexedSubscript:](posterConfigurations, "objectAtIndexedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "hasPrefix:", CFSTR("Custom"));

  if (!(_DWORD)v13)
  {
    -[PUWallpaperNightlySuggestionsViewController setPosterConfiguration:](self->_suggestionViewController, "setPosterConfiguration:", v8);
    -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", self->_suggestionViewController, 1);
    goto LABEL_6;
  }
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController doCustomPosterConfiguration](self, "doCustomPosterConfiguration");
LABEL_7:

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v12)
  {
    objc_msgSend(v12, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryType:", 0);
    -[PUWallpaperNightlySuggestionsPosterConfiguration personLocalIdentifiers](self->_customConfiguration, "personLocalIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v8, "personLocalIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v11);

    -[PUWallpaperNightlySuggestionsPosterConfiguration setPersonLocalIdentifiers:](self->_customConfiguration, "setPersonLocalIdentifiers:", v10);
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  id v6;
  int *v7;

  v5 = a3;
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = &OBJC_IVAR___PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__persons;
  if (v6 == v5)
    v7 = &OBJC_IVAR___PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__posterConfigurations;
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v7), "count");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell"));
    v10 = (PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell initWithStyle:reuseIdentifier:]([PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell"));
      -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell detailTextLabel](v10, "detailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfLines:", 1);

      -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell detailTextLabel](v10, "detailTextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLineBreakMode:", 0);

    }
    -[NSArray objectAtIndexedSubscript:](self->_posterConfigurations, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell textLabel](v10, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v11);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_persons, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PUWallpaperNightlySuggestionsPosterConfigurationPersonCell"));
    v10 = (PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = -[PUWallpaperNightlySuggestionsPosterConfigurationPersonCell initWithStyle:reuseIdentifier:]([PUWallpaperNightlySuggestionsPosterConfigurationPersonCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PUWallpaperNightlySuggestionsPosterConfigurationPersonCell"));
    objc_msgSend(v9, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell setPersonLocalIdentifier:](v10, "setPersonLocalIdentifier:", v11);
    -[PUWallpaperNightlySuggestionsPosterConfiguration personLocalIdentifiers](self->_customConfiguration, "personLocalIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", v11))
      v13 = 3;
    else
      v13 = 0;
    -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell setAccessoryType:](v10, "setAccessoryType:", v13);

    objc_msgSend(v9, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      objc_msgSend(v9, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
      {
        v14 = v15;
      }
      else
      {
        objc_msgSend(v11, "substringToIndex:", 8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell textLabel](v10, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v14);

  }
  return v10;
}

- (void)doCustomPosterConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v33, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.75);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "bounds");
  v8 = (void *)objc_msgSend(v6, "initWithFrame:", 10.0, 10.0, v7 + -20.0, 100.0);
  objc_msgSend(v8, "setAutoresizingMask:", 34);
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  v32 = v3;
  objc_msgSend(v3, "addSubview:", v8);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", 20.0, 20.0, 180.0, 40.0);
  objc_msgSend(v11, "setAutoresizingMask:", 36);
  objc_msgSend(v11, "setTitle:forState:", CFSTR("Done"), 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleColor:forState:", v12, 0);

  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__doneEditingSettings_, 0xFFFFFFFFLL);
  objc_msgSend(v8, "addSubview:", v11);
  v31 = v11;
  objc_msgSend(v11, "sizeToFit");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 80.0, 180.0, 40.0);
  objc_msgSend(v13, "setAutoresizingMask:", 36);
  objc_msgSend(v13, "setText:", CFSTR("Persons:"));
  v30 = v13;
  objc_msgSend(v8, "addSubview:", v13);
  v14 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v8, "frame");
  v16 = (void *)objc_msgSend(v14, "initWithFrame:style:", 0, 20.0, 120.0, v15 + -40.0, 300.0);
  objc_msgSend(v16, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v16, "setDataSource:", self);
  objc_msgSend(v16, "setDelegate:", self);
  objc_msgSend(v8, "addSubview:", v16);
  if (-[NSArray count](self->_persons, "count"))
  {
    v17 = 0;
    do
    {
      -[PUWallpaperNightlySuggestionsPosterConfiguration personLocalIdentifiers](self->_customConfiguration, "personLocalIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_persons, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "containsObject:", v20);

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "selectRowAtIndexPath:animated:scrollPosition:", v22, 0, 0);

      }
      ++v17;
    }
    while (v17 < -[NSArray count](self->_persons, "count"));
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 440.0, 180.0, 40.0);
  objc_msgSend(v29, "setAutoresizingMask:", 36);
  objc_msgSend(v29, "setText:", CFSTR("Include Pets:"));
  objc_msgSend(v8, "addSubview:", v29);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", 200.0, 440.0, 50.0, 40.0);
  objc_msgSend(v23, "setAutoresizingMask:", 36);
  objc_msgSend(v23, "setOn:", -[PUWallpaperNightlySuggestionsPosterConfiguration includePets](self->_customConfiguration, "includePets"));
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__setIncludePets_, 4096);
  objc_msgSend(v8, "addSubview:", v23);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 500.0, 180.0, 40.0);
  objc_msgSend(v24, "setAutoresizingMask:", 36);
  objc_msgSend(v24, "setText:", CFSTR("Include Landscapes:"));
  objc_msgSend(v8, "addSubview:", v24);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", 200.0, 500.0, 50.0, 40.0);
  objc_msgSend(v25, "setAutoresizingMask:", 36);
  objc_msgSend(v25, "setOn:", -[PUWallpaperNightlySuggestionsPosterConfiguration includeLandscapes](self->_customConfiguration, "includeLandscapes"));
  objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__setIncludeLandscapes_, 4096);
  objc_msgSend(v8, "addSubview:", v25);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 560.0, 180.0, 40.0);
  objc_msgSend(v26, "setAutoresizingMask:", 36);
  objc_msgSend(v26, "setText:", CFSTR("Include Cityscapes:"));
  objc_msgSend(v8, "addSubview:", v26);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", 200.0, 560.0, 50.0, 40.0);
  objc_msgSend(v27, "setAutoresizingMask:", 36);
  objc_msgSend(v27, "setOn:", -[PUWallpaperNightlySuggestionsPosterConfiguration includeCityscapes](self->_customConfiguration, "includeCityscapes"));
  objc_msgSend(v27, "addTarget:action:forControlEvents:", self, sel__setIncludeCityscapes_, 4096);
  objc_msgSend(v8, "addSubview:", v27);
  objc_msgSend(v32, "bounds");
  objc_msgSend(v8, "setFrame:", 10.0, 10.0, v28 + -20.0, 620.0);
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v33, 1, 0);
  self->_isPresentingCustomPosterConfigurationSettings = 1;

}

- (void)_setIncludePets:(id)a3
{
  -[PUWallpaperNightlySuggestionsPosterConfiguration setIncludePets:](self->_customConfiguration, "setIncludePets:", objc_msgSend(a3, "isOn"));
}

- (void)_setIncludeLandscapes:(id)a3
{
  -[PUWallpaperNightlySuggestionsPosterConfiguration setIncludeLandscapes:](self->_customConfiguration, "setIncludeLandscapes:", objc_msgSend(a3, "isOn"));
}

- (void)_setIncludeCityscapes:(id)a3
{
  -[PUWallpaperNightlySuggestionsPosterConfiguration setIncludeCityscapes:](self->_customConfiguration, "setIncludeCityscapes:", objc_msgSend(a3, "isOn"));
}

- (void)_doneEditingSettings:(id)a3
{
  _QWORD v3[5];

  if (self->_isPresentingCustomPosterConfigurationSettings)
  {
    self->_isPresentingCustomPosterConfigurationSettings = 0;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __94__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__doneEditingSettings___block_invoke;
    v3[3] = &unk_1E58ABD10;
    v3[4] = self;
    -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_customConfiguration, 0);
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
  objc_storeStrong((id *)&self->_posterConfigurations, 0);
}

void __94__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__doneEditingSettings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setPosterConfiguration:", v2);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024), 1);

}

uint64_t __84__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "countForObject:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v5, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "countForObject:", v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "compare:", v14);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "faceCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "faceCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "compare:", v17);
    if (!v15)
    {
      objc_msgSend(v6, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v20, "compare:", v18);

    }
  }

  return v15;
}

@end
