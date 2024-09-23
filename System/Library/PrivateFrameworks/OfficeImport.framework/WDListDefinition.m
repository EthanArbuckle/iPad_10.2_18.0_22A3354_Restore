@implementation WDListDefinition

- (id)addLevel
{
  NSMutableArray *v3;
  NSMutableArray *mLevels;
  WDListLevel *v5;
  id WeakRetained;
  WDListLevel *v7;

  if (!self->mLevels)
  {
    v3 = (NSMutableArray *)objc_opt_new();
    mLevels = self->mLevels;
    self->mLevels = v3;

  }
  v5 = [WDListLevel alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v7 = -[WDListLevel initWithDocument:](v5, "initWithDocument:", WeakRetained);

  -[NSMutableArray addObject:](self->mLevels, "addObject:", v7);
  return v7;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)levelCount
{
  return -[NSMutableArray count](self->mLevels, "count");
}

- (id)levelAt:(int)a3
{
  int v4;
  int v5;
  NSMutableArray *mLevels;
  void *v7;
  void *v8;
  id v9;

  if (self->mType)
    v4 = a3;
  else
    v4 = 0;
  v5 = -[NSMutableArray count](self->mLevels, "count", *(_QWORD *)&a3);
  if (v5)
  {
    mLevels = self->mLevels;
    if (v4 >= v5)
    {
      -[NSMutableArray objectAtIndex:](mLevels, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "legacy"))
      {
        v9 = v8;
      }
      else
      {
        -[NSMutableArray lastObject](self->mLevels, "lastObject");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v9;

    }
    else
    {
      -[NSMutableArray objectAtIndex:](mLevels, "objectAtIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int)type
{
  return self->mType;
}

- (void)removeLastLevel
{
  -[NSMutableArray removeLastObject](self->mLevels, "removeLastObject");
}

- (WDListDefinition)initWithDocument:(id)a3 listDefinitionId:(int)a4 styleId:(id)a5
{
  id v8;
  id v9;
  WDListDefinition *v10;
  WDListDefinition *v11;
  uint64_t v12;
  NSString *mStyleId;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WDListDefinition;
  v10 = -[WDListDefinition init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mDocument, v8);
    v11->mListDefinitionId = a4;
    v12 = objc_msgSend(v9, "copy");
    mStyleId = v11->mStyleId;
    v11->mStyleId = (NSString *)v12;

  }
  return v11;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDListDefinition;
  -[WDListDefinition description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)listDefinitionId
{
  return self->mListDefinitionId;
}

- (NSString)styleId
{
  return self->mStyleId;
}

- (NSString)styleRefId
{
  return self->mStyleRefId;
}

- (void)setStyleRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLevels, 0);
  objc_storeStrong((id *)&self->mStyleRefId, 0);
  objc_storeStrong((id *)&self->mStyleId, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end
