@implementation OADQuarterEllipseToPathElement

- (OADQuarterEllipseToPathElement)initWithToPoint:(OADAdjustPoint)a3 startsVertical:(BOOL)a4
{
  OADQuarterEllipseToPathElement *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADQuarterEllipseToPathElement;
  result = -[OADToPointPathElement initWithToPoint:](&v6, sel_initWithToPoint_, *(_QWORD *)&a3.x, *(_QWORD *)&a3.y);
  if (result)
    *(&result->super.mRelative + 1) = a4;
  return result;
}

- (BOOL)startsVertical
{
  return *(&self->super.mRelative + 1);
}

@end
