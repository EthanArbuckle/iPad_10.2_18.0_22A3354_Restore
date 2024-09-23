@implementation CKRecord

- (id)ic_loggingDescription
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescriptionIncludingBrackets:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %@"), v3, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordChangeTag](self, "recordChangeTag"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordChangeTag](self, "recordChangeTag"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" changeTag=%@"), v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord share](self, "share"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord share](self, "share"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordName"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" share=%@"), v12);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (int64_t)rd_ckDatabaseScope
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  v3 = objc_msgSend(v2, "rd_ckDatabaseScope");

  return (int64_t)v3;
}

- (BOOL)ic_isOwnedByCurrentUser
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  v3 = objc_msgSend(v2, "ic_isOwnedByCurrentUser");

  return v3;
}

@end
