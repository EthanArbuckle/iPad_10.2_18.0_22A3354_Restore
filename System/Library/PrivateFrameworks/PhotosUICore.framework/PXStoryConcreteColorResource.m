@implementation PXStoryConcreteColorResource

- (PXStoryConcreteColorResource)init
{
  void *v3;
  PXStoryConcreteColorResource *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXStoryConcreteColorResource initWithColor:type:](self, "initWithColor:type:", v3, 0);

  return v4;
}

- (PXStoryConcreteColorResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteResources.m"), 158, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteColorResource initWithIdentifier:kind:]");

  abort();
}

- (PXStoryConcreteColorResource)initWithColor:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  PXStoryConcreteColorResource *v8;
  uint64_t v9;
  UIColor *color;
  objc_super v12;

  v6 = a3;
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PXStoryConcreteColorResource;
  v8 = -[PXStoryConcreteResource initWithIdentifier:kind:](&v12, sel_initWithIdentifier_kind_, v7, 4);

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    color = v8->_color;
    v8->_color = (UIColor *)v9;

    v8->_colorType = a4;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryConcreteColorResource *v4;
  PXStoryConcreteColorResource *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = (PXStoryConcreteColorResource *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryConcreteColorResource px_storyResourceColor](self, "px_storyResourceColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryConcreteColorResource px_storyResourceColor](v5, "px_storyResourceColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = -[PXStoryConcreteColorResource px_storyResourceColorType](self, "px_storyResourceColorType");
        v9 = v8 == -[PXStoryConcreteColorResource px_storyResourceColorType](v5, "px_storyResourceColorType");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryConcreteColorResource px_storyResourceColor](self, "px_storyResourceColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (UIColor)px_storyResourceColor
{
  return self->_color;
}

- (int64_t)px_storyResourceColorType
{
  return self->_colorType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
