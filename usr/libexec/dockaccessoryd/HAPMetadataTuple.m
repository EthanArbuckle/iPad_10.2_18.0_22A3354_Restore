@implementation HAPMetadataTuple

- (HAPMetadataTuple)initWithCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HAPMetadataTuple *v10;
  HAPMetadataTuple *v11;
  HAPMetadataTuple *v12;
  uint64_t v13;
  NSString *index;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)HAPMetadataTuple;
    v11 = -[HAPMetadataTuple init](&v16, "init");
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_characteristicType, a3);
      objc_storeStrong((id *)&v12->_serviceType, a4);
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), v9, v7));
      index = v12->_index;
      v12->_index = (NSString *)v13;

    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = a3;
  v6 = objc_opt_class(HAPMetadataTuple, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "index"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataTuple index](self, "index"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataTuple index](self, "index"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
