@implementation REMSmartListsDataViewInvocation_fetchSmartList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListsDataViewInvocation_fetchSmartList)initWithSmartListType:(id)a3 objectID:(id)a4 createIfNeeded:(BOOL)a5
{
  id v9;
  id v10;
  REMSmartListsDataViewInvocation_fetchSmartList *v11;
  REMSmartListsDataViewInvocation_fetchSmartList *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMSmartListsDataViewInvocation_fetchSmartList;
  v11 = -[REMStoreInvocationValueStorage init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_smartListType, a3);
    objc_storeStrong((id *)&v12->_objectID, a4);
    v12->_createIfNeeded = a5;
  }

  return v12;
}

- (REMSmartListsDataViewInvocation_fetchSmartList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  REMSmartListsDataViewInvocation_fetchSmartList *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartListType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("createIfNeeded"));

  if (v5)
  {
    self = -[REMSmartListsDataViewInvocation_fetchSmartList initWithSmartListType:objectID:createIfNeeded:](self, "initWithSmartListType:objectID:createIfNeeded:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[REMSmartListsDataViewInvocation_fetchSmartList smartListType](self, "smartListType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("smartListType"));

  -[REMSmartListsDataViewInvocation_fetchSmartList objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("objectID"));

  objc_msgSend(v6, "encodeBool:forKey:", -[REMSmartListsDataViewInvocation_fetchSmartList createIfNeeded](self, "createIfNeeded"), CFSTR("createIfNeeded"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  _BOOL4 v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[REMSmartListsDataViewInvocation_fetchSmartList smartListType](self, "smartListType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smartListType");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMSmartListsDataViewInvocation_fetchSmartList smartListType](self, "smartListType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smartListType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[REMSmartListsDataViewInvocation_fetchSmartList objectID](self, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_10;
  }
  v13 = (void *)v12;
  -[REMSmartListsDataViewInvocation_fetchSmartList objectID](self, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
LABEL_10:
    v18 = -[REMSmartListsDataViewInvocation_fetchSmartList createIfNeeded](self, "createIfNeeded");
    v17 = v18 ^ objc_msgSend(v4, "createIfNeeded") ^ 1;
    goto LABEL_11;
  }
LABEL_8:
  LOBYTE(v17) = 0;
LABEL_11:

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMSmartListsDataViewInvocation_fetchSmartList smartListType](self, "smartListType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)smartListType
{
  return self->_smartListType;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (BOOL)createIfNeeded
{
  return self->_createIfNeeded;
}

- (void)setCreateIfNeeded:(BOOL)a3
{
  self->_createIfNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_smartListType, 0);
}

@end
