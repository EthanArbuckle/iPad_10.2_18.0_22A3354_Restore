@implementation PDTransition

- (PDTransition)init
{
  PDTransition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTransition;
  result = -[OADProperties init](&v3, sel_init);
  if (result)
    *(&result->mHasSpeed + 1) = 1;
  return result;
}

- (void)setSpeed:(int)a3
{
  self->mHasType = 1;
  self->mType = a3;
}

- (void)setIsAdvanceOnClick:(BOOL)a3
{
  self->mHasSpeed = 1;
  *(&self->mHasSpeed + 1) = a3;
}

- (void)setAdvanceAfterTime:(int)a3
{
  *(&self->mHasSpeed + 2) = 1;
  self->mSpeed = a3;
}

- (void)setType:(int)a3
{
  *((_BYTE *)&self->super + 17) = 1;
  *((_DWORD *)&self->super + 5) = a3;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->mHasAdvanceOnClick, a3);
}

- (BOOL)hasType
{
  return *((_BYTE *)&self->super + 17)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)type
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasType);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)hasIsAdvanceOnClick
{
  return self->mHasSpeed || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isAdvanceOnClick
{
  _BYTE *v2;
  char v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsAdvanceOnClick);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[33];

  return v3;
}

- (BOOL)hasSpeed
{
  return self->mHasType || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)speed
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasSpeed);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[7];

  return v3;
}

- (BOOL)hasAdvanceAfterTime
{
  return *(&self->mHasSpeed + 2)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)advanceAfterTime
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasAdvanceAfterTime);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[9];

  return v3;
}

- (BOOL)hasTransitionOptions
{
  return *(_QWORD *)&self->mHasAdvanceOnClick
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)options
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasTransitionOptions);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTransition;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)duration
{
  return (NSNumber *)self->mOptions;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->mOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOptions, 0);
  objc_storeStrong((id *)&self->mHasAdvanceOnClick, 0);
}

@end
