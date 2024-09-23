@implementation TUOptionalObject

- (TUOptionalObject)initWithValue:(id)a3
{
  id v4;
  TUOptionalObject *v5;
  uint64_t v6;
  id value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUOptionalObject;
  v5 = -[TUOptionalObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    value = v5->_value;
    v5->_value = (id)v6;

  }
  return v5;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
