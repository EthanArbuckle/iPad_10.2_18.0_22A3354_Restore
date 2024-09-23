@implementation PGGraphSceneFeatureNode

- (PGGraphSceneFeatureNode)initWithLabel:(id)a3
{
  id v4;
  PGGraphSceneFeatureNode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSceneFeatureNode;
  v5 = -[PGGraphNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (unsigned)domain
{
  return 601;
}

- (PGGraphSceneFeatureNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphSceneFeatureNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 27;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSceneFeatureNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 601);
}

+ (id)filterForSceneName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLabel:domain:", v4, 601);

  return v5;
}

+ (id)filterForSceneNames:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArray:", v4);

  v6 = objc_alloc(MEMORY[0x1E0D42A50]);
  v7 = (void *)objc_msgSend(v6, "initWithLabels:domain:properties:", v5, 601, MEMORY[0x1E0C9AA70]);

  return v7;
}

+ (id)momentOfSceneFeature
{
  void *v2;
  void *v3;

  +[PGGraphMomentFeaturesEdge filter](PGGraphMomentFeaturesEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
