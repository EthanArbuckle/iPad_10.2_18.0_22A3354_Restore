@implementation _UICloudChamber

+ (Class)layerClass
{
  sub_1851F9080(0, &qword_1EDD87900);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKit15_UICloudChamber)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  _TtC5UIKit15_UICloudChamber *result;

  v5 = OBJC_IVAR____TtC5UIKit15_UICloudChamber_emitterCell;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2768]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (char *)self + OBJC_IVAR____TtC5UIKit15_UICloudChamber_appliedSpriteHash;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;

  result = (_TtC5UIKit15_UICloudChamber *)sub_186507E04();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC5UIKit15_UICloudChamber *v2;

  v2 = self;
  sub_185699E38();

}

- (_TtC5UIKit15_UICloudChamber)initWithFrame:(CGRect)a3
{
  _TtC5UIKit15_UICloudChamber *result;

  result = (_TtC5UIKit15_UICloudChamber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
