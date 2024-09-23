@implementation RBSRunningReasonAttribute

- (unint64_t)hash
{
  return self->_runningReason;
}

- (unint64_t)runningReason
{
  return self->_runningReason;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSRunningReasonAttribute;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_runningReason == v4[1];

  return v5;
}

+ (id)withReason:(unint64_t)a3
{
  RBSRunningReasonAttribute *v4;
  objc_super v6;

  v4 = [RBSRunningReasonAttribute alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSRunningReasonAttribute;
    v4 = (RBSRunningReasonAttribute *)objc_msgSendSuper2(&v6, sel__init);
    if (v4)
      v4->_runningReason = a3;
  }
  return v4;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSRunningReasonAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_runningReason, CFSTR("_runningReason"), v5.receiver, v5.super_class);

}

- (RBSRunningReasonAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSRunningReasonAttribute *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSRunningReasonAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
    v5->_runningReason = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_runningReason"));

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
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| runningReason:%llu>"), v4, self->_runningReason);

  return v5;
}

@end
