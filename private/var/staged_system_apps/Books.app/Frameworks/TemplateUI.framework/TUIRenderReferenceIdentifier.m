@implementation TUIRenderReferenceIdentifier

- (TUIRenderReferenceIdentifier)initWithUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TUIRenderReferenceIdentifier *v14;
  NSUUID *v15;
  NSUUID *UUID;
  NSString *v17;
  NSString *uid;
  NSString *v19;
  NSString *refId;
  NSString *v21;
  NSString *refInstance;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TUIRenderReferenceIdentifier;
  v14 = -[TUIRenderReferenceIdentifier init](&v24, "init");
  if (v14)
  {
    v15 = (NSUUID *)objc_msgSend(v10, "copy");
    UUID = v14->_UUID;
    v14->_UUID = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    uid = v14->_uid;
    v14->_uid = v17;

    v19 = (NSString *)objc_msgSend(v12, "copy");
    refId = v14->_refId;
    v14->_refId = v19;

    v21 = (NSString *)objc_msgSend(v13, "copy");
    refInstance = v14->_refInstance;
    v14->_refInstance = v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  unsigned __int8 v12;
  NSUUID *UUID;
  NSString *uid;
  NSString *refId;
  NSString *refInstance;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(self, v4);
    if (v6 == objc_opt_class(v5, v7))
    {
      v11 = v5;
    }
    else
    {
      v9 = objc_opt_class(TUIRenderReferenceIdentifier, v8);
      v10 = TUIDynamicCast(v9, v5);
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue(v10);
      if (!v11)
        goto LABEL_15;
    }
    UUID = self->_UUID;
    if (UUID == (NSUUID *)v11[1] || -[NSUUID isEqual:](UUID, "isEqual:"))
    {
      uid = self->_uid;
      if (uid == (NSString *)v11[2] || -[NSString isEqualToString:](uid, "isEqualToString:"))
      {
        refId = self->_refId;
        if (refId == (NSString *)v11[3] || -[NSString isEqualToString:](refId, "isEqualToString:"))
        {
          refInstance = self->_refInstance;
          if (refInstance == (NSString *)v11[4])
            v12 = 1;
          else
            v12 = -[NSString isEqualToString:](refInstance, "isEqualToString:");
          goto LABEL_16;
        }
      }
    }
LABEL_15:
    v12 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = (unint64_t)-[NSUUID hash](self->_UUID, "hash");
  v4 = -[NSString hash](self->_uid, "hash") ^ v3;
  v5 = -[NSString hash](self->_refId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_refInstance, "hash");
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
