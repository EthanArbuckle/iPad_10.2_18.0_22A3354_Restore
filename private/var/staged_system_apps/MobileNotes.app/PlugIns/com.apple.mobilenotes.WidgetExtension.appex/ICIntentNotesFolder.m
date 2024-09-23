@implementation ICIntentNotesFolder

+ (ICIntentNotesFolder)currentDefaultNotesFolder
{
  ICIntentNotesFolder *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICIntentNotesFolder *v7;

  v2 = [ICIntentNotesFolder alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForDefaultFolder](ICAppURLUtilities, "appURLForDefaultFolder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder localizedTitleForDefaultFolder](ICFolder, "localizedTitleForDefaultFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
  v7 = -[ICIntentNotesFolder initWithIdentifier:title:depth:shareDescription:systemImageName:](v2, "initWithIdentifier:title:depth:shareDescription:systemImageName:", v4, v5, 0, 0, v6);

  return v7;
}

- (ICIntentNotesFolder)initWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSObject *v9;
  ICIntentNotesFolder *v10;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  ICIntentNotesFolder *v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  ICIntentNotesFolder *v28;
  uint64_t *v29;
  _QWORD v30[4];
  NSObject *v31;
  ICIntentNotesFolder *v32;
  uint64_t *v33;
  _QWORD v34[4];
  NSObject *v35;
  ICIntentNotesFolder *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[24];

  v4 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100006A58;
  v42 = sub_100006A68;
  v43 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  if (objc_msgSend(v5, "ic_isModernAccountType"))
  {

LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100006A70;
    v34[3] = &unk_100081A68;
    v35 = v4;
    v37 = &v38;
    v36 = self;
    objc_msgSend(v8, "performBlockAndWait:", v34);

    v9 = v35;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v7 = objc_msgSend(v6, "ic_isModernAccountProxyType");

  if (v7)
    goto LABEL_4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v13 = objc_msgSend(v12, "ic_isLegacyAccountType");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100006BD8;
    v30[3] = &unk_100081A68;
    v31 = v4;
    v33 = &v38;
    v32 = self;
    objc_msgSend(v14, "performBlockAndWait:", v30);

    v9 = v31;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    v16 = objc_msgSend(v15, "ic_isModernFolderType");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100006D18;
      v26[3] = &unk_100081A68;
      v27 = v4;
      v29 = &v38;
      v28 = self;
      objc_msgSend(v17, "performBlockAndWait:", v26);

      v9 = v27;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
      v19 = objc_msgSend(v18, "ic_isLegacyFolderType");

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100006E68;
        v22[3] = &unk_100081A68;
        v23 = v4;
        v25 = &v38;
        v24 = self;
        objc_msgSend(v20, "performBlockAndWait:", v22);

        v9 = v23;
      }
      else
      {
        v9 = os_log_create("com.apple.notes", "Intents");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
          sub_100061288(v21, buf, v9);
        }

      }
    }
  }
LABEL_5:

  v10 = (ICIntentNotesFolder *)(id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v10;
}

- (ICIntentNotesFolder)initWithVirtualSmartFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICIntentNotesFolder *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForVirtualSmartFolder:](ICAppURLUtilities, "appURLForVirtualSmartFolder:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemImageName"));

  v9 = -[ICIntentNotesFolder initWithIdentifier:title:depth:shareDescription:systemImageName:](self, "initWithIdentifier:title:depth:shareDescription:systemImageName:", v6, v7, 0, 0, v8);
  return v9;
}

- (ICIntentNotesFolder)initWithIdentifier:(id)a3 title:(id)a4 depth:(int64_t)a5 shareDescription:(id)a6 systemImageName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ICIntentNotesFolder *v16;
  ICIntentNotesFolder *v17;
  id v18;
  id i;
  ICIntentNotesFolder *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  ICIntentNotesFolder *v28;
  id v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)ICIntentNotesFolder;
  v16 = -[ICIntentNotesFolder initWithIdentifier:displayString:](&v30, "initWithIdentifier:displayString:", v12, v13);
  v17 = v16;
  if (v16)
  {
    v28 = v16;
    v18 = objc_msgSend(v13, "mutableCopy");
    v29 = v14;
    for (i = objc_msgSend(v14, "mutableCopy"); a5; --a5)
    {
      objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 0);
      objc_msgSend(i, "insertString:atIndex:", CFSTR(" "), 0);
    }
    v20 = -[ICIntentNotesFolder initWithIdentifier:displayString:]([ICIntentNotesFolder alloc], "initWithIdentifier:displayString:", v12, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v15, v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    v24 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageWithTintColor:", v23));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[INImage imageWithUIImage:](INImage, "imageWithUIImage:", v25));
    -[ICIntentNotesFolder setDisplayImage:](v20, "setDisplayImage:", v26);

    -[ICIntentNotesFolder setSubtitleString:](v20, "setSubtitleString:", i);
    v15 = v24;

    v17 = v28;
    v14 = v29;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
