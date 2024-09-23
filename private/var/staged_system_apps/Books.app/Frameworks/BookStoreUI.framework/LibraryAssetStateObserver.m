@implementation LibraryAssetStateObserver

- (void)dealloc
{
  _TtC11BookStoreUI25LibraryAssetStateObserver *v2;

  v2 = self;
  LibraryAssetStateObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)&self->id[OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_id]);
  v3 = (char *)self + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver__libraryAssetState;
  v4 = type metadata accessor for LibraryAssetState(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_untrackedLibraryAssetState, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_libraryItemStateProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_downloadProgressCenter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_lockProtectedData));
  v6 = (char *)self + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver___observationRegistrar;
  v7 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

- (void)libraryItemStateCenter:(id)a3 didUpdateItemState:(id)a4 forIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  os_unfair_lock_s *v12;
  _TtC11BookStoreUI25LibraryAssetStateObserver *v13;
  __n128 v14;
  id v15;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_lockProtectedData);
  v11 = (double *)(v10 + 16);
  v12 = (os_unfair_lock_s *)(v10 + 40);
  v15 = a3;
  swift_unknownObjectRetain(a4);
  v13 = self;
  os_unfair_lock_lock(v12);
  sub_1091C0(v11, v14);
  os_unfair_lock_unlock(v12);
  swift_bridgeObjectRelease(v9);

  swift_unknownObjectRelease(a4);
}

- (void)dynamicProgressChanged:(id)a3
{
  _TtC11BookStoreUI25LibraryAssetStateObserver *v5;
  id v6;
  os_unfair_lock_s *v7;
  double *p_os_unfair_lock_opaque;
  os_unfair_lock_s *v9;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = objc_msgSend(a3, "progress");
  objc_msgSend(v6, "doubleValue");

  v7 = *(os_unfair_lock_s **)((char *)&v5->super.isa
                            + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_lockProtectedData);
  p_os_unfair_lock_opaque = (double *)&v7[4]._os_unfair_lock_opaque;
  v9 = v7 + 10;
  os_unfair_lock_lock(v7 + 10);
  sub_1091A0(p_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v9);

  swift_unknownObjectRelease(a3);
}

- (_TtC11BookStoreUI25LibraryAssetStateObserver)init
{
  _TtC11BookStoreUI25LibraryAssetStateObserver *result;

  result = (_TtC11BookStoreUI25LibraryAssetStateObserver *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.LibraryAssetStateObserver", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
