@implementation TUIStatsViewControllerFactory

+ (id)newViewControllerWithFeedEntry:(id)a3
{
  id v3;
  TUIStatsFeedEntryViewController *v4;

  v3 = a3;
  v4 = -[TUIStatsFeedEntryViewController initWithFeedEntry:]([TUIStatsFeedEntryViewController alloc], "initWithFeedEntry:", v3);

  return v4;
}

+ (id)newViewControllerWithFeed:(id)a3
{
  id v3;
  TUIStatsFeedViewController *v4;

  v3 = a3;
  v4 = -[TUIStatsFeedViewController initWithFeed:]([TUIStatsFeedViewController alloc], "initWithFeed:", v3);

  return v4;
}

@end
