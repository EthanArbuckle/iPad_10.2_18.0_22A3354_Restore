@implementation UIStatisticsIntegrator

void __58___UIStatisticsIntegrator_createSharedInstanceIfNecessary__block_invoke()
{
  _UIStatisticsIntegrator *v0;
  void *v1;

  if (!_statisticsIntegrator)
  {
    v0 = objc_alloc_init(_UIStatisticsIntegrator);
    v1 = (void *)_statisticsIntegrator;
    _statisticsIntegrator = (uint64_t)v0;

  }
}

@end
