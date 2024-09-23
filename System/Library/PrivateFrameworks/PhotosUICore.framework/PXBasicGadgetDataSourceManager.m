@implementation PXBasicGadgetDataSourceManager

- (PXBasicGadgetDataSourceManager)initWithProviders:(id)a3
{
  id v5;
  PXBasicGadgetDataSourceManager *v6;
  PXBasicGadgetDataSourceManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBasicGadgetDataSourceManager;
  v6 = -[PXGadgetDataSourceManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_providers, a3);

  return v7;
}

- (NSArray)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
