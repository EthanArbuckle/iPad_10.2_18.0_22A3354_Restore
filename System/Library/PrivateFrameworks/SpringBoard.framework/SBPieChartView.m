@implementation SBPieChartView

- (SBPieChartView)initWithFrame:(CGRect)a3
{
  SBPieChartView *v3;
  SBPieChartView *v4;
  void *v5;
  SBPieChartView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBPieChartView;
  v3 = -[SBPieChartView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_defaultRotation = -1.57079633;
    -[SBPieChartView setClearsContextBeforeDrawing:](v3, "setClearsContextBeforeDrawing:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPieChartView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = v4;
  }

  return v4;
}

- (void)setSlices:(id)a3
{
  NSArray **p_slices;
  id v6;
  void *v7;
  float v8;

  p_slices = &self->_slices;
  objc_storeStrong((id *)&self->_slices, a3);
  v6 = a3;
  -[NSArray valueForKeyPath:](*p_slices, "valueForKeyPath:", CFSTR("@sum.value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "floatValue");
  self->_valueTotal = v8;

  -[SBPieChartView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBPieChartView _updateMetrics](self, "_updateMetrics", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBPieChartView _rotateContext](self, "_rotateContext");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_slices;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[SBPieChartView _drawSlice:atValue:](self, "_drawSlice:atValue:", v10, v8, (_QWORD)v12);
        objc_msgSend(v10, "value");
        v8 = v8 + v11;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_updateMetrics
{
  double v3;
  double v4;
  double v5;

  -[SBPieChartView bounds](self, "bounds");
  v5 = fmin(v3 * 0.5, v4 * 0.5);
  self->_radius = v5;
  self->_center.x = v5;
  self->_center.y = v5;
}

- (void)_rotateContext
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, self->_radius, self->_radius);
  CGContextRotateCTM(CurrentContext, self->_defaultRotation);
  CGContextTranslateCTM(CurrentContext, -self->_radius, -self->_radius);
}

- (void)_drawSlice:(id)a3 atValue:(double)a4
{
  void *v6;
  id v7;
  double v8;
  double radius;
  float v10;
  __float2 v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0CEA390];
  v7 = a3;
  objc_msgSend(v6, "bezierPath");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (a4 / self->_valueTotal + a4 / self->_valueTotal) * 3.14159265;
  radius = self->_radius;
  v10 = v8;
  v11 = __sincosf_stret(v10);
  objc_msgSend(v7, "value");
  v13 = ((v12 + a4) / self->_valueTotal + (v12 + a4) / self->_valueTotal) * 3.14159265;
  objc_msgSend(v15, "moveToPoint:", self->_center.x, self->_center.y);
  objc_msgSend(v15, "addLineToPoint:", radius + radius * v11.__cosval, radius + radius * v11.__sinval);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, self->_center.x, self->_center.y, self->_radius, v8, v13);
  objc_msgSend(v15, "closePath");
  objc_msgSend(v7, "fillColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFill");
  objc_msgSend(v15, "fill");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slices, 0);
}

@end
