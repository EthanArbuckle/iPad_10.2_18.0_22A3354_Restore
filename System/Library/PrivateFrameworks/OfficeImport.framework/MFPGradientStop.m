@implementation MFPGradientStop

- (MFPGradientStop)initWithColor:(id)a3 position:(float)a4
{
  id v7;
  MFPGradientStop *v8;
  MFPGradientStop *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFPGradientStop;
  v8 = -[MFPGradientStop init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->mColor, a3);
    v9->mPosition = a4;
  }

  return v9;
}

- (id)color
{
  return self->mColor;
}

- (float)position
{
  return self->mPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
