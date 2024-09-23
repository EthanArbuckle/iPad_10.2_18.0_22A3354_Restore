@implementation UNNotificationRequest

+ (id)mt_uniqueRequestIdentifierForPodcastUuid:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[16];

  v3 = (__CFString *)a3;
  if (!-[__CFString length](v3, "length"))
  {
    v4 = _MTLogCategoryDefault(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }

  }
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("null");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcastUuid-%@/%@"), v3, v7));
  return v8;
}

+ (BOOL)mt_isUuidRequestIdentifier:(id)a3 matchForPodcastUuid:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    v7 = _MTLogCategoryDefault(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }

  }
  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcastUuid-%@"), v6));
    v10 = objc_msgSend(v5, "hasPrefix:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)mt_uniqueRequestIdentifierForPlayerItem:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("playerItem-%@"), a3);
}

+ (BOOL)mt_isPlayerItemRequestIdentifier:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("playerItem"));
}

+ (void)mt_accessSchedulingOptionsByRequestIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  if (qword_100567548 != -1)
  {
    v6 = v3;
    dispatch_once(&qword_100567548, &stru_1004AB400);
    v3 = v6;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    v4 = qword_100567550;
    block[1] = 3221225472;
    block[2] = sub_100104044;
    block[3] = &unk_1004A6378;
    v5 = v3;
    block[0] = _NSConcreteStackBlock;
    v8 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }
LABEL_4:

}

- (unint64_t)mt_schedulingOptions
{
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10004683C;
  v10 = sub_100046A94;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100104130;
  v5[3] = &unk_1004A78F0;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend((id)objc_opt_class(self), "mt_accessSchedulingOptionsByRequestIdentifier:", v5);
  v2 = (void *)v7[5];
  if (v2)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);

  return (unint64_t)v3;
}

- (void)mt_setSchedulingOptions:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10010420C;
  v3[3] = &unk_1004AB428;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend((id)objc_opt_class(self), "mt_accessSchedulingOptionsByRequestIdentifier:", v3);
}

@end
