@implementation OADBaseStylesBase

- (OADFontScheme)fontScheme
{
  return self->mFontScheme;
}

- (OADColorScheme)colorScheme
{
  return self->mColorScheme;
}

- (OADStyleMatrix)styleMatrix
{
  return self->mStyleMatrix;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBaseStylesBase;
  -[OADBaseStylesBase description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->mColorScheme, a3);
}

- (void)setStyleMatrix:(id)a3
{
  objc_storeStrong((id *)&self->mStyleMatrix, a3);
}

- (void)setFontScheme:(id)a3
{
  objc_storeStrong((id *)&self->mFontScheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontScheme, 0);
  objc_storeStrong((id *)&self->mStyleMatrix, 0);
  objc_storeStrong((id *)&self->mColorScheme, 0);
}

@end
