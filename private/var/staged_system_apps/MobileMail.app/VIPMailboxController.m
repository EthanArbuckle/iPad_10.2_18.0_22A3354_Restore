@implementation VIPMailboxController

- (id)unscopedCountPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForIsVIP:](EMMessageListItemPredicates, "predicateForIsVIP:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
}

- (id)unreadCriterion
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIPMailboxController criterion](self, "criterion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", DisableThreadingKey);

  if ((v4 & 1) == 0)
    objc_msgSend(v2, "setIncludeRelatedMessages:", 1);
  return v2;
}

- (id)mailboxTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("VIP_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)criterion
{
  return +[MFMessageCriterion senderIsVIPCriterion:](MFMessageCriterion, "senderIsVIPCriterion:", 1);
}

- (id)navigationTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("VIP_NAVIGATION_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)iconTintColor
{
  return +[UIColor systemYellowColor](UIColor, "systemYellowColor");
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteVIPMailbox;
}

- (id)shortcutIconName
{
  return MFImageGlyphFavoriteVIPMailbox;
}

- (void)presentFromSelectionTarget:(id)a3 item:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001E6D5C;
  v15[3] = &unk_100523C40;
  v18 = a5;
  v15[4] = self;
  v13 = v10;
  v16 = v13;
  v14 = v11;
  v17 = v14;
  v19 = a6;
  objc_msgSend(v12, "getAllVIPsWithCompletion:", v15);

}

- (void)_showVIPSettingsFromSelectionTarget:(id)a3 item:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  MFVIPSendersListTableViewController *v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v7 = a4;
  v8 = -[MFVIPSendersListTableViewController initWithStyle:]([MFVIPSendersListTableViewController alloc], "initWithStyle:", 2);
  objc_msgSend(v9, "selectCustomViewController:item:animated:", v8, v7, v5);

}

- (BOOL)wantsDisclosureButton
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  v3 = objc_msgSend(v2, "hasVIPs");

  return v3;
}

@end
