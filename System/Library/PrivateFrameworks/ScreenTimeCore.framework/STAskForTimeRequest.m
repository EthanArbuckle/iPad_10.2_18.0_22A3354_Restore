@implementation STAskForTimeRequest

- (STAskForTimeRequest)initWithUsageType:(int64_t)a3 requestedResourceIdentifier:(id)a4
{
  id v6;
  STAskForTimeRequest *v7;
  uint64_t v8;
  NSString *requestedResourceIdentifier;
  uint64_t v10;
  NSDate *timeStamp;
  NSNumber *timeRequested;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STAskForTimeRequest;
  v7 = -[STAskForTimeRequest init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    requestedResourceIdentifier = v7->_requestedResourceIdentifier;
    v7->_requestedResourceIdentifier = (NSString *)v8;

    v7->_usageType = a3;
    v10 = objc_opt_new();
    timeStamp = v7->_timeStamp;
    v7->_timeStamp = (NSDate *)v10;

    timeRequested = v7->_timeRequested;
    v7->_timeRequested = (NSNumber *)&unk_1E938D928;

  }
  return v7;
}

- (STAskForTimeRequest)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  STAskForTimeRequest *v9;
  void *v10;
  uint64_t v11;
  STAskForTimeRequest *v12;
  uint64_t v13;
  NSUUID *requestIdentifier;
  void *v15;
  uint64_t v16;
  NSString *resourceDisplayName;
  uint64_t v18;
  NSNumber *timeRequested;
  void *v20;
  uint64_t v21;
  NSNumber *requestingUserDSID;
  void *v23;
  uint64_t v24;
  NSString *requestingUserDisplayName;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestedResourceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeStamp"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageType"));
      v9 = (STAskForTimeRequest *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        v12 = -[STAskForTimeRequest initWithUsageType:requestedResourceIdentifier:](self, "initWithUsageType:requestedResourceIdentifier:", v11, v6);
        if (v12)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestIdentifier"));
          v13 = objc_claimAutoreleasedReturnValue();
          requestIdentifier = v12->_requestIdentifier;
          v12->_requestIdentifier = (NSUUID *)v13;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceDisplayName"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "copy");
          resourceDisplayName = v12->_resourceDisplayName;
          v12->_resourceDisplayName = (NSString *)v16;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeRequested"));
          v18 = objc_claimAutoreleasedReturnValue();
          timeRequested = v12->_timeRequested;
          v12->_timeRequested = (NSNumber *)v18;

          objc_storeStrong((id *)&v12->_timeStamp, v8);
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("oneMoreMinute"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v12->_oneMoreMinute = objc_msgSend(v20, "BOOLValue");

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestingUserDSID"));
          v21 = objc_claimAutoreleasedReturnValue();
          requestingUserDSID = v12->_requestingUserDSID;
          v12->_requestingUserDSID = (NSNumber *)v21;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestingUserDisplayName"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "copy");
          requestingUserDisplayName = v12->_requestingUserDisplayName;
          v12->_requestingUserDisplayName = (NSString *)v24;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deliverQuietly"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v12->_deliverQuietly = objc_msgSend(v26, "BOOLValue");

        }
        self = v12;
        v9 = self;
      }
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setOneMoreMinute:(BOOL)a3
{
  NSNumber *timeRequested;

  if (a3)
  {
    timeRequested = self->_timeRequested;
    self->_timeRequested = (NSNumber *)&unk_1E938D940;

  }
  self->_oneMoreMinute = a3;
}

- (STAskForTimeRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  STAskForTimeRequest *v9;
  uint64_t v10;
  NSUUID *requestIdentifier;
  void *v12;
  uint64_t v13;
  NSString *resourceDisplayName;
  uint64_t v15;
  NSNumber *timeRequested;
  uint64_t v17;
  NSNumber *requestingUserDSID;
  uint64_t v19;
  NSString *requestingUserDisplayName;
  STAskForTimeRequest *v21;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedResourceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStamp"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || (objc_msgSend(v4, "containsValueForKey:", CFSTR("usageType")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v22);

    v21 = 0;
  }
  else
  {
    v9 = -[STAskForTimeRequest initWithUsageType:requestedResourceIdentifier:](self, "initWithUsageType:requestedResourceIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("usageType")), v5);
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
      v10 = objc_claimAutoreleasedReturnValue();
      requestIdentifier = v9->_requestIdentifier;
      v9->_requestIdentifier = (NSUUID *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceDisplayName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      resourceDisplayName = v9->_resourceDisplayName;
      v9->_resourceDisplayName = (NSString *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeRequested"));
      v15 = objc_claimAutoreleasedReturnValue();
      timeRequested = v9->_timeRequested;
      v9->_timeRequested = (NSNumber *)v15;

      objc_storeStrong((id *)&v9->_timeStamp, v7);
      v9->_oneMoreMinute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("oneMoreMinute"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingUserDSID"));
      v17 = objc_claimAutoreleasedReturnValue();
      requestingUserDSID = v9->_requestingUserDSID;
      v9->_requestingUserDSID = (NSNumber *)v17;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingUserDisplayName"));
      v19 = objc_claimAutoreleasedReturnValue();
      requestingUserDisplayName = v9->_requestingUserDisplayName;
      v9->_requestingUserDisplayName = (NSString *)v19;

      v9->_deliverQuietly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deliverQuietly"));
    }
    self = v9;
    v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestIdentifier;
  id v5;

  requestIdentifier = self->_requestIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usageType, CFSTR("usageType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedResourceIdentifier, CFSTR("requestedResourceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceDisplayName, CFSTR("resourceDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeRequested, CFSTR("timeRequested"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_oneMoreMinute, CFSTR("oneMoreMinute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeStamp, CFSTR("timeStamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingUserDSID, CFSTR("requestingUserDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingUserDisplayName, CFSTR("requestingUserDisplayName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deliverQuietly, CFSTR("deliverQuietly"));

}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
  -[STAskForTimeRequest requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("requestIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STAskForTimeRequest usageType](self, "usageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("usageType"));

  -[STAskForTimeRequest requestedResourceIdentifier](self, "requestedResourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("requestedResourceIdentifier"));

  -[STAskForTimeRequest resourceDisplayName](self, "resourceDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resourceDisplayName"));

  -[STAskForTimeRequest timeRequested](self, "timeRequested");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("timeRequested"));

  -[STAskForTimeRequest timeStamp](self, "timeStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("timeStamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STAskForTimeRequest oneMoreMinute](self, "oneMoreMinute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("oneMoreMinute"));

  -[STAskForTimeRequest requestingUserDSID](self, "requestingUserDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requestingUserDSID"));

  -[STAskForTimeRequest requestingUserDisplayName](self, "requestingUserDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestingUserDisplayName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STAskForTimeRequest deliverQuietly](self, "deliverQuietly"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("deliverQuietly"));

  return (NSDictionary *)v3;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (NSString)requestedResourceIdentifier
{
  return self->_requestedResourceIdentifier;
}

- (NSString)resourceDisplayName
{
  return self->_resourceDisplayName;
}

- (void)setResourceDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)timeRequested
{
  return self->_timeRequested;
}

- (void)setTimeRequested:(id)a3
{
  objc_storeStrong((id *)&self->_timeRequested, a3);
}

- (BOOL)oneMoreMinute
{
  return self->_oneMoreMinute;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSNumber)requestingUserDSID
{
  return self->_requestingUserDSID;
}

- (void)setRequestingUserDSID:(id)a3
{
  objc_storeStrong((id *)&self->_requestingUserDSID, a3);
}

- (NSString)requestingUserDisplayName
{
  return self->_requestingUserDisplayName;
}

- (void)setRequestingUserDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)deliverQuietly
{
  return self->_deliverQuietly;
}

- (void)setDeliverQuietly:(BOOL)a3
{
  self->_deliverQuietly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingUserDisplayName, 0);
  objc_storeStrong((id *)&self->_requestingUserDSID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_timeRequested, 0);
  objc_storeStrong((id *)&self->_resourceDisplayName, 0);
  objc_storeStrong((id *)&self->_requestedResourceIdentifier, 0);
}

@end
