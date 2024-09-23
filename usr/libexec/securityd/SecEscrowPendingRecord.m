@implementation SecEscrowPendingRecord

- (BOOL)saveToKeychain:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  id *v27;
  CFTypeRef result;
  _QWORD v31[10];
  _QWORD v32[10];

  v31[0] = kSecClass;
  v31[1] = kSecAttrAccessible;
  v32[0] = kSecClassInternetPassword;
  v32[1] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v31[2] = kSecAttrAccessGroup;
  v31[3] = kSecAttrServer;
  v32[2] = CFSTR("com.apple.sbd");
  v32[3] = CFSTR("escrow-prerecord");
  v31[4] = kSecAttrDescription;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](self, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Escrow Prerecord: %@"), v4));
  v32[4] = v5;
  v31[5] = kSecAttrAccount;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](self, "uuid"));
  v32[5] = v6;
  v31[6] = kSecValueData;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord data](self, "data"));
  v32[6] = v7;
  v32[7] = &__kCFBooleanTrue;
  v31[7] = kSecAttrIsInvisible;
  v31[8] = kSecUseDataProtectionKeychain;
  v31[9] = kSecAttrSynchronizable;
  v32[8] = &__kCFBooleanTrue;
  v32[9] = &__kCFBooleanFalse;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 10));
  v9 = (const __CFDictionary *)objc_msgSend(v8, "mutableCopy");

  result = 0;
  v10 = SecItemAdd(v9, &result);
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == -25299)
    {
      v11 = objc_alloc_init((Class)NSMutableDictionary);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecClass));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kSecClass);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrSynchronizable));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, kSecAttrSynchronizable);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrSyncViewHint));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, kSecAttrSyncViewHint);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrAccessGroup));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, kSecAttrAccessGroup);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrAccount));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, kSecAttrAccount);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrServer));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, kSecAttrServer);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrPath));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, kSecAttrPath);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecUseDataProtectionKeychain));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, kSecUseDataProtectionKeychain);

      v20 = -[__CFDictionary mutableCopy](v9, "mutableCopy");
      objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, kSecClass);
      v21 = SecItemUpdate((CFDictionaryRef)v11, (CFDictionaryRef)v20);
      if ((_DWORD)v21)
      {
        v22 = (int)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemUpdate: %d"), v21));
        v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, v22, v23));

      }
      else
      {
        v24 = 0;
      }
      v27 = a3;

    }
    else
    {
      v26 = (int)v10;
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemAdd: %d"), v10));
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, v26, v11));
      v27 = a3;
    }

    v25 = v24 == 0;
    if (v27 && v24)
    {
      v24 = objc_retainAutorelease(v24);
      v25 = 0;
      *v27 = v24;
    }
  }
  else
  {
    v24 = 0;
    v25 = 1;
  }

  return v25;
}

- (BOOL)deleteFromKeychain:(id *)a3
{
  void *v4;
  void *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  int v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];

  v11[0] = kSecClass;
  v11[1] = kSecAttrAccessGroup;
  v12[0] = kSecClassInternetPassword;
  v12[1] = CFSTR("com.apple.sbd");
  v12[2] = CFSTR("escrow-prerecord");
  v11[2] = kSecAttrServer;
  v11[3] = kSecAttrAccount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](self, "uuid"));
  v12[3] = v4;
  v12[4] = &__kCFBooleanTrue;
  v11[4] = kSecUseDataProtectionKeychain;
  v11[5] = kSecAttrSynchronizable;
  v12[5] = &__kCFBooleanFalse;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 6));
  v6 = (const __CFDictionary *)objc_msgSend(v5, "mutableCopy");

  v7 = SecItemDelete(v6);
  v8 = v7;
  if (a3 && (_DWORD)v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemAdd: %d"), v7));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, v8, v9));

  }
  return v8 == 0;
}

- (BOOL)escrowAttemptedWithinLastSeconds:(double)a3
{
  void *v4;
  double v5;
  double v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  v7 = -[SecEscrowPendingRecord hasLastEscrowAttemptTime](self, "hasLastEscrowAttemptTime")
    && -[SecEscrowPendingRecord lastEscrowAttemptTime](self, "lastEscrowAttemptTime") >= (unint64_t)(v6 * 1000.0);

  return v7;
}

+ (id)loadFromKeychain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  SecEscrowPendingRecord *v13;
  SecEscrowPendingRecord *v14;
  CFTypeRef result;
  NSErrorUserInfoKey v17;
  void *v18;
  _QWORD v19[9];
  _QWORD v20[9];

  v5 = a3;
  v19[0] = kSecClass;
  v19[1] = kSecAttrAccessGroup;
  v20[0] = kSecClassInternetPassword;
  v20[1] = CFSTR("com.apple.sbd");
  v19[2] = kSecAttrServer;
  v19[3] = kSecAttrAccount;
  v20[2] = CFSTR("escrow-prerecord");
  v20[3] = v5;
  v19[4] = kSecMatchLimit;
  v19[5] = kSecAttrSynchronizable;
  v20[4] = kSecMatchLimitOne;
  v20[5] = &__kCFBooleanFalse;
  v19[6] = kSecUseDataProtectionKeychain;
  v19[7] = kSecReturnAttributes;
  v20[6] = &__kCFBooleanTrue;
  v20[7] = &__kCFBooleanTrue;
  v19[8] = kSecReturnData;
  v20[8] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 9));
  v7 = (const __CFDictionary *)objc_msgSend(v6, "mutableCopy");

  result = 0;
  v8 = SecItemCopyMatching(v7, &result);
  v9 = (void *)result;
  if ((_DWORD)v8)
  {
    v10 = v8;
    if (result)
    {
      result = 0;
      CFRelease(v9);
    }
    if (!a4)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v17 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemCopyMatching: %d"), v10));
    v18 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v10, v11));
    v13 = 0;
    *a4 = v12;
  }
  else
  {
    v14 = [SecEscrowPendingRecord alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSecValueData));
    v13 = -[SecEscrowPendingRecord initWithData:](v14, "initWithData:", v11);
  }

LABEL_9:
  return v13;
}

+ (id)loadAllFromKeychain:(id *)a3
{
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SecEscrowPendingRecord *v18;
  void *v19;
  SecEscrowPendingRecord *v20;
  const void *v21;
  NSObject *v22;
  const __CFDictionary *v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CFTypeRef result;
  _BYTE v31[128];
  NSErrorUserInfoKey v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[8];

  v34[0] = kSecClass;
  v34[1] = kSecAttrAccessGroup;
  v35[0] = kSecClassInternetPassword;
  v35[1] = CFSTR("com.apple.sbd");
  v34[2] = kSecAttrServer;
  v34[3] = kSecMatchLimit;
  v35[2] = CFSTR("escrow-prerecord");
  v35[3] = kSecMatchLimitAll;
  v34[4] = kSecAttrSynchronizable;
  v34[5] = kSecUseDataProtectionKeychain;
  v35[4] = &__kCFBooleanFalse;
  v35[5] = &__kCFBooleanTrue;
  v34[6] = kSecReturnAttributes;
  v34[7] = kSecReturnData;
  v35[6] = &__kCFBooleanTrue;
  v35[7] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 8));
  v5 = (const __CFDictionary *)objc_msgSend(v4, "mutableCopy");

  result = 0;
  v6 = SecItemCopyMatching(v5, &result);
  if (!(_DWORD)v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = (id)result;
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v13)
    {
      v14 = v13;
      v24 = v5;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v16);
          v18 = [SecEscrowPendingRecord alloc];
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kSecValueData));
          v20 = -[SecEscrowPendingRecord initWithData:](v18, "initWithData:", v19);

          if (v20)
          {
            objc_msgSend(v12, "addObject:", v20);
          }
          else
          {
            v21 = sub_10000EF14("SecError");
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "escrowrequest: Unable to deserialize keychain item", buf, 2u);
            }

          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v14);
      v9 = v10;
      v5 = v24;
    }
    else
    {
      v9 = v10;
    }
    goto LABEL_21;
  }
  v7 = v6;
  v8 = result;
  if (result)
  {
    result = 0;
    CFRelease(v8);
  }
  if (a3)
  {
    v32 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemCopyMatching: %d"), v7));
    v33 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v7, v10));
    v12 = 0;
    *a3 = v11;
LABEL_21:

    goto LABEL_22;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCertCached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_certCached = a3;
}

- (void)setHasCertCached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCertCached
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSerializedPrerecord
{
  return self->_serializedPrerecord != 0;
}

- (void)setLastCloudServicesTriggerTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastCloudServicesTriggerTime = a3;
}

- (void)setHasLastCloudServicesTriggerTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastCloudServicesTriggerTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLastEscrowAttemptTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastEscrowAttemptTime = a3;
}

- (void)setHasLastEscrowAttemptTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastEscrowAttemptTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUploadCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_uploadCompleted = a3;
}

- (void)setHasUploadCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUploadCompleted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUploadRetries:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_uploadRetries = a3;
}

- (void)setHasUploadRetries:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUploadRetries
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (void)setTriggerRequestTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_triggerRequestTime = a3;
}

- (void)setHasTriggerRequestTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggerRequestTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSerializedReason
{
  return self->_serializedReason != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SecEscrowPendingRecord;
  v3 = -[SecEscrowPendingRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  void *v6;
  NSData *serializedPrerecord;
  char has;
  void *v9;
  NSString *altDSID;
  void *v11;
  NSData *serializedReason;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_certCached));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("certCached"));

  }
  serializedPrerecord = self->_serializedPrerecord;
  if (serializedPrerecord)
    objc_msgSend(v4, "setObject:forKey:", serializedPrerecord, CFSTR("serializedPrerecord"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastCloudServicesTriggerTime));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("lastCloudServicesTriggerTime"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastEscrowAttemptTime));
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("lastEscrowAttemptTime"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_uploadCompleted));
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("uploadCompleted"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_uploadRetries));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("uploadRetries"));

  }
LABEL_12:
  altDSID = self->_altDSID;
  if (altDSID)
    objc_msgSend(v4, "setObject:forKey:", altDSID, CFSTR("altDSID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_triggerRequestTime));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("triggerRequestTime"));

  }
  serializedReason = self->_serializedReason;
  if (serializedReason)
    objc_msgSend(v4, "setObject:forKey:", serializedReason, CFSTR("serializedReason"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  uint64_t String;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t Data;
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  void *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      break;
    switch((v7 >> 3))
    {
      case 1u:
        String = PBReaderReadString(a3);
        v14 = objc_claimAutoreleasedReturnValue(String);
        v15 = 64;
        goto LABEL_66;
      case 2u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)&self->_has |= 0x10u;
        while (2)
        {
          v20 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v21 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v19 |= (unint64_t)(v21 & 0x7F) << v17;
            if (v21 < 0)
            {
              v17 += 7;
              v10 = v18++ >= 9;
              if (v10)
              {
                v19 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v19 = 0;
LABEL_70:
        v48 = v19 != 0;
        v49 = 72;
        goto LABEL_83;
      case 3u:
        Data = PBReaderReadData(a3);
        v14 = objc_claimAutoreleasedReturnValue(Data);
        v15 = 48;
        goto LABEL_66;
      case 4u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (2)
        {
          v26 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              v10 = v24++ >= 9;
              if (v10)
              {
                v25 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v25 = 0;
LABEL_74:
        v50 = 8;
        goto LABEL_92;
      case 5u:
        v28 = 0;
        v29 = 0;
        v25 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (2)
        {
          v30 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v25 |= (unint64_t)(v31 & 0x7F) << v28;
            if (v31 < 0)
            {
              v28 += 7;
              v10 = v29++ >= 9;
              if (v10)
              {
                v25 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v25 = 0;
LABEL_78:
        v50 = 16;
        goto LABEL_92;
      case 6u:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        *(_BYTE *)&self->_has |= 0x20u;
        while (2)
        {
          v35 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v35);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v35 + 1;
            v34 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              v10 = v33++ >= 9;
              if (v10)
              {
                v34 = 0;
                goto LABEL_82;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v34 = 0;
LABEL_82:
        v48 = v34 != 0;
        v49 = 73;
LABEL_83:
        self->PBCodable_opaque[v49] = v48;
        continue;
      case 7u:
        v37 = 0;
        v38 = 0;
        v25 = 0;
        *(_BYTE *)&self->_has |= 8u;
        while (2)
        {
          v39 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v39);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v39 + 1;
            v25 |= (unint64_t)(v40 & 0x7F) << v37;
            if (v40 < 0)
            {
              v37 += 7;
              v10 = v38++ >= 9;
              if (v10)
              {
                v25 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v25 = 0;
LABEL_87:
        v50 = 32;
        goto LABEL_92;
      case 8u:
        v41 = PBReaderReadString(a3);
        v14 = objc_claimAutoreleasedReturnValue(v41);
        v15 = 40;
        goto LABEL_66;
      case 9u:
        v42 = 0;
        v43 = 0;
        v25 = 0;
        *(_BYTE *)&self->_has |= 4u;
        break;
      case 0xAu:
        v46 = PBReaderReadData(a3);
        v14 = objc_claimAutoreleasedReturnValue(v46);
        v15 = 56;
LABEL_66:
        v47 = *(void **)&self->PBCodable_opaque[v15];
        *(_QWORD *)&self->PBCodable_opaque[v15] = v14;

        continue;
      default:
        v16 = PBReaderSkipValueWithTag(a3);
        if (!v16)
          return v16;
        continue;
    }
    while (1)
    {
      v44 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v44 == -1 || v44 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v45 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v44);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v44 + 1;
      v25 |= (unint64_t)(v45 & 0x7F) << v42;
      if ((v45 & 0x80) == 0)
        goto LABEL_89;
      v42 += 7;
      v10 = v43++ >= 9;
      if (v10)
      {
        v25 = 0;
        goto LABEL_91;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_89:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v25 = 0;
LABEL_91:
    v50 = 24;
LABEL_92:
    *(_QWORD *)&self->PBCodable_opaque[v50] = v25;
  }
  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *uuid;
  NSData *serializedPrerecord;
  char has;
  NSString *altDSID;
  NSData *serializedReason;
  id v10;

  v4 = a3;
  uuid = self->_uuid;
  v10 = v4;
  if (uuid)
  {
    PBDataWriterWriteStringField(v4, uuid, 1);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v10, self->_certCached, 2);
    v4 = v10;
  }
  serializedPrerecord = self->_serializedPrerecord;
  if (serializedPrerecord)
  {
    PBDataWriterWriteDataField(v10, serializedPrerecord, 3);
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v10, self->_lastCloudServicesTriggerTime, 4);
    v4 = v10;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field(v10, self->_lastEscrowAttemptTime, 5);
  v4 = v10;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  PBDataWriterWriteBOOLField(v10, self->_uploadCompleted, 6);
  v4 = v10;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteUint64Field(v10, self->_uploadRetries, 7);
    v4 = v10;
  }
LABEL_12:
  altDSID = self->_altDSID;
  if (altDSID)
  {
    PBDataWriterWriteStringField(v10, altDSID, 8);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v10, self->_triggerRequestTime, 9);
    v4 = v10;
  }
  serializedReason = self->_serializedReason;
  if (serializedReason)
  {
    PBDataWriterWriteDataField(v10, serializedReason, 10);
    v4 = v10;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_certCached;
    *((_BYTE *)v4 + 76) |= 0x10u;
  }
  if (self->_serializedPrerecord)
  {
    objc_msgSend(v6, "setSerializedPrerecord:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_lastCloudServicesTriggerTime;
    *((_BYTE *)v4 + 76) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 2) = self->_lastEscrowAttemptTime;
  *((_BYTE *)v4 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  *((_BYTE *)v4 + 73) = self->_uploadCompleted;
  *((_BYTE *)v4 + 76) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_QWORD *)v4 + 4) = self->_uploadRetries;
    *((_BYTE *)v4 + 76) |= 8u;
  }
LABEL_12:
  if (self->_altDSID)
  {
    objc_msgSend(v6, "setAltDSID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_triggerRequestTime;
    *((_BYTE *)v4 + 76) |= 4u;
  }
  if (self->_serializedReason)
  {
    objc_msgSend(v6, "setSerializedReason:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v5 + 72) = self->_certCached;
    *((_BYTE *)v5 + 76) |= 0x10u;
  }
  v8 = -[NSData copyWithZone:](self->_serializedPrerecord, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_lastCloudServicesTriggerTime;
    *((_BYTE *)v5 + 76) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v5[2] = self->_lastEscrowAttemptTime;
  *((_BYTE *)v5 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)v5 + 73) = self->_uploadCompleted;
  *((_BYTE *)v5 + 76) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v5[4] = self->_uploadRetries;
    *((_BYTE *)v5 + 76) |= 8u;
  }
LABEL_8:
  v11 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v12 = (void *)v5[5];
  v5[5] = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[3] = self->_triggerRequestTime;
    *((_BYTE *)v5 + 76) |= 4u;
  }
  v13 = -[NSData copyWithZone:](self->_serializedReason, "copyWithZone:", a3);
  v14 = (void *)v5[7];
  v5[7] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  char has;
  char v7;
  NSData *serializedPrerecord;
  NSString *altDSID;
  NSData *serializedReason;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_48;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_48;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 76);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0)
      goto LABEL_48;
    if (self->_certCached)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  serializedPrerecord = self->_serializedPrerecord;
  if ((unint64_t)serializedPrerecord | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](serializedPrerecord, "isEqual:"))
      goto LABEL_48;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 76);
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_lastCloudServicesTriggerTime != *((_QWORD *)v4 + 1))
      goto LABEL_48;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lastEscrowAttemptTime != *((_QWORD *)v4 + 2))
      goto LABEL_48;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_48;
    if (self->_uploadCompleted)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_48;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_uploadRetries != *((_QWORD *)v4 + 4))
      goto LABEL_48;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_48;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((_QWORD *)v4 + 5))
  {
    if (-[NSString isEqual:](altDSID, "isEqual:"))
    {
      has = (char)self->_has;
      v7 = *((_BYTE *)v4 + 76);
      goto LABEL_41;
    }
LABEL_48:
    v11 = 0;
    goto LABEL_49;
  }
LABEL_41:
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_triggerRequestTime != *((_QWORD *)v4 + 3))
      goto LABEL_48;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_48;
  }
  serializedReason = self->_serializedReason;
  if ((unint64_t)serializedReason | *((_QWORD *)v4 + 7))
    v11 = -[NSData isEqual:](serializedReason, "isEqual:");
  else
    v11 = 1;
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v4 = 2654435761 * self->_certCached;
  else
    v4 = 0;
  v5 = (unint64_t)-[NSData hash](self->_serializedPrerecord, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_lastCloudServicesTriggerTime;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v7 = 2654435761u * self->_lastEscrowAttemptTime;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_7;
LABEL_11:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_11;
LABEL_7:
  v8 = 2654435761 * self->_uploadCompleted;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_uploadRetries;
    goto LABEL_13;
  }
LABEL_12:
  v9 = 0;
LABEL_13:
  v10 = -[NSString hash](self->_altDSID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761u * self->_triggerRequestTime;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)-[NSData hash](self->_serializedReason, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[SecEscrowPendingRecord setUuid:](self, "setUuid:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    self->_certCached = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SecEscrowPendingRecord setSerializedPrerecord:](self, "setSerializedPrerecord:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 1) != 0)
  {
    self->_lastCloudServicesTriggerTime = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_lastEscrowAttemptTime = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  self->_uploadCompleted = *((_BYTE *)v4 + 73);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
LABEL_11:
    self->_uploadRetries = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 5))
  {
    -[SecEscrowPendingRecord setAltDSID:](self, "setAltDSID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    self->_triggerRequestTime = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[SecEscrowPendingRecord setSerializedReason:](self, "setSerializedReason:");
    v4 = v6;
  }

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)certCached
{
  return self->_certCached;
}

- (NSData)serializedPrerecord
{
  return self->_serializedPrerecord;
}

- (void)setSerializedPrerecord:(id)a3
{
  objc_storeStrong((id *)&self->_serializedPrerecord, a3);
}

- (unint64_t)lastCloudServicesTriggerTime
{
  return self->_lastCloudServicesTriggerTime;
}

- (unint64_t)lastEscrowAttemptTime
{
  return self->_lastEscrowAttemptTime;
}

- (BOOL)uploadCompleted
{
  return self->_uploadCompleted;
}

- (unint64_t)uploadRetries
{
  return self->_uploadRetries;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (unint64_t)triggerRequestTime
{
  return self->_triggerRequestTime;
}

- (NSData)serializedReason
{
  return self->_serializedReason;
}

- (void)setSerializedReason:(id)a3
{
  objc_storeStrong((id *)&self->_serializedReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_serializedReason, 0);
  objc_storeStrong((id *)&self->_serializedPrerecord, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
