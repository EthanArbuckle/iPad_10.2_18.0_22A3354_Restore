@implementation DenseFeatureConfig

- (DenseFeatureConfig)init
{
  DenseFeatureConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DenseFeatureConfig;
  result = -[FeatureConfig init](&v3, sel_init);
  if (result)
  {
    result->_defaultValue = 0.0;
    result->_normalization = 0;
    result->_transform = 0;
  }
  return result;
}

- (DenseFeatureConfig)initWithConfig:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  DenseFeatureConfig *v8;
  DenseFeatureConfig *v9;
  float v10;
  uint64_t v11;
  NSString *normalizationType;
  float v13;
  float v14;
  uint64_t v15;
  NSString *transformType;
  uint64_t v17;
  NSString *originalFeatureName;
  objc_super v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DenseFeatureConfig;
  v8 = -[FeatureConfig init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v20.receiver = v8;
    v20.super_class = (Class)DenseFeatureConfig;
    -[FeatureConfig setName:](&v20, sel_setName_, v7);
    objc_msgSend(v6, "defaultValue");
    v9->_defaultValue = v10;
    v9->_normalization = objc_msgSend(v6, "normalization");
    objc_msgSend(v6, "normalizationType");
    v11 = objc_claimAutoreleasedReturnValue();
    normalizationType = v9->_normalizationType;
    v9->_normalizationType = (NSString *)v11;

    objc_msgSend(v6, "normalizationMin");
    v9->_normalizationMin = v13;
    objc_msgSend(v6, "normalizationMax");
    v9->_normalizationMax = v14;
    v9->_transform = objc_msgSend(v6, "transform");
    objc_msgSend(v6, "transformType");
    v15 = objc_claimAutoreleasedReturnValue();
    transformType = v9->_transformType;
    v9->_transformType = (NSString *)v15;

    objc_msgSend(v6, "originalFeatureName");
    v17 = objc_claimAutoreleasedReturnValue();
    originalFeatureName = v9->_originalFeatureName;
    v9->_originalFeatureName = (NSString *)v17;

  }
  return v9;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(float)a3
{
  self->_defaultValue = a3;
}

- (BOOL)normalization
{
  return self->_normalization;
}

- (void)setNormalization:(BOOL)a3
{
  self->_normalization = a3;
}

- (NSString)normalizationType
{
  return self->_normalizationType;
}

- (void)setNormalizationType:(id)a3
{
  objc_storeStrong((id *)&self->_normalizationType, a3);
}

- (float)normalizationMin
{
  return self->_normalizationMin;
}

- (void)setNormalizationMin:(float)a3
{
  self->_normalizationMin = a3;
}

- (float)normalizationMax
{
  return self->_normalizationMax;
}

- (void)setNormalizationMax:(float)a3
{
  self->_normalizationMax = a3;
}

- (BOOL)transform
{
  return self->_transform;
}

- (void)setTransform:(BOOL)a3
{
  self->_transform = a3;
}

- (NSString)transformType
{
  return self->_transformType;
}

- (void)setTransformType:(id)a3
{
  objc_storeStrong((id *)&self->_transformType, a3);
}

- (NSString)originalFeatureName
{
  return self->_originalFeatureName;
}

- (void)setOriginalFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_originalFeatureName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureName, 0);
  objc_storeStrong((id *)&self->_transformType, 0);
  objc_storeStrong((id *)&self->_normalizationType, 0);
}

@end
