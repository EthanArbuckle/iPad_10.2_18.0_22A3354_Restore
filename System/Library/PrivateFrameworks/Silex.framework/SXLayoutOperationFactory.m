@implementation SXLayoutOperationFactory

- (SXLayoutOperationFactory)initWithComponentSizerEngine:(id)a3 layoutBlueprintFactory:(id)a4 layouterFactory:(id)a5 layoutContextFactory:(id)a6 unitConverterFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SXLayoutOperationFactory *v17;
  SXLayoutOperationFactory *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXLayoutOperationFactory;
  v17 = -[SXLayoutOperationFactory init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_componentSizerEngine, a3);
    objc_storeStrong((id *)&v18->_layoutBlueprintFactory, a4);
    objc_storeStrong((id *)&v18->_layouterFactory, a5);
    objc_storeStrong((id *)&v18->_layoutContextFactory, a6);
    objc_storeStrong((id *)&v18->_unitConverterFactory, a7);
  }

  return v18;
}

- (id)layoutOperationWithTask:(id)a3 DOMObjectProvider:(id)a4
{
  id v6;
  id v7;
  SXColumnLayouter *v8;
  void *v9;
  void *v10;
  void *v11;
  SXColumnLayouter *v12;
  SXLayoutOperation *v13;
  void *v14;
  void *v15;
  SXLayoutOperation *v16;

  v6 = a4;
  v7 = a3;
  v8 = [SXColumnLayouter alloc];
  -[SXLayoutOperationFactory layouterFactory](self, "layouterFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperationFactory layoutContextFactory](self, "layoutContextFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperationFactory unitConverterFactory](self, "unitConverterFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SXColumnLayouter initWithLayouterFactory:layoutContextFactory:unitConverterFactory:](v8, "initWithLayouterFactory:layoutContextFactory:unitConverterFactory:", v9, v10, v11);

  v13 = [SXLayoutOperation alloc];
  -[SXLayoutOperationFactory componentSizerEngine](self, "componentSizerEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperationFactory layoutBlueprintFactory](self, "layoutBlueprintFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SXLayoutOperation initWithTask:layouter:DOMObjectProvider:componentSizerEngine:layoutBlueprintFactory:](v13, "initWithTask:layouter:DOMObjectProvider:componentSizerEngine:layoutBlueprintFactory:", v7, v12, v6, v14, v15);

  return v16;
}

- (SXComponentSizerEngine)componentSizerEngine
{
  return self->_componentSizerEngine;
}

- (SXLayoutBlueprintFactory)layoutBlueprintFactory
{
  return self->_layoutBlueprintFactory;
}

- (SXLayouterFactory)layouterFactory
{
  return self->_layouterFactory;
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
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_storeStrong((id *)&self->_layoutBlueprintFactory, 0);
  objc_storeStrong((id *)&self->_componentSizerEngine, 0);
}

@end
