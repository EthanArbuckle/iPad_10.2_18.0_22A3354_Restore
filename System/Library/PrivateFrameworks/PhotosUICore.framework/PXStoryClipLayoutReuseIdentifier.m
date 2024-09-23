@implementation PXStoryClipLayoutReuseIdentifier

- (PXStoryClipLayoutReuseIdentifier)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayoutReuseIdentifier.m"), 21, CFSTR("%s is not available as initializer"), "-[PXStoryClipLayoutReuseIdentifier init]");

  abort();
}

- (PXStoryClipLayoutReuseIdentifier)initWithClip:(id)a3
{
  id v5;
  PXStoryClipLayoutReuseIdentifier *v6;
  PXStoryClipLayoutReuseIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryClipLayoutReuseIdentifier;
  v6 = -[PXStoryClipLayoutReuseIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clip, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryClipLayoutReuseIdentifier *v4;
  PXStoryClipLayoutReuseIdentifier *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXStoryClipLayoutReuseIdentifier *)a3;
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
      -[PXStoryClipLayoutReuseIdentifier clip](self, "clip");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryClipLayoutReuseIdentifier clip](v5, "clip");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToClip:", v7);
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

  -[PXStoryClipLayoutReuseIdentifier clip](self, "clip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)hasResourceEqualTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[PXStoryClipLayoutReuseIdentifier clip](self, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "px_storyResourceKind");
  if (v9 == objc_msgSend(v8, "px_storyResourceKind"))
  {
    objc_msgSend(v6, "px_storyResourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_storyResourceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
      v12 = 1;
    else
      v12 = objc_msgSend(v10, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayoutReuseIdentifier clip](self, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");
  -[PXStoryClipLayoutReuseIdentifier clip](self, "clip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; clipIdentifier:%ld clip:%@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PXStoryClip)clip
{
  return self->_clip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
}

@end
