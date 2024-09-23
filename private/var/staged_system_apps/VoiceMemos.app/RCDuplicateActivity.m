@implementation RCDuplicateActivity

- (id)activityType
{
  return CFSTR("RCActivityTypeDuplicate");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DUPLICATE_MENU_ITEM"), &stru_1001B2BC0, 0));

  return v3;
}

- (id)_systemImageName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "duplicateActivitySystemImageName"));

  return v3;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return objc_msgSend(a3, "count") == (id)1;
}

- (void)performActivity
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCUIActivity recordingUUIDs](self, "recordingUUIDs"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingsModelInteractor sharedRecordingsModelInteractor](RCRecordingsModelInteractor, "sharedRecordingsModelInteractor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCUIActivity recordingUUIDs](self, "recordingUUIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = objc_msgSend(v5, "duplicateRecordingWithUUID:", v7);

  }
  -[RCDuplicateActivity activityDidFinish:](self, "activityDidFinish:", v4 == (id)1);
}

@end
