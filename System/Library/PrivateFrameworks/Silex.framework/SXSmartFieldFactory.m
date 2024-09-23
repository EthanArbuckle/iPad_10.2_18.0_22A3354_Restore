@implementation SXSmartFieldFactory

- (SXSmartFieldFactory)initWithActionProvider:(id)a3 actionSerializer:(id)a4
{
  id v7;
  id v8;
  SXSmartFieldFactory *v9;
  SXSmartFieldFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXSmartFieldFactory;
  v9 = -[SXSmartFieldFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionProvider, a3);
    objc_storeStrong((id *)&v10->_actionSerializer, a4);
  }

  return v10;
}

- (id)smartFieldForAddition:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXSmartField *v12;

  v6 = a4;
  v7 = a3;
  -[SXSmartFieldFactory actionProvider](self, "actionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionForAddition:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXSmartFieldFactory actionSerializer](self, "actionSerializer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForAction:type:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[SXSmartField initWithContext:URL:action:]([SXSmartField alloc], "initWithContext:URL:action:", v6, v11, v9);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (SXActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SXActionSerializer)actionSerializer
{
  return self->_actionSerializer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSerializer, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
}

@end
