@implementation PXStoryConcreteResource

- (PXStoryConcreteResource)init
{
  return -[PXStoryConcreteResource initWithIdentifier:kind:](self, "initWithIdentifier:kind:", 0, 0);
}

- (PXStoryConcreteResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6;
  PXStoryConcreteResource *v7;
  NSString *v8;
  void *identifier;
  uint64_t v10;
  NSString *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteResource;
  v7 = -[PXStoryConcreteResource init](&v13, sel_init);
  if (v7)
  {
    if (v6)
    {
      v8 = (NSString *)v6;
      identifier = v7->_identifier;
      v7->_identifier = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v7->_identifier;
      v7->_identifier = (NSString *)v10;

    }
    v7->_kind = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryConcreteResource *v4;
  PXStoryConcreteResource *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXStoryConcreteResource *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryConcreteResource px_storyResourceIdentifier](self, "px_storyResourceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryConcreteResource px_storyResourceIdentifier](v5, "px_storyResourceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryConcreteResource px_storyResourceIdentifier](self, "px_storyResourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)px_storyResourceIdentifier
{
  return self->_identifier;
}

- (int64_t)px_storyResourceKind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
