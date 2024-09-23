@implementation KCSharingOutgoingEntry

- (KCSharingOutgoingEntry)initWithNewLocalItem:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  KCSharingOutgoingEntry *v8;
  KCSharingRemoteItem *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  CKRecord *v15;
  CKRecord *record;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *modificationDate;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)KCSharingOutgoingEntry;
  v8 = -[KCSharingOutgoingEntry init](&v29, "init");
  if (v8)
  {
    v9 = -[KCSharingRemoteItem initWithLocalItem:]([KCSharingRemoteItem alloc], "initWithLocalItem:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("item"), v11));

    v13 = objc_alloc((Class)CKRecord);
    v14 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v12, v7);
    v15 = (CKRecord *)objc_msgSend(v13, "initWithRecordType:recordID:", CFSTR("item"), v14);
    record = v8->_record;
    v8->_record = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem proto](v9, "proto"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "data"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v8->_record, "encryptedValues"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("payload"));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDate"));
    modificationDate = v8->_modificationDate;
    v8->_modificationDate = (NSDate *)v20;

    v22 = objc_msgSend(v6, "type");
    if (v22 == (id)2)
    {
      v8->_type = 2;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v8->_record, "encryptedValues"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_10030AF28, CFSTR("type"));

      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internetPasswordFingerprint"));
      v25 = 32;
    }
    else
    {
      if (v22 != (id)1)
      {
LABEL_7:

        goto LABEL_8;
      }
      v8->_type = 1;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v8->_record, "encryptedValues"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", &off_10030AF10, CFSTR("type"));

      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateKeyFingerprint"));
      v25 = 24;
    }
    v27 = *(Class *)((char *)&v8->super.super.isa + v25);
    *(Class *)((char *)&v8->super.super.isa + v25) = (Class)v24;

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (KCSharingOutgoingEntry)initWithUpdatedLocalItem:(id)a3 forMirrorEntry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  KCSharingOutgoingEntry *v10;
  KCSharingRemoteItem *v11;
  void *v12;
  CKRecord *v13;
  CKRecord *record;
  KCSharingPBRemoteItem *v15;
  void *v16;
  void *v17;
  KCSharingPBRemoteItem *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDate *modificationDate;
  id v24;
  uint64_t v25;
  uint64_t v26;
  KCSharingOutgoingEntry *v27;
  void *v28;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)KCSharingOutgoingEntry;
  v10 = -[KCSharingOutgoingEntry init](&v30, "init");
  if (!v10)
    goto LABEL_10;
  v11 = -[KCSharingRemoteItem initWithLocalItem:]([KCSharingRemoteItem alloc], "initWithLocalItem:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "record"));
  v13 = (CKRecord *)objc_msgSend(v12, "copy");
  record = v10->_record;
  v10->_record = v13;

  v15 = [KCSharingPBRemoteItem alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v10->_record, "encryptedValues"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("payload")));
  v18 = -[KCSharingPBRemoteItem initWithData:](v15, "initWithData:", v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem proto](v11, "proto"));
    -[KCSharingPBRemoteItem mergeFrom:](v18, "mergeFrom:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBRemoteItem data](v18, "data"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v10->_record, "encryptedValues"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("payload"));

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modificationDate"));
    modificationDate = v10->_modificationDate;
    v10->_modificationDate = (NSDate *)v22;

    v24 = objc_msgSend(v8, "type");
    if (v24 == (id)2)
    {
      v10->_type = 2;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "internetPasswordFingerprint"));
      v26 = 32;
    }
    else
    {
      if (v24 != (id)1)
      {
LABEL_9:

LABEL_10:
        v27 = v10;
        goto LABEL_11;
      }
      v10->_type = 1;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateKeyFingerprint"));
      v26 = 24;
    }
    v28 = *(Class *)((char *)&v10->super.super.isa + v26);
    *(Class *)((char *)&v10->super.super.isa + v26) = (Class)v25;

    goto LABEL_9;
  }
  sub_10004D4E8(a5, 4, 0);

  v27 = 0;
LABEL_11:

  return v27;
}

- (KCSharingOutgoingEntry)initWithShare:(id)a3
{
  id v5;
  KCSharingOutgoingEntry *v6;
  KCSharingOutgoingEntry *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingOutgoingEntry;
  v6 = -[KCSharingOutgoingEntry init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_record, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modificationDate"));
    v9 = v8;
    if (!v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_storeStrong((id *)&v7->_modificationDate, v9);
    if (!v8)

    v7->_type = 3;
  }

  return v7;
}

- (KCSharingOutgoingEntry)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingOutgoingEntry *v7;
  void *v8;
  KCSharingPBLocalEntryData *v9;
  void *v10;
  KCSharingPBLocalEntryData *v11;
  void *v12;
  uint64_t v13;
  NSDate *modificationDate;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CKRecord *record;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  CKRecord *v22;
  KCSharingLocalFingerprint *v23;
  void *v24;
  void *v25;
  KCSharingLocalFingerprint *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  CKRecord *v31;
  KCSharingLocalFingerprint *v32;
  void *v33;
  NSSet *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  CKRecord *v38;
  KCSharingOutgoingEntry *v39;
  objc_super v41;

  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)KCSharingOutgoingEntry;
  v7 = -[KCSharingOutgoingEntry init](&v41, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deln")));
    if (_NSIsNSNumber(v8) && objc_msgSend(v8, "BOOLValue"))
    {
      sub_10004D4E8(a4, 8, 0);
LABEL_19:

      v39 = 0;
      goto LABEL_20;
    }
    v9 = [KCSharingPBLocalEntryData alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecValueData));
    v11 = -[KCSharingPBLocalEntryData initWithData:](v9, "initWithData:", v10);

    if (!v11)
    {
      sub_10004D4E8(a4, 3, 0);
LABEL_18:

      goto LABEL_19;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type")));
    v7->_type = (int64_t)objc_msgSend(v12, "longLongValue");

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrModificationDate));
    modificationDate = v7->_modificationDate;
    v7->_modificationDate = (NSDate *)v13;

    switch(v7->_type)
    {
      case 0:
        v15 = objc_opt_class(CKRecord);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v11, "cloudKitRecord"));
        v17 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v15, v16, a4));
        record = v7->_record;
        v7->_record = (CKRecord *)v17;

        goto LABEL_15;
      case 1:
        v19 = objc_opt_class(CKRecord);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v11, "cloudKitRecord"));
        v21 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v19, v20, a4));
        v22 = v7->_record;
        v7->_record = (CKRecord *)v21;

        if (!v7->_record)
          goto LABEL_18;
        v23 = [KCSharingLocalFingerprint alloc];
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pkkp")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pkvp")));
        v26 = -[KCSharingLocalFingerprint initWithKeyprint:valueprint:](v23, "initWithKeyprint:valueprint:", v24, v25);
        v27 = 24;
        goto LABEL_13;
      case 2:
        v28 = objc_opt_class(CKRecord);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v11, "cloudKitRecord"));
        v30 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v28, v29, a4));
        v31 = v7->_record;
        v7->_record = (CKRecord *)v30;

        if (!v7->_record)
          goto LABEL_18;
        v32 = [KCSharingLocalFingerprint alloc];
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ipkp")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ipvp")));
        v26 = -[KCSharingLocalFingerprint initWithKeyprint:valueprint:](v32, "initWithKeyprint:valueprint:", v24, v25);
        v27 = 32;
LABEL_13:
        v33 = *(Class *)((char *)&v7->super.super.isa + v27);
        *(Class *)((char *)&v7->super.super.isa + v27) = (Class)v26;

        goto LABEL_16;
      case 3:
        v34 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CKShare));
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v11, "cloudKitRecord"));
        v37 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v35, v36, a4));
        v38 = v7->_record;
        v7->_record = (CKRecord *)v37;

LABEL_15:
        if (v7->_record)
          goto LABEL_16;
        goto LABEL_18;
      default:
LABEL_16:

        break;
    }
  }
  v39 = v7;
LABEL_20:

  return v39;
}

- (KCSharingLocalFingerprint)privateKeyFingerprint
{
  void *v5;

  if (self->_type != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingOutgoingEntry.m"), 149, CFSTR("Can't get private key fingerprint for outgoing queue entry of type %ld"), self->_type);

  }
  return self->_privateKeyFingerprint;
}

- (KCSharingLocalFingerprint)internetPasswordFingerprint
{
  void *v5;

  if (self->_type != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingOutgoingEntry.m"), 154, CFSTR("Can't get Internet password fingerprint for outgoing queue entry of type %ld"), self->_type);

  }
  return self->_internetPasswordFingerprint;
}

- (id)remoteItemWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingEntryContents *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  KCSharingPBRemoteItem *v12;
  void *v13;
  void *v14;
  KCSharingPBRemoteItem *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  KCSharingPBRemoteItem *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v6 = a3;
  switch(self->_type)
  {
    case 0:
      v7 = -[KCSharingEntryContents initWithContents:fullyDecoded:]([KCSharingEntryContents alloc], "initWithContents:fullyDecoded:", 0, 0);
      goto LABEL_22;
    case 1:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_record, "recordID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
      v10 = sub_10004CEEC(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (!v11)
        goto LABEL_14;
      v12 = [KCSharingPBRemoteItem alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self->_record, "encryptedValues"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("payload")));
      v15 = -[KCSharingPBRemoteItem initWithData:](v12, "initWithData:", v14);

      if (!v15)
        goto LABEL_15;
      v16 = -[KCSharingRemoteItem initPasskeyWithProto:sharingGroup:error:]([KCSharingRemoteItem alloc], "initPasskeyWithProto:sharingGroup:error:", v15, v11, a4);
      goto LABEL_9;
    case 2:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_record, "recordID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
      v19 = sub_10004CEEC(v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (v11)
      {
        v20 = [KCSharingPBRemoteItem alloc];
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self->_record, "encryptedValues"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("payload")));
        v15 = -[KCSharingPBRemoteItem initWithData:](v20, "initWithData:", v22);

        if (v15)
        {
          v16 = -[KCSharingRemoteItem initPasswordWithProto:sharingGroup:error:]([KCSharingRemoteItem alloc], "initPasswordWithProto:sharingGroup:error:", v15, v11, a4);
LABEL_9:
          v23 = v16;
          if (v16)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
            if (objc_msgSend(v6, "recordIsFullyDecoded:", v24))
              v25 = objc_msgSend(v6, "remoteItemProtoIsFullyDecoded:", v15);
            else
              v25 = 0;

            v7 = -[KCSharingEntryContents initWithContents:fullyDecoded:]([KCSharingEntryContents alloc], "initWithContents:fullyDecoded:", v23, v25);
          }
          else
          {
            v7 = 0;
          }

        }
        else
        {
LABEL_15:
          sub_10004D4E8(a4, 4, 0);
          v7 = 0;
        }

      }
      else
      {
LABEL_14:
        sub_10004D4E8(a4, 7, 0);
        v7 = 0;
      }

      goto LABEL_22;
    case 3:
      sub_10004D4E8(a4, 13, 0);
      goto LABEL_13;
    default:
LABEL_13:
      v7 = 0;
LABEL_22:

      return v7;
  }
}

- (id)shareWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  KCSharingEntryContents *v15;
  void *v16;
  KCSharingEntryContents *v17;
  id *v18;
  uint64_t v19;

  v6 = a3;
  v7 = -[KCSharingOutgoingEntry type](self, "type");
  if ((unint64_t)(v7 - 1) < 2)
  {
    v18 = a4;
    v19 = 21;
LABEL_9:
    sub_10004D4E8(v18, v19, 0);
    goto LABEL_10;
  }
  if (!v7)
  {
    v17 = -[KCSharingEntryContents initWithContents:fullyDecoded:]([KCSharingEntryContents alloc], "initWithContents:fullyDecoded:", 0, 0);
    goto LABEL_11;
  }
  if (v7 != 3)
  {
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("group-"));

  if ((v12 & 1) == 0)
  {
    v18 = a4;
    v19 = 7;
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
  v14 = objc_msgSend(v6, "recordIsFullyDecoded:", v13);

  v15 = [KCSharingEntryContents alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
  v17 = -[KCSharingEntryContents initWithContents:fullyDecoded:](v15, "initWithContents:fullyDecoded:", v16, v14);

LABEL_11:
  return v17;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  KCSharingPBLocalEntryData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDate *modificationDate;
  void *v17;
  id v18;
  int64_t type;
  KCSharingPBLocalEntryData *v20;
  __CFString **v21;
  __CFString **v22;
  int *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  KCSharingPBLocalEntryData *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[9];
  _QWORD v40[9];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self->_record, 1, a4));
  if (v7)
  {
    v8 = objc_opt_new(KCSharingPBLocalEntryData);
    v30 = v7;
    -[KCSharingPBLocalEntryData setCloudKitRecord:](v8, "setCloudKitRecord:", v7);
    v39[0] = kSecAttrUUID;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "recordID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "recordName"));
    v40[0] = v35;
    v39[1] = CFSTR("zone");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "recordID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
    v40[1] = v31;
    v39[2] = CFSTR("ownr");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingEntry record](self, "record"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ownerName"));
    v40[2] = v12;
    v40[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    v39[3] = kSecAttrAccessible;
    v39[4] = CFSTR("type");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_type));
    v40[4] = v13;
    v39[5] = kSecAttrAccessGroup;
    v38 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryAccessGroup"));
    v40[5] = v14;
    v39[6] = kSecValueData;
    v29 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData data](v8, "data"));
    modificationDate = self->_modificationDate;
    v40[6] = v15;
    v40[7] = modificationDate;
    v39[7] = kSecAttrModificationDate;
    v39[8] = CFSTR("deln");
    v40[8] = &__kCFBooleanFalse;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 9));
    v18 = objc_msgSend(v17, "mutableCopy");

    type = self->_type;
    if (type == 1)
    {
      v21 = off_1002E9908;
      v22 = off_1002EA328;
      v23 = &OBJC_IVAR___KCSharingOutgoingEntry__privateKeyFingerprint;
      v20 = v29;
      v7 = v30;
    }
    else
    {
      v20 = v29;
      v7 = v30;
      if (type != 2)
      {
LABEL_8:
        v24 = objc_msgSend(v18, "copy");

        v6 = v38;
        goto LABEL_9;
      }
      v21 = &off_1002E9910;
      v22 = &off_1002EA330;
      v23 = &OBJC_IVAR___KCSharingOutgoingEntry__internetPasswordFingerprint;
    }
    v25 = *v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v25), "keyprint"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, *v22);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v25), "valueprint"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, *v21);

    goto LABEL_8;
  }
  v24 = 0;
LABEL_9:

  return v24;
}

- (int64_t)type
{
  return self->_type;
}

- (CKRecord)record
{
  return self->_record;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_internetPasswordFingerprint, 0);
  objc_storeStrong((id *)&self->_privateKeyFingerprint, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
