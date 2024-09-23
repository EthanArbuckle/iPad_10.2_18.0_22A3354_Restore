@implementation NSMutableArray(UIMovieScrubberTrackViewAdditions)

- (uint64_t)removeViewsFromSuperview
{
  return objc_msgSend(a1, "makeObjectsPerformSelector:", sel_removeFromSuperview);
}

@end
