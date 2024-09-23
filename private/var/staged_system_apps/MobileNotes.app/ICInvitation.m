@implementation ICInvitation

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICInvitation managedObjectContext](self, "managedObjectContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C77B4;
    v12[3] = &unk_100550160;
    v12[4] = self;
    v13 = v6;
    objc_msgSend(v10, "performBlockAndWait:", v12);

  }
  return 0;
}

@end
