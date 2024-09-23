@implementation STLocationStatusDomainPublisher

- (void)updateVolatileData:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STLocationStatusDomainPublisher;
  -[STStatusDomainPublisher updateVolatileData:completion:](&v4, sel_updateVolatileData_completion_, a3, a4);
}

+ (unint64_t)statusDomainName
{
  return 5;
}

+ (id)emptyChangeContext
{
  return objc_alloc_init(STLocationStatusDomainDataChangeContext);
}

- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STLocationStatusDomainPublisher;
  -[STStatusDomainPublisher setData:withContext:completion:](&v5, sel_setData_withContext_completion_, a3, a4, a5);
}

- (void)updateData:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STLocationStatusDomainPublisher;
  -[STStatusDomainPublisher updateData:completion:](&v4, sel_updateData_completion_, a3, a4);
}

- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STLocationStatusDomainPublisher;
  -[STStatusDomainPublisher setVolatileData:withContext:completion:](&v5, sel_setVolatileData_withContext_completion_, a3, a4, a5);
}

+ (id)emptyData
{
  return objc_alloc_init(STLocationStatusDomainData);
}

@end
