@implementation RBSCPUMinimumUsageGrant

+ (id)grantForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5
{
  return -[RBSCPUMinimumUsageGrant _initWithRole:percentage:duration:]([RBSCPUMinimumUsageGrant alloc], a3, a4, a5);
}

- (id)_initWithRole:(unint64_t)a3 percentage:(double)a4 duration:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  if (result)
  {
    v7 = result;
    if ((a2 & 0xFC) != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_, v7, CFSTR("RBSCPUMinimumUsageGrant.m"), 92, CFSTR("initialized with invalid role"));

    }
    if (a4 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_, v7, CFSTR("RBSCPUMinimumUsageGrant.m"), 93, CFSTR("initialized with invalid duration"));

    }
    if (a3 >= 0x65)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_, v7, CFSTR("RBSCPUMinimumUsageGrant.m"), 94, CFSTR("initialized with invalid percentage"));

    }
    v11.receiver = v7;
    v11.super_class = (Class)RBSCPUMinimumUsageGrant;
    result = objc_msgSendSuper2(&v11, sel__init);
    if (result)
    {
      *((_BYTE *)result + 8) = a2;
      *((_QWORD *)result + 2) = a3;
      *((double *)result + 3) = a4;
    }
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSCPUMinimumUsageGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, CFSTR("role"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_percentage, CFSTR("percentage"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);

}

- (RBSCPUMinimumUsageGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSCPUMinimumUsageGrant *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSCPUMinimumUsageGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v5->_role = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("role"));
    v5->_percentage = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("percentage"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSCPUMinimumUsageGrant;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_role == *((unsigned __int8 *)v4 + 8)
    && self->_percentage == *((_QWORD *)v4 + 2)
    && self->_duration == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  void *v3;
  unint64_t v4;

  v2 = self->_percentage ^ self->_role;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 ^ objc_msgSend(v3, "hash");

  return v4;
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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| role:%@ percentage:%lu duration:%.2f>"), v4, v5, self->_percentage, *(_QWORD *)&self->_duration);

  return v6;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (double)duration
{
  return self->_duration;
}

- (unsigned)role
{
  return self->_role;
}

@end
