@implementation RPNearFieldAuthenticationPayload

- (RPNearFieldAuthenticationPayload)initWithTimeStamp:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5 selfIdentity:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RPNearFieldAuthenticationPayload *v15;
  RPNearFieldAuthenticationPayload *v16;
  NSData *v17;
  NSData *pkData;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSData *authTag;
  NSData *v24;
  NSData *v25;
  NSDate *v26;
  NSData *v27;
  NSData *v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  NSData *signatureData;
  RPNearFieldAuthenticationPayload *v38;
  objc_super v40;
  int v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)RPNearFieldAuthenticationPayload;
  v15 = -[RPNearFieldMessagePayload initWithType:](&v40, "initWithType:", 1);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeStamp, a3);
    v17 = (NSData *)objc_msgSend(v12, "copy");
    pkData = v16->_pkData;
    v16->_pkData = v17;

    objc_storeStrong((id *)&v16->_bonjourListenerUUID, a5);
    v21 = objc_msgSend((id)objc_opt_class(v16, v19, v20), "_authTagWithSelfIdentity:data:", v14, v16->_pkData);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    authTag = v16->_authTag;
    v16->_authTag = (NSData *)v22;

    v24 = v16->_authTag;
    v25 = v16->_pkData;
    v26 = v16->_timeStamp;
    v27 = v24;
    v28 = v25;
    v29 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 42);
    -[NSDate timeIntervalSinceReferenceDate](v26, "timeIntervalSinceReferenceDate");
    v31 = v30;

    v41 = (int)v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v41, 4));
    objc_msgSend(v29, "appendData:", v27);

    objc_msgSend(v29, "appendData:", v28);
    objc_msgSend(v29, "appendData:", v32);

    v35 = objc_msgSend((id)objc_opt_class(v16, v33, v34), "_signatureWithSelfIdentity:data:", v14, v29);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    signatureData = v16->_signatureData;
    v16->_signatureData = (NSData *)v36;

    v38 = v16;
  }

  return v16;
}

- (RPNearFieldAuthenticationPayload)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  uint64_t CFDataOfLength;
  void *v15;
  id v16;
  CFTypeID v17;
  uint64_t v18;
  void *v19;
  CFTypeID v20;
  uint64_t v21;
  void *v22;
  RPNearFieldAuthenticationPayload *v23;
  NSData *v24;
  NSData *pkData;
  NSData *v26;
  NSData *authTag;
  NSData *v28;
  NSData *signatureData;
  RPNearFieldAuthenticationPayload *v30;
  objc_super v32;

  v4 = a3;
  v5 = ((uint64_t (*)(void))CFDictionaryGetCFDataOfLength)();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v6)
  {
    v30 = 0;
    goto LABEL_21;
  }
  v8 = v6;
  if (objc_msgSend(v8, "length") != (id)4)
  {

    goto LABEL_12;
  }
  v9 = objc_retainAutorelease(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)*(int *)objc_msgSend(v9, "bytes")));

  if (!v10)
  {
    while (1)
LABEL_12:
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("CUGuardLetNoReturn"), CFSTR("CUGuardLet with no return"));
  }
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, &off_10011AAB8, TypeID, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v13)
  {
    CFDataOfLength = CFDictionaryGetCFDataOfLength(v4, &off_10011AAD0, 16, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    if (v15)
    {
      v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v15), "bytes"));
      v17 = CFDataGetTypeID();
      v18 = CFDictionaryGetTypedValue(v4, &off_10011AAE8, v17, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (v19)
      {
        v20 = CFDataGetTypeID();
        v21 = CFDictionaryGetTypedValue(v4, &off_10011AB00, v20, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if (v22
          && (v32.receiver = self,
              v32.super_class = (Class)RPNearFieldAuthenticationPayload,
              v23 = -[RPNearFieldMessagePayload initWithDictionary:](&v32, "initWithDictionary:", v4),
              (self = v23) != 0))
        {
          objc_storeStrong((id *)&v23->_timeStamp, v10);
          v24 = (NSData *)objc_msgSend(v13, "copy");
          pkData = self->_pkData;
          self->_pkData = v24;

          objc_storeStrong((id *)&self->_bonjourListenerUUID, v16);
          v26 = (NSData *)objc_msgSend(v22, "copy");
          authTag = self->_authTag;
          self->_authTag = v26;

          v28 = (NSData *)objc_msgSend(v19, "copy");
          signatureData = self->_signatureData;
          self->_signatureData = v28;

          self = self;
          v30 = self;
        }
        else
        {
          v30 = 0;
        }

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

LABEL_21:
  return v30;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSData *pkData;
  NSData *authTag;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;
  int v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[2];

  v17[0] = 0;
  v17[1] = 0;
  -[NSUUID getUUIDBytes:](self->_bonjourListenerUUID, "getUUIDBytes:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 16));
  v15[0] = &off_10011AAA0;
  -[NSDate timeIntervalSinceReferenceDate](self->_timeStamp, "timeIntervalSinceReferenceDate");
  v14 = (int)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, 4));
  pkData = self->_pkData;
  v16[0] = v5;
  v16[1] = pkData;
  v15[1] = &off_10011AAB8;
  v15[2] = &off_10011AAD0;
  authTag = self->_authTag;
  v16[2] = v3;
  v16[3] = authTag;
  v15[3] = &off_10011AB00;
  v15[4] = &off_10011AAE8;
  v16[4] = self->_signatureData;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 5));

  v13.receiver = self;
  v13.super_class = (Class)RPNearFieldAuthenticationPayload;
  v9 = -[RPNearFieldMessagePayload dictionaryRepresentation](&v13, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));

  objc_msgSend(v11, "addEntriesFromDictionary:", v8);
  return v11;
}

- (BOOL)isValidTimeStamp
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  LOBYTE(self) = -[RPNearFieldAuthenticationPayload isValidTimeStampSince:](self, "isValidTimeStampSince:", v3);

  return (char)self;
}

- (BOOL)isValidTimeStampSince:(id)a3
{
  double v3;

  -[NSDate timeIntervalSinceDate:](self->_timeStamp, "timeIntervalSinceDate:", a3);
  return v3 < 30.0 && v3 > -30.0;
}

- (BOOL)verifyWithIdentity:(id)a3
{
  id v4;
  void *v5;
  NSData *authTag;
  NSData *pkData;
  unsigned int v8;
  id v9;
  void *v10;
  NSData *v11;
  NSData *v12;
  NSDate *v13;
  NSData *v14;
  NSData *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  NSData *signatureData;
  unsigned __int8 v21;
  id v22;
  id v24;
  id v25;
  int v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "edPKData"));
  if (v5)
  {
    authTag = self->_authTag;
    pkData = self->_pkData;
    v25 = 0;
    v8 = objc_msgSend(v4, "verifyAuthTag:data:type:error:", authTag, pkData, 4, &v25);
    v9 = v25;
    v10 = v9;
    if (v8)
    {
      v11 = self->_authTag;
      v12 = self->_pkData;
      v13 = self->_timeStamp;
      v14 = v11;
      v15 = v12;
      v16 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 42);
      -[NSDate timeIntervalSinceReferenceDate](v13, "timeIntervalSinceReferenceDate");
      v18 = v17;

      v26 = (int)v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v26, 4));
      objc_msgSend(v16, "appendData:", v14);

      objc_msgSend(v16, "appendData:", v15);
      objc_msgSend(v16, "appendData:", v19);

      signatureData = self->_signatureData;
      v24 = v10;
      v21 = objc_msgSend(v4, "verifySignature:data:error:", signatureData, v16, &v24);
      v22 = v24;

      if ((v21 & 1) == 0
        && dword_1001308D0 <= 90
        && (dword_1001308D0 != -1 || _LogCategory_Initialize(&dword_1001308D0, 90)))
      {
        LogPrintF(&dword_1001308D0, "-[RPNearFieldAuthenticationPayload verifyWithIdentity:]", 90, "Fail to verify signature of payload: %@", v22);
      }

    }
    else
    {
      v21 = 0;
      v22 = v9;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)_authTagWithSelfIdentity:(id)a3 data:(id)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "authTagForData:type:error:", a4, 4, &v9));
  v5 = v9;
  if (v5
    && dword_1001308D0 < 91
    && (dword_1001308D0 != -1 || _LogCategory_Initialize(&dword_1001308D0, 90)))
  {
    LogPrintF(&dword_1001308D0, "+[RPNearFieldAuthenticationPayload _authTagWithSelfIdentity:data:]", 90, "Fail generating authTag with error: %@", v5);
  }

  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v7 = v6;

  return v7;
}

+ (id)_signatureWithSelfIdentity:(id)a3 data:(id)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "signData:error:", a4, &v9));
  v5 = v9;
  if (v5
    && dword_1001308D0 <= 90
    && (dword_1001308D0 != -1 || _LogCategory_Initialize(&dword_1001308D0, 90)))
  {
    LogPrintF(&dword_1001308D0, "+[RPNearFieldAuthenticationPayload _signatureWithSelfIdentity:data:]", 90, "Failed to generate signature: %@", v5);
  }
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v7 = v6;

  return v7;
}

- (id)description
{
  return -[RPNearFieldAuthenticationPayload descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSDate *timeStamp;
  id v10;
  void *v11;
  id v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v18 = 0;
  NSAppendPrintF(&v18, ", pkData <%.3@> %d B", self->_pkData, -[NSData length](self->_pkData, "length", *(_QWORD *)&a3));
  v4 = v18;
  v17 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_bonjourListenerUUID, "UUIDString"));
  NSAppendPrintF(&v17, ", bonjourUUID '%{mask}'", v5);
  v6 = v17;

  v16 = v6;
  NSAppendPrintF(&v16, ", authTag '%{mask}'", self->_authTag);
  v7 = v16;

  v15 = v7;
  NSAppendPrintF(&v15, ", signature <%.3@> %d B", self->_signatureData, -[NSData length](self->_signatureData, "length"));
  v8 = v15;

  v14 = v8;
  if (qword_100132020 != -1)
    dispatch_once(&qword_100132020, &stru_100112AB8);
  timeStamp = self->_timeStamp;
  v10 = (id)qword_100132018;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", timeStamp));
  NSAppendPrintF(&v14, ", timeStamp:%@ isValid:%d", v11, -[RPNearFieldAuthenticationPayload isValidTimeStamp](self, "isValidTimeStamp"));
  v12 = v14;

  return v12;
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_bonjourListenerUUID, 0);
  objc_storeStrong((id *)&self->_pkData, 0);
}

@end
