@implementation _UICustomContentConfiguration

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration);
  swift_bridgeObjectRelease();
}

- (id)updatedConfigurationForState:(id)a3
{
  _TtC5UIKit29_UICustomContentConfiguration *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1851E72A0();
  swift_unknownObjectRelease();

  return v5;
}

- (id)makeContentView
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC5UIKit29_UICustomContentConfiguration *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  uint64_t *v13;
  _TtC5UIKit29_UICustomContentConfiguration *v14;
  objc_super v16;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_0Tm(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(v4, v5);
  v10 = v9;
  v11 = (objc_class *)type metadata accessor for _UICustomContentView();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView];
  *v13 = v8;
  v13[1] = v10;
  v16.receiver = v12;
  v16.super_class = v11;
  v14 = -[_UICustomContentConfiguration initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  return v14;
}

- (id)_wrappedConfigurationIdentifier
{
  _TtC5UIKit29_UICustomContentConfiguration *v2;
  void *v3;

  v2 = self;
  sub_1856599E0();

  v3 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return v3;
}

- (NSString)description
{
  void *v2;
  _BYTE v4[40];

  sub_1851E75D8((uint64_t)self + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD74A28);
  sub_18650751C();
  v2 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC5UIKit29_UICustomContentConfiguration)init
{
  _TtC5UIKit29_UICustomContentConfiguration *result;

  result = (_TtC5UIKit29_UICustomContentConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
