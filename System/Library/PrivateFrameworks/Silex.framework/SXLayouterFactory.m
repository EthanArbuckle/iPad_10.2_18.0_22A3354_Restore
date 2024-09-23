@implementation SXLayouterFactory

- (SXLayouterFactory)initWithColumnCalculator:(id)a3 layoutContextFactory:(id)a4 unitConverterFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXLayouterFactory *v12;
  SXLayouterFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXLayouterFactory;
  v12 = -[SXLayouterFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_columnCalculator, a3);
    objc_storeStrong((id *)&v13->_layoutContextFactory, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
  }

  return v13;
}

- (id)createColumnLayouterWithDelegate:(id)a3
{
  id v4;
  SXColumnLayouter *v5;
  void *v6;
  void *v7;
  SXColumnLayouter *v8;

  v4 = a3;
  v5 = [SXColumnLayouter alloc];
  -[SXLayouterFactory layoutContextFactory](self, "layoutContextFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayouterFactory unitConverterFactory](self, "unitConverterFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXColumnLayouter initWithLayouterFactory:layoutContextFactory:unitConverterFactory:](v5, "initWithLayouterFactory:layoutContextFactory:unitConverterFactory:", self, v6, v7);

  -[SXColumnLayouter setDelegate:](v8, "setDelegate:", v4);
  return v8;
}

- (id)layouterForContainerComponentBlueprint:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  SXCollectionLayouter *v11;
  void *v12;
  void *v13;
  SXCollectionLayouter *v14;
  void *v15;
  void *v16;
  int v17;
  SXHorizontalStackLayouter *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_254F31B60);

  if (v10)
  {
    v11 = [SXCollectionLayouter alloc];
    -[SXLayouterFactory columnCalculator](self, "columnCalculator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayouterFactory unitConverterFactory](self, "unitConverterFactory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SXCollectionLayouter initWithContainerComponent:layouterFactory:columnCalculator:unitConverterFactory:](v11, "initWithContainerComponent:layouterFactory:columnCalculator:unitConverterFactory:", v6, self, v12, v13);
  }
  else
  {
    objc_msgSend(v6, "component");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentDisplay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_254F69D18);

    if (!v17)
    {
      -[SXLayouterFactory createColumnLayouterWithDelegate:](self, "createColumnLayouterWithDelegate:", v7);
      v14 = (SXCollectionLayouter *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v18 = [SXHorizontalStackLayouter alloc];
    -[SXLayouterFactory columnCalculator](self, "columnCalculator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayouterFactory layoutContextFactory](self, "layoutContextFactory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayouterFactory unitConverterFactory](self, "unitConverterFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (SXCollectionLayouter *)-[SXHorizontalStackLayouter initWithContainerComponent:layouterFactory:columnCalculator:layoutContextFactory:unitConverterFactory:]((id *)&v18->super.isa, v6, self, v12, v13, v19);

  }
LABEL_7:
  -[SXCollectionLayouter setDelegate:](v14, "setDelegate:", v7);

  return v14;
}

- (SXColumnCalculator)columnCalculator
{
  return self->_columnCalculator;
}

- (SXLayoutContextFactory)layoutContextFactory
{
  return self->_layoutContextFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_layoutContextFactory, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
}

@end
