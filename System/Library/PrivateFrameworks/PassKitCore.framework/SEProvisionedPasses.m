@implementation SEProvisionedPasses

- (void)dealloc
{
  _TtC11PassKitCore19SEProvisionedPasses *v2;

  v2 = self;
  SEProvisionedPasses.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_18FCDC690(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore19SEProvisionedPasses_externalProvisioningMode), self->externalProvisioningMode[OBJC_IVAR____TtC11PassKitCore19SEProvisionedPasses_externalProvisioningMode]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore19SEProvisionedPasses_notificationSuppressionAssertion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)passLibraryDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC11PassKitCore19SEProvisionedPasses *v5;

  v4 = a3;
  v5 = self;
  sub_18FE03B4C(v4);

}

- (NSString)description
{
  _TtC11PassKitCore19SEProvisionedPasses *v2;
  void *v3;

  v2 = self;
  sub_18FE04310();

  v3 = (void *)sub_1903D05A4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE1C0D20;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE1C0D20 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11PassKitCore19SEProvisionedPasses *v5;

  v4 = a3;
  v5 = self;
  sub_18FE04B7C(v4);

}

- (_TtC11PassKitCore19SEProvisionedPasses)initWithCoder:(id)a3
{
  return (_TtC11PassKitCore19SEProvisionedPasses *)SEProvisionedPasses.init(coder:)(a3);
}

- (_TtC11PassKitCore19SEProvisionedPasses)init
{
  _TtC11PassKitCore19SEProvisionedPasses *result;

  result = (_TtC11PassKitCore19SEProvisionedPasses *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
