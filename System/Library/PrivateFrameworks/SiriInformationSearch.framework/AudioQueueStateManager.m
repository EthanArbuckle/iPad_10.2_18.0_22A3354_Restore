@implementation AudioQueueStateManager

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(__int128 *, int64_t, int64_t, char *);
  id v17;
  _TtC21SiriInformationSearch22AudioQueueStateManager *v18;
  __int128 v19;
  __int128 v20;
  _UNKNOWN **v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = type metadata accessor for Date();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  if (a3)
  {
    *((_QWORD *)&v20 + 1) = type metadata accessor for SOMediaNowPlayingObserver();
    v21 = &protocol witness table for SOMediaNowPlayingObserver;
    *(_QWORD *)&v19 = a3;
  }
  else
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
  }
  v16 = *(void (**)(__int128 *, int64_t, int64_t, char *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                                  + 0x130);
  v17 = a3;
  v18 = self;
  v16(&v19, a4, a5, v13);
  outlined destroy of MediaUserStateCenter?((uint64_t)&v19, &demangling cache variable for type metadata for MediaNowPlayingObserving?);

  outlined destroy of MediaUserStateCenter?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
}

- (_TtC21SiriInformationSearch22AudioQueueStateManager)init
{
  _TtC21SiriInformationSearch22AudioQueueStateManager *result;

  result = (_TtC21SiriInformationSearch22AudioQueueStateManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch22AudioQueueStateManager_updateAudioQueueStateCacheGroup));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch22AudioQueueStateManager_queueStateObserver);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch22AudioQueueStateManager_nowPlayingInfoCache));
  swift_bridgeObjectRelease();
}

@end
