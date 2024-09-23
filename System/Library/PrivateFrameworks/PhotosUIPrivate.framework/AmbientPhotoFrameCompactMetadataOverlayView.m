@implementation AmbientPhotoFrameCompactMetadataOverlayView

- (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView)initWithFrame:(CGRect)a3
{
  sub_1AAC79A64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC79B90();
}

- (void)safeAreaInsetsDidChange
{
  _TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView *v2;

  v2 = self;
  sub_1AAC7A270();

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView_subtitleLabelBottomConstraint);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView____lazy_storage___titleFontDescriptor);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView____lazy_storage___titleMinimumFont);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView____lazy_storage___titleMaximumFont));
}

@end
