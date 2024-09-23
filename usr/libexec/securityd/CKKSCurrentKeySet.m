@implementation CKKSCurrentKeySet

- (CKKSCurrentKeySet)initWithZoneID:(id)a3 contextID:(id)a4
{
  id v7;
  id v8;
  CKKSCurrentKeySet *v9;
  CKKSCurrentKeySet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSCurrentKeySet;
  v9 = -[CKKSCurrentKeySet init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneID, a3);
    objc_storeStrong((id *)&v10->_contextID, a4);
  }

  return v10;
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
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet error](self, "error"));

  v20 = objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet contextID](self, "contextID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet zoneID](self, "zoneID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](self, "currentTLKPointer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentKeyUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet tlk](self, "tlk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](self, "currentClassAPointer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentKeyUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classA](self, "classA"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](self, "currentClassCPointer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentKeyUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classC](self, "classC"));
  v11 = -[CKKSCurrentKeySet proposed](self, "proposed");
  v12 = v11;
  if (v3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet error](self, "error"));
    v17 = v12;
    v14 = (void *)v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSCurrentKeySet[%@](%@): %@:%@ %@:%@ %@:%@ new:%d %@>"), v20, v22, v21, v4, v6, v7, v9, v10, v17, v13));

  }
  else
  {
    v14 = (void *)v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSCurrentKeySet[%@](%@): %@:%@ %@:%@ %@:%@ new:%d>"), v20, v22, v21, v4, v6, v7, v9, v10, v11));
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v5 = objc_alloc_init((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet zoneID](self, "zoneID"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setZoneID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](self, "currentTLKPointer"));
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentTLKPointer:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](self, "currentClassAPointer"));
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentClassAPointer:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](self, "currentClassCPointer"));
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentClassCPointer:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet tlk](self, "tlk"));
  v15 = objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setTlk:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classA](self, "classA"));
  v17 = objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setClassA:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classC](self, "classC"));
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setClassC:", v19);

  objc_msgSend(v5, "setProposed:", -[CKKSCurrentKeySet proposed](self, "proposed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet error](self, "error"));
  v21 = objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setError:", v21);

  return v5;
}

- (id)asKeychainBackedSet:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  CKKSKeychainBackedKeySet *v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet tlk](self, "tlk"));
  v20 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getKeychainBackedKey:", &v20));
  v7 = v20;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classA](self, "classA"));
  v19 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getKeychainBackedKey:", &v19));
  v10 = v19;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classC](self, "classC"));
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getKeychainBackedKey:", &v18));
  v13 = v18;

  if (v6 && v9 && v12)
  {
    v14 = -[CKKSKeychainBackedKeySet initWithTLK:classA:classC:newUpload:]([CKKSKeychainBackedKeySet alloc], "initWithTLK:classA:classC:newUpload:", v6, v9, v12, -[CKKSCurrentKeySet proposed](self, "proposed"));
  }
  else if (a3)
  {
    if (v10)
      v15 = v10;
    else
      v15 = v13;
    if (v7)
      v16 = v7;
    else
      v16 = v15;
    v14 = 0;
    *a3 = objc_autorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 53, CFSTR("unable to make keychain backed set; key is missing"),
                                   v16)));
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CKKSKey)tlk
{
  return (CKKSKey *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTlk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CKKSKey)classA
{
  return (CKKSKey *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClassA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CKKSKey)classC
{
  return (CKKSKey *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClassC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CKKSCurrentKeyPointer)currentTLKPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentTLKPointer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKKSCurrentKeyPointer)currentClassAPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentClassAPointer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CKKSCurrentKeyPointer)currentClassCPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCurrentClassCPointer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)proposed
{
  return self->_proposed;
}

- (void)setProposed:(BOOL)a3
{
  self->_proposed = a3;
}

- (NSArray)pendingTLKShares
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPendingTLKShares:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTLKShares, 0);
  objc_storeStrong((id *)&self->_currentClassCPointer, 0);
  objc_storeStrong((id *)&self->_currentClassAPointer, 0);
  objc_storeStrong((id *)&self->_currentTLKPointer, 0);
  objc_storeStrong((id *)&self->_classC, 0);
  objc_storeStrong((id *)&self->_classA, 0);
  objc_storeStrong((id *)&self->_tlk, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

+ (id)loadForZone:(id)a3 contextID:(id)a4
{
  id v5;
  id v6;
  CKKSCurrentKeySet *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *context;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v5 = a3;
  v6 = a4;
  context = objc_autoreleasePoolPush();
  v7 = -[CKKSCurrentKeySet initWithZoneID:contextID:]([CKKSCurrentKeySet alloc], "initWithZoneID:contextID:", v5, v6);
  v39 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("tlk"), v6, v5, &v39));
  v9 = v39;
  -[CKKSCurrentKeySet setCurrentTLKPointer:](v7, "setCurrentTLKPointer:", v8);

  v38 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("classA"), v6, v5, &v38));
  v11 = v38;

  -[CKKSCurrentKeySet setCurrentClassAPointer:](v7, "setCurrentClassAPointer:", v10);
  v37 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("classC"), v6, v5, &v37));
  v13 = v37;

  -[CKKSCurrentKeySet setCurrentClassCPointer:](v7, "setCurrentClassCPointer:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](v7, "currentTLKPointer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentKeyUUID"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](v7, "currentTLKPointer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentKeyUUID"));
    v36 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v17, v6, v5, &v36));
    v19 = v36;

    -[CKKSCurrentKeySet setTlk:](v7, "setTlk:", v18);
    v13 = v19;
  }
  else
  {
    -[CKKSCurrentKeySet setTlk:](v7, "setTlk:", 0);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](v7, "currentClassAPointer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentKeyUUID"));
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](v7, "currentClassAPointer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentKeyUUID"));
    v35 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v23, v6, v5, &v35));
    v25 = v35;

    -[CKKSCurrentKeySet setClassA:](v7, "setClassA:", v24);
    v13 = v25;
  }
  else
  {
    -[CKKSCurrentKeySet setClassA:](v7, "setClassA:", 0);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](v7, "currentClassCPointer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentKeyUUID"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](v7, "currentClassCPointer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentKeyUUID"));
    v34 = v13;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v29, v6, v5, &v34));
    v31 = v34;

    -[CKKSCurrentKeySet setClassC:](v7, "setClassC:", v30);
    v13 = v31;
  }
  else
  {
    -[CKKSCurrentKeySet setClassC:](v7, "setClassC:", 0);
  }

  -[CKKSCurrentKeySet setPendingTLKShares:](v7, "setPendingTLKShares:", 0);
  -[CKKSCurrentKeySet setProposed:](v7, "setProposed:", 0);
  -[CKKSCurrentKeySet setError:](v7, "setError:", v13);

  objc_autoreleasePoolPop(context);
  return v7;
}

@end
