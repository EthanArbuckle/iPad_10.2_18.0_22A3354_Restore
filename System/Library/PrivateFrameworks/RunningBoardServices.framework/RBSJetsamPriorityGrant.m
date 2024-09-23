@implementation RBSJetsamPriorityGrant

- (unint64_t)hash
{
  return self->_band;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSJetsamPriorityGrant;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_band == v4[1];

  return v5;
}

- (unint64_t)band
{
  return self->_band;
}

+ (id)grantWithBand:(unint64_t)a3
{
  RBSJetsamPriorityGrant *v4;
  objc_super v6;

  v4 = [RBSJetsamPriorityGrant alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSJetsamPriorityGrant;
    v4 = (RBSJetsamPriorityGrant *)objc_msgSendSuper2(&v6, sel__init);
    if (v4)
      v4->_band = a3;
  }
  return v4;
}

+ (id)grantWithForegroundPriority
{
  return (id)objc_msgSend(a1, "grantWithBand:", 100);
}

+ (id)grantWithBackgroundPriority
{
  return (id)objc_msgSend(a1, "grantWithBand:", 40);
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSJetsamPriorityGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_band, CFSTR("_band"), v5.receiver, v5.super_class);

}

- (RBSJetsamPriorityGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSJetsamPriorityGrant *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSJetsamPriorityGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
    v5->_band = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_band"));

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| band:%d>"), v4, self->_band);

  return v5;
}

@end
