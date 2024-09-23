@implementation THGlossaryDividerLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THGlossaryDividerRep, a2);
}

- (void)validate
{
  objc_super v3;

  -[THGlossaryDividerLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDividerLayout;
  -[THGlossaryDividerLayout validate](&v3, "validate");
}

- (id)computeLayoutGeometry
{
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", 0.0, 0.0, 100.0, 1.0);
}

@end
