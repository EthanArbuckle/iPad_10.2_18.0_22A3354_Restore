@implementation PXHiddenAlbumVisibilityPreferenceObserver

- (void)dealloc
{
  _TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver *v2;
  objc_super v3;

  v2 = self;
  PXUnregisterPreferencesObserver(v2);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PXHiddenAlbumVisibilityPreferenceObserver();
  -[PXHiddenAlbumVisibilityPreferenceObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver_photoLibrary));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver)init
{
  _TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver *result;

  result = (_TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)preferencesDidChange
{
  _BOOL8 IsHiddenAlbumVisible;
  _QWORD *v3;
  _TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver *v4;

  v4 = self;
  IsHiddenAlbumVisible = PXPreferencesIsHiddenAlbumVisible();
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (IsHiddenAlbumVisible != ((*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.isa) + 0x80))() & 1))
    (*(void (**)(_BOOL8))((*v3 & (uint64_t)v4->super.isa) + 0x88))(IsHiddenAlbumVisible);

}

@end
