@implementation EDDifferentialStyle

+ (id)differentialStyle
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)setBorders:(id)a3
{
  objc_storeStrong((id *)&self->mBorders, a3);
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->mFont, a3);
}

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (void)setContentFormat:(id)a3
{
  objc_storeStrong((id *)&self->mContentFormat, a3);
}

- (EDBorders)borders
{
  return self->mBorders;
}

- (EDFill)fill
{
  return self->mFill;
}

- (EDFont)font
{
  return self->mFont;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[EDAlignmentInfo copy](self->mAlignmentInfo, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[EDBorders copy](self->mBorders, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = -[EDFill copy](self->mFill, "copy");
    v10 = (void *)v4[3];
    v4[3] = v9;

    v11 = -[EDFont copy](self->mFont, "copy");
    v12 = (void *)v4[4];
    v4[4] = v11;

    v13 = -[EDProtection copy](self->mProtection, "copy");
    v14 = (void *)v4[5];
    v4[5] = v13;

    v15 = -[EDContentFormat copy](self->mContentFormat, "copy");
    v16 = (void *)v4[6];
    v4[6] = v15;

    v17 = v4;
  }

  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDDifferentialStyle;
  -[EDDifferentialStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EDAlignmentInfo)alignmentInfo
{
  return self->mAlignmentInfo;
}

- (void)setAlignmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->mAlignmentInfo, a3);
}

- (EDProtection)protection
{
  return self->mProtection;
}

- (void)setProtection:(id)a3
{
  objc_storeStrong((id *)&self->mProtection, a3);
}

- (EDContentFormat)contentFormat
{
  return self->mContentFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentFormat, 0);
  objc_storeStrong((id *)&self->mProtection, 0);
  objc_storeStrong((id *)&self->mFont, 0);
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mBorders, 0);
  objc_storeStrong((id *)&self->mAlignmentInfo, 0);
}

@end
