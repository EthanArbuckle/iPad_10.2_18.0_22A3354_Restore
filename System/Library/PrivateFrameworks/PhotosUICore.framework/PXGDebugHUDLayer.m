@implementation PXGDebugHUDLayer

- (PXGDebugHUDLayer)init
{
  PXGDebugHUDLayer *v2;
  CGColorSpace *DeviceRGB;
  void *v4;
  double v5;
  double v6;
  CGColor *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  NSArray *graphLayers;
  objc_super v19;
  CGFloat v20[2];
  __int128 v21;
  CGFloat v22[2];
  __int128 v23;
  CGFloat v24[2];
  __int128 v25;
  CGFloat components[2];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PXGDebugHUDLayer;
  v2 = -[PXGDebugHUDLayer init](&v19, sel_init);
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_1A7C09558;
    v27 = unk_1A7C09568;
    v2->_green = CGColorCreate(DeviceRGB, components);
    *(_OWORD *)v24 = xmmword_1A7C09578;
    v25 = unk_1A7C09588;
    v2->_yellow = CGColorCreate(DeviceRGB, v24);
    *(_OWORD *)v22 = xmmword_1A7C09598;
    v23 = unk_1A7C095A8;
    v2->_red = CGColorCreate(DeviceRGB, v22);
    -[PXGDebugHUDLayer setFrame:](v2, "setFrame:", 0.0, 0.0, 100.0, 90.0);
    -[PXGDebugHUDLayer setZPosition:](v2, "setZPosition:", 10000.0);
    -[PXGDebugHUDLayer setShouldRasterize:](v2, "setShouldRasterize:", 1);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    -[PXGDebugHUDLayer setRasterizationScale:](v2, "setRasterizationScale:", v6);
    *(_OWORD *)v20 = xmmword_1A7C09CD0;
    v21 = unk_1A7C09CE0;
    v7 = CGColorCreate(DeviceRGB, v20);
    -[PXGDebugHUDLayer setBackgroundColor:](v2, "setBackgroundColor:", v7);
    CGColorRelease(v7);
    CGColorSpaceRelease(DeviceRGB);
    objc_msgSend(MEMORY[0x1E0CD28A0], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsScale:", v6);
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 50.0, 90.0);
    objc_msgSend(v8, "setFontSize:", 10.0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 6; ++i)
    {
      _PXGDebugStatsKeyTitle(i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

    }
    objc_msgSend(v9, "addObject:", CFSTR("Total"));
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setString:", v12);

    -[PXGDebugHUDLayer addSublayer:](v2, "addSublayer:", v8);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    for (j = 0; j != 7; ++j)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrame:", 55.0, (double)j * 12.0 + 4.0, 40.0, 5.0);
      objc_msgSend(v15, "setBackgroundColor:", v2->_green);
      -[PXGDebugHUDLayer addSublayer:](v2, "addSublayer:", v15);
      objc_msgSend(v13, "addObject:", v15);

    }
    v16 = objc_msgSend(v13, "copy");
    graphLayers = v2->_graphLayers;
    v2->_graphLayers = (NSArray *)v16;

  }
  return v2;
}

- (void)updateDebugHUDWithStats:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  double v10;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDebugHUDLayer setHidden:](self, "setHidden:", objc_msgSend(v5, "wantsStatsDebugHUD") ^ 1);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maximumFramesPerSecond");

  for (i = 0; i != 6; ++i)
    -[PXGDebugHUDLayer updateLayerAtIndex:time:redZone:yellowZone:](self, "updateLayerAtIndex:time:redZone:yellowZone:", i, a3->var0[i], 0.8 / (double)v7 / 6.0, 0.5 / (double)v7 / 6.0);
  v9 = 0;
  v10 = 0.0;
  do
    v10 = v10 + a3->var0[v9++];
  while (v9 != 6);
  -[PXGDebugHUDLayer updateLayerAtIndex:time:redZone:yellowZone:](self, "updateLayerAtIndex:time:redZone:yellowZone:", 6, v10, 0.8 / (double)v7, 0.5 / (double)v7);
}

- (void)updateLayerAtIndex:(int64_t)a3 time:(double)a4 redZone:(double)a5 yellowZone:(double)a6
{
  void *v11;
  int *v12;
  double v13;
  id v14;

  -[PXGDebugHUDLayer graphLayers](self, "graphLayers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 <= a5)
  {
    if (a4 <= a6)
    {
      v12 = &OBJC_IVAR___PXGDebugHUDLayer__green;
      v13 = 40.0;
    }
    else
    {
      v12 = &OBJC_IVAR___PXGDebugHUDLayer__yellow;
      v13 = 26.6666667;
    }
  }
  else
  {
    v12 = &OBJC_IVAR___PXGDebugHUDLayer__red;
    v13 = 13.3333333;
  }
  objc_msgSend(v14, "setBackgroundColor:", *(Class *)((char *)&self->super.super.isa + *v12));
  objc_msgSend(v14, "setFrame:", 55.0, (double)a3 * 12.0 + 4.0, v13, 5.0);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGDebugHUDLayer;
  -[PXGDebugHUDLayer setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, 100.0, 90.0);
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_green);
  CGColorRelease(self->_yellow);
  CGColorRelease(self->_red);
  v3.receiver = self;
  v3.super_class = (Class)PXGDebugHUDLayer;
  -[PXGDebugHUDLayer dealloc](&v3, sel_dealloc);
}

- (NSArray)graphLayers
{
  return self->_graphLayers;
}

- (void)setGraphLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGColor)green
{
  return self->_green;
}

- (void)setGreen:(CGColor *)a3
{
  self->_green = a3;
}

- (CGColor)yellow
{
  return self->_yellow;
}

- (void)setYellow:(CGColor *)a3
{
  self->_yellow = a3;
}

- (CGColor)red
{
  return self->_red;
}

- (void)setRed:(CGColor *)a3
{
  self->_red = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphLayers, 0);
}

@end
