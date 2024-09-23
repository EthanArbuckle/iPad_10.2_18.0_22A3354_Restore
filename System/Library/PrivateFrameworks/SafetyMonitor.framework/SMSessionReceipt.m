@implementation SMSessionReceipt

- (SMSessionReceipt)initWithSessionID:(id)a3 sessionType:(unint64_t)a4 sessionStartTime:(id)a5 sessionEndTime:(id)a6 receiverHandles:(id)a7 safetyCacheReadStaus:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  SMSessionReceipt *v19;
  SMSessionReceipt *v20;
  SMSessionReceipt *v21;
  NSObject *v22;
  const char *v23;
  id v25;
  objc_super v26;
  uint8_t buf[16];

  v15 = a3;
  v16 = a5;
  v25 = a6;
  v17 = a7;
  v18 = v17;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: sessionID";
LABEL_16:
    _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_17;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: receiverHandles";
    goto LABEL_16;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: startTime";
    goto LABEL_16;
  }
  if (!v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: endTime";
      goto LABEL_16;
    }
LABEL_17:

    v21 = 0;
    goto LABEL_18;
  }
  v26.receiver = self;
  v26.super_class = (Class)SMSessionReceipt;
  v19 = -[SMSessionReceipt init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionID, a3);
    v20->_sessionType = a4;
    objc_storeStrong((id *)&v20->_startTime, a5);
    objc_storeStrong((id *)&v20->_endTime, a6);
    objc_storeStrong((id *)&v20->_receiverHandles, a7);
    v20->_readStatus = a8;
  }
  self = v20;
  v21 = self;
LABEL_18:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionReceipt)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SMSessionReceipt *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionReceiptSessionIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__kSMSessionReceiptSessionTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionReceiptStartTimeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionReceiptEndTimeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionReceiptReceiverHandlesKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMSessionReceiptReadStatusKey"));

  v11 = -[SMSessionReceipt initWithSessionID:sessionType:sessionStartTime:sessionEndTime:receiverHandles:safetyCacheReadStaus:](self, "initWithSessionID:sessionType:sessionStartTime:sessionEndTime:receiverHandles:safetyCacheReadStaus:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SMSessionReceipt sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("__kSMSessionReceiptSessionIDKey"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[SMSessionReceipt sessionType](self, "sessionType"), CFSTR("__kSMSessionReceiptSessionTypeKey"));
  -[SMSessionReceipt startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("__kSMSessionReceiptStartTimeKey"));

  -[SMSessionReceipt endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("__kSMSessionReceiptEndTimeKey"));

  -[SMSessionReceipt receiverHandles](self, "receiverHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("__kSMSessionReceiptReceiverHandlesKey"));

  objc_msgSend(v8, "encodeBool:forKey:", -[SMSessionReceipt readStatus](self, "readStatus"), CFSTR("__kSMSessionReceiptReadStatusKey"));
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMSessionReceipt sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SMSessionReceipt sessionType](self, "sessionType");
  -[SMSessionReceipt receiverHandles](self, "receiverHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionReceipt startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionReceipt endTime](self, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sessionID, %@, sessionType, %d, receiverHandles, %@, startTime, %@, endTime, %@, readStatus, %d"), v4, v5, v6, v8, v10, -[SMSessionReceipt readStatus](self, "readStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (NSArray)receiverHandles
{
  return self->_receiverHandles;
}

- (BOOL)readStatus
{
  return self->_readStatus;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_receiverHandles, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
