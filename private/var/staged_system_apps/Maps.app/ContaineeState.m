@implementation ContaineeState

- (ContaineeState)initWithContainee:(id)a3
{
  id v5;
  ContaineeState *v6;
  ContaineeState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ContaineeState;
  v6 = -[ContaineeState init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewController, a3);

  return v7;
}

- (void)setLayout:(unint64_t)a3 forStyle:(unint64_t)a4
{
  unint64_t v4;

  self->layoutByStyle[a4] = a3;
  if (a4 == 1)
  {
    self->layoutByStyle[5] = 4 * (a3 == 3);
  }
  else if (a4 == 5)
  {
    v4 = 2;
    if (a3 == 4)
      v4 = 3;
    self->layoutByStyle[1] = v4;
  }
}

- (unint64_t)layoutForStyle:(unint64_t)a3
{
  return self->layoutByStyle[a3];
}

- (ContaineeProtocol)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
