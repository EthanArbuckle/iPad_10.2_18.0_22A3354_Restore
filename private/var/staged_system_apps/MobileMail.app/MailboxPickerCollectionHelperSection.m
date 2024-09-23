@implementation MailboxPickerCollectionHelperSection

- (BOOL)isAccounts
{
  return (id)-[MailboxPickerCollectionHelperSection type](self, "type") == (id)2;
}

- (int64_t)type
{
  return self->_type;
}

- (id)accountFavoriteItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperSection items](self, "items"));
  if (-[MailboxPickerCollectionHelperSection isAccounts](self, "isAccounts")
    && objc_msgSend(v3, "count")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0)),
        v5 = objc_msgSend(v4, "type"),
        v4,
        v5 == (id)1))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)initPlaceholderWithSectionIdentifierIndex:(int64_t)a3
{
  MailboxPickerCollectionHelperSection *v4;
  MailboxPickerCollectionHelperSection *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MailboxPickerCollectionHelperSection;
  v4 = -[MailboxPickerCollectionHelperSection init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    -[MailboxPickerCollectionHelperSection setItems:](v4, "setItems:", &__NSArray0__struct);
    -[MailboxPickerCollectionHelperSection setItemsByItemID:](v5, "setItemsByItemID:", &__NSDictionary0__struct);
    -[MailboxPickerCollectionHelperSection setType:](v5, "setType:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Placeholder:%ld"), a3));
    -[MailboxPickerCollectionHelperSection setSectionIdentifier:](v5, "setSectionIdentifier:", v6);

  }
  return v5;
}

- (MailboxPickerCollectionHelperSection)initWithCollection:(id)a3
{
  id v6;
  MailboxPickerCollectionHelperSection *v7;
  MailboxPickerCollectionHelperSection *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (objc_msgSend(v6, "isAccountsCollection"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelperModel.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![collection isAccountsCollection]"));

  }
  v17.receiver = self;
  v17.super_class = (Class)MailboxPickerCollectionHelperSection;
  v7 = -[MailboxPickerCollectionHelperSection init](&v17, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_collection, a3);
    -[MailboxPickerCollectionHelperSection setAccountIndex:](v8, "setAccountIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
    -[MailboxPickerCollectionHelperSection setSectionIdentifier:](v8, "setSectionIdentifier:", v9);

    if ((objc_msgSend(v6, "isMailboxesCollection") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      if (!objc_msgSend(v6, "isOutboxCollection"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("MailboxPickerCollectionHelperModel.m"), 59, CFSTR("Unexpected collection type"));

        goto LABEL_10;
      }
      v10 = 1;
    }
    -[MailboxPickerCollectionHelperSection setType:](v8, "setType:", v10);
LABEL_10:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
    v13 = sub_10004157C((uint64_t)v8, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[MailboxPickerCollectionHelperSection setItemsByItemID:](v8, "setItemsByItemID:", v14);

  }
  return v8;
}

- (MailboxPickerCollectionHelperSection)initWithAccountsCollection:(id)a3 index:(int64_t)a4 items:(id)a5
{
  id v10;
  id v11;
  MailboxPickerCollectionHelperSection *v12;
  MailboxPickerCollectionHelperSection *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  if ((objc_msgSend(v10, "isAccountsCollection") & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelperModel.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isAccountsCollection]"));

  }
  v23.receiver = self;
  v23.super_class = (Class)MailboxPickerCollectionHelperSection;
  v12 = -[MailboxPickerCollectionHelperSection init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collection, a3);
    -[MailboxPickerCollectionHelperSection setAccountIndex:](v13, "setAccountIndex:", a4);
    -[MailboxPickerCollectionHelperSection setItems:](v13, "setItems:", v11);
    -[MailboxPickerCollectionHelperSection setType:](v13, "setType:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v14, v16));
    -[MailboxPickerCollectionHelperSection setSectionIdentifier:](v13, "setSectionIdentifier:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v19 = sub_10004157C((uint64_t)v13, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[MailboxPickerCollectionHelperSection setItemsByItemID:](v13, "setItemsByItemID:", v20);

  }
  return v13;
}

- (NSArray)items
{
  NSArray *items;
  NSArray *v3;
  void *v4;

  items = self->_items;
  if (items)
  {
    v3 = items;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperSection collection](self, "collection"));
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleItems"));

  }
  return v3;
}

- (void)prepareItemsForView
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperSection collection](self, "collection", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "items"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "prepareItemForView");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (void)setItemsByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemsByItemID, a3);
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void)setAccountIndex:(int64_t)a3
{
  self->_accountIndex = a3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDictionary)itemsByItemID
{
  return self->_itemsByItemID;
}

- (BOOL)isFavorites
{
  return -[MailboxPickerCollectionHelperSection type](self, "type") == 0;
}

- (FavoritesCollection)collection
{
  return self->_collection;
}

- (BOOL)isOutbox
{
  return (id)-[MailboxPickerCollectionHelperSection type](self, "type") == (id)1;
}

- (BOOL)isPlaceholder
{
  return (id)-[MailboxPickerCollectionHelperSection type](self, "type") == (id)3;
}

- (void)_reloadItemsByItemID
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperSection items](self, "items"));
  v3 = sub_10004157C((uint64_t)self, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[MailboxPickerCollectionHelperSection setItemsByItemID:](self, "setItemsByItemID:", v4);

}

- (int64_t)accountIndex
{
  return self->_accountIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByItemID, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
