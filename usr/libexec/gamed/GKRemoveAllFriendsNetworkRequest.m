@implementation GKRemoveAllFriendsNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-remove-all-friends");
}

- (id)initRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKRemoveAllFriendsNetworkRequest;
  return -[GKRemoveFriendNetworkRequest initWithFriendPlayerID:](&v3, "initWithFriendPlayerID:", &stru_1002CE2A8);
}

@end
