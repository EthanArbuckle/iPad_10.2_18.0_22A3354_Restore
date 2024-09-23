@implementation BindingRecord

- (BindingRecord)initWithKey:(id)a3 updatedDate:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  BindingRecord *v12;
  BindingRecord *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BindingRecord;
  v12 = -[BindingRecord init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a5);
    objc_storeStrong((id *)&v13->_key, a3);
    objc_storeStrong((id *)&v13->_updated, a4);
  }

  return v13;
}

- (NSString)key
{
  return self->_key;
}

- (NSDate)updated
{
  return self->_updated;
}

- (NSObject)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
