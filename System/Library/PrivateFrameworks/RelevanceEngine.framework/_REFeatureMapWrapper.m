@implementation _REFeatureMapWrapper

- (_REFeatureMapWrapper)initWithFeatureMap:(id)a3
{
  id v5;
  _REFeatureMapWrapper *v6;
  _REFeatureMapWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REFeatureMapWrapper;
  v6 = -[_REFeatureMapWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureMap, a3);

  return v7;
}

- (NSSet)allFeatures
{
  return -[REFeatureMap allFeatures](self->_featureMap, "allFeatures");
}

- (id)valueForFeature:(id)a3
{
  return -[REFeatureMap featureValueForFeature:](self->_featureMap, "featureValueForFeature:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureMap, 0);
}

@end
