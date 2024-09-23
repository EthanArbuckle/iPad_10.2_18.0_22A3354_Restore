@implementation MTEmptyDownloadsGateway

- (id)cancelAllDownloadsUserInitiated:(BOOL)a3
{
  return +[NSSet set](NSSet, "set", a3);
}

- (id)episodeUuidForDownloadWithAdamID:(id)a3
{
  return 0;
}

- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3
{
  return 0;
}

@end
