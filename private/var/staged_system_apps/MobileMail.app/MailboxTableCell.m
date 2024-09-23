@implementation MailboxTableCell

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8284;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9CA8 != -1)
    dispatch_once(&qword_1005A9CA8, block);
  return (id)qword_1005A9CA0;
}

+ (void)invalidateCachedLayoutInformation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)qword_1005A9CB0;
  qword_1005A9CB0 = 0;

  v4 = (void *)qword_1005A9CB8;
  qword_1005A9CB8 = 0;

  qword_1005A9CC0 = 0;
  qword_1005A9CC8 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("_MailboxTableCellLayoutValuesDidChange"), a1);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", a1, UIContentSizeCategoryDidChangeNotification, 0);

}

+ (double)defaultRowHeight
{
  double result;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  __n128 v11;
  __n128 v12;
  void *v13;

  result = *(double *)&qword_1005A9CC0;
  if (*(double *)&qword_1005A9CC0 == 0.0)
  {
    objc_msgSend(a1, "twoLineTopBottomPadding", *(double *)&qword_1005A9CC0);
    *(double *)&qword_1005A9CC0 = v4 + v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleFont"));
    objc_msgSend(v5, "capHeight");
    *(double *)&qword_1005A9CC0 = v6 + *(double *)&qword_1005A9CC0;

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subtitleFont"));
    objc_msgSend(v7, "capHeight");
    *(double *)&qword_1005A9CC0 = v8 + *(double *)&qword_1005A9CC0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subtitleFont"));
    objc_msgSend(v9, "_bodyLeading");
    v11.n128_f64[0] = v10 * 7.0 * 0.0625;
    *(double *)&qword_1005A9CC0 = UIRoundToViewScale(0, v11) + *(double *)&qword_1005A9CC0;

    v12.n128_u64[0] = qword_1005A9CC0;
    qword_1005A9CC0 = UIRoundToViewScale(0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", a1, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    return *(double *)&qword_1005A9CC0;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "sizeThatFits:", width, height);
    v9 = v8;
    v10 = sub_1001D6F48(*(unsigned int *)((char *)&self->_detailsDisclosureButton + 1));
    v15.receiver = self;
    v15.super_class = (Class)MailboxTableCell;
    -[MailboxTableCell sizeThatFits:](&v15, "sizeThatFits:", width - (v9 + v10), height);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MailboxTableCell;
    -[MailboxTableCell sizeThatFits:](&v14, "sizeThatFits:", width, height);
    width = v12;
  }
  v13 = width;
  result.height = v11;
  result.width = v13;
  return result;
}

+ (double)twoLineTopBottomPadding
{
  double v2;
  void *v3;
  double v4;
  __n128 v5;

  v2 = *(double *)&qword_1005A9CC8;
  if (*(double *)&qword_1005A9CC8 == 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subtitleFont"));
    objc_msgSend(v3, "_bodyLeading");
    v5.n128_f64[0] = v4 * 0.5;
    v2 = UIRoundToViewScale(0, v5);

    qword_1005A9CC8 = *(_QWORD *)&v2;
  }
  return v2;
}

+ (id)titleFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)qword_1005A9CB0;
  if (!qword_1005A9CB0)
  {
    if (+[UIScreen mui_isLargeFormatPad](UIScreen, "mui_isLargeFormatPad"))
      v3 = 0;
    else
      v3 = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0x8000, v3));
    v5 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));
    v6 = (void *)qword_1005A9CB0;
    qword_1005A9CB0 = v5;

    v2 = (void *)qword_1005A9CB0;
  }
  return v2;
}

+ (id)subtitleFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)qword_1005A9CB8;
  if (!qword_1005A9CB8)
  {
    if (+[UIScreen mui_isLargeFormatPad](UIScreen, "mui_isLargeFormatPad"))
      v3 = 0;
    else
      v3 = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0x8000, v3));
    v5 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));
    v6 = (void *)qword_1005A9CB8;
    qword_1005A9CB8 = v5;

    v2 = (void *)qword_1005A9CB8;
  }
  return v2;
}

- (MailboxTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  MailboxTableCell *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MailboxTableCell;
  v7 = -[MailboxTableCell initWithStyle:reuseIdentifier:](&v20, "initWithStyle:reuseIdentifier:", a3, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "_invalidateLayout", CFSTR("_MailboxTableCellLayoutValuesDidChange"), objc_opt_class(v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](v7, "textLabel"));
    v10 = objc_msgSend((id)objc_opt_class(v7), "titleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](v7, "detailTextLabel"));
    v13 = objc_msgSend((id)objc_opt_class(v7), "subtitleFont");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "setFont:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell imageView](v7, "imageView"));
    objc_msgSend(v15, "setContentMode:", 4);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, "_preferredContentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    -[MailboxTableCell _updateContentSizeSettings](v7, "_updateContentSizeSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](v7, "traitCollection"));
    LOBYTE(v14) = objc_msgSend(v17, "mf_useSplitViewStyling");

    if ((v14 & 1) == 0)
    {
      v18 = objc_alloc_init((Class)UIView);
      -[MailboxTableCell setSelectedBackgroundView:](v7, "setSelectedBackgroundView:", v18);

    }
    -[MailboxTableCell _resetDebouncer](v7, "_resetDebouncer");
  }

  return v7;
}

- (void)_resetDebouncer
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  EFCancelable *v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v4 = *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
  if (v4)
  {
    objc_msgSend(v4, "cancel");
    v5 = *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
    *(EFCancelable **)((char *)&self->_unreadCountToken + 1) = 0;

  }
  if (-[MailboxTableCell shouldShowUnreadCount](self, "shouldShowUnreadCount"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v6 = objc_alloc((Class)EFDebouncer);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000D8AEC;
    v10[3] = &unk_10051DA80;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    v8 = (EFCancelable *)objc_msgSend(v6, "initWithTimeInterval:scheduler:startAfter:block:", v7, 1, v10, 0.2);
    v9 = *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
    *(EFCancelable **)((char *)&self->_unreadCountToken + 1) = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;
  void *v7;
  id v8;
  void *v9;

  -[MailboxTableCell _updateContentSizeSettings](self, "_updateContentSizeSettings", a3);
  if (objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "anyObject"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    if (IsAccessibilityCategory)
    {
      v7 = 0;
    }
    else
    {
      v8 = sub_1001D6E84();
      v5 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconFromBundle:", v5));
    }
    -[MailboxTableCell setIcon:](self, "setIcon:", v7);
    if (!IsAccessibilityCategory)
    {

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MailboxTableCell titleFont](MailboxTableCell, "titleFont"));
  objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setFont:", v9);

  -[MailboxTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateContentSizeSettings
{
  _BOOL4 IsAccessibilityCategory;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSString *v7;
  id v8;
  NSString *v9;
  id v10;

  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory)
    v4 = 2;
  else
    v4 = 1;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
  objc_msgSend(v8, "setNumberOfLines:", v4);

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  v5 = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v10, "setNumberOfLines:", v6);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(*(id *)((char *)&self->_expansionEditingAccessoryImageView + 1), "cancel");
  objc_msgSend(*(id *)((char *)&self->_unreadCountToken + 1), "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell dealloc](&v4, "dealloc");
}

- (void)setMailboxes:(id)a3 observeCount:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v6 = *(void **)(&self->super._shouldDisableWhileEditing + 1);
  *(_QWORD *)(&self->super._shouldDisableWhileEditing + 1) = 0;
  v7 = a3;

  -[MailboxTableCell _setMailboxes:observeCount:unreadCountIncludesRead:](self, "_setMailboxes:observeCount:unreadCountIncludesRead:", v7, v4, 0);
}

- (void)_setMailboxes:(id)a3 observeCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  NSSet *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  v8 = (NSSet *)objc_msgSend(v11, "copy");
  v9 = *(NSSet **)((char *)&self->_legacyMailboxes + 1);
  *(NSSet **)((char *)&self->_legacyMailboxes + 1) = v8;

  -[MailboxTableCell setShouldShowUnreadCount:](self, "setShouldShowUnreadCount:", 1);
  if (v6)
  {
    if (objc_msgSend(*(id *)((char *)&self->_legacyMailboxes + 1), "count"))
      v10 = v11;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  -[MailboxTableCell _setUnreadCountMailboxes:unreadCountIncludesRead:](self, "_setUnreadCountMailboxes:unreadCountIncludesRead:", v10, v5);

}

- (void)_setUnreadCountMailboxes:(id)a3 unreadCountIncludesRead:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell unreadCountToken](self, "unreadCountToken"));
  objc_msgSend(v7, "cancel");

  -[MailboxTableCell setUnreadCountToken:](self, "setUnreadCountToken:", 0);
  if (v6 && objc_msgSend(v6, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", *(NSSet **)((char *)&self->_legacyMailboxes + 1)));
    if (v4)
    {
      v8 = v20;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
      v22[0] = v20;
      v22[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject", v20));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell _countQueryLabelForMailbox:](self, "_countQueryLabelForMailbox:", v11));

    v13 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(EMMessage), v8, &__NSArray0__struct, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_mapSelector:", "objectID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailboxScope mailboxScopeForMailboxObjectIDs:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxObjectIDs:forExclusion:", v14, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "daemonInterface"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "messageRepository"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startCountingQuery:includingServerCountsForMailboxScope:withObserver:", v13, v15, self));
    -[MailboxTableCell setUnreadCountToken:](self, "setUnreadCountToken:", v19);

  }
  -[MailboxTableCell _resetDebouncer](self, "_resetDebouncer");

}

- (id)_countQueryLabelForMailbox:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  if ((objc_msgSend(v3, "descriptionUsesRealName") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyOrPartiallyRedactedStringForString:](EFPrivacy, "fullyOrPartiallyRedactedStringForString:", v4));

    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Generic mailbox %@"), v5);
    v4 = v6;
  }
  v7 = objc_alloc((Class)NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountIdentifier"));
  v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@ (accountID: %@)"), v4, v8);

  return v9;
}

- (void)setLegacyMailboxes:(id)a3
{
  -[MailboxTableCell setLegacyMailboxes:showUnreadCount:](self, "setLegacyMailboxes:showUnreadCount:", a3, 0);
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4
{
  -[MailboxTableCell setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:](self, "setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:", a3, a4, 0);
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  id *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t v25[24];

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v10 = (id *)(&self->super._shouldDisableWhileEditing + 1);
  if ((objc_msgSend(v9, "isEqualToSet:", *(_QWORD *)(&self->super._shouldDisableWhileEditing + 1)) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = MFMailboxUidWasRenamedNotification;
    objc_msgSend(v11, "removeObserver:name:object:", self, MFMailboxUidWasRenamedNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell unreadCountToken](self, "unreadCountToken"));
    objc_msgSend(v13, "cancel");

    -[MailboxTableCell setUnreadCountToken:](self, "setUnreadCountToken:", 0);
    objc_storeStrong((id *)(&self->super._shouldDisableWhileEditing + 1), a3);
    -[MailboxTableCell setShouldShowUnreadCount:](self, "setShouldShowUnreadCount:", v6);
    if (objc_msgSend(*v10, "count") == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v10, "anyObject"));
      v15 = sub_1001D6E84();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "iconFromBundle:", v16));
      -[MailboxTableCell setIcon:](self, "setIcon:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
      *(_DWORD *)((char *)&self->_detailsDisclosureButton + 1) = objc_msgSend(v18, "levelForMailbox:", v14);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "addObserver:selector:name:object:", self, "_updateMailboxName", v12, v14);

    }
    -[MailboxTableCell _removeUnreadCount](self, "_removeUnreadCount");
    if (-[MailboxTableCell shouldShowUnreadCount](self, "shouldShowUnreadCount") && *v10)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell _createMailboxesFromUids:](self, "_createMailboxesFromUids:", v20));

      if (!objc_msgSend(v21, "count"))
      {
        v22 = objc_claimAutoreleasedReturnValue(+[MailboxTableCell log](MailboxTableCell, "log"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mailboxProvider"));
          sub_100391EE0(v24, v25, v22, v23);
        }

      }
      -[MailboxTableCell _setMailboxes:observeCount:unreadCountIncludesRead:](self, "_setMailboxes:observeCount:unreadCountIncludesRead:", v21, 1, v5);

    }
    else
    {
      -[MailboxTableCell _resetDebouncer](self, "_resetDebouncer");
    }
  }
  -[MailboxTableCell _updateMailboxName](self, "_updateMailboxName");
  -[MailboxTableCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)_createMailboxesFromUids:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxProvider"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D97FC;
  v9[3] = &unk_10051DAA8;
  v10 = v5;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_compactMap:", v9));

  return v7;
}

- (BOOL)_shouldUnreadCountBeVisible
{
  unsigned int v3;

  if (-[MailboxTableCell isEditing](self, "isEditing"))
    v3 = !-[MailboxTableCell hideUnreadCountForEditing](self, "hideUnreadCountForEditing");
  else
    v3 = 1;
  if (-[MailboxTableCell isExpandable](self, "isExpandable"))
    v3 &= ~-[MailboxTableCell isExpanded](self, "isExpanded");
  return v3;
}

- (void)_updateUnreadCountLabelVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id (*v10)(uint64_t);
  void ***v11;
  double v12;
  void ***v13;
  void ***v14;
  void **v15;
  void **v16;

  if (*(_QWORD *)((char *)&self->_iconOffset.y + 1))
  {
    v3 = a3;
    v5 = -[MailboxTableCell _shouldUnreadCountBeVisible](self, "_shouldUnreadCountBeVisible");
    v6 = *(void **)((char *)&self->_iconOffset.y + 1);
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

      if (!v7)
      {
        objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setAlpha:", 0.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
        objc_msgSend(v8, "addSubview:", *(_QWORD *)((char *)&self->_iconOffset.y + 1));

      }
      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "alpha");
      if (v9 != 1.0)
      {
        v16 = _NSConcreteStackBlock;
        v10 = sub_1000D99F4;
        v11 = &v16;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v6, "alpha");
      if (v12 != 0.0)
      {
        v15 = _NSConcreteStackBlock;
        v10 = sub_1000D9A0C;
        v11 = &v15;
LABEL_9:
        v11[1] = (void **)3221225472;
        v11[2] = (void **)v10;
        v11[3] = (void **)&unk_10051AA98;
        v11[4] = (void **)&self->super.super.super.super.super.isa;
        v13 = objc_retainBlock(v11);
        v14 = v13;
        if (v13)
        {
          if (v3)
          {
            +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, 0);
          }
          else
          {
            ((void (*)(void ***))v13[2])(v13);
          }
        }
        goto LABEL_14;
      }
    }
    v14 = 0;
LABEL_14:

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[5];
  BOOL v15;
  BOOL v16;
  objc_super v17;

  v4 = a4;
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell setEditing:animated:](&v17, "setEditing:animated:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "mf_useSplitViewStyling");

  if ((v8 & 1) == 0)
  {
    if (v5)
    {
      if ((BYTE5(self->_detailsDisclosureButton) & 2) != 0)
        v9 = 0;
      else
        v9 = 3;
      -[MailboxTableCell setSelectionStyle:](self, "setSelectionStyle:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell selectedBackgroundView](self, "selectedBackgroundView"));
      objc_msgSend(v11, "setBackgroundColor:", v10);
    }
    else
    {
      -[MailboxTableCell setSelectionStyle:](self, "setSelectionStyle:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailCellSelectionStateColorForInterfaceLevel:](UIColor, "mailCellSelectionStateColorForInterfaceLevel:", objc_msgSend(v10, "userInterfaceLevel")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell selectedBackgroundView](self, "selectedBackgroundView"));
      objc_msgSend(v12, "setBackgroundColor:", v11);

    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D9BFC;
  v14[3] = &unk_10051E220;
  v15 = v5;
  v16 = v4;
  v14[4] = self;
  v13 = objc_retainBlock(v14);
  -[MailboxTableCell _updateUnreadCountLabelVisibilityAnimated:](self, "_updateUnreadCountLabelVisibilityAnimated:", v4);
  ((void (*)(_QWORD *, _QWORD))v13[2])(v13, *(UILabel **)((char *)&self->_unreadCountLabel + 1));

}

- (void)setDisabledForEditing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  BYTE5(self->_detailsDisclosureButton) = BYTE5(self->_detailsDisclosureButton) & 0xFD | v3;
}

- (BOOL)isCellEnabled
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  if (-[MailboxTableCell isEditing](self, "isEditing"))
    return (BYTE5(self->_detailsDisclosureButton) & 2) == 0;
  if ((BYTE5(self->_detailsDisclosureButton) & 1) != 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "anyObject"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "anyObject"));
    v3 = objc_msgSend(v5, "isStore");

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)setIcon:(id)a3
{
  -[MailboxTableCell setIcon:withOffset:](self, "setIcon:withOffset:", a3, CGPointZero.x, CGPointZero.y);
}

- (void)setIcon:(id)a3 withOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  id v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell imageView](self, "imageView"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory)
    v10 = 0;
  else
    v10 = v11;
  objc_msgSend(v7, "setImage:", v10);

  -[MailboxTableCell setIconOffset:](self, "setIconOffset:", x, y);
}

- (void)setIconOffset:(CGPoint)a3
{
  *(NSArray **)((char *)&self->_mailboxes + 1) = *(NSArray **)&a3.x;
  *(CGFloat *)((char *)&self->_iconOffset.x + 1) = a3.y;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
  objc_msgSend(v4, "setText:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MailboxTableCell titleFont](MailboxTableCell, "titleFont"));
  objc_msgSend(v5, "setFont:", v6);

  -[MailboxTableCell setSubtitle:](self, "setSubtitle:", 0);
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell preferredSubtitleFont](self, "preferredSubtitleFont"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[MailboxTableCell subtitleFont](MailboxTableCell, "subtitleFont"));
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v8, "setText:", v12);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v9, "setTextColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v11, "setFont:", v7);

  -[MailboxTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDetailsDisclosureButton:(id)a3
{
  id v5;
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (UILabel **)((char *)&self->_unreadCountLabel + 1);
  v7 = *(UILabel **)((char *)&self->_unreadCountLabel + 1);
  v10 = v5;
  if (v7 != v5)
  {
    if (v7)
    {
      objc_msgSend(v7, "removeFromSuperview");
      v8 = (void *)*v6;
      *v6 = 0;

    }
    if (v10)
    {
      objc_storeStrong((id *)((char *)&self->_unreadCountLabel + 1), a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
      objc_msgSend(v9, "addSubview:", *v6);

    }
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:");
  -[MailboxTableCell setCellEnabled:](self, "setCellEnabled:", v3);
}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  BYTE5(self->_detailsDisclosureButton) = BYTE5(self->_detailsDisclosureButton) & 0xFE | !a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "mf_useSplitViewStyling");

  if ((v6 & 1) == 0)
  {
    if (v3)
      v7 = 3;
    else
      v7 = 0;
    -[MailboxTableCell setSelectionStyle:](self, "setSelectionStyle:", v7);
  }
  if (v3)
    v8 = 1;
  else
    v8 = 2;
  -[MailboxTableCell setTintAdjustmentMode:](self, "setTintAdjustmentMode:", v8);
}

- (void)setPreferredSubtitleFont:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(*(id *)((char *)&self->_extraIndentLevel + 1), "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)((char *)&self->_extraIndentLevel + 1), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v5, "setFont:", v6);

  }
}

- (void)_removeUnreadCount
{
  void *v3;
  void *v4;

  v3 = *(void **)((char *)&self->_iconOffset.y + 1);
  if (v3)
  {
    objc_msgSend(v3, "removeFromSuperview");
    v4 = *(void **)((char *)&self->_iconOffset.y + 1);
    *(CGFloat *)((char *)&self->_iconOffset.y + 1) = 0.0;

  }
}

- (void)_setUnreadCount:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    if (!*(_QWORD *)((char *)&self->_iconOffset.y + 1))
    {
      v5 = objc_alloc_init((Class)UILabel);
      v6 = *(void **)((char *)&self->_iconOffset.y + 1);
      *(_QWORD *)((char *)&self->_iconOffset.y + 1) = v5;

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setBackgroundColor:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setTextColor:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MailboxTableCell titleFont](MailboxTableCell, "titleFont"));
      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setFont:", v9);

      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setTextAlignment:", 2);
      -[MailboxTableCell _updateUnreadCountLabelVisibilityAnimated:](self, "_updateUnreadCountLabelVisibilityAnimated:", 0);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatUnsignedInteger:withGrouping:](NSNumberFormatter, "ef_formatUnsignedInteger:withGrouping:", a3, 0));
    objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setText:", v10);

    -[MailboxTableCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[MailboxTableCell _removeUnreadCount](self, "_removeUnreadCount");
  }
}

- (void)_updateMailboxName
{
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "count") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "anyObject"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayNameUsingSpecialNamesForMailbox:", v4));

    -[MailboxTableCell setTitle:](self, "setTitle:", v5);
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell setHighlighted:animated:](&v11, "setHighlighted:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "mf_useSplitViewStyling");

  if ((v7 & 1) == 0 && (-[MailboxTableCell isEditing](self, "isEditing") & 1) == 0)
  {
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _tertiaryFillColor](UIColor, "_tertiaryFillColor"));
      v9 = v8;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailCellSelectionStateColorForInterfaceLevel:](UIColor, "mailCellSelectionStateColorForInterfaceLevel:", objc_msgSend(v9, "userInterfaceLevel")));
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell selectedBackgroundView](self, "selectedBackgroundView"));
    objc_msgSend(v10, "setBackgroundColor:", v8);

    if (!v4)
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailboxTableCell;
  -[MFTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[MailboxTableCell setExpandable:](self, "setExpandable:", 0);
  -[MailboxTableCell setExpanded:](self, "setExpanded:", 0);
  -[MailboxTableCell setForceZeroSeparatorInset:](self, "setForceZeroSeparatorInset:", 0);
  -[MailboxTableCell setExtraIndentLevel:](self, "setExtraIndentLevel:", 0);
  -[MailboxTableCell setFlattenHierarchy:](self, "setFlattenHierarchy:", 0);
  -[MailboxTableCell _doCleanupExpansionAccessoryViews](self, "_doCleanupExpansionAccessoryViews");
  -[MailboxTableCell setCellEnabled:](self, "setCellEnabled:", 1);
  -[MailboxTableCell setDisabledForEditing:](self, "setDisabledForEditing:", 0);
  -[MailboxTableCell setTitleColor:](self, "setTitleColor:", 0);
  -[MailboxTableCell setDetailsDisclosureButton:](self, "setDetailsDisclosureButton:", 0);
  -[MailboxTableCell setSubtitle:](self, "setSubtitle:", 0);
}

- (id)_multiselectBackgroundColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (void)_updateViewConfigurationsWithState:(unint64_t)a3
{
  unsigned __int8 v5;
  void *v6;
  id v7;
  id v8;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v7, "mf_useSplitViewStyling");

  if ((v5 & 1) != 0)
  {
    if (-[MailboxTableCell isExpandable](self, "isExpandable"))
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackgroundViewConfiguration defaultOutlineParentCellConfigurationForState:](_UIBackgroundViewConfiguration, "defaultOutlineParentCellConfigurationForState:", a3));
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackgroundViewConfiguration defaultOutlineCellConfigurationForState:](_UIBackgroundViewConfiguration, "defaultOutlineCellConfigurationForState:", a3));
    v8 = v6;
    objc_msgSend(v6, "setEdgesAddingLayoutMarginsToBackgroundInsets:", 10);
    objc_msgSend(v8, "setBackgroundInsets:", 0.0, -8.0, 0.0, -8.0);
    -[MailboxTableCell _setBackgroundViewConfiguration:](self, "_setBackgroundViewConfiguration:", v8);

  }
}

- (id)_expansionAccessoryImageView
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphFavoriteExpandMailbox));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_symbolConfigurationForView:](UIImage, "mf_symbolConfigurationForView:", 9));
  objc_msgSend(v2, "size");
  v6 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v4 + -6.0, v5);
  objc_msgSend(v6, "setImage:", v2);
  objc_msgSend(v6, "setPreferredSymbolConfiguration:", v3);
  objc_msgSend(v6, "setContentMode:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  objc_msgSend(v6, "setTintColor:", v7);

  return v6;
}

- (UIImageView)expansionAccessoryImageView
{
  void *v3;
  UIFont *v4;
  void *v5;

  v3 = *(UIFont **)((char *)&self->_preferredSubtitleFont + 1);
  if (!v3)
  {
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell _expansionAccessoryImageView](self, "_expansionAccessoryImageView"));
    v5 = *(UIFont **)((char *)&self->_preferredSubtitleFont + 1);
    *(UIFont **)((char *)&self->_preferredSubtitleFont + 1) = v4;

    v3 = *(UIFont **)((char *)&self->_preferredSubtitleFont + 1);
  }
  return (UIImageView *)v3;
}

- (UIImageView)expansionEditingAccessoryImageView
{
  void *v3;
  UIImageView *v4;
  void *v5;

  v3 = *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1);
  if (!v3)
  {
    v4 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell _expansionAccessoryImageView](self, "_expansionAccessoryImageView"));
    v5 = *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1);
    *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1) = v4;

    v3 = *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1);
  }
  return (UIImageView *)v3;
}

- (void)_doCleanupExpansionAccessoryViews
{
  if (*(UIFont **)((char *)&self->_preferredSubtitleFont + 1))
  {
    -[MailboxTableCell setAccessoryView:](self, "setAccessoryView:", 0);
    -[MailboxTableCell setExpansionAccessoryImageView:](self, "setExpansionAccessoryImageView:", 0);
  }
  if (*(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1))
  {
    -[MailboxTableCell setEditingAccessoryView:](self, "setEditingAccessoryView:", 0);
    -[MailboxTableCell setExpansionEditingAccessoryImageView:](self, "setExpansionEditingAccessoryImageView:", 0);
  }
}

- (void)_doRefreshExpansionAccessoryImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  double v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  if (-[MailboxTableCell isExpandable](self, "isExpandable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell accessoryView](self, "accessoryView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell expansionAccessoryImageView](self, "expansionAccessoryImageView"));

    if (v3 != v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell expansionAccessoryImageView](self, "expansionAccessoryImageView"));
      -[MailboxTableCell setAccessoryView:](self, "setAccessoryView:", v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell editingAccessoryView](self, "editingAccessoryView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell expansionEditingAccessoryImageView](self, "expansionEditingAccessoryImageView"));

    if (v6 != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell expansionEditingAccessoryImageView](self, "expansionEditingAccessoryImageView"));
      -[MailboxTableCell setEditingAccessoryView:](self, "setEditingAccessoryView:", v8);

    }
    v9 = -[MailboxTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v10 = -1.57079633;
    *(_QWORD *)&v11 = -1;
    *((_QWORD *)&v11 + 1) = -1;
    *(_OWORD *)&v19.c = v11;
    *(_OWORD *)&v19.tx = v11;
    if (v9)
      v10 = 1.57079633;
    *(_OWORD *)&v19.a = v11;
    CGAffineTransformMakeRotation(&v19, v10);
    if (-[MailboxTableCell isExpanded](self, "isExpanded"))
    {
      v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v19.c = v12;
      *(_OWORD *)&v19.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    v18 = v19;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell accessoryView](self, "accessoryView"));
    v17 = v18;
    objc_msgSend(v13, "setTransform:", &v17);

    v16 = v19;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell editingAccessoryView](self, "editingAccessoryView"));
    v15 = v16;
    objc_msgSend(v14, "setTransform:", &v15);

  }
  else
  {
    -[MailboxTableCell _doCleanupExpansionAccessoryViews](self, "_doCleanupExpansionAccessoryViews");
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (LOBYTE(self->_level) != a3)
  {
    LOBYTE(self->_level) = a3;
    -[MailboxTableCell _doRefreshExpansionAccessoryImageView](self, "_doRefreshExpansionAccessoryImageView");
    -[MailboxTableCell _updateUnreadCountLabelVisibilityAnimated:](self, "_updateUnreadCountLabelVisibilityAnimated:", 0);
  }
}

- (void)setExpandable:(BOOL)a3
{
  if (HIBYTE(self->_detailsDisclosureButton) != a3)
  {
    HIBYTE(self->_detailsDisclosureButton) = a3;
    -[MailboxTableCell _doRefreshExpansionAccessoryImageView](self, "_doRefreshExpansionAccessoryImageView");
    -[MailboxTableCell _updateUnreadCountLabelVisibilityAnimated:](self, "_updateUnreadCountLabelVisibilityAnimated:", 0);
    -[MailboxTableCell setForceZeroSeparatorInset:](self, "setForceZeroSeparatorInset:", HIBYTE(self->_detailsDisclosureButton));
  }
}

- (void)setForceZeroSeparatorInset:(BOOL)a3
{
  if (BYTE1(self->_level) != a3)
  {
    BYTE1(self->_level) = a3;
    -[MailboxTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  unsigned int v5;
  _BOOL4 v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  double v10;
  double v11;
  NSString *v12;
  BOOL IsAccessibilityCategory;
  BOOL v14;
  double Width;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSString *v34;
  _BOOL4 v35;
  double v36;
  int v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  NSString *v50;
  BOOL v51;
  NSString *v52;
  BOOL v53;
  NSString *v54;
  _BOOL4 v55;
  int v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  __n128 v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double MaxX;
  double v73;
  double MinX;
  double v75;
  double v76;
  double v77;
  void *v78;
  __n128 v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat height;
  double x;
  __n128 v87;
  void *v88;
  double v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  __n128 v97;
  double v98;
  void *v99;
  double v100;
  __n128 v101;
  void *v102;
  id v103;
  unsigned __int8 v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  NSString *v134;
  _BOOL4 v135;
  NSString *v136;
  _BOOL4 v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  CGFloat v144;
  double v145;
  double v146;
  CGFloat v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  double v159;
  double v160;
  void *v161;
  double v162;
  double v163;
  __n128 v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  __n128 v170;
  void *v171;
  unsigned __int8 v172;
  unsigned int v173;
  char v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  void *v180;
  CGFloat v181;
  double v182;
  double v183;
  double v184;
  double y;
  CGFloat v186;
  double v187;
  CGFloat rect;
  double recta;
  objc_super v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell imageView](self, "imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  if (*(_QWORD *)((char *)&self->_iconOffset.y + 1))
    v5 = -[MailboxTableCell _shouldUnreadCountBeVisible](self, "_shouldUnreadCountBeVisible");
  else
    v5 = 0;
  if ((-[MailboxTableCell isEditing](self, "isEditing") & 1) != 0
    || !-[MailboxTableCell accessoryType](self, "accessoryType"))
  {
    if (-[MailboxTableCell isEditing](self, "isEditing"))
      v6 = -[MailboxTableCell editingAccessoryType](self, "editingAccessoryType") != 0;
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  v7 = -[MailboxTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (-[MailboxTableCell flattenHierarchy](self, "flattenHierarchy"))
    v8 = 0;
  else
    v8 = *(_DWORD *)((char *)&self->_detailsDisclosureButton + 1) + *(_DWORD *)((char *)&self->_titleColor + 1);
  v9 = v8;
  v10 = sub_1001D6F48(v8);
  v190.receiver = self;
  v190.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell layoutSubviews](&v190, "layoutSubviews");
  v11 = 0.0;
  if (!-[MailboxTableCell forceZeroSeparatorInset](self, "forceZeroSeparatorInset"))
  {
    if (v4)
    {
      v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

      if ((_DWORD)v9)
        v14 = 0;
      else
        v14 = IsAccessibilityCategory;
      if (v14)
        goto LABEL_25;
    }
    else if (!(_DWORD)v9)
    {
      goto LABEL_25;
    }
    if (v7)
    {
      -[MailboxTableCell bounds](self, "bounds");
      Width = CGRectGetWidth(v191);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
      objc_msgSend(v16, "frame");
      v17 = Width - CGRectGetMaxX(v192);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
      objc_msgSend(v16, "frame");
    }
    v11 = v10 + v17;

  }
LABEL_25:
  -[MailboxTableCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v11, 0.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
  objc_msgSend(v18, "bounds");
  v186 = v20;
  rect = v19;
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  if (-[MailboxTableCell isExpandable](self, "isExpandable"))
  {
    v34 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    v35 = UIContentSizeCategoryIsAccessibilityCategory(v34);

    v36 = 12.5;
    if (v7)
      v37 = v35;
    else
      v37 = 1;
    if (v37)
      v36 = 0.0;
    v38 = v27 - v36;
    if (v35)
      v39 = v31;
    else
      v39 = v31 + 12.5;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
    objc_msgSend(v40, "setFrame:", v38, v29, v39, v33);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell accessoryView](self, "accessoryView"));
    objc_msgSend(v41, "frame");
    v43 = v42;
    v45 = v44;
    v47 = v46;

    if (v7)
      v48 = 8.0;
    else
      v48 = v39;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell accessoryView](self, "accessoryView"));
    objc_msgSend(v49, "setFrame:", v48, v43, v45, v47);

  }
  if (v4
    && (v50 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory")),
        v51 = UIContentSizeCategoryIsAccessibilityCategory(v50),
        v50,
        !v51))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell imageView](self, "imageView"));
    objc_msgSend(v57, "frame");
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;

    v66 = sub_1001D6FDC(v9);
    v193.origin.x = v59;
    v193.origin.y = v61;
    v193.size.width = v63;
    v193.size.height = v65;
    v67.n128_f64[0] = v66 + CGRectGetWidth(v193) * -0.5;
    v68 = UIRoundToViewScale(self, v67) + *(double *)((char *)&self->_mailboxes + 1);
    if (v7)
    {
      v194.origin.y = v186;
      v194.origin.x = rect;
      v194.size.width = v22;
      v194.size.height = v24;
      v69 = CGRectGetWidth(v194);
      v195.origin.x = v68;
      v195.origin.y = v61;
      v195.size.width = v63;
      v195.size.height = v65;
      v68 = v69 - CGRectGetMaxX(v195);
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell imageView](self, "imageView"));
    objc_msgSend(v70, "setFrame:", v68, v61, v63, v65);

  }
  else
  {
    v52 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    v53 = UIContentSizeCategoryIsAccessibilityCategory(v52);

    if (v53)
    {
      v54 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
      v55 = UIContentSizeCategoryIsAccessibilityCategory(v54);

      if (v4)
        v56 = 0;
      else
        v56 = v55;
      goto LABEL_50;
    }
    v10 = v10 - sub_1001D6F48(v9);
    if (v10 < 8.0)
    {
      v56 = 1;
      v10 = 8.0;
      goto LABEL_50;
    }
  }
  v56 = 0;
LABEL_50:
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
  objc_msgSend(v71, "bounds");
  MaxX = CGRectGetMaxX(v196);

  if (-[MailboxTableCell isExpandable](self, "isExpandable"))
    v73 = 14.0;
  else
    v73 = 20.0;
  if (v7)
  {
    v197.origin.y = v186;
    v197.origin.x = rect;
    v197.size.width = v22;
    v197.size.height = v24;
    MinX = CGRectGetMinX(v197);
    v75 = -0.0;
    if (!v6)
      v75 = v73;
    v76 = v75 + MinX;
  }
  else
  {
    v77 = 0.0;
    if (!v6)
      v77 = v73;
    v76 = MaxX - v77;
  }
  v78 = *(void **)((char *)&self->_iconOffset.y + 1);
  if (v78)
  {
    objc_msgSend(v78, "sizeToFit");
    objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "frame");
    v83 = v80;
    v84 = v81;
    height = v82;
    if (v7)
      v79.n128_f64[0] = v76 + 10.0;
    else
      v79.n128_f64[0] = v76 - CGRectGetWidth(*(CGRect *)v79.n128_u64) + -10.0;
    v198.origin.x = UIRoundToViewScale(self, v79);
    x = v198.origin.x;
    v198.origin.y = v83;
    v198.size.width = v84;
    v198.size.height = height;
    v87.n128_f64[0] = (v24 - CGRectGetHeight(v198)) * 0.5;
    y = UIRoundToViewScale(self, v87);
    v187 = x;
    objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setFrame:", x);
  }
  else
  {
    v84 = CGRectZero.size.width;
    y = CGRectZero.origin.y;
    v187 = CGRectZero.origin.x;
    height = CGRectZero.size.height;
  }
  v88 = *(UILabel **)((char *)&self->_unreadCountLabel + 1);
  if (v88)
  {
    v89 = v10;
    objc_msgSend(v88, "frame");
    v94 = v91;
    v95 = v92;
    v96 = v93;
    if (v7)
    {
      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "frame");
      v97.n128_f64[0] = CGRectGetMaxX(v199) + 10.0;
      if (*(_QWORD *)((char *)&self->_iconOffset.y + 1))
        v98 = v97.n128_f64[0] + 10.0;
      else
        v98 = v97.n128_f64[0];
    }
    else
    {
      v98 = v76 - CGRectGetWidth(*(CGRect *)&v90) + -10.0;
      v99 = *(void **)((char *)&self->_iconOffset.y + 1);
      if (v99)
      {
        objc_msgSend(v99, "frame");
        v98 = v98 - (CGRectGetWidth(v200) + 10.0);
      }
    }
    v97.n128_f64[0] = v98;
    v201.origin.x = UIRoundToViewScale(self, v97);
    v100 = v201.origin.x;
    v201.origin.y = v94;
    v201.size.width = v95;
    v201.size.height = v96;
    v101.n128_f64[0] = (v24 - CGRectGetHeight(v201)) * 0.5;
    objc_msgSend(*(id *)((char *)&self->_unreadCountLabel + 1), "setFrame:", v100, UIRoundToViewScale(self, v101), v95, v96);
    v10 = v89;
  }
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  v103 = objc_msgSend(v102, "_splitViewControllerContext");

  v104 = -[MailboxTableCell _viewConfigurationState](self, "_viewConfigurationState");
  recta = height;
  if (-[MailboxTableCell isExpandable](self, "isExpandable"))
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubheadline, 0x8000, 0));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v105, 0.0));
    objc_msgSend(v106, "setFont:", v107);

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailAccountCellTitleColor](UIColor, "mailAccountCellTitleColor"));
    objc_msgSend(v108, "setTextColor:", v109);

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v110, "setBackgroundColor:", v111);

    v10 = 8.0;
  }
  else if (-[MailboxTableCell isCellEnabled](self, "isCellEnabled"))
  {
    v112 = *(uint64_t *)((char *)&self->_userInfo + 1);
    if (v112)
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
      objc_msgSend(v105, "setTextColor:", v112);
      goto LABEL_81;
    }
    v177 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
    v178 = objc_msgSend(v177, "mf_useSplitViewStyling") & ((v104 & 4) != 0);

    if (v178 != 1 || v103 == (id)2)
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
      objc_msgSend(v110, "setTextColor:", v105);
    }
    else
    {
      v179 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      v180 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
      objc_msgSend(v180, "setTextColor:", v179);

      v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell imageView](self, "imageView"));
      objc_msgSend(v110, "setTintColor:", v105);
    }
  }
  else
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v105, "setTextColor:", v110);
  }

LABEL_81:
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
  objc_msgSend(v113, "frame");
  v115 = v114;
  v117 = v116;

  v181 = v84;
  if (!v7)
  {
    if (v5)
    {
      v204.origin.y = y;
      v204.origin.x = v187;
      v204.size.width = v84;
      v204.size.height = height;
      v120 = CGRectGetMinX(v204) - v10 + -5.0;
      if (v56)
        goto LABEL_88;
    }
    else
    {
      v124 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView"));
      objc_msgSend(v124, "bounds");
      v120 = CGRectGetMaxX(v207) - v10 + -5.0;

      if (v56)
        goto LABEL_88;
    }
LABEL_90:
    v183 = v115;
    v184 = v117;
    v121 = v10;
    v122 = v10;
    v123 = v120;
    goto LABEL_91;
  }
  v118 = 5.0;
  if (v5)
  {
    v202.origin.y = y;
    v202.origin.x = v187;
    v202.size.width = v84;
    v202.size.height = height;
    v118 = CGRectGetMaxX(v202) + 5.0;
  }
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell contentView](self, "contentView", *(_QWORD *)&v84));
  objc_msgSend(v119, "bounds");
  v120 = CGRectGetMaxX(v203) - v118 - v10;

  v10 = v118;
  if (!v56)
    goto LABEL_90;
LABEL_88:
  v121 = v10;
  v205.origin.x = v10;
  v205.origin.y = v115;
  v205.size.width = v120;
  v205.size.height = v117;
  v206 = CGRectInset(v205, 12.0, 0.0);
  v122 = v206.origin.x;
  v183 = v206.origin.y;
  v184 = v206.size.height;
  v123 = v206.size.width;
LABEL_91:
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel", *(_QWORD *)&v181));
  objc_msgSend(v125, "frame");
  v127 = v126;
  v129 = v128;
  v131 = v130;
  v133 = v132;

  if (-[MailboxTableCell style](self, "style") == (id)3
    || (v134 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory")),
        v135 = UIContentSizeCategoryIsAccessibilityCategory(v134),
        v134,
        v135))
  {
    v131 = v120;
  }
  else
  {
    v121 = v127;
  }
  v136 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  v137 = UIContentSizeCategoryIsAccessibilityCategory(v136);

  v138 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
  v139 = v138;
  if (v137)
  {
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[MailboxTableCell titleFont](MailboxTableCell, "titleFont"));
    objc_msgSend(v140, "lineHeight");
    objc_msgSend(v139, "sizeThatFits:", v120, v141 + v141);
    v143 = v142;

    v144 = v143 + 0.0;
    v208.origin.y = 0.0;
    v208.origin.x = v122;
    v208.size.width = v123;
    v208.size.height = v143;
    v215.origin.x = v121;
    v215.origin.y = v143 + 0.0;
    v215.size.width = v131;
    v215.size.height = v133;
    v209 = CGRectUnion(v208, v215);
    v145 = v209.size.height;
    -[MailboxTableCell bounds](self, "bounds", v209.origin.x, v209.origin.y, v209.size.width);
    v147 = ceil((v146 - v145) * 0.5);
    v210.origin.y = 0.0;
    v210.origin.x = v122;
    v210.size.width = v123;
    v210.size.height = v143;
    v211 = CGRectOffset(v210, 0.0, v147);
    v148 = v211.origin.x;
    v211.origin.x = v121;
    v149 = v211.origin.y;
    v150 = v211.size.width;
    v151 = v211.size.height;
    v211.origin.y = v144;
    v211.size.width = v131;
    v211.size.height = v133;
    v212 = CGRectOffset(v211, 0.0, v147);
    v152 = v212.origin.x;
    v153 = v212.origin.y;
    v154 = v212.size.width;
    v155 = v212.size.height;
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
    objc_msgSend(v156, "setFrame:", v148, v149, v150, v151);

    v157 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v157, "setFrame:", v152, v153, v154, v155);

    v158 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
    objc_msgSend(v158, "_firstLineBaselineFrameOriginY");
    v160 = v159;
    v161 = (void *)objc_claimAutoreleasedReturnValue(+[MailboxTableCell titleFont](MailboxTableCell, "titleFont"));
    objc_msgSend(v161, "capHeight");
    v163 = v160 + v162 * -0.5;

    if (*(_QWORD *)((char *)&self->_iconOffset.y + 1))
    {
      v213.origin.y = y;
      v213.origin.x = v187;
      v213.size.width = v182;
      v213.size.height = recta;
      v164.n128_f64[0] = CGRectGetHeight(v213) * 0.5;
      objc_msgSend(*(id *)((char *)&self->_iconOffset.y + 1), "setFrame:", v187, v163 - UIRoundToViewScale(self, v164), v182, recta);
    }
    v165 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell accessoryView](self, "accessoryView"));
    v166 = v165;
    if (v165)
    {
      objc_msgSend(v165, "frame");
      v167 = v214.origin.x;
      v168 = v214.size.width;
      v169 = v214.size.height;
      v170.n128_f64[0] = CGRectGetHeight(v214) * 0.5;
      objc_msgSend(v166, "setFrame:", v167, v163 - UIRoundToViewScale(self, v170), v168, v169);
    }
  }
  else
  {
    objc_msgSend(v138, "setFrame:", v122, v183, v123, v184);

    v166 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v166, "setFrame:", v121, v129, v131, v133);
  }

  v171 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  if ((objc_msgSend(v171, "mf_useSplitViewStyling") & 1) != 0)
    goto LABEL_102;
  v172 = -[MailboxTableCell isEditing](self, "isEditing");

  if ((v172 & 1) == 0)
  {
    v173 = -[MailboxTableCell isHighlighted](self, "isHighlighted");
    v174 = v173;
    if (v173)
    {
      v175 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _tertiaryFillColor](UIColor, "_tertiaryFillColor"));
      v171 = v175;
    }
    else
    {
      v171 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
      v175 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailCellSelectionStateColorForInterfaceLevel:](UIColor, "mailCellSelectionStateColorForInterfaceLevel:", objc_msgSend(v171, "userInterfaceLevel")));
    }
    v176 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell selectedBackgroundView](self, "selectedBackgroundView"));
    objc_msgSend(v176, "setBackgroundColor:", v175);

    if ((v174 & 1) == 0)
LABEL_102:

  }
}

- (CGPoint)destinationPointForAnimation
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  id v21;
  CGFloat MidY;
  double MidX;
  double v24;
  double v25;
  double v26;
  CGPoint result;
  CGRect v28;
  CGRect v29;

  -[MailboxTableCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell textLabel](self, "textLabel"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell traitCollection](self, "traitCollection"));
  v21 = objc_msgSend(v20, "horizontalSizeClass");

  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  MidY = CGRectGetMidY(v28);
  v29.origin.x = v13;
  v29.origin.y = v15;
  v29.size.width = v17;
  v29.size.height = v19;
  MidX = CGRectGetMidX(v29);
  v24 = 3.0;
  if (v21 == (id)1)
    v24 = 2.0;
  v25 = v8 / v24;
  if (v25 >= MidX)
    MidX = v25;
  v26 = MidY;
  result.y = v26;
  result.x = MidX;
  return result;
}

- (id)_scriptingInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailboxTableCell;
  v3 = -[MailboxTableCell _scriptingInfo](&v9, "_scriptingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "count") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._shouldDisableWhileEditing + 1), "anyObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayNameUsingSpecialNamesForMailbox:", v6));

    objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("ID"));
  }
  return v4;
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MailboxTableCell countDebouncer](self, "countDebouncer", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  objc_msgSend(v7, "debounceResult:", v6);

}

- (unsigned)flattenHierarchy
{
  return *(_DWORD *)&self->_hideUnreadCountForEditing;
}

- (void)setFlattenHierarchy:(unsigned int)a3
{
  *(_DWORD *)&self->_hideUnreadCountForEditing = a3;
}

- (id)userInfo
{
  return *(id *)&self->_shouldShowUnreadCount;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_shouldShowUnreadCount, a3);
}

- (UIColor)titleColor
{
  return *(UIColor **)((char *)&self->_userInfo + 1);
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_userInfo + 1), a3);
}

- (BOOL)hideUnreadCountForEditing
{
  return BYTE6(self->_detailsDisclosureButton);
}

- (void)setHideUnreadCountForEditing:(BOOL)a3
{
  BYTE6(self->_detailsDisclosureButton) = a3;
}

- (BOOL)isExpandable
{
  return HIBYTE(self->_detailsDisclosureButton);
}

- (BOOL)isExpanded
{
  return self->_level;
}

- (int64_t)extraIndentLevel
{
  return *(int64_t *)((char *)&self->_titleColor + 1);
}

- (void)setExtraIndentLevel:(int64_t)a3
{
  *(UIColor **)((char *)&self->_titleColor + 1) = (UIColor *)a3;
}

- (BOOL)forceZeroSeparatorInset
{
  return BYTE1(self->_level);
}

- (UIFont)preferredSubtitleFont
{
  return *(UIFont **)((char *)&self->_extraIndentLevel + 1);
}

- (void)setExpansionAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_preferredSubtitleFont + 1), a3);
}

- (void)setExpansionEditingAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_expansionAccessoryImageView + 1), a3);
}

- (EFCancelable)unreadCountToken
{
  return *(EFCancelable **)((char *)&self->_expansionEditingAccessoryImageView + 1);
}

- (void)setUnreadCountToken:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_expansionEditingAccessoryImageView + 1), a3);
}

- (EFDebouncer)countDebouncer
{
  return *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
}

- (BOOL)shouldShowUnreadCount
{
  return BYTE2(self->_level);
}

- (void)setShouldShowUnreadCount:(BOOL)a3
{
  BYTE2(self->_level) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_unreadCountToken + 1), 0);
  objc_storeStrong((id *)((char *)&self->_expansionEditingAccessoryImageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_expansionAccessoryImageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_preferredSubtitleFont + 1), 0);
  objc_storeStrong((id *)((char *)&self->_extraIndentLevel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_userInfo + 1), 0);
  objc_storeStrong((id *)&self->_shouldShowUnreadCount, 0);
  objc_storeStrong((id *)((char *)&self->_unreadCountLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_iconOffset.y + 1), 0);
  objc_storeStrong((id *)((char *)&self->_legacyMailboxes + 1), 0);
  objc_storeStrong((id *)(&self->super._shouldDisableWhileEditing + 1), 0);
}

@end
