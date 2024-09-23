@implementation CBDRemoteXPCMessageStartDiagnostics

- (CBDRemoteXPCMessageStartDiagnostics)init
{
  CBDRemoteXPCMessageStartDiagnostics *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBDRemoteXPCMessageStartDiagnostics;
  v2 = -[CBDRemoteXPCMessageStartDiagnostics init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

  }
  return v2;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageStartDiagnostics uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; uuid = %@;>"),
                   v5,
                   self,
                   v6));

  return (NSString *)v7;
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

- (CBDRemoteXPCMessageStartDiagnostics)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CBDRemoteXPCMessageStartDiagnostics *v6;
  id v7;
  uint64_t v8;
  NSUUID *uuid;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBDRemoteXPCMessageStartDiagnostics;
  v6 = -[CBDRemoteXPCMessageStartDiagnostics init](&v11, "init");
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
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageStartDiagnostics uuid](self, "uuid"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CBDRemoteXPCMessageStartDiagnostics *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *uuid;

  v4 = objc_alloc_init(CBDRemoteXPCMessageStartDiagnostics);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageStartDiagnostics uuid](self, "uuid"));
  v6 = (NSUUID *)objc_msgSend(v5, "copy");
  uuid = v4->_uuid;
  v4->_uuid = v6;

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
