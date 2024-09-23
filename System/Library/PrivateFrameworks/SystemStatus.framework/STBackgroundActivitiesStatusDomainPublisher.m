@implementation STBackgroundActivitiesStatusDomainPublisher

- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STBackgroundActivitiesStatusDomainPublisher;
  -[STStatusDomainPublisher setData:withContext:completion:](&v5, sel_setData_withContext_completion_, a3, a4, a5);
}

- (void)updateData:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STBackgroundActivitiesStatusDomainPublisher;
  -[STStatusDomainPublisher updateData:completion:](&v4, sel_updateData_completion_, a3, a4);
}

- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STBackgroundActivitiesStatusDomainPublisher;
  -[STStatusDomainPublisher setVolatileData:withContext:completion:](&v5, sel_setVolatileData_withContext_completion_, a3, a4, a5);
}

- (void)updateVolatileData:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STBackgroundActivitiesStatusDomainPublisher;
  -[STStatusDomainPublisher updateVolatileData:completion:](&v4, sel_updateVolatileData_completion_, a3, a4);
}

+ (unint64_t)statusDomainName
{
  return 1;
}

+ (id)emptyData
{
  return objc_alloc_init(STBackgroundActivitiesStatusDomainData);
}

+ (id)emptyChangeContext
{
  return objc_alloc_init(STBackgroundActivitiesStatusDomainDataChangeContext);
}

@end
