@implementation SharedAlbumsActivityEntryItemListManager

- (void)activityEntryRepositoryDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager *v5;

  v4 = a3;
  v5 = self;
  sub_1A6C4C09C();

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager *v5;

  v4 = a3;
  v5 = self;
  sub_1A6C49484(v4);

}

- (_TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager)init
{
  _TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager *result;

  result = (_TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager_photoLibrary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager__itemList));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager_observable));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager_activityEntryRepository));
  sub_1A68AB568((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager___cachedLastSeenUnreadDate);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
