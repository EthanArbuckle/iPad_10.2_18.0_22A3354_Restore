@implementation CKRecordID

- (id)ic_loggingDescriptionIncludingBrackets:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "appendString:", CFSTR("<"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  objc_msgSend(v6, "appendString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ownerName"));
  v12 = objc_msgSend(v11, "isEqualToString:", CKCurrentUserDefaultName);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ownerName"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v16 = CKDatabaseScopeString(objc_msgSend(v15, "rd_ckDatabaseScope"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v17);

  if (v3)
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)ic_loggingDescription
{
  return -[CKRecordID ic_loggingDescriptionIncludingBrackets:](self, "ic_loggingDescriptionIncludingBrackets:", 1);
}

- (int64_t)rd_ckDatabaseScope
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v3 = objc_msgSend(v2, "rd_ckDatabaseScope");

  return (int64_t)v3;
}

- (BOOL)ic_isOwnedByCurrentUser
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v3 = objc_msgSend(v2, "ic_isOwnedByCurrentUser");

  return v3;
}

- (BOOL)ic_isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  unsigned __int8 v37;

  v4 = a3;
  v6 = objc_opt_class(CKRecordID, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    goto LABEL_12;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  v8 = objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  if (v7 == (void *)v8)
  {

  }
  else
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
  if (v14 == (void *)v16)
  {

  }
  else
  {
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneName"));
    v36 = objc_msgSend(v19, "isEqual:", v21);

    if ((v36 & 1) == 0)
      goto LABEL_12;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ownerName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ownerName"));
  if (v23 == (void *)v25)
  {

    goto LABEL_15;
  }
  v26 = (void *)v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ownerName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ownerName"));
  v37 = objc_msgSend(v28, "isEqual:", v30);

  if ((v37 & 1) != 0)
  {
LABEL_15:
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
    v34 = objc_msgSend(v33, "databaseScope");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
    v31 = v34 == objc_msgSend(v35, "databaseScope");

    goto LABEL_13;
  }
LABEL_12:
  v31 = 0;
LABEL_13:

  return v31;
}

@end
