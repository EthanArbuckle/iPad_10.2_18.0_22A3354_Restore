@implementation SingleDataRecord

- (SingleDataRecord)init
{
  SingleDataRecord *v2;
  uint64_t v3;
  NSMutableArray *extensions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SingleDataRecord;
  v2 = -[SingleDataRecord init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)data
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  if (-[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[SingleDataRecord appVersion](self, "appVersion"), v3)&& (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord clientDataHash](self, "clientDataHash")), v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3), v4, v5)&& -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs"), v3)&& -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[SingleDataRecord addedMs](self, "addedMs"), v3)&& -[TLSMessageClass encodeBool:buffer:](
         self,
         "encodeBool:buffer:",
         -[SingleDataRecord accountMismatch](self, "accountMismatch"),
         v3)
    && -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[SingleDataRecord expiryMs](self, "expiryMs"), v3)&& -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs"), v3)&& (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord extensions](self, "extensions")), v7 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v6, v3), v6, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v3));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  SingleDataRecord *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  id v26;
  void *v27;
  SingleDataRecord *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = (char *)objc_msgSend(v7, "length") + (_QWORD)v8;
  v10 = objc_alloc_init(SingleDataRecord);
  v40 = 0;
  v11 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v6, v9, &v40);
  if (v11)
  {
    v12 = v11;
    -[SingleDataRecord setAppVersion:](v10, "setAppVersion:", v40);
    v39 = 0;
    v13 = -[TLSMessageClass parseHashValue:end:result:](v10, "parseHashValue:end:result:", v12, v9, &v39);
    v14 = v39;
    if (v13)
    {
      -[SingleDataRecord setClientDataHash:](v10, "setClientDataHash:", v14);
      v38 = 0;
      v15 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v13, v9, &v38);
      if (v15)
      {
        v16 = v15;
        -[SingleDataRecord setMarkedForDeletionMs:](v10, "setMarkedForDeletionMs:", v38);
        v37 = 0;
        v17 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v16, v9, &v37);
        if (v17)
        {
          v18 = v17;
          -[SingleDataRecord setAddedMs:](v10, "setAddedMs:", v37);
          v36 = 0;
          v19 = -[TLSMessageClass parseBool:end:result:](v10, "parseBool:end:result:", v18, v9, &v36);
          if (v19)
          {
            v20 = v19;
            -[SingleDataRecord setAccountMismatch:](v10, "setAccountMismatch:", v36);
            v35 = 0;
            v21 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v20, v9, &v35);
            if (v21)
            {
              v22 = v21;
              -[SingleDataRecord setExpiryMs:](v10, "setExpiryMs:", v35);
              v34 = 0;
              v23 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v22, v9, &v34);
              if (v23)
              {
                v24 = v23;
                -[SingleDataRecord setEscrowExpiryMs:](v10, "setEscrowExpiryMs:", v34);
                v33 = 0;
                v25 = -[TLSMessageClass parseExtensions:end:result:](v10, "parseExtensions:end:result:", v24, v9, &v33);
                v26 = v33;
                if (v25)
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v26));
                  -[SingleDataRecord setExtensions:](v10, "setExtensions:", v27);

                  -[SingleDataRecord setParsedLength:](v10, "setParsedLength:", v25 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v7), "bytes"));
                  v28 = v10;
                }
                else
                {
                  v28 = 0;
                  if (a4)
                    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -256, CFSTR("failed to parse extensions from SingleDataRecord")));
                }

                goto LABEL_27;
              }
              if (a4)
              {
                v29 = kTransparencyErrorDecode;
                v30 = CFSTR("failed to parse escrow expiry timestamp from SingleDataRecord");
                v31 = -255;
                goto LABEL_25;
              }
LABEL_26:
              v28 = 0;
              goto LABEL_27;
            }
            if (!a4)
              goto LABEL_26;
            v29 = kTransparencyErrorDecode;
            v30 = CFSTR("failed to parse expiry timestamp from SingleDataRecord");
            v31 = -254;
          }
          else
          {
            if (!a4)
              goto LABEL_26;
            v29 = kTransparencyErrorDecode;
            v30 = CFSTR("failed to parse account mismatch from SingleDataRecord");
            v31 = -253;
          }
        }
        else
        {
          if (!a4)
            goto LABEL_26;
          v29 = kTransparencyErrorDecode;
          v30 = CFSTR("failed to parse add timestamp from SingleDataRecord");
          v31 = -252;
        }
      }
      else
      {
        if (!a4)
          goto LABEL_26;
        v29 = kTransparencyErrorDecode;
        v30 = CFSTR("failed to parse mark timestamp from SingleDataRecord");
        v31 = -251;
      }
    }
    else
    {
      if (!a4)
        goto LABEL_26;
      v29 = kTransparencyErrorDecode;
      v30 = CFSTR("failed to parse client data from SingleDataRecord");
      v31 = -250;
    }
LABEL_25:
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v29, v31, v30));
LABEL_27:

    goto LABEL_28;
  }
  v28 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -249, CFSTR("failed to parse app version from SingleDataRecord")));
LABEL_28:

  return v28;
}

- (id)debugDescription
{
  unint64_t appVersion;
  void *v4;
  void *v5;

  appVersion = self->_appVersion;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\tapplicationVersion:%llu\n\tclientDataHash:%@\n\taccountMismatch:%d\n\tmarkedMs:%llu\n\taddedMs:%llu\n\texpiryMs:%llu\n\tescrowExpiryMs:%llu\n}"), appVersion, v4, self->_accountMismatch, self->_markedForDeletionMs, self->_addedMs, self->_expiryMs, self->_escrowExpiryMs));

  return v5;
}

- (id)description
{
  unint64_t appVersion;
  void *v4;
  void *v5;

  appVersion = self->_appVersion;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("applicationVersion:%llu; clientDataHash:%@; accountMismatch:%d; markedMs:%llu; addedMs:%llu; expiryMs:%llu; escrowExpiryMs:%llu;"),
                   appVersion,
                   v4,
                   self->_accountMismatch,
                   self->_markedForDeletionMs,
                   self->_addedMs,
                   self->_expiryMs,
                   self->_escrowExpiryMs));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  SingleDataRecord *v5;
  uint64_t v6;
  SingleDataRecord *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (SingleDataRecord *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(SingleDataRecord, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_appVersion = a3;
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)markedForDeletionMs
{
  return self->_markedForDeletionMs;
}

- (void)setMarkedForDeletionMs:(unint64_t)a3
{
  self->_markedForDeletionMs = a3;
}

- (unint64_t)addedMs
{
  return self->_addedMs;
}

- (void)setAddedMs:(unint64_t)a3
{
  self->_addedMs = a3;
}

- (BOOL)accountMismatch
{
  return self->_accountMismatch;
}

- (void)setAccountMismatch:(BOOL)a3
{
  self->_accountMismatch = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
}

- (unint64_t)escrowExpiryMs
{
  return self->_escrowExpiryMs;
}

- (void)setEscrowExpiryMs:(unint64_t)a3
{
  self->_escrowExpiryMs = a3;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
}

- (id)diagnosticsJsonDictionary
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SingleDataRecord appVersion](self, "appVersion")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord clientDataHash](self, "clientDataHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientDataHash"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SingleDataRecord addedMs](self, "addedMs")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("addedMs"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[SingleDataRecord addedMs](self, "addedMs") / 0x3E8)));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("addedDateReadable"));

  if (-[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("markedForDeltionMs"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs") / 0x3E8)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_toISO_8601_UTCString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("markedDateReadable"));

  }
  if (-[SingleDataRecord expiryMs](self, "expiryMs"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SingleDataRecord expiryMs](self, "expiryMs")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("expiryMs"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[SingleDataRecord expiryMs](self, "expiryMs") / 0x3E8)));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_toISO_8601_UTCString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("expiryDateReadable"));

  }
  if (-[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("escrowExpiryMs"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs") / 0x3E8)));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_toISO_8601_UTCString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("escrowExpiryDateReadable"));

  }
  return v3;
}

@end
