@implementation TICompositionMapItem

- (TICompositionMapItem)initWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  TICompositionMapItem *v8;
  uint64_t v9;
  NSString *key;
  uint64_t v11;
  NSString *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TICompositionMapItem;
  v8 = -[TICompositionMapItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v11;

  }
  return v8;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)itemWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:value:", v7, v6);

  return v8;
}

@end
