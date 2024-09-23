@implementation MFPImageBrush

- (MFPImageBrush)initWithPhoneImage:(id)a3
{
  id v5;
  MFPImageBrush *v6;
  MFPImageBrush *v7;
  uint64_t v8;
  OITSUColor *mPhonePatternColor;
  MFPImageBrush *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)MFPImageBrush;
    v6 = -[MFPImageBrush init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->mPhoneImage, a3);
      +[OITSUColor colorWithPatternImage:](OITSUColor, "colorWithPatternImage:", v7->mPhoneImage);
      v8 = objc_claimAutoreleasedReturnValue();
      mPhonePatternColor = v7->mPhonePatternColor;
      v7->mPhonePatternColor = (OITSUColor *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)fillPath:(id)a3
{
  OITSUColor *mPhonePatternColor;
  id v5;

  v5 = a3;
  mPhonePatternColor = self->mPhonePatternColor;
  if (mPhonePatternColor)
  {
    -[OITSUColor set](mPhonePatternColor, "set");
    objc_msgSend(v5, "fill");
  }

}

- (id)color
{
  return self->mPhonePatternColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPhonePatternColor, 0);
  objc_storeStrong((id *)&self->mPhoneImage, 0);
}

@end
