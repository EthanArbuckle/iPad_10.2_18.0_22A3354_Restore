@implementation RBSDurationAttribute

- (unint64_t)startPolicy
{
  return self->_startPolicy;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = self->_endPolicy ^ self->_startPolicy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_invalidationDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_warningDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSDurationAttribute;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_startPolicy == *((_QWORD *)v4 + 3)
    && self->_endPolicy == *((_QWORD *)v4 + 4)
    && vabdd_f64(self->_invalidationDuration, *((double *)v4 + 1)) < 0.00000011920929
    && vabdd_f64(self->_warningDuration, *((double *)v4 + 2)) < 0.00000011920929;

  return v5;
}

- (double)invalidationDuration
{
  return self->_invalidationDuration;
}

- (double)warningDuration
{
  return self->_warningDuration;
}

- (unint64_t)endPolicy
{
  return self->_endPolicy;
}

+ (id)terminateAfterInterval:(double)a3
{
  return (id)objc_msgSend(a1, "attributeWithDuration:warningDuration:startPolicy:endPolicy:", 1, 2, a3, 0.0);
}

+ (id)invalidateAfterInterval:(double)a3
{
  return (id)objc_msgSend(a1, "attributeWithDuration:warningDuration:startPolicy:endPolicy:", 1, 1, a3, 0.0);
}

+ (id)attributeWithDuration:(double)a3 warningDuration:(double)a4 startPolicy:(unint64_t)a5 endPolicy:(unint64_t)a6
{
  return -[RBSDurationAttribute _initWithInvalidationDuration:warningDuration:startPolicy:endPolicy:]([RBSDurationAttribute alloc], a5, a6, a3, a4);
}

- (id)_initWithInvalidationDuration:(unint64_t)a3 warningDuration:(double)a4 startPolicy:(double)a5 endPolicy:
{
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  if (result)
  {
    v9 = result;
    if (a4 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_, v9, CFSTR("RBSDurationAttribute.m"), 121, CFSTR("Initialized with invalid invalidationDuration"));

    }
    if (a5 < 0.0 || a5 >= a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_, v9, CFSTR("RBSDurationAttribute.m"), 122, CFSTR("Initialized with invalid warningDuration"));

    }
    if ((unint64_t)(a2 - 104) <= 0xFFFFFFFFFFFFFF98)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_, v9, CFSTR("RBSDurationAttribute.m"), 123, CFSTR("Initialized with invalid startPolicy"));

    }
    if (a3 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_, v9, CFSTR("RBSDurationAttribute.m"), 124, CFSTR("Initialized with invalid endPolicy"));

    }
    v15.receiver = v9;
    v15.super_class = (Class)RBSDurationAttribute;
    result = objc_msgSendSuper2(&v15, sel__init);
    if (result)
    {
      *((double *)result + 1) = a4;
      *((double *)result + 2) = a5;
      *((_QWORD *)result + 3) = a2;
      *((_QWORD *)result + 4) = a3;
    }
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  double invalidationDuration;
  double warningDuration;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  invalidationDuration = self->_invalidationDuration;
  warningDuration = self->_warningDuration;
  NSStringFromRBSDurationStartPolicy(self->_startPolicy);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSDurationEndPolicy(self->_endPolicy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| invalidationDuration:%.2f warningDuration:%.2f startPolicy:%@ endPolicy:%@>"), v4, *(_QWORD *)&invalidationDuration, *(_QWORD *)&warningDuration, v7, v8);

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSDurationAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  -[RBSDurationAttribute invalidationDuration](self, "invalidationDuration", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("invalidationDuration"));
  -[RBSDurationAttribute warningDuration](self, "warningDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("warningDuration"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSDurationAttribute startPolicy](self, "startPolicy"), CFSTR("startPolicy"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSDurationAttribute endPolicy](self, "endPolicy"), CFSTR("endPolicy"));

}

- (RBSDurationAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSDurationAttribute *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSDurationAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("invalidationDuration"));
    -[RBSDurationAttribute setInvalidationDuration:](v5, "setInvalidationDuration:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("warningDuration"));
    -[RBSDurationAttribute setWarningDuration:](v5, "setWarningDuration:");
    -[RBSDurationAttribute setStartPolicy:](v5, "setStartPolicy:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("startPolicy")));
    -[RBSDurationAttribute setEndPolicy:](v5, "setEndPolicy:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("endPolicy")));
  }

  return v5;
}

- (void)setInvalidationDuration:(double)a3
{
  self->_invalidationDuration = a3;
}

- (void)setWarningDuration:(double)a3
{
  self->_warningDuration = a3;
}

- (void)setStartPolicy:(unint64_t)a3
{
  self->_startPolicy = a3;
}

- (void)setEndPolicy:(unint64_t)a3
{
  self->_endPolicy = a3;
}

@end
