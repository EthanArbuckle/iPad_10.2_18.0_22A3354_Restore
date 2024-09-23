@implementation CRLUSDZKnobController

- (void)hideWithImmediately:(BOOL)a3
{
  _TtC8Freeform21CRLUSDZKnobController *v4;

  v4 = self;
  sub_100BD5AEC(a3);

}

- (_TtC8Freeform21CRLUSDZKnobController)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_visibilityState) = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_rotationKnob) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_playPauseKnob) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_currentKnobs) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLUSDZKnobController();
  return -[CRLUSDZKnobController init](&v3, "init");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform21CRLUSDZKnobController_currentKnobs));
}

@end
