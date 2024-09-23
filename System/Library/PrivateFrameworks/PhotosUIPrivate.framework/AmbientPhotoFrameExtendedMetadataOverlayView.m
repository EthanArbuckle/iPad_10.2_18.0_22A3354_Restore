@implementation AmbientPhotoFrameExtendedMetadataOverlayView

- (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView)initWithFrame:(CGRect)a3
{
  sub_1AABD030C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AABD0438();
}

- (void)safeAreaInsetsDidChange
{
  _TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView *v2;

  v2 = self;
  sub_1AABD0534();

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView_titleLabelTopConstraint);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView_subtitleTopNoTitleConstraint);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView_subtitleTopWithTitleConstraint);
  swift_unknownObjectWeakDestroy();
}

@end
