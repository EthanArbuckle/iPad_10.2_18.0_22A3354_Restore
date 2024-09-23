@implementation OADGradientFillStop

- (OADGradientFillStop)initWithColor:(id)a3 position:(float)a4
{
  id v7;
  OADGradientFillStop *v8;
  OADGradientFillStop *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADGradientFillStop;
  v8 = -[OADGradientFillStop init](&v11, sel_init);
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  float *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (float *)v4;
    if (-[OADColor isEqual:](self->mColor, "isEqual:", *((_QWORD *)v7 + 1)))
      v6 = self->mPosition == v7[4];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;

  v5 = -[OADColor copyWithZone:](self->mColor, "copyWithZone:");
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v7 = self->mPosition;
  v8 = (void *)objc_msgSend(v6, "initWithColor:position:", v5, v7);

  return v8;
}

- (void)setStyleColor:(id)a3
{
  OADColor *v4;
  OADColor *mColor;
  id v6;

  v6 = a3;
  -[OADColor colorForStyleColor:](self->mColor, "colorForStyleColor:");
  v4 = (OADColor *)objc_claimAutoreleasedReturnValue();
  mColor = self->mColor;
  self->mColor = v4;

}

- (float)position
{
  return self->mPosition;
}

- (BOOL)usesPlaceholderColor
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (unint64_t)hash
{
  return -[OADColor hash](self->mColor, "hash") ^ (unint64_t)self->mPosition;
}

+ (void)addStopWithColor:(id)a3 position:(float)a4 toArray:(id)a5
{
  id v7;
  OADGradientFillStop *v8;
  double v9;
  OADGradientFillStop *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  if (v11)
  {
    v8 = [OADGradientFillStop alloc];
    *(float *)&v9 = a4;
    v10 = -[OADGradientFillStop initWithColor:position:](v8, "initWithColor:position:", v11, v9);
    objc_msgSend(v7, "addObject:", v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
