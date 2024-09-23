@implementation RECustomRelevanceProvider

- (RECustomRelevanceProvider)initWithFeature:(id)a3 value:(unint64_t)a4
{
  id v7;
  RECustomRelevanceProvider *v8;
  RECustomRelevanceProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RECustomRelevanceProvider;
  v8 = -[RERelevanceProvider init](&v11, sel_init);
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
  v3.super_class = (Class)RECustomRelevanceProvider;
  -[RECustomRelevanceProvider dealloc](&v3, sel_dealloc);
}

+ (id)relevanceSimulatorID
{
  return CFSTR("custom_provider");
}

- (RECustomRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  RECustomRelevanceProvider *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature_name"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24CF92178;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature_type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", v8, objc_msgSend(v9, "integerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDictionary:](REFeatureValue, "featureValueWithDictionary:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (const void *)RECreateFeatureValueTaggedPointer(v11);
  v13 = -[RECustomRelevanceProvider initWithFeature:value:](self, "initWithFeature:value:", v10, v12);
  REReleaseFeatureValueTaggedPointer(v12);

  return v13;
}

- (id)dictionaryEncoding
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  -[REFeature _dependentFeatures](self->_feature, "_dependentFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("We don't currently handle encoding this feature type"), v5, v6, v7, v8, v9, v10, v19);
  v20[0] = CFSTR("feature_name");
  -[REFeature name](self->_feature, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("feature_type");
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[REFeature featureType](self->_feature, "featureType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  REFeatureValueForTaggedPointer((void *)self->_value);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryEncoding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "addEntriesFromDictionary:", v13);
  v17 = (void *)objc_msgSend(v16, "copy");

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RECustomRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_feature);
  value = (void *)self->_value;
  v4[5] = value;
  RERetainFeatureValueTaggedPointer(value);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RECustomRelevanceProvider *v4;
  RECustomRelevanceProvider *v5;
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
  objc_super v18;

  v4 = (RECustomRelevanceProvider *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)RECustomRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v18, sel_isEqual_, v4))
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
            goto LABEL_14;
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
LABEL_14:
            v11 = 0;
            goto LABEL_15;
          }
          REFeatureValueForTaggedPointer(value);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          REFeatureValueForTaggedPointer(v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v15, "isEqual:", v16);

        }
LABEL_15:

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)_hash
{
  uint64_t v3;

  v3 = REFeatureValueHashForTaggedPointer((void *)self->_value);
  return -[REFeature hash](self->_feature, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  REFeature *feature;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RECustomRelevanceProvider;
  -[RECustomRelevanceProvider description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  feature = self->_feature;
  REDescriptionForTaggedPointer((void *)self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" feature=%@, value=%@"), feature, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (REFeature)feature
{
  return self->_feature;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
