@implementation CBDRemoteXPCMessagePing

- (CBDRemoteXPCMessagePing)init
{
  return -[CBDRemoteXPCMessagePing initWithHandler:](self, "initWithHandler:", 0);
}

- (CBDRemoteXPCMessagePing)initWithHandler:(id)a3
{
  id v4;
  CBDRemoteXPCMessagePing *v5;
  uint64_t v6;
  NSUUID *uuid;
  id v8;
  id handler;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBDRemoteXPCMessagePing;
  v5 = -[CBDRemoteXPCMessagePing init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v8 = objc_retainBlock(v4);
    handler = v5->_handler;
    v5->_handler = v8;

  }
  return v5;
}

+ (id)handshakeWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithHandler:", v4);

  return v5;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessagePing uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; uuid = %@;>"),
                   v5,
                   self,
                   v6));

  return (NSString *)v7;
}

- (Class)replyClass
{
  return (Class)objc_opt_class(CBDRemoteXPCMessagePingReply, a2);
}

- (id)replyWithSuccess:(BOOL)a3 error:(id)a4
{
  return +[CBDRemoteXPCMessagePingReply replyToRemoteMessage:success:error:](CBDRemoteXPCMessagePingReply, "replyToRemoteMessage:success:error:", self, a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessagePing)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CBDRemoteXPCMessagePing *v6;
  id v7;
  uint64_t v8;
  NSUUID *uuid;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBDRemoteXPCMessagePing;
  v6 = -[CBDRemoteXPCMessagePing init](&v11, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v8;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessagePing uuid](self, "uuid"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CBDRemoteXPCMessagePing *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *uuid;

  v4 = objc_alloc_init(CBDRemoteXPCMessagePing);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessagePing uuid](self, "uuid"));
  v6 = (NSUUID *)objc_msgSend(v5, "copy");
  uuid = v4->_uuid;
  v4->_uuid = v6;

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (OS_xpc_remote_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
