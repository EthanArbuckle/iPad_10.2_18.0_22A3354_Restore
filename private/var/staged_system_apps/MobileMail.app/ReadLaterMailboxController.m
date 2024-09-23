@implementation ReadLaterMailboxController

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForUnfiredReadLaterMessages](EMMessageListItemPredicates, "predicateForUnfiredReadLaterMessages");
}

- (id)criterion
{
  return 0;
}

- (BOOL)alwaysActiveCountQuery
{
  return 1;
}

- (BOOL)shouldBeDisplayed
{
  return 1;
}

- (id)mailboxTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("READ_LATER_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteReadLaterMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end
