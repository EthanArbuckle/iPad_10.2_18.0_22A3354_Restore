@implementation RBSCPUMaximumUsageLimitation

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = self->_percentage ^ self->_role;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ self->_violationPolicy ^ objc_msgSend(v4, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSCPUMaximumUsageLimitation;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_role == *((unsigned __int8 *)v4 + 8)
    && self->_percentage == *((_QWORD *)v4 + 2)
    && self->_duration == v4[3]
    && self->_violationPolicy == *((_QWORD *)v4 + 4);

  return v5;
}

- (unint64_t)violationPolicy
{
  return self->_violationPolicy;
}

- (unsigned)role
{
  return self->_role;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (double)duration
{
  return self->_duration;
}

+ (id)limitationForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5 violationPolicy:(unint64_t)a6
{
  return -[RBSCPUMaximumUsageLimitation _initWithRole:percentage:duration:violationPolicy:]([RBSCPUMaximumUsageLimitation alloc], a3, a4, a6, a5);
}

- (id)_initWithRole:(unint64_t)a3 percentage:(unint64_t)a4 duration:(double)a5 violationPolicy:
{
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  if (result)
  {
    v8 = a2;
    v9 = result;
    if ((a2 - 8) <= 0xFFFFFFF9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_violationPolicy_, v9, CFSTR("RBSCPUMaximumUsageLimitation.m"), 119, CFSTR("initialized with invalid role"));

    }
    if (a4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_violationPolicy_, v9, CFSTR("RBSCPUMaximumUsageLimitation.m"), 120, CFSTR("initialized with invalid violation policy"));

    }
    if (a5 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_violationPolicy_, v9, CFSTR("RBSCPUMaximumUsageLimitation.m"), 121, CFSTR("initialized with invalid duration"));

    }
    if (a3 >= 0x65)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithRole_percentage_duration_violationPolicy_, v9, CFSTR("RBSCPUMaximumUsageLimitation.m"), 122, CFSTR("initialized with invalid percentage"));

    }
    v14.receiver = v9;
    v14.super_class = (Class)RBSCPUMaximumUsageLimitation;
    result = objc_msgSendSuper2(&v14, sel__init);
    if (result)
    {
      *((_BYTE *)result + 8) = v8;
      *((_QWORD *)result + 2) = a3;
      *((double *)result + 3) = a5;
      *((_QWORD *)result + 4) = a4;
    }
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t violationPolicy;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSRole(self->_role);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  violationPolicy = self->_violationPolicy;
  if (violationPolicy > 2)
    v8 = CFSTR("(undefined)");
  else
    v8 = off_1E2D16CD8[violationPolicy];
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| role:%@ percentage:%lu duration:%.2f violationPolicy:%@>"), v4, v5, self->_percentage, *(_QWORD *)&self->_duration, v8);

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSCPUMaximumUsageLimitation;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, CFSTR("role"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_percentage, CFSTR("percentage"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_violationPolicy, CFSTR("violationPolicy"));

}

- (RBSCPUMaximumUsageLimitation)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSCPUMaximumUsageLimitation *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSCPUMaximumUsageLimitation;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v5->_role = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("role"));
    v5->_percentage = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("percentage"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v6;
    v5->_violationPolicy = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("violationPolicy"));
  }

  return v5;
}

@end
