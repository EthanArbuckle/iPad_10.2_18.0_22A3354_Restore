@implementation RBSGPUAccessGrant

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
  v7.super_class = (Class)RBSGPUAccessGrant;
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
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithRole:", 2);
}

+ (id)grantWithRole:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithRole:", a3);
}

- (id)_initWithRole:(unsigned __int8)a3
{
  id result;
  void *v7;
  objc_super v8;

  if ((a3 - 5) <= 0xFFFFFFFB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSGPUAccessGrant.m"), 29, CFSTR("initialized with invalid role"));

  }
  v8.receiver = self;
  v8.super_class = (Class)RBSGPUAccessGrant;
  result = -[RBSAttribute _init](&v8, sel__init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSGPUAccessGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, CFSTR("role"), v5.receiver, v5.super_class);

}

- (RBSGPUAccessGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSGPUAccessGrant *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSGPUAccessGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("role"));
    if (v6 < 5u)
    {
      if (v6)
        v5->_role = v6;
      else
        v5->_role = 1;
    }
    else
    {
      v5->_role = 4;
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
  NSStringFromRBSGPURole(self->_role);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| role:%@>"), v4, v5);

  return v6;
}

@end
