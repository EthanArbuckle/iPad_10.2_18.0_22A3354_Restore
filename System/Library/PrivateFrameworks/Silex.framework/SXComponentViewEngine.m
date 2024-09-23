@implementation SXComponentViewEngine

- (SXComponentViewEngine)initWithPostProcessorManager:(id)a3
{
  id v5;
  SXComponentViewEngine *v6;
  SXComponentTypeMatching *v7;
  SXComponentTypeMatching *factoryMatching;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXComponentViewEngine;
  v6 = -[SXComponentViewEngine init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(SXComponentTypeMatching);
    factoryMatching = v6->_factoryMatching;
    v6->_factoryMatching = v7;

    objc_storeStrong((id *)&v6->_postProcessorManager, a3);
  }

  return v6;
}

- (id)componentViewForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SXComponentViewEngine factoryMatching](self, "factoryMatching");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXComponentTypeDescribing descriptionWithType:role:](SXComponentTypeDescribing, "descriptionWithType:role:", v6, objc_msgSend(v4, "role"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "match:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentViewForComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SXComponentViewEngine postProcessorManager](self, "postProcessorManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processComponent:view:", v4, v9);

  }
  return v9;
}

- (void)addFactory:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentViewEngine factoryMatching](self, "factoryMatching");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDescription:", v4);

  }
}

- (void)removeFactory:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentViewEngine factoryMatching](self, "factoryMatching");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDescription:", v4);

  }
}

- (SXComponentTypeMatching)factoryMatching
{
  return self->_factoryMatching;
}

- (SXComponentViewPostProcessorManager)postProcessorManager
{
  return self->_postProcessorManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessorManager, 0);
  objc_storeStrong((id *)&self->_factoryMatching, 0);
}

@end
