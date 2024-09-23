@implementation RCFavoriteActionActivity

- (id)activityType
{
  return CFSTR("RCActivityTypeFavorite");
}

- (id)activityTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[RCFavoriteActionActivity isAlreadyFavorite](self, "isAlreadyFavorite");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("REMOVE_FROM_FAVORITES");
  else
    v5 = CFSTR("ADD_TO_FAVORITES");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1001B2BC0, 0));

  return v6;
}

- (id)_systemImageName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "favoriteActivitySystemImageName:", -[RCFavoriteActionActivity isAlreadyFavorite](self, "isAlreadyFavorite")));

  return v4;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return objc_msgSend(a3, "count") != 0;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainViewController"));

  v6 = -[RCFavoriteActionActivity isAlreadyFavorite](self, "isAlreadyFavorite") ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCUIActivity recordingUUIDs](self, "recordingUUIDs"));
  objc_msgSend(v5, "setFavorite:forRecordingsWithUUIDs:", v6, v7);

  -[RCFavoriteActionActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (BOOL)isAlreadyFavorite
{
  id v3;
  _QWORD v5[4];
  id v6;
  RCFavoriteActionActivity *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003F978;
  v5[3] = &unk_1001ABE90;
  v8 = &v9;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[RCRecordingsModelInteractor sharedRecordingsModelInteractor](RCRecordingsModelInteractor, "sharedRecordingsModelInteractor"));
  v6 = v3;
  v7 = self;
  objc_msgSend(v3, "performBlockAndWait:", v5);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

@end
