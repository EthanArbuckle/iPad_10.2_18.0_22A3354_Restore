@implementation BTAVRCP_AlbumItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery albumsQuery](MPMediaQuery, "albumsQuery");
}

- (id)targetApp
{
  return off_10001F048;
}

@end
