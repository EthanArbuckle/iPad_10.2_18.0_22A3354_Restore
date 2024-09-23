@implementation RootHostingController.FallbackCoverAnimatingSource

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

- (id)coverAnimationSourceReferenceView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource_referenceView));
}

- (id)coverAnimationSourceImage
{
  return 0;
}

- (id)coverAnimationSourceView
{
  _TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_6ACE4();

  return v3;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (_TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource)init
{
  _TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource *result;

  result = (_TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.FallbackCoverAnimatingSource", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource_referenceView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->referenceView[OBJC_IVAR____TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource_adamID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->referenceView[OBJC_IVAR____TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource_instanceID]);
}

@end
