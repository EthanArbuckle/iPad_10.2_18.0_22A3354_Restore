@implementation FavoriteItem

- (NSString)ef_publicDescription
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem debugDescription](self, "debugDescription"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem _descriptionFullyRedacted:](self, "_descriptionFullyRedacted:", 1));
  return (NSString *)v5;
}

- (id)_descriptionFullyRedacted:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSString *v14;
  void *v15;

  v3 = a3;
  v5 = -[FavoriteItem _displayNameShouldBeRedacted](self, "_displayNameShouldBeRedacted");
  v6 = (unint64_t)-[FavoriteItem type](self, "type") - 1;
  if (v6 > 6)
  {
    v7 = 0;
    if ((v5 & 1) != 0)
    {
LABEL_6:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem displayName](self, "displayName"));
      if (v3)
        v10 = objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v9));
      else
        v10 = objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v9));
      v11 = (void *)v10;

      v8 = v11;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = off_10051C8D0[v6];
    if ((v5 & 1) != 0)
      goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem displayName](self, "displayName"));
  if (!v8)
    goto LABEL_6;
LABEL_10:
  v12 = &stru_100531B00;
  if ((objc_opt_respondsToSelector(self, "unreadCountToken") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem unreadCountToken](self, "unreadCountToken"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unreadCountToken:%@"), v13));

  }
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; type = %@; visible:%d selected:%d expanded:%d displayName:%@ %@>"),
          objc_opt_class(self),
          self,
          v7,
          -[FavoriteItem isVisible](self, "isVisible"),
          -[FavoriteItem isSelected](self, "isSelected"),
          -[FavoriteItem isExpanded](self, "isExpanded"),
          v8,
          v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (id)syncKey
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsKey, 0);
  objc_storeStrong((id *)&self->_subItems, 0);
  objc_storeStrong((id *)&self->_scrollableHint, 0);
  objc_storeStrong((id *)&self->_badgeCount, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_itemUUID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_syncKey, 0);
}

+ (id)itemForSharedMailboxWithType:(unint64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  FavoriteItem_SharedMailbox *v5;

  v4 = a4;
  v5 = -[FavoriteItem_SharedMailbox initWithSourceType:]([FavoriteItem_SharedMailbox alloc], "initWithSourceType:", a3);
  -[FavoriteItem setSelected:](v5, "setSelected:", v4);
  return v5;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (!-[FavoriteItem isExpandable](self, "isExpandable") && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100391834();
    LOBYTE(v3) = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  self->_expanded = v3;
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isExpandable
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem representingMailbox](self, "representingMailbox"));
  if (objc_msgSend(v2, "hasChildren"))
    v3 = _os_feature_enabled_impl("Mail", "CollapsibleMailboxes");
  else
    v3 = 0;

  return v3;
}

- (NSArray)subItems
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)wasAddedToCollection:(id)a3
{
  NSString *v4;
  NSString *collectionID;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  collectionID = self->_collectionID;
  self->_collectionID = v4;

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  if (!_MSSourceTypeIsValid(-[FavoriteItem sourceType](self, "sourceType")))
  {
    v3 = 0;
    return v3;
  }
  if ((unint64_t)(self->_type - 1) >= 6)
    sub_10039180C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_type));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  v5 = NSStringFromBOOL(-[FavoriteItem isSelected](self, "isSelected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("selected"));

  v7 = NSStringFromBOOL(-[FavoriteItem isExpanded](self, "isExpanded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("expanded"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem scrollableHint](self, "scrollableHint"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v9, CFSTR("scrollableHint"));

  if (!-[FavoriteItem shouldSync](self, "shouldSync"))
  {
    v10 = NSStringFromBOOL(-[FavoriteItem shouldSync](self, "shouldSync"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("shouldSync"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
  if (!objc_msgSend(v12, "isInternal"))
    goto LABEL_8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem displayName](self, "displayName"));

  if (v13)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem displayName](self, "displayName"));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("displayName"));
LABEL_8:

  }
  return v3;
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isExpanded
{
  FavoriteItem *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_expanded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDictionary)scrollableHint
{
  return self->_scrollableHint;
}

- (unint64_t)sourceType
{
  return 0;
}

+ (id)itemFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type")));
  v5 = v4;
  if (!v4)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = (char *)objc_msgSend(v4, "integerValue");
  if ((unint64_t)(v6 - 7) <= 0xFFFFFFFFFFFFFFF9)
    __assert_rtn("+[FavoriteItem itemFromDictionary:]", "FavoriteItem.m", 174, "type > 0 && type < FavoriteItemTypeMaxValue");
  if ((unint64_t)(v6 - 1) >= 6)
  {
    v8 = MFLogGeneral(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Warning unsupported type", v11, 2u);
    }

    goto LABEL_8;
  }
  v7 = objc_msgSend(objc_alloc(*off_10051C8A0[(_QWORD)(v6 - 1)]), "initWithDictionary:", v3);
LABEL_9:

  return v7;
}

- (FavoriteItem)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FavoriteItem;
  v5 = -[FavoriteItem init](&v15, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
    v5->_type = (int64_t)objc_msgSend(v6, "integerValue");

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_showUnreadCount = 1;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("selected")));
    v8 = (void *)v7;
    if (v7)
      -[FavoriteItem setSelected:](v5, "setSelected:", NSBOOLFromString(v7));
    else
      -[FavoriteItem setSelected:](v5, "setSelected:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("shouldSync")));

    if (v9)
      v10 = NSBOOLFromString(v9);
    else
      v10 = objc_msgSend((id)objc_opt_class(v5), "_defaultShouldSync");
    v5->_shouldSync = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("expanded")));

    if (v11)
      v12 = NSBOOLFromString(v11);
    else
      v12 = objc_msgSend((id)objc_opt_class(v5), "_defaultShouldExpand");
    v5->_expanded = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("scrollableHint")));

    if (v13)
      -[FavoriteItem setScrollableHint:](v5, "setScrollableHint:", v13);
    else
      -[FavoriteItem setScrollableHint:](v5, "setScrollableHint:", 0);

  }
  return v5;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void)setScrollableHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

+ (id)itemForMailbox:(id)a3 selected:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemForMailbox:selected:shouldSync:", a3, a4, 1));
}

+ (id)itemForMailbox:(id)a3 selected:(BOOL)a4 shouldSync:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  FavoriteItem_Mailbox *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[FavoriteItem_Mailbox initWithMailbox:]([FavoriteItem_Mailbox alloc], "initWithMailbox:", v7);
  -[FavoriteItem setSelected:](v8, "setSelected:", v6);
  -[FavoriteItem setShouldSync:](v8, "setShouldSync:", v5);

  return v8;
}

- (FavoriteItem)initWithType:(int64_t)a3
{
  FavoriteItem *v4;
  FavoriteItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem;
  v4 = -[FavoriteItem init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_shouldSync = objc_msgSend((id)objc_opt_class(v4), "_defaultShouldSync");
    v5->_showUnreadCount = 1;
  }
  return v5;
}

- (void)setShouldSync:(BOOL)a3
{
  self->_shouldSync = a3;
}

+ (BOOL)_defaultShouldSync
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setSubItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setShowUnreadCount:(BOOL)a3
{
  self->_showUnreadCount = a3;
}

- (id)representingMailbox
{
  return 0;
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 1;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C6D0;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B60 != -1)
    dispatch_once(&qword_1005A9B60, block);
  return (OS_os_log *)(id)qword_1005A9B58;
}

+ (id)itemForUnifiedMailboxWithType:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  FavoriteItem_UnifiedMailbox *v5;

  v4 = a4;
  v5 = -[FavoriteItem_UnifiedMailbox initWithMailboxType:]([FavoriteItem_UnifiedMailbox alloc], "initWithMailboxType:", a3);
  -[FavoriteItem setSelected:](v5, "setSelected:", v4);
  return v5;
}

+ (id)itemForInboxWithAccount:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  FavoriteItem_Inbox *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[FavoriteItem_Inbox initWithAccount:]([FavoriteItem_Inbox alloc], "initWithAccount:", v5);
  -[FavoriteItem setSelected:](v6, "setSelected:", v4);

  return v6;
}

+ (id)itemForAccount:(id)a3
{
  id v3;
  FavoriteItem_Account *v4;

  v3 = a3;
  v4 = -[FavoriteItem_Account initWithAccount:]([FavoriteItem_Account alloc], "initWithAccount:", v3);

  return v4;
}

- (BOOL)isMovable
{
  return 1;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)wantsDisclosureButton
{
  return 0;
}

- (int64_t)_defaultCellAccessoryType
{
  return 1;
}

- (id)defaultIconBlock
{
  id v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100097764;
  v5[3] = &unk_10051C7D0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FavoriteItem representingMailbox](self, "representingMailbox"));
  v2 = v6;
  v3 = objc_retainBlock(v5);

  return v3;
}

- (id)iconTintColor
{
  return 0;
}

- (id)selectedIconTintColor
{
  return +[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor");
}

- (CGPoint)iconOffset
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)applicationShortcutIcon
{
  return +[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", MFImageGlyphGenericMailbox);
}

- (void)configureOutlineCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if ((id)-[FavoriteItem _defaultCellAccessoryType](self, "_defaultCellAccessoryType") == (id)1)
    objc_msgSend(v4, "setDisclosureType:", 0);
  objc_msgSend(v4, "setIndentationLevel:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem defaultIconBlock](self, "defaultIconBlock"));
  v6 = v5;
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100097978;
    v9[3] = &unk_10051C7F8;
    v10 = v5;
    objc_msgSend(v4, "setCreateIconBlock:", v9);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem iconTintColor](self, "iconTintColor"));
  objc_msgSend(v4, "setIconTintColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem selectedIconTintColor](self, "selectedIconTintColor"));
  objc_msgSend(v4, "setSelectedIconTintColor:", v8);

  objc_msgSend(v4, "setShowFocusIcon:", 0);
}

- (id)smartMailbox
{
  return 0;
}

+ (id)itemForVIP:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  FavoriteItem_VIPMailbox *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[FavoriteItem_VIPMailbox initWithVIP:]([FavoriteItem_VIPMailbox alloc], "initWithVIP:", v5);
  -[FavoriteItem setSelected:](v6, "setSelected:", v4);

  return v6;
}

+ (id)itemForOutbox
{
  return objc_alloc_init(SharedItem_Outbox);
}

+ (BOOL)_defaultShouldExpand
{
  return 1;
}

- (id)dictionaryRepresentationRemovingSyncKeys
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = NSStringFromBOOL(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("shouldSync"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("syncKey"));
  return v3;
}

- (NSString)itemID
{
  NSString *itemID;
  const __CFString *collectionID;
  void *v5;
  NSString *v6;
  NSString *v7;

  itemID = self->_itemID;
  if (!itemID)
  {
    if (self->_collectionID)
      collectionID = (const __CFString *)self->_collectionID;
    else
      collectionID = &stru_100531B00;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem itemUUID](self, "itemUUID"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), collectionID, v5));
    v7 = self->_itemID;
    self->_itemID = v6;

    itemID = self->_itemID;
  }
  return itemID;
}

- (NSString)itemUUID
{
  NSString *itemUUID;
  NSString *v4;
  NSString *v5;

  itemUUID = self->_itemUUID;
  if (!itemUUID)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString ef_UUID](NSString, "ef_UUID"));
    v5 = self->_itemUUID;
    self->_itemUUID = v4;

    itemUUID = self->_itemUUID;
  }
  return itemUUID;
}

- (NSString)itemURLString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem representingMailbox](self, "representingMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLString"));

  return (NSString *)v3;
}

- (NSString)parentItemID
{
  return 0;
}

- (id)displayName
{
  -[FavoriteItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[FavoriteItem displayName]", "FavoriteItem.m", 263, "0");
}

- (id)badgeCountString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Message")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNREAD_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem badgeCount](self, "badgeCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, objc_msgSend(v5, "integerValue")));

  return v6;
}

- (id)countQueryPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem representingMailboxes](self, "representingMailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_mapSelector:", "objectID"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxesWithObjectIDs:](EMMessageListItemPredicates, "predicateForMessagesInMailboxesWithObjectIDs:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
  v9[0] = v4;
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

- (id)serverCountMailboxScope
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem representingMailboxes](self, "representingMailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_mapSelector:", "objectID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailboxScope mailboxScopeForMailboxObjectIDs:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxObjectIDs:forExclusion:", v3, 0));

  return v4;
}

- (NSPredicate)additionalPredicate
{
  return 0;
}

- (id)account
{
  return 0;
}

- (id)representingMailboxes
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(-[FavoriteItem representingMailbox](self, "representingMailbox"));
  v3 = (void *)v2;
  if (v2)
  {
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isVisible
{
  return 1;
}

- (id)syncValue
{
  return 0;
}

- (void)wasRemovedFromCollecion:(id)a3
{
  NSString *collectionID;

  collectionID = self->_collectionID;
  self->_collectionID = 0;

}

- (id)persistentIDForMigration
{
  return 0;
}

- (BOOL)acceptsMessageTransfers
{
  return 0;
}

- (BOOL)isExpandableInEditMode
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[FavoriteItem _descriptionFullyRedacted:](self, "_descriptionFullyRedacted:", 0);
}

- (MFMessageCriterion)criterion
{
  return (MFMessageCriterion *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)badgeCount
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBadgeCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)showUnreadCount
{
  return self->_showUnreadCount;
}

- (NSString)analyticsKey
{
  return self->_analyticsKey;
}

@end
