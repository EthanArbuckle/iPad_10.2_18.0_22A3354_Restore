@implementation SBSAPlatformMetricsContextMutator

- (void)setMinimumEdgePadding:(double)a3
{
  -[SBSAPlatformMetricsContext _setMinimumEdgePadding:](self->_mutatable, "_setMinimumEdgePadding:", a3);
}

- (void)setMaximumCornerRadius:(double)a3
{
  -[SBSAPlatformMetricsContext _setMaximumCornerRadius:](self->_mutatable, "_setMaximumCornerRadius:", a3);
}

- (void)setCustomLayoutSquareLargeCornerRadius:(double)a3
{
  -[SBSAPlatformMetricsContext _setCustomLayoutSquareLargeCornerRadius:](self->_mutatable, "_setCustomLayoutSquareLargeCornerRadius:", a3);
}

- (void)setCustomLayoutSquareCornerRadius:(double)a3
{
  -[SBSAPlatformMetricsContext _setCustomLayoutSquareCornerRadius:](self->_mutatable, "_setCustomLayoutSquareCornerRadius:", a3);
}

- (void)setCustomLayoutOvalCornerRadius:(double)a3
{
  -[SBSAPlatformMetricsContext _setCustomLayoutOvalCornerRadius:](self->_mutatable, "_setCustomLayoutOvalCornerRadius:", a3);
}

- (SBSAPlatformMetricsContextMutator)initWithPlatformMetricsContext:(id)a3
{
  id v5;
  SBSAPlatformMetricsContextMutator *v6;
  SBSAPlatformMetricsContextMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAPlatformMetricsContextMutator;
  v6 = -[SBSAPlatformMetricsContextMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mutatable, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutatable, 0);
}

- (double)maximumCornerRadius
{
  double result;

  -[SBSAPlatformMetricsContext maximumCornerRadius](self->_mutatable, "maximumCornerRadius");
  return result;
}

- (double)customLayoutSquareCornerRadius
{
  double result;

  -[SBSAPlatformMetricsContext customLayoutSquareCornerRadius](self->_mutatable, "customLayoutSquareCornerRadius");
  return result;
}

- (double)customLayoutSquareLargeCornerRadius
{
  double result;

  -[SBSAPlatformMetricsContext customLayoutSquareLargeCornerRadius](self->_mutatable, "customLayoutSquareLargeCornerRadius");
  return result;
}

- (double)customLayoutOvalCornerRadius
{
  double result;

  -[SBSAPlatformMetricsContext customLayoutOvalCornerRadius](self->_mutatable, "customLayoutOvalCornerRadius");
  return result;
}

- (double)customLayoutTallRectCornerRadius
{
  double result;

  -[SBSAPlatformMetricsContext customLayoutTallRectCornerRadius](self->_mutatable, "customLayoutTallRectCornerRadius");
  return result;
}

- (void)setCustomLayoutTallRectCornerRadius:(double)a3
{
  -[SBSAPlatformMetricsContext _setCustomLayoutTallRectCornerRadius:](self->_mutatable, "_setCustomLayoutTallRectCornerRadius:", a3);
}

- (double)minimumEdgePadding
{
  double result;

  -[SBSAPlatformMetricsContext minimumEdgePadding](self->_mutatable, "minimumEdgePadding");
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; defaultsContext: %@>"),
               objc_opt_class(),
               self,
               self->_mutatable);
}

- (SBSAPlatformMetricsContext)mutatable
{
  return self->_mutatable;
}

@end
