@implementation KTDeviceInfo

- (id)modelID
{
  if (qword_1002A7940 != -1)
    dispatch_once(&qword_1002A7940, &stru_1002496F0);
  return (id)qword_1002A7938;
}

- (id)osVersion
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  size_t v8;
  size_t v9;
  _OWORD v10[15];
  __int128 v11;
  _OWORD v12[15];
  __int128 v13;

  v13 = 0u;
  memset(v12, 0, sizeof(v12));
  v9 = 256;
  v2 = sysctlbyname("kern.osrelease", v12, &v9, 0, 0);
  v11 = 0u;
  memset(v10, 0, sizeof(v10));
  v8 = 256;
  if (sysctlbyname("kern.osversion", v10, &v8, 0, 0) | v2
    || (HIBYTE(v13) = 0,
        HIBYTE(v11) = 0,
        (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s (%s)"), v12, v10))) == 0))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "operatingSystemVersionString"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Version"), &stru_1002508B8));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v5));

  return v6;
}

- (id)serialNumber
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;

  v6 = 0;
  v2 = (void *)MGCopyAnswerWithError(CFSTR("SerialNumber"), 0, &v6);
  v4 = objc_opt_class(NSString, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

@end
