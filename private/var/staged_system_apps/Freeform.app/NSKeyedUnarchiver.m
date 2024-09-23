@implementation NSKeyedUnarchiver

+ (id)crl_securelyUnarchiveRoot:(id)a3 forClass:(Class)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v8 = (void *)objc_opt_class(a1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crl_securelyUnarchiveRoot:forClasses:", v6, v9));

  return v10;
}

+ (id)crl_securelyUnarchiveRoot:(id)a3 forClasses:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v5 = a3;
  v11 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", a4, v5, &v11));
  v7 = v11;
  if (!v6)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101231CD8);
    v8 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100DF08C4((uint64_t)v5, v8, v7);
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101231CF8);
    v9 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
      sub_100DF0850((uint64_t)v5, v9);
  }

  return v6;
}

+ (id)crl_securelyUnarchiveObjectWithFile:(id)a3 ofClasses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v6, 0, &v15));
  v10 = v15;
  if (v8)
  {
    v11 = objc_msgSend((id)objc_opt_class(a1, v9), "crl_securelyUnarchiveRoot:forClasses:", v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101231D18);
    v13 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100DF0968((uint64_t)v6, v13, v10);
    v12 = 0;
  }

  return v12;
}

@end
