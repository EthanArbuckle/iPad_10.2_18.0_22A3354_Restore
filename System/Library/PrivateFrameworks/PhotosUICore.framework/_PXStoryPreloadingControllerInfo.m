@implementation _PXStoryPreloadingControllerInfo

- (PXStoryResourcesPreloadingCoordinatable)preloadingController
{
  return self->_preloadingController;
}

- (void)setPreloadingController:(id)a3
{
  objc_storeStrong((id *)&self->_preloadingController, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadingController, 0);
}

@end
