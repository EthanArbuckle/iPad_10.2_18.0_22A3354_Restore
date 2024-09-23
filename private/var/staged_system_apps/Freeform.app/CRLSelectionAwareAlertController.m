@implementation CRLSelectionAwareAlertController

- (BOOL)staysOpenOnSelectionChange
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange);
}

- (void)setStaysOpenOnSelectionChange:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = a3;
}

- (_TtC8Freeform32CRLSelectionAwareAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtC8Freeform32CRLSelectionAwareAlertController *v9;
  objc_super v11;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = 1;
    v6 = a4;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = 1;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CRLSelectionAwareAlertController();
  v9 = -[CRLSelectionAwareAlertController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

- (_TtC8Freeform32CRLSelectionAwareAlertController)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSelectionAwareAlertController();
  return -[CRLSelectionAwareAlertController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
