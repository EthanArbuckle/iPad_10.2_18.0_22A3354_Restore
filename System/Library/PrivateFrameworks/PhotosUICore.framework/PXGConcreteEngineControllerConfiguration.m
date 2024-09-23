@implementation PXGConcreteEngineControllerConfiguration

- (PXGConcreteEngineControllerConfiguration)init
{
  PXGViewEnvironment *v3;
  id v4;
  PXGViewEnvironment *v5;
  PXGConcreteEngineControllerConfiguration *v6;

  v3 = [PXGViewEnvironment alloc];
  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v5 = -[PXGViewEnvironment initWithView:accessibilityEnabled:isBeingFullPageSnapshotted:](v3, "initWithView:accessibilityEnabled:isBeingFullPageSnapshotted:", v4, 0, 0);

  v6 = -[PXGConcreteEngineControllerConfiguration initWithViewEnvironment:](self, "initWithViewEnvironment:", v5);
  return v6;
}

- (PXGConcreteEngineControllerConfiguration)initWithViewEnvironment:(id)a3
{
  id v5;
  PXGConcreteEngineControllerConfiguration *v6;
  PXGConcreteEngineControllerConfiguration *v7;
  uint64_t v8;
  UIColor *backgroundColor;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGConcreteEngineControllerConfiguration;
  v6 = -[PXGConcreteEngineControllerConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_displayScale = 1.0;
    objc_storeStrong((id *)&v6->_viewEnvironment, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXGConcreteEngineControllerConfiguration *v4;
  void *v5;
  PXGConcreteEngineControllerConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[PXGConcreteEngineControllerConfiguration allocWithZone:](PXGConcreteEngineControllerConfiguration, "allocWithZone:", a3);
  -[PXGConcreteEngineControllerConfiguration viewEnvironment](self, "viewEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGConcreteEngineControllerConfiguration initWithViewEnvironment:](v4, "initWithViewEnvironment:", v5);

  -[PXGConcreteEngineControllerConfiguration rootLayoutPromise](self, "rootLayoutPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteEngineControllerConfiguration setRootLayoutPromise:](v6, "setRootLayoutPromise:", v7);

  -[PXGConcreteEngineControllerConfiguration viewEnvironment](self, "viewEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteEngineControllerConfiguration setViewEnvironment:](v6, "setViewEnvironment:", v8);

  -[PXGConcreteEngineControllerConfiguration setIsVisible:](v6, "setIsVisible:", -[PXGConcreteEngineControllerConfiguration isVisible](self, "isVisible"));
  -[PXGConcreteEngineControllerConfiguration referenceSize](self, "referenceSize");
  -[PXGConcreteEngineControllerConfiguration setReferenceSize:](v6, "setReferenceSize:");
  -[PXGConcreteEngineControllerConfiguration displayScale](self, "displayScale");
  -[PXGConcreteEngineControllerConfiguration setDisplayScale:](v6, "setDisplayScale:");
  -[PXGConcreteEngineControllerConfiguration backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteEngineControllerConfiguration setBackgroundColor:](v6, "setBackgroundColor:", v9);

  -[PXGConcreteEngineControllerConfiguration mediaProvider](self, "mediaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteEngineControllerConfiguration setMediaProvider:](v6, "setMediaProvider:", v10);

  v6->_version = -[PXGConcreteEngineControllerConfiguration version](self, "version");
  return v6;
}

- (void)_incrementVersion
{
  ++self->_version;
}

- (void)setRootLayoutPromise:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id rootLayoutPromise;
  id aBlock;

  aBlock = a3;
  v4 = _Block_copy(self->_rootLayoutPromise);
  v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = _Block_copy(aBlock);
      rootLayoutPromise = self->_rootLayoutPromise;
      self->_rootLayoutPromise = v8;

      -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
    }
  }

}

- (void)setViewEnvironment:(id)a3
{
  PXGViewEnvironment *v4;
  BOOL v5;
  PXGViewEnvironment *v6;
  PXGViewEnvironment *viewEnvironment;
  PXGViewEnvironment *v8;

  v8 = (PXGViewEnvironment *)a3;
  v4 = self->_viewEnvironment;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGViewEnvironment isEqual:](v4, "isEqual:", v8);

    if (!v5)
    {
      v6 = (PXGViewEnvironment *)-[PXGViewEnvironment copy](v8, "copy");
      viewEnvironment = self->_viewEnvironment;
      self->_viewEnvironment = v6;

      -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
    }
  }

}

- (void)setReferenceSize:(CGSize)a3
{
  if (self->_referenceSize.width != a3.width || self->_referenceSize.height != a3.height)
  {
    self->_referenceSize = a3;
    -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
  }
}

- (void)setDisplayScale:(double)a3
{
  void *v6;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGConcreteEngineControllerConfiguration.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0 && !isnan(displayScale)"));

  }
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
  }
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v4;
  char v5;
  UIColor *v6;
  UIColor *backgroundColor;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v4 = self->_backgroundColor;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIColor isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIColor *)-[UIColor copy](v8, "copy");
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v6;

      -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
    }
  }

}

- (void)setMediaProvider:(id)a3
{
  PXMediaProvider *v5;
  PXMediaProvider *v6;

  v5 = (PXMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXGConcreteEngineControllerConfiguration _incrementVersion](self, "_incrementVersion");
    v5 = v6;
  }

}

- (CGSize)pixelSize
{
  double v2;
  double v3;
  CGSize result;

  PXSizeScale();
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteEngineControllerConfiguration referenceSize](self, "referenceSize");
  NSStringFromCGSize(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p referenceSize: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)rootLayoutPromise
{
  return self->_rootLayoutPromise;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong(&self->_rootLayoutPromise, 0);
}

@end
