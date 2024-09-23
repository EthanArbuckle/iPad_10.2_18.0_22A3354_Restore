@implementation MCSNotJunk

- (MCSNotJunk)init
{
  return -[MCSNotJunk initWithSpecialDestination:](self, "initWithSpecialDestination:", 7);
}

- (MCSNotJunk)initWithSpecialDestination:(int64_t)a3
{
  void *v5;
  void *v6;
  MCSNotJunk *v7;
  uint64_t v9;
  uint64_t v10;

  v10 = MFMessageIsNotJunk;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v9 = MFMessageIsJunk;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = -[_MCSJunk initWithSpecialDestination:markAsRead:flagsToSet:flagsToClear:](self, "initWithSpecialDestination:markAsRead:flagsToSet:flagsToClear:", a3, 0, v5, v6);

  return v7;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_NOT_JUNK_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

@end
