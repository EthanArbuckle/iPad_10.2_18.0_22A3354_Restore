@implementation REFeatureValuePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[REFeature hash](self->_feature, "hash");
  return REFeatureValueHashForTaggedPointer((void *)self->_value) ^ v3;
}

- (REFeature)feature
{
  return self->_feature;
}

- (unint64_t)value
{
  return self->_value;
}

- (REFeatureValuePair)initWithFeature:(id)a3 value:(unint64_t)a4
{
  id v7;
  REFeatureValuePair *v8;
  REFeatureValuePair *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REFeatureValuePair;
  v8 = -[REFeatureValuePair init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_feature, a3);
    v9->_value = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)REFeatureValuePair;
  -[REFeatureValuePair dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  REFeatureValuePair *v4;
  REFeatureValuePair *v5;
  REFeature *feature;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  char v11;
  void *value;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = (REFeatureValuePair *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      feature = self->_feature;
      v7 = v5->_feature;
      if (feature == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = feature;
        v10 = -[REFeature isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_13;
      }
      value = (void *)self->_value;
      v13 = (void *)v5->_value;
      if (value == v13)
      {
        v11 = 1;
      }
      else
      {
        v14 = REFeatureValueTypeForTaggedPointer((unint64_t)value);
        if (v14 != REFeatureValueTypeForTaggedPointer((unint64_t)v13))
        {
LABEL_13:
          v11 = 0;
          goto LABEL_14;
        }
        REFeatureValueForTaggedPointer(value);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v15, "isEqual:", v16);

      }
LABEL_14:

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  REFeature *feature;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  feature = self->_feature;
  REDescriptionForTaggedPointer((void *)self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p: %@> feature=%@, value=%@"), self, v4, feature, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFeature:value:", self->_feature, self->_value);
}

@end
