@implementation BTAVRCP_AudiobookItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery audiobooksQuery](MPMediaQuery, "audiobooksQuery");
}

- (id)targetApp
{
  return off_10001F058;
}

@end
