@implementation CCDAuthKitUtilities

+ (BOOL)shouldActivateAnisette
{
  uint64_t (*v2)(id *);
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  __int128 buf;
  void *(*v19)(uint64_t);
  void *v20;
  uint64_t *v21;

  v13 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v2 = (uint64_t (*)(id *))off_100021590;
  v17 = off_100021590;
  if (!off_100021590)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = sub_1000019D4;
    v20 = &unk_100018620;
    v21 = &v14;
    sub_1000019D4((uint64_t)&buf);
    v2 = (uint64_t (*)(id *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
    sub_10000DF98();
  v3 = v2(&v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v13;
  v8 = v5;
  if (v5 || !v4)
  {
    v11 = *(NSObject **)(DEPLogObjects(v5, v6, v7) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to load activation record when activating anisette with error: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags")));
    v10 = (~(unint64_t)objc_msgSend(v9, "integerValue") & 0x21) == 0;

  }
  return v10;
}

+ (void)midWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)qword_1000215A0;
  v15 = qword_1000215A0;
  if (!qword_1000215A0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100001AC4;
    v11[3] = &unk_100018620;
    v11[4] = &v12;
    sub_100001AC4((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v7 = (void *)objc_opt_new(v5, v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000018CC;
  v9[3] = &unk_1000185F8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "anisetteDataWithCompletion:", v9);

}

@end
