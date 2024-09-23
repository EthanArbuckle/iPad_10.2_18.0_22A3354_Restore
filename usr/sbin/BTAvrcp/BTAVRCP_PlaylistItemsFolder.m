@implementation BTAVRCP_PlaylistItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
}

- (id)targetApp
{
  return off_10001F048;
}

@end
