@implementation NSUserDefaults

- (void)wf_loadValuesFromCloudKitWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer wf_shortcutsContainer](CKContainer, "wf_shortcutsContainer"));
  v6 = objc_alloc((Class)WFCloudKitItemRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publicCloudDatabase"));
  v8 = objc_msgSend(v6, "initWithContainer:database:", v5, v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004460;
  v11[3] = &unk_1000C4078;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  v10 = objc_msgSend(v8, "fetchConfigurationAssetWithType:completionHandler:", CFSTR("com.apple.shortcuts.defaults"), v11);

}

@end
