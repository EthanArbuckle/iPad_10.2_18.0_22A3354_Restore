@implementation STUValueBeacon

- (STUValueBeacon)initWithValue:(id)a3
{
  id v5;
  STUValueBeacon *v6;
  STUValueBeacon *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUValueBeacon;
  v6 = -[STUValueBeacon init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_value, a3);

  return v7;
}

- (STUValueBeacon)init
{
  return -[STUValueBeacon initWithValue:](self, "initWithValue:", 0);
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
