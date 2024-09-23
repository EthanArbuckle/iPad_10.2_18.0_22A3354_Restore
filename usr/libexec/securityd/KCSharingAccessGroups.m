@implementation KCSharingAccessGroups

- (KCSharingAccessGroups)init
{
  return -[KCSharingAccessGroups initWithEntryAccessGroup:](self, "initWithEntryAccessGroup:", CFSTR("com.apple.security.securityd"));
}

- (KCSharingAccessGroups)initWithEntryAccessGroup:(id)a3
{
  return -[KCSharingAccessGroups initWithEntryAccessGroup:entrySchemaVersion:](self, "initWithEntryAccessGroup:entrySchemaVersion:", a3, 3);
}

- (KCSharingAccessGroups)initWithEntryAccessGroup:(id)a3 entrySchemaVersion:(int64_t)a4
{
  id v6;
  KCSharingAccessGroups *v7;
  NSString *v8;
  NSString *entryAccessGroup;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingAccessGroups;
  v7 = -[KCSharingAccessGroups init](&v11, "init");
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    entryAccessGroup = v7->_entryAccessGroup;
    v7->_entryAccessGroup = v8;

    v7->_entrySchemaVersion = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingAccessGroups entryAccessGroup](self, "entryAccessGroup"));
  v4 = objc_msgSend(v3, "hash");

  return (_BYTE *)-[KCSharingAccessGroups entrySchemaVersion](self, "entrySchemaVersion")
       - (_BYTE *)v4
       + 32 * (_QWORD)v4;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingAccessGroups *v4;
  KCSharingAccessGroups *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;

  v4 = (KCSharingAccessGroups *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (-[KCSharingAccessGroups isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingAccessGroups entryAccessGroup](self, "entryAccessGroup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingAccessGroups entryAccessGroup](v5, "entryAccessGroup"));
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[KCSharingAccessGroups entrySchemaVersion](self, "entrySchemaVersion");
      v9 = v8 == (id)-[KCSharingAccessGroups entrySchemaVersion](v5, "entrySchemaVersion");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)recordTypeIsKnown:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[KCSharingAccessGroups entrySchemaVersion](self, "entrySchemaVersion") < 1)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("item")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqual:", CKRecordTypeShare);
  }

  return v5;
}

- (BOOL)recordHasKnownFields:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v5));

  if (-[KCSharingAccessGroups entrySchemaVersion](self, "entrySchemaVersion") >= 1)
  {
    if (qword_100341458 != -1)
      dispatch_once(&qword_100341458, &stru_1002E98C8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("item"));

    if (v8)
    {
      objc_msgSend(v6, "minusSet:", qword_100341450);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
      v10 = objc_msgSend(v9, "isEqual:", CKRecordTypeShare);

      if (v10)
        objc_msgSend(v6, "removeObject:", CFSTR("displayName"));
    }
  }
  v11 = objc_msgSend(v6, "count") == 0;

  return v11;
}

- (BOOL)recordIsFullyDecoded:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  if (-[KCSharingAccessGroups recordTypeIsKnown:](self, "recordTypeIsKnown:", v5))
    v6 = -[KCSharingAccessGroups recordHasKnownFields:](self, "recordHasKnownFields:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)remoteItemProtoIsFullyDecoded:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[KCSharingAccessGroups entrySchemaVersion](self, "entrySchemaVersion") < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unknownFields"));
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unknownFields"));
      if (v8)
      {
        v6 = 0;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internetPassword"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unknownFields"));
        v6 = v10 == 0;

      }
    }

  }
  return v6;
}

- (NSString)entryAccessGroup
{
  return self->_entryAccessGroup;
}

- (int64_t)entrySchemaVersion
{
  return self->_entrySchemaVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryAccessGroup, 0);
}

@end
