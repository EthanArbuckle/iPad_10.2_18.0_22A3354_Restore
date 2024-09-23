@implementation KCSharingIncomingEntry

- (KCSharingIncomingEntry)initWithFetchedRecord:(id)a3
{
  id v5;
  KCSharingIncomingEntry *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KCSharingIncomingEntry;
  v6 = -[KCSharingIncomingEntry init](&v15, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordType"));
    v8 = objc_msgSend(v7, "isEqual:", CKRecordTypeShare);

    if (v8)
    {
      v6->_type = 3;
LABEL_13:
      objc_storeStrong((id *)&v6->_record, a3);
      goto LABEL_14;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordType"));
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("item"));

    if (!v10)
    {
      v6->_type = 0;
      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encryptedValues"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("type")));

    if (objc_msgSend(v12, "isEqual:", &off_10030A2E0))
    {
      v13 = 1;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqual:", &off_10030A2F8))
      {
        v6->_type = 0;
        goto LABEL_12;
      }
      v13 = 2;
    }
    v6->_type = v13;
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (KCSharingIncomingEntry)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingIncomingEntry *v7;
  void *v8;
  KCSharingPBLocalEntryData *v9;
  void *v10;
  KCSharingPBLocalEntryData *v11;
  void *v12;
  unint64_t type;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CKRecord *record;
  NSSet *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CKRecord *v22;
  KCSharingIncomingEntry *v23;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)KCSharingIncomingEntry;
  v7 = -[KCSharingIncomingEntry init](&v25, "init");
  if (!v7)
    goto LABEL_13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deln")));
  if (_NSIsNSNumber(v8) && objc_msgSend(v8, "BOOLValue"))
  {
    sub_10004D4E8(a4, 8, 0);
LABEL_15:

    v23 = 0;
    goto LABEL_16;
  }
  v9 = [KCSharingPBLocalEntryData alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecValueData));
  v11 = -[KCSharingPBLocalEntryData initWithData:](v9, "initWithData:", v10);

  if (!v11)
  {
    sub_10004D4E8(a4, 3, 0);
    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type")));
  v7->_type = (int64_t)objc_msgSend(v12, "longLongValue");

  type = v7->_type;
  if (type < 3)
  {
    v14 = objc_opt_class(CKRecord);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v11, "cloudKitRecord"));
    v16 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v14, v15, a4));
    record = v7->_record;
    v7->_record = (CKRecord *)v16;

    goto LABEL_11;
  }
  if (type == 3)
  {
    v18 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CKShare));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData cloudKitRecord](v11, "cloudKitRecord"));
    v21 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v19, v20, a4));
    v22 = v7->_record;
    v7->_record = (CKRecord *)v21;

LABEL_11:
    if (v7->_record)
      goto LABEL_12;
LABEL_14:

    goto LABEL_15;
  }
LABEL_12:

LABEL_13:
  v23 = v7;
LABEL_16:

  return v23;
}

- (NSDate)modificationDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord modificationDate](self->_record, "modificationDate"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = v4;

  return (NSDate *)v5;
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
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](self, "record"));
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
  v7 = -[KCSharingIncomingEntry type](self, "type");
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](self, "record"));
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](self, "record"));
  v14 = objc_msgSend(v6, "recordIsFullyDecoded:", v13);

  v15 = [KCSharingEntryContents alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](self, "record"));
  v17 = -[KCSharingEntryContents initWithContents:fullyDecoded:](v15, "initWithContents:fullyDecoded:", v16, v14);

LABEL_11:
  return v17;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  KCSharingPBLocalEntryData *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[8];
  _QWORD v26[8];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self->_record, 1, a4));
  if (v7)
  {
    v18 = objc_opt_new(KCSharingPBLocalEntryData);
    -[KCSharingPBLocalEntryData setCloudKitRecord:](v18, "setCloudKitRecord:", v7);
    v25[0] = kSecAttrUUID;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_record, "recordID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
    v26[0] = v23;
    v25[1] = CFSTR("zone");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](self, "record"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recordID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneName"));
    v26[1] = v19;
    v25[2] = CFSTR("ownr");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](self, "record"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ownerName"));
    v26[2] = v11;
    v26[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    v25[3] = kSecAttrAccessible;
    v25[4] = CFSTR("type");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_type));
    v26[4] = v12;
    v25[5] = kSecAttrAccessGroup;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryAccessGroup"));
    v26[5] = v13;
    v26[6] = &__kCFBooleanFalse;
    v25[6] = CFSTR("deln");
    v25[7] = kSecValueData;
    v14 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData data](v18, "data"));
    v26[7] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 8));

    v6 = v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (CKRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

@end
