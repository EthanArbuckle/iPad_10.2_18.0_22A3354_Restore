@implementation IMURLBag

- (int64_t)videoLimit
{
  return (int64_t)-[IMURLBag downloadLimitVideoPodcast](self, "downloadLimitVideoPodcast");
}

- (int64_t)audioLimit
{
  return (int64_t)-[IMURLBag downloadLimitPodcast](self, "downloadLimitPodcast");
}

@end
