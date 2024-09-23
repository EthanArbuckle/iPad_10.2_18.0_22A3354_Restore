@implementation NSLayoutConstraint

- (id)withPriority:(float)a3
{
  NSLayoutConstraint *v4;
  double v5;

  v4 = self;
  *(float *)&v5 = a3;
  -[NSLayoutConstraint setPriority:](v4, "setPriority:", v5);
  return v4;
}

@end
