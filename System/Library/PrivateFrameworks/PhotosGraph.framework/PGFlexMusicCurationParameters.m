@implementation PGFlexMusicCurationParameters

- (PGFlexMusicCurationParameters)initWithMood:(unint64_t)a3 moodKeywords:(id)a4 recentlyUsedSongs:(id)a5 entityUUID:(id)a6 useMoodKeywords:(BOOL)a7 features:(id)a8 musicCuratorContext:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  PGFlexMusicCurationParameters *v19;

  v12 = sub_1CA85B7B0();
  v13 = sub_1CA85B534();
  v15 = v14;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v19 = (PGFlexMusicCurationParameters *)sub_1CA2F4048(a3, v12, v16, v13, v15, a7, a8, (uint64_t)a9);

  return v19;
}

- (PGFlexMusicCurationParameters)initWithMood:(unint64_t)a3 moodKeywords:(id)a4 recentlyUsedSongs:(id)a5 entityUUID:(id)a6 useMoodKeywords:(BOOL)a7 features:(id)a8 musicCuratorContext:(id)a9 genre:(id)a10
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  PGFlexMusicCurationParameters *v22;

  v12 = sub_1CA85B7B0();
  v13 = sub_1CA85B534();
  v15 = v14;
  v16 = sub_1CA85B534();
  v18 = v17;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v22 = (PGFlexMusicCurationParameters *)sub_1CA2F4168(a3, v12, v19, v13, v15, a7, a8, (uint64_t)a9, v16, v18);

  return v22;
}

- (PGFlexMusicCurationParameters)init
{
  PGFlexMusicCurationParameters *result;

  result = (PGFlexMusicCurationParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
