@implementation _REFeatureValuePair

- (_REFeatureValuePair)initWithFeature:(id)a3 value:(unint64_t)a4 index:(unint64_t)a5 rootFeatures:(id)a6
{
  id v11;
  id v12;
  _REFeatureValuePair *v13;
  _REFeatureValuePair *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_REFeatureValuePair;
  v13 = -[_REFeatureValuePair init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_feature, a3);
    v14->_value = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a4);
    v14->_index = a5;
    objc_storeStrong((id *)&v14->_rootFeatures, a6);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)_REFeatureValuePair;
  -[_REFeatureValuePair dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[REFeature hash](self->_feature, "hash");
  return REFeatureValueHashForTaggedPointer((void *)self->_value) ^ v3 ^ self->_index;
}

- (BOOL)isEqual:(id)a3
{
  _REFeatureValuePair *v4;
  _REFeatureValuePair *v5;
  REFeature *feature;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  BOOL v11;
  void *value;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;

  v4 = (_REFeatureValuePair *)a3;
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
        goto LABEL_10;
      v14 = REFeatureValueTypeForTaggedPointer(self->_value);
      if (v14 == REFeatureValueTypeForTaggedPointer((unint64_t)v13))
      {
        REFeatureValueForTaggedPointer(value);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
        {
LABEL_10:
          v11 = self->_index == v5->_index;
LABEL_14:

          goto LABEL_15;
        }
      }
LABEL_13:
      v11 = 0;
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (REFeature)feature
{
  return self->_feature;
}

- (unint64_t)value
{
  return self->_value;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSArray)rootFeatures
{
  return self->_rootFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFeatures, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
