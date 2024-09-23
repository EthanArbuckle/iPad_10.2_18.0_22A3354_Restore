@implementation MFPhoneSolidBrush

+ (id)solidBrushWithColour:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColour:", v4);

  return v5;
}

- (MFPhoneSolidBrush)initWithColour:(id)a3
{
  id v4;
  MFPhoneSolidBrush *v5;
  uint64_t v6;
  OITSUColor *m_colour;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPhoneSolidBrush;
  v5 = -[MFPhoneSolidBrush init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    m_colour = v5->m_colour;
    v5->m_colour = (OITSUColor *)v6;

  }
  return v5;
}

- (void)fillPath:(id)a3 in_path:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MFPhoneBrush setPolyFillMode:in_path:](self, "setPolyFillMode:in_path:", v7, v6);
  if (!-[MFPhoneBrush fillWithROP:in_path:](self, "fillWithROP:in_path:", v7, v6))
  {
    -[OITSUColor set](self->m_colour, "set");
    objc_msgSend(v6, "fill");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_colour, 0);
}

@end
