@implementation CKGenericAppInteractionProcessor

- (BOOL)supportsSiriDonations
{
  return 0;
}

- (id)bundleIdPredicate
{
  return +[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1);
}

- (id)supportedTypes
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &__NSArray0__struct);
}

- (BOOL)processInteraction:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intent"));
  v8 = (objc_class *)objc_opt_class(v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@:%@"), CFSTR("duet:app/intents:"), v10, v5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateInterval"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateInterval"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
  objc_msgSend(v16, "recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:", v11, v13, v15, &__NSDictionary0__struct, CFSTR("history"), &stru_100018D50);

  return 1;
}

@end
