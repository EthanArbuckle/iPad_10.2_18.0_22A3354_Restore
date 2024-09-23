@implementation _TUIRenderIdentifierQuery

- (NSString)refId
{
  return 0;
}

- (NSString)refInstance
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
  return -[TUIIdentifier isEqual:](self->_identifier, "isEqual:", a5, a4);
}

- (id)queryMatchedWithUUID:(id)a3 uid:(id)a4
{
  id v6;
  id v7;
  _TUIRenderIdentifierQuery *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_TUIRenderIdentifierQuery);
  -[_TUIRenderIdentifierQuery setIdentifier:](v8, "setIdentifier:", self->_identifier);
  -[_TUIRenderIdentifierQuery setUUID:](v8, "setUUID:", v7);

  -[_TUIRenderIdentifierQuery setUid:](v8, "setUid:", v6);
  -[_TUIRenderIdentifierQuery setMatchedUUID:](v8, "setMatchedUUID:", 1);
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

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
