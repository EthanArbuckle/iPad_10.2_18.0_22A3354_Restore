@implementation HasAttachmentsMailboxController

- (id)criterion
{
  return +[MFMessageCriterion hasAttachmentsCriterion](MFMessageCriterion, "hasAttachmentsCriterion");
}

- (id)unscopedCountPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithAttachments](EMMessageListItemPredicates, "predicateForMessagesWithAttachments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HAS_ATTACHMENTS_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)navigationTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HAS_ATTACHMENTS_NAVIGATION_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteAttachmentsMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

- (CGPoint)iconOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end
