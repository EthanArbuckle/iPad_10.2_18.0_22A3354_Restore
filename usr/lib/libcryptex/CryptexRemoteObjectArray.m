@implementation CryptexRemoteObjectArray

- (CryptexRemoteObjectArray)initWithArray:(id)a3
{
  NSArray *v4;
  CryptexRemoteObjectArray *v5;
  NSArray *array;
  objc_super v8;

  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CryptexRemoteObjectArray;
  v5 = -[CryptexRemoteObjectArray init](&v8, sel_init);
  array = v5->_array;
  v5->_array = v4;

  return v5;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
