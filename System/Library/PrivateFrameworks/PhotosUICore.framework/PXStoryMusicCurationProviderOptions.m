@implementation PXStoryMusicCurationProviderOptions

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryMusicCurationProviderOptions categories](self, "categories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "categories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMusicCurationProviderOptions categories](self, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXStoryMusicCurationProviderOptions *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(PXStoryMusicCurationProviderOptions);
  -[PXStoryMusicCurationProviderOptions categories](self, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[PXStoryMusicCurationProviderOptions setCategories:](v4, "setCategories:", v6);

  -[PXStoryMusicCurationProviderOptions setLogContext:](v4, "setLogContext:", -[PXStoryMusicCurationProviderOptions logContext](self, "logContext"));
  return v4;
}

- (void)addCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXStoryMusicCurationProviderOptions categories](self, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v9 = v7;

  objc_msgSend(v9, "setByAddingObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryMusicCurationProviderOptions setCategories:](self, "setCategories:", v8);
}

- (NSSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
