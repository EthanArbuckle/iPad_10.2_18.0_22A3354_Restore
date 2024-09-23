@implementation MessageViewStatusIndicatorManager

- (void)updateImageViews
{
  unint64_t v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  NSMutableArray *v8;
  NSMutableArray *statusIndicatorImageViews;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = -[MessageStatusIndicatorManager effectiveIndicatorOptions](self, "effectiveIndicatorOptions");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_statusIndicatorImageViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "setHidden:", 1, (_QWORD)v17);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  if (v3)
  {
    if (!self->_statusIndicatorImageViews)
    {
      v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      statusIndicatorImageViews = self->_statusIndicatorImageViews;
      self->_statusIndicatorImageViews = v8;

    }
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = qword_100033118[v10];
      if ((v12 & v3) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageStatusIndicatorManager statusIndicatorColorWithOptionsMask:](self, "statusIndicatorColorWithOptionsMask:", qword_100033118[v10]));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageStatusIndicatorManager statusIndicatorImageWithOptionsMask:](self, "statusIndicatorImageWithOptionsMask:", v12));
        if (v11 >= (unint64_t)-[NSMutableArray count](self->_statusIndicatorImageViews, "count"))
        {
          v15 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
          -[NSMutableArray addObject:](self->_statusIndicatorImageViews, "addObject:");
        }
        else
        {
          v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_statusIndicatorImageViews, "objectAtIndex:", v11));
        }
        objc_msgSend(v15, "setHidden:", 0, (_QWORD)v17);
        objc_msgSend(v15, "setImage:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageViewStatusIndicatorManager _accessibilityIdentifierForIndicatorOptions:](self, "_accessibilityIdentifierForIndicatorOptions:", v12));
        objc_msgSend(v15, "setAccessibilityIdentifier:", v16);

        objc_msgSend(v15, "sizeToFit");
        objc_msgSend(v15, "setTintColor:", v13);
        objc_msgSend(v15, "setTintAdjustmentMode:", 1);

        ++v11;
      }
      ++v10;
    }
    while (v10 != 8);
    self->_statusIndicatorImageViewsSize = v11;
  }
}

- (NSArray)statusIndicatorImageViews
{
  return (NSArray *)-[NSMutableArray subarrayWithRange:](self->_statusIndicatorImageViews, "subarrayWithRange:", 0, self->_statusIndicatorImageViewsSize);
}

- (id)_accessibilityIdentifierForIndicatorOptions:(unint64_t)a3
{
  id *v3;

  if ((a3 & 1) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewUnread;
  }
  else if ((a3 & 2) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewVIP;
  }
  else if ((a3 & 4) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewFlagged;
  }
  else if ((a3 & 8) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewReplied;
  }
  else if ((a3 & 0x10) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewForwarded;
  }
  else if ((a3 & 0x20) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewAttachment;
  }
  else if ((a3 & 0x40) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewNotify;
  }
  else if ((a3 & 0x100) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewBlockedSender;
  }
  else if ((a3 & 7) != 0)
  {
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewUnreadVIPFlagged;
  }
  else
  {
    if ((a3 & 0x18) == 0)
      return 0;
    v3 = (id *)&MSAccessibilityIdentifierMailMessageViewRepliedForwarded;
  }
  return *v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorImageViews, 0);
}

@end
