@implementation SMActiveSessionDetails

- (SMActiveSessionDetails)initWithSessionID:(id)a3 activeDeviceIdentifier:(id)a4 cacheReleasedDate:(id)a5 scheduledSendGUID:(id)a6 receiverHandles:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SMActiveSessionDetails *v18;
  id *p_isa;
  SMActiveSessionDetails *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  NSObject *v25;
  id v26;
  objc_super v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v26 = a6;
  v16 = a7;
  v17 = v16;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v20 = 0;
LABEL_11:
      v23 = v26;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: sessionID";
LABEL_17:
    _os_log_error_impl(&dword_245521000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_10;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: activeDeviceIdentifier";
    goto LABEL_17;
  }
  if (v16)
  {
    v27.receiver = self;
    v27.super_class = (Class)SMActiveSessionDetails;
    v18 = -[SMActiveSessionDetails init](&v27, sel_init);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_sessionID, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v20 = self;
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  v23 = v26;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_245521000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles", buf, 2u);
  }

  v20 = 0;
LABEL_12:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SMActiveSessionDetails sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("__kSMActiveSessionDetailsSessionIDKey"));

  -[SMActiveSessionDetails activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("__kSMActiveSessionDetailsActiveDeviceIdentifierKey"));

  -[SMActiveSessionDetails cacheReleasedDate](self, "cacheReleasedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("__kSMActiveSessionDetailsCacheReleasedDateKey"));

  -[SMActiveSessionDetails scheduledSendGUID](self, "scheduledSendGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("__kSMActiveSessionDetailsScheduledSendGUIDKey"));

  -[SMActiveSessionDetails receiverHandles](self, "receiverHandles");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("__kSMActiveSessionDetailsReceiverHandlesKey"));

}

- (SMActiveSessionDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SMActiveSessionDetails *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMActiveSessionDetailsSessionIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMActiveSessionDetailsActiveDeviceIdentifierKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMActiveSessionDetailsCacheReleasedDateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMActiveSessionDetailsScheduledSendGUIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("__kSMActiveSessionDetailsReceiverHandlesKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SMActiveSessionDetails initWithSessionID:activeDeviceIdentifier:cacheReleasedDate:scheduledSendGUID:receiverHandles:](self, "initWithSessionID:activeDeviceIdentifier:cacheReleasedDate:scheduledSendGUID:receiverHandles:", v5, v6, v7, v8, v12);
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMActiveSessionDetails sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMActiveSessionDetails activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMActiveSessionDetails cacheReleasedDate](self, "cacheReleasedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMActiveSessionDetails scheduledSendGUID](self, "scheduledSendGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMActiveSessionDetails receiverHandles](self, "receiverHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sessionID, %@, activeDeviceID, %@, cacheReleasedDate, %@, scheduledSendGUID, %@, receiverHandles, %@"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (NSUUID)activeDeviceIdentifier
{
  return self->_activeDeviceIdentifier;
}

- (NSDate)cacheReleasedDate
{
  return self->_cacheReleasedDate;
}

- (NSString)scheduledSendGUID
{
  return self->_scheduledSendGUID;
}

- (NSArray)receiverHandles
{
  return self->_receiverHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverHandles, 0);
  objc_storeStrong((id *)&self->_scheduledSendGUID, 0);
  objc_storeStrong((id *)&self->_cacheReleasedDate, 0);
  objc_storeStrong((id *)&self->_activeDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
