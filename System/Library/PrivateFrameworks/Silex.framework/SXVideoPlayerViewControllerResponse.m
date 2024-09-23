@implementation SXVideoPlayerViewControllerResponse

- (BOOL)shouldAutoplay
{
  return self->_shouldAutoplay;
}

- (void)setShouldAutoplay:(BOOL)a3
{
  self->_shouldAutoplay = a3;
}

- (BOOL)expectVideoPlayerViewController
{
  return self->_expectVideoPlayerViewController;
}

- (void)setExpectVideoPlayerViewController:(BOOL)a3
{
  self->_expectVideoPlayerViewController = a3;
}

- (SXVideoAnalyticsRouter)analyticsRouter
{
  return self->_analyticsRouter;
}

- (void)setAnalyticsRouter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsRouter, a3);
}

- (SXVideoPlayerVisibilityMonitor)visibilityMonitor
{
  return self->_visibilityMonitor;
}

- (void)setVisibilityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsRouter, 0);
}

@end
