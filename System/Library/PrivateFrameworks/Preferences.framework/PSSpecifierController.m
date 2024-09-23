@implementation PSSpecifierController

- (PSSpecifierController)init
{
  PSSpecifierController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSSpecifierController;
  v2 = -[PSSpecifierController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PSSpecifierController setBundleControllers:](v2, "setBundleControllers:", v3);

  }
  return v2;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  +[PSRootController setPreferenceValue:specifier:](PSRootController, "setPreferenceValue:specifier:", a3, a4);
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", a3);
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifierController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  PSSpecifier *specifier;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v22 = 0;
  v23 = 0;
  v10 = a4;
  objc_msgSend(v9, "pathForResource:ofType:", v8, CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _PSLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "bundlePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "Warning: failed to load preferences plist '%@.plist' for bundle %@", buf, 0x16u);

    }
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v11);
  v15 = (void *)objc_opt_new();
  specifier = self->_specifier;
  v21 = v15;
  SpecifiersFromPlist(v14, specifier, v10, v8, v9, &v22, &v23, self, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v21;
  -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v18);
  -[PSSpecifierController viewController](self, "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v22);

  return v17;
}

- (id)loadSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PSSpecifierController specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PSSpecifierController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierController specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    -[PSSpecifierController setSpecifiers:](self, "setSpecifiers:", v9);

  }
  return -[PSSpecifierController specifiers](self, "specifiers");
}

- (void)prepareSpecifiersMetadata
{
  PSSpecifierController *v2;
  NSMutableArray *specifiers;
  uint64_t v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;

  v2 = self;
  objc_sync_enter(v2);
  specifiers = v2->_specifiers;
  if (specifiers
    && -[NSMutableArray count](specifiers, "count")
    && (-[NSMutableArray objectAtIndex:](v2->_specifiers, "objectAtIndex:", 0),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (id)v4;
    if (*(_QWORD *)(v4 + 56))
    {
      v5 = (NSMutableArray *)-[NSMutableArray mutableCopy](v2->_specifiers, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](v5, "insertObject:atIndex:", v8, 0);

      v9 = v2->_specifiers;
      v2->_specifiers = v5;

    }
  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v2);

  -[PSSpecifierController createGroupIndices](v2, "createGroupIndices");
}

- (void)reloadSpecifiers
{
  PSSpecifierController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = self;
  objc_sync_enter(v3);
  -[PSSpecifierController setSpecifiers:](v3, "setSpecifiers:", 0);
  -[PSSpecifierController setGroups:](v3, "setGroups:", 0);
  objc_sync_exit(v3);

  -[PSSpecifierController loadSpecifiers](v3, "loadSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");
  -[PSSpecifierController setSpecifiers:](v3, "setSpecifiers:", v5);

  -[PSSpecifierController prepareSpecifiersMetadata](v3, "prepareSpecifiersMetadata");
  -[PSSpecifierController viewController](v3, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PSSpecifierController viewController](v3, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specifiersDidReload");

  }
  objc_sync_exit(obj);

}

- (int64_t)numberOfSections
{
  NSMutableArray *groups;

  groups = self->_groups;
  if (!groups)
  {
    -[PSSpecifierController createGroupIndices](self, "createGroupIndices");
    groups = self->_groups;
  }
  return -[NSMutableArray count](groups, "count");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  if (-[NSMutableArray count](self->_groups, "count") - 1 == a3)
  {
    v5 = -[NSMutableArray count](self->_specifiers, "count");
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 + ~objc_msgSend(v6, "integerValue");
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "integerValue");
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 + ~objc_msgSend(v9, "integerValue");

  }
  return v7;
}

- (int64_t)indexOfGroup:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PSSpecifierController groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSSpecifierController createGroupIndices](self, "createGroupIndices");
  -[PSSpecifierController groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    v11 = -[NSMutableArray count](self->_groups, "count");
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Critical Error - Access to Groups Array index %ld is out of bounds (count = %ld) in %@"), a3, v11, v13);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v14, "sf_isInternalInstall");

    if (!(_DWORD)v11)
      return 0x7FFFFFFFFFFFFFFFLL;
    NSLog(CFSTR("Specifiers = %@"), self->_specifiers);
    NSLog(CFSTR("Group Indices = %@"), self->_groups);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundlePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Please file a bug on %@"), v15);

    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PSSpecifierController groups](self, "groups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
  }

  return v10;
}

- (id)_createGroupIndices:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  _QWORD *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v3, "objectAtIndex:", i);
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (!v7[7])
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

      }
    }
  }

  return v5;
}

- (void)createGroupIndices
{
  void *v2;
  PSSpecifierController *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PSSpecifierController _createGroupIndices:](obj, "_createGroupIndices:", obj->_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifierController setGroups:](obj, "setGroups:", v2);

  objc_sync_exit(obj);
}

- (int64_t)indexForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t result;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = a3;
  -[PSSpecifierController groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSSpecifierController createGroupIndices](self, "createGroupIndices");
  v6 = objc_msgSend(v4, "row");
  v7 = objc_msgSend(v4, "section");

  result = -[PSSpecifierController indexOfGroup:](self, "indexOfGroup:", v7);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    result += v6 + 1;
  return result;
}

- (id)specifierAtIndexPath:(id)a3
{
  return -[PSSpecifierController specifierAtIndex:](self, "specifierAtIndex:", -[PSSpecifierController indexForIndexPath:](self, "indexForIndexPath:", a3));
}

- (id)specifierAtIndex:(int64_t)a3
{
  PSSpecifierController *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  -[PSSpecifierController specifiers](v4, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v6 > a3)
  {
    -[PSSpecifierController specifiers](v4, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v4);

  return v7;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierID:(id)a5
{
  void *v8;

  -[PSSpecifierController specifierForID:](self, "specifierForID:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PSSpecifierController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", a3, a4, v8);

  return (char)a4;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifier:(id)a5
{
  return -[PSSpecifierController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", a3, a4, -[NSMutableArray indexOfObject:](self->_specifiers, "indexOfObject:", a5));
}

- (BOOL)_getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5 groups:(id)a6
{
  id v9;
  int64_t v10;
  int64_t v11;
  void *v13;
  int64_t v14;

  v9 = a6;
  v10 = objc_msgSend(v9, "count");
  while (1)
  {
    v11 = v10;
    if (v10-- < 1)
      break;
    objc_msgSend(v9, "objectAtIndex:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 <= a5)
    {
      if (a3)
        *a3 = v10;
      if (a4)
        *a4 = ~v14 + a5;
      break;
    }
  }

  return v11 > 0;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PSSpecifierController specifiers](self, "specifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 0;
  -[PSSpecifierController groups](self, "groups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[PSSpecifierController createGroupIndices](self, "createGroupIndices");
  -[PSSpecifierController groups](self, "groups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PSSpecifierController _getGroup:row:ofSpecifierAtIndex:groups:](self, "_getGroup:row:ofSpecifierAtIndex:groups:", a3, a4, a5, v11);

  return v12;
}

- (id)specifierForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PSSpecifierController specifiers](self, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PSSpecifierControllerDelegate)viewController
{
  return (PSSpecifierControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (NSMutableArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_specifiers, a3);
}

- (NSMutableArray)bundleControllers
{
  return self->_bundleControllers;
}

- (void)setBundleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleControllers, a3);
}

- (NSMutableArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
