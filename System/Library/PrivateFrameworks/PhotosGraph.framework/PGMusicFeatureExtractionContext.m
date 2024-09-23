@implementation PGMusicFeatureExtractionContext

- (BOOL)useMoodKeywords
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PGMusicFeatureExtractionContext_useMoodKeywords);
}

- (PGMusicFeatureExtractionContext)init
{
  PGMusicFeatureExtractionContext *result;

  result = (PGMusicFeatureExtractionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PGMusicFeatureExtractionContext_songKeywordProvider);
}

+ (id)appleMusicFeatureExtractionContextWithCuratorContext:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s11PhotosGraph29MusicFeatureExtractionContextC05applecdeF04withAcA0c7CuratorF0C_tFZ_0((uint64_t)v3);

  return v4;
}

+ (id)flexMusicFeatureExtractionContextWithCuratorContext:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s11PhotosGraph29MusicFeatureExtractionContextC04flexcdeF04withAcA0c7CuratorF0C_tFZ_0((uint64_t)v3);

  return v4;
}

@end
