@implementation AudiobookNowPlayingTouchViewControllerCoverSource

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (CGRect)coverAnimationSourceFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)coverAnimationSourceImage
{
  return 0;
}

- (id)coverAnimationSourceView
{
  return 0;
}

- (id)coverAnimationSourceReferenceView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource_view));
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (_TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource)init
{
  _TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource *result;

  result = (_TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingTouchViewControllerCoverSource", 55, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource_view));
}

@end
