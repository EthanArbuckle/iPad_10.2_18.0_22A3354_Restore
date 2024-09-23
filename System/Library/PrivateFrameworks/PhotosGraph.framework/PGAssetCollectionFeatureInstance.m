@implementation PGAssetCollectionFeatureInstance

- (PGAssetCollectionFeatureInstance)initWithSpecification:(id)a3 momentNode:(id)a4
{
  id v7;
  id v8;
  PGAssetCollectionFeatureInstance *v9;
  PGAssetCollectionFeatureInstance *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGAssetCollectionFeatureInstance;
  v9 = -[PGAssetCollectionFeatureInstance init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_specification, a3);
    objc_storeStrong((id *)&v10->_momentNode, a4);
  }

  return v10;
}

- (PGAssetCollectionFeatureInstance)initWithSpecification:(id)a3 momentNode:(id)a4 featureNodes:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGAssetCollectionFeatureInstance *v12;
  PGAssetCollectionFeatureInstance *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGAssetCollectionFeatureInstance;
  v12 = -[PGAssetCollectionFeatureInstance init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_specification, a3);
    objc_storeStrong((id *)&v13->_momentNode, a4);
    objc_storeStrong((id *)&v13->_featureNodes, a5);
  }

  return v13;
}

- (PGAssetCollectionFeatureSpecification)specification
{
  return (PGAssetCollectionFeatureSpecification *)objc_getProperty(self, a2, 8, 1);
}

- (PGGraphMomentNode)momentNode
{
  return (PGGraphMomentNode *)objc_getProperty(self, a2, 16, 1);
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  return (PGGraphFeatureNodeCollection *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_specification, 0);
}

@end
