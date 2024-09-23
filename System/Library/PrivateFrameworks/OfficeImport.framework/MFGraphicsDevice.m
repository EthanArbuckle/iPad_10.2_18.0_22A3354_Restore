@implementation MFGraphicsDevice

- (MFGraphicsDevice)initWithCanvas:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MFGraphicsDevice *v7;
  MFPhoneDeviceDriver *v8;
  MFDeviceDriver *m_deviceDriver;
  MFObjectTable *v10;
  MFObjectTable *m_objectTable;
  MFObjectTable *v12;
  MFObjectTable *m_stockObjects;
  NSMutableArray *v14;
  NSMutableArray *m_DCStack;
  MFDeviceContext *v16;
  uint64_t v17;
  MFDeviceContext *m_currentDC;
  NSDictionary *m_colorMap;
  NSDictionary *m_fillMap;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MFGraphicsDevice;
  v7 = -[MFGraphicsDevice init](&v22, sel_init);
  if (v7)
  {
    v8 = -[MFPhoneDeviceDriver initWithCanvas:]([MFPhoneDeviceDriver alloc], "initWithCanvas:", x, y, width, height);
    m_deviceDriver = v7->m_deviceDriver;
    v7->m_deviceDriver = (MFDeviceDriver *)v8;

    v10 = objc_alloc_init(MFObjectTable);
    m_objectTable = v7->m_objectTable;
    v7->m_objectTable = v10;

    v12 = objc_alloc_init(MFObjectTable);
    m_stockObjects = v7->m_stockObjects;
    v7->m_stockObjects = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    m_DCStack = v7->m_DCStack;
    v7->m_DCStack = v14;

    v16 = -[MFDeviceContext initWithDriver:]([MFDeviceContext alloc], "initWithDriver:", v7->m_deviceDriver);
    -[NSMutableArray addObject:](v7->m_DCStack, "addObject:", v16);
    -[NSMutableArray lastObject](v7->m_DCStack, "lastObject");
    v17 = objc_claimAutoreleasedReturnValue();
    m_currentDC = v7->m_currentDC;
    v7->m_currentDC = (MFDeviceContext *)v17;

    v7->m_gStateStackHeight = 1;
    m_colorMap = v7->m_colorMap;
    v7->m_colorMap = 0;

    m_fillMap = v7->m_fillMap;
    v7->m_fillMap = 0;

  }
  return v7;
}

- (void)setColorMap:(id)a3 fillMap:(id)a4
{
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *m_colorMap;
  NSDictionary *m_fillMap;
  NSDictionary *v10;

  v6 = (NSDictionary *)a3;
  v7 = (NSDictionary *)a4;
  m_colorMap = self->m_colorMap;
  self->m_colorMap = v6;
  v10 = v6;

  m_fillMap = self->m_fillMap;
  self->m_fillMap = v7;

}

- (int)setMapMode:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "setMapMode:", v3);

  return v3;
}

- (int)selectObject:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;

  v3 = *(_QWORD *)&a3;
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  TSUDynamicCast(v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[MFGraphicsDevice selectClipRegion:combineMode:](self, "selectClipRegion:combineMode:", v7, 5);

  }
  else
  {
    v8 = -[MFObjectTable selectInto:io_DC:](self->m_objectTable, "selectInto:io_DC:", v3, self->m_currentDC);
  }

  return v8;
}

- (int)setBkMode:(int)a3
{
  -[MFDeviceContext setBkMode:](self->m_currentDC, "setBkMode:", *(_QWORD *)&a3);
  return 0;
}

- (int)setTextColour:(id)a3
{
  MFDeviceContext *m_currentDC;
  void *v4;

  m_currentDC = self->m_currentDC;
  -[MFGraphicsDevice recolor:fill:](self, "recolor:fill:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setTextColour:](m_currentDC, "setTextColour:", v4);

  return 0;
}

- (id)recolor:(id)a3 fill:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSDictionary *m_fillMap;
  id v8;
  NSDictionary *m_colorMap;

  v4 = a4;
  v6 = a3;
  if (!v4
    || (m_fillMap = self->m_fillMap) == 0
    || (-[NSDictionary objectForKey:](m_fillMap, "objectForKey:", v6),
        (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    m_colorMap = self->m_colorMap;
    if (!m_colorMap
      || (-[NSDictionary objectForKey:](m_colorMap, "objectForKey:", v6),
          (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = v6;
    }
  }

  return v8;
}

- (int)deleteObject:(int)a3
{
  return -[MFObjectTable deleteObject:](self->m_objectTable, "deleteObject:", *(_QWORD *)&a3);
}

- (int)saveDC
{
  void *v3;
  MFDeviceContext *v4;
  MFDeviceContext *m_currentDC;

  v3 = (void *)-[MFDeviceContext copy](self->m_currentDC, "copy");
  -[NSMutableArray addObject:](self->m_DCStack, "addObject:", v3);
  -[NSMutableArray lastObject](self->m_DCStack, "lastObject");
  v4 = (MFDeviceContext *)objc_claimAutoreleasedReturnValue();
  m_currentDC = self->m_currentDC;
  self->m_currentDC = v4;

  -[MFGraphicsDevice saveGState:](self, "saveGState:", CFSTR("saveDC"));
  return 0;
}

- (int)intersectClipRect:(CGRect)a3
{
  return -[MFDeviceDriver intersectClipRect:](self->m_deviceDriver, "intersectClipRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)restoreDC:(int)a3
{
  int v5;

  if (a3 < 0)
  {
    if (-a3 > 1)
      v5 = -a3;
    else
      v5 = 1;
    do
    {
      -[MFGraphicsDevice restoreDC](self, "restoreDC");
      --v5;
    }
    while (v5);
  }
  else if (a3)
  {
    while ((int)-[NSMutableArray count](self->m_DCStack, "count") > a3)
      -[MFGraphicsDevice restoreDC](self, "restoreDC");
  }
  return 0;
}

- (int)setPolyFillMode:(int)a3
{
  -[MFDeviceContext setPolyFillMode:](self->m_currentDC, "setPolyFillMode:", *(_QWORD *)&a3);
  return 0;
}

- (void)done
{
  -[MFObjectTable clear](self->m_objectTable, "clear");
  -[MFObjectTable clear](self->m_stockObjects, "clear");
}

- (void)dealloc
{
  MFDeviceContext *m_currentDC;
  objc_super v4;

  m_currentDC = self->m_currentDC;
  self->m_currentDC = 0;

  v4.receiver = self;
  v4.super_class = (Class)MFGraphicsDevice;
  -[MFGraphicsDevice dealloc](&v4, sel_dealloc);
}

- (CGRect)getCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[MFDeviceDriver getCanvas](self->m_deviceDriver, "getCanvas");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)getStockObject:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (!-[MFObjectTable size](self->m_stockObjects, "size"))
    -[MFGraphicsDevice createStockObjects](self, "createStockObjects");
  return -[MFObjectTable selectInto:io_DC:](self->m_stockObjects, "selectInto:io_DC:", v3, self->m_currentDC);
}

- (void)createStockObjects
{
  MFDeviceDriver *m_deviceDriver;
  void *v4;
  void *v5;
  MFDeviceDriver *v6;
  void *v7;
  void *v8;
  MFDeviceDriver *v9;
  void *v10;
  void *v11;
  MFDeviceDriver *v12;
  void *v13;
  void *v14;
  MFDeviceDriver *v15;
  void *v16;
  void *v17;
  void *v18;
  MFDeviceDriver *v19;
  void *v20;
  MFDeviceDriver *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MFPalette *v30;
  void *v31;
  void *v32;
  MFDeviceDriver *v33;
  void *v34;
  void *v35;
  MFDeviceDriver *v36;
  void *v37;
  id v38;
  id v39;

  m_deviceDriver = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 255, 255, 255, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createSolidBrush:](m_deviceDriver, "createSolidBrush:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v5, 0);
  v6 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 192, 192, 192, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createSolidBrush:](v6, "createSolidBrush:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v8, 1);
  v9 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 128, 128, 128, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createSolidBrush:](v9, "createSolidBrush:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v11, 2);
  v12 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 169, 169, 169, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createSolidBrush:](v12, "createSolidBrush:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v14, 3);
  v15 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 0, 0, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createSolidBrush:](v15, "createSolidBrush:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v17, 4);
  -[MFDeviceDriver createNullBrush](self->m_deviceDriver, "createNullBrush");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v18, 5);
  v19 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 255, 255, 255, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createPen:in_width:in_colour:in_userStyleArray:](v19, "createPen:in_width:in_colour:in_userStyleArray:", 0, 1, v20, 0);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v38, 6);
  v21 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createPen:in_width:in_colour:in_userStyleArray:](v21, "createPen:in_width:in_colour:in_userStyleArray:", 0, 1, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v23, 7);
  -[MFDeviceDriver createPen](self->m_deviceDriver, "createPen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v24, 8);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v25, 10);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v26, 11);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v27, 12);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v28, 13);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v29, 14);
  v30 = objc_alloc_init(MFPalette);
  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v30, 15);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v31, 16);
  -[MFDeviceDriver createFont:](self->m_deviceDriver, "createFont:", 17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v32, 17);
  v33 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 0, 0, 0, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createSolidBrush:](v33, "createSolidBrush:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v35, 18);
  v36 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:in_green:in_blue:fill:](self, "recolor:in_green:in_blue:fill:", 0, 0, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createPen:in_width:in_colour:in_userStyleArray:](v36, "createPen:in_width:in_colour:in_userStyleArray:", 0, 1, v37, 0);
  v39 = (id)objc_claimAutoreleasedReturnValue();

  -[MFObjectTable putObject:in_objectPos:](self->m_stockObjects, "putObject:in_objectPos:", v39, 19);
}

- (int)setStretchBltMode:(int)a3
{
  return 0;
}

- (int)setBkColour:(id)a3
{
  MFDeviceContext *m_currentDC;
  void *v4;

  m_currentDC = self->m_currentDC;
  -[MFGraphicsDevice recolor:fill:](self, "recolor:fill:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext setBkColour:](m_currentDC, "setBkColour:", v4);

  return 0;
}

- (int)setRop2:(int)a3
{
  return 0;
}

- (int)realizePalette
{
  return 0;
}

- (int)excludeClipRect:(CGRect)a3
{
  return -[MFDeviceDriver excludeClipRect:](self->m_deviceDriver, "excludeClipRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)description:(id)a3
{
  return 0;
}

- (int)beginPath
{
  void *v2;
  int v3;

  -[MFDeviceContext getPath](self->m_currentDC, "getPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "begin");

  return v3;
}

- (int)closeCurrentPath:(BOOL)a3
{
  void *v4;
  int v5;
  MFDeviceContext *m_currentDC;

  -[MFDeviceContext getPath](self->m_currentDC, "getPath", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "closeFigure");
  if (!v5)
  {
    m_currentDC = self->m_currentDC;
    objc_msgSend(v4, "currentPoint");
    -[MFDeviceContext setPenPosition:](m_currentDC, "setPenPosition:");
  }

  return v5;
}

- (int)endPath
{
  void *v2;
  int v3;

  -[MFDeviceContext getPath](self->m_currentDC, "getPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "end");

  return v3;
}

- (id)getCurrentFont
{
  return -[MFDeviceContext getFont](self->m_currentDC, "getFont");
}

- (int)setMiterLimit:(double)a3
{
  -[MFDeviceContext setMiterLimit:](self->m_currentDC, "setMiterLimit:", a3);
  return 0;
}

- (int)setMetaRgn
{
  return -[MFDeviceDriver setMetaRgn](self->m_deviceDriver, "setMetaRgn");
}

- (int)setWorldTransform:(const CGAffineTransform *)a3
{
  void *v4;

  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "setWorldTransform:", a3);

  return (int)a3;
}

- (int)selectClipPath:(int)a3
{
  uint64_t v3;
  MFDeviceDriver *m_deviceDriver;
  void *v6;
  void *v7;
  int v8;

  v3 = *(_QWORD *)&a3;
  m_deviceDriver = self->m_deviceDriver;
  -[MFDeviceContext getPath](self->m_currentDC, "getPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createRegionWithPath:](m_deviceDriver, "createRegionWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[MFGraphicsDevice selectClipRegion:combineMode:](self, "selectClipRegion:combineMode:", v7, v3);
  else
    v8 = -1;

  return v8;
}

- (int)createRegion:(id)a3
{
  void *v4;
  int v5;

  -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", a3, self->m_currentDC);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v4, 0xFFFFFFFFLL);
  else
    v5 = -1;

  return v5;
}

- (int)setTextCharExtra:(int)a3
{
  -[MFDeviceContext setTextCharExtra:](self->m_currentDC, "setTextCharExtra:", *(_QWORD *)&a3);
  return 0;
}

- (id)recolor:(unsigned __int8)a3 in_green:(unsigned __int8)a4 in_blue:(unsigned __int8)a5 fill:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a6;
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFGraphicsDevice recolor:fill:](self, "recolor:fill:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)comment:(id)a3
{
  return 0;
}

- (int)setBrushOrg:(double)a3 y:(double)a4
{
  -[MFDeviceContext setBrushOrg:](self->m_currentDC, "setBrushOrg:", a3, a4);
  return 0;
}

- (int)setTextJustification:(int)a3 in_breakCount:(int)a4
{
  return 0;
}

- (int)setTextAlign:(BOOL)a3 textHorizontalAlign:(int)a4 textVerticalAlign:(int)a5 textDirection:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  -[MFDeviceContext setTextUpdateCP:](self->m_currentDC, "setTextUpdateCP:", a3);
  -[MFDeviceContext setTextHorizontalAlign:](self->m_currentDC, "setTextHorizontalAlign:", v8);
  -[MFDeviceContext setTextVerticalAlign:](self->m_currentDC, "setTextVerticalAlign:", v7);
  -[MFDeviceContext setTextDirection:](self->m_currentDC, "setTextDirection:", v6);
  return 0;
}

- (int)textOut:(int)a3 y:(int)a4 in_text:(id)a5
{
  id v6;
  int v7;
  int v9;
  int v10;

  v9 = a4;
  v10 = a3;
  v6 = a5;
  v7 = -[MFDeviceDriver textOut:px:py:in_text:](self->m_deviceDriver, "textOut:px:py:in_text:", self->m_currentDC, &v10, &v9, v6);
  if (!v7 && -[MFDeviceContext getTextUpdateCP](self->m_currentDC, "getTextUpdateCP"))
    -[MFDeviceContext setPenPosition:](self->m_currentDC, "setPenPosition:", (double)v10, (double)v9);

  return v7;
}

- (int)textOutEncoded:(int)a3 y:(int)a4 in_data:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[MFDeviceContext getFont](self->m_currentDC, "getFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "stringWithBytes:length:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[MFGraphicsDevice textOut:y:in_text:](self, "textOut:y:in_text:", v6, v5, v11);

  return v5;
}

- (int)extTextOut:(int)a3 y:(int)a4 in_text:(id)a5 options:(int)a6 left:(int)a7 top:(int)a8 right:(int)a9 bottom:(int)a10 spacingValues:(int *)a11 numValues:(int)a12
{
  uint64_t v13;
  uint64_t v14;
  id v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;

  v13 = *(_QWORD *)&a7;
  v14 = *(_QWORD *)&a6;
  v21 = a4;
  v22 = a3;
  v16 = a5;
  LODWORD(v20) = a12;
  LODWORD(v19) = a10;
  v17 = -[MFDeviceDriver extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:](self->m_deviceDriver, "extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:", self->m_currentDC, &v22, &v21, v16, v14, v13, __PAIR64__(a9, a8), v19, a11, v20);
  if (!v17 && -[MFDeviceContext getTextUpdateCP](self->m_currentDC, "getTextUpdateCP"))
    -[MFDeviceContext setPenPosition:](self->m_currentDC, "setPenPosition:", (double)v22, (double)v21);

  return v17;
}

- (int)extTextOutEncoded:(int)a3 y:(int)a4 in_data:(id)a5 options:(int)a6 left:(int)a7 top:(int)a8 right:(int)a9 bottom:(int)a10 spacingValues:(int *)a11 numValues:(int)a12
{
  uint64_t v12;
  uint64_t v13;
  void *v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v33;
  id v34;
  unsigned int v35;
  unsigned int v36;
  id v37;
  unsigned int v38;
  unsigned int v39;
  __int16 v41;

  v12 = *(_QWORD *)&a8;
  v13 = *(_QWORD *)&a7;
  v34 = a5;
  -[MFDeviceContext getFont](self->m_currentDC, "getFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_retainAutorelease(v34);
  objc_msgSend(v17, "stringWithBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = a4;
  v39 = a6;
  v20 = objc_msgSend(v17, "getCharset");
  v21 = a12;
  if ((v20 - 78) > 0x3A || ((1 << (v20 - 78)) & 0x51C000000000001) == 0)
    goto LABEL_15;
  v23 = OCNsStringEncodingForWindowsCharSet(v20);
  v24 = objc_msgSend(v19, "length");
  v35 = v13;
  v36 = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v18;
  v26 = objc_msgSend(v25, "unsignedIntegerValue");

  if (v24 < v26)
    v26 = v24;
  if (!v26)
  {
LABEL_14:
    v21 = v26;
    v18 = v37;
    v13 = v35;
    v12 = v36;
LABEL_15:
    LODWORD(v33) = v21;
    v31 = -[MFGraphicsDevice extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:](self, "extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:", a3, v38, v19, v39, v13, v12, __PAIR64__(a10, a9), a11, v33);
    goto LABEL_17;
  }
  v27 = 0;
  v28 = 0;
  while (1)
  {
    if (a11 && v27 + v28 < (unint64_t)a12)
      a11[v27] = a11[v27 + v28];
    v41 = 0;
    v41 = objc_msgSend(v19, "characterAtIndex:", v27);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", &v41, 1, 0);
    v30 = objc_msgSend(v29, "lengthOfBytesUsingEncoding:", v23);

    if (!v30)
      break;
    v28 = v28 + v30 - 1;
    if (v26 == ++v27)
      goto LABEL_14;
  }
  v31 = -7;
  v18 = v37;
LABEL_17:

  return v31;
}

- (int)rectangle:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6
{
  return -[MFDeviceDriver rectangle:x1:y1:x2:y2:](self->m_deviceDriver, "rectangle:x1:y1:x2:y2:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (int)fillRectangle:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6
{
  return -[MFDeviceDriver fillRectangle:x1:y1:x2:y2:](self->m_deviceDriver, "fillRectangle:x1:y1:x2:y2:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (int)ellipse:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6
{
  return -[MFDeviceDriver ellipse:x1:y1:x2:y2:](self->m_deviceDriver, "ellipse:x1:y1:x2:y2:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (int)setViewBox:(double)a3 top:(double)a4 width:(double)a5 height:(double)a6
{
  return -[MFDeviceDriver setViewBox:top:width:height:](self->m_deviceDriver, "setViewBox:top:width:height:", a3, a4, a5, a6);
}

- (void)saveGState:(id)a3
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  ++self->m_gStateStackHeight;
}

- (void)restoreGState:(id)a3
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextRestoreGState(CurrentContext);
  --self->m_gStateStackHeight;
}

- (unint64_t)currentDCIndex
{
  return -[NSMutableArray count](self->m_DCStack, "count") - 1;
}

- (unint64_t)firstClipDCIndex
{
  return -[NSMutableArray indexOfObjectIdenticalTo:](self->m_DCStack, "indexOfObjectIdenticalTo:", self->m_firstClipDC);
}

- (unint64_t)clippingStartDCIndex
{
  MFDeviceContext *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MFDeviceContext *v8;
  MFDeviceContext *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = self->m_firstClipDC;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->m_DCStack, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v4);
      v8 = *(MFDeviceContext **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      if (v8 == self->m_firstClipDC)
        break;
      if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "clippingIsRestarted"))
      {
        v9 = v8;

        v3 = v9;
        break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v10 = -[NSMutableArray indexOfObjectIdenticalTo:](self->m_DCStack, "indexOfObjectIdenticalTo:", v3);
  return v10;
}

- (void)applyNonClippingOfDCAtIndexToCurrentContext:(unint64_t)a3
{
  void *v3;
  id v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->m_DCStack, "objectAtIndexedSubscript:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCurrentTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTransform");

}

- (id)implicitClippingPath
{
  -[MFGraphicsDevice getCanvas](self, "getCanvas");
  return +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:");
}

- (id)clipEverythingClippingPath
{
  void *v2;
  double v3;
  double v4;
  CGAffineTransform v6;

  -[MFGraphicsDevice implicitClippingPath](self, "implicitClippingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controlPointBounds");
  CGAffineTransformMakeTranslation(&v6, v3 + v3, v4 + v4);
  objc_msgSend(v2, "transformUsingAffineTransform:", &v6);
  return v2;
}

- (void)addClippingPathToCurrentContext:(id)a3 dc:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEmpty"))
  {
    -[MFGraphicsDevice clipEverythingClippingPath](self, "clipEverythingClippingPath");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  memset(&v14, 0, sizeof(v14));
  objc_msgSend(v7, "getCurrentTransform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "getTransformMatrix");
  else
    memset(&v13, 0, sizeof(v13));
  CGAffineTransformInvert(&v14, &v13);

  v11 = (void *)objc_msgSend(v6, "copy");
  v12 = v14;
  objc_msgSend(v11, "transformUsingAffineTransform:", &v12);
  objc_msgSend(v11, "addClip");

}

- (void)applyClippingOfDCAtIndexToCurrentContext:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray objectAtIndexedSubscript:](self->m_DCStack, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v4, "clippingPaths", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        -[MFGraphicsDevice addClippingPathToCurrentContext:dc:](self, "addClippingPathToCurrentContext:dc:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applyDCAtIndexToCurrentContext:(unint64_t)a3
{
  -[MFGraphicsDevice applyNonClippingOfDCAtIndexToCurrentContext:](self, "applyNonClippingOfDCAtIndexToCurrentContext:");
  -[MFGraphicsDevice applyClippingOfDCAtIndexToCurrentContext:](self, "applyClippingOfDCAtIndexToCurrentContext:", a3);
}

- (void)addClippingPathToCurrentDCAndCurrentContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFDeviceContext clippingPaths](self->m_currentDC, "clippingPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[MFGraphicsDevice addClippingPathToCurrentContext:dc:](self, "addClippingPathToCurrentContext:dc:", v5, self->m_currentDC);
}

- (void)setClippingPath:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[MFGraphicsDevice firstClipDCIndex](self, "firstClipDCIndex");
  v5 = -[MFGraphicsDevice clippingStartDCIndex](self, "clippingStartDCIndex");
  v6 = -[MFGraphicsDevice currentDCIndex](self, "currentDCIndex");
  if (v6 - v5 != -1)
  {
    v7 = v6 - v5 + 1;
    do
    {
      -[MFGraphicsDevice restoreGState:](self, "restoreGState:", CFSTR("setClippingPath unwind states"));
      --v7;
    }
    while (v7);
  }
  -[MFGraphicsDevice saveGState:](self, "saveGState:", CFSTR("setClippingPath save state before m_firstClipDC"));
  while (v4 <= v6)
    -[MFGraphicsDevice applyNonClippingOfDCAtIndexToCurrentContext:](self, "applyNonClippingOfDCAtIndexToCurrentContext:", v4++);
  -[MFDeviceContext setClippingIsRestarted:](self->m_currentDC, "setClippingIsRestarted:", 1);
  -[MFDeviceContext clippingPaths](self->m_currentDC, "clippingPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  if (v9)
    -[MFGraphicsDevice addClippingPathToCurrentDCAndCurrentContext:](self, "addClippingPathToCurrentDCAndCurrentContext:", v9);

}

- (int)restoreDC
{
  _BOOL4 v3;
  MFDeviceContext *m_firstClipDC;
  MFDeviceContext *v5;
  MFDeviceContext *m_currentDC;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;

  if ((unint64_t)-[NSMutableArray count](self->m_DCStack, "count") >= 2)
  {
    v3 = -[MFDeviceContext clippingIsRestarted](self->m_currentDC, "clippingIsRestarted");
    m_firstClipDC = self->m_firstClipDC;
    if (m_firstClipDC == self->m_currentDC)
    {
      self->m_firstClipDC = 0;

      v3 = 0;
    }
    -[NSMutableArray removeLastObject](self->m_DCStack, "removeLastObject");
    -[NSMutableArray lastObject](self->m_DCStack, "lastObject");
    v5 = (MFDeviceContext *)objc_claimAutoreleasedReturnValue();
    m_currentDC = self->m_currentDC;
    self->m_currentDC = v5;

    -[MFGraphicsDevice restoreGState:](self, "restoreGState:", CFSTR("restoreDC"));
    if (v3)
    {
      -[MFGraphicsDevice saveGState:](self, "saveGState:", CFSTR("restoreDC save state before m_firstClipDC"));
      v7 = -[MFGraphicsDevice firstClipDCIndex](self, "firstClipDCIndex");
      v8 = -[MFGraphicsDevice clippingStartDCIndex](self, "clippingStartDCIndex");
      v9 = -[MFGraphicsDevice currentDCIndex](self, "currentDCIndex");
      if (v7 < v8)
      {
        do
          -[MFGraphicsDevice applyNonClippingOfDCAtIndexToCurrentContext:](self, "applyNonClippingOfDCAtIndexToCurrentContext:", v7++);
        while (v8 != v7);
      }
      -[MFGraphicsDevice applyDCAtIndexToCurrentContext:](self, "applyDCAtIndexToCurrentContext:", v8);
      for (i = v8 + 1; i <= v9; ++i)
      {
        -[MFGraphicsDevice saveGState:](self, "saveGState:", CFSTR("restoreDC apply DC between clippingStartDCIndex+1 and currentDCIndex"));
        -[MFGraphicsDevice applyDCAtIndexToCurrentContext:](self, "applyDCAtIndexToCurrentContext:", i);
      }
    }
  }
  return 0;
}

- (id)normalizedClippingPathWithClippingPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v7;
  unint64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEmpty") & 1) == 0)
  {
    v7 = 0;
    while (v7 < objc_msgSend(v4, "elementCount"))
    {
      v8 = objc_msgSend(v4, "elementAtIndex:", v7++) - 3;
      if (v8 >= 0xFFFFFFFFFFFFFFFELL)
      {
        v5 = v4;
        goto LABEL_4;
      }
    }
  }
  v5 = 0;
LABEL_4:

  return v5;
}

- (id)currentCummulatedClippingPath
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->m_firstClipDC)
    return 0;
  v3 = -[MFGraphicsDevice clippingStartDCIndex](self, "clippingStartDCIndex");
  v4 = -[MFGraphicsDevice currentDCIndex](self, "currentDCIndex");
  if (v3 <= v4)
  {
    v9 = v4;
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->m_DCStack, "objectAtIndexedSubscript:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v10, "clippingPaths", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v11);
            if (v5)
            {
              objc_msgSend(v5, "intersectBezierPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
              v6 = (id)objc_claimAutoreleasedReturnValue();

              if (!v6 || objc_msgSend(v6, "isEmpty"))
              {
                +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
                v7 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_22;
              }
              v5 = v6;
            }
            else
            {
              v5 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copy");
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v12)
            continue;
          break;
        }
      }

      ++v3;
    }
    while (v3 <= v9);
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = v6;
LABEL_22:

  return v7;
}

- (id)clippingPathByCombiningImplicitClippingPathWithClippingPath:(id)a3 combineMode:(int)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    v8 = 0;
  }
  else if ((a4 & 0xFFFFFFFB) == 1 || (a4 - 3) > 1)
  {
    v8 = v6;
  }
  else
  {
    -[MFGraphicsDevice implicitClippingPath](self, "implicitClippingPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subtractBezierPath:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (id)clippingPathByCombiningEmptyClippingPathWithClippingPath:(id)a3 combineMode:(int)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  if (a4 == 4)
  {
    +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v7 = v5;

  return v7;
}

- (id)clippingPathByCombiningClippingPath:(id)a3 withClippingPath:(id)a4 combineMode:(int)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5 == 4)
  {
    objc_msgSend(v8, "intersectBezierPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtractBezierPath:", v11);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = v9;
    goto LABEL_7;
  }
  if (a5 == 3)
  {
    objc_msgSend(v8, "uniteWithBezierPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intersectBezierPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtractBezierPath:", v12);
    v10 = objc_claimAutoreleasedReturnValue();

LABEL_7:
    v9 = v11;
    goto LABEL_8;
  }
  if (a5 != 2)
    goto LABEL_9;
  objc_msgSend(v8, "uniteWithBezierPath:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:

  v9 = (void *)v10;
LABEL_9:
  if (!v9)
  {
    +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (int)selectClippingPath:(id)a3 combineMode:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[MFGraphicsDevice normalizedClippingPathWithClippingPath:](self, "normalizedClippingPathWithClippingPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v4 != 5 && !v7)
    goto LABEL_3;
  if (self->m_firstClipDC)
  {
    if ((_DWORD)v4 == 1)
    {
      -[MFGraphicsDevice addClippingPathToCurrentDCAndCurrentContext:](self, "addClippingPathToCurrentDCAndCurrentContext:", v7);
      v8 = v7;
    }
    else
    {
      if ((_DWORD)v4 != 5)
      {
        -[MFGraphicsDevice currentCummulatedClippingPath](self, "currentCummulatedClippingPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          if (objc_msgSend(v9, "isEmpty"))
            -[MFGraphicsDevice clippingPathByCombiningEmptyClippingPathWithClippingPath:combineMode:](self, "clippingPathByCombiningEmptyClippingPathWithClippingPath:combineMode:", v7, v4);
          else
            -[MFGraphicsDevice clippingPathByCombiningClippingPath:withClippingPath:combineMode:](self, "clippingPathByCombiningClippingPath:withClippingPath:combineMode:", v10, v7, v4);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[MFGraphicsDevice clippingPathByCombiningImplicitClippingPathWithClippingPath:combineMode:](self, "clippingPathByCombiningImplicitClippingPathWithClippingPath:combineMode:", v7, v4);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (void *)v11;

        v7 = v12;
      }
      -[MFGraphicsDevice setClippingPath:](self, "setClippingPath:", v7);
      v8 = v7;
    }
  }
  else
  {
    if (!v7)
    {
LABEL_3:
      v8 = 0;
      goto LABEL_19;
    }
    -[MFGraphicsDevice clippingPathByCombiningImplicitClippingPathWithClippingPath:combineMode:](self, "clippingPathByCombiningImplicitClippingPathWithClippingPath:combineMode:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_storeStrong((id *)&self->m_firstClipDC, self->m_currentDC);
      -[MFGraphicsDevice addClippingPathToCurrentDCAndCurrentContext:](self, "addClippingPathToCurrentDCAndCurrentContext:", v8);
    }
  }
LABEL_19:

  return 0;
}

- (int)removeClip
{
  return -[MFGraphicsDevice selectClippingPath:combineMode:](self, "selectClippingPath:combineMode:", 0, 5);
}

- (int)selectClipRegion:(id)a3 combineMode:(int)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "pathForClippingWithDeviceContext:", self->m_currentDC);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = -[MFGraphicsDevice selectClippingPath:combineMode:](self, "selectClippingPath:combineMode:", v6, v4);

  return v4;
}

- (int)offsetClipRegionByX:(int)a3 y:(int)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  if (self->m_firstClipDC)
  {
    -[MFGraphicsDevice currentCummulatedClippingPath](self, "currentCummulatedClippingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isEmpty") & 1) == 0)
    {
      memset(&v20, 0, sizeof(v20));
      CGAffineTransformMakeTranslation(&v20, (double)a3, (double)a4);
      memset(&v19, 0, sizeof(v19));
      -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "getTransformMatrix");
      else
        memset(&v19, 0, sizeof(v19));

      memset(&v18, 0, sizeof(v18));
      v15 = v19;
      CGAffineTransformInvert(&t1, &v15);
      t2 = v20;
      CGAffineTransformConcat(&v17, &t1, &t2);
      v13 = v19;
      CGAffineTransformConcat(&v18, &v17, &v13);
      v12 = v18;
      objc_msgSend(v8, "transformUsingAffineTransform:", &v12);
      -[MFGraphicsDevice selectClippingPath:combineMode:](self, "selectClippingPath:combineMode:", v8, 5);
    }

  }
  return 0;
}

- (int)moveTo:(double)a3 y:(double)a4
{
  -[MFDeviceContext setPenPosition:](self->m_currentDC, "setPenPosition:", a3, a4);
  return 0;
}

- (int)lineTo:(double)a3 y:(double)a4
{
  return -[MFDeviceDriver lineTo:x:y:](self->m_deviceDriver, "lineTo:x:y:", self->m_currentDC, a3, a4);
}

- (int)polygon:(CGPoint *)a3 in_count:(int)a4
{
  return -[MFDeviceDriver polygon:in_points:in_count:](self->m_deviceDriver, "polygon:in_points:in_count:", self->m_currentDC, a3, *(_QWORD *)&a4);
}

- (int)polyPolygon:(CGPoint *)a3 in_polyCounts:(int *)a4 in_count:(int)a5
{
  return -[MFDeviceDriver polyPolygon:in_points:in_polyCounts:in_count:](self->m_deviceDriver, "polyPolygon:in_points:in_polyCounts:in_count:", self->m_currentDC, a3, a4, *(_QWORD *)&a5);
}

- (int)setArcDirection:(int)a3
{
  -[MFDeviceContext setArcDirection:](self->m_currentDC, "setArcDirection:", *(_QWORD *)&a3);
  return 0;
}

- (int)polyline:(CGPoint *)a3 in_count:(int)a4
{
  return -[MFDeviceDriver polyline:in_points:in_count:](self->m_deviceDriver, "polyline:in_points:in_count:", self->m_currentDC, a3, *(_QWORD *)&a4);
}

- (int)polyPolyline:(CGPoint *)a3 in_polyCounts:(int *)a4 in_count:(int)a5
{
  return -[MFDeviceDriver polyPolyline:in_points:in_polyCounts:in_count:](self->m_deviceDriver, "polyPolyline:in_points:in_polyCounts:in_count:", self->m_currentDC, a3, a4, *(_QWORD *)&a5);
}

- (int)arc:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  uint64_t v11;

  LODWORD(v11) = a10;
  return -[MFDeviceDriver arc:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_deviceDriver, "arc:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)pie:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  uint64_t v11;

  LODWORD(v11) = a10;
  return -[MFDeviceDriver pie:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_deviceDriver, "pie:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)angleArc:(int)a3 y:(int)a4 radius:(unsigned int)a5 startAngle:(double)a6 sweepAngle:(double)a7
{
  return -[MFDeviceDriver angleArc:x:y:radius:startAngle:sweepAngle:](self->m_deviceDriver, "angleArc:x:y:radius:startAngle:sweepAngle:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, a7);
}

- (int)arcTo:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  uint64_t v11;

  LODWORD(v11) = a10;
  return -[MFDeviceDriver arcTo:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_deviceDriver, "arcTo:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)chord:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  uint64_t v11;

  LODWORD(v11) = a10;
  return -[MFDeviceDriver chord:leftRect:topRect:rightRect:bottomRect:xStartArc:yStartArc:xEndArc:yEndArc:](self->m_deviceDriver, "chord:leftRect:topRect:rightRect:bottomRect:xStartArc:yStartArc:xEndArc:yEndArc:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)bezierTo:(int)a3 y:(int)a4 x2:(int)a5 y2:(int)a6 x3:(int)a7 y3:(int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[MFDeviceDriver bezierTo:x:y:x2:y2:x3:y3:](self->m_deviceDriver, "bezierTo:x:y:x2:y2:x3:y3:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, v9);
}

- (int)bezier:(int)a3 y:(int)a4 x2:(int)a5 y2:(int)a6 x3:(int)a7 y3:(int)a8 x4:(int)a9 y4:(int)a10
{
  uint64_t v11;

  LODWORD(v11) = a10;
  return -[MFDeviceDriver bezier:x:y:x2:y2:x3:y3:x4:y4:](self->m_deviceDriver, "bezier:x:y:x2:y2:x3:y3:x4:y4:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)roundRect:(int)a3 top:(int)a4 right:(int)a5 bottom:(int)a6 rx:(double)a7 ry:(double)a8
{
  return -[MFDeviceDriver roundRect:left:top:right:bottom:rx:ry:](self->m_deviceDriver, "roundRect:left:top:right:bottom:rx:ry:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8);
}

- (int)createBrush:(int)a3 in_colour:(id)a4 hatchstyle:(int)a5 index:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  MFDeviceDriver *m_deviceDriver;
  void *v12;
  uint64_t v13;
  MFDeviceDriver *v14;
  void *v15;
  int v16;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = a4;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      -[MFDeviceDriver createNullBrush](self->m_deviceDriver, "createNullBrush");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_9;
    }
    else
    {
      if (!a3)
      {
        m_deviceDriver = self->m_deviceDriver;
        -[MFGraphicsDevice recolor:fill:](self, "recolor:fill:", v10, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFDeviceDriver createSolidBrush:](m_deviceDriver, "createSolidBrush:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      v15 = 0;
    }
LABEL_11:
    v16 = -1;
    goto LABEL_12;
  }
  v14 = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:fill:](self, "recolor:fill:", v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createHatchBrush:in_hatchstyle:](v14, "createHatchBrush:in_hatchstyle:", v12, v7);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v13;

  if (!v15)
    goto LABEL_11;
LABEL_9:
  v16 = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v15, v6);
LABEL_12:

  return v16;
}

- (int)createFontIndirect:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17
{
  void *v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  LODWORD(v23) = a16;
  BYTE4(v22) = a13;
  HIDWORD(v21) = a11;
  LODWORD(v22) = a12;
  LOWORD(v21) = __PAIR16__(a10, a9);
  -[MFDeviceDriver createFont:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](self->m_deviceDriver, "createFont:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, v21, v22, *(_QWORD *)&a14, v23, a17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v18, 0xFFFFFFFFLL);
  else
    v19 = -1;

  return v19;
}

- (int)createFontIndirectW:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24 index:(unsigned int)a25
{
  void *v26;
  int v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  LODWORD(v32) = a24;
  LODWORD(v31) = a16;
  BYTE4(v30) = a13;
  HIDWORD(v29) = a11;
  LODWORD(v30) = a12;
  LOWORD(v29) = __PAIR16__(a10, a9);
  -[MFDeviceDriver createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:](self->m_deviceDriver, "createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, v29, v30, *(_QWORD *)&a14, v31, a17, a18, a19, *(_QWORD *)&a20, *(_QWORD *)&a22,
    v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    v27 = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v26, a25);
  else
    v27 = -1;

  return v27;
}

- (int)createPen:(int)a3 width:(int)a4 in_colour:(id)a5 in_userStyleArray:(double *)a6 index:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  MFDeviceDriver *m_deviceDriver;
  void *v13;
  void *v14;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  m_deviceDriver = self->m_deviceDriver;
  -[MFGraphicsDevice recolor:fill:](self, "recolor:fill:", a5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceDriver createPen:in_width:in_colour:in_userStyleArray:](m_deviceDriver, "createPen:in_width:in_colour:in_userStyleArray:", v10, v9, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v14, v7);
  return v7;
}

- (id)createColorWithRGBBytes:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5 flags:(unsigned __int8)a6
{
  uint64_t v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a6 == 1)
  {
    -[MFDeviceContext getSelectedPalette](self->m_currentDC, "getSelectedPalette", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getColour:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", a3, a4, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (int)setPaletteEntries:(unsigned int)a3 in_colours:(id)a4 in_index:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  int v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if ((_DWORD)v5 == -1)
    -[MFDeviceContext getSelectedPalette](self->m_currentDC, "getSelectedPalette");
  else
    -[MFObjectTable getObject:](self->m_objectTable, "getObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "setEntries:in_colours:", v6, v8))
    v10 = 0;
  else
    v10 = -7;

  return v10;
}

- (int)resizePalette:(unsigned int)a3 in_index:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  int v6;

  v4 = *(_QWORD *)&a3;
  if (a4 == -1)
    -[MFDeviceContext getSelectedPalette](self->m_currentDC, "getSelectedPalette");
  else
    -[MFObjectTable getObject:](self->m_objectTable, "getObject:", *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resize:", v4) - 1;

  return v6;
}

- (int)createPalette:(id)a3 in_index:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  int v7;

  v4 = *(_QWORD *)&a4;
  +[MFPalette paletteWithColours:](MFPalette, "paletteWithColours:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v6, v4);
  else
    v7 = -1;

  return v7;
}

- (int)createPatternBrush:(id)a3 index:(unsigned int)a4 usePaletteForBilevel:(BOOL)a5
{
  uint64_t v5;
  void *v7;
  int v8;

  v5 = *(_QWORD *)&a4;
  -[MFDeviceDriver createPatternBrush:usePaletteForBilevel:](self->m_deviceDriver, "createPatternBrush:usePaletteForBilevel:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[MFObjectTable putObject:in_objectPos:](self->m_objectTable, "putObject:in_objectPos:", v7, v5);
  else
    v8 = -1;

  return v8;
}

- (int)setWindowExt:(int)a3 in_y:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "setWindowExt:in_y:", v5, v4);

  return v4;
}

- (int)setWindowOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "setWindowOrg:in_y:", v5, v4);

  return v4;
}

- (int)setViewportExt:(int)a3 in_y:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "setViewportExt:in_y:", v5, v4);

  return v4;
}

- (int)offsetWindowOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "offsetWindowOrg:in_y:", v5, v4);

  return v4;
}

- (int)offsetViewportOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "offsetViewportOrg:in_y:", v5, v4);

  return v4;
}

- (int)setViewportOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "setViewportOrg:in_y:", v5, v4);

  return v4;
}

- (int)scaleViewportExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "scaleViewportExt:in_xDenom:in_yNum:in_yDenom:", v9, v8, v7, v6);

  return v6;
}

- (int)scaleWindowExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "scaleWindowExt:in_xDenom:in_yNum:in_yDenom:", v9, v8, v7, v6);

  return v6;
}

- (int)modifyWorldTransform:(const CGAffineTransform *)a3 in_command:(int)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a4;
  -[MFDeviceContext getCurrentTransform](self->m_currentDC, "getCurrentTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "modifyWorldTransform:in_command:", a3, v4);

  return v4;
}

- (int)abortPath
{
  void *v2;
  int v3;

  -[MFDeviceContext getPath](self->m_currentDC, "getPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "abort");

  return v3;
}

- (int)widenPath
{
  MFGraphicsDevice *v2;
  void *v3;

  v2 = self;
  -[MFDeviceContext getPath](self->m_currentDC, "getPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "widen:", v2->m_currentDC);

  return (int)v2;
}

- (int)strokeAndFillPath:(BOOL)a3 in_fill:(BOOL)a4
{
  int v4;
  _BOOL4 v5;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  -[MFDeviceContext getPath](self->m_currentDC, "getPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v4 = objc_msgSend(v7, "fill:", self->m_currentDC);
  if (v5 && !v4)
    v4 = objc_msgSend(v8, "stroke:", self->m_currentDC);

  return v4;
}

- (int)selectClipRegionWithRects:(id)a3 in_mode:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if ((_DWORD)v4 != 5 || v7)
  {
    -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", v6, self->m_currentDC);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = -[MFGraphicsDevice selectClipRegion:combineMode:](self, "selectClipRegion:combineMode:", v9, v4);
    else
      v8 = -1;

  }
  else
  {
    -[MFGraphicsDevice removeClip](self, "removeClip");
    v8 = 0;
  }

  return v8;
}

- (int)setClipRegion:(unsigned int)a3
{
  void *v4;
  int v5;

  if (!a3)
    return -[MFGraphicsDevice removeClip](self, "removeClip");
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[MFGraphicsDevice selectClipRegion:combineMode:](self, "selectClipRegion:combineMode:", v4, 5);
  else
    v5 = 0;

  return v5;
}

- (int)paintRgnWithRects:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", a3, self->m_currentDC);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext getBrush](self->m_currentDC, "getBrush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = objc_msgSend(v4, "fill:in_brush:", self->m_currentDC, v5);
  else
    v6 = -1;

  return v6;
}

- (int)paintRgn:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;

  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDeviceContext getBrush](self->m_currentDC, "getBrush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = objc_msgSend(v4, "fill:in_brush:", self->m_currentDC, v5);
  else
    v6 = 0;

  return v6;
}

- (int)invertRgnWithRects:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", a3, self->m_currentDC);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "invert:", self->m_currentDC);
  else
    v6 = -1;

  return v6;
}

- (int)invertRgn:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;

  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "invert:", self->m_currentDC);
  else
    v6 = 0;

  return v6;
}

- (int)fillRgnWithRects:(id)a3 in_brushID:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  int v8;

  v4 = *(_QWORD *)&a4;
  -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", a3, self->m_currentDC);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = objc_msgSend(v6, "fill:in_brush:", self->m_currentDC, v7);
  else
    v8 = -1;

  return v8;
}

- (int)fillRgn:(unsigned int)a3 in_brushID:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  int v8;

  v4 = *(_QWORD *)&a4;
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_msgSend(v6, "fill:in_brush:", self->m_currentDC, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)frameRegionWithRects:(id)a3 in_brushID:(unsigned int)a4 in_width:(int)a5 in_height:(int)a6
{
  uint64_t v6;
  void *v8;
  void *v9;
  int v10;

  v6 = *(_QWORD *)&a4;
  -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", a3, self->m_currentDC, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = objc_msgSend(v8, "frame:in_brush:", self->m_currentDC, v9);
  else
    v10 = -1;

  return v10;
}

- (int)frameRegion:(unsigned int)a3 in_brushID:(unsigned int)a4 in_width:(int)a5 in_height:(int)a6
{
  uint64_t v6;
  void *v8;
  void *v9;
  int v10;

  v6 = *(_QWORD *)&a4;
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFObjectTable getObject:](self->m_objectTable, "getObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = objc_msgSend(v8, "frame:in_brush:", self->m_currentDC, v9);
  else
    v10 = -1;

  return v10;
}

- (id)createDIBitmap:(const char *)a3 in_dibSize:(unsigned int)a4 in_usage:(int)a5
{
  return (id)-[MFDeviceDriver createDIBitmap:in_dib:in_dibSize:in_usage:](self->m_deviceDriver, "createDIBitmap:in_dib:in_dibSize:in_usage:", self->m_currentDC, a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (id)createDIBitmap:(const char *)a3 in_headerSize:(unsigned int)a4 in_bitmap:(const char *)a5 in_bitmapSize:(unsigned int)a6 in_usage:(int)a7
{
  return (id)-[MFDeviceDriver createDIBitmap:in_header:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_deviceDriver, "createDIBitmap:in_header:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", self->m_currentDC, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (id)createBitmap:(unsigned int)a3 in_height:(unsigned int)a4 in_planes:(unsigned int)a5 in_bitsPerPixel:(unsigned int)a6 in_bitmap:(const char *)a7 in_bitmapSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return (id)-[MFDeviceDriver createBitmap:in_width:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:](self->m_deviceDriver, "createBitmap:in_width:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, v9);
}

- (int)patBlt:(int)a3 in_y:(int)a4 in_width:(int)a5 in_height:(int)a6 in_rop:(unsigned int)a7
{
  return -[MFDeviceDriver patBlt:in_x:in_y:in_width:in_height:in_rop:](self->m_deviceDriver, "patBlt:in_x:in_y:in_width:in_height:in_rop:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (int)bitBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_rop:(unsigned int)a10 in_xform:(CGAffineTransform *)a11 in_colour:(unsigned int)a12
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  uint64_t v20;
  uint64_t v21;

  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v18 = a7;
  objc_msgSend(v18, "setMonoPalette:", self->m_currentDC);
  LODWORD(v21) = a12;
  LODWORD(v20) = a10;
  LODWORD(v13) = -[MFDeviceDriver bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_deviceDriver, "bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", self->m_currentDC, v16, v15, v14, v13, v18, __PAIR64__(a9, a8), v20, a11, v21);

  return v13;
}

- (int)stretchBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_rop:(unsigned int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  uint64_t v22;
  uint64_t v23;

  v15 = *(_QWORD *)&a6;
  v16 = *(_QWORD *)&a5;
  v17 = *(_QWORD *)&a4;
  v18 = *(_QWORD *)&a3;
  v20 = a7;
  objc_msgSend(v20, "setMonoPalette:", self->m_currentDC);
  LODWORD(v23) = a14;
  LODWORD(v22) = a12;
  LODWORD(v15) = -[MFDeviceDriver stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_deviceDriver, "stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", self->m_currentDC, v18, v17, v16, v15, v20, __PAIR64__(a9, a8), __PAIR64__(a11, a10), v22, a13, v23);

  return v15;
}

- (int)stretchBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_rop:(unsigned int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14 usePaletteForBilevel:(BOOL)a15
{
  _BYTE v16[24];
  uint64_t v17;

  LODWORD(v17) = a14;
  *(_OWORD *)&v16[4] = *(_OWORD *)&a9;
  *(_DWORD *)v16 = a8;
  return -[MFDeviceDriver stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_deviceDriver, "stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", self->m_currentDC, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, *(_QWORD *)v16, (unint64_t)(*(_OWORD *)&a9 >> 32), *(_QWORD *)&v16[16], a13, v17);
}

- (int)alphaBlend:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_sourceConstantOpacity:(unsigned __int8)a12 in_useSourceAlphaChannel:(BOOL)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v16 = *(_QWORD *)&a6;
  v17 = *(_QWORD *)&a5;
  v18 = *(_QWORD *)&a4;
  v19 = *(_QWORD *)&a3;
  v21 = a7;
  objc_msgSend(v21, "setMonoPalette:", self->m_currentDC);
  LODWORD(v25) = a15;
  LOWORD(v24) = __PAIR16__(a13, a12);
  HIDWORD(v23) = a11;
  LODWORD(v23) = a8;
  *(_QWORD *)((char *)&v23 + 4) = __PAIR64__(a10, a9);
  LODWORD(v16) = -[MFDeviceDriver alphaBlend:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:](self->m_deviceDriver, "alphaBlend:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:", self->m_currentDC, v19, v18, v17, v16, v21, v23, v24, a14, v25);

  return v16;
}

- (int)maskBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_maskImage:(id)a10 in_xMask:(int)a11 in_yMask:(int)a12 in_rop:(unsigned int)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;

  v16 = *(_QWORD *)&a6;
  v17 = *(_QWORD *)&a5;
  v18 = *(_QWORD *)&a4;
  v19 = *(_QWORD *)&a3;
  v21 = a7;
  v22 = a10;
  objc_msgSend(v21, "setMonoPalette:", self->m_currentDC);
  LODWORD(v25) = a15;
  LODWORD(v24) = a13;
  LODWORD(v16) = -[MFDeviceDriver maskBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:](self->m_deviceDriver, "maskBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:", self->m_currentDC, v19, v18, v17, v16, v21, __PAIR64__(a9, a8), v22, __PAIR64__(a12, a11), v24, a14, v25);

  return v16;
}

- (int)plgBlt:(CGPoint *)a3 in_sourceImage:(id)a4 in_xSrc:(int)a5 in_ySrc:(int)a6 in_widthSrc:(int)a7 in_heightSrc:(int)a8 in_maskImage:(id)a9 in_xMask:(int)a10 in_yMask:(int)a11 in_xform:(CGAffineTransform *)a12 in_colour:(unsigned int)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;

  v14 = *(_QWORD *)&a7;
  v15 = *(_QWORD *)&a6;
  v16 = *(_QWORD *)&a5;
  v19 = a4;
  v20 = a9;
  objc_msgSend(v19, "setMonoPalette:", self->m_currentDC);
  LODWORD(v23) = a13;
  LODWORD(v22) = a8;
  LODWORD(v14) = -[MFDeviceDriver plgBlt:in_destinationParallelogram:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:](self->m_deviceDriver, "plgBlt:in_destinationParallelogram:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:", self->m_currentDC, a3, v19, v16, v15, v14, v22, v20, __PAIR64__(a11, a10), a12, v23);

  return v14;
}

- (void)setMaximumObjectTableSize:(unsigned int)a3
{
  -[MFObjectTable setMaximumSize:](self->m_objectTable, "setMaximumSize:", *(_QWORD *)&a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_fillMap, 0);
  objc_storeStrong((id *)&self->m_colorMap, 0);
  objc_storeStrong((id *)&self->m_stockObjects, 0);
  objc_storeStrong((id *)&self->m_objectTable, 0);
  objc_storeStrong((id *)&self->m_deviceDriver, 0);
  objc_storeStrong((id *)&self->m_firstClipDC, 0);
  objc_storeStrong((id *)&self->m_DCStack, 0);
  objc_storeStrong((id *)&self->m_currentDC, 0);
}

@end
