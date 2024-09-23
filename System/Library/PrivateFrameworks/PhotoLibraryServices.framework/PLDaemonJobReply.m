@implementation PLDaemonJobReply

- (PLDaemonJobReply)initWithReply:(id)a3
{
  PLDaemonJobReply *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLDaemonJobReply;
  result = -[PLDaemonJobReply init](&v5, sel_init);
  if (a3)
  {
    if (result)
      result->_xpcReply = (OS_xpc_object *)a3;
  }
  return result;
}

- (PLDaemonJobReply)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PLDaemonJobReply *v6;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("PL.jobreply"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PLDaemonJobReply initWithReply:](self, "initWithReply:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  objc_msgSend(v4, "encodeXPCObject:forKey:", self->_xpcReply, CFSTR("PL.jobreply"));

}

- (OS_xpc_object)xpcReply
{
  return self->_xpcReply;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
