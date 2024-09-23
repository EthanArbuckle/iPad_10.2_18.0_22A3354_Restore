@implementation CBDRemoteXPCMessageSuccessReply

+ (id)replyToRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithRemoteMessage:success:error:", v9, v5, v8);

  return v10;
}

- (CBDRemoteXPCMessageSuccessReply)initWithRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  CBDRemoteXPCMessageSuccessReply *v10;
  uint64_t v11;
  NSUUID *uuid;
  uint64_t v13;
  NSUUID *inReplyToUUID;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBDRemoteXPCMessageSuccessReply;
  v10 = -[CBDRemoteXPCMessageSuccessReply init](&v16, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    inReplyToUUID = v10->_inReplyToUUID;
    v10->_inReplyToUUID = (NSUUID *)v13;

    v10->_success = a4;
    objc_storeStrong((id *)&v10->_error, a5);
  }

  return v10;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply inReplyToUUID](self, "inReplyToUUID"));
  v8 = -[CBDRemoteXPCMessageSuccessReply success](self, "success");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply error](self, "error"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; uuid = %@, inReplyToUUID = %@, success = %d, error = %@>"),
                    v5,
                    self,
                    v6,
                    v7,
                    v8,
                    v9));

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessageSuccessReply)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CBDRemoteXPCMessageSuccessReply *v6;
  id v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSUUID *inReplyToUUID;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CBDRemoteXPCMessageSuccessReply;
  v6 = -[CBDRemoteXPCMessageSuccessReply init](&v19, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v10), CFSTR("inReplyToUUID"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    inReplyToUUID = v6->_inReplyToUUID;
    v6->_inReplyToUUID = (NSUUID *)v12;

    v6->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError, v14), CFSTR("error"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    error = v6->_error;
    v6->_error = (NSError *)v16;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply uuid](self, "uuid"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply inReplyToUUID](self, "inReplyToUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("inReplyToUUID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CBDRemoteXPCMessageSuccessReply success](self, "success"), CFSTR("success"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply error](self, "error"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CBDRemoteXPCMessageSuccessReply *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *uuid;
  void *v8;
  NSUUID *v9;
  NSUUID *inReplyToUUID;

  v4 = objc_alloc_init(CBDRemoteXPCMessageSuccessReply);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply uuid](self, "uuid"));
    v6 = (NSUUID *)objc_msgSend(v5, "copy");
    uuid = v4->_uuid;
    v4->_uuid = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSuccessReply inReplyToUUID](self, "inReplyToUUID"));
    v9 = (NSUUID *)objc_msgSend(v8, "copy");
    inReplyToUUID = v4->_inReplyToUUID;
    v4->_inReplyToUUID = v9;

    v4->_success = self->_success;
    objc_storeStrong((id *)&v4->_error, self->_error);
  }
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)inReplyToUUID
{
  return self->_inReplyToUUID;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inReplyToUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
