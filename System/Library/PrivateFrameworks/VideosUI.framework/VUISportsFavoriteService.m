@implementation VUISportsFavoriteService

- (_TtC8VideosUI24VUISportsFavoriteService)init
{
  sub_1D9CDD4A0();
}

+ (void)initializeSportsManager
{
  static VUISportsFavoriteService.initializeSportsManager()();
}

+ (void)userConsentWithCompletionHandler:(id)a3
{
  sub_1D9CDDF54((uint64_t)a1, (int)a2, a3, (uint64_t)&unk_1E9FC3B98, (uint64_t)&unk_1F0215318);
}

+ (void)modifyUserConsentWithModification:(_TtC8VideosUI26VUIUserConsentModification *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  _TtC8VideosUI26VUIUserConsentModification *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  OUTLINED_FUNCTION_25_72((uint64_t)&unk_1F0215308, (uint64_t)v7);
}

+ (void)getFavoritesWithCompletionHandler:(id)a3
{
  sub_1D9CDDF54((uint64_t)a1, (int)a2, a3, (uint64_t)&unk_1E9FC3B48, (uint64_t)&unk_1F02152F8);
}

+ (void)addFavoritesWithTeams:(NSArray *)a3 leagues:(NSArray *)a4 completionHandler:(id)a5
{
  sub_1D9CDE4DC((uint64_t)a1, (int)a2, a3, a4, a5, (uint64_t)&unk_1E9FC3B20, (uint64_t)&unk_1F02152E8);
}

+ (void)removeFavoritesWithTeams:(NSArray *)a3 leagues:(NSArray *)a4 completionHandler:(id)a5
{
  sub_1D9CDE4DC((uint64_t)a1, (int)a2, a3, a4, a5, (uint64_t)&unk_1E9FC3AF8, (uint64_t)&unk_1F02152D8);
}

@end
