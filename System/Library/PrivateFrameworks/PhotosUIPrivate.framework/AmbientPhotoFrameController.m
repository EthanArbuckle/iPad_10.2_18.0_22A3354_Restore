@implementation AmbientPhotoFrameController

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate27AmbientPhotoFrameController *v5;

  v4 = a3;
  v5 = self;
  sub_1AABD6EDC();

}

- (void)openVisibleAssetInPhotosApp
{
  _TtC15PhotosUIPrivate27AmbientPhotoFrameController *v2;

  v2 = self;
  sub_1AABD9184();

}

- (_TtC15PhotosUIPrivate27AmbientPhotoFrameController)init
{
  AmbientPhotoFrameController.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_photoLibrary);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_keyAsset);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_38_6(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_posterConfiguration);
  OUTLINED_FUNCTION_38_6(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_posterDescriptor);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController____lazy_storage___contentView);
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_storyView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_nonAnimatingPlaybackTimer);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_45_3();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_tapToRadarButtonTitleLeadingConstraint);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_6_10(*(id *)((char *)&self->super.isa
                               + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameController_storyMainModel));
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  _TtC15PhotosUIPrivate27AmbientPhotoFrameController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  AmbientPhotoFrameController.collectTapToRadarDiagnostics(into:)(a3);
  swift_unknownObjectRelease();

}

@end
