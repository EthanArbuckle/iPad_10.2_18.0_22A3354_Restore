@implementation BTAVRCP_PodcastItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery podcastsQuery](MPMediaQuery, "podcastsQuery");
}

- (id)targetApp
{
  return off_10001F050;
}

@end
