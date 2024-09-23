@implementation _UIStatisticsIntegrator

+ (id)sharedInstance
{
  objc_msgSend(a1, "createSharedInstanceIfNecessary");
  return (id)_statisticsIntegrator;
}

+ (void)createSharedInstanceIfNecessary
{
  if (createSharedInstanceIfNecessary_onceToken != -1)
    dispatch_once(&createSharedInstanceIfNecessary_onceToken, &__block_literal_global_608);
}

- (_UIStatisticsIntegrator)init
{
  _UIStatisticsIntegrator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *reportingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatisticsIntegrator;
  v2 = -[_UIStatisticsIntegrator init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.UIKit.statisticsIntegrator", 0);
    reportingQueue = v2->_reportingQueue;
    v2->_reportingQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (void)setSharedInstance:(id)a3
{
  objc_storeStrong((id *)&_statisticsIntegrator, a3);
}

- (void)batchRecord:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_reportingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingQueue, 0);
}

@end
