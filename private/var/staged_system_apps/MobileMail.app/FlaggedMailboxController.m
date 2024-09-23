@implementation FlaggedMailboxController

- (id)criterion
{
  return +[MFMessageCriterion flaggedMessageCriterion](MFMessageCriterion, "flaggedMessageCriterion");
}

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForFlaggedMessages](EMMessageListItemPredicates, "predicateForFlaggedMessages");
}

- (BOOL)shouldBeDisplayed
{
  return -[SharedMailboxController badgeCount](self, "badgeCount") > 0;
}

- (id)mailboxTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAGGED_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)navigationTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAGGED_NAVIGATION_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteFlaggedMailbox;
}

- (id)shortcutIconName
{
  return MFImageGlyphFavoriteFlaggedMailbox;
}

- (CGPoint)iconOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 3.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end
