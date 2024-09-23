@implementation MFPhoneHatchBrush

+ (id)patternNameForHatchStyle:(int)a3
{
  if (a3 > 5)
    return 0;
  else
    return off_24F3A5A80[a3];
}

+ (id)hatchBrushWithColour:(id)a3 in_style:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColour:in_style:", v6, v4);

  return v7;
}

- (MFPhoneHatchBrush)initWithColour:(id)a3 in_style:(int)a4
{
  id v6;
  MFPhoneHatchBrush *v7;
  uint64_t v8;
  OITSUColor *m_colour;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFPhoneHatchBrush;
  v7 = -[MFPhoneHatchBrush init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    m_colour = v7->m_colour;
    v7->m_colour = (OITSUColor *)v8;

    v7->m_style = a4;
  }

  return v7;
}

- (void)fillPath:(id)a3 in_path:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  OITSUColor *m_colour;
  void *v10;
  void *v11;
  OITSUImage *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MFPhoneBrush setPolyFillMode:in_path:](self, "setPolyFillMode:in_path:", v14, v6);
  if (!-[MFPhoneBrush fillWithROP:in_path:](self, "fillWithROP:in_path:", v14, v6))
  {
    +[MFPhoneHatchBrush patternNameForHatchStyle:](MFPhoneHatchBrush, "patternNameForHatchStyle:", self->m_style);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[OCPattern blackAndWhiteImageDataWithPatternName:](OCPattern, "blackAndWhiteImageDataWithPatternName:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      m_colour = self->m_colour;
      objc_msgSend(v14, "getBkColour");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[OCPattern colorizedImageDataWithBlackAndWhiteImageData:foregroundColor:backgroundColor:](OCPattern, "colorizedImageDataWithBlackAndWhiteImageData:foregroundColor:backgroundColor:", v8, m_colour, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[OITSUImage initWithData:]([OITSUImage alloc], "initWithData:", v11);
      +[OITSUColor colorWithPatternImage:](OITSUColor, "colorWithPatternImage:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "set");
      objc_msgSend(v6, "fill");

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_colour, 0);
}

@end
