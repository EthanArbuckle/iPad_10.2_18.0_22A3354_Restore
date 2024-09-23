@implementation DeniesInternalPresentationsShowViewControllerOperation

- (void)doInternalPresentation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_opt_class(self);
    v6 = v5;
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShowViewControllerOperation shownViewController](self, "shownViewController"));
    objc_opt_class(v8);
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    v10 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ operation instructing non-internal modal presentation of %@.", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShowViewControllerOperation shownViewController](self, "shownViewController"));
  objc_msgSend(v11, "setModalPresentationStyle:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShowViewControllerOperation parentOfShownViewController](self, "parentOfShownViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShowViewControllerOperation shownViewController](self, "shownViewController"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B8374;
  v14[3] = &unk_1001B2538;
  v14[4] = self;
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, -[ShowViewControllerOperation shouldShowWithAnimation](self, "shouldShowWithAnimation"), v14);

}

@end
