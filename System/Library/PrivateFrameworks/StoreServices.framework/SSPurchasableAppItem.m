@implementation SSPurchasableAppItem

+ (id)allItemsFromDatabase:(id)a3 forAccount:(int64_t)a4 sortedBy:(id)a5 sortAscending:(BOOL)a6
{
  return +[SSPurchasableAppItem itemsFromDatabase:forAccount:matching:sortedBy:sortAscending:](SSPurchasableAppItem, "itemsFromDatabase:forAccount:matching:sortedBy:sortAscending:", a3, a4, 0, a5, a6);
}

+ (id)itemsFromDatabase:(id)a3 forAccount:(int64_t)a4 matching:(id)a5 sortedBy:(id)a6 sortAscending:(BOOL)a7
{
  id v7;
  _QWORD v9[8];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__72;
  v15 = __Block_byref_object_dispose__72;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke;
  v9[3] = &unk_1E47BFE48;
  v10 = a7;
  v9[4] = a6;
  v9[5] = a5;
  v9[6] = &v11;
  v9[7] = a4;
  objc_msgSend(a3, "readUsingTransactionBlock:", v9);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  SSSQLiteComparisonPredicate *v6;
  SSSQLiteQueryDescriptor *v7;
  __CFString **v8;
  SSSQLiteQuery *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[7];

  v4 = (void *)MEMORY[0x1A8585BF8]();
  v5 = objc_msgSend(a2, "database");
  v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", SSPurchasableItemAccountUniqueIdentifier, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56)));
  v7 = objc_alloc_init(SSSQLiteQueryDescriptor);
  -[SSSQLiteQueryDescriptor setEntityClass:](v7, "setEntityClass:", objc_opt_class());
  if (*(_QWORD *)(a1 + 32))
  {
    -[SSSQLiteQueryDescriptor setOrderingProperties:](v7, "setOrderingProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:"));
    v8 = SSSQLiteOrderAscending;
    if (!*(_BYTE *)(a1 + 64))
      v8 = &SSSQLiteOrderDescending;
    -[SSSQLiteQueryDescriptor setOrderingDirections:](v7, "setOrderingDirections:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v8));
  }
  if (*(_QWORD *)(a1 + 40))
    v6 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0));
  -[SSSQLiteQueryDescriptor setPredicate:](v7, "setPredicate:", v6);
  v9 = -[SSSQLiteQuery initWithDatabase:descriptor:]([SSSQLiteQuery alloc], "initWithDatabase:descriptor:", v5, v7);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = +[SSPurchasableAppItem allPropertyKeys](SSPurchasableAppItem, "allPropertyKeys");
  v11 = objc_msgSend(v10, "count");
  v12 = malloc_type_malloc(8 * v11, 0x80040B8603338uLL);
  objc_msgSend(v10, "getObjects:range:", v12, 0, objc_msgSend(v10, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke_2;
  v14[3] = &unk_1E47BFE20;
  v14[5] = v11;
  v14[6] = v12;
  v14[4] = *(_QWORD *)(a1 + 48);
  -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:](v9, "enumeratePersistentIDsAndProperties:count:usingBlock:", v12, v11, v14);
  free(v12);

  objc_autoreleasePoolPop(v4);
  return 1;
}

void __85__SSPurchasableAppItem_itemsFromDatabase_forAccount_matching_sortedBy_sortAscending___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t i;
  uint64_t v8;
  SSPurchasableAppItem *v9;
  id v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = a1[5];
  v10 = v5;
  if (v6)
  {
    for (i = 0; i < v6; ++i)
    {
      v8 = *(_QWORD *)(a3 + 8 * i);
      if (v8)
      {
        objc_msgSend(v10, "setObject:forKey:", v8, *(_QWORD *)(a1[6] + 8 * i));
        v5 = v10;
        v6 = a1[5];
      }
    }
  }
  if (objc_msgSend(v5, "count"))
  {
    v9 = -[SSPurchasableItem initWithPropertyValues:]([SSPurchasableAppItem alloc], "initWithPropertyValues:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", v9);

  }
}

- (id)accountIdentifier
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("account_unique_identifier"));
}

- (id)category
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("category"));
}

- (id)companyName
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("company_title"));
}

- (int64_t)contentRatingFlags
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("content_rating_flags")), "integerValue");
}

- (id)bundleID
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("bundle_id"));
}

- (BOOL)hasMessagesExtension
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("has_messages_extension")), "BOOLValue");
}

- (id)iconTitle
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("icon_title"));
}

- (id)iconURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("icon_url")));
}

- (BOOL)isFamilyShareable
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("is_family_shareable")), "BOOLValue");
}

- (BOOL)isHiddenFromSpringBoard
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("is_hidden_from_springboard")), "BOOLValue");
}

- (BOOL)isNewsstand
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("is_newsstand")), "BOOLValue");
}

- (id)longTitle
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("long_title"));
}

- (unsigned)minimumOS
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("minimum_os")), "unsignedIntValue");
}

- (id)ovalIconURLString
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("oval_icon_url"));
}

- (BOOL)is32BitOnly
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("is_32_bit_only")), "BOOLValue");
}

- (BOOL)supportsIPad
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("supports_ipad")), "BOOLValue");
}

- (BOOL)supportsIPhone
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("supports_iphone")), "BOOLValue");
}

- (id)redownloadParams
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("redownload_params"));
}

- (id)humanReadableVersion
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("version_human_readable"));
}

- (int64_t)iTunesVersion
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("version_itunes")), "longLongValue");
}

- (BOOL)isPreorder
{
  return objc_msgSend((id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("IFNULL(app_purchase_history.is_preorder, 0)")), "BOOLValue");
}

- (id)requiredCapabilitiesString
{
  return (id)objc_msgSend(-[SSPurchasableItem propertyValues](self, "propertyValues"), "objectForKey:", CFSTR("required_capabilities"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPurchasableAppItem;
  return (id)objc_msgSend(-[SSPurchasableItem description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" [BundleID: %@] [IconURL: %@]"), -[SSPurchasableAppItem bundleID](self, "bundleID"), -[SSPurchasableAppItem iconURL](self, "iconURL"));
}

+ (id)databaseTable
{
  return CFSTR("app_purchase_history");
}

+ (id)sortByNameKey
{
  return CFSTR("icon_title");
}

+ (id)allPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SSPurchasableAppItem_allPropertyKeys__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = a1;
  if (allPropertyKeys_onceToken_0 != -1)
    dispatch_once(&allPropertyKeys_onceToken_0, block);
  return (id)allPropertyKeys___allPropertyKeys_0;
}

void __39__SSPurchasableAppItem_allPropertyKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_super v4;
  _QWORD v5[26];

  v5[25] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A8585BF8]();
  v5[0] = CFSTR("account_unique_identifier");
  v5[1] = CFSTR("category");
  v5[2] = CFSTR("company_title");
  v5[3] = CFSTR("content_rating_flags");
  v5[4] = CFSTR("bundle_id");
  v5[5] = CFSTR("flavors");
  v5[6] = CFSTR("has_messages_extension");
  v5[7] = CFSTR("icon_title");
  v5[8] = CFSTR("icon_token");
  v5[9] = CFSTR("icon_url");
  v5[10] = CFSTR("is_family_shareable");
  v5[11] = CFSTR("is_hidden_from_springboard");
  v5[12] = CFSTR("is_newsstand");
  v5[13] = CFSTR("IFNULL(app_purchase_history.is_preorder, 0)");
  v5[14] = CFSTR("long_title");
  v5[15] = CFSTR("minimum_os");
  v5[16] = CFSTR("oval_icon_token");
  v5[17] = CFSTR("oval_icon_url");
  v5[18] = CFSTR("is_32_bit_only");
  v5[19] = CFSTR("supports_ipad");
  v5[20] = CFSTR("supports_iphone");
  v5[21] = CFSTR("redownload_params");
  v5[22] = CFSTR("version_human_readable");
  v5[23] = CFSTR("version_itunes");
  v5[24] = CFSTR("required_capabilities");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v5, 25);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___SSPurchasableAppItem;
  allPropertyKeys___allPropertyKeys_0 = (uint64_t)(id)objc_msgSend(v3, "arrayByAddingObjectsFromArray:", objc_msgSendSuper2(&v4, sel_allPropertyKeys));

  objc_autoreleasePoolPop(v2);
}

@end
