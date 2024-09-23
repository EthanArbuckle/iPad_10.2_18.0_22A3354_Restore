@implementation ConstraintsDisabledView

- (id)initWithFrame:(double)a3
{
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)swift_getObjectType(a1, a2);
  return objc_msgSendSuper2(&v11, "initWithFrame:", a3, a4, a5, a6);
}

- (id)initWithCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType(a1, a2);
  return objc_msgSendSuper2(&v5, "initWithCoder:", a3);
}

@end
