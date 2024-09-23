@implementation GKInviteCacheObject

+ (id)entityName
{
  return CFSTR("Invite");
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKInviteCacheObject;
  -[GKInviteCacheObject awakeFromInsert](&v4, "awakeFromInsert");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKInviteCacheObject setTimeStamp:](self, "setTimeStamp:", v3);

  -[GKInviteCacheObject setType:](self, "setType:", 0);
}

+ (id)fetchSortDescriptors
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timeStamp"), 0));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

@end
