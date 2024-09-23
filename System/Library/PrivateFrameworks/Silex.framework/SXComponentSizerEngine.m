@implementation SXComponentSizerEngine

- (SXComponentSizerEngine)init
{
  SXComponentSizerEngine *v2;
  SXComponentTypeMatching *v3;
  SXComponentTypeMatching *factoryMatching;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXComponentSizerEngine;
  v2 = -[SXComponentSizerEngine init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SXComponentTypeMatching);
    factoryMatching = v2->_factoryMatching;
    v2->_factoryMatching = v3;

  }
  return v2;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[SXComponentSizerEngine factoryMatching](self, "factoryMatching");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXComponentTypeDescribing descriptionWithType:role:](SXComponentTypeDescribing, "descriptionWithType:role:", v15, objc_msgSend(v13, "role"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "match:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sizerForComponent:componentLayout:layoutOptions:DOMObjectProvider:", v13, v12, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)addFactory:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentSizerEngine factoryMatching](self, "factoryMatching");
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
    -[SXComponentSizerEngine factoryMatching](self, "factoryMatching");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeDescription:", v4);

  }
}

- (SXComponentTypeMatching)factoryMatching
{
  return self->_factoryMatching;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoryMatching, 0);
}

@end
