@implementation SXComponentInsertionLayoutProcessor

- (SXComponentInsertionLayoutProcessor)initWithComponentInsertionManager:(id)a3
{
  id v5;
  SXComponentInsertionLayoutProcessor *v6;
  SXComponentInsertionLayoutProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentInsertionLayoutProcessor;
  v6 = -[SXComponentInsertionLayoutProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_componentInsertionManager, a3);

  return v7;
}

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v8, "isComplete"))
    {
      -[SXComponentInsertionLayoutProcessor layoutOptions](self, "layoutOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) == 0)
      {
        -[SXComponentInsertionLayoutProcessor componentInsertionManager](self, "componentInsertionManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "insertComponentsForBlueprint:DOMObjectProvider:", v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setDOM:", v14);
        objc_msgSend(v16, "options");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentInsertionLayoutProcessor setLayoutOptions:](self, "setLayoutOptions:", v15);

      }
    }
  }

}

- (SXComponentInsertionManager)componentInsertionManager
{
  return self->_componentInsertionManager;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_componentInsertionManager, 0);
}

@end
