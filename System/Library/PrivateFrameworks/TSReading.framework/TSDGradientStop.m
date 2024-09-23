@implementation TSDGradientStop

- (TSDGradientStop)initWithColor:(id)a3 fraction:(double)a4
{
  return -[TSDGradientStop initWithColor:fraction:inflection:](self, "initWithColor:fraction:inflection:", a3, a4, 0.5);
}

- (TSDGradientStop)initWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  TSDGradientStop *v8;
  TSDGradientStop *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDGradientStop;
  v8 = -[TSDGradientStop init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TSDGradientStop p_setColor:](v8, "p_setColor:", a3);
    -[TSDGradientStop p_setFraction:](v9, "p_setFraction:", a4);
    -[TSDGradientStop p_setInflection:](v9, "p_setInflection:", a5);
  }
  return v9;
}

- (TSDGradientStop)initWithGradientStop:(id)a3
{
  TSDGradientStop *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  if (self)
  {
    v4 = self;
    v5 = objc_msgSend(a3, "color");
    objc_msgSend(a3, "fraction");
    v7 = v6;
    objc_msgSend(a3, "inflection");
    return -[TSDGradientStop initWithColor:fraction:inflection:](v4, "initWithColor:fraction:inflection:", v5, v7, v8);
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDGradientStop;
  -[TSDGradientStop dealloc](&v3, sel_dealloc);
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithColor:fraction:inflection:", a3, a4, 0.5);
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithColor:fraction:inflection:", a3, a4, a5);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSDGradientStop<%p>: fraction=%g inflection=%g color=%@"), self, *(_QWORD *)&self->mFraction, *(_QWORD *)&self->mInflection, self->mColor);
}

- (unint64_t)hash
{
  -[TSUColor hash](self->mColor, "hash");
  TSUHashWithSeed();
  return TSUHashWithSeed();
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (a3 == self)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "fraction");
      if (v6 == self->mFraction)
      {
        LODWORD(v4) = -[TSUColor isEqual:](self->mColor, "isEqual:", objc_msgSend(v5, "color"));
        if ((_DWORD)v4)
        {
          objc_msgSend(v5, "inflection");
          LOBYTE(v4) = v7 == self->mInflection;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

- (void)p_setColor:(id)a3
{
  id v5;

  v5 = a3;

  self->mColor = (TSUColor *)a3;
}

- (void)p_setFraction:(double)a3
{
  double v4;

  TSUClamp();
  self->mFraction = v4;
}

- (void)p_setInflection:(double)a3
{
  double v4;

  TSUClamp();
  self->mInflection = v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableGradientStop *v4;
  TSUColor *v5;
  double v6;
  double v7;
  double v8;

  v4 = +[TSDMutableGradientStop allocWithZone:](TSDMutableGradientStop, "allocWithZone:", a3);
  v5 = -[TSDGradientStop color](self, "color");
  -[TSDGradientStop fraction](self, "fraction");
  v7 = v6;
  -[TSDGradientStop inflection](self, "inflection");
  return -[TSDGradientStop initWithColor:fraction:inflection:](v4, "initWithColor:fraction:inflection:", v5, v7, v8);
}

- (TSDGradientStop)gradientStopWithColor:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  v5 = (void *)objc_opt_class();
  -[TSDGradientStop fraction](self, "fraction");
  v7 = v6;
  -[TSDGradientStop inflection](self, "inflection");
  return (TSDGradientStop *)objc_msgSend(v5, "gradientStopWithColor:fraction:inflection:", a3, v7, v8);
}

- (TSDGradientStop)gradientStopWithInflection:(double)a3
{
  TSUColor *v4;

  v4 = -[TSDGradientStop color](self, "color");
  -[TSDGradientStop fraction](self, "fraction");
  return +[TSDGradientStop gradientStopWithColor:fraction:inflection:](TSDGradientStop, "gradientStopWithColor:fraction:inflection:", v4);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)&__block_literal_global_57);
}

uint64_t __40__TSDGradientStop_mixingTypeWithObject___block_invoke()
{
  return 3;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__TSDGradientStop_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDGradientStop *__52__TSDGradientStop_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "color"), "blendedColorWithFraction:ofColor:", objc_msgSend(v2, "color"), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "fraction");
  v5 = v4;
  objc_msgSend(v2, "fraction");
  return +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", v3, TSDMixFloats(v5, v6, *(double *)(a1 + 48)));
}

- (TSUColor)color
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

@end
