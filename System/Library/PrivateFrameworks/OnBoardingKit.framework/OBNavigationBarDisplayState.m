@implementation OBNavigationBarDisplayState

- (OBNavigationBarDisplayState)initWithNavigationBar:(id)a3
{
  id v4;
  OBNavigationBarDisplayState *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBNavigationBarDisplayState;
  v5 = -[OBNavigationBarDisplayState init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_titleOpacity");
    v5->_titleOpacity = v6;
    objc_msgSend(v4, "_backgroundOpacity");
    v5->_backgroundOpacity = v7;
  }

  return v5;
}

- (void)applyState:(id)a3
{
  id v4;

  v4 = a3;
  -[OBNavigationBarDisplayState titleOpacity](self, "titleOpacity");
  objc_msgSend(v4, "_setTitleOpacity:");
  -[OBNavigationBarDisplayState backgroundOpacity](self, "backgroundOpacity");
  objc_msgSend(v4, "_setBackgroundOpacity:");

}

+ (id)displayStateForNavigationBar:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNavigationBar:", v4);

  return v5;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (void)setBackgroundOpacity:(double)a3
{
  self->_backgroundOpacity = a3;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (void)setTitleOpacity:(double)a3
{
  self->_titleOpacity = a3;
}

@end
