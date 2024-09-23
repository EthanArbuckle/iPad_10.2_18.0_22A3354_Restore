@implementation OADImageRecolorInfo

- (OADImageRecolorInfo)initWithColors:(id)a3 fills:(id)a4
{
  id v7;
  id v8;
  OADImageRecolorInfo *v9;
  OADImageRecolorInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OADImageRecolorInfo;
  v9 = -[OADImageRecolorInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mColors, a3);
    objc_storeStrong((id *)&v10->mFills, a4);
  }

  return v10;
}

- (id)colors
{
  return self->mColors;
}

- (id)fills
{
  return self->mFills;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDictionary hash](self->mColors, "hash");
  return -[NSDictionary hash](self->mFills, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDictionary *mColors;
  NSDictionary *mFills;
  char v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    mColors = self->mColors;
    if (mColors == (NSDictionary *)v5[1] || -[NSDictionary isEqualToDictionary:](mColors, "isEqualToDictionary:"))
    {
      mFills = self->mFills;
      if (mFills == (NSDictionary *)v5[2])
        v8 = 1;
      else
        v8 = -[NSDictionary isEqualToDictionary:](mFills, "isEqualToDictionary:");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADImageRecolorInfo;
  -[OADImageRecolorInfo description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFills, 0);
  objc_storeStrong((id *)&self->mColors, 0);
}

@end
