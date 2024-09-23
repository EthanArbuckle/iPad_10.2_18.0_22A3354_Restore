@implementation UIBoxcarFilterPointFIFO

- (UIBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4 spacing:(float)a5
{
  UIBoxcarFilterPointFIFO *v7;
  UIBoxcarFilterPointFIFO *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIBoxcarFilterPointFIFO;
  v7 = -[UIPointFIFO initWithFIFO:](&v10, sel_initWithFIFO_, a3);
  v8 = v7;
  if (v7)
  {
    if (a4 <= 1)
      -[UIBoxcarFilterPointFIFO initWithFIFO:width:spacing:].cold.1();
    v7->_width = a4;
    v7->_spacing = a5;
    v7->_prevPoints = objc_alloc_init(_UIPointVector);
  }
  return v8;
}

- (UIBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4
{
  double v4;

  LODWORD(v4) = 0;
  return -[UIBoxcarFilterPointFIFO initWithFIFO:width:spacing:](self, "initWithFIFO:width:spacing:", a3, a4, v4);
}

- (void)emitAveragedPoint
{
  unint64_t v3;
  float32x4_t v4;
  int32x2_t v5;
  float32x4_t v6;
  float32x4_t v7;
  double v8;

  if (-[_UIPointVector count](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "count"))
  {
    v3 = 0;
    v6 = 0u;
    do
    {
      -[_UIPointVector vectorAtIndex:](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints", *(_OWORD *)&v6), "vectorAtIndex:", v3);
      v6 = vaddq_f32(v7, v4);
      ++v3;
    }
    while (v3 < -[_UIPointVector count](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "count"));
  }
  else
  {
    v5.i32[1] = 0;
    v6 = 0u;
  }
  *(float *)v5.i32 = (float)self->_width;
  -[_UIPointVector removeVectorAtIndex:](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints", vdivq_f32(v6, (float32x4_t)vdupq_lane_s32(v5, 0))), "removeVectorAtIndex:", 0);
  -[UIPointFIFO emitPoint:](self, "emitPoint:", v8);
}

- (void)addPoint:(UIBoxcarFilterPointFIFO *)self
{
  float32x4_t v2;
  unint64_t v4;
  _UIPointVector *v5;
  float32x4_t v6;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;

  v9 = v2;
  v4 = -[_UIPointVector count](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "count");
  v5 = -[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
  if (v4)
  {
    -[_UIPointVector lastVector](v5, "lastVector");
    v7 = vsubq_f32(v6, v9);
    v8 = (int8x16_t)vmulq_f32(v7, v7);
    if (sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)))) >= self->_spacing)
      -[_UIPointVector addVector:](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "addVector:", *(double *)v9.i64);
    if (-[_UIPointVector count](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "count") == self->_width)
      -[UIBoxcarFilterPointFIFO emitAveragedPoint](self, "emitAveragedPoint");
  }
  else
  {
    -[_UIPointVector addVector:](v5, "addVector:", *(double *)v9.i64);
    -[UIPointFIFO emitPoint:](self, "emitPoint:", *(double *)v9.i64);
  }
}

- (void)flush
{
  objc_super v3;

  if (-[_UIPointVector count](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "count") == self->_width)
    -[UIBoxcarFilterPointFIFO emitAveragedPoint](self, "emitAveragedPoint");
  if (-[_UIPointVector count](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "count"))
  {
    -[_UIPointVector lastVector](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "lastVector");
    -[UIPointFIFO emitPoint:](self, "emitPoint:");
  }
  -[_UIPointVector clear](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "clear");
  v3.receiver = self;
  v3.super_class = (Class)UIBoxcarFilterPointFIFO;
  -[UIPointFIFO flush](&v3, sel_flush);
}

- (void)clear
{
  objc_super v3;

  -[_UIPointVector clear](-[UIBoxcarFilterPointFIFO prevPoints](self, "prevPoints"), "clear");
  v3.receiver = self;
  v3.super_class = (Class)UIBoxcarFilterPointFIFO;
  -[UIPointFIFO clear](&v3, sel_clear);
}

- (void)dealloc
{
  objc_super v3;

  self->_prevPoints = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIBoxcarFilterPointFIFO;
  -[UIPointFIFO dealloc](&v3, sel_dealloc);
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (float)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(float)a3
{
  self->_spacing = a3;
}

- (_UIPointVector)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)initWithFIFO:width:spacing:.cold.1()
{
  __assert_rtn("-[UIBoxcarFilterPointFIFO initWithFIFO:width:spacing:]", "UIInputSmoothing.m", 159, "width > 1");
}

@end
