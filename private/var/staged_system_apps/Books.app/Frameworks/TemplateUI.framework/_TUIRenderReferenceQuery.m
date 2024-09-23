@implementation _TUIRenderReferenceQuery

- (TUIIdentifier)identifier
{
  return 0;
}

- (BOOL)matchesUUID:(id)a3 uid:(id)a4
{
  NSUUID *v6;
  NSString *v7;
  unsigned __int8 v8;
  NSUUID *UUID;
  BOOL v11;
  NSString *uid;

  v6 = (NSUUID *)a3;
  v7 = (NSString *)a4;
  if (self->_matchedUUID)
  {
    v8 = 1;
  }
  else
  {
    UUID = self->_UUID;
    if (UUID)
      v11 = UUID == v6;
    else
      v11 = 1;
    if (v11 || -[NSUUID isEqual:](UUID, "isEqual:", v6))
    {
      uid = self->_uid;
      v8 = 1;
      if (uid && uid != v7)
        v8 = -[NSString isEqualToString:](uid, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)matchesRefId:(id)a3 refInstance:(id)a4 identifier:(id)a5
{
  NSString *v8;
  NSString *v9;
  id v10;
  NSString *refId;
  BOOL v12;
  NSString *refInstance;
  unsigned __int8 v14;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = a5;
  refId = self->_refId;
  if (refId)
    v12 = refId == v8;
  else
    v12 = 1;
  if (v12 || -[NSString isEqualToString:](refId, "isEqualToString:", v8))
  {
    refInstance = self->_refInstance;
    v14 = 1;
    if (refInstance && refInstance != v9)
      v14 = -[NSString isEqualToString:](refInstance, "isEqualToString:", v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)queryMatchedWithUUID:(id)a3 uid:(id)a4
{
  id v6;
  id v7;
  _TUIRenderReferenceQuery *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_TUIRenderReferenceQuery);
  -[_TUIRenderReferenceQuery setRefId:](v8, "setRefId:", self->_refId);
  -[_TUIRenderReferenceQuery setRefInstance:](v8, "setRefInstance:", self->_refInstance);
  -[_TUIRenderReferenceQuery setUUID:](v8, "setUUID:", v7);

  -[_TUIRenderReferenceQuery setUid:](v8, "setUid:", v6);
  -[_TUIRenderReferenceQuery setMatchedUUID:](v8, "setMatchedUUID:", 1);
  return v8;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (void)setRefInstance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)matchedUUID
{
  return self->_matchedUUID;
}

- (void)setMatchedUUID:(BOOL)a3
{
  self->_matchedUUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
