@implementation CBDRemoteXPCMessageSetup

+ (id)setProxyWithServer:(id)a3 port:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithServer:port:token:", v10, v9, v8);

  return v11;
}

- (CBDRemoteXPCMessageSetup)init
{
  return -[CBDRemoteXPCMessageSetup initWithServer:port:token:](self, "initWithServer:port:token:", &stru_10000C8C0, &off_10000CA80, 0);
}

- (CBDRemoteXPCMessageSetup)initWithServer:(id)a3 port:(id)a4 token:(id)a5
{
  id v9;
  id v10;
  id v11;
  CBDRemoteXPCMessageSetup *v12;
  uint64_t v13;
  NSUUID *uuid;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBDRemoteXPCMessageSetup;
  v12 = -[CBDRemoteXPCMessageSetup init](&v16, "init");
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_server, a3);
    objc_storeStrong((id *)&v12->_port, a4);
    objc_storeStrong((id *)&v12->_token, a5);
  }

  return v12;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup server](self, "server"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup port](self, "port"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup token](self, "token"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; uuid = %@, server = %@, port = %@, token = %@>"),
                    v5,
                    self,
                    v6,
                    v7,
                    v8,
                    v9));

  return (NSString *)v10;
}

- (Class)replyClass
{
  return (Class)objc_opt_class(CBDRemoteXPCMessageSuccessReply, a2);
}

- (id)replyWithSuccess:(BOOL)a3 error:(id)a4
{
  return +[CBDRemoteXPCMessageSuccessReply replyToRemoteMessage:success:error:](CBDRemoteXPCMessageSuccessReply, "replyToRemoteMessage:success:error:", self, a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessageSetup)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CBDRemoteXPCMessageSetup *v6;
  id v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *server;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSNumber *port;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSString *token;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CBDRemoteXPCMessageSetup;
  v6 = -[CBDRemoteXPCMessageSetup init](&v23, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("server"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    server = v6->_server;
    v6->_server = (NSString *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v14), CFSTR("port"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    port = v6->_port;
    v6->_port = (NSNumber *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), CFSTR("token"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    token = v6->_token;
    v6->_token = (NSString *)v20;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup uuid](self, "uuid"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup server](self, "server"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("server"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup port](self, "port"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("port"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup token](self, "token"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("token"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CBDRemoteXPCMessageSetup *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *uuid;
  void *v8;
  NSString *v9;
  NSString *server;
  void *v11;
  NSNumber *v12;
  NSNumber *port;
  void *v14;
  NSString *v15;
  NSString *token;

  v4 = objc_alloc_init(CBDRemoteXPCMessageSetup);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup uuid](self, "uuid"));
  v6 = (NSUUID *)objc_msgSend(v5, "copy");
  uuid = v4->_uuid;
  v4->_uuid = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup server](self, "server"));
  v9 = (NSString *)objc_msgSend(v8, "copy");
  server = v4->_server;
  v4->_server = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup port](self, "port"));
  v12 = (NSNumber *)objc_msgSend(v11, "copy");
  port = v4->_port;
  v4->_port = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetup token](self, "token"));
  v15 = (NSString *)objc_msgSend(v14, "copy");
  token = v4->_token;
  v4->_token = v15;

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)server
{
  return self->_server;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
