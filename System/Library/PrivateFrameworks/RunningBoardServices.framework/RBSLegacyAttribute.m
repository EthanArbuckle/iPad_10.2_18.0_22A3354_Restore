@implementation RBSLegacyAttribute

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSLegacyAttribute;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_requestedReason == v4[2]
    && self->_reason == v4[1]
    && self->_flags == v4[3];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSLegacyAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSLegacyAttribute requestedReason](self, "requestedReason", v5.receiver, v5.super_class), CFSTR("requestedReason"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSLegacyAttribute reason](self, "reason"), CFSTR("reason"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSLegacyAttribute flags](self, "flags"), CFSTR("flags"));

}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)requestedReason
{
  return self->_requestedReason;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unint64_t)hash
{
  return self->_reason ^ self->_requestedReason ^ self->_flags;
}

- (RBSLegacyAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSLegacyAttribute *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSLegacyAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v5->_requestedReason = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestedReason"));
    -[RBSLegacyAttribute setReason:](v5, "setReason:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reason")));
    v5->_flags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags"));
  }

  return v5;
}

+ (id)attributeWithReason:(unint64_t)a3 flags:(unint64_t)a4
{
  RBSLegacyAttribute *v6;
  objc_super v8;

  v6 = [RBSLegacyAttribute alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)RBSLegacyAttribute;
    v6 = (RBSLegacyAttribute *)objc_msgSendSuper2(&v8, sel__init);
    if (v6)
    {
      v6->_requestedReason = a3;
      v6->_reason = a3;
      v6->_flags = a4;
    }
  }
  return v6;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSLegacyReason(self->_requestedReason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSLegacyReason(self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSLegacyFlags(self->_flags);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| requestedReason:%@ reason:%@ flags:%@>"), v4, v5, v6, v7);

  return v8;
}

@end
