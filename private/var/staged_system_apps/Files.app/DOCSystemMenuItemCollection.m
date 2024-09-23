@implementation DOCSystemMenuItemCollection

- (void)rename:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  swift_retain();
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_release(self);
  swift_unknownObjectRelease(a3);
  sub_100068588(v5);
}

@end
