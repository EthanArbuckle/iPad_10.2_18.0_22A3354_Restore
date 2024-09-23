@implementation RBSAcquisitionCompletionAttribute

- (unint64_t)hash
{
  return self->_policy;
}

- (unint64_t)policy
{
  return self->_policy;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSAcquisitionCompletionAttribute;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_policy == v4[1];

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
  NSStringFromRBSAcquisitionCompletionPolicy(self->_policy);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| policy:%@>"), v4, v5);

  return v6;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSAcquisitionCompletionAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_policy, CFSTR("_policy"), v5.receiver, v5.super_class);

}

+ (id)attributeWithCompletionPolicy:(unint64_t)a3
{
  return -[RBSAcquisitionCompletionAttribute _initWithCompletionPolicy:]([RBSAcquisitionCompletionAttribute alloc], a3);
}

- (RBSAcquisitionCompletionAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSAcquisitionCompletionAttribute *v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSAcquisitionCompletionAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v9, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_policy"));
    if (RBSAcquisitionCompletionPolicyIsValid(v6))
      v7 = v6;
    else
      v7 = 0;
    v5->_policy = v7;
  }

  return v5;
}

- (_QWORD)_initWithCompletionPolicy:(void *)a1
{
  _QWORD *v3;
  unint64_t v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)RBSAcquisitionCompletionAttribute;
  v3 = objc_msgSendSuper2(&v6, sel__init);
  if (v3)
  {
    if (RBSAcquisitionCompletionPolicyIsValid(a2))
      v4 = a2;
    else
      v4 = 0;
    v3[1] = v4;
  }
  return v3;
}

@end
