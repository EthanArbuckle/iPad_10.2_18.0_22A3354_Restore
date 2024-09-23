@implementation UIQuadCurvePointFIFO

- (UIQuadCurvePointFIFO)initWithFIFO:(id)a3
{
  UIQuadCurvePointFIFO *v3;
  UIQuadCurvePointFIFO *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIQuadCurvePointFIFO;
  v3 = -[UIPointFIFO initWithFIFO:](&v6, sel_initWithFIFO_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_unitScale = 1.0;
    v3->_emitInterpolatedPoints = 1;
    v3->_view = 0;
    v3->_prevPoints = objc_alloc_init(_UIPointVector);
    v4->_points = objc_alloc_init(_UIPointVector);
    v4->_controlPoints = objc_alloc_init(_UIPointVector);
  }
  return v4;
}

- (UIQuadCurvePointFIFO)initWithFIFO:(id)a3 strokeView:(id)a4
{
  UIQuadCurvePointFIFO *v5;

  v5 = -[UIQuadCurvePointFIFO initWithFIFO:](self, "initWithFIFO:", a3);
  if (v5)
    v5->_view = (UIView *)a4;
  return v5;
}

- (void)dealloc
{
  CGPath *path;
  objc_super v4;

  self->_view = 0;
  self->_emissionHandler = 0;

  self->_prevPoints = 0;
  self->_points = 0;

  self->_controlPoints = 0;
  path = self->_path;
  if (path)
  {
    CGPathRelease(path);
    self->_path = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIQuadCurvePointFIFO;
  -[UIPointFIFO dealloc](&v4, sel_dealloc);
}

+ (double)interpolateFromPoint:(float32x4_t)a1 toPoint:(float32x4_t)a2 controlPoint:(float32x4_t)a3 time:(float)a4
{
  double result;

  *(_QWORD *)&result = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a3, (float)((float)(1.0 - a4) + (float)(1.0 - a4)) * a4), a1, (float)(1.0 - a4) * (float)(1.0 - a4)), a2, a4 * a4).u64[0];
  return result;
}

- (void)enumerateInterpolationFromPoint:(id)a3 toPoint:controlPoint:usingBlock:
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v7;
  float32x4_t v8;
  float v9;
  uint64_t v10;
  float v11;
  int v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v17;
  double v18;
  double v19;
  char v20;

  v17 = *(double *)v3.i64;
  v18 = *(double *)v4.i64;
  v7 = vsubq_f32(v3, v5);
  v19 = *(double *)v5.i64;
  v8 = vsubq_f32(v5, v4);
  v9 = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v7, v7)))
     + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v8, v8)));
  -[UIQuadCurvePointFIFO unitScale](self, "unitScale");
  v10 = 0;
  v12 = vcvtps_s32_f32(v9 / v11);
  if (v12 <= 2)
    v13 = 2;
  else
    v13 = v12;
  v20 = 0;
  do
  {
    v14 = (void *)objc_opt_class();
    *(float *)&v15 = (float)(int)v10 / (float)(v13 - 1);
    objc_msgSend(v14, "interpolateFromPoint:toPoint:controlPoint:time:", v17, v18, v19, v15);
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, v10, v13, &v20);
    if (v20)
      break;
  }
  while (v13 - 1 != v10++);
}

- (void)setUnitScaleForViewSize:(CGSize)a3 normalizedSize:(CGSize)a4 contentScaleFactor:(double)a5
{
  CGFloat v5;
  float v6;

  v5 = a4.width / (a3.width * a5);
  *(float *)&v5 = v5;
  v6 = a4.height / (a3.height * a5);
  if (*(float *)&v5 >= v6)
    *(float *)&v5 = v6;
  -[UIQuadCurvePointFIFO setUnitScale:](self, "setUnitScale:", v5);
}

- (void)addPoint:(UIQuadCurvePointFIFO *)self
{
  float32x4_t v2;
  CGPath *path;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *view;
  double v14;
  double v15;
  double v16;
  double v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  _UIPointVector *v22;
  double v23;
  _UIPointVector *v24;
  double v25;
  float v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  void (**emissionHandler)(id, uint64_t, unint64_t, float32x4_t *, _QWORD);
  unint64_t v49;
  double aRect;
  float32x4_t aRect_8;
  float32x4_t aRect_24a;
  float32x4_t aRect_24;
  float32x4_t v54;
  float32x4_t v55;
  _QWORD v56[5];
  float32x4_t v57;
  NSRect v58;
  NSRect v59;

  v54 = v2;
  if (!-[_UIPointVector count](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "count"))
  {
    path = self->_path;
    if (path)
      CGPathRelease(path);
    self->_path = CGPathCreateMutable();
  }
  -[_UIPointVector addVector:](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "addVector:", *(double *)v54.i64);
  if (-[_UIPointVector count](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "count") == 1)
  {
    CGPathMoveToPoint(self->_path, 0, v54.f32[0], v54.f32[1]);
    -[_UIPointVector clear](-[UIQuadCurvePointFIFO points](self, "points"), "clear");
    -[_UIPointVector addVector:](-[UIQuadCurvePointFIFO points](self, "points"), "addVector:", *(double *)v54.i64);
    -[UIQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", *(double *)v54.i64);
    v57 = v54;
    if (-[UIQuadCurvePointFIFO view](self, "view"))
    {
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v6 = v54.f32[0] - v5 * 0.5;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v8 = v54.f32[1] - v7 * 0.5;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v10 = v9;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v12 = v11;
      view = -[UIQuadCurvePointFIFO view](self, "view");
      v14 = v6;
      v15 = v8;
      v16 = v10;
      v17 = v12;
LABEL_26:
      -[UIView setNeedsDisplayInRect:](view, "setNeedsDisplayInRect:", v14, v15, v16, v17);
    }
  }
  else
  {
    if (-[_UIPointVector count](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "count") != 3)
      return;
    -[_UIPointVector vectorAtIndex:](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "vectorAtIndex:", 1);
    v55 = v18;
    -[_UIPointVector vectorAtIndex:](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "vectorAtIndex:", 2);
    aRect_24a = v19;
    -[UIQuadCurvePointFIFO lastPoint](self, "lastPoint");
    aRect_8 = v20;
    v21.i64[0] = 0x3F0000003F000000;
    v21.i64[1] = 0x3F0000003F000000;
    aRect_24 = vmlaq_f32(v55, v21, vsubq_f32(aRect_24a, v55));
    -[_UIPointVector removeVectorAtIndex:](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "removeVectorAtIndex:", 0);
    CGPathAddQuadCurveToPoint(self->_path, 0, v55.f32[0], v55.f32[1], aRect_24.f32[0], aRect_24.f32[1]);
    -[_UIPointVector clear](-[UIQuadCurvePointFIFO points](self, "points"), "clear");
    if (self->_emitInterpolatedPoints)
    {
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __33__UIQuadCurvePointFIFO_addPoint___block_invoke;
      v56[3] = &unk_1E2605C88;
      v56[4] = self;
      -[UIQuadCurvePointFIFO enumerateInterpolationFromPoint:toPoint:controlPoint:usingBlock:](self, "enumerateInterpolationFromPoint:toPoint:controlPoint:usingBlock:", v56, *(double *)aRect_8.i64, *(double *)aRect_24.i64, *(double *)v55.i64);
    }
    else
    {
      v22 = -[UIQuadCurvePointFIFO points](self, "points");
      LODWORD(v23) = 0;
      +[UIQuadCurvePointFIFO interpolateFromPoint:toPoint:controlPoint:time:](UIQuadCurvePointFIFO, "interpolateFromPoint:toPoint:controlPoint:time:", *(double *)aRect_8.i64, *(double *)aRect_24.i64, *(double *)v55.i64, v23);
      -[_UIPointVector addVector:](v22, "addVector:");
      v24 = -[UIQuadCurvePointFIFO points](self, "points");
      LODWORD(v25) = 1.0;
      +[UIQuadCurvePointFIFO interpolateFromPoint:toPoint:controlPoint:time:](UIQuadCurvePointFIFO, "interpolateFromPoint:toPoint:controlPoint:time:", *(double *)aRect_8.i64, *(double *)aRect_24.i64, *(double *)v55.i64, v25);
      -[_UIPointVector addVector:](v24, "addVector:");
    }
    -[_UIPointVector addVector:](-[UIQuadCurvePointFIFO controlPoints](self, "controlPoints"), "addVector:", *(double *)v55.i64);
    v57 = v55;
    *(float32x4_t *)self->_lastPoint = aRect_24;
    if (self->_view)
    {
      if ((vmovn_s32(vcgtq_f32(v55, aRect_8)).u8[0] & 1) != 0)
        v26 = aRect_8.f32[0];
      else
        v26 = v55.f32[0];
      v27 = v26;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      aRect = v27 - v28 * 0.5;
      if (aRect_8.f32[1] >= v55.f32[1])
        v29 = v55.f32[1];
      else
        v29 = aRect_8.f32[1];
      v30 = v29;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v32 = v30 - v31 * 0.5;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v34 = v33 + fabsf(vsubq_f32(v55, aRect_8).f32[0]);
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v36 = v35 + vabds_f32(v55.f32[1], aRect_8.f32[1]);
      if ((vmovn_s32(vcgtq_f32(aRect_24, v55)).u8[0] & 1) != 0)
        v37 = v55.f32[0];
      else
        v37 = aRect_24.f32[0];
      v38 = v37;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v40 = v38 - v39 * 0.5;
      if (v55.f32[1] >= aRect_24.f32[1])
        v41 = aRect_24.f32[1];
      else
        v41 = v55.f32[1];
      v42 = v41;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v44 = v42 - v43 * 0.5;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v46 = v45 + fabsf(vsubq_f32(aRect_24, v55).f32[0]);
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v59.size.height = v47 + vabds_f32(aRect_24.f32[1], v55.f32[1]);
      v58.origin.x = aRect;
      v58.origin.y = v32;
      v58.size.width = v34;
      v58.size.height = v36;
      v59.origin.x = v40;
      v59.origin.y = v44;
      v59.size.width = v46;
      *(NSRect *)&v14 = NSUnionRect(v58, v59);
      view = self->_view;
      goto LABEL_26;
    }
  }
  emissionHandler = (void (**)(id, uint64_t, unint64_t, float32x4_t *, _QWORD))self->_emissionHandler;
  if (emissionHandler)
    emissionHandler[2](emissionHandler, -[_UIPointVector vectors](-[UIQuadCurvePointFIFO points](self, "points"), "vectors"), -[_UIPointVector count](-[UIQuadCurvePointFIFO points](self, "points"), "count"), &v57, 0);
  if (-[_UIPointVector count](-[UIQuadCurvePointFIFO points](self, "points"), "count"))
  {
    v49 = 0;
    do
    {
      -[_UIPointVector vectorAtIndex:](-[UIQuadCurvePointFIFO points](self, "points"), "vectorAtIndex:", v49);
      -[UIPointFIFO emitPoint:](self, "emitPoint:");
      ++v49;
    }
    while (-[_UIPointVector count](-[UIQuadCurvePointFIFO points](self, "points"), "count") > v49);
  }
}

uint64_t __33__UIQuadCurvePointFIFO_addPoint___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "points"), "addVector:", a2);
}

- (void)flush
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float v6;
  _UIPointVector *v7;
  double v8;
  _UIPointVector *v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void (**emissionHandler)(id, uint64_t, unint64_t, _OWORD *, uint64_t);
  unint64_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  objc_super v29;
  _QWORD v30[5];
  float32x4_t v31;

  v31 = 0uLL;
  if (-[_UIPointVector count](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "count"))
  {
    v28 = *(float32x4_t *)self->_lastPoint;
    -[_UIPointVector lastVector](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "lastVector");
    v4 = v3;
    v5 = vsubq_f32(v3, v28);
    v3.i64[0] = 0x3F0000003F000000;
    v3.i64[1] = 0x3F0000003F000000;
    v24 = v5;
    v26 = v4;
    v27 = vmlaq_f32(v28, v3, v5);
    v6 = v4.f32[1];
    CGPathAddLineToPoint(self->_path, 0, v4.f32[0], v4.f32[1]);
    -[_UIPointVector clear](-[UIQuadCurvePointFIFO points](self, "points"), "clear");
    if (self->_emitInterpolatedPoints)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __29__UIQuadCurvePointFIFO_flush__block_invoke;
      v30[3] = &unk_1E2605C88;
      v30[4] = self;
      -[UIQuadCurvePointFIFO enumerateInterpolationFromPoint:toPoint:controlPoint:usingBlock:](self, "enumerateInterpolationFromPoint:toPoint:controlPoint:usingBlock:", v30, *(double *)v28.i64, *(double *)v26.i64, *(double *)v27.i64);
    }
    else
    {
      v7 = -[UIQuadCurvePointFIFO points](self, "points");
      LODWORD(v8) = 0;
      +[UIQuadCurvePointFIFO interpolateFromPoint:toPoint:controlPoint:time:](UIQuadCurvePointFIFO, "interpolateFromPoint:toPoint:controlPoint:time:", *(double *)v28.i64, *(double *)v26.i64, *(double *)v27.i64, v8);
      -[_UIPointVector addVector:](v7, "addVector:");
      v9 = -[UIQuadCurvePointFIFO points](self, "points");
      LODWORD(v10) = 1.0;
      +[UIQuadCurvePointFIFO interpolateFromPoint:toPoint:controlPoint:time:](UIQuadCurvePointFIFO, "interpolateFromPoint:toPoint:controlPoint:time:", *(double *)v28.i64, *(double *)v26.i64, *(double *)v27.i64, v10);
      -[_UIPointVector addVector:](v9, "addVector:");
    }
    -[_UIPointVector addVector:](-[UIQuadCurvePointFIFO controlPoints](self, "controlPoints", *(_OWORD *)&v24), "addVector:", *(double *)v27.i64);
    v31 = v27;
    if (self->_view)
    {
      if ((vmovn_s32(vcgtq_f32(v26, v28)).u8[0] & 1) != 0)
        v11 = v28.f32[0];
      else
        v11 = v26.f32[0];
      v12 = v11;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v14 = v12 - v13 * 0.5;
      if (v28.f32[1] >= v6)
        v15 = v6;
      else
        v15 = v28.f32[1];
      v16 = v15;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v18 = v16 - v17 * 0.5;
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      v20 = v19 + fabsf(v25);
      -[UIQuadCurvePointFIFO lineWidth](self, "lineWidth");
      -[UIView setNeedsDisplayInRect:](self->_view, "setNeedsDisplayInRect:", v14, v18, v20, v21 + vabds_f32(v6, v28.f32[1]));
    }
    emissionHandler = (void (**)(id, uint64_t, unint64_t, _OWORD *, uint64_t))self->_emissionHandler;
    if (emissionHandler)
      ((void (**)(id, uint64_t, unint64_t, float32x4_t *, uint64_t))emissionHandler)[2](emissionHandler, -[_UIPointVector vectors](-[UIQuadCurvePointFIFO points](self, "points"), "vectors"), -[_UIPointVector count](-[UIQuadCurvePointFIFO points](self, "points"), "count"), &v31, 1);
    if (-[_UIPointVector count](-[UIQuadCurvePointFIFO points](self, "points"), "count"))
    {
      v23 = 0;
      do
      {
        -[_UIPointVector vectorAtIndex:](-[UIQuadCurvePointFIFO points](self, "points"), "vectorAtIndex:", v23);
        -[UIPointFIFO emitPoint:](self, "emitPoint:");
        ++v23;
      }
      while (-[_UIPointVector count](-[UIQuadCurvePointFIFO points](self, "points"), "count") > v23);
    }
  }
  -[_UIPointVector clear](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "clear");
  v29.receiver = self;
  v29.super_class = (Class)UIQuadCurvePointFIFO;
  -[UIPointFIFO flush](&v29, sel_flush);
}

uint64_t __29__UIQuadCurvePointFIFO_flush__block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "points"), "addVector:", a2);
}

- (void)clear
{
  CGPath *path;
  objc_super v4;

  -[_UIPointVector clear](-[UIQuadCurvePointFIFO prevPoints](self, "prevPoints"), "clear");
  -[_UIPointVector clear](-[UIQuadCurvePointFIFO points](self, "points"), "clear");
  path = self->_path;
  if (path)
    CGPathRelease(path);
  self->_path = CGPathCreateMutable();
  v4.receiver = self;
  v4.super_class = (Class)UIQuadCurvePointFIFO;
  -[UIPointFIFO clear](&v4, sel_clear);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEmissionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (float)unitScale
{
  return self->_unitScale;
}

- (void)setUnitScale:(float)a3
{
  self->_unitScale = a3;
}

- (CGPath)path
{
  return self->_path;
}

- (void)setPath:(CGPath *)a3
{
  self->_path = a3;
}

- (_UIPointVector)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (_UIPointVector)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (_UIPointVector)controlPoints
{
  return self->_controlPoints;
}

- (void)setControlPoints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (__n128)lastPoint
{
  return a1[5];
}

- (void)setLastPoint:(UIQuadCurvePointFIFO *)self
{
  __int128 v2;

  *(_OWORD *)self->_lastPoint = v2;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
}

@end
