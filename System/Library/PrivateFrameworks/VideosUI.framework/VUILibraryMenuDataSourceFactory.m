@implementation VUILibraryMenuDataSourceFactory

+ (id)libraryMenuDataSourceForMediaLibrary:(id)a3
{
  id v3;
  void *v4;
  VUIMPMenuDataSource *v5;

  v3 = a3;
  if (objc_msgSend(v3, "type"))
    +[VUILibraryMenuDataSourceFactory _validCategoriesForHomeSharing](VUILibraryMenuDataSourceFactory, "_validCategoriesForHomeSharing");
  else
    +[VUILibraryMenuDataSourceFactory _validCategoriesForPlatform](VUILibraryMenuDataSourceFactory, "_validCategoriesForPlatform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMPMenuDataSource initWithValidCategories:]([VUIMPMenuDataSource alloc], "initWithValidCategories:", v4);
  -[VUIMPMenuDataSource setMediaLibrary:](v5, "setMediaLibrary:", v3);

  return v5;
}

+ (id)_validCategoriesForPlatform
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1EA0B9A78, &unk_1EA0B9A90, &unk_1EA0B9AA8, &unk_1EA0B9AC0, &unk_1EA0B9AD8, &unk_1EA0B9AF0, 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1EA0B9A78, &unk_1EA0B9A90, &unk_1EA0B9AA8, &unk_1EA0B9AC0, &unk_1EA0B9AD8, &unk_1EA0B9B08, &unk_1EA0B9B20, &unk_1EA0B9A60, &unk_1EA0B9AF0, 0);
LABEL_5:
    v8 = (void *)v5;

    v2 = v8;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (!v7)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1EA0B9A90, &unk_1EA0B9AA8, &unk_1EA0B9B08, &unk_1EA0B9B20, &unk_1EA0B9A60, &unk_1EA0B9AF0, 0, v11, v12, v13);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v2, "addObject:", &unk_1EA0B9B38);
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

+ (id)libraryMenuDataSourceForFamilyMember:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VUIFamilySharingMenuDataSource *v7;
  void *v8;
  VUIFamilySharingMenuDataSource *v9;

  objc_msgSend(a3, "memberIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[VUILibraryMenuDataSourceFactory _validCategoriesForPlatform](VUILibraryMenuDataSourceFactory, "_validCategoriesForPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObject:", &unk_1EA0B9A60);
    v7 = [VUIFamilySharingMenuDataSource alloc];
    v8 = (void *)objc_msgSend(v6, "copy");
    v9 = -[VUIFamilySharingMenuDataSource initWithValidCategories:](v7, "initWithValidCategories:", v8);

    -[VUIFamilySharingMenuDataSource setOwnerIdentifier:](v9, "setOwnerIdentifier:", v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_validCategoriesForHomeSharing
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA0B9A90, &unk_1EA0B9AA8, &unk_1EA0B9B08, &unk_1EA0B9AF0, 0);
}

@end
