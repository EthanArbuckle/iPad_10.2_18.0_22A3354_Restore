@implementation STKeyValuePair

- (STKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  STKeyValuePair *v8;
  id key;
  id v10;
  id value;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STKeyValuePair;
  v8 = -[STKeyValuePair init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  value = v8->_value;
  v8->_value = v7;

  return v8;
}

- (STKeyValuePair)init
{
  return -[STKeyValuePair initWithKey:value:](self, "initWithKey:value:", 0, 0);
}

- (id)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
