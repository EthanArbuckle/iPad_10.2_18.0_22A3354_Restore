@implementation ICAMSBagValuePromise

- (unint64_t)bagValueType
{
  return self->_bagValueType;
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (ICAMSBagValuePromise)initWithBagKey:(id)a3 bagValueType:(unint64_t)a4
{
  id v6;
  ICAMSBagValuePromise *v7;
  uint64_t v8;
  NSString *bagKey;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICAMSBagValuePromise;
  v7 = -[ICAMSBagValuePromise init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bagKey = v7->_bagKey;
    v7->_bagKey = (NSString *)v8;

    v7->_bagValueType = a4;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end
