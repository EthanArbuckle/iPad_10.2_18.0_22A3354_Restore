@implementation PXStoryTransitionConfiguration

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (void)setTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_timeline, a3);
}

- (PXStoryTimelineSpec)timelineSpec
{
  return self->_timelineSpec;
}

- (void)setTimelineSpec:(id)a3
{
  objc_storeStrong((id *)&self->_timelineSpec, a3);
}

- (PXStoryTransitionModel)transitionModel
{
  return self->_transitionModel;
}

- (void)setTransitionModel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionModel, a3);
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (void)setEntityManager:(id)a3
{
  objc_storeStrong((id *)&self->_entityManager, a3);
}

- (PXStoryTransitionSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_transitionModel, 0);
  objc_storeStrong((id *)&self->_timelineSpec, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
