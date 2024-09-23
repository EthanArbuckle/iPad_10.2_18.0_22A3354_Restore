@implementation PFStoryConcreteRecipePresentation

- (PFStoryConcreteRecipePresentation)initWithIdentifier:(id)a3 clips:(id)a4
{
  NSString *v6;
  NSArray *v7;
  PFStoryConcreteRecipePresentation *v8;
  NSString *identifier;
  NSString *v10;
  NSArray *clips;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFStoryConcreteRecipePresentation;
  v8 = -[PFStoryConcreteRecipePresentation init](&v13, sel_init);
  identifier = v8->_identifier;
  v8->_identifier = v6;
  v10 = v6;

  clips = v8->_clips;
  v8->_clips = v7;

  return v8;
}

- (int64_t)clipCount
{
  void *v2;
  int64_t v3;

  -[PFStoryConcreteRecipePresentation clips](self, "clips");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)clipAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PFStoryConcreteRecipePresentation clips](self, "clips");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)diagnosticDescription
{
  PFStoryRecipeArchiver *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  -[PFStoryRecipeArchiver archivedJSONObjectWithPresentation:](v3, "archivedJSONObjectWithPresentation:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqualToPresentation:(id)a3
{
  PFStoryConcreteRecipePresentation *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = (PFStoryConcreteRecipePresentation *)a3;
  if (v4 == self)
    goto LABEL_8;
  v5 = -[PFStoryConcreteRecipePresentation clipCount](self, "clipCount");
  if (v5 != -[PFStoryConcreteRecipePresentation clipCount](v4, "clipCount"))
  {
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  if (v5 < 1)
  {
LABEL_8:
    LOBYTE(v10) = 1;
  }
  else
  {
    v6 = 1;
    do
    {
      -[PFStoryConcreteRecipePresentation clips](self, "clips");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryConcreteRecipePresentation clipAtIndex:](v4, "clipAtIndex:", v6 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToClip:", v9);

      if (!v10)
        break;
    }
    while (v6++ < v5);
  }
LABEL_10:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)clips
{
  return self->_clips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
