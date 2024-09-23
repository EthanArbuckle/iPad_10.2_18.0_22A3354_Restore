@implementation CRLGelatoInterstitialUIController

- (void)dealloc
{
  objc_class *ObjectType;
  char v4;
  _TtC8Freeform33CRLGelatoInterstitialUIController *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_isTornDown);
  v5 = self;
  if ((v4 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/Gelato/CRLGelatoInterstitialUIController.swift", 116, 2, 83, "Deallocated without calling tearDown()!", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/Gelato/CRLGelatoInterstitialUIController.swift", 116, 2u, 83, (uint64_t)"Deallocated without calling tearDown()!", 39, 2u);
  }
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[CRLGelatoInterstitialUIController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_boardViewController);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_boardLibrary));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController__isBoardShared;
  v4 = sub_1004B804C(&qword_10140B9D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_collabUIItem));
}

- (void)newParticipantJoinedSessionWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform33CRLGelatoInterstitialUIController *v5;

  v4 = a3;
  v5 = self;
  sub_100BDDE70();

}

- (void)realTimeSessionParticipantsChangedWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform33CRLGelatoInterstitialUIController *v5;

  v4 = a3;
  v5 = self;
  sub_100BDE008();

}

- (void)realTimeSessionDidStartOrEndWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform33CRLGelatoInterstitialUIController *v5;

  v4 = a3;
  v5 = self;
  sub_100BDE1A0();

}

- (_TtC8Freeform33CRLGelatoInterstitialUIController)init
{
  _TtC8Freeform33CRLGelatoInterstitialUIController *result;

  result = (_TtC8Freeform33CRLGelatoInterstitialUIController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLGelatoInterstitialUIController", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)shareStateUpdatedWithShare:(id)a3
{
  id v5;
  _TtC8Freeform33CRLGelatoInterstitialUIController *v6;

  v5 = a3;
  v6 = self;
  sub_100BDD110(a3);

}

- (void)currentUserLostEditPermissions
{
  sub_100BDDDB4((char *)self, (uint64_t)a2, 1);
}

- (void)currentUserGainedEditPermissions
{
  sub_100BDDDB4((char *)self, (uint64_t)a2, 0);
}

@end
