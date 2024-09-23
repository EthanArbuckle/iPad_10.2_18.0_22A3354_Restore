@implementation FlagColorMailboxController

- (FlagColorMailboxController)initWithType:(unint64_t)a3
{
  -[FlagColorMailboxController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[FlagColorMailboxController initWithType:]", "FlagColorMailboxController.m", 21, "0");
}

- (FlagColorMailboxController)initWithType:(unint64_t)a3 flagColor:(unint64_t)a4
{
  FlagColorMailboxController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FlagColorMailboxController;
  result = -[SharedMailboxController initWithType:](&v6, "initWithType:", a3);
  if (result)
    result->_flagColor = a4;
  return result;
}

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", -[FlagColorMailboxController flagColor](self, "flagColor"));
}

- (id)criterion
{
  return +[MFMessageCriterion criterionForFlagColor:](MFMessageCriterion, "criterionForFlagColor:", -[FlagColorMailboxController flagColor](self, "flagColor"));
}

- (BOOL)shouldBeDisplayed
{
  return -[SharedMailboxController badgeCount](self, "badgeCount") > 0;
}

- (id)mailboxTitle
{
  unint64_t v3;
  __CFString *v4;
  NSBundle *v5;
  void *v6;
  void *v7;

  v3 = -[FlagColorMailboxController flagColor](self, "flagColor");
  if (v3 > 6)
  {
    v7 = 0;
  }
  else
  {
    v4 = off_10051D100[v3];
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_100531B00, CFSTR("Main")));

  }
  return v7;
}

- (id)navigationTitle
{
  unint64_t v3;
  __CFString *v4;
  NSBundle *v5;
  void *v6;
  void *v7;

  v3 = -[FlagColorMailboxController flagColor](self, "flagColor");
  if (v3 > 6)
  {
    v7 = 0;
  }
  else
  {
    v4 = off_10051D138[v3];
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_100531B00, CFSTR("Main")));

  }
  return v7;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteFlagColorMailbox;
}

- (id)iconTintColor
{
  return +[UIColor mf_colorFromFlagColor:](UIColor, "mf_colorFromFlagColor:", -[FlagColorMailboxController flagColor](self, "flagColor"));
}

- (id)shortcutIconName
{
  return MFImageGlyphFavoriteFlagColorMailbox;
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

- (unint64_t)flagColor
{
  return self->_flagColor;
}

@end
