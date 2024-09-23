@implementation HIDTimestampSyncErrorHandler

- (HIDTimestampSyncErrorHandler)initWithSubType:(id)a3
{
  id v5;
  HIDTimestampSyncErrorHandler *v6;
  HIDTimestampSyncErrorHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HIDTimestampSyncErrorHandler;
  v6 = -[HIDTimestampSyncErrorHandler init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subType, a3);
    v7->_consecutiveErrors = 0;
  }

  return v7;
}

- (void)reportFailure:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *subType;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;

  v4 = a3;
  v5 = self->_consecutiveErrors + 1;
  self->_consecutiveErrors = v5;
  if (v5 > 0x1D)
  {
    if (v5 == 30)
    {
      if (qword_1000C90B8 != -1)
        dispatch_once(&qword_1000C90B8, &stru_1000ADD98);
      v13 = (void *)qword_1000C90B0;
      subType = self->_subType;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "processName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("MobileBluetoothServices"), CFSTR("HIDTimestampSync"), subType, 0, v16, 0));

      v18 = objc_msgSend((id)qword_1000C90B0, "snapshotWithSignature:duration:events:payload:actions:reply:", v17, 0, 0, 0, &stru_1000ADDD8, 0.0);
      v19 = qword_1000C9178;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 138412290;
          v42 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sent ABC snapshot for signature %@", (uint8_t *)&v41, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006DC34((uint64_t)v17, v19, v20, v21, v22, v23, v24, v25);
      }
      v26 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006DB64((uint64_t)v4, v26, v27, v28, v29, v30, v31, v32);
      v33 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006DBC8(v33, v34, v35, v36, v37, v38, v39, v40);

    }
  }
  else
  {
    v6 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006DB64((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)reportSuccess
{
  self->_consecutiveErrors = 0;
}

- (BOOL)isMuted
{
  return self->_consecutiveErrors > 0x1D;
}

- (NSString)subType
{
  return self->_subType;
}

- (void)setSubType:(id)a3
{
  objc_storeStrong((id *)&self->_subType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subType, 0);
}

@end
