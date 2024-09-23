@implementation BTAVRCP_SongsFolder

- (id)baseQuery
{
  return +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
}

- (id)targetApp
{
  return off_10001F048;
}

@end
