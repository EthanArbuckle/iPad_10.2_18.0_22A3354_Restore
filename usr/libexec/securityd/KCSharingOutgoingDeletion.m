@implementation KCSharingOutgoingDeletion

- (KCSharingOutgoingDeletion)initWithDeletedLocalItemForMirrorEntry:(id)a3
{
  void *v4;
  KCSharingOutgoingDeletion *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "record"));
  v5 = -[KCSharingOutgoingDeletion initWithDeletedRecord:](self, "initWithDeletedRecord:", v4);

  return v5;
}

- (KCSharingOutgoingDeletion)initWithDeletedRecord:(id)a3
{
  id v4;
  KCSharingOutgoingDeletion *v5;
  uint64_t v6;
  CKRecordID *recordID;
  uint64_t v8;
  NSString *recordChangeTag;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingOutgoingDeletion;
  v5 = -[KCSharingOutgoingDeletion init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordChangeTag"));
    recordChangeTag = v5->_recordChangeTag;
    v5->_recordChangeTag = (NSString *)v8;

  }
  return v5;
}

- (KCSharingOutgoingDeletion)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingOutgoingDeletion *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  KCSharingOutgoingDeletion *v19;
  id *v20;
  uint64_t v21;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  const __CFString *v28;
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
  id v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  id v47;
  const __CFString *v48;
  id v49;
  const __CFString *v50;
  const __CFString *v51;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)KCSharingOutgoingDeletion;
  v7 = -[KCSharingOutgoingDeletion init](&v27, "init");
  if (!v7)
    goto LABEL_15;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deln")));
  v9 = (void *)v8;
  if (!v8)
  {
    v50 = CFSTR("KCSharingMissingAttribute");
    v51 = CFSTR("deln");
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v12);
    goto LABEL_21;
  }
  if (!_NSIsNSNumber(v8) || (objc_msgSend(v9, "BOOLValue") & 1) == 0)
  {
    v48 = CFSTR("KCSharingInvalidAttribute");
    v46 = CFSTR("deln");
    v12 = objc_msgSend(v9, "copy");
    v47 = v12;
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v49 = v14;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    v20 = a4;
    v21 = 1;
LABEL_17:
    sub_10004D4E8(v20, v21, (uint64_t)v16);
LABEL_18:

LABEL_19:
LABEL_21:

    goto LABEL_22;
  }
  v10 = kSecAttrUUID;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrUUID));
  v12 = (id)v11;
  if (!v11)
  {
    v44 = CFSTR("KCSharingMissingAttribute");
    v45 = v10;
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v14);
    goto LABEL_19;
  }
  if (!_NSIsNSString(v11) || !objc_msgSend(v12, "length"))
  {
    v42 = CFSTR("KCSharingInvalidAttribute");
    v40 = v10;
    v14 = objc_msgSend(v12, "copy");
    v41 = v14;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v43 = v16;
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v23);
LABEL_25:

    goto LABEL_18;
  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zone")));
  v14 = (id)v13;
  if (!v13)
  {
    v38 = CFSTR("KCSharingMissingAttribute");
    v39 = CFSTR("zone");
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v20 = a4;
    v21 = 22;
    goto LABEL_17;
  }
  if (!_NSIsNSString(v13) || !objc_msgSend(v14, "length"))
  {
    v36 = CFSTR("KCSharingInvalidAttribute");
    v34 = CFSTR("zone");
    v16 = objc_msgSend(v14, "copy");
    v35 = v16;
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v37 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v24);
LABEL_28:

    goto LABEL_25;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ownr")));
  if (!v15)
  {
    v32 = CFSTR("KCSharingMissingAttribute");
    v33 = CFSTR("ownr");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v26);

    v16 = 0;
    goto LABEL_18;
  }
  v16 = (id)v15;
  if (!_NSIsNSString(v15) || !objc_msgSend(v16, "length"))
  {
    v30 = CFSTR("KCSharingInvalidAttribute");
    v28 = CFSTR("ownr");
    v23 = objc_msgSend(v16, "copy");
    v29 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v31 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v25);

    goto LABEL_28;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecValueData));
  v18 = -[KCSharingOutgoingDeletion setRecordIDAndChangeTagFromData:error:](v7, "setRecordIDAndChangeTagFromData:error:", v17, a4);

  if ((v18 & 1) == 0)
  {
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
LABEL_15:
  v19 = v7;
LABEL_23:

  return v19;
}

- (KCSharingOutgoingDeletion)initWithPlaceholderOutgoingDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingOutgoingDeletion *v6;
  void *v7;
  const __CFSet *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  KCSharingOutgoingDeletion *v15;
  void *v16;
  objc_super v18;
  const __CFString *v19;
  CFStringRef v20;
  CFStringRef v21;

  v18.receiver = self;
  v18.super_class = (Class)KCSharingOutgoingDeletion;
  v6 = -[KCSharingOutgoingDeletion init](&v18, "init");
  if (!v6)
    goto LABEL_5;
  v21 = kSecValueData;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v8 = (const __CFSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  v9 = sub_10000A15C(a3, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSecValueData));

  if (!v12)
  {
    v19 = CFSTR("KCSharingMissingAttribute");
    v20 = kSecValueData;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v16);

LABEL_7:
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kSecValueData));
  v14 = -[KCSharingOutgoingDeletion setRecordIDAndChangeTagFromData:error:](v6, "setRecordIDAndChangeTagFromData:error:", v13, a4);

  if (!v14)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v15 = v6;
LABEL_9:

  return v15;
}

- (id)serializeRecordIDAndChangeTag
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;

  v9 = CFSTR("recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:](NSKeyedArchiver, "archivedDataWithRootObject:", self->_recordID));
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->_recordChangeTag, "dataUsingEncoding:", 4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("changeTag"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:](NSKeyedArchiver, "archivedDataWithRootObject:", v5));
  return v7;
}

- (BOOL)setRecordIDAndChangeTagFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CKRecordID *v13;
  CKRecordID *recordID;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  NSString *recordChangeTag;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;

  v6 = a3;
  v7 = objc_opt_class(NSString);
  v8 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v7, objc_opt_class(NSData), v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    v21 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 26, 0);
LABEL_11:
    v20 = 0;
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recordID")));

  if (!v10)
  {
    v31 = CFSTR("KCSharingMissingAttribute");
    v32 = CFSTR("recordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v22);
LABEL_10:

    goto LABEL_11;
  }
  v11 = objc_opt_class(CKRecordID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recordID")));
  v13 = (CKRecordID *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v11, v12, a4));
  recordID = self->_recordID;
  self->_recordID = v13;

  if (!self->_recordID)
  {
    v29 = CFSTR("KCSharingInvalidAttribute");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recordID")));
    v30 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v23);

    goto LABEL_10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("changeTag")));
  if (v15
    && (v16 = objc_alloc((Class)NSString),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("changeTag"))),
        v18 = (NSString *)objc_msgSend(v16, "initWithData:encoding:", v17, 4),
        recordChangeTag = self->_recordChangeTag,
        self->_recordChangeTag = v18,
        recordChangeTag,
        v17,
        !self->_recordChangeTag))
  {
    v27 = CFSTR("KCSharingInvalidAttribute");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("changeTag")));
    v28 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v25);

    v20 = 0;
  }
  else
  {
    v20 = 1;
  }

LABEL_14:
  return v20;
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
  void *v16;
  _QWORD v18[8];
  _QWORD v19[8];

  v18[0] = kSecAttrUUID;
  recordID = self->_recordID;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](recordID, "recordName"));
  v19[0] = v7;
  v18[1] = kSecValueData;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion serializeRecordIDAndChangeTag](self, "serializeRecordIDAndChangeTag"));
  v19[1] = v8;
  v18[2] = CFSTR("zone");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion recordID](self, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v19[2] = v11;
  v18[3] = CFSTR("ownr");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion recordID](self, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ownerName"));
  v19[3] = v14;
  v19[4] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v18[4] = kSecAttrAccessible;
  v18[5] = CFSTR("type");
  v19[5] = &off_100309DE8;
  v18[6] = kSecAttrAccessGroup;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryAccessGroup"));

  v18[7] = CFSTR("deln");
  v19[6] = v15;
  v19[7] = &__kCFBooleanTrue;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 8));

  return v16;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)recordChangeTag
{
  return self->_recordChangeTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordChangeTag, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
