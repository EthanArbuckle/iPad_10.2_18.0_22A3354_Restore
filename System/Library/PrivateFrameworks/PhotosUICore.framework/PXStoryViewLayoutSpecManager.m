@implementation PXStoryViewLayoutSpecManager

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  void *v4;
  void *v6;

  -[PXFeatureSpecManager spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLayoutSpecManager.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewLayoutSpec != nil"));

  }
  return (PXStoryViewLayoutSpec *)v4;
}

- (void)setStoryConfigurationOptions:(unint64_t)a3
{
  if (self->_storyConfigurationOptions != a3)
  {
    self->_storyConfigurationOptions = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setCustomGeneralChromeTitleConfiguration:(id)a3
{
  PXStoryViewChromeTitleConfiguration *v4;
  BOOL v5;
  PXStoryViewChromeTitleConfiguration *v6;
  PXStoryViewChromeTitleConfiguration *customGeneralChromeTitleConfiguration;
  PXStoryViewChromeTitleConfiguration *v8;

  v8 = (PXStoryViewChromeTitleConfiguration *)a3;
  v4 = self->_customGeneralChromeTitleConfiguration;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXStoryViewChromeTitleConfiguration isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXStoryViewChromeTitleConfiguration *)-[PXStoryViewChromeTitleConfiguration copy](v8, "copy");
      customGeneralChromeTitleConfiguration = self->_customGeneralChromeTitleConfiguration;
      self->_customGeneralChromeTitleConfiguration = v6;

      -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
    }
  }

}

- (id)createSpec
{
  PXStoryConcreteViewLayoutSpec *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  PXStoryConcreteViewLayoutSpec *v8;

  v3 = [PXStoryConcreteViewLayoutSpec alloc];
  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXFeatureSpecManager options](self, "options");
  v6 = -[PXStoryViewLayoutSpecManager storyConfigurationOptions](self, "storyConfigurationOptions");
  -[PXStoryViewLayoutSpecManager customGeneralChromeTitleConfiguration](self, "customGeneralChromeTitleConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryConcreteViewLayoutSpec initWithExtendedTraitCollection:options:storyConfigurationOptions:customGeneralChromeTitleConfiguration:](v3, "initWithExtendedTraitCollection:options:storyConfigurationOptions:customGeneralChromeTitleConfiguration:", v4, v5, v6, v7);

  return v8;
}

- (unint64_t)storyConfigurationOptions
{
  return self->_storyConfigurationOptions;
}

- (PXStoryViewChromeTitleConfiguration)customGeneralChromeTitleConfiguration
{
  return self->_customGeneralChromeTitleConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customGeneralChromeTitleConfiguration, 0);
}

@end
