@implementation _UIFlexibleConstantConstraintSet

+ (id)constraintSetWithRequiredEqualityConstraint:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEqualityConstraint:equalityPriority:prefersMin:", v4, 1000, 0);

  return v5;
}

+ (id)constraintSetWithCollapsableConstantPreferredEqualityConstraint:(id)a3 equalityPriority:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEqualityConstraint:equalityPriority:prefersMin:", v6, a4, 0);

  return v7;
}

- (id)_initWithEqualityConstraint:(id)a3 equalityPriority:(unint64_t)a4 prefersMin:(BOOL)a5
{
  id v10;
  void *v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _UIFlexibleConstantConstraintSet *v25;
  _UIFlexibleConstantConstraintSet *v26;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (objc_msgSend(v10, "relation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIConstantConstraintSet.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cn.relation == NSLayoutRelationEqual"));

  }
  if (objc_msgSend(v10, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIConstantConstraintSet.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cn.active == NO"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  *(float *)&v13 = (float)a4;
  objc_msgSend(v12, "setPriority:", v13);
  if (a4 == 1000)
  {
    v14 = 0;
    v15 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v12, "firstItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "firstAttribute");
    objc_msgSend(v12, "secondItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v17, v18, 1, v19, objc_msgSend(v12, "secondAttribute"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v12, "firstItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "firstAttribute");
    objc_msgSend(v12, "secondItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v21, v22, -1, v23, objc_msgSend(v12, "secondAttribute"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v14;
    v31[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v24);

  }
  v30.receiver = self;
  v30.super_class = (Class)_UIFlexibleConstantConstraintSet;
  v25 = -[_UIConstantConstraintSet initWithConstraints:](&v30, sel_initWithConstraints_, v11);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_minConstraint, v14);
    objc_storeStrong((id *)&v26->_maxConstraint, v15);
    objc_storeStrong((id *)&v26->_equalityConstraint, a3);
    v26->_equalityConstraintPrefersMin = a5;
    -[_UIFlexibleConstantConstraintSet setMinConstant:](v26, "setMinConstant:", 0.0);
    -[_UIFlexibleConstantConstraintSet setMaxConstant:](v26, "setMaxConstant:", 10000.0);
    -[NSLayoutConstraint constant](v26->_equalityConstraint, "constant");
    -[_UIFlexibleConstantConstraintSet setEqualityConstant:](v26, "setEqualityConstant:");
  }

  return v26;
}

- (void)setMinConstant:(double)a3
{
  if (!-[_UIFlexibleConstantConstraintSet _equalityConstraintIsRequired](self, "_equalityConstraintIsRequired")
    && self->_minConstant != a3)
  {
    self->_minConstant = a3;
    -[NSLayoutConstraint setConstant:](self->_minConstraint, "setConstant:", a3);
  }
}

- (void)setMaxConstant:(double)a3
{
  if (!-[_UIFlexibleConstantConstraintSet _equalityConstraintIsRequired](self, "_equalityConstraintIsRequired")
    && self->_maxConstant != a3)
  {
    self->_maxConstant = a3;
    -[NSLayoutConstraint setConstant:](self->_maxConstraint, "setConstant:", a3);
  }
}

- (void)setEqualityConstant:(double)a3
{
  if (self->_equalityConstant != a3)
  {
    self->_equalityConstant = a3;
    -[NSLayoutConstraint setConstant:](self->_equalityConstraint, "setConstant:");
    -[_UIFlexibleConstantConstraintSet _updateInequalityConstants](self, "_updateInequalityConstants");
  }
}

- (BOOL)_equalityConstraintIsRequired
{
  float v2;

  -[NSLayoutConstraint priority](self->_equalityConstraint, "priority");
  return v2 == 1000.0;
}

- (void)_updateInequalityConstants
{
  double equalityConstant;
  double maxConstant;
  double minConstant;

  if (!-[_UIFlexibleConstantConstraintSet _equalityConstraintIsRequired](self, "_equalityConstraintIsRequired"))
  {
    equalityConstant = self->_equalityConstant;
    if (self->_equalityConstraintPrefersMin)
    {
      -[_UIFlexibleConstantConstraintSet setMinConstant:](self, "setMinConstant:", equalityConstant);
      maxConstant = self->_maxConstant;
      if (maxConstant < self->_equalityConstant)
        maxConstant = self->_equalityConstant;
      -[_UIFlexibleConstantConstraintSet setMaxConstant:](self, "setMaxConstant:", maxConstant);
    }
    else
    {
      -[_UIFlexibleConstantConstraintSet setMaxConstant:](self, "setMaxConstant:", equalityConstant);
      minConstant = self->_minConstant;
      if (minConstant >= self->_equalityConstant)
        minConstant = self->_equalityConstant;
      -[_UIFlexibleConstantConstraintSet setMinConstant:](self, "setMinConstant:", minConstant);
    }
  }
}

- (id)_preferredInequalityConstraint
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____UIFlexibleConstantConstraintSet__minConstraint[!self->_equalityConstraintPrefersMin]));
}

- (id)_otherInequalityConstraint
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____UIFlexibleConstantConstraintSet__minConstraint[self->_equalityConstraintPrefersMin]));
}

- (double)minConstant
{
  return self->_minConstant;
}

- (double)maxConstant
{
  return self->_maxConstant;
}

- (double)equalityConstant
{
  return self->_equalityConstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equalityConstraint, 0);
  objc_storeStrong((id *)&self->_maxConstraint, 0);
  objc_storeStrong((id *)&self->_minConstraint, 0);
}

@end
