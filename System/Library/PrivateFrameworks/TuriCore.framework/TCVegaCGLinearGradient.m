@implementation TCVegaCGLinearGradient

- (TCVegaCGLinearGradient)initWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  TCVegaCGLinearGradient *v10;
  NSMutableArray *v11;
  NSMutableArray *colorStops;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TCVegaCGLinearGradient;
  v10 = -[TCVegaCGLinearGradient init](&v14, sel_init);
  v10->_x0 = a3;
  v10->_y0 = a4;
  v10->_x1 = a5;
  v10->_y1 = a6;
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  colorStops = v10->_colorStops;
  v10->_colorStops = v11;

  return v10;
}

- (TCVegaCGLinearGradient)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  TCVegaCGLinearGradient *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y1"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y2"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = -[TCVegaCGLinearGradient initWithX0:y0:x1:y1:](self, "initWithX0:y0:x1:y1:", v7, v10, v13, v16);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stops"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("offset"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("color"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCVegaCGLinearGradient addColorStopWithOffset:color:](v17, "addColorStopWithOffset:color:", v27, v26);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

  return v17;
}

- (void)addColorStopWithOffset:(double)a3 color:(id)a4
{
  CGColor *v6;
  NSMutableArray *colorStops;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v6 = +[TCVegaCGContext newColorFromString:](TCVegaCGContext, "newColorFromString:", a4);
  colorStops = self->_colorStops;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](colorStops, "addObject:", v9);

}

- (void)fillWithContext:(CGContext *)a3
{
  CGColorSpace *DeviceRGB;
  __CFArray *Mutable;
  uint64_t v7;
  const CGFloat *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  CGFloat v12;
  void *v13;
  CGGradient *v14;
  double x0;
  double y0;
  double x1;
  double y1;
  _QWORD v19[2];
  CGPoint v20;
  CGPoint v21;

  v19[1] = *MEMORY[0x24BDAC8D0];
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Mutable = CFArrayCreateMutable(0, -[NSMutableArray count](self->_colorStops, "count"), 0);
  -[NSMutableArray count](self->_colorStops, "count");
  MEMORY[0x24BDAC7A8]();
  v8 = (const CGFloat *)((char *)v19 - v7);
  if (-[NSMutableArray count](self->_colorStops, "count"))
  {
    v9 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colorStops, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v8[v9] = v12;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      CFArrayAppendValue(Mutable, v13);
      ++v9;
    }
    while (v9 < -[NSMutableArray count](self->_colorStops, "count"));
  }
  v14 = CGGradientCreateWithColors(DeviceRGB, Mutable, v8);
  x0 = self->_x0;
  y0 = self->_y0;
  x1 = self->_x1;
  y1 = self->_y1;
  CGContextClip(a3);
  v20.x = x0;
  v20.y = y0;
  v21.x = x1;
  v21.y = y1;
  CGContextDrawLinearGradient(a3, v14, v20, v21, 0);
  CGContextRestoreGState(a3);
  CGGradientRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  CFRelease(Mutable);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorStops, 0);
}

@end
