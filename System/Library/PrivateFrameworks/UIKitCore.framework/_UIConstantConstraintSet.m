@implementation _UIConstantConstraintSet

- (_UIConstantConstraintSet)initWithConstraints:(id)a3
{
  id v5;
  _UIConstantConstraintSet *v6;
  _UIConstantConstraintSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIConstantConstraintSet;
  v6 = -[_UIConstantConstraintSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_constraints, a3);

  return v7;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
