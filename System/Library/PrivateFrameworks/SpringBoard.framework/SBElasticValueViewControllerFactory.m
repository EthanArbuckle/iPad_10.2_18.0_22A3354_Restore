@implementation SBElasticValueViewControllerFactory

+ (id)factoryWithBrightnessDataSource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SBElasticValueViewControllerFactory_factoryWithBrightnessDataSource___block_invoke;
  v8[3] = &unk_1E8EBD630;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](v8);
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithViewControllerGenerator:", v5);

  return v6;
}

SBElasticBrightnessViewController *__71__SBElasticValueViewControllerFactory_factoryWithBrightnessDataSource___block_invoke(uint64_t a1)
{
  return -[SBElasticBrightnessViewController initWithDataSource:]([SBElasticBrightnessViewController alloc], "initWithDataSource:", *(_QWORD *)(a1 + 32));
}

+ (id)factoryWithVolumeDataSource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SBElasticValueViewControllerFactory_factoryWithVolumeDataSource___block_invoke;
  v8[3] = &unk_1E8EBD630;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](v8);
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithViewControllerGenerator:", v5);

  return v6;
}

SBElasticVolumeViewController *__67__SBElasticValueViewControllerFactory_factoryWithVolumeDataSource___block_invoke(uint64_t a1)
{
  return -[SBElasticVolumeViewController initWithDataSource:]([SBElasticVolumeViewController alloc], "initWithDataSource:", *(_QWORD *)(a1 + 32));
}

- (id)_initWithViewControllerGenerator:(id)a3
{
  id v4;
  SBElasticValueViewControllerFactory *v5;
  uint64_t v6;
  id generator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBElasticValueViewControllerFactory;
  v5 = -[SBElasticValueViewControllerFactory init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D17E5550](v4);
    generator = v5->_generator;
    v5->_generator = (id)v6;

  }
  return v5;
}

- (id)elasticValueViewController
{
  return (id)(*((uint64_t (**)(void))self->_generator + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generator, 0);
}

@end
