@implementation SBAlertControllerVisualStyle

- (SBAlertControllerVisualStyle)init
{
  SBAlertControllerVisualStyle *v2;
  SBAlertControllerVisualStyle *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBAlertControllerVisualStyle;
  v2 = -[UIAlertControllerVisualStyle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)SBAlertControllerVisualStyle;
    v2->_permittedActionLayoutDirection = -[UIAlertControllerVisualStyleAlert permittedActionLayoutDirection](&v5, sel_permittedActionLayoutDirection);
  }
  return v3;
}

- (int64_t)permittedActionLayoutDirection
{
  return self->_permittedActionLayoutDirection;
}

- (void)setPermittedActionLayoutDirection:(int64_t)a3
{
  self->_permittedActionLayoutDirection = a3;
}

@end
