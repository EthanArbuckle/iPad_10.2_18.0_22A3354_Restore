@implementation OADRgbColor

+ (id)black
{
  OADRgbColor *v2;
  double v3;
  double v4;
  double v5;

  v2 = [OADRgbColor alloc];
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  return -[OADRgbColor initWithRed:green:blue:](v2, "initWithRed:green:blue:", v3, v4, v5);
}

- (OADRgbColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  OADRgbColor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADRgbColor;
  result = -[OADRgbColor init](&v9, sel_init);
  if (result)
  {
    result->mRed = a3;
    result->mGreen = a4;
    result->mBlue = a5;
  }
  return result;
}

- (OADRgbColor)initWithRedByte:(float)a3 greenByte:(float)a4 blueByte:(float)a5
{
  OADRgbColor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADRgbColor;
  result = -[OADRgbColor init](&v9, sel_init);
  if (result)
  {
    result->mRed = a3 / 255.0;
    result->mGreen = a4 / 255.0;
    result->mBlue = a5 / 255.0;
  }
  return result;
}

+ (id)white
{
  OADRgbColor *v2;
  double v3;
  double v4;
  double v5;

  v2 = [OADRgbColor alloc];
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  return -[OADRgbColor initWithRed:green:blue:](v2, "initWithRed:green:blue:", v3, v4, v5);
}

- (float)red
{
  return self->mRed;
}

- (float)green
{
  return self->mGreen;
}

- (float)blue
{
  return self->mBlue;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = -[OADRgbColor hash](self, "hash"), v5 == objc_msgSend(v4, "hash")))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADRgbColor;
    v6 = -[OADColor isEqual:](&v8, sel_isEqual_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  v3 = -[OADRgbColor redByte](self, "redByte");
  v4 = -[OADRgbColor greenByte](self, "greenByte");
  v5 = -[OADRgbColor blueByte](self, "blueByte") | (unint64_t)(v4 << 8) | (v3 << 16);
  v7.receiver = self;
  v7.super_class = (Class)OADRgbColor;
  return -[OADColor hash](&v7, sel_hash) ^ v5;
}

- (unsigned)redByte
{
  double v2;
  double v3;
  float v4;

  v2 = fmax(self->mRed, 0.0);
  if (v2 >= 1.0)
    v3 = 255.0;
  else
    v3 = v2 * 255.0;
  v4 = v3;
  return llroundf(v4);
}

- (unsigned)greenByte
{
  double v2;
  double v3;
  float v4;

  v2 = fmax(self->mGreen, 0.0);
  if (v2 >= 1.0)
    v3 = 255.0;
  else
    v3 = v2 * 255.0;
  v4 = v3;
  return llroundf(v4);
}

- (unsigned)blueByte
{
  double v2;
  double v3;
  float v4;

  v2 = fmax(self->mBlue, 0.0);
  if (v2 >= 1.0)
    v3 = 255.0;
  else
    v3 = v2 * 255.0;
  v4 = v3;
  return llroundf(v4);
}

+ (id)rgbColorWithRedByte:(float)a3 greenByte:(float)a4 blueByte:(float)a5
{
  OADRgbColor *v8;
  double v9;
  double v10;
  double v11;

  v8 = [OADRgbColor alloc];
  *(float *)&v9 = a3;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  return -[OADRgbColor initWithRedByte:greenByte:blueByte:](v8, "initWithRedByte:greenByte:blueByte:", v9, v10, v11);
}

+ (id)rgbColorWithTSUColor:(id)a3
{
  id v3;
  OADRgbColor *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  OADRgbColor *v13;

  v3 = a3;
  v4 = [OADRgbColor alloc];
  objc_msgSend(v3, "redComponent");
  v6 = v5;
  objc_msgSend(v3, "greenComponent");
  v8 = v7;
  objc_msgSend(v3, "blueComponent");
  v9 = v6;
  *(float *)&v10 = v8;
  *(float *)&v12 = v11;
  *(float *)&v11 = v9;
  v13 = -[OADRgbColor initWithRed:green:blue:](v4, "initWithRed:green:blue:", v11, v10, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v6 = self->mRed;
  *(float *)&v7 = self->mGreen;
  *(float *)&v8 = self->mBlue;
  v9 = (void *)objc_msgSend(v5, "initWithRed:green:blue:", v6, v7, v8);
  -[OADColor transforms](self, "transforms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v9, "setTransforms:", v11);

  return v9;
}

+ (id)rgbColorWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  OADRgbColor *v8;
  double v9;
  double v10;
  double v11;

  v8 = [OADRgbColor alloc];
  *(float *)&v9 = a3;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  return -[OADRgbColor initWithRed:green:blue:](v8, "initWithRed:green:blue:", v9, v10, v11);
}

- (BOOL)isBlack
{
  return self->mRed == 0.0 && self->mGreen == 0.0 && self->mBlue == 0.0;
}

- (BOOL)isWhite
{
  return self->mRed == 1.0 && self->mGreen == 1.0 && self->mBlue == 1.0;
}

- (OADRgbColor)initWithWhite:(float)a3
{
  OADRgbColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADRgbColor;
  result = -[OADRgbColor init](&v5, sel_init);
  if (result)
  {
    result->mRed = a3;
    result->mGreen = a3;
    result->mBlue = a3;
  }
  return result;
}

+ (id)rgbColorWithWhite:(float)a3
{
  OADRgbColor *v4;
  double v5;

  v4 = [OADRgbColor alloc];
  *(float *)&v5 = a3;
  return -[OADRgbColor initWithWhite:](v4, "initWithWhite:", v5);
}

- (OADRgbColor)initWithWhiteByte:(float)a3
{
  OADRgbColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADRgbColor;
  result = -[OADRgbColor init](&v5, sel_init);
  if (result)
  {
    result->mRed = a3 / 255.0;
    result->mGreen = a3 / 255.0;
    result->mBlue = a3 / 255.0;
  }
  return result;
}

+ (id)rgbColorWithWhiteByte:(float)a3
{
  OADRgbColor *v4;
  double v5;

  v4 = [OADRgbColor alloc];
  *(float *)&v5 = a3;
  return -[OADRgbColor initWithWhiteByte:](v4, "initWithWhiteByte:", v5);
}

- (OADRgbColor)rgbColorWithFraction:(float)a3 ofRgbColor:(id)a4
{
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  void *v22;

  v6 = a4;
  -[OADRgbColor red](self, "red");
  v8 = v7;
  objc_msgSend(v6, "red");
  v10 = v9;
  -[OADRgbColor green](self, "green");
  v12 = v11;
  objc_msgSend(v6, "green");
  v14 = v13;
  -[OADRgbColor blue](self, "blue");
  v16 = v15;
  objc_msgSend(v6, "blue");
  v17 = 1.0 - a3;
  v18 = (float)(v10 * a3) + v17 * v8;
  v19 = (float)(v14 * a3) + v17 * v12;
  *(float *)&v19 = v19;
  v21 = (float)(v20 * a3) + v17 * v16;
  *(float *)&v17 = v21;
  *(float *)&v21 = v18;
  +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v21, v19, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (OADRgbColor *)v22;
}

@end
