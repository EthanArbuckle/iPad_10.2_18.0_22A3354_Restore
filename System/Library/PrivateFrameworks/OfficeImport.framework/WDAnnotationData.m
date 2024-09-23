@implementation WDAnnotationData

- (WDAnnotationData)initWithText:(id)a3
{
  id v5;
  WDAnnotationData *v6;
  WDAnnotationData *v7;
  uint64_t v8;
  NSDate *mDate;
  NSString *v10;
  NSString *mOwner;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDAnnotationData;
  v6 = -[WDAnnotationData init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mText, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    mDate = v7->mDate;
    v7->mDate = (NSDate *)v8;

    v10 = (NSString *)objc_alloc_init(MEMORY[0x24BDD17C8]);
    mOwner = v7->mOwner;
    v7->mOwner = v10;

  }
  return v7;
}

- (id)text
{
  return self->mText;
}

- (id)date
{
  return self->mDate;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->mDate, a3);
}

- (id)owner
{
  return self->mOwner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->mOwner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOwner, 0);
  objc_storeStrong((id *)&self->mDate, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
