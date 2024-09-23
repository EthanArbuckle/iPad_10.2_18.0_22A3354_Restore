@implementation RBSCPUAccessGrant

- (unint64_t)hash
{
  return self->_role;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSCPUAccessGrant;
  if (-[RBSAttribute isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_role == v4[8];
  else
    v5 = 0;

  return v5;
}

- (unsigned)role
{
  return self->_role;
}

+ (id)grant
{
  return -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 2);
}

- (id)_initWithRole:(id)result
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if ((a2 - 8) <= 0xFFFFFFF8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_, v3, CFSTR("RBSCPUAccessGrant.m"), 96, CFSTR("initialized with invalid role"));

    }
    rbs_assertion_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = a2;
      _os_log_impl(&dword_190CD6000, v4, OS_LOG_TYPE_DEFAULT, "RBSCPUAccessGrant with role: %d", buf, 8u);
    }

    v6.receiver = v3;
    v6.super_class = (Class)RBSCPUAccessGrant;
    result = objc_msgSendSuper2(&v6, sel__init);
    if (result)
      *((_BYTE *)result + 8) = a2;
  }
  return result;
}

+ (id)grantUserInitiated
{
  return -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 4);
}

+ (id)grantWithUserInteractivity
{
  return -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 5);
}

+ (id)grantWithUserInteractivityAndFocus
{
  return -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 7);
}

+ (id)grantWithRole:(unsigned __int8)a3
{
  return -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], a3);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSCPUAccessGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, CFSTR("role"), v5.receiver, v5.super_class);

}

- (RBSCPUAccessGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSCPUAccessGrant *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSCPUAccessGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("role"));
    if (v6 < 8u)
    {
      if (v6)
        v5->_role = v6;
      else
        v5->_role = 1;
    }
    else
    {
      v5->_role = 7;
    }
  }

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSRole(self->_role);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| role:%@>"), v4, v5);

  return v6;
}

@end
