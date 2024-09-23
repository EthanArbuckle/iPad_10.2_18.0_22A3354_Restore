@implementation _UICustomContentView

- (void)setConfiguration:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(_BYTE *, uint64_t, uint64_t);
  _TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *v9;
  _BYTE v10[40];

  type metadata accessor for _UICustomContentConfiguration();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView);
    ObjectType = swift_getObjectType();
    sub_1851E75D8(v5 + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration, (uint64_t)v10);
    v8 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
    swift_unknownObjectRetain();
    v9 = self;
    v8(v10, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (id)_wrappedContentView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView));
}

- (UIContentConfiguration)configuration
{
  objc_class *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(_QWORD *__return_ptr, uint64_t, uint64_t);
  _TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v3 = (objc_class *)type metadata accessor for _UICustomContentConfiguration();
  v4 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView);
  ObjectType = swift_getObjectType();
  v6 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v4 + 8);
  v7 = self;
  v6(v17, ObjectType, v4);
  v8 = v18;
  v9 = v19;
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v17[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v12);
  v14 = sub_1851E7530((uint64_t)v12, v3, v8, v9);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v17);

  return (UIContentConfiguration *)v14;
}

- (BOOL)supportsConfiguration:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  _TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *v10;
  char v11;

  type metadata accessor for _UICustomContentConfiguration();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView);
    ObjectType = swift_getObjectType();
    v8 = v5 + OBJC_IVAR____TtC5UIKit29_UICustomContentConfiguration_wrappedConfiguration;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
    swift_unknownObjectRetain();
    v10 = self;
    v11 = v9(v8, ObjectType, v6);
    swift_unknownObjectRelease();

  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView)initWithCoder:(id)a3
{
  _TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *result;

  result = (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *)sub_186507E04();
  __break(1u);
  return result;
}

- (NSString)description
{
  uint64_t ObjectType;
  void *v3;

  ObjectType = swift_getObjectType();
  MEMORY[0x186DC9F28](MEMORY[0x1E0CB2120], ObjectType);
  sub_1855A82B4();
  v3 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView)initWithFrame:(CGRect)a3
{
  _TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *result;

  result = (_TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_032FEC8E4679353098E3539CFE2B632720_UICustomContentView_wrappedContentView));
}

@end
