@implementation VignetteView

+ (Class)layerClass
{
  sub_22B0F1718(0, &qword_255B86760);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9SeymourUI12VignetteView)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _TtC9SeymourUI12VignetteView *v8;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  v6 = objc_msgSend(v4, sel_blackColor);
  v7 = objc_allocWithZone((Class)type metadata accessor for VignetteView());
  v8 = (_TtC9SeymourUI12VignetteView *)sub_22B1B5740(3, v6);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC9SeymourUI12VignetteView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI12VignetteView *result;

  result = (_TtC9SeymourUI12VignetteView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
