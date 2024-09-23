@implementation EDColorReference

+ (EDColorReference)colorReferenceWithColorIndex:(unint64_t)a3 resources:(id)a4
{
  id v6;
  _QWORD *v7;

  v6 = a4;
  if (+[EDColorsCollection isSystemColorId:](EDColorsCollection, "isSystemColorId:", a3))
  {
    +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", +[EDColorsCollection systemColorIdFromIndex:](EDColorsCollection, "systemColorIdFromIndex:", a3), v6);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "colorReferenceWithResources:", v6);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7[3] = a3;
  }

  return (EDColorReference *)v7;
}

+ (EDColorReference)colorReferenceWithSystemColorID:(int)a3 resources:(id)a4
{
  _DWORD *v5;

  objc_msgSend(a1, "colorReferenceWithResources:", a4);
  v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v5[4] = a3;
  return (EDColorReference *)v5;
}

+ (EDColorReference)colorReferenceWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return (EDColorReference *)v4;
}

- (EDColorReference)initWithResources:(id)a3
{
  id v4;
  EDColorReference *v5;
  EDColorReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDColorReference;
  v5 = -[EDColorReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mSystemColorID = 0;
    v6->mColorIndex = -1;
    v6->mThemeIndex = -1;
    v6->mTint = 0.0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  EDColorReference *v4;
  EDColorReference *v5;
  BOOL v6;

  v4 = (EDColorReference *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDColorReference isEqualToColorReference:](self, "isEqualToColorReference:", v5);

  return v6;
}

- (BOOL)isEqualToColorReference:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  v5 = *(_OWORD *)(v4 + 24) == *(_OWORD *)&self->mColorIndex && *((_DWORD *)v4 + 4) == self->mSystemColorID;

  return v5;
}

- (id)color
{
  void *v2;
  unint64_t mThemeIndex;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double mTint;
  id v10;
  void *v11;

  if (self->mSystemColorID)
  {
    +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    mThemeIndex = self->mThemeIndex;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = WeakRetained;
    if (mThemeIndex == -1)
    {
      objc_msgSend(WeakRetained, "colors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", self->mColorIndex);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(WeakRetained, "themes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", self->mThemeIndex);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      mTint = self->mTint;
      if (mTint >= 0.0)
      {
        if (mTint <= 0.0)
        {
          v10 = v8;
        }
        else
        {
          objc_msgSend(v8, "colorWithTintValue:", 1.0 - mTint);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v8, "colorWithShadeValue:", mTint + 1.0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v2 = v10;

    }
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;

  v4 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v6 = objc_msgSend(v4, "initWithResources:", WeakRetained);

  if (v6)
  {
    *(_DWORD *)(v6 + 16) = self->mSystemColorID;
    *(_QWORD *)(v6 + 24) = self->mColorIndex;
    *(_QWORD *)(v6 + 32) = self->mThemeIndex;
    *(double *)(v6 + 40) = self->mTint;
    v7 = (id)v6;
  }

  return (id)v6;
}

- (EDColorReference)initWithColor:(id)a3 resources:(id)a4
{
  id v6;
  id v7;
  EDColorReference *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[EDColorReference initWithResources:](self, "initWithResources:", v7);
  if (v8)
  {
    objc_msgSend(v7, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->mColorIndex = objc_msgSend(v9, "addOrEquivalentColorExcludingDefaults:", v6);

  }
  return v8;
}

+ (EDColorReference)colorReferenceWithThemeIndex:(unint64_t)a3 tint:(double)a4 resources:(id)a5
{
  uint64_t v7;

  objc_msgSend(a1, "colorReferenceWithResources:", a5);
  v7 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v7 + 32) = a3;
  *(double *)(v7 + 40) = a4;
  return (EDColorReference *)(id)v7;
}

+ (EDColorReference)colorReferenceWithColor:(id)a3 resources:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColor:resources:", v5, v6);

  return (EDColorReference *)v7;
}

- (unint64_t)themeIndex
{
  return self->mThemeIndex;
}

- (unint64_t)hash
{
  return (self->mThemeIndex << 8)
       + (self->mColorIndex << 16)
       + self->mSystemColorID
       + (unint64_t)self->mTint;
}

- (BOOL)isValid
{
  return self->mSystemColorID || self->mColorIndex != -1 || self->mThemeIndex != -1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDColorReference;
  -[EDColorReference description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mResources);
}

- (int)systemColorID
{
  return self->mSystemColorID;
}

- (unint64_t)colorIndex
{
  return self->mColorIndex;
}

- (double)tint
{
  return self->mTint;
}

@end
