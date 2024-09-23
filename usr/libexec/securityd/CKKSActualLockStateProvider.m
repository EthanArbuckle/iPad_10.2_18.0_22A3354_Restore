@implementation CKKSActualLockStateProvider

- (CKKSActualLockStateProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKSActualLockStateProvider;
  return -[CKKSActualLockStateProvider init](&v3, "init");
}

- (BOOL)queryAKSLocked
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  CFTypeRef v5;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v9;

  cf = 0;
  *(_DWORD *)buf = -1431655766;
  v2 = sub_100025F30(dword_1003414E0, buf);
  if (sub_10003252C(v2, &cf, CFSTR("aks_get_lock_state failed: %x"), v2))
    return buf[0] & 1;
  v3 = sub_10000BDF4(CFSTR("ckks"), 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = cf;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "error querying lock state: %@", buf, 0xCu);
  }

  v5 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v5);
  }
  return 1;
}

@end
