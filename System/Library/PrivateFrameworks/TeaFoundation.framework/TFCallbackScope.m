@implementation TFCallbackScope

- (TFCallbackScope)initWithScope:(unint64_t)a3 names:(id)a4
{
  id v7;
  TFCallbackScope *v8;
  TFCallbackScope *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TFCallbackScope;
  v8 = -[TFCallbackScope init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_scope = a3;
    objc_storeStrong((id *)&v8->_names, a4);
  }

  return v9;
}

- (unint64_t)scope
{
  return self->_scope;
}

- (NSArray)names
{
  return self->_names;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_names, 0);
}

@end
