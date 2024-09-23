@implementation KTClientDataRecord

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientData, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\tclientData:%@\n\tclientDataHash:%@\n\tapplicationVersion:%lu\n\taddedDate:%@\n\tmarkedForDeletion:%@\n\texpiry:%@\n\tescrowExpiry:%@\n}"), v3, v4, self->_applicationVersion, self->_addedDate, self->_markedForDeletion, self->_expiry, self->_escrowExpiry));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientData, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("clientData:%@; clientDataHash:%@; applicationVersion:%lu; addedDate:%@; markedForDeletion:%@; expiry:%@; escrowExpiry:%@"),
                   v3,
                   v4,
                   self->_applicationVersion,
                   self->_addedDate,
                   self->_markedForDeletion,
                   self->_expiry,
                   self->_escrowExpiry));

  return v5;
}

- (NSDictionary)diagnosticsJsonDictionary
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientData"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientDataHash"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[KTClientDataRecord applicationVersion](self, "applicationVersion")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appVersion"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_dateToString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("addedDate"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("addedDateReadable"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_dateToString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("markedDate"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_toISO_8601_UTCString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("markedDateReadable"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_dateToString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("expiry"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("expiryReadable"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "kt_dateToString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("escrowExpiry"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "kt_toISO_8601_UTCString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("escrowExpiryReadable"));

  }
  if (-[KTClientDataRecord verified](self, "verified"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[KTClientDataRecord verified](self, "verified")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("matchesServerData"));

  }
  if (-[KTClientDataRecord synced](self, "synced"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[KTClientDataRecord synced](self, "synced")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("matchesSyncedData"));

  }
  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[KTClientDataRecord applicationVersion](self, "applicationVersion");
  if (v4 > 0xFFFFFFFE)
    abort();
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("clientData"));

  objc_msgSend(v12, "encodeInteger:forKey:", v5, CFSTR("applicationVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("clientDataHash"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("markedForDeletion"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("addedDate"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("expiry"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("escrowExpiry"));

  objc_msgSend(v12, "encodeBool:forKey:", -[KTClientDataRecord verified](self, "verified"), CFSTR("verified"));
  objc_msgSend(v12, "encodeBool:forKey:", -[KTClientDataRecord synced](self, "synced"), CFSTR("synced"));

}

- (KTClientDataRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  KTClientDataRecord *v21;
  KTClientDataRecord *v22;
  unsigned int v24;
  unsigned int v25;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("clientData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationVersion"));
  if ((v8 & 0x8000000000000000) != 0)
    abort();
  v10 = v8;
  v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v9), CFSTR("clientDataHash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v25 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verified"));
  v24 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("synced"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("markedForDeletion"));
  if (v13 <= 0.0)
    v14 = 0;
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("addedDate"));
  if (v15 <= 0.0)
    v16 = 0;
  else
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("expiry"));
  if (v17 <= 0.0)
    v18 = 0;
  else
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("escrowExpiry"));
  if (v19 <= 0.0)
    v20 = 0;
  else
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  v21 = objc_alloc_init(KTClientDataRecord);
  v22 = v21;
  if (v21)
  {
    -[KTClientDataRecord setClientData:](v21, "setClientData:", v7);
    -[KTClientDataRecord setApplicationVersion:](v22, "setApplicationVersion:", v10);
    -[KTClientDataRecord setClientDataHash:](v22, "setClientDataHash:", v12);
    -[KTClientDataRecord setMarkedForDeletion:](v22, "setMarkedForDeletion:", v14);
    -[KTClientDataRecord setAddedDate:](v22, "setAddedDate:", v16);
    -[KTClientDataRecord setExpiry:](v22, "setExpiry:", v18);
    -[KTClientDataRecord setEscrowExpiry:](v22, "setEscrowExpiry:", v20);
    -[KTClientDataRecord setVerified:](v22, "setVerified:", v25);
    -[KTClientDataRecord setSynced:](v22, "setSynced:", v24);
  }

  return v22;
}

- (KTClientDataRecord)initWithMutation:(id)a3
{
  id v4;
  KTClientDataRecord *v5;
  uint64_t v6;
  NSData *clientDataHash;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  NSDate *addedDate;
  uint64_t v14;
  NSDate *expiry;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSDate *markedForDeletion;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)KTClientDataRecord;
  v5 = -[KTClientDataRecord init](&v22, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataHash"));
    clientDataHash = v5->_clientDataHash;
    v5->_clientDataHash = (NSData *)v6;

    v5->_applicationVersion = (unint64_t)objc_msgSend(v4, "appVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsMutation"));
    if (objc_msgSend(v8, "mutationType") == 1)
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsMutation"));
      v10 = objc_msgSend(v9, "mutationType");

      if (v10 != 4)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsMutation"));
        if (objc_msgSend(v16, "mutationType") == 2)
        {

        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsMutation"));
          v18 = objc_msgSend(v17, "mutationType");

          if (v18 != 5)
            goto LABEL_12;
        }
        expiry = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsMutation"));
        v19 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)-[NSDate mutationMs](expiry, "mutationMs") / 1000.0));
        markedForDeletion = v5->_markedForDeletion;
        v5->_markedForDeletion = (NSDate *)v19;

        goto LABEL_11;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsMutation"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v11, "mutationMs") / 1000.0));
    addedDate = v5->_addedDate;
    v5->_addedDate = (NSDate *)v12;

    if (objc_msgSend(v4, "expiryMs"))
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "expiryMs") / 1000.0));
      expiry = v5->_expiry;
      v5->_expiry = (NSDate *)v14;
LABEL_11:

    }
  }
LABEL_12:

  return v5;
}

- (KTClientDataRecord)initWithSingleDataRecord:(id)a3
{
  id v4;
  KTClientDataRecord *v5;
  uint64_t v6;
  NSData *clientDataHash;
  uint64_t v8;
  NSDate *addedDate;
  uint64_t v10;
  NSDate *markedForDeletion;
  uint64_t v12;
  NSDate *expiry;
  uint64_t v14;
  NSDate *escrowExpiry;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KTClientDataRecord;
  v5 = -[KTClientDataRecord init](&v17, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataHash"));
    clientDataHash = v5->_clientDataHash;
    v5->_clientDataHash = (NSData *)v6;

    v5->_applicationVersion = (unint64_t)objc_msgSend(v4, "appVersion");
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "addedMs") / 1000.0));
    addedDate = v5->_addedDate;
    v5->_addedDate = (NSDate *)v8;

    if (objc_msgSend(v4, "markedForDeletionMs"))
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "markedForDeletionMs") / 1000.0));
      markedForDeletion = v5->_markedForDeletion;
      v5->_markedForDeletion = (NSDate *)v10;
    }
    else
    {
      markedForDeletion = v5->_markedForDeletion;
      v5->_markedForDeletion = 0;
    }

    if (objc_msgSend(v4, "expiryMs"))
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "expiryMs") / 1000.0));
      expiry = v5->_expiry;
      v5->_expiry = (NSDate *)v12;

    }
    if (objc_msgSend(v4, "escrowExpiryMs"))
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "escrowExpiryMs") / 1000.0));
      escrowExpiry = v5->_escrowExpiry;
      v5->_escrowExpiry = (NSDate *)v14;

    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  KTClientDataRecord *v5;
  uint64_t v6;
  KTClientDataRecord *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;

  v5 = (KTClientDataRecord *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(KTClientDataRecord, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
      v9 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](v7, "clientData"));
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](v7, "clientData"));
        v13 = objc_msgSend(v11, "isEqualToData:", v12);

        if (!v13)
          goto LABEL_32;
      }
      v15 = -[KTClientDataRecord applicationVersion](self, "applicationVersion");
      if (v15 == (id)-[KTClientDataRecord applicationVersion](v7, "applicationVersion"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
        v17 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](v7, "clientDataHash"));
        if (v16 == (void *)v17)
        {

        }
        else
        {
          v18 = (void *)v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](v7, "clientDataHash"));
          v21 = objc_msgSend(v19, "isEqualToData:", v20);

          if (!v21)
            goto LABEL_32;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
        v23 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](v7, "addedDate"));
        if (v22 == (void *)v23)
        {

        }
        else
        {
          v24 = (void *)v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](v7, "addedDate"));
          v27 = objc_msgSend(v25, "kt_isEqualWithinOneMillisecond:", v26);

          if (!v27)
            goto LABEL_32;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
        v29 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](v7, "markedForDeletion"));
        if (v28 == (void *)v29)
        {

        }
        else
        {
          v30 = (void *)v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](v7, "markedForDeletion"));
          v33 = objc_msgSend(v31, "kt_isEqualWithinOneMillisecond:", v32);

          if (!v33)
            goto LABEL_32;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
        v35 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](v7, "expiry"));
        if (v34 == (void *)v35)
        {

        }
        else
        {
          v36 = (void *)v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](v7, "expiry"));
          v39 = objc_msgSend(v37, "kt_isEqualWithinOneMillisecond:", v38);

          if (!v39)
            goto LABEL_32;
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
        v41 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](v7, "escrowExpiry"));
        if (v40 == (void *)v41)
        {

        }
        else
        {
          v42 = (void *)v41;
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](v7, "escrowExpiry"));
          v45 = objc_msgSend(v43, "kt_isEqualWithinOneMillisecond:", v44);

          if (!v45)
            goto LABEL_32;
        }
        v46 = -[KTClientDataRecord verified](self, "verified");
        if (v46 == -[KTClientDataRecord verified](v7, "verified"))
        {
          v47 = -[KTClientDataRecord synced](self, "synced");
          if (v47 == -[KTClientDataRecord synced](v7, "synced"))
          {
            v14 = 1;
            goto LABEL_33;
          }
        }
      }
LABEL_32:
      v14 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v14 = 0;
  }
LABEL_34:

  return v14;
}

- (BOOL)marked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
    v7 = objc_msgSend(v6, "compare:", v4) == (id)-1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)expired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
    v7 = objc_msgSend(v6, "compare:", v4) == (id)-1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)active:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion")),
        v8 = objc_msgSend(v7, "compare:", v4),
        v7,
        v6,
        v8 == (id)-1))
  {
    v12 = 0;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
      v12 = objc_msgSend(v11, "compare:", v4) != (id)-1;

    }
    else
    {
      v12 = 1;
    }
  }

  return v12;
}

- (void)markWithMutationMs:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));

  if (!v5)
  {
    v6 = (double)a3 / 1000.0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v6));
    -[KTClientDataRecord setMarkedForDeletion:](self, "setMarkedForDeletion:", v7);

    -[KTClientDataRecord setExpiry:](self, "setExpiry:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v6 + (double)kKTEscrowExpiryPeriod));
    -[KTClientDataRecord setEscrowExpiry:](self, "setEscrowExpiry:", v8);

  }
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsMutation"));
  v6 = objc_msgSend(v5, "mutationMs");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)v6 / 1000.0));
  if (-[KTClientDataRecord marked:](self, "marked:", v7) || -[KTClientDataRecord expired:](self, "expired:", v7))
  {
    -[KTClientDataRecord setMarkedForDeletion:](self, "setMarkedForDeletion:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)v6 / 1000.0));
    -[KTClientDataRecord setAddedDate:](self, "setAddedDate:", v8);

    if (objc_msgSend(v16, "expiryMs"))
    {
LABEL_4:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v16, "expiryMs") / 1000.0));
      -[KTClientDataRecord setExpiry:](self, "setExpiry:", v9);

      v10 = objc_msgSend(v16, "expiryMs");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)v10 / 1000.0 + (double)kKTEscrowExpiryPeriod));
      -[KTClientDataRecord setEscrowExpiry:](self, "setEscrowExpiry:", v11);

    }
  }
  else if (objc_msgSend(v16, "expiryMs"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = vabdd_f64(v13, (double)((unint64_t)objc_msgSend(v16, "expiryMs") / 0x3E8));
    v15 = (double)kKTExpiryGracePeriod;

    if (v14 > v15)
      goto LABEL_4;
  }

}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "idsMutation"));
  v6 = objc_msgSend(v5, "mutationMs");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)v6 / 1000.0 + (double)kKTEscrowExpiryPeriod));
    -[KTClientDataRecord setEscrowExpiry:](self, "setEscrowExpiry:", v8);

  }
  else
  {
    -[KTClientDataRecord markWithMutationMs:](self, "markWithMutationMs:", v6);
  }
}

- (BOOL)shouldRemove
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
  v5 = objc_msgSend(v3, "compare:", v4) == (id)1;

  return v5;
}

- (NSData)clientData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(unint64_t)a3
{
  self->_applicationVersion = a3;
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)markedForDeletion
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMarkedForDeletion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)addedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAddedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)expiry
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExpiry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)escrowExpiry
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEscrowExpiry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (BOOL)synced
{
  return self->_synced;
}

- (void)setSynced:(BOOL)a3
{
  self->_synced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escrowExpiry, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_markedForDeletion, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end
