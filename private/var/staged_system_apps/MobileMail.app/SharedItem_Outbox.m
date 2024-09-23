@implementation SharedItem_Outbox

- (void)configureOutlineCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SharedItem_Outbox;
  -[FavoriteItem configureOutlineCell:](&v7, "configureOutlineCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount outboxMailboxUid](MailAccount, "outboxMailboxUid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  objc_msgSend(v4, "setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:", v6, -[FavoriteItem showUnreadCount](self, "showUnreadCount"), 1);

}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a6;
  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount outboxMailboxUid](MailAccount, "outboxMailboxUid"));
  objc_msgSend(v9, "selectMailbox:item:animated:", v8, self, v6);

}

- (SharedItem_Outbox)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SharedItem_Outbox;
  return -[FavoriteItem initWithType:](&v3, "initWithType:", 6);
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)displayName
{
  return +[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:", 6);
}

- (id)itemID
{
  NSString *itemID;
  const __CFString *collectionID;
  NSString *v5;
  NSString *v6;

  itemID = self->super._itemID;
  if (!itemID)
  {
    if (self->super._collectionID)
      collectionID = (const __CFString *)self->super._collectionID;
    else
      collectionID = &stru_100531B00;
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld"), collectionID, -[FavoriteItem type](self, "type")));
    v6 = self->super._itemID;
    self->super._itemID = v5;

    itemID = self->super._itemID;
  }
  return itemID;
}

- (id)itemURLString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedItem_Outbox itemID](self, "itemID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("favoriteitem://outbox/%@"), v2));

  return v3;
}

@end
