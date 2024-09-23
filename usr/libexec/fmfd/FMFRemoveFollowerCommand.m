@implementation FMFRemoveFollowerCommand

- (FMFRemoveFollowerCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5
{
  id v8;
  id v9;
  FMFRemoveFollowerCommand *v10;
  FMFRemoveFollowerCommand *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMFRemoveFollowerCommand;
  v10 = -[FMFBaseCmd initWithClientSession:](&v13, "initWithClientSession:", a3);
  v11 = v10;
  if (v10)
  {
    -[FMFRemoveFollowerCommand setHandles:](v10, "setHandles:", v8);
    -[FMFBaseCmd setGroupId:](v11, "setGroupId:", v9);
  }
  else
  {
    objc_msgSend(0, "initFailed");
  }

  return v11;
}

- (id)pathSuffix
{
  return CFSTR("stopOffer");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)FMFRemoveFollowerCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v24, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("groupId"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand packetsToInvalidate](self, "packetsToInvalidate"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand packetsToInvalidate](self, "packetsToInvalidate"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("urls"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand dsIds](self, "dsIds"));
  v10 = objc_msgSend(v9, "count");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand handles](self, "handles"));
  v12 = objc_msgSend(v11, "count");

  if (v10 == v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("dsIds"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
    if (v14)
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("id"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand serverIds](self, "serverIds"));
  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand handles](self, "handles"));
  v18 = objc_msgSend(v17, "count");

  if (v16 == v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("friendIds"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand handleIdentifiers](self, "handleIdentifiers"));
  v21 = v20;
  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("handles"));

  }
  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (id)handleIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("identifier")));

  return v3;
}

- (id)serverIds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("serverId")));

  return v3;
}

- (id)dsIds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveFollowerCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("dsid")));

  return v3;
}

- (NSArray)packetsToInvalidate
{
  return self->_packetsToInvalidate;
}

- (void)setPacketsToInvalidate:(id)a3
{
  objc_storeStrong((id *)&self->_packetsToInvalidate, a3);
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_packetsToInvalidate, 0);
}

@end
