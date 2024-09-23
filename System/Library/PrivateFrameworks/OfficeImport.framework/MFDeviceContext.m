@implementation MFDeviceContext

- (MFDeviceContext)initWithDriver:(id)a3
{
  id v5;
  MFDeviceContext *v6;
  MFDeviceContext *v7;
  MFTransform *v8;
  MFTransform *m_transform;
  uint64_t v10;
  OITSUColor *m_bkColour;
  uint64_t v12;
  OITSUColor *m_textColour;
  uint64_t v14;
  MFFont *m_font;
  void *v16;
  uint64_t v17;
  MFPen *m_pen;
  void *v19;
  uint64_t v20;
  MFBrush *m_brush;
  uint64_t v22;
  MFPath *m_path;
  uint64_t v24;
  NSMutableArray *m_clippingPaths;
  MFPalette *v26;
  MFPalette *m_selectedPalette;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MFDeviceContext;
  v6 = -[MFDeviceContext init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->m_driver, a3);
    *(_QWORD *)&v7->m_arcDirection = 0x100000001;
    v7->m_rop2 = 13;
    v7->m_textUpdateCP = 0;
    v7->m_textDirection = 0;
    v7->m_miterLimit = 10.0;
    *(_QWORD *)&v7->m_textHorizontalAlign = 0;
    v8 = -[MFTransform initWithDriver:]([MFTransform alloc], "initWithDriver:", v5);
    m_transform = v7->m_transform;
    v7->m_transform = v8;

    +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v10 = objc_claimAutoreleasedReturnValue();
    m_bkColour = v7->m_bkColour;
    v7->m_bkColour = (OITSUColor *)v10;

    +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v12 = objc_claimAutoreleasedReturnValue();
    m_textColour = v7->m_textColour;
    v7->m_textColour = (OITSUColor *)v12;

    objc_msgSend(v5, "createFont:", 14);
    v14 = objc_claimAutoreleasedReturnValue();
    m_font = v7->m_font;
    v7->m_font = (MFFont *)v14;

    +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createPen:in_width:in_colour:in_userStyleArray:", 0, 1, v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    m_pen = v7->m_pen;
    v7->m_pen = (MFPen *)v17;

    +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createSolidBrush:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    m_brush = v7->m_brush;
    v7->m_brush = (MFBrush *)v20;

    objc_msgSend(v5, "createPath");
    v22 = objc_claimAutoreleasedReturnValue();
    m_path = v7->m_path;
    v7->m_path = (MFPath *)v22;

    v24 = objc_opt_new();
    m_clippingPaths = v7->m_clippingPaths;
    v7->m_clippingPaths = (NSMutableArray *)v24;

    v7->m_clippingIsRestarted = 0;
    v26 = objc_alloc_init(MFPalette);
    m_selectedPalette = v7->m_selectedPalette;
    v7->m_selectedPalette = v26;

  }
  return v7;
}

- (id)getCurrentTransform
{
  return self->m_transform;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->m_font, a3);
}

- (void)setBkMode:(int)a3
{
  self->m_bkMode = a3;
}

- (void)setTextColour:(id)a3
{
  objc_storeStrong((id *)&self->m_textColour, a3);
}

- (id)getFont
{
  return self->m_font;
}

- (id)getPath
{
  return self->m_path;
}

- (BOOL)getTextUpdateCP
{
  return self->m_textUpdateCP;
}

- (int)getTextCharExtra
{
  return self->m_textCharExtra;
}

- (int)getTextVerticalAlign
{
  return self->m_textVerticalAlign;
}

- (int)getTextHorizontalAlign
{
  return self->m_textHorizontalAlign;
}

- (int)getBkMode
{
  return self->m_bkMode;
}

- (id)getTextColour
{
  return self->m_textColour;
}

- (void)setBrush:(id)a3
{
  objc_storeStrong((id *)&self->m_brush, a3);
}

- (void)setPen:(id)a3
{
  objc_storeStrong((id *)&self->m_pen, a3);
}

- (int)getRop2
{
  return self->m_rop2;
}

- (void)setRop2:(int)a3
{
  self->m_rop2 = a3;
}

- (id)getBrush
{
  return self->m_brush;
}

- (int)getPolyFillMode
{
  return self->m_polyFillMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MFDeviceContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = -[MFDeviceContext initWithDriver:](+[MFDeviceContext allocWithZone:](MFDeviceContext, "allocWithZone:", a3), "initWithDriver:", self->m_driver);
  -[MFDeviceContext getPenPosition](self, "getPenPosition");
  -[MFDeviceContext setPenPosition:](v4, "setPenPosition:");
  -[MFDeviceContext setTextUpdateCP:](v4, "setTextUpdateCP:", -[MFDeviceContext getTextUpdateCP](self, "getTextUpdateCP"));
  -[MFDeviceContext getMiterLimit](self, "getMiterLimit");
  -[MFDeviceContext setMiterLimit:](v4, "setMiterLimit:");
  -[MFDeviceContext setTextHorizontalAlign:](v4, "setTextHorizontalAlign:", -[MFDeviceContext getTextHorizontalAlign](self, "getTextHorizontalAlign"));
  -[MFDeviceContext setTextVerticalAlign:](v4, "setTextVerticalAlign:", -[MFDeviceContext getTextVerticalAlign](self, "getTextVerticalAlign"));
  -[MFDeviceContext setTextDirection:](v4, "setTextDirection:", -[MFDeviceContext getTextDirection](self, "getTextDirection"));
  -[MFDeviceContext getTextColour](self, "getTextColour");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setTextColour:](v4, "setTextColour:", v5);

  -[MFDeviceContext setTextJustification:in_breakCount:](v4, "setTextJustification:in_breakCount:", -[MFDeviceContext getTextBreakExtra](self, "getTextBreakExtra"), -[MFDeviceContext getTextBreakCount](self, "getTextBreakCount"));
  -[MFDeviceContext setTextCharExtra:](v4, "setTextCharExtra:", -[MFDeviceContext getTextCharExtra](self, "getTextCharExtra"));
  -[MFDeviceContext getBkColour](self, "getBkColour");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setBkColour:](v4, "setBkColour:", v6);

  -[MFDeviceContext setBkMode:](v4, "setBkMode:", -[MFDeviceContext getBkMode](self, "getBkMode"));
  -[MFDeviceContext getBrushOrg](self, "getBrushOrg");
  -[MFDeviceContext setBrushOrg:](v4, "setBrushOrg:");
  -[MFDeviceContext getFont](self, "getFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setFont:](v4, "setFont:", v7);

  -[MFDeviceContext setArcDirection:](v4, "setArcDirection:", -[MFDeviceContext getArcDirection](self, "getArcDirection"));
  -[MFDeviceContext setPolyFillMode:](v4, "setPolyFillMode:", -[MFDeviceContext getPolyFillMode](self, "getPolyFillMode"));
  -[MFDeviceContext setStretchBltMode:](v4, "setStretchBltMode:", -[MFDeviceContext getStretchBltMode](self, "getStretchBltMode"));
  -[MFDeviceContext getCurrentTransform](self, "getCurrentTransform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[MFDeviceContext setCurrentTransform:](v4, "setCurrentTransform:", v9);

  -[MFDeviceContext getSelectedPalette](self, "getSelectedPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setSelectedPalette:](v4, "setSelectedPalette:", v10);

  -[MFDeviceContext getPen](self, "getPen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setPen:](v4, "setPen:", v11);

  -[MFDeviceContext getBrush](self, "getBrush");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setBrush:](v4, "setBrush:", v12);

  -[MFDeviceContext setRop2:](v4, "setRop2:", -[MFDeviceContext getRop2](self, "getRop2"));
  v13 = (void *)-[MFPath copy](self->m_path, "copy");
  -[MFDeviceContext setPath:](v4, "setPath:", v13);

  return v4;
}

- (CGPoint)getPenPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->m_penPos.x;
  y = self->m_penPos.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPenPosition:(CGPoint)a3
{
  self->m_penPos = a3;
}

- (void)setTextUpdateCP:(BOOL)a3
{
  self->m_textUpdateCP = a3;
}

- (double)getMiterLimit
{
  return self->m_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->m_miterLimit = a3;
}

- (void)setTextHorizontalAlign:(int)a3
{
  self->m_textHorizontalAlign = a3;
}

- (void)setTextVerticalAlign:(int)a3
{
  self->m_textVerticalAlign = a3;
}

- (int)getTextDirection
{
  return self->m_textDirection;
}

- (void)setTextDirection:(int)a3
{
  self->m_textDirection = a3;
}

- (int)getTextBreakExtra
{
  return self->m_textBreakExtra;
}

- (int)getTextBreakCount
{
  return self->m_textBreakCount;
}

- (void)setTextCharExtra:(int)a3
{
  self->m_textCharExtra = a3;
}

- (id)getBkColour
{
  return self->m_bkColour;
}

- (void)setBkColour:(id)a3
{
  objc_storeStrong((id *)&self->m_bkColour, a3);
}

- (CGPoint)getBrushOrg
{
  double x;
  double y;
  CGPoint result;

  x = self->m_brushOrg.x;
  y = self->m_brushOrg.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBrushOrg:(CGPoint)a3
{
  self->m_brushOrg = a3;
}

- (int)getArcDirection
{
  return self->m_arcDirection;
}

- (void)setArcDirection:(int)a3
{
  self->m_arcDirection = a3;
}

- (void)setPolyFillMode:(int)a3
{
  self->m_polyFillMode = a3;
}

- (int)getStretchBltMode
{
  return self->m_stretchMode;
}

- (void)setStretchBltMode:(int)a3
{
  self->m_stretchMode = a3;
}

- (void)setCurrentTransform:(id)a3
{
  objc_storeStrong((id *)&self->m_transform, a3);
}

- (id)getSelectedPalette
{
  return self->m_selectedPalette;
}

- (void)setSelectedPalette:(id)a3
{
  objc_storeStrong((id *)&self->m_selectedPalette, a3);
}

- (id)getPen
{
  return self->m_pen;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->m_path, a3);
}

+ (id)deviceContextWithDriver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDriver:", v4);

  return v5;
}

- (void)setTextJustification:(int)a3 in_breakCount:(int)a4
{
  self->m_textBreakExtra = a3;
  self->m_textBreakCount = a4;
}

- (NSMutableArray)clippingPaths
{
  return self->m_clippingPaths;
}

- (BOOL)clippingIsRestarted
{
  return self->m_clippingIsRestarted;
}

- (void)setClippingIsRestarted:(BOOL)a3
{
  self->m_clippingIsRestarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_path, 0);
  objc_storeStrong((id *)&self->m_clippingPaths, 0);
  objc_storeStrong((id *)&self->m_selectedPalette, 0);
  objc_storeStrong((id *)&self->m_brush, 0);
  objc_storeStrong((id *)&self->m_pen, 0);
  objc_storeStrong((id *)&self->m_transform, 0);
  objc_storeStrong((id *)&self->m_bkColour, 0);
  objc_storeStrong((id *)&self->m_textColour, 0);
  objc_storeStrong((id *)&self->m_font, 0);
  objc_storeStrong((id *)&self->m_driver, 0);
}

@end
