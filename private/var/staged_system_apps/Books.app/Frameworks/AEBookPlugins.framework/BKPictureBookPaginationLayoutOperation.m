@implementation BKPictureBookPaginationLayoutOperation

- (unint64_t)pageOffsetForHref:(id)a3
{
  return 0;
}

- (void)_notifyLayoutComplete
{
  id v2;

  v2 = -[BKPaginationLayoutOperation layoutComplete:](self, "layoutComplete:", 1);
}

- (void)execute
{
  if (-[BKPaginationOperation isJobGenerationValid](self, "isJobGenerationValid"))
    -[BKPictureBookPaginationLayoutOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_notifyLayoutComplete", 0, 1);
}

@end
