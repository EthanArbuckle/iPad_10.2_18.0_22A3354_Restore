@implementation WDListLevelOverride

- (void)setStartNumber:(int64_t)a3
{
  self->mStartNumber = a3;
  self->mStartNumberOverridden = 1;
}

- (id)mutableListLevel
{
  WDListLevel *mListLevel;
  WDListLevel *v4;
  id WeakRetained;
  WDListLevel *v6;
  WDListLevel *v7;

  mListLevel = self->mListLevel;
  if (!mListLevel)
  {
    v4 = [WDListLevel alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = -[WDListLevel initWithDocument:](v4, "initWithDocument:", WeakRetained);
    v7 = self->mListLevel;
    self->mListLevel = v6;

    mListLevel = self->mListLevel;
  }
  return mListLevel;
}

- (WDListLevelOverride)initWithDocument:(id)a3 level:(unsigned __int8)a4
{
  id v6;
  WDListLevelOverride *v7;
  WDListLevelOverride *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDListLevelOverride;
  v7 = -[WDListLevelOverride init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mDocument, v6);
    v8->mLevel = a4;
  }

  return v8;
}

- (unsigned)level
{
  return self->mLevel;
}

- (int64_t)startNumber
{
  return self->mStartNumber;
}

- (BOOL)isStartNumberOverridden
{
  return self->mStartNumberOverridden;
}

- (id)listLevel
{
  return self->mListLevel;
}

- (BOOL)isListLevelOverridden
{
  return self->mListLevel != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDListLevelOverride;
  -[WDListLevelOverride description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mListLevel, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end
