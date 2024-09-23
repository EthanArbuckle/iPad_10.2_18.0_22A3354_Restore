@implementation HAPSuspendedAccessoryIP

- (HAPSuspendedAccessoryIP)initWithName:(id)a3 identifier:(id)a4 wakeTuples:(id)a5 queue:(id)a6
{
  id v10;
  HAPSuspendedAccessoryIP *v11;
  void *v12;
  uint64_t v13;
  NSArray *wakeTuples;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HAPSuspendedAccessoryIP;
  v11 = -[HAPSuspendedAccessory initWithName:identifier:type:queue:](&v16, "initWithName:identifier:type:queue:", a3, a4, 1, a6);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    wakeTuples = v11->_wakeTuples;
    v11->_wakeTuples = (NSArray *)v13;

    v11->_timeout = 10000000000;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[HAPSuspendedAccessoryIP _closeConnection](self, "_closeConnection");
  v3.receiver = self;
  v3.super_class = (Class)HAPSuspendedAccessoryIP;
  -[HAPSuspendedAccessoryIP dealloc](&v3, "dealloc");
}

- (void)wakeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPSuspendedAccessory queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006B10;
  v7[3] = &unk_1002369C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_wakeWithTuple:(id)a3 dnsName:(id)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = (unint64_t)a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPSuspendedAccessory queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wakeAddress"));
  v10 = v7 | v9;

  if (v10)
  {
    v12 = (id)v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wakeAddress"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wakeAddress"));
      v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wake://%@%s%@"), v14, "\x1E", v12));

      v12 = (id)v15;
    }
    v16 = objc_retainAutorelease(v12);
    v17 = objc_msgSend(v16, "UTF8String");
    v18 = objc_msgSend(v6, "wakePort");
    v19 = -[HAPSuspendedAccessoryIP timeout](self, "timeout");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSuspendedAccessory queue](self, "queue"));
    v21 = AsyncConnection_Connect(&self->_connection, v17, v18, 0, v19, 0x8000, 0x8000, 0, 0, 0, self, v20);

    if ((_DWORD)v21)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v21));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Connection failed"), 0, 0, v23));

    }
    else
    {
      v11 = 0;
    }
    v24 = sub_10007CCE4(0, v22);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = sub_10007CD2C(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
      *(_DWORD *)buf = 138543874;
      v31 = v27;
      v32 = 2112;
      v33 = v28;
      v34 = 2048;
      v35 = objc_msgSend(v11, "code");
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@The suspended accessory sent wake command with error: %{key:errorDomain}@ %{key:errorCode}ld", buf, 0x20u);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 9));
  }

  return v11;
}

- (void)_closeConnection
{
  AsyncConnection *connection;

  connection = self->_connection;
  if (connection)
  {
    AsyncConnection_Release(connection, a2);
    self->_connection = 0;
  }
}

+ (id)logCategory
{
  if (qword_100271630 != -1)
    dispatch_once(&qword_100271630, &stru_100236A08);
  return (id)qword_100271638;
}

- (NSArray)wakeTuples
{
  return self->_wakeTuples;
}

- (NSString)dnsName
{
  return self->_dnsName;
}

- (void)setDnsName:(id)a3
{
  objc_storeStrong((id *)&self->_dnsName, a3);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsName, 0);
  objc_storeStrong((id *)&self->_wakeTuples, 0);
}

@end
