@implementation PPUniversalSearchSpotlightFeedback

- (PPUniversalSearchSpotlightFeedback)initWithOfferedCSSICount:(unsigned int)a3 engagedCSSICount:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  PPUniversalSearchSpotlightFeedback *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPUniversalSearchSpotlightFeedback initWithOfferedCSSICount:engagedCSSICount:timestamp:clientIdentifier:clientBundleId:](self, "initWithOfferedCSSICount:engagedCSSICount:timestamp:clientIdentifier:clientBundleId:", v5, v4, v7, 0, v9);

  return v10;
}

- (PPUniversalSearchSpotlightFeedback)initWithOfferedCSSICount:(unsigned int)a3 engagedCSSICount:(unsigned int)a4 timestamp:(id)a5 clientIdentifier:(id)a6 clientBundleId:(id)a7
{
  id v13;
  id v14;
  id v15;
  PPUniversalSearchSpotlightFeedback *v16;
  PPUniversalSearchSpotlightFeedback *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PPUniversalSearchSpotlightFeedback;
  v16 = -[PPUniversalSearchSpotlightFeedback init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_offeredCSSICount = a3;
    v16->_engagedCSSICount = a4;
    objc_storeStrong((id *)&v16->_timestamp, a5);
    objc_storeStrong((id *)&v17->_clientIdentifier, a6);
    objc_storeStrong((id *)&v17->_clientBundleId, a7);
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = self->_engagedCSSICount - (unint64_t)self->_offeredCSSICount + 32 * self->_offeredCSSICount;
  v4 = -[NSDate hash](self->_timestamp, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_clientIdentifier, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_clientBundleId, "hash") - v5 + 32 * v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t offeredCSSICount;
  id v5;

  offeredCSSICount = self->_offeredCSSICount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", offeredCSSICount, CFSTR("offeredCSSICount"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_engagedCSSICount, CFSTR("engagedCSSICount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleId, CFSTR("clientBundleId"));

}

- (PPUniversalSearchSpotlightFeedback)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PPUniversalSearchSpotlightFeedback *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("offeredCSSICount"));
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("engagedCSSICount"));
  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  pp_default_log_handle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("timestamp"), v4, 1, CFSTR("PPErrorDomain"), 23, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = (void *)MEMORY[0x1E0D81610];
      v15 = objc_opt_class();
      pp_default_log_handle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("clientIdentifier"), v4, 0, CFSTR("PPErrorDomain"), 23, v16);
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12
        || (objc_msgSend(v4, "error"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, !v21))
      {
        v17 = (void *)MEMORY[0x1E0D81610];
        v18 = objc_opt_class();
        pp_default_log_handle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("clientBundleId"), v4, 0, CFSTR("PPErrorDomain"), 23, v19);
        v20 = objc_claimAutoreleasedReturnValue();

        if (v20
          || (objc_msgSend(v4, "error"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23))
        {
          self = -[PPUniversalSearchSpotlightFeedback initWithOfferedCSSICount:engagedCSSICount:timestamp:clientIdentifier:clientBundleId:](self, "initWithOfferedCSSICount:engagedCSSICount:timestamp:clientIdentifier:clientBundleId:", v5, v6, v10, v12, v20);
          v13 = self;
LABEL_17:

          goto LABEL_18;
        }
        pp_universal_search_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "error");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v27;
          _os_log_error_impl(&dword_18BE3A000, v24, OS_LOG_TYPE_ERROR, "PPUniversalSearchSpotlightFeedback: failed to decode bundle ID: %@", buf, 0xCu);

        }
        v20 = 0;
      }
      else
      {
        pp_universal_search_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "error");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v22;
          _os_log_error_impl(&dword_18BE3A000, v20, OS_LOG_TYPE_ERROR, "PPUniversalSearchSpotlightFeedback: failed to decode client identifier: %@", buf, 0xCu);

        }
      }
      v13 = 0;
      goto LABEL_17;
    }
  }
  pp_universal_search_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v26;
    _os_log_error_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_ERROR, "PPUniversalSearchSpotlightFeedback: failed to decode timestamp: %@", buf, 0xCu);

  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PPUniversalSearchSpotlightFeedback *v4;
  PPUniversalSearchSpotlightFeedback *v5;
  BOOL v6;

  v4 = (PPUniversalSearchSpotlightFeedback *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPUniversalSearchSpotlightFeedback isEqualToPPUniversalSearchSpotlightFeedback:](self, "isEqualToPPUniversalSearchSpotlightFeedback:", v5);

  return v6;
}

- (BOOL)isEqualToPPUniversalSearchSpotlightFeedback:(id)a3
{
  id *v4;
  id *v5;
  NSDate *timestamp;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  char v10;
  NSString *clientIdentifier;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  char v16;
  NSString *v18;
  NSString *v19;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_offeredCSSICount != *((_DWORD *)v4 + 2) || self->_engagedCSSICount != *((_DWORD *)v4 + 3))
    goto LABEL_10;
  timestamp = self->_timestamp;
  v7 = (NSDate *)v4[4];
  if (timestamp == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = timestamp;
    v10 = -[NSDate isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_10;
  }
  clientIdentifier = self->_clientIdentifier;
  v12 = (NSString *)v5[2];
  if (clientIdentifier == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = clientIdentifier;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_10:
      v16 = 0;
      goto LABEL_11;
    }
  }
  v18 = self->_clientBundleId;
  v19 = v18;
  if (v18 == v5[3])
    v16 = 1;
  else
    v16 = -[NSString isEqual:](v18, "isEqual:");

LABEL_11:
  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: {"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  engagedCSSICount : %u "), self->_engagedCSSICount);
  objc_msgSend(v3, "appendFormat:", CFSTR("  offeredCSSICount : %u "), self->_offeredCSSICount);
  objc_msgSend(v3, "appendFormat:", CFSTR("  clientIdentifier : %@, "), self->_clientIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("  clientBundleId : %@, "), self->_clientBundleId);
  objc_msgSend(v3, "appendFormat:", CFSTR("  timestamp : %@, "), self->_timestamp);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (unsigned)offeredCSSICount
{
  return self->_offeredCSSICount;
}

- (unsigned)engagedCSSICount
{
  return self->_engagedCSSICount;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
