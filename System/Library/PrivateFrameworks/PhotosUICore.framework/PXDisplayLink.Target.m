@implementation PXDisplayLink.Target

- (void)tickWithDisplayLink:(id)a3
{
  void (*v3)(id);
  id v4;

  v3 = *(void (**)(id))self->handler;
  v4 = a3;
  sub_1A7ADBF34();
  v3(v4);

  swift_release();
}

@end
