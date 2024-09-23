@implementation FavoritesShortcutsProvider

- (NSArray)filteredItems
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *filteredItems;
  NSArray *v8;
  _QWORD v10[5];
  _QWORD v11[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesShortcutsProvider favoritesManager](self, "favoritesManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxesCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleItems"));

  if (!-[NSArray isEqualToArray:](self->_items, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)&self->_items, v5);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A3934;
    v10[3] = &unk_10051D0E0;
    v10[4] = v11;
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_compactMap:", v10));
    filteredItems = self->_filteredItems;
    self->_filteredItems = v6;

    _Block_object_dispose(v11, 8);
  }
  v8 = self->_filteredItems;

  return v8;
}

- (FavoritesManager)favoritesManager
{
  return (FavoritesManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFavoritesManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MFMailboxProvider)mailboxProvider
{
  return (MFMailboxProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMailboxProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_filteredItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
