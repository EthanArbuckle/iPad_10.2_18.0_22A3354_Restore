@implementation RBStrokeAccumulator

- (RBStrokeAccumulator)init
{
  RBStrokeAccumulator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBStrokeAccumulator;
  result = -[RBStrokeAccumulator init](&v3, sel_init);
  if (result)
  {
    result->_imageScale = 1.0;
    result->_imageCount = 1;
    *(_OWORD *)&result->_strokeType = xmmword_209BD6AE0;
    *(_QWORD *)&result->_miterLimit = 1092616192;
    result->_seed = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBStrokeAccumulator *v4;
  RBStrokeAccumulator *v5;
  vector<RBStrokeElement, 0UL, unsigned long> *p_elements;
  unint64_t size;
  unsigned __int8 *p;
  unint64_t v9;
  unsigned __int8 *v10;
  unint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;
  float *v14;
  unint64_t v15;
  float *v16;
  unint64_t v17;
  int v18;
  CGImage *v19;
  CGImage *v20;
  CGImage *v21;
  CGSize v22;

  v4 = objc_alloc_init(RBStrokeAccumulator);
  v5 = v4;
  if (!v4)
    return v5;
  p_elements = &v4->_elements;
  v4->_elements._size = 0;
  p = self->_elements._p;
  size = self->_elements._size;
  if (v4->_elements._capacity < size)
  {
    RB::vector<unsigned char,0ul,unsigned long>::reserve_slow((uint64_t)&v4->_elements, self->_elements._size);
    v9 = v5->_elements._size;
  }
  else
  {
    v9 = 0;
    if (!size)
      goto LABEL_6;
  }
  v10 = p_elements->_p;
  v11 = size;
  do
  {
    v12 = *p++;
    v10[v9] = v12;
    ++v10;
    --v11;
  }
  while (v11);
LABEL_6:
  v5->_elements._size = v9 + size;
  v5->_values._size = 0;
  v14 = self->_values._p;
  v13 = self->_values._size;
  if (v5->_values._capacity < v13)
  {
    RB::vector<float,0ul,unsigned long>::reserve_slow((uint64_t)&v5->_values, self->_values._size);
    v15 = v5->_values._size;
LABEL_8:
    v16 = &v5->_values._p[v15];
    v17 = v13;
    do
    {
      v18 = *(_DWORD *)v14++;
      *(_DWORD *)v16++ = v18;
      --v17;
    }
    while (v17);
    goto LABEL_10;
  }
  v15 = 0;
  if (v13)
    goto LABEL_8;
LABEL_10:
  v5->_values._size = v15 + v13;
  v19 = self->_image._p;
  v20 = v5->_image._p;
  if (v20 != v19)
  {
    if (v20)
      CFRelease(v20);
    if (v19)
      v21 = (CGImage *)CFRetain(v19);
    else
      v21 = 0;
    v5->_image._p = v21;
  }
  v5->_imageScale = self->_imageScale;
  v5->_imageCount = self->_imageCount;
  *(_OWORD *)&v5->_strokeType = *(_OWORD *)&self->_strokeType;
  v5->_miterLimit = self->_miterLimit;
  v5->_seed = self->_seed;
  if (self->_hasBounds)
  {
    v22 = self->_bounds.size;
    v5->_bounds.origin = self->_bounds.origin;
    v5->_bounds.size = v22;
    v5->_borderWidth = self->_borderWidth;
    v5->_hasBounds = 1;
  }
  v5->_rotatesImage = self->_rotatesImage;
  return v5;
}

- (id)commit
{
  *((_BYTE *)self + 149) = 1;
  return self;
}

- (void)addElement:(unsigned __int8)a3 args:(const float *)a4
{
  unsigned int v5;
  unint64_t size;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float maxLineWidth;

  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, a3, a4);
  v5 = a3;
  size = self->_elements._size;
  v8 = size + 1;
  if (self->_elements._capacity < size + 1)
  {
    RB::vector<unsigned char,0ul,unsigned long>::reserve_slow((uint64_t)&self->_elements, v8);
    size = self->_elements._size;
    v8 = size + 1;
  }
  self->_elements._p[size] = v5;
  self->_elements._size = v8;
  if (v5 <= 0xF && v5 != 4)
  {
    v9 = 0;
    v10 = RB::Stroke::element_args(RBStrokeElement)::elts[v5];
    v11 = self->_values._size;
    do
    {
      v12 = v11 + 1;
      if (self->_values._capacity < v11 + 1)
      {
        RB::vector<float,0ul,unsigned long>::reserve_slow((uint64_t)&self->_values, v12);
        v11 = self->_values._size;
        v12 = v11 + 1;
      }
      self->_values._p[v11] = a4[v9];
      self->_values._size = v12;
      ++v9;
      v11 = v12;
    }
    while (v10 != v9);
    if (v5 == 5)
    {
      maxLineWidth = self->_maxLineWidth;
      if (maxLineWidth < *a4)
        maxLineWidth = *a4;
      self->_maxLineWidth = maxLineWidth;
    }
  }
}

- (void)addPath:(CGPath *)a3 transform:(CGAffineTransform *)a4
{
  __int128 v4;
  RBStrokeAccumulator *info;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, a3, a4);
  info = self;
  v4 = *(_OWORD *)&a4->c;
  v6 = *(_OWORD *)&a4->a;
  v7 = v4;
  v8 = *(_OWORD *)&a4->tx;
  CGPathApply(a3, &info, (CGPathApplierFunction)-[RBStrokeAccumulator addPath:transform:]::$_0::__invoke);
}

- (void)removeAllElements
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2);
  self->_elements._size = 0;
  self->_values._size = 0;
  self->_maxLineWidth = 0.0;
}

- (int)strokeType
{
  return self->_strokeType;
}

- (void)setStrokeType:(int)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, *(_QWORD *)&a3);
  self->_strokeType = a3;
}

- (CGImage)image
{
  return self->_image._p;
}

- (void)setImage:(CGImage *)a3
{
  CGImage *p;
  CGImage *v6;

  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  p = self->_image._p;
  if (p != a3)
  {
    if (p)
      CFRelease(p);
    if (a3)
      v6 = (CGImage *)CFRetain(a3);
    else
      v6 = 0;
    self->_image._p = v6;
  }
}

- (float)imageScale
{
  return self->_imageScale;
}

- (void)setImageScale:(float)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2);
  self->_imageScale = a3;
}

- (unint64_t)imageCount
{
  return self->_imageCount;
}

- (void)setImageCount:(unint64_t)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  self->_imageCount = a3;
}

- (BOOL)rotatesImage
{
  return self->_rotatesImage;
}

- (void)setRotatesImage:(BOOL)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  self->_rotatesImage = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, *(_QWORD *)&a3);
  self->_blendMode = a3;
}

- (int)lineCap
{
  return self->_lineCap;
}

- (void)setLineCap:(int)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, *(_QWORD *)&a3);
  self->_lineCap = a3;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (void)setLineJoin:(int)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, *(_QWORD *)&a3);
  self->_lineJoin = a3;
}

- (float)miterLimit
{
  return self->_miterLimit;
}

- (void)setMiterLimit:(float)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2);
  self->_miterLimit = a3;
}

- (float)maxLineWidth
{
  return self->_maxLineWidth;
}

- (int64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(int64_t)a3
{
  if (self->_committed)
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  self->_seed = a3;
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->_hasBounds)
  {
    x = self->_bounds.origin.x;
    y = self->_bounds.origin.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
  }
  else
  {
    RBStrokeBoundingRect(self, &self->_borderWidth);
    self->_bounds.origin.x = x;
    self->_bounds.origin.y = y;
    self->_bounds.size.width = width;
    self->_bounds.size.height = height;
    self->_hasBounds = 1;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)borderWidth
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  if (!self->_hasBounds)
  {
    RBStrokeBoundingRect(self, &self->_borderWidth);
    self->_bounds.origin.x = v3;
    self->_bounds.origin.y = v4;
    self->_bounds.size.width = v5;
    self->_bounds.size.height = v6;
    self->_hasBounds = 1;
  }
  return self->_borderWidth;
}

- (void)applyFunction:(void *)a3 info:(void *)a4
{
  unint64_t size;

  size = self->_elements._size;
  if (size)
    ((void (*)(unint64_t, unsigned __int8 *, float *, void *))a3)(size, self->_elements._p, self->_values._p, a4);
}

- (void).cxx_destruct
{
  CGImage *p;
  float *v4;
  unsigned __int8 *v5;

  p = self->_image._p;
  if (p)
    CFRelease(p);
  v4 = self->_values._p;
  if (v4)
    free(v4);
  v5 = self->_elements._p;
  if (v5)
    free(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)addPath:(uint64_t)a1 transform:(uint64_t)a2
{
  uint64_t v2;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  switch(*(_DWORD *)a2)
  {
    case 0:
      v2 = 0;
      v34 = (unint64_t)vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 8), **(double **)(a2 + 8)), *(float64x2_t *)(a1 + 24), *(double *)(*(_QWORD *)(a2 + 8) + 8)));
      break;
    case 1:
      v34 = (unint64_t)vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 8), **(double **)(a2 + 8)), *(float64x2_t *)(a1 + 24), *(double *)(*(_QWORD *)(a2 + 8) + 8)));
      v2 = 1;
      break;
    case 2:
      v3 = *(double **)(a2 + 8);
      v4 = v3[1];
      v5 = *(double *)(a1 + 8);
      v6 = *(double *)(a1 + 16);
      v7 = *(double *)(a1 + 24);
      v8 = *(double *)(a1 + 32);
      v9 = *(double *)(a1 + 40);
      v10 = *(double *)(a1 + 48);
      v11 = v10 + v6 * *v3 + v8 * v4;
      *(float *)&v4 = v9 + v5 * *v3 + v7 * v4;
      *(float *)&v11 = v11;
      v34 = __PAIR64__(LODWORD(v11), LODWORD(v4));
      v12 = v3[2];
      v13 = v3[3];
      v14 = v9 + v12 * v5 + v13 * v7;
      v15 = v10 + v12 * v6 + v13 * v8;
      *(float *)&v13 = v14;
      *(float *)&v15 = v15;
      v35 = LODWORD(v13);
      v36 = LODWORD(v15);
      v2 = 2;
      break;
    case 3:
      v16 = *(double **)(a2 + 8);
      v17 = v16[1];
      v18 = *(double *)(a1 + 8);
      v19 = *(double *)(a1 + 16);
      v20 = *(double *)(a1 + 24);
      v21 = *(double *)(a1 + 32);
      v22 = *(double *)(a1 + 40);
      v23 = *(double *)(a1 + 48);
      v24 = v23 + v19 * *v16 + v21 * v17;
      *(float *)&v17 = v22 + v18 * *v16 + v20 * v17;
      *(float *)&v24 = v24;
      v34 = __PAIR64__(LODWORD(v24), LODWORD(v17));
      v25 = v16[2];
      v26 = v16[3];
      v27 = v22 + v25 * v18 + v26 * v20;
      v28 = v23 + v25 * v19 + v26 * v21;
      *(float *)&v26 = v27;
      *(float *)&v28 = v28;
      v35 = LODWORD(v26);
      v36 = LODWORD(v28);
      v29 = v16[4];
      v30 = v16[5];
      v31 = v22 + v29 * v18 + v30 * v20;
      v32 = v23 + v29 * v19 + v30 * v21;
      *(float *)&v30 = v31;
      *(float *)&v32 = v32;
      v37 = LODWORD(v30);
      v38 = LODWORD(v32);
      v2 = 3;
      break;
    case 4:
      v2 = 4;
      break;
    default:
      v2 = 0;
      break;
  }
  return objc_msgSend(*(id *)a1, "addElement:args:", v2, &v34);
}

@end
