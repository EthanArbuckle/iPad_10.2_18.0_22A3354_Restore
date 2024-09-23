@implementation MTPodcastEpisodeLimitHelper

+ (NSSet)allGlobalLimits
{
  return (NSSet *)_s18PodcastsFoundation25PodcastEpisodeLimitHelperC15allGlobalLimitsSo5NSSetCvgZ_0();
}

+ (BOOL)limitAllowsAutomaticDownloads:(int64_t)a3
{
  return MTPodcastEpisodeLimit.allowsAutomaticDownloads.getter((void *)a3) & 1;
}

- (MTPodcastEpisodeLimitHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PodcastEpisodeLimitHelper();
  return -[MTPodcastEpisodeLimitHelper init](&v3, sel_init);
}

@end
