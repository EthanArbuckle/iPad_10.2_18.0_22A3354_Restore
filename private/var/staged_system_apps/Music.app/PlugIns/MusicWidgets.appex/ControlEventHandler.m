@implementation ControlEventHandler

- (void)handleActionFromControl:(id)a3
{
  void (*v4)(id);
  id v5;

  v4 = *(void (**)(id))self->handler;
  v5 = a3;
  swift_retain(self);
  v4(v5);

  swift_release(self);
}

@end
