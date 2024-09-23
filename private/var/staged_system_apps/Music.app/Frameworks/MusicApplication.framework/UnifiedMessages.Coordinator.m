@implementation UnifiedMessages.Coordinator

- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator)init
{
  return (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator *)sub_2243A4();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  _TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject(&unk_1351620, 64, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = self;
  v18[5] = v14;
  v18[6] = v16;
  v18[7] = a4;
  v19 = a4;
  v20 = self;
  v21 = v19;
  v22 = a3;
  v23 = a5;
  v24 = a6;
  swift_bridgeObjectRetain();
  v25 = sub_22243C((uint64_t)v13, (uint64_t)&unk_14BA760, (uint64_t)v18, (uint64_t)&unk_1351698, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_15109B0);
  swift_release(v25);

  swift_bridgeObjectRelease(v16);
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_226050(self, (int)a2, a3, a4, a5, "💬 Dialogs without a specified placement are not supported.");
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_226050(self, (int)a2, a3, a4, a5, "💬 Full sheets are not supported.");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_engagement));
  swift_bridgeObjectRelease(*(_QWORD *)&self->engagement[OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_serviceType]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_bag));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_observedPlacements));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_privacyAcknowledgementObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_userDefaults));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_accountDidChangeObserver));
  v3 = (char *)self
     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator__inlineBubbleTipRequests;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_14B6A08);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
