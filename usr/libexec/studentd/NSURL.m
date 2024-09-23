@implementation NSURL

- (void)stu_handlingAppWithLSPrimitives:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSURL+StudentAdditions.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100065420;
  v12[3] = &unk_1000CBA28;
  v13 = v7;
  v14 = v8;
  v9 = v7;
  v10 = v8;
  -[NSURL stu_handlingAppsWithLSPrimitives:completion:](self, "stu_handlingAppsWithLSPrimitives:completion:", v9, v12);

}

- (void)stu_handlingAppsWithLSPrimitives:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  NSURL *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSURL+StudentAdditions.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000655D4;
  v12[3] = &unk_1000CBA78;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v10, "getAppLinkWithURL:completion:", self, v12);

}

@end
