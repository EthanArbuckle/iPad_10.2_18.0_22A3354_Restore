@implementation MCSJunk

- (MCSJunk)init
{
  void *v3;
  void *v4;
  MCSJunk *v5;
  uint64_t v7;
  uint64_t v8;

  v8 = MFMessageIsJunk;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v7 = MFMessageIsNotJunk;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = -[_MCSJunk initWithSpecialDestination:markAsRead:flagsToSet:flagsToClear:](self, "initWithSpecialDestination:markAsRead:flagsToSet:flagsToClear:", 1, 1, v3, v4);

  return v5;
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return 0;
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return 0;
}

- (id)localizedShortOperationDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_JUNK_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

@end
