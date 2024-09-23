@implementation RBShape

- (id).cxx_construct
{
  self->_data.type = 0;
  RB::Heap::Heap((RB::Heap *)&self->_heap, (char *)self->_heap._buffer, 256, 0);
  return self;
}

- (uint64_t)shapeData
{
  if (a1)
    return a1 + 16;
  else
    return 0;
}

- (void)_setRect:(float64_t)a3
{
  _BOOL4 IsInfinite;
  int *v7;
  int32x2_t v8;
  char v9;
  float v10;
  int v11;
  float64x2_t v12;
  float32x2_t v13;

  if (a1)
  {
    IsInfinite = CGRectIsInfinite(*(CGRect *)&a2);
    v7 = (int *)(a1 + 16);
    if (IsInfinite)
    {
      RBShapeData::apply<RB::DestroyAny>(v7);
      *(_QWORD *)(a1 + 32) = 0x100000001000000;
      v8 = vdup_n_s32(0x7F7FFFFFu);
      v9 = 1;
      v10 = 0.0;
      LOBYTE(v11) = 1;
    }
    else
    {
      v12.f64[0] = a2;
      v12.f64[1] = a3;
      v13 = vcvt_f32_f64(v12);
      v12.f64[0] = a4;
      v12.f64[1] = a5;
      v8 = (int32x2_t)vcvt_f32_f64(v12);
      v11 = *(_DWORD *)(a1 + 428);
      RBShapeData::apply<RB::DestroyAny>(v7);
      v10 = *(double *)(a1 + 432);
      *(float32x2_t *)(a1 + 32) = v13;
      v9 = 2;
    }
    *(int32x2_t *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 1065353216;
    *(float *)(a1 + 72) = v10;
    *(_BYTE *)(a1 + 76) = v9;
    *(_BYTE *)(a1 + 77) = v11;
    *(_BYTE *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
  }
}

- (void).cxx_destruct
{
  RB::Heap::~Heap((RB::Heap *)&self->_heap);
  RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
  self->_data.type = 0;
}

- (void)setRBPath:(RBPath)a3 transform:(CGAffineTransform *)a4
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6[3];

  v4 = *(float64x2_t *)&a4->c;
  v5 = *(float64x2_t *)&a4->tx;
  v6[0] = *(float64x2_t *)&a4->a;
  v6[1] = v4;
  v6[2] = v5;
  -[RBShape _setRBPath:transform:]((unint64_t)self, (uint64_t)a3.info, (uint64_t)a3.callbacks, v6);
}

- (void)setEOFill:(BOOL)a3
{
  if (self->_eoFill != a3)
  {
    self->_eoFill = a3;
    if (self->_data.type == 2)
      self->_data.data[40] = a3;
  }
}

- (void)setAntialiased:(BOOL)a3
{
  _BOOL4 v3;

  v3 = !a3;
  if (self->_renderingMode != !a3)
  {
    self->_renderingMode = v3;
    RBShapeData::set_rendering_mode((uint64_t)&self->_data, v3);
  }
}

- (void)setGlyphs:(float64x2_t *)a3 positions:(unint64_t)a4 count:(const void *)a5 font:(int)a6 renderingStyle:(char)a7 dilation:(__n128)a8 shouldDrawBitmapRuns:(__n128)a9
{
  if (a1)
    -[RBShape _setGlyphs:positions:count:font:renderingStyle:dilation:shouldDrawBitmapRuns:](a1, size, a3, a4, a5, a6, a7, a8, a9);
}

- (void)_setGlyphs:(float64x2_t *)a3 positions:(unint64_t)a4 count:(const void *)a5 font:(int)a6 renderingStyle:(char)a7 dilation:(__n128)a8 shouldDrawBitmapRuns:(__n128)a9
{
  size_t v16;
  float32x2_t *v17;
  float32x2_t *v18;
  unint64_t v19;
  float64x2_t v20;
  float64x2_t v21;
  double v22;
  char v23;
  float v24;
  __n128 v25;
  __n128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a1 && !HIDWORD(a4))
  {
    v25 = a8;
    v26 = a9;
    if (a4 > 0x200)
    {
      v17 = (float32x2_t *)malloc_type_malloc(8 * a4, 0x676B4AC8uLL);
      if (!v17)
      {
LABEL_10:
        free(v17);
        return;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](a1, 8 * a4);
      v17 = (float32x2_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v17, v16);
    }
    if (a4)
    {
      v18 = v17;
      v19 = a4;
      do
      {
        v20 = *a3++;
        *v18++ = vcvt_f32_f64(v20);
        --v19;
      }
      while (v19);
    }
    RB::Heap::reset((RB::Heap *)(a1 + 128), (char *)(a1 + 168), 256);
    *(_QWORD *)&v21.f64[0] = v25.n128_u64[0];
    *(_QWORD *)&v21.f64[1] = v26.n128_u64[0];
    v22 = COERCE_DOUBLE(vcvt_f32_f64(v21));
    v23 = *(_BYTE *)(a1 + 428);
    RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
    *(_DWORD *)(a1 + 16) = 0;
    v24 = *(double *)(a1 + 432);
    RB::Coverage::Glyphs::Glyphs(a1 + 32, (RB::Heap *)(a1 + 128), a5, a4, (const void *)size, v17, a6, v23, v22, v24, a7);
    *(_DWORD *)(a1 + 16) = 4;
    if (a4 >= 0x201)
      goto LABEL_10;
  }
}

- (void)setStrokedRBPath:(RBPath)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8 dashPhase:(double)a9 dashPattern:(const double *)a10 dashCount:(int64_t)a11
{
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13[3];

  v11 = *(float64x2_t *)&a4->c;
  v12 = *(float64x2_t *)&a4->tx;
  v13[0] = *(float64x2_t *)&a4->a;
  v13[1] = v11;
  v13[2] = v12;
  -[RBShape _setStrokedRBPath:transform:lineWidth:lineCap:lineJoin:miterLimit:dashPhase:dashPattern:dashCount:]((uint64_t)self, (uint64_t)a3.info, (uint64_t)a3.callbacks, v13, a6, (CGLineJoin)a7, (double *)a10, a11, a5, a8, a9);
}

- (void)_setStrokedRBPath:(uint64_t)a3 transform:(float64x2_t *)a4 lineWidth:(unsigned int)a5 lineCap:(CGLineJoin)a6 lineJoin:(double *)a7 miterLimit:(uint64_t)a8 dashPhase:(double)a9 dashPattern:(double)a10 dashCount:(double)a11
{
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  size_t v27;
  float *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  float *v32;
  double *v33;
  double v34;
  float v35;
  float *v36;
  double v37;
  float v38;
  uint64_t v39;
  size_t v40;
  BOOL v41;
  int64x2_t v42;
  float64x2_t *v43;
  uint64_t v44;
  float v45;
  float v46;
  uint64_t v47;
  BOOL v48;
  float v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  float64x2_t *v54;
  float v55;
  float v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  if (a9 <= 0.0)
  {
    RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_DWORD *)(a1 + 64) = 1065353216;
    *(_QWORD *)(a1 + 68) = 0;
    *(_WORD *)(a1 + 76) = 256;
    *(_BYTE *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
    return;
  }
  v21 = rb_line_cap(a5);
  v22 = rb_line_join(a6);
  v23 = v22;
  v24 = a8 << (a8 & 1);
  v25 = a8 < 0;
  if (a8 >= 0)
    v26 = a8 << (a8 & 1);
  else
    v26 = -v24;
  if (a8 >= 0)
    v27 = 4 * v26;
  else
    v27 = -4 * v26;
  if (!(4 * v26))
    v25 = 0;
  if (!(v26 >> 62) && !v25)
  {
    v51 = v21;
    if (v27 <= 0x1000)
    {
      MEMORY[0x24BDAC7A8](v22, v27);
      v29 = (char *)&v50 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v29, v40);
      v21 = 0;
      if (a8)
        goto LABEL_15;
    }
    else
    {
      v29 = (char *)malloc_type_malloc(v27, 0x2524D8A0uLL);
      v21 = 1;
      if (a8)
      {
LABEL_15:
        if (!v29)
        {
          if (!v21)
            return;
          goto LABEL_39;
        }
        v30 = 8 * a8;
        v31 = 8 * a8;
        v32 = (float *)v29;
        v33 = a7;
        do
        {
          v34 = *v33++;
          v35 = v34;
          *v32++ = v35;
          v31 -= 8;
        }
        while (v31);
        if (v24 != a8)
        {
          v36 = (float *)&v29[4 * a8];
          do
          {
            v37 = *a7++;
            v38 = v37;
            *v36++ = v38;
            v30 -= 8;
          }
          while (v30);
        }
        if (RB::Stroke::Dasher::prepare_pattern(a8 << (a8 & 1), v29, v28))
          v39 = a8 << (a8 & 1);
        else
          v39 = 0;
        goto LABEL_29;
      }
    }
    v39 = 0;
LABEL_29:
    LODWORD(a8) = v21;
    LOBYTE(v21) = v51;
    goto LABEL_30;
  }
  if (a8)
    return;
  v29 = 0;
  v39 = 0;
LABEL_30:
  if (v23)
    v41 = 1;
  else
    v41 = a10 > 0.0;
  if (!v41)
    LOBYTE(v23) = 2;
  v42 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a4[1], (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(*a4, (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(a4[2]));
  if (vandq_s8((int8x16_t)vdupq_laneq_s64(v42, 1), (int8x16_t)v42).i64[0] >= 0)
    v43 = a4;
  else
    v43 = 0;
  RB::Heap::reset((RB::Heap *)(a1 + 128), (char *)(a1 + 168), 256);
  v44 = RBPathRetain(a2, a3);
  v45 = a9;
  v46 = a11;
  v52 = v44;
  v53 = v47;
  v54 = v43;
  v55 = v45;
  v56 = v46;
  v57 = v39;
  v58 = v29;
  v48 = rb_clip_mode(*(unsigned __int8 *)(a1 + 428));
  RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 32) = off_24C229920;
  RB::Coverage::StrokeablePath::StrokeablePath(a1 + 40, &v52, a1 + 128);
  v49 = a10;
  *(_QWORD *)(a1 + 88) = 0x100000001000000;
  *(int32x2_t *)(a1 + 96) = vdup_n_s32(0x7F7FFFFFu);
  *(_BYTE *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 105) = v21;
  *(_BYTE *)(a1 + 106) = v23;
  *(_BYTE *)(a1 + 107) = 15;
  *(_BYTE *)(a1 + 108) = v48;
  *(float *)(a1 + 112) = v49;
  *(_DWORD *)(a1 + 16) = 3;
  RBPathRelease(v52, v53);
  if ((_DWORD)a8)
LABEL_39:
    free(v29);
}

- (void)setEllipseInRect:(CGRect)a3
{
  CGFloat v4;
  double v5;
  float64x2_t v6;
  float64x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  unsigned int renderingMode;
  float v11;
  float renderingModeArgument;
  int32x4_t v13;

  v4 = a3.size.width / a3.size.height;
  v5 = 1.0 / (a3.size.width / a3.size.height);
  v6.f64[0] = v5 * a3.origin.x;
  v7.f64[0] = v5 * a3.size.width;
  v6.f64[1] = a3.origin.y;
  v8 = vcvt_f32_f64(v6);
  v7.f64[1] = a3.size.height;
  v9 = vcvt_f32_f64(v7);
  v6.f64[0] = a3.size.height * 0.5;
  *(float *)v6.f64 = a3.size.height * 0.5;
  v13 = vdupq_lane_s32(*(int32x2_t *)&v6.f64[0], 0);
  renderingMode = self->_renderingMode;
  RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
  v11 = v4;
  renderingModeArgument = self->_renderingModeArgument;
  *(float32x2_t *)&self->_data.data[12] = v8;
  *(float32x2_t *)&self->_data.data[20] = v9;
  *(int32x4_t *)&self->_data.data[28] = v13;
  *(float *)&self->_data.data[44] = v11;
  *(_DWORD *)&self->_data.data[48] = 0;
  *(float *)&self->_data.data[52] = renderingModeArgument;
  self->_data.data[56] = 5;
  self->_data.data[57] = renderingMode;
  self->_data.data[58] &= 0xF8u;
  self->_data.type = 1;
}

- (void)setRoundedRect:(CGRect)a3 cornerSize:(CGSize)a4 cornerStyle:(int)a5
{
  -[RBShape _setRoundedRect:cornerSize:cornerStyle:]((int32x2_t *)self, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
}

- (float)_setRoundedRect:(double)a3 cornerSize:(float64_t)a4 cornerStyle:(float64_t)a5
{
  double v14;
  float64x2_t v16;
  float64x2_t v17;

  if (a1)
  {
    v14 = a3;
    if (CGRectIsInfinite(*(CGRect *)&a3))
    {
      RBShapeData::apply<RB::DestroyAny>((int *)&a1[2]);
      a1[4] = (int32x2_t)0x100000001000000;
      a1[5] = vdup_n_s32(0x7F7FFFFFu);
      a1[6] = 0;
      a1[7] = 0;
      LODWORD(a3) = 1065353216;
      a1[8] = (int32x2_t)1065353216;
      a1[9].i32[0] = 0;
      a1[9].i16[2] = 257;
      a1[9].i8[6] &= 0xF8u;
      a1[2].i32[0] = 1;
    }
    else
    {
      v16.f64[0] = v14;
      v17.f64[0] = a5;
      *(float *)&a3 = set_rounded_rect((uint64_t)a1, a2, v16, a4, v17, a6, a7, a8, 0.0);
    }
  }
  return *(float *)&a3;
}

- (void)_xmlAttributes:(double)a3
{
  if (a1)
  {
    switch(*(_DWORD *)(a1 + 16))
    {
      case 1:
        RB::Coverage::Primitive::attributes((RB::Coverage::Primitive *)(a1 + 32), a2, a3, a4, a5);
        break;
      case 2:
        RB::Coverage::Path::attributes((RB::Coverage::Path *)(a1 + 32), a2);
        break;
      case 3:
        RB::Coverage::StrokeablePath::attributes(a1 + 40, a1 + 32, a2);
        break;
      case 4:
        RB::Coverage::Glyphs::attributes((RB::Coverage::Glyphs *)(a1 + 32), a2);
        break;
      case 5:
        RBStrokeRef::attributes((void **)(a1 + 40), (uint64_t)a2, a2);
        break;
      default:
        return;
    }
  }
}

- (CGRect)boundingRect
{
  int8x16_t v2;
  int32x4_t v3;
  double v4;
  float32x2_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  RBPath v15;
  CGRect result;

  switch(self->_data.type)
  {
    case 1:
      v11 = xmmword_209BD5290;
      v12 = xmmword_209BD52A0;
      v13 = 0;
      v14 = 0;
      *(float32x2_t *)&v4 = RB::Coverage::Primitive::bounds((float32x2_t *)&self->_data.data[12], (float64x2_t *)&v11, (int8x16_t)xmmword_209BD5290, 0.0, v2, v3);
      break;
    case 2:
      v15.info = &self->_data.data[12];
      v11 = xmmword_209BD5290;
      v12 = xmmword_209BD52A0;
      v13 = 0;
      v14 = 0;
      v15.callbacks = (RBPathCallbacks *)&v11;
      v4 = RB::Coverage::Path::bounds(v15);
      break;
    case 3:
      v11 = xmmword_209BD5290;
      v12 = xmmword_209BD52A0;
      v13 = 0;
      v14 = 0;
      *(float32x2_t *)&v4 = RB::Coverage::Stroke<RB::Coverage::StrokeablePath>::bounds((uint64_t)&self->_data.data[12], (float64x2_t *)&v11);
      break;
    case 4:
      v11 = xmmword_209BD5290;
      v12 = xmmword_209BD52A0;
      v13 = 0;
      v14 = 0;
      v4 = RB::Coverage::Glyphs::bounds((float32x2_t *)&self->_data.data[12], (float64x2_t *)&v11, 0);
      break;
    case 5:
      v11 = xmmword_209BD5290;
      v12 = xmmword_209BD52A0;
      v13 = 0;
      v14 = 0;
      *(float32x2_t *)&v4 = RB::Coverage::Stroke<RBStrokeRef>::bounds(&self->_data.data[12], (float64x2_t *)&v11);
      break;
    default:
      v5 = 0;
      v4 = 0.0;
      break;
  }
  v6 = *((float *)&v4 + 1);
  v7 = v5.f32[0];
  v8 = v5.f32[1];
  v9 = *(float *)&v4;
  v10 = v6;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)setRenderingMode:(unsigned int)a3
{
  if (self->_renderingMode != a3)
  {
    self->_renderingMode = a3;
    RBShapeData::set_rendering_mode((uint64_t)&self->_data, a3);
  }
}

- (BOOL)isAntialiased
{
  return self->_renderingMode != 1;
}

- (void)setRenderingModeArgument:(double)a3
{
  int type;
  uint64_t v4;
  float v5;

  if (self->_renderingModeArgument != a3)
  {
    self->_renderingModeArgument = a3;
    type = self->_data.type;
    switch(type)
    {
      case 1:
        v4 = 72;
        break;
      case 4:
        v4 = 80;
        break;
      case 2:
        v4 = 56;
        break;
      default:
        return;
    }
    v5 = a3;
    *(float *)((char *)&self->super.isa + v4) = v5;
  }
}

- (double)_setInfinite
{
  double result;

  if (a1)
  {
    RBShapeData::apply<RB::DestroyAny>((int *)&a1[2]);
    a1[4] = (int32x2_t)0x100000001000000;
    a1[5] = vdup_n_s32(0x7F7FFFFFu);
    a1[6] = 0;
    a1[7] = 0;
    *(_QWORD *)&result = 1065353216;
    a1[8] = (int32x2_t)1065353216;
    a1[9].i32[0] = 0;
    a1[9].i16[2] = 257;
    a1[9].i8[6] &= 0xF8u;
    a1[2].i32[0] = 1;
  }
  return result;
}

- (double)_setEmpty
{
  double result;

  if (a1)
  {
    RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
    result = 0.0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_DWORD *)(a1 + 64) = 1065353216;
    *(_QWORD *)(a1 + 68) = 0;
    *(_WORD *)(a1 + 76) = 256;
    *(_BYTE *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
  }
  return result;
}

- (void)setStrokedRect:(CGRect)a3 lineWidth:(double)a4
{
  double width;
  CGFloat y;
  float32x2_t v8;
  CGFloat height;
  float32x2_t v10;
  unsigned int renderingMode;
  float v12;
  float renderingModeArgument;
  CGRect v14;

  if (a4 <= 0.0)
  {
    -[RBShape _setEmpty]((uint64_t)self);
  }
  else
  {
    if (a3.size.width >= a3.size.height)
      width = a3.size.width;
    else
      width = a3.size.height;
    if (width <= a4)
    {
      v14 = CGRectInset(a3, a4 * -0.5, a4 * -0.5);
      -[RBShape _setRect:]((uint64_t)self, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
    }
    else
    {
      y = a3.origin.y;
      v8 = vcvt_f32_f64((float64x2_t)a3.origin);
      height = a3.size.height;
      v10 = vcvt_f32_f64((float64x2_t)a3.size);
      renderingMode = self->_renderingMode;
      RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
      v12 = a4;
      renderingModeArgument = self->_renderingModeArgument;
      *(float32x2_t *)&self->_data.data[12] = v8;
      *(float32x2_t *)&self->_data.data[20] = v10;
      *(_QWORD *)&self->_data.data[28] = 0;
      *(_QWORD *)&self->_data.data[36] = 0;
      *(_DWORD *)&self->_data.data[44] = 1065353216;
      *(float *)&self->_data.data[48] = v12;
      *(float *)&self->_data.data[52] = renderingModeArgument;
      self->_data.data[56] = 2;
      self->_data.data[57] = renderingMode;
      self->_data.data[58] &= 0xF8u;
      self->_data.type = 1;
    }
  }
}

- (void)setRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerStyle:(int)a5
{
  -[RBShape _setRoundedRect:cornerSize:cornerStyle:]((int32x2_t *)self, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4);
}

- (void)setRoundedRect:(CGRect)a3 cornerRadii:(id)a4 cornerStyle:(int)a5
{
  double var3;
  double var2;
  double var1;
  double var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsInfinite(a3))
    -[RBShape _setInfinite]((int32x2_t *)self);
  else
    set_rounded_rect((uint64_t)self, a5, x, y, width, height, var0, var1, var2, var3, 0.0);
}

- (void)setStrokedRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerStyle:(int)a5 lineWidth:(double)a6
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  float64x2_t v14;
  float64x2_t v15;

  if (a6 <= 0.0)
    goto LABEL_4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsInfinite(a3))
  {
    if ((*(_QWORD *)&a6 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
LABEL_4:
      -[RBShape _setEmpty]((uint64_t)self);
      return;
    }
    -[RBShape _setInfinite]((int32x2_t *)self);
  }
  else
  {
    v14.f64[0] = x;
    v15.f64[0] = width;
    set_rounded_rect((uint64_t)self, a5, v14, y, v15, height, a4, a4, a6);
  }
}

- (void)setStrokedRoundedRect:(CGRect)a3 cornerRadii:(id)a4 cornerStyle:(int)a5 lineWidth:(double)a6
{
  double var2;
  double var1;
  double var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double var3;

  if (a6 <= 0.0)
    goto LABEL_4;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  var3 = a4.var3;
  if (CGRectIsInfinite(a3))
  {
    if ((*(_QWORD *)&a6 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
LABEL_4:
      -[RBShape _setEmpty]((uint64_t)self);
      return;
    }
    -[RBShape _setInfinite]((int32x2_t *)self);
  }
  else
  {
    set_rounded_rect((uint64_t)self, a5, x, y, width, height, var0, var1, var2, var3, a6);
  }
}

- (void)_setCircleAtPoint:(float64_t)a3 radius:(double)a4
{
  float32x2_t v5;
  double v6;
  int32x2_t v7;
  int v8;
  int32x2_t v9;
  float v10;

  if (a1)
  {
    if (a4 <= 0.0)
    {
      RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_DWORD *)(a1 + 64) = 1065353216;
      *(_QWORD *)(a1 + 68) = 0;
      *(_WORD *)(a1 + 76) = 256;
    }
    else
    {
      a2.f64[1] = a3;
      v5 = vcvt_f32_f64(vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0)));
      v6 = a4 + a4;
      *(float *)&v6 = a4 + a4;
      v7 = vdup_lane_s32(*(int32x2_t *)&v6, 0);
      v8 = *(_DWORD *)(a1 + 428);
      RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
      v9.i32[1] = HIDWORD(a4);
      *(float *)v9.i32 = a4;
      v10 = *(double *)(a1 + 432);
      *(float32x2_t *)(a1 + 32) = v5;
      *(int32x2_t *)(a1 + 40) = v7;
      *(int32x4_t *)(a1 + 48) = vdupq_lane_s32(v9, 0);
      *(_QWORD *)(a1 + 64) = 1065353216;
      *(float *)(a1 + 72) = v10;
      *(_BYTE *)(a1 + 76) = 5;
      *(_BYTE *)(a1 + 77) = v8;
    }
    *(_BYTE *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
  }
}

- (void)setStrokedCircleAtPoint:(CGPoint)a3 radius:(double)a4 lineWidth:(double)a5
{
  double v7;
  CGFloat y;
  float32x2_t v9;
  double v10;
  int32x2_t v11;
  unsigned int renderingMode;
  int32x2_t v13;
  float v14;
  float renderingModeArgument;

  if (a5 <= 0.0)
  {
    -[RBShape _setEmpty]((uint64_t)self);
  }
  else
  {
    v7 = a5 * 0.5;
    if (v7 >= a4)
    {
      -[RBShape _setCircleAtPoint:radius:]((uint64_t)self, (float64x2_t)a3, a3.y, v7 + a4);
    }
    else
    {
      y = a3.y;
      v9 = vcvt_f32_f64(vsubq_f64((float64x2_t)a3, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0)));
      v10 = a4 + a4;
      *(float *)&v10 = a4 + a4;
      v11 = vdup_lane_s32(*(int32x2_t *)&v10, 0);
      renderingMode = self->_renderingMode;
      RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
      v13.i32[1] = HIDWORD(a4);
      *(float *)v13.i32 = a4;
      v14 = a5;
      renderingModeArgument = self->_renderingModeArgument;
      *(float32x2_t *)&self->_data.data[12] = v9;
      *(int32x2_t *)&self->_data.data[20] = v11;
      *(int32x4_t *)&self->_data.data[28] = vdupq_lane_s32(v13, 0);
      *(_DWORD *)&self->_data.data[44] = 1065353216;
      *(float *)&self->_data.data[48] = v14;
      *(float *)&self->_data.data[52] = renderingModeArgument;
      self->_data.data[56] = 5;
      self->_data.data[57] = renderingMode;
      self->_data.data[58] &= 0xF8u;
      self->_data.type = 1;
    }
  }
}

- (void)setStrokedLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 lineWidth:(double)a5 lineCap:(int)a6
{
  double y;
  double x;
  char v11;
  BOOL v12;
  float64x2_t v13;
  float32x2_t v14;
  unint64_t v15;
  float v16;
  float renderingModeArgument;
  unsigned __int8 v18;
  double v19;
  double v20;
  unint64_t v21;

  if (a5 <= 0.0)
  {
    -[RBShape _setEmpty]((uint64_t)self);
  }
  else
  {
    y = a4.y;
    x = a4.x;
    if (a6 == 1)
      v11 = 7;
    else
      v11 = 8;
    v19 = a3.x;
    v20 = a3.y;
    v12 = rb_clip_mode(LOBYTE(self->_renderingMode));
    v13.f64[0] = v19;
    v13.f64[1] = v20;
    v14 = vcvt_f32_f64(v13);
    *(float *)&v15 = x - v19;
    *(float *)v13.f64 = y - v20;
    HIDWORD(v15) = LODWORD(v13.f64[0]);
    v21 = v15;
    RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
    v16 = a5;
    renderingModeArgument = self->_renderingModeArgument;
    *(float32x2_t *)&self->_data.data[12] = v14;
    *(_OWORD *)&self->_data.data[20] = v21;
    *(_QWORD *)&self->_data.data[36] = 0;
    *(_DWORD *)&self->_data.data[44] = 1065353216;
    *(float *)&self->_data.data[48] = v16;
    *(float *)&self->_data.data[52] = renderingModeArgument;
    if (a6)
      v18 = v11;
    else
      v18 = 6;
    self->_data.data[56] = v18;
    self->_data.data[57] = v12;
    self->_data.data[58] &= 0xF8u;
    self->_data.type = 1;
  }
}

- (void)setPath:(CGPath *)a3
{
  float64x2_t v3[2];
  uint64_t v4;
  uint64_t v5;

  v3[0] = (float64x2_t)xmmword_209BD5290;
  v3[1] = (float64x2_t)xmmword_209BD52A0;
  v4 = 0;
  v5 = 0;
  -[RBShape _setRBPath:transform:]((unint64_t)self, (uint64_t)a3, (uint64_t)&RBPathCGPathCallbacks, v3);
}

- (unint64_t)_setRBPath:(uint64_t)a3 transform:(float64x2_t *)a4
{
  unint64_t v7;
  int64x2_t v8;
  unint64_t v9;
  unint64_t v10;
  int *v11;
  char v12;
  int v13;
  double v14;
  uint64_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float v18;
  float64x2_t *v19;
  float64x2_t *v20;
  int64x2_t v21;

  if (result)
  {
    v7 = result;
    v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a4[1], (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(*a4, (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(a4[2]));
    v9 = vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0];
    v10 = v9;
    v11 = (int *)(result + 16);
    if (*(_DWORD *)(result + 16) != 2
      || *(_QWORD *)(result + 32) != a2
      || *(_QWORD *)(result + 40) != a3
      || (v19 = (float64x2_t *)((unint64_t)a4 & ~v9), v20 = *(float64x2_t **)(result + 48), v20 != v19)
      && ((v9 & 0x8000000000000000) != 0
       || !v20
       || (v21 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v20[1], *(float64x2_t *)(((unint64_t)a4 & ~v9) + 0x10)), (int8x16_t)vceqq_f64(*v20, *v19)), (int8x16_t)vceqq_f64(v20[2], *(float64x2_t *)(((unint64_t)a4 & ~v9) + 0x20))), (vandq_s8((int8x16_t)vdupq_laneq_s64(v21, 1), (int8x16_t)v21).u64[0] & 0x8000000000000000) == 0)))
    {
      RB::Heap::reset((RB::Heap *)(result + 128), (char *)(result + 168), 256);
      v12 = *(_BYTE *)(v7 + 424);
      v13 = *(_DWORD *)(v7 + 428);
      RBShapeData::apply<RB::DestroyAny>(v11);
      *(_DWORD *)(v7 + 16) = 0;
      v14 = *(double *)(v7 + 432);
      *(_QWORD *)(v7 + 32) = RBPathRetain(a2, a3);
      *(_QWORD *)(v7 + 40) = v15;
      if ((v10 & 0x8000000000000000) != 0)
      {
        result = 0;
      }
      else
      {
        result = (*(_QWORD *)(v7 + 144) + 15) & 0xFFFFFFFFFFFFFFF0;
        if (result + 48 > *(_QWORD *)(v7 + 152))
          result = RB::Heap::alloc_slow((size_t *)(v7 + 128), 0x30uLL, 15);
        else
          *(_QWORD *)(v7 + 144) = result + 48;
        v16 = *a4;
        v17 = a4[2];
        *(float64x2_t *)(result + 16) = a4[1];
        *(float64x2_t *)(result + 32) = v17;
        *(float64x2_t *)result = v16;
      }
      v18 = v14;
      *(_QWORD *)(v7 + 48) = result;
      *(float *)(v7 + 56) = v18;
      *(_BYTE *)(v7 + 60) = v12;
      *(_BYTE *)(v7 + 61) = v13;
      *(_DWORD *)(v7 + 16) = 2;
    }
  }
  return result;
}

- (void)setPath:(CGPath *)a3 transform:(CGAffineTransform *)a4
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6[3];

  v4 = *(float64x2_t *)&a4->c;
  v5 = *(float64x2_t *)&a4->tx;
  v6[0] = *(float64x2_t *)&a4->a;
  v6[1] = v4;
  v6[2] = v5;
  -[RBShape _setRBPath:transform:]((unint64_t)self, (uint64_t)a3, (uint64_t)&RBPathCGPathCallbacks, v6);
}

- (void)setStrokedPath:(CGPath *)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8 dashPhase:(double)a9 dashPattern:(const double *)a10 dashCount:(int64_t)a11
{
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13[3];

  v11 = *(float64x2_t *)&a4->c;
  v12 = *(float64x2_t *)&a4->tx;
  v13[0] = *(float64x2_t *)&a4->a;
  v13[1] = v11;
  v13[2] = v12;
  -[RBShape _setStrokedRBPath:transform:lineWidth:lineCap:lineJoin:miterLimit:dashPhase:dashPattern:dashCount:]((uint64_t)self, (uint64_t)a3, (uint64_t)&RBPathCGPathCallbacks, v13, a6, (CGLineJoin)a7, (double *)a10, a11, a5, a8, a9);
}

- (void)setStrokedPath:(CGPath *)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8
{
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10[3];

  v8 = *(float64x2_t *)&a4->c;
  v9 = *(float64x2_t *)&a4->tx;
  v10[0] = *(float64x2_t *)&a4->a;
  v10[1] = v8;
  v10[2] = v9;
  -[RBShape _setStrokedRBPath:transform:lineWidth:lineCap:lineJoin:miterLimit:dashPhase:dashPattern:dashCount:]((uint64_t)self, (uint64_t)a3, (uint64_t)&RBPathCGPathCallbacks, v10, a6, (CGLineJoin)a7, 0, 0, a5, a8, 0.0);
}

- (void)setGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(unint64_t)a5 font:(CGFont *)a6 renderingStyle:(unsigned int)a7
{
  __n128 v7;
  __n128 v8;

  v7.n128_u64[0] = *MEMORY[0x24BDBF148];
  v8.n128_u64[0] = *(_QWORD *)(MEMORY[0x24BDBF148] + 8);
  -[RBShape _setGlyphs:positions:count:font:renderingStyle:dilation:shouldDrawBitmapRuns:]((uint64_t)self, (size_t)a3, (float64x2_t *)a4, a5, a6, a7, 0, v7, v8);
}

- (void)setCustomGlyphDilation:(CGSize)a3
{
  CGFloat height;

  if (self->_data.type == 4)
  {
    height = a3.height;
    *(float32x2_t *)&self->_data.data[36] = vcvt_f32_f64((float64x2_t)a3);
  }
}

- (void)setShouldDrawBitmapRuns:(BOOL)a3
{
  if (self->_data.type == 4)
    self->_data.data[65] = self->_data.data[65] & 0xFE | a3;
}

- (void)setStroke:(id)a3
{
  int v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  float v10;
  int v11;
  float v12;
  id v14;
  BOOL v15;

  v5 = objc_msgSend(a3, "strokeType");
  v6 = v5;
  if (v5)
  {
    if (v5 != 1)
      abort();
    v7 = rb_alpha_blend_mode(objc_msgSend(a3, "blendMode"));
    v8 = 0;
    v9 = 1;
    v10 = 10.0;
  }
  else
  {
    v8 = rb_line_cap(objc_msgSend(a3, "lineCap"));
    v11 = rb_line_join((CGLineJoin)objc_msgSend(a3, "lineJoin"));
    objc_msgSend(a3, "miterLimit");
    v10 = v12;
    if (v12 <= 0.0 && v11 == 0)
      v9 = 2;
    else
      v9 = v11;
    v7 = 15;
  }
  RB::Heap::reset((RB::Heap *)&self->_heap, (char *)self->_heap._buffer, 256);
  v14 = a3;
  v15 = rb_clip_mode(LOBYTE(self->_renderingMode));
  RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
  self->_data.type = 0;
  *(_QWORD *)&self->_data.data[12] = off_24C229900;
  *(_QWORD *)&self->_data.data[20] = v14;
  *(_QWORD *)&self->_data.data[28] = 0x100000001000000;
  *(int32x2_t *)&self->_data.data[36] = vdup_n_s32(0x7F7FFFFFu);
  self->_data.data[44] = v6;
  self->_data.data[45] = v8;
  self->_data.data[46] = v9;
  self->_data.data[47] = v7;
  self->_data.data[48] = v15;
  *(float *)&self->_data.data[52] = v10;
  self->_data.type = 5;

}

- (BOOL)EOFill
{
  return self->_eoFill;
}

- (unsigned)renderingMode
{
  return self->_renderingMode;
}

- (double)renderingModeArgument
{
  return self->_renderingModeArgument;
}

@end
