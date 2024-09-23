@implementation KCSharingMirrorEntry

- (KCSharingMirrorEntry)initWithUpdatedLocalItem:(id)a3 forIncomingEntry:(id)a4 flags:(unsigned int)a5
{
  id v8;
  id v9;
  KCSharingMirrorEntry *v10;
  uint64_t v11;
  CKRecord *record;
  id v13;
  uint64_t v14;
  KCSharingLocalFingerprint *internetPasswordFingerprint;
  uint64_t v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KCSharingMirrorEntry;
  v10 = -[KCSharingMirrorEntry init](&v18, "init");
  if (v10)
  {
    v10->_type = (int64_t)objc_msgSend(v9, "type");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "record"));
    record = v10->_record;
    v10->_record = (CKRecord *)v11;

    v10->_flags = a5;
    v13 = objc_msgSend(v8, "type");
    if (v13 == (id)2)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "internetPasswordFingerprint"));
      internetPasswordFingerprint = v10->_internetPasswordFingerprint;
      v10->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v16;
      goto LABEL_6;
    }
    if (v13 == (id)1)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateKeyFingerprint"));
      internetPasswordFingerprint = v10->_privateKeyFingerprint;
      v10->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v14;
LABEL_6:

    }
  }

  return v10;
}

- (KCSharingMirrorEntry)initWithIncomingEntry:(id)a3 flags:(unsigned int)a4
{
  id v6;
  KCSharingMirrorEntry *v7;
  uint64_t v8;
  CKRecord *record;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingMirrorEntry;
  v7 = -[KCSharingMirrorEntry init](&v11, "init");
  if (v7)
  {
    v7->_type = (int64_t)objc_msgSend(v6, "type");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "record"));
    record = v7->_record;
    v7->_record = (CKRecord *)v8;

    v7->_flags = a4;
  }

  return v7;
}

- (KCSharingMirrorEntry)initWithMirrorEntry:(id)a3 flags:(unsigned int)a4
{
  id v6;
  KCSharingMirrorEntry *v7;
  uint64_t v8;
  CKRecord *record;
  id v10;
  uint64_t v11;
  KCSharingLocalFingerprint *internetPasswordFingerprint;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KCSharingMirrorEntry;
  v7 = -[KCSharingMirrorEntry init](&v15, "init");
  if (v7)
  {
    v7->_type = (int64_t)objc_msgSend(v6, "type");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "record"));
    record = v7->_record;
    v7->_record = (CKRecord *)v8;

    v7->_flags = a4;
    v10 = objc_msgSend(v6, "type");
    if (v10 == (id)2)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internetPasswordFingerprint"));
      internetPasswordFingerprint = v7->_internetPasswordFingerprint;
      v7->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v13;
      goto LABEL_6;
    }
    if (v10 == (id)1)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateKeyFingerprint"));
      internetPasswordFingerprint = v7->_privateKeyFingerprint;
      v7->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v11;
LABEL_6:

    }
  }

  return v7;
}

- (KCSharingMirrorEntry)initWithSavedRecord:(id)a3 forOutgoingEntry:(id)a4 flags:(unsigned int)a5
{
  id v9;
  id v10;
  KCSharingMirrorEntry *v11;
  id v12;
  uint64_t v13;
  KCSharingLocalFingerprint *internetPasswordFingerprint;
  uint64_t v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KCSharingMirrorEntry;
  v11 = -[KCSharingMirrorEntry init](&v17, "init");
  if (v11)
  {
    v11->_type = (int64_t)objc_msgSend(v10, "type");
    objc_storeStrong((id *)&v11->_record, a3);
    v11->_flags = a5;
    v12 = objc_msgSend(v10, "type");
    if (v12 == (id)2)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internetPasswordFingerprint"));
      internetPasswordFingerprint = v11->_internetPasswordFingerprint;
      v11->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v15;
      goto LABEL_6;
    }
    if (v12 == (id)1)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "privateKeyFingerprint"));
      internetPasswordFingerprint = v11->_privateKeyFingerprint;
      v11->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v13;
LABEL_6:

    }
  }

  return v11;
}

- (KCSharingMirrorEntry)initWithUpdatedLocalItem:(id)a3 forMirrorEntry:(id)a4 flags:(unsigned int)a5
{
  id v8;
  id v9;
  KCSharingMirrorEntry *v10;
  uint64_t v11;
  CKRecord *record;
  id v13;
  uint64_t v14;
  KCSharingLocalFingerprint *internetPasswordFingerprint;
  uint64_t v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KCSharingMirrorEntry;
  v10 = -[KCSharingMirrorEntry init](&v18, "init");
  if (v10)
  {
    v10->_type = (int64_t)objc_msgSend(v9, "type");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "record"));
    record = v10->_record;
    v10->_record = (CKRecord *)v11;

    v10->_flags = a5;
    v13 = objc_msgSend(v8, "type");
    if (v13 == (id)2)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "internetPasswordFingerprint"));
      internetPasswordFingerprint = v10->_internetPasswordFingerprint;
      v10->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v16;
      goto LABEL_6;
    }
    if (v13 == (id)1)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateKeyFingerprint"));
      internetPasswordFingerprint = v10->_privateKeyFingerprint;
      v10->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v14;
LABEL_6:

    }
  }

  return v10;
}

- (KCSharingMirrorEntry)initWithMirrorDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingMirrorEntry *v6;
  id v7;
  const __CFSet *v8;
  const __CFDictionary *v9;
  void *v10;
  KCSharingMirrorEntry *v11;
  KCSharingMirrorEntry *v12;

  v6 = self;
  v7 = objc_msgSend((id)objc_opt_class(self), "requiredAttributeKeys");
  v8 = (const __CFSet *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000A15C(a3, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v6 = -[KCSharingMirrorEntry initWithAttributes:error:](v6, "initWithAttributes:error:", v10, a4);
    v11 = v6;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (KCSharingMirrorEntry)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingMirrorEntry *v7;
  KCSharingPBLocalEntryData *v8;
  void *v9;
  KCSharingPBLocalEntryData *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CKRecord *record;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CKRecord *v20;
  KCSharingLocalFingerprint *v21;
  void *v22;
  void *v23;
  KCSharingLocalFingerprint *v24;
  KCSharingLocalFingerprint *privateKeyFingerprint;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  CKRecord *v29;
  KCSharingLocalFingerprint *v30;
  KCSharingLocalFingerprint *v31;
  NSSet *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CKRecord *v36;
  KCSharingMirrorEntry *v37;
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)KCSharingMirrorEntry;
  v7 = -[KCSharingMirrorEntry init](&v39, "init");
  if (!v7)
  {
LABEL_14:
    v37 = v7;
    goto LABEL_16;
  }
  v8 = [KCSharingPBLocalEntryData alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecValueData));
  v10 = -[KCSharingPBLocalEntryData initWithData:](v8, "initWithData:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type")));
    v7->_type = (int64_t)objc_msgSend(v11, "longLongValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flag")));
    v7->_flags = objc_msgSend(v12, "unsignedIntValue");

    switch(v7->_type)
    {
      case 0:
        v13 = objc_opt_class(CKRecord);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v10, "cloudKitRecord"));
        v15 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v13, v14, a4));
        record = v7->_record;
        v7->_record = (CKRecord *)v15;

        goto LABEL_12;
      case 1:
        v17 = objc_opt_class(CKRecord);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v10, "cloudKitRecord"));
        v19 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v17, v18, a4));
        v20 = v7->_record;
        v7->_record = (CKRecord *)v19;

        if (!v7->_record)
          goto LABEL_15;
        v21 = [KCSharingLocalFingerprint alloc];
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pkkp")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pkvp")));
        v24 = -[KCSharingLocalFingerprint initWithKeyprint:valueprint:](v21, "initWithKeyprint:valueprint:", v22, v23);
        privateKeyFingerprint = v7->_privateKeyFingerprint;
        v7->_privateKeyFingerprint = v24;
        goto LABEL_10;
      case 2:
        v26 = objc_opt_class(CKRecord);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v10, "cloudKitRecord"));
        v28 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v26, v27, a4));
        v29 = v7->_record;
        v7->_record = (CKRecord *)v28;

        if (!v7->_record)
          goto LABEL_15;
        v30 = [KCSharingLocalFingerprint alloc];
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ipkp")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ipvp")));
        v31 = -[KCSharingLocalFingerprint initWithKeyprint:valueprint:](v30, "initWithKeyprint:valueprint:", v22, v23);
        privateKeyFingerprint = v7->_internetPasswordFingerprint;
        v7->_internetPasswordFingerprint = v31;
LABEL_10:

        goto LABEL_13;
      case 3:
        v32 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CKShare));
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v10, "cloudKitRecord"));
        v35 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v33, v34, a4));
        v36 = v7->_record;
        v7->_record = (CKRecord *)v35;

LABEL_12:
        if (v7->_record)
          goto LABEL_13;
        goto LABEL_15;
      default:
LABEL_13:

        break;
    }
    goto LABEL_14;
  }
  sub_10004D4E8(a4, 3, 0);
LABEL_15:

  v37 = 0;
LABEL_16:

  return v37;
}

- (NSString)description
{
  int64_t type;
  void *v3;
  void *v4;

  type = self->_type;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_record, "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingMirrorEntry(type:%lld recordID:%@)"), type, v3));

  return (NSString *)v4;
}

- (KCSharingLocalFingerprint)privateKeyFingerprint
{
  void *v5;

  if (self->_type != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingMirrorEntry.m"), 199, CFSTR("Can't get private key fingerprint for mirror entry of type %ld"), self->_type);

  }
  return self->_privateKeyFingerprint;
}

- (KCSharingLocalFingerprint)internetPasswordFingerprint
{
  void *v5;

  if (self->_type != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingMirrorEntry.m"), 204, CFSTR("Can't get Internet password fingerprint for mirror entry of type %ld"), self->_type);

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
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](self, "record"));
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
  v7 = -[KCSharingMirrorEntry type](self, "type");
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](self, "record"));
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](self, "record"));
  v14 = objc_msgSend(v6, "recordIsFullyDecoded:", v13);

  v15 = [KCSharingEntryContents alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](self, "record"));
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
  void *v16;
  id v17;
  int64_t type;
  KCSharingPBLocalEntryData *v19;
  __CFString **v20;
  uint64_t v21;
  __CFString **v22;
  id v23;
  void *v24;
  void *v25;
  KCSharingPBLocalEntryData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[9];
  _QWORD v39[9];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self->_record, 1, a4));
  if (v7)
  {
    v8 = objc_opt_new(KCSharingPBLocalEntryData);
    v28 = v7;
    -[KCSharingPBLocalEntryData setCloudKitRecord:](v8, "setCloudKitRecord:", v7);
    v38[0] = kSecAttrUUID;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_record, "recordID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "recordName"));
    v39[0] = v35;
    v38[1] = CFSTR("zone");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](self, "record"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "recordID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
    v39[1] = v31;
    v38[2] = CFSTR("ownr");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](self, "record"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "recordID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ownerName"));
    v39[2] = v10;
    v39[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    v38[3] = kSecAttrAccessible;
    v38[4] = CFSTR("type");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_type));
    v39[4] = v11;
    v38[5] = kSecAttrAccessGroup;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryAccessGroup"));
    v39[5] = v12;
    v38[6] = kSecValueData;
    v27 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData data](v8, "data"));
    v39[6] = v13;
    v38[7] = CFSTR("flag");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_flags));
    v39[7] = v14;
    v38[8] = CFSTR("lwsv");
    v37 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "entrySchemaVersion")));
    v39[8] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 9));
    v17 = objc_msgSend(v16, "mutableCopy");

    type = self->_type;
    if (type == 1)
    {
      v20 = off_1002E9908;
      v21 = 32;
      v22 = off_1002EA328;
      v19 = v27;
      v7 = v28;
    }
    else
    {
      v19 = v27;
      v7 = v28;
      if (type != 2)
      {
LABEL_8:
        v23 = objc_msgSend(v17, "copy");

        v6 = v37;
        goto LABEL_9;
      }
      v20 = &off_1002E9910;
      v21 = 40;
      v22 = &off_1002EA330;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + v21), "keyprint"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, *v22);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + v21), "valueprint"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, *v20);

    goto LABEL_8;
  }
  v23 = 0;
LABEL_9:

  return v23;
}

- (int64_t)type
{
  return self->_type;
}

- (CKRecord)record
{
  return self->_record;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetPasswordFingerprint, 0);
  objc_storeStrong((id *)&self->_privateKeyFingerprint, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_1000119B8((uint64_t)CFSTR("sharingMirror"), &qword_100341290, (uint64_t)&unk_100341288);
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_100340FF8 != -1)
    dispatch_once(&qword_100340FF8, &stru_1002DCB80);
  return (NSSet *)(id)qword_100340FF0;
}

@end
