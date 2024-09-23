@implementation CATTaskSession

- (STUSessionInfo)stu_info
{
  STUSessionInfo *v3;
  void *v4;
  void *v5;
  STUSessionInfo *v6;

  v3 = [STUSessionInfo alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskSession transport](self, "transport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskSession clientUserInfo](self, "clientUserInfo"));
  v6 = -[STUSessionInfo initWithTransport:clientUserInfo:](v3, "initWithTransport:clientUserInfo:", v4, v5);

  return v6;
}

@end
