@implementation EDTableStyleElement

- (EDTableStyleElement)initWithResources:(id)a3
{
  id v4;
  EDTableStyleElement *v5;
  uint64_t v6;
  EDCollection *mDifferentialStyles;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDTableStyleElement;
  v5 = -[EDTableStyleElement init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "differentialStyles");
    v6 = objc_claimAutoreleasedReturnValue();
    mDifferentialStyles = v5->mDifferentialStyles;
    v5->mDifferentialStyles = (EDCollection *)v6;

    *(_QWORD *)&v5->mType = 0xFFFFFFFF00000000;
  }

  return v5;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDifferentialStyleWithIndex:(unint64_t)a3
{
  id v4;

  -[EDCollection objectAtIndex:](self->mDifferentialStyles, "objectAtIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDTableStyleElement setDifferentialStyle:](self, "setDifferentialStyle:");

}

- (void)setDifferentialStyle:(id)a3
{
  EDDifferentialStyle *v5;
  EDDifferentialStyle **p_mDifferentialStyle;
  EDDifferentialStyle *mDifferentialStyle;
  EDDifferentialStyle *v8;

  v5 = (EDDifferentialStyle *)a3;
  mDifferentialStyle = self->mDifferentialStyle;
  p_mDifferentialStyle = &self->mDifferentialStyle;
  if (mDifferentialStyle != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDifferentialStyle, a3);
    v5 = v8;
  }

}

- (int64_t)key
{
  return self->mType;
}

- (unsigned)bandSize
{
  return self->mBandSize;
}

- (id)differentialStyle
{
  return self->mDifferentialStyle;
}

+ (id)tableStyleElementWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 1, self->mDifferentialStyles);
    v5[2] = *(_QWORD *)&self->mType;
    v6 = -[EDDifferentialStyle copy](self->mDifferentialStyle, "copy");
    v7 = (void *)v5[3];
    v5[3] = v6;

    v8 = v5;
  }

  return v5;
}

- (int)type
{
  return self->mType;
}

- (void)setBandSize:(unsigned int)a3
{
  self->mBandSize = a3;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTableStyleElement;
  -[EDTableStyleElement description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDifferentialStyle, 0);
  objc_storeStrong((id *)&self->mDifferentialStyles, 0);
}

@end
