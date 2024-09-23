@implementation PXStoryResourcesPreloadingRequest

- (PXStoryResourcesPreloadingRequest)initWithTimeline:(id)a3 timelineAttributes:(unint64_t)a4 startingSegmentIdentifier:(int64_t)a5 shouldIgnoreStartingSegmentIdentifier:(BOOL)a6
{
  id v11;
  PXStoryResourcesPreloadingRequest *v12;
  PXStoryResourcesPreloadingRequest *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryResourcesPreloadingRequest;
  v12 = -[PXStoryResourcesPreloadingRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timeline, a3);
    v13->_timelineAttributes = a4;
    v13->_startingSegmentIdentifier = a5;
    v13->_shouldIgnoreStartingSegmentIdentifier = a6;
  }

  return v13;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (unint64_t)timelineAttributes
{
  return self->_timelineAttributes;
}

- (int64_t)startingSegmentIdentifier
{
  return self->_startingSegmentIdentifier;
}

- (BOOL)shouldIgnoreStartingSegmentIdentifier
{
  return self->_shouldIgnoreStartingSegmentIdentifier;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (void)setSongResource:(id)a3
{
  objc_storeStrong((id *)&self->_songResource, a3);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
