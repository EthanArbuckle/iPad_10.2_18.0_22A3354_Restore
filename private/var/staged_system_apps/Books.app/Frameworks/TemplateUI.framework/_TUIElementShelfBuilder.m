@implementation _TUIElementShelfBuilder

- (void)configureWithChildNode:(id)a3 attributes:(id)a4
{
  NSString *v5;
  NSString *role;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "stringForAttribute:node:", 176, a3.var0));
  role = self->_role;
  self->_role = v5;

}

- (void)addModel:(id)a3
{
  id v4;
  TUISingleModelContainerWithRole *v5;
  void *v6;
  objc_super v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    v5 = -[TUISingleModelContainerWithRole initWithRole:]([TUISingleModelContainerWithRole alloc], "initWithRole:", self->_role);
    v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    -[TUISingleModelContainer updateModelChildren:](v5, "updateModelChildren:", v6);

    v7.receiver = self;
    v7.super_class = (Class)_TUIElementShelfBuilder;
    -[TUIBoxBuilder addModel:](&v7, "addModel:", v5);

  }
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_models, 0);
}

@end
