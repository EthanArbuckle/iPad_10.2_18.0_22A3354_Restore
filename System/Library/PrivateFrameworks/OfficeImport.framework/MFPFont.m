@implementation MFPFont

- (float)size
{
  return self->mSize;
}

- (void)setSize:(float)a3
{
  self->mSize = a3;
}

- (int)unit
{
  return self->mUnit;
}

- (void)setUnit:(int)a3
{
  self->mUnit = a3;
}

- (unsigned)flags
{
  return self->mFlags;
}

- (void)setFlags:(unsigned int)a3
{
  self->mFlags = a3;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (__CTFont)createCTFontWithGraphics:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  float v7;
  __CTFont *v8;

  v4 = a3;
  v5 = self->mName;
  if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("ZAPFDINGBATS")))
  {

    v5 = (NSString *)CFSTR("ZAPF DINGBATS");
  }
  objc_msgSend(v4, "fontNameForUppercaseFontName:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](v6, "length"))
  {

    v6 = (NSString *)CFSTR("Helvetica");
  }
  v7 = fabsf(self->mSize) * 4.0 / 3.0;
  v8 = TCCreateFontWithFamilyName(v6, self->mFlags & 1, (self->mFlags >> 1) & 1, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
