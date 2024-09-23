@implementation HAPBTLEServiceSignature

- (HAPBTLEServiceSignature)initWithServiceType:(id)a3 serviceInstanceID:(id)a4 serviceProperties:(unint64_t)a5 linkedServices:(id)a6 authenticated:(BOOL)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  HAPBTLEServiceSignature *v16;
  NSUUID *v17;
  NSUUID *serviceType;
  NSNumber *v19;
  NSNumber *serviceInstanceID;
  NSArray *v21;
  NSArray *linkedServices;
  HAPBTLEServiceSignature *v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  id v31;
  __CFString *v32;
  uint64_t v33;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;

  v12 = a3;
  v13 = a4;
  v15 = a6;
  if (!v12)
  {
    v24 = sub_10007CCE4(0, v14);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = sub_10007CD2C(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      v38 = 2112;
      v39 = (id)objc_opt_class(self, v28);
      v29 = v39;
      v30 = "%{public}@[%@] The service type is requied";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);

    }
LABEL_11:

    v23 = 0;
    goto LABEL_12;
  }
  if (!v13)
  {
    v31 = sub_10007CCE4(0, v14);
    v25 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v32 = sub_10007CD2C(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      v38 = 2112;
      v39 = (id)objc_opt_class(self, v33);
      v29 = v39;
      v30 = "%{public}@[%@] The service instance ID is requied";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v35.receiver = self;
  v35.super_class = (Class)HAPBTLEServiceSignature;
  v16 = -[HAPBTLEServiceSignature init](&v35, "init");
  if (v16)
  {
    v17 = (NSUUID *)objc_msgSend(v12, "copy");
    serviceType = v16->_serviceType;
    v16->_serviceType = v17;

    v19 = (NSNumber *)objc_msgSend(v13, "copy");
    serviceInstanceID = v16->_serviceInstanceID;
    v16->_serviceInstanceID = v19;

    v16->_serviceProperties = a5;
    v21 = (NSArray *)objc_msgSend(v15, "copy");
    linkedServices = v16->_linkedServices;
    v16->_linkedServices = v21;

    v16->_authenticated = a7;
  }
  self = v16;
  v23 = self;
LABEL_12:

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEServiceSignature serviceType](self, "serviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEServiceSignature serviceInstanceID](self, "serviceInstanceID"));
  v5 = -[HAPBTLEServiceSignature serviceProperties](self, "serviceProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEServiceSignature linkedServices](self, "linkedServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Service Signature: Type : %@, InstanceID : %@, Properties : %tu, Linked Services : %@"), v3, v4, v5, v6));

  return v7;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
