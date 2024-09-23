@implementation UserProfileLinkFactory

- (id)createModelForType:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)a3 > 7)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*off_1011DE8D8[a3], "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "createUserProfileLink"));

  return v4;
}

@end
