@implementation PXPhotoLibraryDefaultsChangeObserverExtended

- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  _TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended *v11;

  v6 = sub_1A7AE3764();
  v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended_block);
  v10 = a3;
  v11 = self;
  v9(v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended)init
{
  _TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended *result;

  result = (_TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
