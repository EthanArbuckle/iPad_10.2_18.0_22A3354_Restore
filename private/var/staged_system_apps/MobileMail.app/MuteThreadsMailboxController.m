@implementation MuteThreadsMailboxController

- (id)unreadCriterion
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MuteThreadsMailboxController criterion](self, "criterion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", DisableThreadingKey);

  if ((v4 & 1) == 0)
    objc_msgSend(v2, "setIncludeRelatedMessages:", 1);
  return v2;
}

- (id)criterion
{
  return +[MFMessageCriterion threadMuteMessageCriterion](MFMessageCriterion, "threadMuteMessageCriterion");
}

- (id)unscopedCountPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMuteMessages](EMMessageListItemPredicates, "predicateForMuteMessages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
}

- (id)mailboxTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MUTED_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)navigationTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MUTED_NAVIGATION_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteMuteThreadMailbox;
}

- (id)shortcutIconName
{
  return CFSTR("MFInboxFavoriteIcon");
}

@end
