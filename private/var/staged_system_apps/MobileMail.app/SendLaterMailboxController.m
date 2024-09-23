@implementation SendLaterMailboxController

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForSendLaterMessages](EMMessageListItemPredicates, "predicateForSendLaterMessages");
}

- (id)criterion
{
  return +[MFMessageCriterion sendLaterMessageCriterion](MFMessageCriterion, "sendLaterMessageCriterion");
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
  return (id)_EFLocalizedString(CFSTR("Send Later"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteSendLaterMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end
