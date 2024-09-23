@implementation HAPBTLECharacteristicSignature

- (HAPBTLECharacteristicSignature)initWithCharacteristicType:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 characteristicProperties:(unint64_t)a6 characteristicMetadata:(id)a7 authenticated:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  HAPBTLECharacteristicSignature *v20;
  NSUUID *v21;
  NSUUID *characteristicType;
  NSNumber *v23;
  NSNumber *serviceInstanceID;
  NSUUID *v25;
  NSUUID *serviceType;
  HAPBTLECharacteristicSignature *v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  id v35;
  __CFString *v36;
  uint64_t v37;
  id v38;
  __CFString *v39;
  uint64_t v40;
  id v41;
  __CFString *v42;
  uint64_t v43;
  id v44;
  __CFString *v45;
  uint64_t v46;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v19 = v17;
  if (!v14)
  {
    v28 = sub_10007CCE4(0, v18);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v30 = sub_10007CD2C(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138543618;
    v50 = v31;
    v51 = 2112;
    v52 = (id)objc_opt_class(self, v32);
    v33 = v52;
    v34 = "%{public}@[%@] The characteristic type is requied";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);

    goto LABEL_20;
  }
  if (!v15)
  {
    v35 = sub_10007CCE4(0, v18);
    v29 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v36 = sub_10007CD2C(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v36);
    *(_DWORD *)buf = 138543618;
    v50 = v31;
    v51 = 2112;
    v52 = (id)objc_opt_class(self, v37);
    v33 = v52;
    v34 = "%{public}@[%@] The service instance ID is requied";
    goto LABEL_19;
  }
  if (!v16)
  {
    v38 = sub_10007CCE4(0, v18);
    v29 = objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v39 = sub_10007CD2C(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v39);
    *(_DWORD *)buf = 138543618;
    v50 = v31;
    v51 = 2112;
    v52 = (id)objc_opt_class(self, v40);
    v33 = v52;
    v34 = "%{public}@[%@] The service type is requied";
    goto LABEL_19;
  }
  if (!a6)
  {
    v41 = sub_10007CCE4(0, v18);
    v29 = objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v42 = sub_10007CD2C(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v42);
    *(_DWORD *)buf = 138543618;
    v50 = v31;
    v51 = 2112;
    v52 = (id)objc_opt_class(self, v43);
    v33 = v52;
    v34 = "%{public}@[%@] The characteristic properties is requied";
    goto LABEL_19;
  }
  if (!v17)
  {
    v44 = sub_10007CCE4(0, v18);
    v29 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v45 = sub_10007CD2C(0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138543618;
      v50 = v31;
      v51 = 2112;
      v52 = (id)objc_opt_class(self, v46);
      v33 = v52;
      v34 = "%{public}@[%@] The characteristic metadata is requied";
      goto LABEL_19;
    }
LABEL_20:

    v27 = 0;
    goto LABEL_21;
  }
  v48.receiver = self;
  v48.super_class = (Class)HAPBTLECharacteristicSignature;
  v20 = -[HAPBTLECharacteristicSignature init](&v48, "init");
  if (v20)
  {
    v21 = (NSUUID *)objc_msgSend(v14, "copy");
    characteristicType = v20->_characteristicType;
    v20->_characteristicType = v21;

    v23 = (NSNumber *)objc_msgSend(v15, "copy");
    serviceInstanceID = v20->_serviceInstanceID;
    v20->_serviceInstanceID = v23;

    v25 = (NSUUID *)objc_msgSend(v16, "copy");
    serviceType = v20->_serviceType;
    v20->_serviceType = v25;

    v20->_characteristicProperties = a6;
    objc_storeStrong((id *)&v20->_characteristicMetadata, a7);
    v20->_authenticated = a8;
  }
  self = v20;
  v27 = self;
LABEL_21:

  return v27;
}

- (NSUUID)characteristicType
{
  return self->_characteristicType;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
