@implementation PXStoryLayoutSpecManager

- (PXStoryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5
{
  PXStoryLayoutSpecManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryLayoutSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_storyConfigurationOptions = a5;
  return result;
}

- (PXStoryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXStoryLayoutSpecManager initWithExtendedTraitCollection:options:storyConfigurationOptions:](self, "initWithExtendedTraitCollection:options:storyConfigurationOptions:", a3, a4, 0);
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXStoryLayoutSpec)layoutSpec
{
  void *v4;
  void *v6;

  -[PXFeatureSpecManager spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryLayoutSpecManager.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSpec != nil"));

  }
  return (PXStoryLayoutSpec *)v4;
}

- (id)createSpec
{
  PXStoryConcreteLayoutSpec *v3;
  void *v4;
  PXStoryConcreteLayoutSpec *v5;

  v3 = [PXStoryConcreteLayoutSpec alloc];
  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXStoryConcreteLayoutSpec initWithExtendedTraitCollection:options:storyConfigurationOptions:](v3, "initWithExtendedTraitCollection:options:storyConfigurationOptions:", v4, -[PXFeatureSpecManager options](self, "options"), -[PXStoryLayoutSpecManager storyConfigurationOptions](self, "storyConfigurationOptions"));

  return v5;
}

- (unint64_t)storyConfigurationOptions
{
  return self->_storyConfigurationOptions;
}

@end
