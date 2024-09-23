@implementation RBSAppNapPreventTimerThrottleGrant

+ (id)grant
{
  __assert_rtn("+[RBSAppNapPreventTimerThrottleGrant grant]", "RBSAppNapPreventTimerThrottleGrant.m", 20, "false");
}

+ (id)grantWithTier:(unsigned __int8)a3
{
  return -[RBSAppNapPreventTimerThrottleGrant _initWithTier:]([RBSAppNapPreventTimerThrottleGrant alloc], a3);
}

- (_BYTE)_initWithTier:(_BYTE *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)RBSAppNapPreventTimerThrottleGrant;
    result = objc_msgSendSuper2(&v3, sel__init);
    if (result)
    {
      if (a2 >= 6)
        -[RBSAppNapPreventTimerThrottleGrant _initWithTier:].cold.1();
      result[8] = a2;
    }
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSAppNapPreventTimerThrottleGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_tier, CFSTR("_tier"), v5.receiver, v5.super_class);

}

- (RBSAppNapPreventTimerThrottleGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSAppNapPreventTimerThrottleGrant *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSAppNapPreventTimerThrottleGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
    v5->_tier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_tier"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSAppNapPreventTimerThrottleGrant;
  if (-[RBSAttribute isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_tier == v4[8];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return self->_tier;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| tier:%d>"), v4, self->_tier);

  return v5;
}

- (unsigned)tier
{
  return self->_tier;
}

- (void)_initWithTier:.cold.1()
{
  __assert_rtn("-[RBSAppNapPreventTimerThrottleGrant _initWithTier:]", "RBSAppNapPreventTimerThrottleGrant.m", 29, "RBSAppNapPreventTimerThrottleTier0 <= tier && tier <= RBSAppNapPreventTimerThrottleTier5");
}

@end
