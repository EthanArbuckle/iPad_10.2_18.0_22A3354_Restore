@implementation FavoritesCollection

- (NSArray)visibleItems
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10009BA2C;
  v9 = sub_10009BA3C;
  v10 = 0;
  if (self)
    self = (FavoritesCollection *)self->_state;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E450;
  v4[3] = &unk_10051C9C0;
  v4[4] = &v5;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void)addExpandedItemsFromDictionaryRepresentations:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemFromDictionary:](FavoriteItem, "itemFromDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), (_QWORD)v10));
        v9 = v8;
        if (v8 && _MSSourceTypeIsValid(objc_msgSend(v8, "sourceType")))
          -[FavoritesCollection addExpandedItem:](self, "addExpandedItem:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)addOrUpdateItem:(id)a3 replacedItem:(id *)a4
{
  id v6;
  EFLocked *state;
  EFLocked *v8;
  id v9;
  BOOL v10;
  void **v12;
  uint64_t v13;
  void (*v14)(_QWORD *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10009BA2C;
  v24 = sub_10009BA3C;
  v25 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v8 = state;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10000CE54;
  v15 = &unk_10051CAC0;
  v17 = &v20;
  v9 = v6;
  v16 = v9;
  v18 = &v26;
  v19 = &v30;
  -[EFLocked performWhileLocked:](v8, "performWhileLocked:", &v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  if (*((_BYTE *)v31 + 24))
  {
    -[FavoritesCollection invalidateVisibleItems](self, "invalidateVisibleItems", v12, v13, v14, v15);
  }
  else if (*((_BYTE *)v27 + 24))
  {
    sub_100008418(self, v9);
  }
  if (*((_BYTE *)v27 + 24))
    v10 = 1;
  else
    v10 = *((_BYTE *)v31 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v10;
}

- (NSArray)items
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10009BA2C;
  v9 = sub_10009BA3C;
  v10 = 0;
  if (self)
    self = (FavoritesCollection *)self->_state;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033C18;
  v4[3] = &unk_10051C9C0;
  v4[4] = &v5;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (BOOL)addItem:(id)a3 ordered:(BOOL)a4
{
  id v6;
  EFLocked *state;
  EFLocked *v8;
  id v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v8 = state;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D838;
  v12[3] = &unk_10051CA70;
  v14 = &v16;
  v9 = v6;
  v13 = v9;
  v15 = a4;
  -[EFLocked performWhileLocked:](v8, "performWhileLocked:", v12);

  if (*((_BYTE *)v17 + 24))
  {
    sub_100008418(self, v9);
    v10 = *((_BYTE *)v17 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)setItems:(id)a3
{
  id v4;
  EFLocked *state;
  EFLocked *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (self)
    state = self->_state;
  else
    state = 0;
  v6 = state;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039D6C;
  v8[3] = &unk_10051CA08;
  v7 = v4;
  v9 = v7;
  -[EFLocked performWhileLocked:](v6, "performWhileLocked:", v8);

  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", "wasAddedToCollection:", self);
  -[FavoritesCollection invalidateVisibleItems](self, "invalidateVisibleItems");

}

- (void)invalidateVisibleItems
{
  if (self)
    self = (FavoritesCollection *)self->_state;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", &stru_10051CA48);
}

- (BOOL)addItem:(id)a3
{
  return -[FavoritesCollection addItem:ordered:](self, "addItem:ordered:", a3, 0);
}

- (BOOL)transient
{
  return self->_transient;
}

- (void)prepareForWriting
{
  EFLocked *state;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (-[FavoritesCollection isAccountsCollection](self, "isAccountsCollection"))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = sub_10009BA2C;
    v10 = sub_10009BA3C;
    v11 = 0;
    if (self)
      state = self->_state;
    else
      state = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000C8FC;
    v5[3] = &unk_10051C9C0;
    v5[4] = &v6;
    -[EFLocked performWhileLocked:](state, "performWhileLocked:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setObject:forKey:", v7[5], CFSTR("MailAccountsOrder"));
    objc_msgSend(v4, "synchronize");

    _Block_object_dispose(&v6, 8);
  }
}

- (BOOL)isAccountsCollection
{
  return self->_type == 3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  EFLocked *state;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_type));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10009BA2C;
  v32 = sub_10009BA3C;
  v33 = 0;
  state = self->_state;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100024678;
  v27[3] = &unk_10051C9C0;
  v27[4] = &v28;
  -[EFLocked performWhileLocked:](state, "performWhileLocked:", v27);
  if (-[NSMutableDictionary count](self->_invalidItemDicts, "count"))
  {
    v6 = self->_invalidItemDicts;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compare:"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12);
          v14 = self->_invalidItemDicts;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v13, (_QWORD)v23));

          v16 = objc_msgSend(v13, "unsignedIntegerValue");
          v17 = objc_msgSend((id)v29[5], "count");
          v18 = (void *)v29[5];
          if (v16 >= v17)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("items")));
            objc_msgSend(v19, "addObject:", v15);
          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("items")));
            objc_msgSend(v19, "insertObject:atIndex:", v15, v16);
          }

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
      }
      while (v10);
    }

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29[5], "objectForKeyedSubscript:", CFSTR("items"), (_QWORD)v23));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("items"));

  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29[5], "objectForKeyedSubscript:", CFSTR("expandedItems")));
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("expandedItems"));

  }
  _Block_object_dispose(&v28, 8);

  return v3;
}

- (id)uniqueId
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Collection-%d"), self->_type);
}

- (FavoritesCollection)initWithDictionary:(id)a3
{
  id v4;
  FavoritesCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t type;
  BOOL v10;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *invalidItemDicts;
  unint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v22;
  id v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FavoritesCollection;
  v5 = -[FavoritesCollection init](&v24, "init");
  if (!v5)
    goto LABEL_20;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
  v23 = v4;
  v5->_type = (unint64_t)objc_msgSend(v6, "integerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("displayName")));
  v8 = v7;
  type = v5->_type;
  if (type)
    v10 = 1;
  else
    v10 = v7 == 0;
  v22 = v7;
  if (!v10)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("__OUTBOX__"), v7))
    {
      type = 2;
LABEL_11:
      v5->_type = type;
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("INBOXES"))
      || objc_msgSend(v8, "isEqualToString:", CFSTR("MAILBOXES")))
    {
      type = 1;
      goto LABEL_11;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("ACCOUNTS"))
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("SINGLE_ACCOUNT_MAILBOXES")) & 1) != 0)
    {
      type = 3;
      goto LABEL_11;
    }
    type = v5->_type;
  }
LABEL_12:
  sub_100033570((uint64_t)v5, type);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("items")));
  v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = objc_opt_new(NSMutableDictionary);
  invalidItemDicts = v5->_invalidItemDicts;
  v5->_invalidItemDicts = v13;

  for (i = 0; i < (unint64_t)objc_msgSend(v11, "count", v22); ++i)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", i));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemFromDictionary:](FavoriteItem, "itemFromDictionary:", v16));
    v18 = v17;
    if (v17)
    {
      if (_MSSourceTypeIsValid(objc_msgSend(v17, "sourceType")))
      {
        objc_msgSend(v12, "addObject:", v18);
      }
      else
      {
        v19 = v5->_invalidItemDicts;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v20);

      }
    }

  }
  -[FavoritesCollection setItems:](v5, "setItems:", v12);

  v4 = v23;
LABEL_20:

  return v5;
}

- (id)visibleItemsOfType:(int64_t)a3
{
  id *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BA44;
  v5[3] = &unk_10051CAE0;
  v5[4] = a3;
  v3 = sub_100046858((id *)&self->super.isa, v5);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)setEditing:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self)
    self = (FavoritesCollection *)self->_state;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003BFE0;
  v3[3] = &unk_10051C9E0;
  v4 = a3;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", v3);
}

- (BOOL)isVisible
{
  return 1;
}

- (BOOL)isOutboxCollection
{
  return self->_type == 2;
}

- (BOOL)isMailboxesCollection
{
  return self->_type == 1;
}

- (BOOL)isEditing
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (self)
    self = (FavoritesCollection *)self->_state;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003C1B8;
  v4[3] = &unk_10051C9C0;
  v4[4] = &v5;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSArray)expandedItems
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10009BA2C;
  v9 = sub_10009BA3C;
  v10 = 0;
  if (self)
    self = (FavoritesCollection *)self->_state;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BEF8;
  v4[3] = &unk_10051C9C0;
  v4[4] = &v5;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_invalidItemDicts, 0);
}

+ (id)mailboxesCollection
{
  return sub_10009B8E0([FavoritesCollection alloc], 1);
}

+ (id)accountsCollection
{
  return sub_10009B8E0([FavoritesCollection alloc], 3);
}

+ (id)outboxCollection
{
  _QWORD *v2;
  void *v3;

  v2 = sub_10009B8E0([FavoritesCollection alloc], 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForOutbox](FavoriteItem, "itemForOutbox"));
  objc_msgSend(v2, "addItem:", v3);

  return v2;
}

- (BOOL)addExpandedItem:(id)a3
{
  id v4;
  EFLocked *state;
  EFLocked *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v6 = state;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009BB3C;
  v9[3] = &unk_10051CA98;
  v10 = v4;
  v11 = &v12;
  v7 = v4;
  -[EFLocked performWhileLocked:](v6, "performWhileLocked:", v9);

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v6;
}

- (void)addOrUpdateExpandedItem:(id)a3 replacedItem:(id *)a4
{
  id v6;
  EFLocked *state;
  EFLocked *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[3];
  char v24;

  v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10009BA2C;
  v19 = sub_10009BA3C;
  v20 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v8 = state;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009BD24;
  v10[3] = &unk_10051CAC0;
  v12 = &v15;
  v9 = v6;
  v11 = v9;
  v13 = v21;
  v14 = v23;
  -[EFLocked performWhileLocked:](v8, "performWhileLocked:", v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

}

- (id)removeItem:(id)a3
{
  id v4;
  EFLocked *state;
  EFLocked *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10009BA2C;
  v18 = sub_10009BA3C;
  v19 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v6 = state;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009BEE8;
  v11[3] = &unk_10051CA98;
  v13 = &v14;
  v7 = v4;
  v12 = v7;
  -[EFLocked performWhileLocked:](v6, "performWhileLocked:", v11);

  v8 = (void *)v15[5];
  if (v8)
  {
    sub_10009BF4C(self, v7);
    v8 = (void *)v15[5];
  }
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)removeExpandedItem:(id)a3
{
  id v4;
  EFLocked *state;
  EFLocked *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10009BA2C;
  v17 = sub_10009BA3C;
  v18 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v6 = state;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009C0CC;
  v10[3] = &unk_10051CA98;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  -[EFLocked performWhileLocked:](v6, "performWhileLocked:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)removeItemWithSyncKey:(id)a3
{
  id v4;
  EFLocked *state;
  EFLocked *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10009BA2C;
  v19 = sub_10009BA3C;
  v20 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v6 = state;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009C280;
  v12[3] = &unk_10051CA98;
  v14 = &v15;
  v7 = v4;
  v13 = v7;
  -[EFLocked performWhileLocked:](v6, "performWhileLocked:", v12);

  v8 = (void *)v16[5];
  if (v8)
  {
    sub_10009BF4C(self, v8);
    v9 = (void *)v16[5];
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)itemWithSyncKey:(id)a3
{
  id v4;
  EFLocked *state;
  EFLocked *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10009BA2C;
  v17 = sub_10009BA3C;
  v18 = 0;
  if (self)
    state = self->_state;
  else
    state = 0;
  v6 = state;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009C408;
  v10[3] = &unk_10051CA98;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  -[EFLocked performWhileLocked:](v6, "performWhileLocked:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSArray)selectedItems
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10009BA2C;
  v9 = sub_10009BA3C;
  v10 = 0;
  if (self)
    self = (FavoritesCollection *)self->_state;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009C540;
  v4[3] = &unk_10051C9C0;
  v4[4] = &v5;
  -[FavoritesCollection performWhileLocked:](self, "performWhileLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (id)itemsOfType:(int64_t)a3
{
  id *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009C5F4;
  v5[3] = &unk_10051CAE0;
  v5[4] = a3;
  v3 = sub_100046858((id *)&self->super.isa, v5);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)itemsMatchingName:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009C6C0;
  v8[3] = &unk_10051CB08;
  v9 = a3;
  v4 = v9;
  v5 = sub_10009C7A8((id *)&self->super.isa, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)itemsContainingName:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009C978;
  v8[3] = &unk_10051CB08;
  v9 = a3;
  v4 = v9;
  v5 = sub_10009C7A8((id *)&self->super.isa, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)itemsMatchingItemURLStrings:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009CAF4;
  v8[3] = &unk_10051CB08;
  v9 = a3;
  v4 = v9;
  v5 = sub_10009C7A8((id *)&self->super.isa, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (NSArray)itemsIncludingSubItems
{
  EFLocked *state;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10009BA2C;
  v11 = sub_10009BA3C;
  v12 = (id)0xAAAAAAAAAAAAAAAALL;
  v12 = objc_alloc_init((Class)NSMutableArray);
  if (self)
    state = self->_state;
  else
    state = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009CE4C;
  v6[3] = &unk_10051C9C0;
  v6[4] = &v7;
  -[EFLocked performWhileLocked:](state, "performWhileLocked:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSString)displayName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  EFLocked *state;
  NSBundle *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = sub_10009D030((uint64_t)self, self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedAccounts"));

  if (-[FavoritesCollection isMailboxesCollection](self, "isMailboxesCollection") && objc_msgSend(v7, "count") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));

    v4 = (void *)v9;
  }
  else if (-[FavoritesCollection isAccountsCollection](self, "isAccountsCollection"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    state = self->_state;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10009D354;
    v15[3] = &unk_10051C9C0;
    v15[4] = &v16;
    -[EFLocked performWhileLocked:](state, "performWhileLocked:", v15);
    if ((unint64_t)v17[3] <= 1)
    {
      v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SINGLE_ACCOUNT_MAILBOXES"), &stru_100531B00, CFSTR("Main")));

      v4 = (void *)v13;
    }
    _Block_object_dispose(&v16, 8);
  }

  return (NSString *)v4;
}

- (BOOL)isShowingSharedMailboxOfType:(unint64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollection visibleItems](self, "visibleItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForSharedMailboxWithType:selected:](FavoriteItem, "itemForSharedMailboxWithType:selected:", a3, 0));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)isShowingAllInboxes
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollection visibleItems](self, "visibleItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForUnifiedMailboxWithType:selected:](FavoriteItem, "itemForUnifiedMailboxWithType:selected:", 7, 0));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)hidesHeader
{
  if (-[FavoritesCollection isMailboxesCollection](self, "isMailboxesCollection")
    || -[FavoritesCollection isOutboxCollection](self, "isOutboxCollection"))
  {
    return 1;
  }
  else
  {
    return -[FavoritesCollection isAccountsCollection](self, "isAccountsCollection");
  }
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = sub_10009D030((uint64_t)self, self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollection items](self, "items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; type = %@; items = %@>"),
                   v5,
                   self,
                   v4,
                   v6));

  return v7;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

@end
