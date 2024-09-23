@implementation ChromeMaterialBackgroundView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_34450(0, &qword_3C0730, CABackdropLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC8BookEPUB28ChromeMaterialBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookEPUB28ChromeMaterialBackgroundView *)sub_1AA210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookEPUB28ChromeMaterialBackgroundView)initWithCoder:(id)a3
{
  _TtC8BookEPUB28ChromeMaterialBackgroundView *result;

  result = (_TtC8BookEPUB28ChromeMaterialBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000002C69C0, "BookEPUB/BookContentHostView.swift", 34, 2, 467, 0);
  __break(1u);
  return result;
}

@end
