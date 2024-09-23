@implementation RCConfigurationResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)treatmentIDs
{
  return self->_treatmentIDs;
}

- (NSArray)segmentSetIDs
{
  return self->_segmentSetIDs;
}

- (RCUserSegmentationConfiguration)userSegmentationConfiguration
{
  return self->_userSegmentationConfiguration;
}

- (RCConfigurationResource)initWithCoder:(id)a3
{
  id v4;
  RCConfigurationResource *v5;
  uint64_t v6;
  NSString *requestKey;
  uint64_t v8;
  NSData *gzippedConfigurationData;
  uint64_t v10;
  RCUserSegmentationConfiguration *userSegmentationConfiguration;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *treatmentIDs;
  uint64_t v17;
  NSArray *segmentSetIDs;
  uint64_t v19;
  NSString *userID;
  uint64_t v21;
  NSString *storefrontID;
  uint64_t v23;
  NSString *configurationID;
  uint64_t v25;
  NSString *contentHash;
  uint64_t v27;
  NSString *lastModifiedString;
  uint64_t v29;
  NSString *etag;
  uint64_t v31;
  NSString *lastModifiedFallbackString;
  uint64_t v33;
  NSDate *lastFetchedDate;
  uint64_t v35;
  NSNumber *fallbackMaxAge;
  uint64_t v37;
  NSNumber *endpointMaxAge;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)RCConfigurationResource;
  v5 = -[RCConfigurationResource init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestKey = v5->_requestKey;
    v5->_requestKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gzippedConfigurationData"));
    v8 = objc_claimAutoreleasedReturnValue();
    gzippedConfigurationData = v5->_gzippedConfigurationData;
    v5->_gzippedConfigurationData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userSegmentationConfiguration"));
    v10 = objc_claimAutoreleasedReturnValue();
    userSegmentationConfiguration = v5->_userSegmentationConfiguration;
    v5->_userSegmentationConfiguration = (RCUserSegmentationConfiguration *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("treatmentIDs"));
    v15 = objc_claimAutoreleasedReturnValue();
    treatmentIDs = v5->_treatmentIDs;
    v5->_treatmentIDs = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("segmentSetIDs"));
    v17 = objc_claimAutoreleasedReturnValue();
    segmentSetIDs = v5->_segmentSetIDs;
    v5->_segmentSetIDs = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
    v19 = objc_claimAutoreleasedReturnValue();
    userID = v5->_userID;
    v5->_userID = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefrontID"));
    v21 = objc_claimAutoreleasedReturnValue();
    storefrontID = v5->_storefrontID;
    v5->_storefrontID = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationID"));
    v23 = objc_claimAutoreleasedReturnValue();
    configurationID = v5->_configurationID;
    v5->_configurationID = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentHash"));
    v25 = objc_claimAutoreleasedReturnValue();
    contentHash = v5->_contentHash;
    v5->_contentHash = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedString"));
    v27 = objc_claimAutoreleasedReturnValue();
    lastModifiedString = v5->_lastModifiedString;
    v5->_lastModifiedString = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("etag"));
    v29 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedFallbackString"));
    v31 = objc_claimAutoreleasedReturnValue();
    lastModifiedFallbackString = v5->_lastModifiedFallbackString;
    v5->_lastModifiedFallbackString = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFetchedDate"));
    v33 = objc_claimAutoreleasedReturnValue();
    lastFetchedDate = v5->_lastFetchedDate;
    v5->_lastFetchedDate = (NSDate *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackMaxAge"));
    v35 = objc_claimAutoreleasedReturnValue();
    fallbackMaxAge = v5->_fallbackMaxAge;
    v5->_fallbackMaxAge = (NSNumber *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointMaxAge"));
    v37 = objc_claimAutoreleasedReturnValue();
    endpointMaxAge = v5->_endpointMaxAge;
    v5->_endpointMaxAge = (NSNumber *)v37;

  }
  return v5;
}

- (NSString)requestKey
{
  return self->_requestKey;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserSegmentationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_userSegmentationConfiguration, a3);
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (void)setTreatmentIDs:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentIDs, a3);
}

- (void)setSegmentSetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_segmentSetIDs, a3);
}

- (void)setRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_requestKey, a3);
}

- (void)setLastModifiedString:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedString, a3);
}

- (void)setLastFetchedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFetchedDate, a3);
}

- (void)setGzippedConfigurationData:(id)a3
{
  objc_storeStrong((id *)&self->_gzippedConfigurationData, a3);
}

- (void)setEndpointMaxAge:(id)a3
{
  objc_storeStrong((id *)&self->_endpointMaxAge, a3);
}

- (void)setContentHash:(id)a3
{
  objc_storeStrong((id *)&self->_contentHash, a3);
}

- (void)setConfigurationID:(id)a3
{
  objc_storeStrong((id *)&self->_configurationID, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[RCConfigurationResource requestKey](self, "requestKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestKey"));

  -[RCConfigurationResource gzippedConfigurationData](self, "gzippedConfigurationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("gzippedConfigurationData"));

  -[RCConfigurationResource userSegmentationConfiguration](self, "userSegmentationConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userSegmentationConfiguration"));

  -[RCConfigurationResource treatmentIDs](self, "treatmentIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("treatmentIDs"));

  -[RCConfigurationResource segmentSetIDs](self, "segmentSetIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("segmentSetIDs"));

  -[RCConfigurationResource userID](self, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("userID"));

  -[RCConfigurationResource storefrontID](self, "storefrontID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("storefrontID"));

  -[RCConfigurationResource configurationID](self, "configurationID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("configurationID"));

  -[RCConfigurationResource contentHash](self, "contentHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("contentHash"));

  -[RCConfigurationResource lastModifiedString](self, "lastModifiedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("lastModifiedString"));

  -[RCConfigurationResource etag](self, "etag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("etag"));

  -[RCConfigurationResource lastModifiedFallbackString](self, "lastModifiedFallbackString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("lastModifiedFallbackString"));

  -[RCConfigurationResource lastFetchedDate](self, "lastFetchedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("lastFetchedDate"));

  -[RCConfigurationResource fallbackMaxAge](self, "fallbackMaxAge");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("fallbackMaxAge"));

  -[RCConfigurationResource endpointMaxAge](self, "endpointMaxAge");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("endpointMaxAge"));

}

- (BOOL)isExpiredWithMaxTTL:(double)a3 allowedToReachEndpoint:(BOOL)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;

  if (a4)
    -[RCConfigurationResource endpointMaxAge](self, "endpointMaxAge");
  else
    -[RCConfigurationResource fallbackMaxAge](self, "fallbackMaxAge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  if (v7 != 0.0)
  {
    objc_msgSend(v6, "doubleValue");
    a3 = fmax(a3, v8);
  }
  -[RCConfigurationResource lastFetchedDate](self, "lastFetchedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rc_timeIntervalUntilNow");
  v11 = v10;

  v12 = v11 < 0.0 || v11 >= a3;
  return v12;
}

- (NSDate)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (NSNumber)endpointMaxAge
{
  return self->_endpointMaxAge;
}

- (NSString)lastModifiedString
{
  return self->_lastModifiedString;
}

- (NSString)configurationID
{
  return self->_configurationID;
}

- (NSString)lastModifiedFallbackString
{
  return self->_lastModifiedFallbackString;
}

- (NSNumber)fallbackMaxAge
{
  return self->_fallbackMaxAge;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSString)contentHash
{
  return self->_contentHash;
}

- (NSData)configurationData
{
  void *v2;
  void *v3;

  -[RCConfigurationResource gzippedConfigurationData](self, "gzippedConfigurationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rc_gzipInflate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)gzippedConfigurationData
{
  return self->_gzippedConfigurationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointMaxAge, 0);
  objc_storeStrong((id *)&self->_fallbackMaxAge, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedFallbackString, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_lastModifiedString, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_configurationID, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_userSegmentationConfiguration, 0);
  objc_storeStrong((id *)&self->_gzippedConfigurationData, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[RCConfigurationResource gzippedConfigurationData](self, "gzippedConfigurationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gzippedConfigurationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[RCConfigurationResource requestKey](self, "requestKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[RCConfigurationResource userSegmentationConfiguration](self, "userSegmentationConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "userSegmentationConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          v48 = v11;
          v50 = v10;
          v12 = (void *)MEMORY[0x1E0DE7910];
          -[RCConfigurationResource treatmentIDs](self, "treatmentIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "treatmentIDs");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "rc_object:isEqualToObject:", v13))
          {
            v45 = v13;
            v14 = (void *)MEMORY[0x1E0DE7910];
            -[RCConfigurationResource segmentSetIDs](self, "segmentSetIDs");
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "segmentSetIDs");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)v15;
            if (objc_msgSend(v14, "rc_object:isEqualToObject:", v15))
            {
              -[RCConfigurationResource userID](self, "userID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "userID");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v50;
              v44 = v16;
              if (objc_msgSend(v16, "isEqualToString:"))
              {
                -[RCConfigurationResource storefrontID](self, "storefrontID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "storefrontID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v17;
                if (objc_msgSend(v17, "isEqualToString:"))
                {
                  -[RCConfigurationResource configurationID](self, "configurationID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "configurationID");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = v18;
                  if (objc_msgSend(v18, "isEqualToString:"))
                  {
                    -[RCConfigurationResource contentHash](self, "contentHash");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "contentHash");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = v19;
                    if (objc_msgSend(v19, "isEqualToString:"))
                    {
                      -[RCConfigurationResource lastModifiedString](self, "lastModifiedString");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "lastModifiedString");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = v20;
                      if (objc_msgSend(v20, "isEqualToString:"))
                      {
                        -[RCConfigurationResource etag](self, "etag");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v5, "etag");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = v21;
                        if (objc_msgSend(v21, "isEqualToString:"))
                        {
                          -[RCConfigurationResource lastModifiedFallbackString](self, "lastModifiedFallbackString");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "lastModifiedFallbackString");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v22, "isEqualToString:"))
                          {
                            -[RCConfigurationResource lastFetchedDate](self, "lastFetchedDate");
                            v23 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "lastFetchedDate");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v23, "isEqual:"))
                            {
                              -[RCConfigurationResource fallbackMaxAge](self, "fallbackMaxAge");
                              v24 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "fallbackMaxAge");
                              v29 = (void *)objc_claimAutoreleasedReturnValue();
                              v30 = v24;
                              if (objc_msgSend(v24, "isEqual:"))
                              {
                                -[RCConfigurationResource endpointMaxAge](self, "endpointMaxAge");
                                v28 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v5, "endpointMaxAge");
                                v25 = (void *)objc_claimAutoreleasedReturnValue();
                                v26 = objc_msgSend(v28, "isEqual:", v25);

                              }
                              else
                              {
                                v26 = 0;
                              }

                            }
                            else
                            {
                              v26 = 0;
                            }

                            v10 = v50;
                          }
                          else
                          {
                            v26 = 0;
                          }
                          v13 = v45;

                        }
                        else
                        {
                          v26 = 0;
                          v13 = v45;
                        }
                        v11 = v48;

                      }
                      else
                      {
                        v26 = 0;
                        v13 = v45;
                        v11 = v48;
                      }

                    }
                    else
                    {
                      v26 = 0;
                      v13 = v45;
                      v11 = v48;
                    }

                  }
                  else
                  {
                    v26 = 0;
                    v13 = v45;
                    v11 = v48;
                  }

                }
                else
                {
                  v26 = 0;
                  v13 = v45;
                  v11 = v48;
                }

              }
              else
              {
                v26 = 0;
                v13 = v45;
                v11 = v48;
              }

            }
            else
            {
              v26 = 0;
              v10 = v50;
              v13 = v45;
              v11 = v48;
            }

          }
          else
          {
            v26 = 0;
            v11 = v48;
          }

        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  -[RCConfigurationResource gzippedConfigurationData](self, "gzippedConfigurationData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v33, "hash");
  -[RCConfigurationResource requestKey](self, "requestKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v32, "hash") ^ v3;
  -[RCConfigurationResource userSegmentationConfiguration](self, "userSegmentationConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v31, "hash");
  -[RCConfigurationResource treatmentIDs](self, "treatmentIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v30, "hash");
  -[RCConfigurationResource segmentSetIDs](self, "segmentSetIDs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v29, "hash");
  -[RCConfigurationResource userID](self, "userID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v28, "hash");
  -[RCConfigurationResource storefrontID](self, "storefrontID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v27, "hash");
  -[RCConfigurationResource configurationID](self, "configurationID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v26, "hash");
  -[RCConfigurationResource contentHash](self, "contentHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[RCConfigurationResource lastModifiedString](self, "lastModifiedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RCConfigurationResource etag](self, "etag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9 ^ v14 ^ objc_msgSend(v15, "hash");
  -[RCConfigurationResource lastModifiedFallbackString](self, "lastModifiedFallbackString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[RCConfigurationResource lastFetchedDate](self, "lastFetchedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[RCConfigurationResource fallbackMaxAge](self, "fallbackMaxAge");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[RCConfigurationResource endpointMaxAge](self, "endpointMaxAge");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16 ^ v22 ^ objc_msgSend(v23, "hash");

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RCConfigurationResource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = objc_alloc_init(RCConfigurationResource);
  -[RCConfigurationResource requestKey](self, "requestKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setRequestKey:](v4, "setRequestKey:", v5);

  -[RCConfigurationResource gzippedConfigurationData](self, "gzippedConfigurationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setGzippedConfigurationData:](v4, "setGzippedConfigurationData:", v6);

  -[RCConfigurationResource userSegmentationConfiguration](self, "userSegmentationConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setUserSegmentationConfiguration:](v4, "setUserSegmentationConfiguration:", v7);

  -[RCConfigurationResource treatmentIDs](self, "treatmentIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setTreatmentIDs:](v4, "setTreatmentIDs:", v8);

  -[RCConfigurationResource segmentSetIDs](self, "segmentSetIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setSegmentSetIDs:](v4, "setSegmentSetIDs:", v9);

  -[RCConfigurationResource userID](self, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setUserID:](v4, "setUserID:", v10);

  -[RCConfigurationResource storefrontID](self, "storefrontID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setStorefrontID:](v4, "setStorefrontID:", v11);

  -[RCConfigurationResource configurationID](self, "configurationID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setConfigurationID:](v4, "setConfigurationID:", v12);

  -[RCConfigurationResource contentHash](self, "contentHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setContentHash:](v4, "setContentHash:", v13);

  -[RCConfigurationResource lastModifiedString](self, "lastModifiedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setLastModifiedString:](v4, "setLastModifiedString:", v14);

  -[RCConfigurationResource etag](self, "etag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setEtag:](v4, "setEtag:", v15);

  -[RCConfigurationResource lastModifiedFallbackString](self, "lastModifiedFallbackString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setLastModifiedFallbackString:](v4, "setLastModifiedFallbackString:", v16);

  -[RCConfigurationResource lastFetchedDate](self, "lastFetchedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setLastFetchedDate:](v4, "setLastFetchedDate:", v17);

  -[RCConfigurationResource fallbackMaxAge](self, "fallbackMaxAge");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setFallbackMaxAge:](v4, "setFallbackMaxAge:", v18);

  -[RCConfigurationResource endpointMaxAge](self, "endpointMaxAge");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource setEndpointMaxAge:](v4, "setEndpointMaxAge:", v19);

  return v4;
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
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  -[RCConfigurationResource requestKey](self, "requestKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource configurationID](self, "configurationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource contentHash](self, "contentHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource lastModifiedString](self, "lastModifiedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource etag](self, "etag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource lastModifiedFallbackString](self, "lastModifiedFallbackString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource lastFetchedDate](self, "lastFetchedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource fallbackMaxAge](self, "fallbackMaxAge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource endpointMaxAge](self, "endpointMaxAge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationResource userSegmentationConfiguration](self, "userSegmentationConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p; requestKey: %@ configurationID: %@ contentHash: %@ lastModified: %@, etag: %@ lastModifiedFallback: %@ lastFetched: %@ fallbackMaxAge: %@ endpointMaxAge: %@ userSegmentationConfig: %@>"),
    v14,
    self,
    v16,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontID, a3);
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (void)setLastModifiedFallbackString:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedFallbackString, a3);
}

- (void)setFallbackMaxAge:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackMaxAge, a3);
}

@end
