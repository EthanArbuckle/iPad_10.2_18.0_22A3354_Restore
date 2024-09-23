@implementation DeviceCapability

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545C9D00;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545C9D00 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC9SEService16DeviceCapability *v6;
  id v7;

  v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC9SEService16DeviceCapability_supportsUWB);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_20A0E0800();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

}

- (_TtC9SEService16DeviceCapability)initWithCoder:(id)a3
{
  id v4;
  _TtC9SEService16DeviceCapability *v5;
  void *v6;
  unsigned __int8 v7;
  _TtC9SEService16DeviceCapability *v8;
  objc_super v10;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_20A0E0800();
  v7 = objc_msgSend(v4, sel_decodeBoolForKey_, v6);

  *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC9SEService16DeviceCapability_supportsUWB) = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for DeviceCapability();
  v8 = -[DeviceCapability init](&v10, sel_init);

  return v8;
}

- (_TtC9SEService16DeviceCapability)init
{
  _TtC9SEService16DeviceCapability *result;

  result = (_TtC9SEService16DeviceCapability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
