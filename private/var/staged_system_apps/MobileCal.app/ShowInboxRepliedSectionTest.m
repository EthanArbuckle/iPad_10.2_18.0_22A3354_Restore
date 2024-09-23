@implementation ShowInboxRepliedSectionTest

- (void)runTest
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));
  v5 = objc_msgSend(v4, "resetToYearView");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000E2304;
  v16 = sub_1000E2314;
  v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E231C;
  v9[3] = &unk_1001B51C8;
  v9[4] = self;
  v11 = &v12;
  v6 = v3;
  v10 = v6;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "showInboxAnimated:completion:", 1, v9));
  v8 = (void *)v13[5];
  v13[5] = v7;

  _Block_object_dispose(&v12, 8);
}

@end
