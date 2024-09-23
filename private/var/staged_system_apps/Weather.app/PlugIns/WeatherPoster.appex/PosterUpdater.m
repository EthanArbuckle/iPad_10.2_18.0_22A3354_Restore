@implementation PosterUpdater

- (void)updateDescriptors:(NSDictionary *)a3 completion:(id)a4
{
  sub_10002031C(self, (int)a2, a3, a4, (uint64_t)&unk_100056AC0, (uint64_t)&unk_10005C960);
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 completion:(id)a4
{
  sub_10002031C(self, (int)a2, a3, a4, (uint64_t)&unk_100056A20, (uint64_t)&unk_10005C918);
}

- (_TtC13WeatherPoster13PosterUpdater)init
{
  return (_TtC13WeatherPoster13PosterUpdater *)PosterUpdater.init()();
}

@end
