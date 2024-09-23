@implementation PUWallpaperShuffleConfigurationViewModel

- (_TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel)init
{
  sub_1AAC01B1C();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_photoLibrary));
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_posterConfiguration);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_finishHandler);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_cancelHandler);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_centerMedia);
  swift_release();
  sub_1AAC04BA0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel____lazy_storage___assetPreviewViewModel));
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel____lazy_storage___smartAlbumDataSource);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBBEE98);
  OUTLINED_FUNCTION_7_14(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBBEEA0);
  OUTLINED_FUNCTION_7_14(v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel__isFinishingWithFeaturedPhotos;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBBBF48);
  OUTLINED_FUNCTION_58_5((uint64_t)v5);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_peoplePickerHandler);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel____lazy_storage___peoplePickerDataSource);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_albumPickerHandler);
  OUTLINED_FUNCTION_58_5((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel__isUserAlbumSelected);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBBEEA8);
  OUTLINED_FUNCTION_7_14(v6);
  swift_bridgeObjectRelease();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBBEEB0);
  OUTLINED_FUNCTION_7_14(v7);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_manualSelectionPhotoPickerHandler);
  swift_bridgeObjectRelease();
}

- (void)passiveContentDataSourceAvailableTypesDidChange:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC03D3C();

}

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC038E8();

}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC03D3C();

}

@end
