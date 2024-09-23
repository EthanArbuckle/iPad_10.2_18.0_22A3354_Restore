@implementation RBSSuspendableCPUGrant

+ (id)grantWithRole:(unsigned __int8)a3
{
  return -[RBSSuspendableCPUGrant _initWithRole:](objc_alloc((Class)a1), a3);
}

- (id)_initWithRole:(id)result
{
  char v2;
  void *v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v2 = a2;
    v3 = result;
    if ((a2 - 8) <= 0xFFFFFFF8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_, v3, CFSTR("RBSSuspendableCPUGrant.m"), 78, CFSTR("initialized with invalid role"));

    }
    v5.receiver = v3;
    v5.super_class = (Class)RBSSuspendableCPUGrant;
    result = objc_msgSendSuper2(&v5, sel__init);
    if (result)
      *((_BYTE *)result + 8) = v2;
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSSuspendableCPUGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, CFSTR("role"), v5.receiver, v5.super_class);

}

- (RBSSuspendableCPUGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSSuspendableCPUGrant *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSSuspendableCPUGrant;
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

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSSuspendableCPUGrant;
  if (-[RBSAttribute isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_role == v4[8];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return self->_role;
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

- (unsigned)role
{
  return self->_role;
}

@end
