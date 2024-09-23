@implementation PGMusicCurationFeatures

- (BOOL)shouldAvoidColorGrading
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PGMusicCurationFeatures_shouldAvoidColorGrading);
}

- (NSString)description
{
  PGMusicCurationFeatures *v2;
  void *v3;

  v2 = self;
  MusicCurationFeatures.description.getter();

  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PGMusicCurationFeatures)init
{
  PGMusicCurationFeatures *result;

  result = (PGMusicCurationFeatures *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
