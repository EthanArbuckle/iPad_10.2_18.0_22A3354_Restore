@implementation _BSUIDynamicArrayGeneration

- (_BSUIDynamicArrayGeneration)initWithData:(id)a3
{
  id v4;
  _BSUIDynamicArrayGeneration *v5;
  NSArray *v6;
  NSArray *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BSUIDynamicArrayGeneration;
  v5 = -[_BSUIDynamicArrayGeneration init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = v6;

  }
  return v5;
}

- (NSArray)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
