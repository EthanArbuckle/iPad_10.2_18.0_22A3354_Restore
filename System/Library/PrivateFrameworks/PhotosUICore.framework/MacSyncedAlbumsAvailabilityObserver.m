@implementation MacSyncedAlbumsAvailabilityObserver

- (void)dealloc
{
  void *v2;
  _TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_photoLibrary);
  v3 = self;
  objc_msgSend(v2, sel_unregisterChangeObserver_, v3);
  swift_getKeyPath();
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v3->super.isa) + 0x130))();
  swift_release();
  objc_msgSend(*(id *)((char *)&v3->super.isa+ OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver__refreshCoalescer), sel_unregisterObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for MacSyncedAlbumsAvailabilityObserver();
  -[MacSyncedAlbumsAvailabilityObserver dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_photoLibrary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_macSyncedAlbumsFetchResult));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_internalSettingsObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver__refreshCoalescer));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver)init
{
  _TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver *result;

  result = (_TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  id v4;
  _TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver *v5;

  v4 = a3;
  v5 = self;
  _s12PhotosUICore35MacSyncedAlbumsAvailabilityObserverC19outputEventSignaled3forySo16PXEventCoalescerC_tF_0();

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver *v5;

  v4 = a3;
  v5 = self;
  MacSyncedAlbumsAvailabilityObserver.photoLibraryDidChange(_:)((PHChange)v4);

}

@end
