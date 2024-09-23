@implementation PFStoryConcreteRecipeLibrary

- (PFStoryConcreteRecipeLibrary)init
{
  PFStoryConcreteRecipeLibrary *v2;
  SEL v3;
  int64_t v4;
  id v5;

  v2 = (PFStoryConcreteRecipeLibrary *)_PFAssertFailHandler();
  return -[PFStoryConcreteRecipeLibrary initWithKind:url:](v2, v3, v4, v5);
}

- (PFStoryConcreteRecipeLibrary)initWithKind:(int64_t)a3 url:(id)a4
{
  id v6;
  PFStoryConcreteRecipeLibrary *v7;
  PFStoryConcreteRecipeLibrary *v8;
  uint64_t v9;
  NSURL *url;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PFStoryConcreteRecipeLibrary;
  v7 = -[PFStoryConcreteRecipeLibrary init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

  }
  return v8;
}

- (NSString)diagnosticDescription
{
  PFStoryRecipeArchiver *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  -[PFStoryRecipeArchiver archivedJSONObjectWithLibrary:](v3, "archivedJSONObjectWithLibrary:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqualToLibrary:(id)a3
{
  PFStoryConcreteRecipeLibrary *v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PFStoryConcreteRecipeLibrary *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[PFStoryConcreteRecipeLibrary kind](self, "kind");
    if (v5 == -[PFStoryConcreteRecipeLibrary kind](v4, "kind"))
    {
      -[PFStoryConcreteRecipeLibrary url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryConcreteRecipeLibrary url](v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
