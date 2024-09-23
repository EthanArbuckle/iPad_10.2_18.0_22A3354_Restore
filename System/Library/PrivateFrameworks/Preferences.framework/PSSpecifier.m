@implementation PSSpecifier

- (int64_t)cellType
{
  return self->cellType;
}

- (NSString)identifier
{
  void *v3;
  NSObject *v4;

  -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("label")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("key")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[PSSpecifier name](self, "name"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _PSLoggingFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[PSSpecifier identifier].cold.1((uint64_t)v3, self, v4);

    }
  }
  return (NSString *)v3;
}

- (id)propertyForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
}

+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v14;
  id v15;
  PSSpecifier *v16;

  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(PSSpecifier);
  -[PSSpecifier setName:](v16, "setName:", v15);

  objc_storeWeak(&v16->target, v14);
  v16->getter = a6;
  v16->setter = a5;
  v16->detailControllerClass = a7;
  v16->cellType = a8;
  v16->editPaneClass = a9;
  return v16;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (PSSpecifier)init
{
  PSSpecifier *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *properties;
  objc_super v7;

  gScale = (int)ScreenScale();
  v7.receiver = self;
  v7.super_class = (Class)PSSpecifier;
  v3 = -[PSSpecifier init](&v7, sel_init);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v3->_properties;
    v3->_properties = v4;

  }
  return v3;
}

- (SEL)legacyAction
{
  return self->action;
}

- (void)setButtonAction:(SEL)a3
{
  self->_buttonAction = a3;
}

- (void)setupIconImageWithBundle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setupIconImageWithPath:](self, "setupIconImageWithPath:", v4);

  -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("iconImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v23;
  if (!v5)
  {
    -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("icon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v23, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_9;
    }
    -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("icon2"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageNamed:inBundle:compatibleWithTraitCollection:", v13, v23, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_9;
    }
    -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("tintedIcon"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v11 = (void *)v17;
      v18 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageNamed:inBundle:compatibleWithTraitCollection:", v11, v23, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_10:

        goto LABEL_11;
      }
      SFTintedImageFromMask();
      v22 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v22;
      if (v22)
      {
LABEL_9:
        -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v11, CFSTR("iconImage"));
        goto LABEL_10;
      }
    }
LABEL_11:

    v6 = v23;
  }

}

- (void)setControllerLoadAction:(SEL)a3
{
  self->_controllerLoadAction = a3;
}

- (void)setProperties:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *properties;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  properties = self->_properties;
  self->_properties = v4;

}

- (void)setLegacyCancel:(SEL)a3
{
  self->cancel = a3;
}

- (void)setLegacyAction:(SEL)a3
{
  self->action = a3;
}

- (void)setConfirmationCancelAction:(SEL)a3
{
  self->_confirmationCancelAction = a3;
}

- (void)setConfirmationAction:(SEL)a3
{
  self->_confirmationAction = a3;
}

+ (int64_t)keyboardTypeForString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("numbers")) & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("phone")))
    {
      v5 = 5;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)autoCorrectionTypeForNumber:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "BOOLValue"))
    return 2;
  return 1;
}

+ (int64_t)autoCapsTypeForString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sentences")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("words")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("all")))
    {
      v5 = 3;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __71__PSSpecifier_setValues_titles_shortTitles_usingLocalizedTitleSorting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

+ (id)groupSpecifierWithName:(id)a3
{
  return +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, 0, 0, 0, 0, 0, 0);
}

+ (id)emptyGroupSpecifier
{
  return (id)objc_msgSend(a1, "groupSpecifierWithName:", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setupIconImageWithPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("icon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _copyIconForPathFromSpecifier(v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("icon2")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        _copyIconForPathFromSpecifier(v6, v7),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v5, CFSTR("iconImage"));

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakUserInfo);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_shortTitleDict, 0);
  objc_storeStrong((id *)&self->_titleDict, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak(&self->target);
}

- (NSArray)values
{
  return self->_values;
}

- (void)loadValuesAndTitlesFromDataSource
{
  NSString *v3;
  id WeakRetained;
  void *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  void *v13;
  NSString *v14;

  if (!self->_values)
  {
    -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("valuesDataSource"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v14 = v3;
      NSSelectorFromString(v3);
      WeakRetained = objc_loadWeakRetained(&self->target);
      SFPerformSelector();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("titlesDataSource"));
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        NSSelectorFromString(v6);
        v8 = objc_loadWeakRetained(&self->target);
        SFPerformSelector();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("shortTitlesDataSource"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        NSSelectorFromString(v10);
        v12 = objc_loadWeakRetained(&self->target);
        SFPerformSelector();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      -[PSSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v5, v9, v13);

      v3 = v14;
    }

  }
}

- (SEL)controllerLoadAction
{
  return self->_controllerLoadAction;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  if (a3)
    -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
}

- (NSDictionary)shortTitleDictionary
{
  NSDictionary *shortTitleDict;

  shortTitleDict = self->_shortTitleDict;
  if (!shortTitleDict)
    shortTitleDict = self->_titleDict;
  return shortTitleDict;
}

- (NSDictionary)titleDictionary
{
  return self->_titleDict;
}

- (void)removePropertyForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", a3);
}

- (void)setDetailControllerClass:(Class)a3
{
  self->detailControllerClass = a3;
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->target, a3);
}

uint64_t __71__PSSpecifier_setValues_titles_shortTitles_usingLocalizedTitleSorting___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (BOOL)showContentString
{
  return self->_showContentString;
}

- (void)setIdentifier:(id)a3
{
  -[PSSpecifier setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("id"));
}

- (void)setValues:(id)a3 titles:(id)a4 shortTitles:(id)a5 usingLocalizedTitleSorting:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  PSSpecifier *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[PSSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v10, v11, a5);
  if (v6)
  {
    v25 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __71__PSSpecifier_setValues_titles_shortTitles_usingLocalizedTitleSorting___block_invoke;
    v30[3] = &unk_1E4A66110;
    v13 = v12;
    v31 = v13;
    v14 = v10;
    v32 = v14;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);
    objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v23);

          objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v19);
    }

    -[PSSpecifier setValues:](v25, "setValues:", v16);
  }

}

- (void)setValues:(id)a3 titles:(id)a4 shortTitles:(id)a5
{
  id v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *shortTitleDict;
  NSArray *values;
  NSDictionary *titleDict;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (v14 && v8)
  {
    -[PSSpecifier setValues:](self, "setValues:");
    v10 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v8, v14);
    -[PSSpecifier setTitleDictionary:](self, "setTitleDictionary:", v10);
    if (v9)
    {
      shortTitleDict = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v9, v14);
      -[PSSpecifier setShortTitleDictionary:](self, "setShortTitleDictionary:", shortTitleDict);
    }
    else
    {
      shortTitleDict = self->_shortTitleDict;
      self->_shortTitleDict = 0;
    }

  }
  else
  {
    values = self->_values;
    self->_values = 0;

    titleDict = self->_titleDict;
    self->_titleDict = 0;

    v10 = self->_shortTitleDict;
    self->_shortTitleDict = 0;
  }

}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void)setTitleDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_titleDict, a3);
}

+ (id)groupSpecifierWithID:(id)a3 name:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "groupSpecifierWithName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v6);

  return v7;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (void)setShortTitleDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_shortTitleDict, a3);
}

+ (id)groupSpecifierWithID:(id)a3
{
  return (id)objc_msgSend(a1, "groupSpecifierWithID:name:", a3, 0);
}

- (PSSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v15;
  id v16;
  PSSpecifier *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *properties;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  gScale = (int)ScreenScale();
  v21.receiver = self;
  v21.super_class = (Class)PSSpecifier;
  v17 = -[PSSpecifier init](&v21, sel_init);
  if (v17)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v17->_properties;
    v17->_properties = v18;

    -[PSSpecifier setName:](v17, "setName:", v15);
    objc_storeWeak(&v17->target, v16);
    v17->getter = a6;
    v17->setter = a5;
    v17->detailControllerClass = a7;
    v17->cellType = a8;
    v17->editPaneClass = a9;
  }

  return v17;
}

+ (PSSpecifier)specifierWithSpecifier:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    v4 = (_QWORD *)objc_opt_new();
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(v3, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTarget:", v6);

    v4[3] = v3[3];
    objc_msgSend(v4, "setDetailControllerClass:", objc_msgSend(v3, "detailControllerClass"));
    objc_msgSend(v4, "setCellType:", objc_msgSend(v3, "cellType"));
    objc_msgSend(v4, "setEditPaneClass:", objc_msgSend(v3, "editPaneClass"));
    objc_msgSend(v4, "setLegacyAction:", objc_msgSend(v3, "legacyAction"));
    objc_msgSend(v4, "setLegacyCancel:", objc_msgSend(v3, "legacyCancel"));
    v4[9] = v3[9];
    v4[10] = v3[10];
    v4[11] = v3[11];
    v4[12] = v3[12];
    objc_msgSend(v4, "setConfirmationAction:", objc_msgSend(v3, "confirmationAction"));
    objc_msgSend(v4, "setConfirmationAlternateAction:", objc_msgSend(v3, "confirmationAlternateAction"));
    objc_msgSend(v4, "setConfirmationCancelAction:", objc_msgSend(v3, "confirmationCancelAction"));
    objc_msgSend(v4, "setShowContentString:", objc_msgSend(v3, "showContentString"));
    objc_msgSend(v3, "titleDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleDictionary:", v7);

    objc_msgSend(v3, "shortTitleDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortTitleDictionary:", v8);

    objc_msgSend(v3, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValues:", v9);

    objc_msgSend(v3, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInfo:", v10);

    objc_msgSend(v3, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setProperties:", v11);
  }
  else
  {
    v4 = 0;
  }
  return (PSSpecifier *)v4;
}

- (id)properties
{
  return self->_properties;
}

- (BOOL)hasValidSetter
{
  id *p_target;
  id WeakRetained;
  id v5;
  char v6;

  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  if (WeakRetained && self->setter)
  {
    v5 = objc_loadWeakRetained(p_target);
    v6 = objc_opt_respondsToSelector();

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (void)performSetterWithValue:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  id v8;
  const char *Name;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PSSpecifier hasValidSetter](self, "hasValidSetter"))
  {
    WeakRetained = objc_loadWeakRetained(&self->target);
    v6 = (id)SFPerformSelector2();

  }
  else
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(&self->target);
      Name = sel_getName(self->setter);
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      v13 = Name;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no setter, or does not respond to setter %s", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (BOOL)hasValidGetter
{
  id *p_target;
  id WeakRetained;
  id v5;
  char v6;

  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  if (WeakRetained && self->getter)
  {
    v5 = objc_loadWeakRetained(p_target);
    v6 = objc_opt_respondsToSelector();

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (id)performGetter
{
  id WeakRetained;
  void *v4;
  NSObject *v6;
  id v7;
  const char *Name;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[PSSpecifier hasValidGetter](self, "hasValidGetter"))
  {
    WeakRetained = objc_loadWeakRetained(&self->target);
    SFPerformSelector();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(&self->target);
      Name = sel_getName(self->getter);
      v9 = 138412546;
      v10 = v7;
      v11 = 2080;
      v12 = Name;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no getter, or does not respond to getter %s", (uint8_t *)&v9, 0x16u);

    }
    return 0;
  }
}

- (void)performLegacyAction
{
  id *p_target;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *Name;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  v5 = WeakRetained;
  if (WeakRetained && self->action)
  {
    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(p_target);
      v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {

  }
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->action);
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2080;
    v16 = Name;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no action, or does not respond to action %s", buf, 0x16u);

  }
}

- (SEL)legacyCancel
{
  return self->cancel;
}

- (void)performControllerLoadAction
{
  id *p_target;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *Name;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  v5 = WeakRetained;
  if (WeakRetained && self->_controllerLoadAction)
  {
    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(p_target);
      v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {

  }
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->_controllerLoadAction);
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2080;
    v16 = Name;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no controllerLoadAction, or does not respond to controllerLoadAction %s", buf, 0x16u);

  }
}

- (void)performButtonAction
{
  id *p_target;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *Name;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  v5 = WeakRetained;
  if (WeakRetained && self->_buttonAction)
  {
    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(p_target);
      v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {

  }
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->_buttonAction);
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2080;
    v16 = Name;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no buttonAction, or does not respond to buttonAction %s", buf, 0x16u);

  }
}

- (void)performConfirmationAction
{
  id *p_target;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *Name;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  v5 = WeakRetained;
  if (WeakRetained && self->_confirmationAction)
  {
    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(p_target);
      v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {

  }
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->_confirmationAction);
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2080;
    v16 = Name;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no confirmationAction, or does not respond to confirmationAction %s", buf, 0x16u);

  }
}

- (void)performConfirmationAlternateAction
{
  id *p_target;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *Name;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  v5 = WeakRetained;
  if (WeakRetained && self->_confirmationAlternateAction)
  {
    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(p_target);
      v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {

  }
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->_confirmationAlternateAction);
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2080;
    v16 = Name;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no confirmationAltAction, or does not respond to confirmationAlternateAction %s", buf, 0x16u);

  }
}

- (void)performConfirmationCancelAction
{
  id *p_target;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *Name;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_target = &self->target;
  WeakRetained = objc_loadWeakRetained(&self->target);
  v5 = WeakRetained;
  if (WeakRetained && self->_confirmationCancelAction)
  {
    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(p_target);
      v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {

  }
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->_confirmationCancelAction);
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2080;
    v16 = Name;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no confirmationCancelAction, or does not respond to confirmationCancelAction %s", buf, 0x16u);

  }
}

- (void)setValues:(id)a3 titles:(id)a4
{
  -[PSSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", a3, a4, 0);
}

- (id)description
{
  __CFString *name;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;

  name = (__CFString *)self->_name;
  if (!name)
    name = &stru_1E4A69238;
  v4 = name;
  -[PSSpecifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    -[PSSpecifier identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier target](self, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    -[PSSpecifier target](self, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %p: ID %@, Name '%@' target <%@: %p>>"), v7, self, v8, v4, v10, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v4;
  }
  if (self->cellType)
  {
    v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("G: %@ %p"), v12, self);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (void)setKeyboardType:(int64_t)a3 autoCaps:(int64_t)a4 autoCorrection:(int64_t)a5
{
  self->keyboardType = a3;
  self->autoCapsType = a4;
  self->autoCorrectionType = a5;
  self->textFieldType = 0;
}

- (int64_t)titleCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PSSpecifier name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)isEqualToSpecifier:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  __CFString *name;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  const char *v14;
  SEL confirmationAction;
  SEL confirmationAlternateAction;
  SEL confirmationCancelAction;
  SEL controllerLoadAction;
  NSMutableDictionary *properties;
  void *v21;
  NSArray *values;
  void *v23;
  NSDictionary *titleDict;
  void *v25;
  NSDictionary *shortTitleDict;
  void *v27;
  id userInfo;
  void *v29;

  v4 = a3;
  if ((-[PSSpecifier isEqual:](self, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      if (self->_name)
        name = (__CFString *)self->_name;
      else
        name = &stru_1E4A69238;
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString isEqualToString:](name, "isEqualToString:", v8))
      {
        -[PSSpecifier identifier](self, "identifier");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (__CFString *)v9;
        else
          v11 = &stru_1E4A69238;
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v11, "isEqualToString:", v12)
          && self->getter == (SEL)*((_QWORD *)v4 + 2)
          && self->setter == (SEL)*((_QWORD *)v4 + 3)
          && (v13 = -[PSSpecifier legacyAction](self, "legacyAction"),
              v13 == (const char *)objc_msgSend(v4, "legacyAction"))
          && (v14 = -[PSSpecifier legacyCancel](self, "legacyCancel"),
              v14 == (const char *)objc_msgSend(v4, "legacyCancel"))
          && self->detailControllerClass == (Class)*((_QWORD *)v4 + 6)
          && self->cellType == *((_QWORD *)v4 + 7)
          && self->editPaneClass == (Class)*((_QWORD *)v4 + 8)
          && (confirmationAction = self->_confirmationAction,
              confirmationAction == (SEL)objc_msgSend(v4, "confirmationAction"))
          && (confirmationAlternateAction = self->_confirmationAlternateAction,
              confirmationAlternateAction == (SEL)objc_msgSend(v4, "confirmationAlternateAction"))
          && (confirmationCancelAction = self->_confirmationCancelAction,
              confirmationCancelAction == (SEL)objc_msgSend(v4, "confirmationCancelAction"))
          && (controllerLoadAction = self->_controllerLoadAction,
              controllerLoadAction == (SEL)objc_msgSend(v4, "controllerLoadAction")))
        {
          properties = self->_properties;
          objc_msgSend(v4, "properties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSMutableDictionary isEqualToDictionary:](properties, "isEqualToDictionary:", v21))
          {
            values = self->_values;
            objc_msgSend(v4, "values");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSArray isEqualToArray:](values, "isEqualToArray:", v23))
            {
              titleDict = self->_titleDict;
              objc_msgSend(v4, "titleDictionary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSDictionary isEqualToDictionary:](titleDict, "isEqualToDictionary:", v25))
              {
                shortTitleDict = self->_shortTitleDict;
                objc_msgSend(v4, "shortTitleDictionary");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[NSDictionary isEqualToDictionary:](shortTitleDict, "isEqualToDictionary:", v27))
                {
                  userInfo = self->_userInfo;
                  objc_msgSend(v4, "userInfo");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v5 = objc_msgSend(userInfo, "isEqual:", v29);

                }
                else
                {
                  v5 = 0;
                }

              }
              else
              {
                v5 = 0;
              }

            }
            else
            {
              v5 = 0;
            }

          }
          else
          {
            v5 = 0;
          }

        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)target
{
  return objc_loadWeakRetained(&self->target);
}

- (Class)detailControllerClass
{
  return self->detailControllerClass;
}

- (void)setCellType:(int64_t)a3
{
  self->cellType = a3;
}

- (Class)editPaneClass
{
  return self->editPaneClass;
}

- (void)setEditPaneClass:(Class)a3
{
  self->editPaneClass = a3;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (SEL)confirmationAction
{
  return self->_confirmationAction;
}

- (SEL)confirmationAlternateAction
{
  return self->_confirmationAlternateAction;
}

- (void)setConfirmationAlternateAction:(SEL)a3
{
  self->_confirmationAlternateAction = a3;
}

- (SEL)confirmationCancelAction
{
  return self->_confirmationCancelAction;
}

- (SEL)buttonAction
{
  return self->_buttonAction;
}

- (id)weakUserInfo
{
  return objc_loadWeakRetained(&self->_weakUserInfo);
}

- (void)setWeakUserInfo:(id)a3
{
  objc_storeWeak(&self->_weakUserInfo, a3);
}

- (void)setShowContentString:(BOOL)a3
{
  self->_showContentString = a3;
}

- (void)addFooterHyperlinkWithRange:(_NSRange)a3 url:(id)a4
{
  id v5;

  +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:url:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:url:", a3.location, a3.length, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier _addLinkSpec:](self, "_addLinkSpec:", v5);

}

- (void)addFooterHyperlinkWithRange:(_NSRange)a3 target:(id)a4 action:(SEL)a5
{
  id v6;

  +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:target:action:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:target:action:", a3.location, a3.length, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier _addLinkSpec:](self, "_addLinkSpec:", v6);

}

- (void)_addLinkSpec:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("footerHyperlinkLinkSpecs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "arrayByAddingObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PSSpecifier setProperty:forKey:](self, "setProperty:forKey:", v7, CFSTR("footerHyperlinkLinkSpecs"));

}

+ (id)deleteButtonSpecifierWithName:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v7;
  void *v8;

  v7 = a3;
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, a4, 0, 0, 0, 13, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v7, CFSTR("id"));

  objc_msgSend(v8, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
  objc_msgSend(v8, "setButtonAction:", a5);
  return v8;
}

- (void)identifier
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A3819000, a3, OS_LOG_TYPE_ERROR, "ERROR: specifier has non-string identifier: %@, target: %@", (uint8_t *)&v6, 0x16u);

}

@end
