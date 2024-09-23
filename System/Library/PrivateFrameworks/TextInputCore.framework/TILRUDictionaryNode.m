@implementation TILRUDictionaryNode

- (TILRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  id v7;
  id v8;
  TILRUDictionaryNode *v9;
  TILRUDictionaryNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TILRUDictionaryNode;
  v9 = -[TILRUDictionaryNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_object, a4);
  }

  return v10;
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->next, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
