@implementation CRLGradientFillStop

- (CRLGradientFillStop)initWithColor:(id)a3 fraction:(double)a4
{
  return -[CRLGradientFillStop initWithColor:fraction:inflection:](self, "initWithColor:fraction:inflection:", a3, a4, 0.5);
}

- (CRLGradientFillStop)initWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  id v8;
  CRLGradientFillStop *v9;
  CRLGradientFillStop *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLGradientFillStop;
  v9 = -[CRLGradientFillStop init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    -[CRLGradientFillStop p_setColor:](v9, "p_setColor:", v8);
    -[CRLGradientFillStop p_setFraction:](v10, "p_setFraction:", a4);
    -[CRLGradientFillStop p_setInflection:](v10, "p_setInflection:", a5);
  }

  return v10;
}

- (CRLGradientFillStop)initWithGradientStop:(id)a3
{
  CRLGradientFillStop *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CRLGradientFillStop *v10;

  if (self)
  {
    v3 = self;
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
    objc_msgSend(v4, "fraction");
    v7 = v6;
    objc_msgSend(v4, "inflection");
    v9 = v8;

    v10 = -[CRLGradientFillStop initWithColor:fraction:inflection:](v3, "initWithColor:fraction:inflection:", v5, v7, v9);
    return v10;
  }
  return self;
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithColor:fraction:inflection:", v6, a4, 0.5);

  return v7;
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithColor:fraction:inflection:", v8, a4, a5);

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CRLGradientFillStop<%p>: fraction=%g inflection=%g color=%@"), self, *(_QWORD *)&self->mFraction, *(_QWORD *)&self->mInflection, self->mColor);
}

- (unint64_t)hash
{
  return -[CRLColor hash](self->mColor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  double mFraction;
  double v10;
  CRLColor *mColor;
  void *v12;
  double v13;
  float mInflection;
  BOOL v15;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class(CRLGradientFillStop, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && ((mFraction = self->mFraction, objc_msgSend(v8, "fraction"), mFraction == v10)
     || vabdd_f64(mFraction, v10) < fabs(v10 * 0.000000999999997))
    && (mColor = self->mColor,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color")),
        LODWORD(mColor) = -[CRLColor isEqual:](mColor, "isEqual:", v12),
        v12,
        (_DWORD)mColor))
  {
    objc_msgSend(v8, "inflection");
    *(float *)&v13 = v13;
    mInflection = self->mInflection;
    v15 = *(float *)&v13 == mInflection;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)p_setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (void)p_setFraction:(double)a3
{
  self->mFraction = sub_1003C65EC(a3, 0.0, 1.0);
}

- (void)p_setInflection:(double)a3
{
  self->mInflection = sub_1003C65EC(a3, 0.0, 1.0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableGradientFillStop *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CRLMutableGradientFillStop *v9;

  v4 = +[CRLMutableGradientFillStop allocWithZone:](CRLMutableGradientFillStop, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillStop color](self, "color"));
  -[CRLGradientFillStop fraction](self, "fraction");
  v7 = v6;
  -[CRLGradientFillStop inflection](self, "inflection");
  v9 = -[CRLGradientFillStop initWithColor:fraction:inflection:](v4, "initWithColor:fraction:inflection:", v5, v7, v8);

  return v9;
}

- (id)gradientStopWithColor:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = v7;
  -[CRLGradientFillStop fraction](self, "fraction", v6);
  v10 = v9;
  -[CRLGradientFillStop inflection](self, "inflection");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "gradientStopWithColor:fraction:inflection:", v4, v10, v11));

  return v12;
}

- (id)gradientStopWithInflection:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillStop color](self, "color"));
  -[CRLGradientFillStop fraction](self, "fraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLGradientFillStop gradientStopWithColor:fraction:inflection:](CRLGradientFillStop, "gradientStopWithColor:fraction:inflection:", v4));

  return v5;
}

- (CRLColor)color
{
  return self->mColor;
}

- (double)fraction
{
  return self->mFraction;
}

- (double)inflection
{
  return self->mInflection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
