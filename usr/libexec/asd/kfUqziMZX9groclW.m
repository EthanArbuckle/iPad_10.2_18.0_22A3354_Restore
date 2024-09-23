@implementation kfUqziMZX9groclW

- (unsigned)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(unsigned __int8)a3
{
  self->_engineType = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
