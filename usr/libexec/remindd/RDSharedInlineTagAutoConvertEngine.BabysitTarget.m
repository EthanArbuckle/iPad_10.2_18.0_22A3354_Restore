@implementation RDSharedInlineTagAutoConvertEngine.BabysitTarget

- (id)waiterID
{
  return String._bridgeToObjectiveC()();
}

- (_TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_babysitterOperationDidLaunch);
  *v2 = 0xD00000000000001CLL;
  v2[1] = 0x80000001006FBB40;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_babysitterOperationStoreDidChange);
  *v3 = 0xD000000000000021;
  v3[1] = 0x80000001006FBB60;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_analyticsCrashDetected);
  *v4 = 0xD000000000000042;
  v4[1] = 0x80000001006FBBD0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RDSharedInlineTagAutoConvertEngine.BabysitTarget();
  return -[RDSharedInlineTagAutoConvertEngine.BabysitTarget init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->babysitterOperationDidLaunch[OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_babysitterOperationDidLaunch]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->babysitterOperationDidLaunch[OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_babysitterOperationStoreDidChange]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->babysitterOperationDidLaunch[OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_analyticsCrashDetected]);
}

@end
