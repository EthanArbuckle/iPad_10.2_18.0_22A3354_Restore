@implementation MailMenuCommandCollection

+ (id)_gatherShortcuts
{
  NSMutableArray *v2;
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  _QWORD v27[4];
  NSMutableArray *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  NSMutableArray *v32;
  NSMutableArray *v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  _QWORD v36[8];
  _QWORD v37[8];

  v25 = objc_opt_new(NSMutableArray);
  v24 = objc_opt_new(NSMutableArray);
  v23 = objc_opt_new(NSMutableArray);
  v22 = objc_opt_new(NSMutableArray);
  v21 = objc_opt_new(NSMutableArray);
  v20 = objc_opt_new(NSMutableArray);
  v26 = objc_opt_new(NSMutableArray);
  v2 = objc_opt_new(NSMutableArray);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002A0C8;
  v27[3] = &unk_10051E890;
  v3 = v25;
  v28 = v3;
  v4 = v24;
  v29 = v4;
  v5 = v23;
  v30 = v5;
  v6 = v22;
  v31 = v6;
  v7 = v21;
  v32 = v7;
  v8 = v20;
  v33 = v8;
  v9 = v26;
  v34 = v9;
  v10 = v2;
  v35 = v10;
  v11 = objc_retainBlock(v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MailScene menuCommands](MailScene, "menuCommands"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MailMainScene menuCommands](MailMainScene, "menuCommands"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DockContainerViewController menuCommands](DockContainerViewController, "menuCommands"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MailSplitViewController menuCommands](MailSplitViewController, "menuCommands"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeWebView menuCommands](MFComposeWebView, "menuCommands"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailComposeController menuCommands](MFMailComposeController, "menuCommands"));
  ((void (*)(_QWORD *, void *))v11[2])(v11, v17);

  v36[0] = &off_100541680;
  v36[1] = &off_100541698;
  v37[0] = v3;
  v37[1] = v4;
  v36[2] = &off_1005416B0;
  v36[3] = &off_1005416C8;
  v37[2] = v5;
  v37[3] = v6;
  v36[4] = &off_1005416E0;
  v36[5] = &off_1005416F8;
  v37[4] = v7;
  v37[5] = v8;
  v36[6] = &off_100541710;
  v36[7] = &off_100541728;
  v37[6] = v9;
  v37[7] = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 8));

  return v18;
}

- (MailMenuCommandCollection)init
{
  MailMenuCommandCollection *v2;
  uint64_t v3;
  NSDictionary *shortcuts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailMenuCommandCollection;
  v2 = -[MailMenuCommandCollection init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MailMenuCommandCollection _gatherShortcuts](MailMenuCommandCollection, "_gatherShortcuts"));
    shortcuts = v2->shortcuts;
    v2->shortcuts = (NSDictionary *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->shortcuts, 0);
}

@end
