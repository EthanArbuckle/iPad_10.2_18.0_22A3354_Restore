@implementation CKKSSecDbAdapter

- (CKKSSecDbAdapter)initWithQueue:(id)a3
{
  id v5;
  CKKSSecDbAdapter *v6;
  CKKSSecDbAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSSecDbAdapter;
  v6 = -[CKKSSecDbAdapter init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)dispatchSyncWithConnection:(__OpaqueSecDbConnection *)a3 readWriteTxion:(BOOL)a4 block:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  CFTypeRef v14;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v21;

  v5 = a4;
  v8 = a5;
  cf = 0;
  if (v5)
    v9 = 5;
  else
    v9 = 3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B4E10;
  v16[3] = &unk_1002DCCC8;
  v18 = v5;
  v16[4] = self;
  v10 = v8;
  v17 = v10;
  v11 = sub_10001AC0C((uint64_t)a3, v9, &cf, (uint64_t)v16);
  if (cf)
  {
    v12 = sub_10000BDF4(CFSTR("ckks"), 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = cf;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "error doing database transaction, major problems ahead: %@", buf, 0xCu);
    }

    v14 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v14);
    }
  }

  return v11;
}

- (void)dispatchSyncWithSQLTransaction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  CFTypeRef v9;
  _QWORD v10[5];
  id v11;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v14;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.securityd.ckks");
  cf = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B4DFC;
  v10[3] = &unk_1002DCCF0;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  sub_100011A30(1, 1, 0, (uint64_t)&cf, (uint64_t)v10);
  if (cf)
  {
    v7 = sub_10000BDF4(CFSTR("ckks"), 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = cf;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "error getting database connection, major problems ahead: %@", buf, 0xCu);
    }

    v9 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v9);
    }
  }

}

- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  CFTypeRef v9;
  _QWORD v10[5];
  id v11;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v14;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.securityd.ckks");
  cf = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B4D5C;
  v10[3] = &unk_1002DCCF0;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  sub_100011A30(0, 1, 0, (uint64_t)&cf, (uint64_t)v10);
  if (cf)
  {
    v7 = sub_10000BDF4(CFSTR("ckks"), 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = cf;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "error getting database connection, major problems ahead: %@", buf, 0xCu);
    }

    v9 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v9);
    }
  }

}

- (BOOL)insideSQLTransaction
{
  BOOL *v2;

  off_100340BB8();
  return *v2;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
