@implementation PFStoryConcreteAutoEditDecisionList

- (PFStoryConcreteAutoEditDecisionList)initWithSongAssetIdentifier:(id)a3 clips:(id)a4
{
  NSString *v6;
  NSArray *v7;
  PFStoryConcreteAutoEditDecisionList *v8;
  NSString *songAssetIdentifier;
  NSString *v10;
  NSArray *clips;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFStoryConcreteAutoEditDecisionList;
  v8 = -[PFStoryConcreteAutoEditDecisionList init](&v13, sel_init);
  songAssetIdentifier = v8->_songAssetIdentifier;
  v8->_songAssetIdentifier = v6;
  v10 = v6;

  clips = v8->_clips;
  v8->_clips = v7;

  return v8;
}

- (int64_t)numberOfClips
{
  void *v2;
  int64_t v3;

  -[PFStoryConcreteAutoEditDecisionList clips](self, "clips");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)clipAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PFStoryConcreteAutoEditDecisionList clips](self, "clips");
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
  -[PFStoryRecipeArchiver archivedJSONObjectWithAutoEditDecisionList:](v3, "archivedJSONObjectWithAutoEditDecisionList:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqualToAutoEditDecisionList:(id)a3
{
  PFStoryConcreteAutoEditDecisionList *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;

  v4 = (PFStoryConcreteAutoEditDecisionList *)a3;
  if (v4 == self)
    goto LABEL_10;
  -[PFStoryConcreteAutoEditDecisionList songAssetIdentifier](self, "songAssetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteAutoEditDecisionList songAssetIdentifier](v4, "songAssetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7
    || (v8 = -[PFStoryConcreteAutoEditDecisionList numberOfClips](self, "numberOfClips"),
        v8 != -[PFStoryConcreteAutoEditDecisionList numberOfClips](v4, "numberOfClips")))
  {
    v9 = 0;
    goto LABEL_11;
  }
  if (v8 < 1)
  {
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  v9 = 0;
  for (i = 0; i != v8; v9 = i >= v8)
  {
    -[PFStoryConcreteAutoEditDecisionList clipAtIndex:](self, "clipAtIndex:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteAutoEditDecisionList clipAtIndex:](v4, "clipAtIndex:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToClip:", v12);

    if ((v13 & 1) == 0)
      break;
    ++i;
  }
LABEL_11:

  return v9;
}

- (NSString)songAssetIdentifier
{
  return self->_songAssetIdentifier;
}

- (NSArray)clips
{
  return self->_clips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_songAssetIdentifier, 0);
}

@end
