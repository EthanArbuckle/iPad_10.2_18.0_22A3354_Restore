@implementation THWTapGestureAction

- (THWTapGestureAction)initWithAction:(id)a3
{
  THWTapGestureAction *v4;
  THWTapGestureAction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWTapGestureAction;
  v4 = -[THWTapGestureAction init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THWTapGestureAction setAction:](v4, "setAction:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTapGestureAction;
  -[THWTapGestureAction dealloc](&v3, "dealloc");
}

- (BOOL)canHandleGesture:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "gestureKind");
  return v3 == (id)TSDShortTap;
}

- (BOOL)handleGesture:(id)a3
{
  void (**action)(void);

  if (objc_msgSend(a3, "gestureState") == 3)
  {
    action = (void (**)(void))self->_action;
    if (action)
      action[2]();
    -[THWTapGestureAction setAction:](self, "setAction:", 0);
  }
  return 1;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
