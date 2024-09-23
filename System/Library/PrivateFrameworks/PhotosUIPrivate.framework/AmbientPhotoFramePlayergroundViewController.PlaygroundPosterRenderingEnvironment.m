@implementation AmbientPhotoFramePlayergroundViewController.PlaygroundPosterRenderingEnvironment

- (int64_t)px_backlightLuminance
{
  return sub_1AAC93A34();
}

- (BOOL)px_isSnapshot
{
  return sub_1AABFD768() & 1;
}

- (BOOL)px_isPreview
{
  return sub_1AABFD768() & 1;
}

- (int64_t)px_significantEventsCounter
{
  return OUTLINED_FUNCTION_5_11();
}

- (BOOL)px_isPlayground
{
  return OUTLINED_FUNCTION_144() & 1;
}

- (BOOL)px_isCallServices
{
  return sub_1AABFD768() & 1;
}

- (int64_t)px_boundingShape
{
  return sub_1AAC93A34();
}

- (NSURL)px_assetDirectory
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEBB7DF0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AAC93BC0((uint64_t)v4);
  v5 = sub_1AB08AEAC();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1AB08AE64();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSURL *)v6;
}

- (int64_t)px_contentsType
{
  return sub_1AABE37C0();
}

- (CGRect)px_floatingObscurableBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1AAC93C64();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)px_deviceOrientation
{
  return OUTLINED_FUNCTION_144();
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1AAC93C64();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960036PlaygroundPosterRenderingEnvironment)init
{
  sub_1AAC93D18();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960036PlaygroundPosterRenderingEnvironment_assetDirectory;
  v3 = sub_1AB08AEAC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
