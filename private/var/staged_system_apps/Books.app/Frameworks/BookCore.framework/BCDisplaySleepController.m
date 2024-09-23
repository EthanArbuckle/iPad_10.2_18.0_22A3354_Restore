@implementation BCDisplaySleepController

- (UIWindow)window
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCDisplaySleepController_window);
  swift_beginAccess((char *)self + OBJC_IVAR___BCDisplaySleepController_window, v4, 0, 0);
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCDisplaySleepController_window);
  swift_beginAccess((char *)self + OBJC_IVAR___BCDisplaySleepController_window, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BCDisplaySleepController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCDisplaySleepController_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[BCDisplaySleepController init](&v5, "init");
}

- (void).cxx_destruct
{

}

@end
