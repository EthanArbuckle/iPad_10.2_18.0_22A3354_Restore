@implementation RBSResistTerminationGrant

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSResistTerminationGrant;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_resistance == v4[8];

  return v5;
}

- (unsigned)resistance
{
  return self->_resistance;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  NSStringFromRBSTerminationResistance(self->_resistance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)grantWithResistance:(unsigned __int8)a3
{
  return -[RBSResistTerminationGrant _initWithResistance:]([RBSResistTerminationGrant alloc], a3);
}

- (id)_initWithResistance:(id)result
{
  char v2;
  void *v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v2 = a2;
    v3 = result;
    if ((a2 - 51) <= 0xFFFFFFCD)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithResistance_, v3, CFSTR("RBSResistTerminationGrant.m"), 65, CFSTR("initialized with invalid resistance"));

    }
    v5.receiver = v3;
    v5.super_class = (Class)RBSResistTerminationGrant;
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
  v5.super_class = (Class)RBSResistTerminationGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_resistance, CFSTR("_resistance"), v5.receiver, v5.super_class);

}

- (RBSResistTerminationGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSResistTerminationGrant *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSResistTerminationGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
    v5->_resistance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_resistance"));

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
  NSStringFromRBSTerminationResistance(self->_resistance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| terminationResistance:%@>"), v4, v5);

  return v6;
}

@end
