@implementation PDBuild

- (PDBuild)init
{
  PDBuild *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDBuild;
  result = -[PDBuild init](&v3, sel_init);
  if (result)
    result->mIsAnimateBackground = 1;
  return result;
}

- (void)setIsAnimateBackground:(BOOL)a3
{
  self->mIsAnimateBackground = a3;
}

- (BOOL)isAnimateBackground
{
  return self->mIsAnimateBackground;
}

- (id)drawable
{
  return self->mDrawable;
}

- (void)setDrawable:(id)a3
{
  objc_storeStrong((id *)&self->mDrawable, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int mIsAnimateBackground;
  OADDrawable *mDrawable;
  OADDrawable *v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (mIsAnimateBackground = self->mIsAnimateBackground,
        mIsAnimateBackground == objc_msgSend(v6, "isAnimateBackground")))
  {
    mDrawable = self->mDrawable;
    objc_msgSend(v7, "drawable");
    v10 = (OADDrawable *)objc_claimAutoreleasedReturnValue();
    v11 = mDrawable == v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = -[OADDrawable hash](self->mDrawable, "hash");
  v5.receiver = self;
  v5.super_class = (Class)PDBuild;
  return -[PDBuild hash](&v5, sel_hash) ^ v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDBuild;
  -[PDBuild description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawable, 0);
}

@end
