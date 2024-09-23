@implementation WBProfile

- (NSString)customFavoritesFolderServerID
{
  return -[WebBookmark customFavoritesFolderServerID](self->_bookmark, "customFavoritesFolderServerID");
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)identifierForExtensions
{
  id v2;

  if (self->_kind)
  {
    -[WebBookmark serverID](self->_bookmark, "serverID");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (id)*MEMORY[0x24BE82E70];
  }
  return (NSString *)v2;
}

- (NSString)symbolImageName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  -[WebBookmark symbolImageName](self->_bookmark, "symbolImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "availableSymbolImageNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "availableSymbolImageNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "availableSymbolImageNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

+ (NSArray)availableSymbolImageNames
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BE82CB0], "availableSymbolImageNames");
}

- (NSString)identifier
{
  id v2;

  if (self->_kind)
  {
    -[WebBookmark UUID](self->_bookmark, "UUID");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (id)*MEMORY[0x24BE82E70];
  }
  return (NSString *)v2;
}

- (int)databaseIdentifier
{
  if (self->_kind)
    return -[WebBookmark identifier](self->_bookmark, "identifier");
  else
    return 0;
}

- (NSString)title
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void (**titleProvider)(void);
  __CFString *v7;

  -[WebBookmark title](self->_bookmark, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "length");
    if (v4 <= *MEMORY[0x24BE82FA0])
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringToIndex:");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    titleProvider = (void (**)(void))self->_titleProvider;
    if (!titleProvider)
    {
      v7 = &stru_24CB35168;
      goto LABEL_8;
    }
    titleProvider[2]();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
LABEL_8:

  return (NSString *)v7;
}

uint64_t __35__WBProfile_initWithBookmark_kind___block_invoke()
{
  return _WBSLocalizedString();
}

- (WBProfile)initWithBookmark:(id)a3 kind:(int64_t)a4
{
  id v7;
  WBProfile *v8;
  id titleProvider;
  WBProfile *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBProfile;
  v8 = -[WBProfile init](&v12, sel_init);
  if (v8 && objc_msgSend(v7, "isFolder") && objc_msgSend(v7, "subtype") == 2)
  {
    objc_storeStrong((id *)&v8->_bookmark, a3);
    v8->_kind = a4;
    if (!a4)
    {
      titleProvider = v8->_titleProvider;
      v8->_titleProvider = &__block_literal_global_11;

    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)tabGroups
{
  return self->_tabGroups;
}

- (WBProfile)initWithTitle:(id)a3 symbolImageName:(id)a4 favoritesFolderServerID:(id)a5 deviceIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  WBProfile *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[WebBookmark initFolderWithParentID:subtype:deviceIdentifier:collectionType:]([WebBookmark alloc], "initFolderWithParentID:subtype:deviceIdentifier:collectionType:", 0, 2, v10, 1);

  objc_msgSend(v14, "setTitle:", v13);
  objc_msgSend(v14, "setSymbolImageName:", v12);

  objc_msgSend(v14, "setCustomFavoritesFolderServerID:", v11);
  v15 = -[WBProfile initWithBookmark:](self, "initWithBookmark:", v14);

  return v15;
}

- (WBProfile)initWithTitle:(id)a3 deviceIdentifier:(id)a4
{
  return -[WBProfile initWithTitle:symbolImageName:favoritesFolderServerID:deviceIdentifier:](self, "initWithTitle:symbolImageName:favoritesFolderServerID:deviceIdentifier:", a3, 0, 0, a4);
}

- (WBProfile)initWithBookmark:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WBProfile *v7;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE82E70]) ^ 1;

  v7 = -[WBProfile initWithBookmark:kind:](self, "initWithBookmark:kind:", v4, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WBProfile *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WBProfile *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBProfile identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBProfile identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WBProfile identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)differenceFromProfile:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSMutableDictionary *settingsDictionary;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  WBProfileDifference *v40;
  uint64_t v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  if (v4 && WBSIsEqual())
  {
    -[WBProfile title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

    v8 = v7 ^ 1u;
    -[WBProfile symbolImageName](self, "symbolImageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolImageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = WBSIsEqual();

    if (!v11)
      v8 |= 2uLL;
    -[WBProfile customFavoritesFolderServerID](self, "customFavoritesFolderServerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customFavoritesFolderServerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = WBSIsEqual();

    if (!v14)
      v8 |= 4uLL;
    -[WBProfile color](self, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = WBSIsEqual();

    if (!v17)
      v8 |= 8uLL;
    -[WBProfile startPageSectionsDataRepresentation](self, "startPageSectionsDataRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPageSectionsDataRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = WBSIsEqual();

    if (!v20)
      v8 |= 0x10uLL;
    -[WBProfile syncPosition](self, "syncPosition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncPosition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = WBSIsEqual();

    if (!v23)
      v8 |= 0x20uLL;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    settingsDictionary = self->_settingsDictionary;
    if (settingsDictionary
      && (-[NSMutableDictionary isEqualToDictionary:](settingsDictionary, "isEqualToDictionary:", v4[3]) & 1) == 0)
    {
      v42 = v8 | 0x40;
      v43 = v4;
      v26 = v4[3];
      v27 = (void *)MEMORY[0x24BDBCF20];
      -[NSMutableDictionary allKeys](self->_settingsDictionary, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allKeys");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setByAddingObjectsFromArray:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v45 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDictionary, "objectForKeyedSubscript:", v37, v42, v43, (_QWORD)v44);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if ((WBSIsEqual() & 1) == 0)
              objc_msgSend(v24, "addObject:", v37);

          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v34);
      }

      v8 = v42;
      v4 = v43;
    }
    v40 = -[WBProfileDifference initWithResult:settingsKeys:]([WBProfileDifference alloc], "initWithResult:settingsKeys:", v8, v24);

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (BOOL)isDefault
{
  return self->_kind == 0;
}

- (NSString)deviceIdentifier
{
  return -[WebBookmark deviceIdentifier](self->_bookmark, "deviceIdentifier");
}

- (BOOL)needsSecureDelete
{
  return 0;
}

- (void)setCustomFavoritesFolderServerID:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WebBookmark setCustomFavoritesFolderServerID:](self->_bookmark, "setCustomFavoritesFolderServerID:", v4);

}

- (WBSCRDTPosition)syncPosition
{
  void *v2;
  void *v3;

  -[WBProfile bookmark](self, "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSCRDTPosition *)v3;
}

- (BOOL)isSyncable
{
  return -[WebBookmark isSyncable](self->_bookmark, "isSyncable");
}

- (BOOL)isInserted
{
  return -[WebBookmark isInserted](self->_bookmark, "isInserted");
}

- (NSData)startPageSectionsDataRepresentation
{
  return -[WebBookmark startPageSectionsDataRepresentation](self->_bookmark, "startPageSectionsDataRepresentation");
}

- (id)settingForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockFields");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBProfile bookmark](self, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlockFields");

  if (!v7)
  {
    -[WBProfile _defaultSettingForKey:](self, "_defaultSettingForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_defaultSettingForKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _defaultSettingForKey__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_defaultSettingForKey__onceToken, &__block_literal_global_12_0);
  objc_msgSend((id)_defaultSettingForKey__defaultSettingValues, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __35__WBProfile__defaultSettingForKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE83268];
  v3[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_defaultSettingForKey__defaultSettingValues;
  _defaultSettingForKey__defaultSettingValues = v0;

}

- (NSDictionary)modifiedSettingsFieldsByName
{
  return (NSDictionary *)-[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](self->_settingsDictionary, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_15);
}

id __41__WBProfile_modifiedSettingsFieldsByName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("modified"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (WBSNamedColorOption)color
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE82CF8];
  -[WBProfile settingForKey:](self, "settingForKey:", *MEMORY[0x24BE82F98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSNamedColorOption *)v4;
}

- (NSString)serverID
{
  return -[WebBookmark serverID](self->_bookmark, "serverID");
}

- (Class)_copyClassIsMutable:(BOOL)a3
{
  return (Class)(id)objc_opt_class();
}

- (id)_copyWithZone:(_NSZone *)a3 isMutable:(BOOL)a4
{
  objc_class *v7;
  WBProfile *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *settingsDictionary;

  v7 = -[WBProfile _copyClassIsMutable:](self, "_copyClassIsMutable:", a4);
  if (a4 || !-[WBProfile isMemberOfClass:](self, "isMemberOfClass:", v7))
  {
    v9 = (void *)-[WebBookmark copy](self->_bookmark, "copy");
    v8 = -[objc_class initWithBookmark:kind:](-[objc_class allocWithZone:](v7, "allocWithZone:", a3), "initWithBookmark:kind:", v9, self->_kind);
    -[NSMutableDictionary safari_mutableDeepCopy](self->_settingsDictionary, "safari_mutableDeepCopy");
    v10 = objc_claimAutoreleasedReturnValue();
    settingsDictionary = v8->_settingsDictionary;
    v8->_settingsDictionary = (NSMutableDictionary *)v10;

  }
  else
  {
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WBProfile _copyWithZone:isMutable:](self, "_copyWithZone:isMutable:", a3, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[WBProfile _copyWithZone:isMutable:](self, "_copyWithZone:isMutable:", a3, 1);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBProfile databaseIdentifier](self, "databaseIdentifier");
  -[WBProfile title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBProfile symbolImageName](self, "symbolImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WBProfile kind](self, "kind");
  -[WBProfile identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBProfile serverID](self, "serverID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; databaseIdentifier = %d; title = %@; symbolImage = %@; kind = %ld; identifier = %@; serverID = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)privacyPreservingDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBProfile databaseIdentifier](self, "databaseIdentifier");
  v7 = -[WBProfile kind](self, "kind");
  -[WBProfile identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBProfile serverID](self, "serverID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; databaseIdentifier = %d; kind = %ld; identifier = %@; serverID = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (WBSRecentsStore)recentsStore
{
  return self->_recentsStore;
}

- (void)setRecentsStore:(id)a3
{
  objc_storeStrong((id *)&self->_recentsStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsStore, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
  objc_storeStrong(&self->_titleProvider, 0);
  objc_storeStrong((id *)&self->_tabGroups, 0);
}

@end
