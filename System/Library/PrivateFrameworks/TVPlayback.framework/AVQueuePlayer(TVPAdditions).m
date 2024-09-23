@implementation AVQueuePlayer(TVPAdditions)

- (id)tvp_cachedAudioSelectionCriteria
{
  return objc_getAssociatedObject(a1, sel_tvp_cachedAudioSelectionCriteria);
}

- (void)setTvp_cachedAudioSelectionCriteria:()TVPAdditions
{
  objc_setAssociatedObject(a1, sel_tvp_cachedAudioSelectionCriteria, a3, (void *)1);
}

@end
