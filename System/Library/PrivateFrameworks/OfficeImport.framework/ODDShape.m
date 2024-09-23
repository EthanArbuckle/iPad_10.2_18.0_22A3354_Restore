@implementation ODDShape

- (ODDShape)init
{
  ODDShape *v2;
  NSMutableArray *v3;
  NSMutableArray *mAdjustments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDShape;
  v2 = -[ODDShape init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mAdjustments = v2->mAdjustments;
    v2->mAdjustments = v3;

  }
  return v2;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)presetType
{
  return self->mPresetType;
}

- (void)setPresetType:(int)a3
{
  self->mPresetType = a3;
}

- (id)adjustments
{
  return self->mAdjustments;
}

- (void)addAdjustment:(id)a3
{
  -[NSMutableArray addObject:](self->mAdjustments, "addObject:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDShape;
  -[ODDLayoutObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAdjustments, 0);
}

@end
