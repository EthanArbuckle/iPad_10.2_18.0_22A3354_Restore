@implementation KCSharingIncomingDeletion

- (id)initForDeletedRecordWithRecordID:(id)a3
{
  id v5;
  KCSharingIncomingDeletion *v6;
  KCSharingIncomingDeletion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingIncomingDeletion;
  v6 = -[KCSharingIncomingDeletion init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recordID, a3);

  return v7;
}

- (KCSharingIncomingDeletion)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  KCSharingIncomingDeletion *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  id v35;
  const __CFString *v36;
  id v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  id v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  id v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  const __CFString *v51;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deln")));
  v8 = (void *)v7;
  if (v7)
  {
    if (_NSIsNSNumber(v7) && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
    {
      v9 = kSecAttrUUID;
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrUUID));
      v11 = (id)v10;
      if (v10)
      {
        if (_NSIsNSString(v10) && objc_msgSend(v11, "length"))
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zone")));
          v13 = (id)v12;
          if (v12)
          {
            if (_NSIsNSString(v12) && objc_msgSend(v13, "length"))
            {
              v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ownr")));
              if (!v14)
              {
                v32 = CFSTR("KCSharingMissingAttribute");
                v33 = CFSTR("ownr");
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
                sub_10004D4E8(a4, 22, (uint64_t)v27);

                v15 = 0;
                goto LABEL_25;
              }
              v15 = (id)v14;
              if (_NSIsNSString(v14) && objc_msgSend(v15, "length"))
              {
                v16 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v13, v15);
                v17 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v11, v16);
                self = (KCSharingIncomingDeletion *)-[KCSharingIncomingDeletion initForDeletedRecordWithRecordID:](self, "initForDeletedRecordWithRecordID:", v17);

                v18 = self;
LABEL_26:

                goto LABEL_21;
              }
              v30 = CFSTR("KCSharingInvalidAttribute");
              v24 = objc_msgSend(v15, "copy", CFSTR("ownr"));
              v29 = v24;
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
              v31 = v25;
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
              sub_10004D4E8(a4, 1, (uint64_t)v26);

            }
            else
            {
              v36 = CFSTR("KCSharingInvalidAttribute");
              v34 = CFSTR("zone");
              v15 = objc_msgSend(v13, "copy");
              v35 = v15;
              v24 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
              v37 = v24;
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
              sub_10004D4E8(a4, 1, (uint64_t)v25);
            }

          }
          else
          {
            v38 = CFSTR("KCSharingMissingAttribute");
            v39 = CFSTR("zone");
            v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
            sub_10004D4E8(a4, 22, (uint64_t)v15);
          }
LABEL_25:
          v18 = 0;
          goto LABEL_26;
        }
        v42 = CFSTR("KCSharingInvalidAttribute");
        v40 = v9;
        v13 = objc_msgSend(v11, "copy");
        v41 = v13;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        v43 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
        sub_10004D4E8(a4, 1, (uint64_t)v23);

      }
      else
      {
        v44 = CFSTR("KCSharingMissingAttribute");
        v45 = v9;
        v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
        sub_10004D4E8(a4, 22, (uint64_t)v13);
      }
      v18 = 0;
LABEL_21:

      goto LABEL_17;
    }
    v48 = CFSTR("KCSharingInvalidAttribute");
    v46 = CFSTR("deln");
    v11 = objc_msgSend(v8, "copy");
    v47 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v49 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v20);

  }
  else
  {
    v50 = CFSTR("KCSharingMissingAttribute");
    v51 = CFSTR("deln");
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v11);
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  CKRecordID *recordID;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[7];

  v17[0] = kSecAttrUUID;
  recordID = self->_recordID;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](recordID, "recordName"));
  v18[0] = v7;
  v17[1] = CFSTR("zone");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingDeletion recordID](self, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v18[1] = v10;
  v17[2] = CFSTR("ownr");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingDeletion recordID](self, "recordID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ownerName"));
  v18[2] = v13;
  v18[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v17[3] = kSecAttrAccessible;
  v17[4] = CFSTR("type");
  v18[4] = &off_100309E00;
  v17[5] = kSecAttrAccessGroup;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryAccessGroup"));

  v17[6] = CFSTR("deln");
  v18[5] = v14;
  v18[6] = &__kCFBooleanTrue;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 7));

  return v15;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
