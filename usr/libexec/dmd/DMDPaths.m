@implementation DMDPaths

+ (id)configurationProfilesSystemGroupContainer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057C58;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB940 != -1)
    dispatch_once(&qword_1000EB940, block);
  return (id)qword_1000EB938;
}

+ (NSString)managementPromptPolicyPath
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057D74;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB950 != -1)
    dispatch_once(&qword_1000EB950, block);
  return (NSString *)(id)qword_1000EB948;
}

+ (NSString)managedAppsManifest
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057E34;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB960 != -1)
    dispatch_once(&qword_1000EB960, block);
  return (NSString *)(id)qword_1000EB958;
}

+ (NSString)purchasedBooksManifest
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057EF4;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB970 != -1)
    dispatch_once(&qword_1000EB970, block);
  return (NSString *)(id)qword_1000EB968;
}

+ (NSString)purchasedBooksDirectory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057FB4;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB980 != -1)
    dispatch_once(&qword_1000EB980, block);
  return (NSString *)(id)qword_1000EB978;
}

+ (NSString)managedStoreBooksManifestPath
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058074;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB990 != -1)
    dispatch_once(&qword_1000EB990, block);
  return (NSString *)(id)qword_1000EB988;
}

+ (NSString)managedNonStoreBooksDirectory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058134;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB9A0 != -1)
    dispatch_once(&qword_1000EB9A0, block);
  return (NSString *)(id)qword_1000EB998;
}

+ (NSString)managedNonStoreBooksManifestPath
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000581F4;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB9B0 != -1)
    dispatch_once(&qword_1000EB9B0, block);
  return (NSString *)(id)qword_1000EB9A8;
}

+ (NSString)systemLostModeRequestPath
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000582B4;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB9C0 != -1)
    dispatch_once(&qword_1000EB9C0, block);
  return (NSString *)(id)qword_1000EB9B8;
}

+ (NSString)mdmFilePath
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058374;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB9D0 != -1)
    dispatch_once(&qword_1000EB9D0, block);
  return (NSString *)(id)qword_1000EB9C8;
}

+ (id)_userDirectory
{
  return CFSTR("/var/mobile/");
}

+ (id)_systemProfileStorageDirectory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058440;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB9E0 != -1)
    dispatch_once(&qword_1000EB9E0, block);
  return (id)qword_1000EB9D8;
}

+ (id)_systemProfileLibraryDirectory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058500;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB9F0 != -1)
    dispatch_once(&qword_1000EB9F0, block);
  return (id)qword_1000EB9E8;
}

+ (id)_managedNonStoreBooksSystemGroupContainer
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)qword_1000EB9F8;
  if (!qword_1000EB9F8)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_systemGroupContainerPathWithGroupIdentifier:", CFSTR("systemgroup.com.apple.media.books.managed")));
    v5 = (void *)qword_1000EB9F8;
    qword_1000EB9F8 = v4;

    v3 = (void *)qword_1000EB9F8;
    if (!qword_1000EB9F8)
    {
      v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6)
        sub_100078530(v6, v7, v8, v9, v10, v11, v12, v13);
      v3 = (void *)qword_1000EB9F8;
    }
  }
  return v3;
}

+ (id)_systemGroupContainerPathWithGroupIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v14 = 1;
  v3 = objc_retainAutorelease(a3);
  v4 = container_system_group_path_for_identifier(0, objc_msgSend(v3, "UTF8String"), &v14);
  if (v4)
  {
    v5 = (void *)v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1000785E4((uint64_t)v3, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v5, 4));
    free(v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100078568((uint64_t)v3, (uint64_t)&v14, v7, v8, v9, v10, v11, v12);
    v6 = 0;
  }

  return v6;
}

@end
