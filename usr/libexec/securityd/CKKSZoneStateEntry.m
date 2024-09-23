@implementation CKKSZoneStateEntry

- (CKKSZoneStateEntry)initWithContextID:(id)a3 zoneName:(id)a4 zoneCreated:(BOOL)a5 zoneSubscribed:(BOOL)a6 changeToken:(id)a7 moreRecordsInCloudKit:(BOOL)a8 lastFetch:(id)a9 lastScan:(id)a10 lastFixup:(unint64_t)a11 encodedRateLimiter:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  CKKSZoneStateEntry *v20;
  CKKSZoneStateEntry *v21;
  id v26;
  id v27;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v27 = a7;
  v26 = a9;
  v18 = a10;
  v19 = a12;
  v28.receiver = self;
  v28.super_class = (Class)CKKSZoneStateEntry;
  v20 = -[CKKSZoneStateEntry init](&v28, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_contextID, a3);
    objc_storeStrong((id *)&v21->_ckzone, a4);
    v21->_ckzonecreated = a5;
    v21->_ckzonesubscribed = a6;
    objc_storeStrong((id *)&v21->_encodedChangeToken, a7);
    v21->_moreRecordsInCloudKit = a8;
    objc_storeStrong((id *)&v21->_lastFetchTime, a9);
    objc_storeStrong((id *)&v21->_lastLocalKeychainScanTime, a10);
    v21->_lastFixup = a11;
    -[CKKSZoneStateEntry setEncodedRateLimiter:](v21, "setEncodedRateLimiter:", v19);
  }

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
  if (-[CKKSZoneStateEntry ckzonecreated](self, "ckzonecreated"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[CKKSZoneStateEntry ckzonesubscribed](self, "ckzonesubscribed"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[CKKSZoneStateEntry moreRecordsInCloudKit](self, "moreRecordsInCloudKit"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSZoneStateEntry[%@](%@): created:%@ subscribed:%@ moreRecords:%@>"), v3, v4, v5, v6, v7));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned __int8 v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;

  v6 = a3;
  v7 = objc_opt_class(CKKSZoneStateEntry);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ckzone"));
    if (!objc_msgSend(v9, "isEqualToString:", v10))
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
    if (v11 || (v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"))) != 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      if (!objc_msgSend(v3, "isEqualToString:", v4))
      {
        v13 = 0;
        goto LABEL_14;
      }
      v12 = 1;
    }
    else
    {
      v48 = 0;
      v12 = 0;
    }
    v14 = -[CKKSZoneStateEntry ckzonecreated](self, "ckzonecreated");
    if (v14 != objc_msgSend(v8, "ckzonecreated")
      || (v15 = -[CKKSZoneStateEntry ckzonesubscribed](self, "ckzonesubscribed"),
          v15 != objc_msgSend(v8, "ckzonesubscribed")))
    {
      v13 = 0;
      if (!v12)
      {
LABEL_15:
        if (!v11)

        goto LABEL_18;
      }
LABEL_14:

      goto LABEL_15;
    }
    v17 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));
    v47 = v12;
    if (v17 || (v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encodedChangeToken"))) != 0)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encodedChangeToken"));
      v45 = v19;
      if (!objc_msgSend(v19, "isEqual:"))
      {
        v13 = 0;
        v20 = v18;
        goto LABEL_54;
      }
      v43 = 1;
    }
    else
    {
      v18 = 0;
      v42 = 0;
      v43 = 0;
    }
    v21 = -[CKKSZoneStateEntry moreRecordsInCloudKit](self, "moreRecordsInCloudKit");
    if (v21 != objc_msgSend(v8, "moreRecordsInCloudKit"))
    {
      v13 = 0;
      v20 = v18;
      if (!v43)
        goto LABEL_55;
      goto LABEL_54;
    }
    v20 = v18;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastFetchTime](self, "lastFetchTime"));
    if (v46 || (v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastFetchTime"))) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastFetchTime](self, "lastFetchTime"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastFetchTime"));
      v41 = v18;
      if (!objc_msgSend(v18, "isEqualToDate:"))
      {
        v13 = 0;
        goto LABEL_50;
      }
      v39 = 1;
    }
    else
    {
      v36 = 0;
      v39 = 0;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry rateLimiter](self, "rateLimiter"));
    if (v38 || (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rateLimiter"))) != 0)
    {
      v22 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry rateLimiter](self, "rateLimiter"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rateLimiter"));
      v37 = (void *)v22;
      v24 = (void *)v22;
      v18 = (void *)v23;
      if (!objc_msgSend(v24, "isEqual:", v23))
      {
        v13 = 0;
        goto LABEL_47;
      }
      v35 = v20;
      v34 = 1;
    }
    else
    {
      v35 = v20;
      v33 = 0;
      v34 = 0;
    }
    v25 = -[CKKSZoneStateEntry lastFixup](self, "lastFixup");
    if (v25 != objc_msgSend(v8, "lastFixup"))
    {
      v13 = 0;
      v20 = v35;
      if (!v34)
        goto LABEL_48;
      goto LABEL_47;
    }
    v26 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastLocalKeychainScanTime](self, "lastLocalKeychainScanTime"));
    if (v26 || (v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocalKeychainScanTime"))) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastLocalKeychainScanTime](self, "lastLocalKeychainScanTime", v29));
      v32 = (void *)v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocalKeychainScanTime"));
      v13 = objc_msgSend(v31, "isEqualToDate:", v27);

      if (v32)
      {

        v20 = v35;
        goto LABEL_64;
      }
      v20 = v35;
      v28 = v30;
    }
    else
    {
      v28 = 0;
      v13 = 1;
      v20 = v35;
    }

LABEL_64:
    if ((v34 & 1) == 0)
    {
LABEL_48:
      if (v38)
      {

        if (!v39)
          goto LABEL_51;
      }
      else
      {

        if ((v39 & 1) == 0)
        {
LABEL_51:
          if (!v46)

          if ((v43 & 1) == 0)
          {
LABEL_55:
            if (!v20)

            if ((v47 & 1) == 0)
              goto LABEL_15;
            goto LABEL_14;
          }
LABEL_54:

          goto LABEL_55;
        }
      }
LABEL_50:

      goto LABEL_51;
    }
LABEL_47:

    goto LABEL_48;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (CKServerChangeToken)getChangeToken
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));

  if (v3)
  {
    v4 = objc_alloc((Class)NSKeyedUnarchiver);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));
    v6 = objc_msgSend(v4, "initForReadingFromData:error:", v5, 0);

    v7 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(CKServerChangeToken), NSKeyedArchiveRootObjectKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = 0;
  }
  return (CKServerChangeToken *)v8;
}

- (void)setChangeToken:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
    -[CKKSZoneStateEntry setEncodedChangeToken:](self, "setEncodedChangeToken:", v4);

  }
  else
  {
    -[CKKSZoneStateEntry setEncodedChangeToken:](self, "setEncodedChangeToken:");
  }
}

- (NSData)encodedRateLimiter
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry rateLimiter](self, "rateLimiter"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry rateLimiter](self, "rateLimiter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));

  }
  else
  {
    v5 = 0;
  }
  return (NSData *)v5;
}

- (void)setEncodedRateLimiter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v7, 0);
    v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKKSRateLimiter), NSKeyedArchiveRootObjectKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[CKKSZoneStateEntry setRateLimiter:](self, "setRateLimiter:", v6);

  }
  else
  {
    -[CKKSZoneStateEntry setRateLimiter:](self, "setRateLimiter:", 0);
  }

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v10[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v10[1] = CFSTR("ckzone");
  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  return v8;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[10];
  _QWORD v33[10];

  v31 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v32[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v30 = v6;
  v33[0] = v6;
  v32[1] = CFSTR("ckzone");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
  v33[1] = v29;
  v32[2] = CFSTR("ckzonecreated");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CKKSZoneStateEntry ckzonecreated](self, "ckzonecreated")));
  v33[2] = v28;
  v32[3] = CFSTR("ckzonesubscribed");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CKKSZoneStateEntry ckzonesubscribed](self, "ckzonesubscribed")));
  v33[3] = v7;
  v32[4] = CFSTR("changetoken");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));

  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v11 = v10;

  v33[4] = v11;
  v32[5] = CFSTR("lastfetch");
  v12 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastFetchTime](self, "lastFetchTime"));
  if (!v12
    || (v13 = (void *)v12,
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastFetchTime](self, "lastFetchTime")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringFromDate:", v14)),
        v14,
        v13,
        !v15))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  v33[5] = v15;
  v32[6] = CFSTR("ratelimiter");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedRateLimiter](self, "encodedRateLimiter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64EncodedStringWithOptions:", 0));

  if (v17)
    v18 = v17;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v33[6] = v19;
  v32[7] = CFSTR("lastFixup");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[CKKSZoneStateEntry lastFixup](self, "lastFixup")));
  v33[7] = v20;
  v32[8] = CFSTR("morecoming");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CKKSZoneStateEntry moreRecordsInCloudKit](self, "moreRecordsInCloudKit")));
  v33[8] = v21;
  v32[9] = CFSTR("lastscan");
  v22 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastLocalKeychainScanTime](self, "lastLocalKeychainScanTime"));
  if (!v22
    || (v23 = (void *)v22,
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastLocalKeychainScanTime](self, "lastLocalKeychainScanTime")),
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringFromDate:", v24)),
        v24,
        v23,
        !v25))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  v33[9] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 10));

  return v26;
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)ckzone
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCkzone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)ckzonecreated
{
  return self->_ckzonecreated;
}

- (void)setCkzonecreated:(BOOL)a3
{
  self->_ckzonecreated = a3;
}

- (BOOL)ckzonesubscribed
{
  return self->_ckzonesubscribed;
}

- (void)setCkzonesubscribed:(BOOL)a3
{
  self->_ckzonesubscribed = a3;
}

- (NSData)encodedChangeToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncodedChangeToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)moreRecordsInCloudKit
{
  return self->_moreRecordsInCloudKit;
}

- (void)setMoreRecordsInCloudKit:(BOOL)a3
{
  self->_moreRecordsInCloudKit = a3;
}

- (NSDate)lastFetchTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastFetchTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)lastLocalKeychainScanTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastLocalKeychainScanTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)lastFixup
{
  return self->_lastFixup;
}

- (void)setLastFixup:(unint64_t)a3
{
  self->_lastFixup = a3;
}

- (CKKSRateLimiter)rateLimiter
{
  return (CKKSRateLimiter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRateLimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_lastLocalKeychainScanTime, 0);
  objc_storeStrong((id *)&self->_lastFetchTime, 0);
  objc_storeStrong((id *)&self->_encodedChangeToken, 0);
  objc_storeStrong((id *)&self->_ckzone, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

+ (id)contextID:(id)a3 zoneName:(id)a4
{
  id v5;
  id v6;
  CKKSZoneStateEntry *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v7 = (CKKSZoneStateEntry *)objc_claimAutoreleasedReturnValue(+[CKKSZoneStateEntry tryFromDatabase:zoneName:error:](CKKSZoneStateEntry, "tryFromDatabase:zoneName:error:", v5, v6, &v12));
  v8 = v12;
  if (v8)
  {
    v9 = sub_10000BDF4(CFSTR("ckks"), 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "error fetching CKState(%@): %@", buf, 0x16u);
    }

  }
  if (!v7)
    v7 = -[CKKSZoneStateEntry initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:lastFixup:encodedRateLimiter:]([CKKSZoneStateEntry alloc], "initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:lastFixup:encodedRateLimiter:", v5, v6, 0, 0, 0, 0, 0, 0, 5, 0);

  return v7;
}

+ (id)fromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v8 = a3;
  v9 = a4;
  v21[0] = CFSTR("contextID");
  v10 = v8;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v21[1] = CFSTR("ckzone");
  v22[0] = v13;
  v14 = v9;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v22[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v18, a5));

  return v19;
}

+ (id)tryFromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v8 = a3;
  v9 = a4;
  v21[0] = CFSTR("contextID");
  v10 = v8;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v21[1] = CFSTR("ckzone");
  v22[0] = v13;
  v14 = v9;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v22[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v18, a5));

  return v19;
}

+ (id)sqlTable
{
  return CFSTR("ckstate");
}

+ (id)sqlColumns
{
  return &off_10030B630;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSZoneStateEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  CKKSZoneStateEntry *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a3;
  v4 = [CKKSZoneStateEntry alloc];
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asString"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asString"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzonecreated")));
  v18 = objc_msgSend(v24, "asBOOL");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzonesubscribed")));
  v17 = objc_msgSend(v23, "asBOOL");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("changetoken")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asBase64DecodedData"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("morecoming")));
  v15 = objc_msgSend(v20, "asBOOL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastfetch")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asISO8601Date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastscan")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asISO8601Date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastFixup")));
  v11 = objc_msgSend(v10, "asNSInteger");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ratelimiter")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asBase64DecodedData"));
  v19 = -[CKKSZoneStateEntry initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:lastFixup:encodedRateLimiter:](v4, "initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:lastFixup:encodedRateLimiter:", v21, v5, v18, v17, v16, v15, v7, v9, v11, v13);

  return v19;
}

@end
