@implementation ContentLoader.AccessoryPageView

- (id)hitTest:(double)a3 withEvent:(uint64_t)a4
{
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)swift_getObjectType(a1);
  v8 = v13.receiver;
  v9 = a5;
  v10 = objc_msgSendSuper2(&v13, "hitTest:withEvent:", v9, a2, a3);
  if (!v10 || (v11 = v10, v9, v9 = v8, v11 == v8))
  {

    v11 = 0;
  }

  return v11;
}

- (id)initWithFrame:(double)a3
{
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)swift_getObjectType(a1);
  return objc_msgSendSuper2(&v10, "initWithFrame:", a2, a3, a4, a5);
}

- (id)initWithCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType(a1);
  return objc_msgSendSuper2(&v5, "initWithCoder:", a3);
}

@end
