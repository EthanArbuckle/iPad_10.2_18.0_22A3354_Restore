@implementation MFPhonePatternBrush

+ (id)patternBrushWithBitmap:(id)a3 usePaletteForBilevel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBitmap:usePaletteForBilevel:", v6, v4);

  return v7;
}

- (MFPhonePatternBrush)initWithBitmap:(id)a3 usePaletteForBilevel:(BOOL)a4
{
  id v7;
  MFPhonePatternBrush *v8;
  MFPhonePatternBrush *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFPhonePatternBrush;
  v8 = -[MFPhonePatternBrush init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->m_pattern, a3);
    v9->m_usePaletteForBilevel = a4;
  }

  return v9;
}

- (void)fillPath:(id)a3 in_path:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MFPhoneBrush setPolyFillMode:in_path:](self, "setPolyFillMode:in_path:", v9, v6);
  if (!-[MFPhoneBrush fillWithROP:in_path:](self, "fillWithROP:in_path:", v9, v6))
  {
    if (!self->m_usePaletteForBilevel)
      -[MFBitmap setMonoPalette:](self->m_pattern, "setMonoPalette:", v9);
    -[MFPhoneBitmap getImage](self->m_pattern, "getImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUColor colorWithPatternImage:](OITSUColor, "colorWithPatternImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "set");
    objc_msgSend(v6, "fill");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_pattern, 0);
}

@end
