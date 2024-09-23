@implementation UnifiedMessages.Coordinator

- (_TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator)init
{
  return (_TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator *)sub_100167E68();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v10 = sub_100007E8C((uint64_t *)&unk_1011A13B0);
  __chkstk_darwin(v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v12, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_1010B3DC8, 64, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = v13;
  v17[6] = v15;
  v17[7] = a4;
  v18 = a4;
  v19 = self;
  v20 = v18;
  v21 = a3;
  swift_bridgeObjectRetain();
  v22 = sub_100166DC0((uint64_t)v12, (uint64_t)&unk_1011A3678, (uint64_t)v17, (uint64_t)&unk_1010B3E18, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1011E89A0);
  swift_release(v22);
  swift_bridgeObjectRelease(v15);

}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_100169AF8(self, (int)a2, a3, a4, a5, "💬 Dialogs without a specified placement are not supported.");
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_100169AF8(self, (int)a2, a3, a4, a5, "💬 Full sheets are not supported.");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_engagement));
  swift_bridgeObjectRelease(*(_QWORD *)&self->engagement[OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_serviceType]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_observedPlacements));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_privacyAcknowledgementObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_userDefaults));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_accountDidChangeObserver));
  v3 = (char *)self + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator__inlineBubbleTipRequests;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A3680);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
