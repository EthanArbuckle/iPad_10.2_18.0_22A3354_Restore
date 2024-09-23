@implementation SXFormatModule

- (SXFormatModule)initWithResolver:(id)a3
{
  id v5;
  SXFormatModule *v6;
  SXFormatModule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXFormatModule;
  v6 = -[SXFormatModule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolver, a3);

  return v7;
}

- (id)createViewController
{
  void *v2;
  void *v3;

  -[SXFormatModule resolver](self, "resolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
