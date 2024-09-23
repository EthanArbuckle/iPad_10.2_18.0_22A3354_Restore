@implementation SKUIWishlist

- (SKUIWishlist)initWithAccountIdentifier:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIWishlist *v13;
  uint64_t v14;
  SSWishlist *database;
  objc_super v17;

  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)))
  {
    if (a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[SKUIWishlist initWithAccountIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  if (!a3)
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid accountID"));
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)SKUIWishlist;
  v13 = -[SKUIWishlist init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAF6F8]), "initWithAccountIdentifier:", a3);
    database = v13->_database;
    v13->_database = (SSWishlist *)v14;

  }
  return v13;
}

+ (id)activeWishlist
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SKUIWishlist *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  v6 = (void *)activeWishlist_sActiveWishlist;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if (!activeWishlist_sActiveWishlist || objc_msgSend((id)activeWishlist_sActiveWishlist, "accountIdentifier") != v5)
  {
    v7 = -[SKUIWishlist initWithAccountIdentifier:]([SKUIWishlist alloc], "initWithAccountIdentifier:", v5);
    v6 = (void *)activeWishlist_sActiveWishlist;
LABEL_6:
    activeWishlist_sActiveWishlist = (uint64_t)v7;

  }
  v8 = (id)activeWishlist_sActiveWishlist;

  return v8;
}

- (int64_t)accountIdentifier
{
  return -[SSWishlist accountIdentifier](self->_database, "accountIdentifier");
}

- (void)addItem:(id)a3
{
  id v4;
  SSWishlist *database;
  id v6;
  SKUIAddToWishlistOperation *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  SKUIWishlist *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  database = self->_database;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __24__SKUIWishlist_addItem___block_invoke;
  v9[3] = &unk_1E73A6358;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v9);
  if (*((_BYTE *)v14 + 24))
  {
    v7 = -[SKUIAddToWishlistOperation initWithItem:reason:]([SKUIAddToWishlistOperation alloc], "initWithItem:reason:", v6, 0);
    SKUIWishlistOperationQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v7);

  }
  _Block_object_dispose(&v13, 8);

}

BOOL __24__SKUIWishlist_addItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAF618], "predicateWithProperty:equalToLongLong:", *MEMORY[0x1E0DAFDC0], objc_msgSend(*(id *)(a1 + 32), "itemIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF700], "anyInDatabase:predicate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setValue:forProperty:", &unk_1E749B6D8, *MEMORY[0x1E0DAFDD8]);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    SKUIWishlistItemPropertiesWithItem(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *MEMORY[0x1E0DAFDD0];
      objc_msgSend(MEMORY[0x1E0DAF700], "maxValueForProperty:predicate:database:", *MEMORY[0x1E0DAFDD0], 0, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v10, v8);

      objc_msgSend(v7, "setObject:forKey:", &unk_1E749B6D8, *MEMORY[0x1E0DAFDD8]);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF700]), "initWithPropertyValues:inDatabase:", v7, v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastSyncTime:", v12);

    v13 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)containsItemWithIdentifier:(int64_t)a3
{
  SSWishlist *database;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SKUIWishlist_containsItemWithIdentifier___block_invoke;
  v6[3] = &unk_1E73A6380;
  v6[4] = &v7;
  v6[5] = a3;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__SKUIWishlist_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0DAF618];
  v4 = *MEMORY[0x1E0DAFDC0];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "predicateWithProperty:equalToLongLong:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF700], "anyInDatabase:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8 != 0;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  return v9;
}

- (NSArray)items
{
  void *v3;
  SSWishlist *database;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__SKUIWishlist_items__block_invoke;
  v7[3] = &unk_1E73A63D0;
  v5 = v3;
  v8 = v5;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);

  return (NSArray *)v5;
}

uint64_t __21__SKUIWishlist_items__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DAF630];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setEntityClass:", objc_opt_class());
  v15[0] = *MEMORY[0x1E0DAFCC8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrderingDirections:", v6);

  v14 = *MEMORY[0x1E0DAFDD0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrderingProperties:", v7);

  objc_msgSend(MEMORY[0x1E0DAF618], "predicateWithProperty:value:comparisonType:", *MEMORY[0x1E0DAFDD8], &unk_1E749B6F0, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF628]), "initWithDatabase:descriptor:", v4, v5);
  v13 = (id)*MEMORY[0x1E0DAFDB8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __21__SKUIWishlist_items__block_invoke_20;
  v11[3] = &unk_1E73A63A8;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v9, "enumeratePersistentIDsAndProperties:count:usingBlock:", &v13, 1, v11);

  return 1;
}

void __21__SKUIWishlist_items__block_invoke_20(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  SKUIItem *v7;

  v5 = (void *)MEMORY[0x1BCCE6C7C]();
  if (*a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", *a3, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[SKUIItem initWithCacheRepresentation:]([SKUIItem alloc], "initWithCacheRepresentation:", v6);
      if (v7)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    }
  }
  objc_autoreleasePoolPop(v5);
}

- (void)postChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SKUIWishlistDidChangeNotification"), self);

}

- (void)removeItemsWithItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  SSWishlist *database;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  SKUIWishlistOperationQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke;
  v9[3] = &unk_1E73A63F8;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v9);

}

uint64_t __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0DAFDC0];
  objc_msgSend(MEMORY[0x1E0DAF620], "containsPredicateWithProperty:values:", *MEMORY[0x1E0DAFDC0], *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF700], "queryWithDatabase:predicate:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2;
  v9[3] = &unk_1E73A1938;
  v10 = v3;
  v11 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:count:usingBlock:", v12, 1, v9);

  return 1;
}

void __47__SKUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, id *a3)
{
  void *v6;
  void *v7;
  SKUIRemoveFromWishlistOperation *v8;

  v6 = (void *)MEMORY[0x1BCCE6C7C]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF700]), "initWithPersistentID:inDatabase:", a2, *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setValue:forProperty:", &unk_1E749B6F0, *MEMORY[0x1E0DAFDD8]);
  v8 = -[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]([SKUIRemoveFromWishlistOperation alloc], "initWithItemIdentifier:entityIdentifier:reason:", objc_msgSend(*a3, "longLongValue"), a2, 0);
  objc_msgSend(*(id *)(a1 + 40), "addOperation:", v8);

  objc_autoreleasePoolPop(v6);
}

- (unint64_t)hash
{
  return -[SSWishlist accountIdentifier](self->_database, "accountIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[SKUIWishlist accountIdentifier](self, "accountIdentifier");
    v6 = v7 == objc_msgSend(v4, "accountIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)initWithAccountIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
