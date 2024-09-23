@implementation SmartCoverStateObserver

- (void)smartCoverStateDidChange:(int64_t)a3
{
  uint64_t v4;
  _QWORD v5[5];

  v4 = sub_10006BBEC();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003B28D8;
  v5[3] = &unk_100917378;
  v5[4] = a3;
  sub_100041A34(v4, v5);
}

- (SmartCoverStateObserver)init
{
  void *v3;
  id v4;
  SmartCoverStateObserver *v5;
  void *v6;
  uint64_t v7;
  BSInvalidatable *observability;
  SmartCoverStateObserver *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[8];
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)qword_1009923E8;
  v21 = qword_1009923E8;
  if (!qword_1009923E8)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1003BA548;
    v16 = &unk_1009193E8;
    v17 = &v18;
    sub_1003BA548((uint64_t)buf);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)SmartCoverStateObserver;
    v5 = -[SmartCoverStateObserver init](&v12, "init");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharedInstance"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "registerSmartCoverStateObserver:", v5));
      observability = v5->observability;
      v5->observability = (BSInvalidatable *)v7;

      if (!v5->observability && os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
        sub_1006E65D0();
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v10 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SpringBoardServices framework is missing", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->observability, 0);
}

@end
