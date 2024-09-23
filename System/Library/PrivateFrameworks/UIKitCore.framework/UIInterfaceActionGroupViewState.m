@implementation UIInterfaceActionGroupViewState

- (UIInterfaceActionGroupViewState)init
{
  UIInterfaceActionGroupViewState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionGroupViewState;
  result = -[UIInterfaceActionVisualStyleViewState init](&v3, sel_init);
  if (result)
  {
    result->_isVerticalLayoutAxis = 1;
    result->_resolvedPresentationStyle = 0;
  }
  return result;
}

- (id)copyWithVerticalLayoutAxis:(BOOL)a3
{
  id result;

  result = (id)-[UIInterfaceActionGroupViewState copy](self, "copy");
  *((_BYTE *)result + 32) = a3;
  return result;
}

- (id)copyWithResolvedPresentationStyle:(int64_t)a3
{
  id result;

  result = (id)-[UIInterfaceActionGroupViewState copy](self, "copy");
  *((_QWORD *)result + 5) = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionGroupViewState;
  -[UIInterfaceActionVisualStyleViewState description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVerticalLayoutAxis);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resolvedPresentationStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ vertical = %@, resolvedPresentationStyle = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionGroupViewState;
  v4 = -[UIInterfaceActionVisualStyleViewState copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_collectStateFromGroupViewState:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[UIInterfaceActionGroupViewState _stateEqualToGroupViewState:](self, "_stateEqualToGroupViewState:", v4);

  return v5;
}

- (void)_collectStateFromGroupViewState:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  self->_isVerticalLayoutAxis = objc_msgSend(v4, "isVerticalLayoutAxis");
  v5 = objc_msgSend(v4, "resolvedPresentationStyle");

  self->_resolvedPresentationStyle = v5;
}

- (BOOL)_stateEqualToGroupViewState:(id)a3
{
  id v4;
  int isVerticalLayoutAxis;
  int64_t resolvedPresentationStyle;
  BOOL v7;

  v4 = a3;
  isVerticalLayoutAxis = self->_isVerticalLayoutAxis;
  if (isVerticalLayoutAxis == objc_msgSend(v4, "isVerticalLayoutAxis"))
  {
    resolvedPresentationStyle = self->_resolvedPresentationStyle;
    v7 = resolvedPresentationStyle == objc_msgSend(v4, "resolvedPresentationStyle");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isVerticalLayoutAxis
{
  return self->_isVerticalLayoutAxis;
}

- (int64_t)resolvedPresentationStyle
{
  return self->_resolvedPresentationStyle;
}

@end
