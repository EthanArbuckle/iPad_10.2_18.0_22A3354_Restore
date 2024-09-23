@implementation RBSConstraintsAttribute

- (RBSConstraintsAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSConstraintsAttribute *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSConstraintsAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
    v5->_constraints = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_constraints"));

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSConstraintsAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_constraints, CFSTR("_constraints"), v5.receiver, v5.super_class);

}

- (unint64_t)constraints
{
  return self->_constraints;
}

+ (id)attributeWithConstraints:(unint64_t)a3
{
  RBSConstraintsAttribute *v4;
  objc_super v6;

  v4 = [RBSConstraintsAttribute alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSConstraintsAttribute;
    v4 = (RBSConstraintsAttribute *)objc_msgSendSuper2(&v6, sel__init);
    if (v4)
      v4->_constraints = a3;
  }
  return v4;
}

- (unint64_t)hash
{
  return self->_constraints;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| constraints:%x>"), v4, self->_constraints);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSConstraintsAttribute;
  v6 = 0;
  if (-[RBSAttribute isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[RBSConstraintsAttribute constraints](self, "constraints");
    if (v5 == objc_msgSend(v4, "constraints"))
      v6 = 1;
  }

  return v6;
}

@end
