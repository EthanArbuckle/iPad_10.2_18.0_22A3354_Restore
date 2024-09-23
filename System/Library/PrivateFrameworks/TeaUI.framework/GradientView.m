@implementation GradientView

+ (Class)layerClass
{
  static GradientView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5TeaUI12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI12GradientView *)GradientView.init(frame:)();
}

- (_TtC5TeaUI12GradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  GradientView.init(coder:)();
}

- (void).cxx_destruct
{
  _BYTE v3[160];

  sub_1B14079A4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI12GradientView_gradientDescriptor));
  sub_1B1539148((uint64_t)self + OBJC_IVAR____TtC5TeaUI12GradientView_dynamicGradientDescriptor, (uint64_t)v3);
  sub_1B15393A8((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1B1539414);
}

@end
