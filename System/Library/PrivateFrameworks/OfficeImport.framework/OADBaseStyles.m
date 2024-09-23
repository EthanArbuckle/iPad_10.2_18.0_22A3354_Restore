@implementation OADBaseStyles

- (OADBaseStyles)init
{
  OADBaseStyles *v2;
  OADColorScheme *v3;
  OADColorScheme *mColorScheme;
  OADStyleMatrix *v5;
  OADStyleMatrix *mStyleMatrix;
  OADFontScheme *v7;
  OADFontScheme *mFontScheme;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OADBaseStyles;
  v2 = -[OADBaseStyles init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADColorScheme);
    mColorScheme = v2->super.mColorScheme;
    v2->super.mColorScheme = v3;

    v5 = objc_alloc_init(OADStyleMatrix);
    mStyleMatrix = v2->super.mStyleMatrix;
    v2->super.mStyleMatrix = v5;

    v7 = objc_alloc_init(OADFontScheme);
    mFontScheme = v2->super.mFontScheme;
    v2->super.mFontScheme = v7;

  }
  return v2;
}

- (BOOL)isEmpty
{
  return -[OADColorScheme isEmpty](self->super.mColorScheme, "isEmpty")
      && -[OADStyleMatrix isEmpty](self->super.mStyleMatrix, "isEmpty")
      && -[OADFontScheme isEmpty](self->super.mFontScheme, "isEmpty");
}

- (void)validateBaseStyles
{
  -[OADColorScheme validateColorScheme](self->super.mColorScheme, "validateColorScheme");
  -[OADStyleMatrix validateStyleMatrix](self->super.mStyleMatrix, "validateStyleMatrix");
  -[OADFontScheme validateFontScheme](self->super.mFontScheme, "validateFontScheme");
}

@end
