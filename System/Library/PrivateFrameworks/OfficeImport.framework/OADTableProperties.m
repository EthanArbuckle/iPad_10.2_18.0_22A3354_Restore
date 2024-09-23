@implementation OADTableProperties

+ (id)defaultProperties
{
  if (+[OADTableProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADTableProperties defaultProperties]::once, &__block_literal_global_63);
  return (id)+[OADTableProperties defaultProperties]::defaultProperties;
}

- (OADTableProperties)initWithDefaults
{
  OADTableProperties *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADTableProperties;
  v2 = -[OADDrawableProperties initWithDefaults](&v5, sel_initWithDefaults);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTableProperties setEffects:](v2, "setEffects:", v3);

  }
  return v2;
}

- (void)setFirstColumn:(BOOL)a3
{
  self->mFirstColumn = a3;
}

- (void)setFirstRow:(BOOL)a3
{
  self->mFirstRow = a3;
}

- (void)setLastColumn:(BOOL)a3
{
  self->mLastColumn = a3;
}

- (void)setLastRow:(BOOL)a3
{
  self->mLastRow = a3;
}

- (void)setBandColumn:(BOOL)a3
{
  self->mBandColumn = a3;
}

- (void)setBandRow:(BOOL)a3
{
  self->mBandRow = a3;
}

- (void)setRightToLeft:(BOOL)a3
{
  self->mRightToLeft = a3;
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->mEffects, a3);
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->mStyle, a3);
}

- (id)style
{
  return self->mStyle;
}

- (BOOL)firstRow
{
  return self->mFirstRow;
}

- (BOOL)bandRow
{
  return self->mBandRow;
}

- (BOOL)rightToLeft
{
  return self->mRightToLeft;
}

- (BOOL)firstColumn
{
  return self->mFirstColumn;
}

- (BOOL)lastRow
{
  return self->mLastRow;
}

- (BOOL)lastColumn
{
  return self->mLastColumn;
}

- (BOOL)bandColumn
{
  return self->mBandColumn;
}

- (BOOL)hasBandsNormalToDir:(int)a3
{
  if (a3)
    return -[OADTableProperties bandColumn](self, "bandColumn");
  else
    return -[OADTableProperties bandRow](self, "bandRow");
}

- (BOOL)hasVectorNormalToDir:(int)a3 atExtremePos:(int)a4
{
  if (a3)
  {
    if (a4)
      return -[OADTableProperties lastColumn](self, "lastColumn");
    else
      return -[OADTableProperties firstColumn](self, "firstColumn");
  }
  else if (a4)
  {
    return -[OADTableProperties lastRow](self, "lastRow");
  }
  else
  {
    return -[OADTableProperties firstRow](self, "firstRow");
  }
}

- (id)effects
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasEffects);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[11];

  return v3;
}

- (BOOL)hasEffects
{
  return self->mEffects || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

void __39__OADTableProperties_defaultProperties__block_invoke()
{
  OADTableProperties *v0;
  void *v1;

  v0 = -[OADTableProperties initWithDefaults]([OADTableProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADTableProperties defaultProperties]::defaultProperties;
  +[OADTableProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableProperties;
  -[OADDrawableProperties description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
}

@end
