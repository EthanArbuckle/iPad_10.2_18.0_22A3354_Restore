@implementation PASAccountContextExtensionBuilder

- (_TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_requiresCDP) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_requiresManateeRepair) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_requiresFamilyRepair) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_showPrivacyDisclosureOnSourceDevice) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_showPasscodeBiometricsRequestOnTargetDevice) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_flowStepAllSetContext) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PASAccountContextExtensionBuilder();
  return -[PASAccountContextExtensionBuilder init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_flowStepAllSetContext));
}

@end
