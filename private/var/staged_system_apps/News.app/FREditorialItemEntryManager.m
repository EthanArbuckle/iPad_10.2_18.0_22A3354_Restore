@implementation FREditorialItemEntryManager

- (FREditorialItemEntryManager)initWithLocalStore:(id)a3
{
  id v5;
  FREditorialItemEntryManager *v6;
  FREditorialItemEntryManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FREditorialItemEntryManager;
  v6 = -[FREditorialItemEntryManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localStore, a3);

  return v7;
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  FREditorialItemEntry *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[FREditorialItemEntryManager setEditorialItemsByID:](self, "setEditorialItemsByID:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[FREditorialItemEntryManager setOrderedEditorialItemIDs:](self, "setOrderedEditorialItemIDs:", v4);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager localStore](self, "localStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(NSDictionary, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager localStore](self, "localStore"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));
        v16 = FCDynamicCast(v13, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (!v17)
        {
          v22 = objc_opt_class(NSArray, v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager localStore](self, "localStore"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v12));
          v25 = FCDynamicCast(v22, v24);
          v19 = (FREditorialItemEntry *)objc_claimAutoreleasedReturnValue(v25);

          if (!v19 || !objc_msgSend(v12, "isEqualToString:", CFSTR("editorialOrderedItems")))
            goto LABEL_14;
          v20 = -[FREditorialItemEntry copy](v19, "copy");
          -[FREditorialItemEntryManager setOrderedEditorialItemIDs:](self, "setOrderedEditorialItemIDs:", v20);
          goto LABEL_13;
        }
        if (!objc_msgSend(v12, "hasPrefix:", CFSTR("ed-")))
          goto LABEL_15;
        v19 = -[FREditorialItemEntry initWithEntryID:dictionaryRepresentation:]([FREditorialItemEntry alloc], "initWithEntryID:dictionaryRepresentation:", v12, v17);
        if (v19)
        {
          v20 = (id)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager editorialItemsByID](self, "editorialItemsByID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry editorialItemID](v19, "editorialItemID"));
          objc_msgSend(v20, "setObject:forKey:", v19, v21);

LABEL_13:
        }
LABEL_14:

LABEL_15:
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (void)setOrderedEditorialItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_orderedEditorialItemIDs, a3);
}

- (void)setEditorialItemsByID:(id)a3
{
  objc_storeStrong((id *)&self->_editorialItemsByID, a3);
}

- (NSMutableDictionary)editorialItemsByID
{
  return self->_editorialItemsByID;
}

- (void)addEditorialItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager editorialItemsByID](self, "editorialItemsByID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorialItemID"));
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager localStore](self, "localStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryID"));

  objc_msgSend(v9, "setObject:forKey:", v7, v8);
}

- (void)removeItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager editorialItemsByID](self, "editorialItemsByID"));
    objc_msgSend(v4, "removeObjectForKey:", v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager localStore](self, "localStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager _editorialEntryIDForIdentifier:](self, "_editorialEntryIDForIdentifier:", v7));
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (void)addOrderedEditorialItemIDs:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = objc_msgSend(v4, "copy");
  -[FREditorialItemEntryManager setOrderedEditorialItemIDs:](self, "setOrderedEditorialItemIDs:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager localStore](self, "localStore"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("editorialOrderedItems"));

}

- (id)_editorialEntryIDForIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ed-"), a3);
}

- (id)cachedArticleIDs
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntryManager editorialItemsByID](self, "editorialItemsByID"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007283C;
  v7[3] = &unk_1000DC420;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (NSArray)orderedEditorialItemIDs
{
  return self->_orderedEditorialItemIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_orderedEditorialItemIDs, 0);
  objc_storeStrong((id *)&self->_editorialItemsByID, 0);
}

@end
