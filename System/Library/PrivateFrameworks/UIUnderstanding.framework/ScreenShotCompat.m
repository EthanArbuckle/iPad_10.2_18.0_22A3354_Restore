@implementation ScreenShotCompat

- (NSString)imageID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ScreenShotCompat)init
{
  ScreenShotCompat *result;

  result = (ScreenShotCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_2496D407C((uint64_t)self + OBJC_IVAR___ScreenShotCompat_detections);
}

@end
