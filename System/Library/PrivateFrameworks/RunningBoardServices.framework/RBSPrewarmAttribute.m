@implementation RBSPrewarmAttribute

- (id)_initWithidentity:(id)a3 interval:(double)a4
{
  id v7;
  id *v8;
  id *v9;
  id *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBSPrewarmAttribute;
  v8 = -[RBSAttribute _init](&v12, sel__init);
  v9 = v8;
  if (v8)
  {
    *((double *)v8 + 1) = a4;
    objc_storeStrong(v8 + 2, a3);
    v10 = v9;
  }

  return v9;
}

+ (id)attributeWithIdentity:(id)a3 interval:(double)a4
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    v6 = -[RBSPrewarmAttribute _initWithidentity:interval:]([RBSPrewarmAttribute alloc], "_initWithidentity:interval:", v5, a4);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSPrewarmAttribute;
  if (-[RBSAttribute isEqual:](&v13, sel_isEqual_, v4)
    && (-[RBSPrewarmAttribute interval](self, "interval"), v6 = v5, objc_msgSend(v4, "interval"), v6 == v7))
  {
    -[RBSPrewarmAttribute identity](self, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 == (void *)v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqual:", v9);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t interval;

  interval = (unint64_t)self->_interval;
  return -[RBSProcessIdentity hash](self->_identity, "hash") ^ interval;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| identity:%@ interval:%.2f>"), v4, self->_identity, *(_QWORD *)&self->_interval);

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSPrewarmAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v6, sel_encodeWithRBSXPCCoder_, v4);
  -[RBSPrewarmAttribute interval](self, "interval", v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_interval"));
  -[RBSPrewarmAttribute identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_identity"));

}

- (RBSPrewarmAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSPrewarmAttribute *v5;
  double v6;
  uint64_t v7;
  RBSProcessIdentity *identity;
  RBSPrewarmAttribute *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSPrewarmAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v11, sel_initWithRBSXPCCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_interval")),
        v5->_interval = v6,
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identity")),
        v7 = objc_claimAutoreleasedReturnValue(),
        identity = v5->_identity,
        v5->_identity = (RBSProcessIdentity *)v7,
        identity,
        v5->_identity))
  {
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)interval
{
  return self->_interval;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
