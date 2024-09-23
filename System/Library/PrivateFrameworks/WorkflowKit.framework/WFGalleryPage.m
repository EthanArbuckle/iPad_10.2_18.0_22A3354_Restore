@implementation WFGalleryPage

- (unint64_t)referenceActionForKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("base"));
}

- (id)subPageMatchingName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  WFGalleryPage *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFGalleryPage name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:options:", v4, 129);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[WFGalleryPage banners](self, "banners", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("detailPage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "subPageMatchingName:", v4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (WFGalleryPage *)v13;

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v14 = 0;
  }
  else
  {
    v14 = self;
  }
LABEL_13:

  return v14;
}

- (id)subPageWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  WFGalleryPage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFGalleryPage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[WFGalleryPage banners](self, "banners", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("detailPage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "subPageWithIdentifier:", v4);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v7 = (WFGalleryPage *)v14;

            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFGalleryPage *v5;
  void *v6;
  uint64_t v7;
  CKRecordID *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSNumber *minVersion;
  void *v15;
  uint64_t v16;
  NSNumber *isRoot;
  void *v18;
  uint64_t v19;
  NSArray *banners;
  void *v21;
  uint64_t v22;
  NSArray *collections;
  void *v24;
  uint64_t v25;
  NSArray *donations;
  void *v27;
  uint64_t v28;
  NSArray *donationsGroupedByApp;
  void *v30;
  uint64_t v31;
  NSString *language;
  uint64_t v33;
  CKRecordID *base;
  void *v35;
  uint64_t v36;
  NSString *persistentIdentifier;

  v5 = -[WFGalleryPage init](+[WFGalleryPage allocWithZone:](WFGalleryPage, "allocWithZone:"), "init");
  -[WFGalleryPage identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  -[WFGalleryPage name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v10;

  -[WFGalleryPage minVersion](self, "minVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  minVersion = v5->_minVersion;
  v5->_minVersion = (NSNumber *)v13;

  -[WFGalleryPage isRoot](self, "isRoot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  isRoot = v5->_isRoot;
  v5->_isRoot = (NSNumber *)v16;

  -[WFGalleryPage banners](self, "banners");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  banners = v5->_banners;
  v5->_banners = (NSArray *)v19;

  -[WFGalleryPage collections](self, "collections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copyWithZone:", a3);
  collections = v5->_collections;
  v5->_collections = (NSArray *)v22;

  -[WFGalleryPage donations](self, "donations");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copyWithZone:", a3);
  donations = v5->_donations;
  v5->_donations = (NSArray *)v25;

  -[WFGalleryPage donationsGroupedByApp](self, "donationsGroupedByApp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copyWithZone:", a3);
  donationsGroupedByApp = v5->_donationsGroupedByApp;
  v5->_donationsGroupedByApp = (NSArray *)v28;

  -[WFGalleryPage language](self, "language");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copyWithZone:", a3);
  language = v5->_language;
  v5->_language = (NSString *)v31;

  -[WFGalleryPage base](self, "base");
  v33 = objc_claimAutoreleasedReturnValue();
  base = v5->_base;
  v5->_base = (CKRecordID *)v33;

  -[WFGalleryPage persistentIdentifier](self, "persistentIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "copyWithZone:", a3);
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v36;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WFMutableGalleryPage *v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = -[WFMutableGalleryPage init](+[WFMutableGalleryPage allocWithZone:](WFMutableGalleryPage, "allocWithZone:"), "init");
  -[WFGalleryPage identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[WFMutableGalleryPage setIdentifier:](v5, "setIdentifier:", v7);

  -[WFGalleryPage name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[WFMutableGalleryPage setName:](v5, "setName:", v9);

  -[WFGalleryPage minVersion](self, "minVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[WFMutableGalleryPage setMinVersion:](v5, "setMinVersion:", v11);

  -[WFGalleryPage isRoot](self, "isRoot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[WFMutableGalleryPage setIsRoot:](v5, "setIsRoot:", v13);

  -[WFGalleryPage banners](self, "banners");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[WFMutableGalleryPage setBanners:](v5, "setBanners:", v15);

  -[WFGalleryPage collections](self, "collections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[WFMutableGalleryPage setCollections:](v5, "setCollections:", v17);

  -[WFGalleryPage donations](self, "donations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[WFMutableGalleryPage setDonations:](v5, "setDonations:", v19);

  -[WFGalleryPage donationsGroupedByApp](self, "donationsGroupedByApp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[WFMutableGalleryPage setDonationsGroupedByApp:](v5, "setDonationsGroupedByApp:", v21);

  -[WFGalleryPage language](self, "language");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  -[WFMutableGalleryPage setLanguage:](v5, "setLanguage:", v23);

  -[WFGalleryPage base](self, "base");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableGalleryPage setBase:](v5, "setBase:", v24);

  -[WFGalleryPage persistentIdentifier](self, "persistentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copyWithZone:", a3);
  -[WFMutableGalleryPage setPersistentIdentifier:](v5, "setPersistentIdentifier:", v26);

  return v5;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)minVersion
{
  return self->_minVersion;
}

- (NSNumber)isRoot
{
  return self->_isRoot;
}

- (NSArray)banners
{
  return self->_banners;
}

- (NSArray)collections
{
  return self->_collections;
}

- (NSArray)donations
{
  return self->_donations;
}

- (NSArray)donationsGroupedByApp
{
  return self->_donationsGroupedByApp;
}

- (NSString)language
{
  return self->_language;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_donationsGroupedByApp, 0);
  objc_storeStrong((id *)&self->_donations, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_banners, 0);
  objc_storeStrong((id *)&self->_isRoot, 0);
  objc_storeStrong((id *)&self->_minVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("GalleryPage");
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("name");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("minVersion");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("isRoot");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("banners");
  +[WFCloudKitItemProperty itemPropertyWithName:itemClass:](WFCloudKitItemProperty, "itemPropertyWithName:itemClass:", CFSTR("banners"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = CFSTR("collections");
  +[WFCloudKitItemProperty itemPropertyWithName:itemClass:](WFCloudKitItemProperty, "itemPropertyWithName:itemClass:", CFSTR("collections"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  v12[5] = CFSTR("language");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  v12[6] = CFSTR("base");
  +[WFCloudKitItemProperty itemReferencePropertyWithName:itemClass:](WFCloudKitItemProperty, "itemReferencePropertyWithName:itemClass:", CFSTR("base"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  v12[7] = CFSTR("persistentIdentifier");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

@end
