@implementation _REConcreteFeature

- (BOOL)isEqual:(id)a3
{
  _REConcreteFeature *v4;
  _REConcreteFeature *v5;
  _REConcreteFeature *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;

  v4 = (_REConcreteFeature *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_featureType == v5->_featureType)
      {
        name = self->_name;
        v8 = v5->_name;
        v9 = name;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSString isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)name
{
  return self->_name;
}

- (id)_rootFeatures
{
  return -[REFeatureSet initWithFeature:]([REFeatureSet alloc], "initWithFeature:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:featureType:", self->_name, self->_featureType);
}

- (unint64_t)hash
{
  return self->_featureType ^ -[NSString hash](self->_name, "hash");
}

- (_REConcreteFeature)initWithName:(id)a3 featureType:(unint64_t)a4
{
  id v6;
  _REConcreteFeature *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REConcreteFeature;
  v7 = -[_REConcreteFeature init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_featureType = a4;
  }

  return v7;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (int64_t)_bitCount
{
  unint64_t featureType;
  int64_t v3;

  featureType = self->_featureType;
  v3 = -1;
  if (featureType != 2)
    v3 = 1;
  if (featureType == 1)
    return 64;
  else
    return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
