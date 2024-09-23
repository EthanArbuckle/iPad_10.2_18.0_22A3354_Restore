@implementation TUIInstantiateContextState

- (TUIInstantiateContextState)initWithViewStateMapping:(id)a3
{
  id v4;
  TUIInstantiateContextState *v5;
  NSDictionary *v6;
  NSDictionary *viewStateMapping;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIInstantiateContextState;
  v5 = -[TUIInstantiateContextState init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    viewStateMapping = v5->_viewStateMapping;
    v5->_viewStateMapping = v6;

  }
  return v5;
}

- (NSDictionary)viewStateMapping
{
  return self->_viewStateMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewStateMapping, 0);
}

@end
