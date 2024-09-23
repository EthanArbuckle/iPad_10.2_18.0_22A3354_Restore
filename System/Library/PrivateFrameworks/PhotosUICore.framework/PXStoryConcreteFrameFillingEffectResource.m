@implementation PXStoryConcreteFrameFillingEffectResource

- (PXStoryConcreteFrameFillingEffectResource)init
{
  return -[PXStoryConcreteFrameFillingEffectResource initWithDisplayAsset:useSmartColor:](self, "initWithDisplayAsset:useSmartColor:", 0, 0);
}

- (PXStoryConcreteFrameFillingEffectResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteResources.m"), 199, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteFrameFillingEffectResource initWithIdentifier:kind:]");

  abort();
}

- (PXStoryConcreteFrameFillingEffectResource)initWithDisplayAsset:(id)a3 useSmartColor:(BOOL)a4
{
  id v7;
  void *v8;
  PXStoryConcreteFrameFillingEffectResource *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PXStoryConcreteFrameFillingEffectResource;
  v9 = -[PXStoryConcreteResource initWithIdentifier:kind:](&v11, sel_initWithIdentifier_kind_, v8, 5);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayAsset, a3);
    v9->_useSmartColor = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryConcreteFrameFillingEffectResource *v4;
  PXStoryConcreteFrameFillingEffectResource *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (PXStoryConcreteFrameFillingEffectResource *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryConcreteFrameFillingEffectResource px_storyResourceDisplayAsset](self, "px_storyResourceDisplayAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryConcreteFrameFillingEffectResource px_storyResourceDisplayAsset](v5, "px_storyResourceDisplayAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = -[PXStoryConcreteFrameFillingEffectResource px_storyResourceUseSmartColor](self, "px_storyResourceUseSmartColor");
        v9 = v8 ^ -[PXStoryConcreteFrameFillingEffectResource px_storyResourceUseSmartColor](v5, "px_storyResourceUseSmartColor") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[PXStoryConcreteFrameFillingEffectResource px_storyResourceUseSmartColor](self, "px_storyResourceUseSmartColor");
  -[PXStoryConcreteFrameFillingEffectResource px_storyResourceDisplayAsset](self, "px_storyResourceDisplayAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 | (2 * objc_msgSend(v4, "hash"));

  return v5;
}

- (PXDisplayAsset)px_storyResourceDisplayAsset
{
  return self->_displayAsset;
}

- (BOOL)px_storyResourceUseSmartColor
{
  return self->_useSmartColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

@end
