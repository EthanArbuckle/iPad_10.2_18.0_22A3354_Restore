@implementation UnsubscribeMailboxController

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForUnsubscribableMessages](EMMessageListItemPredicates, "predicateForUnsubscribableMessages");
}

- (id)criterion
{
  return +[MFMessageCriterion messageCriterionForUnsubscribeTypeNotMatching:](MFMessageCriterion, "messageCriterionForUnsubscribeTypeNotMatching:", 0);
}

- (BOOL)shouldBeDisplayed
{
  return 1;
}

- (id)mailboxTitle
{
  return (id)_EFLocalizedString(CFSTR("Unsubscribe"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteUnsubscribeMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end
