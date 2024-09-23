@implementation CRLCommandController.CRLCommandControllerCommandGroup

- (NSString)actionString
{
  _TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1006A574C();
  if (!v3)
    sub_10074D0E8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)setActionString:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup__currentGroupActionString);
  v6 = *(_QWORD *)&self->super.super.committed[OBJC_IVAR____TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup__currentGroupActionString];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup__currentGroupActionString);
  v4 = (objc_class *)type metadata accessor for CRLCommandController.CRLCommandControllerCommandGroup();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CRLCommandGroup init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.committed[OBJC_IVAR____TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup__currentGroupActionString]);
}

@end
