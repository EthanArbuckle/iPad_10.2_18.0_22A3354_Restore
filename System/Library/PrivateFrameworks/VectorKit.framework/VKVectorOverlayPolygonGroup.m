@implementation VKVectorOverlayPolygonGroup

- (VKVectorOverlayPolygonGroup)initWithPolygons:(id)a3
{
  id v4;
  char *v5;
  VKVectorOverlayPolygonGroup *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  __int128 v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  VKVectorOverlayPolygonGroup *v20;
  __int128 v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VKVectorOverlayPolygonGroup;
  v5 = -[VKVectorOverlayData init](&v23, sel_init);
  v6 = (VKVectorOverlayPolygonGroup *)v5;
  if (v5)
  {
    v7 = objc_msgSend(v4, "copy");
    v8 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v7;

    *((_QWORD *)v5 + 10) = 0x4024000000000000;
    _ZNSt3__115allocate_sharedB8nn180100IN2md24PolygonOverlayRenderable5StyleENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v22);
    v9 = v5 + 32;
    v10 = v22;
    v22 = 0uLL;
    v11 = (std::__shared_weak_count *)*((_QWORD *)v5 + 5);
    *(_OWORD *)v9 = v10;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
    if (*((_QWORD *)&v22 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = *(os_unfair_lock_s **)(*(_QWORD *)v9 + 32);
    os_unfair_lock_lock(v17 + 49);
    v17[33]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v17 + 49);
    v18 = *(_QWORD *)v9;
    os_unfair_lock_lock((os_unfair_lock_t)(v18 + 24));
    *(_DWORD *)(v18 + 16) = 0;
    v19 = *(os_unfair_lock_s **)(v18 + 32);
    os_unfair_lock_lock(v19 + 49);
    v19[40]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v19 + 49);
    os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 24));
    -[VKVectorOverlayPolygonGroup _updateStyleColor](v6, "_updateStyleColor", (_QWORD)v22);
    v20 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_fillColor);
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)VKVectorOverlayPolygonGroup;
  -[VKVectorOverlayPolygonGroup dealloc](&v3, sel_dealloc);
}

- (void)setBlendMode:(int64_t)a3
{
  os_unfair_lock_s *ptr;
  uint32_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayPolygonGroup;
  -[VKVectorOverlayData setBlendMode:](&v7, sel_setBlendMode_);
  ptr = (os_unfair_lock_s *)self->_style.__ptr_;
  if ((unint64_t)(a3 - 1) < 0x11)
    v6 = a3;
  else
    v6 = 0;
  os_unfair_lock_lock(ptr + 6);
  ptr[5]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(ptr + 6);
}

- (void)_updateStyleColor
{
  Style *ptr;
  CGColor *fillColor;
  float32x4_t v5;
  CFStringRef *v6;
  CGColorSpace *v7;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  int8x16_t v10;
  int32x2_t v11;
  Style *v12;
  CGColor *strokeColor;
  CGColorSpace *v14;
  CGColor *v15;
  float64x2_t *v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int8x16_t v20;

  ptr = self->_style.__ptr_;
  fillColor = self->_fillColor;
  v5 = 0uLL;
  v18 = 0u;
  v6 = (CFStringRef *)MEMORY[0x1E0C9DA10];
  if (fillColor)
  {
    v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, fillColor, 0);
    CFRelease(v7);
    v5 = 0uLL;
    if (CopyByMatchingToColorSpace)
    {
      Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
      v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
      CGColorRelease(CopyByMatchingToColorSpace);
      v5 = v19;
    }
  }
  v20 = (int8x16_t)v5;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 6);
  v10 = v20;
  *(int8x16_t *)ptr = v20;
  v10.i32[0] = vextq_s8(v10, v10, 8uLL).u32[0];
  v11 = vceq_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 0), *(float32x2_t *)v10.i8);
  ptr[48] = v11.i8[4] & v11.i8[0] & 1;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 6);
  v12 = self->_style.__ptr_;
  strokeColor = self->_strokeColor;
  if (strokeColor)
  {
    v14 = CGColorSpaceCreateWithName(*v6);
    v15 = CGColorCreateCopyByMatchingToColorSpace(v14, kCGRenderingIntentDefault, strokeColor, 0);
    CFRelease(v14);
    if (v15)
    {
      v16 = (float64x2_t *)CGColorGetComponents(v15);
      v18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v16), v16[1]);
      CGColorRelease(v15);
    }
  }
  v17 = *((_QWORD *)v12 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v17 + 196));
  *(float32x4_t *)(v17 + 136) = v18;
  os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 196));
}

- (double)lineWidth
{
  unfair_lock *p_propertiesLock;
  double lineWidth;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineWidth = self->_lineWidth;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineWidth;
}

- (void)setLineWidth:(double)a3
{
  unfair_lock *p_propertiesLock;
  double lineWidth;
  float v7;
  uint64_t v8;
  double v9;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineWidth = self->_lineWidth;
  self->_lineWidth = a3;
  v8 = *((_QWORD *)self->_style.__ptr_ + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 196));
  v7 = a3;
  *(float *)(v8 + 132) = v7;
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 196));
  v9 = vabdd_f64(a3, lineWidth);
  if (v9 > fabs(lineWidth + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (int64_t)lineJoin
{
  unfair_lock *p_propertiesLock;
  int64_t lineJoin;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineJoin = self->_lineJoin;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineJoin;
}

- (void)setLineJoin:(int64_t)a3
{
  unfair_lock *p_propertiesLock;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  if (self->_lineJoin != a3)
  {
    self->_lineJoin = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 1);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)miterLimit
{
  unfair_lock *p_propertiesLock;
  double miterLimit;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  miterLimit = self->_miterLimit;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  unfair_lock *p_propertiesLock;
  double miterLimit;
  double v7;
  BOOL v8;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  miterLimit = self->_miterLimit;
  v7 = vabdd_f64(a3, miterLimit);
  self->_miterLimit = a3;
  v8 = v7 <= fabs(miterLimit + a3) * 2.22044605e-14 || v7 < 2.22507386e-308;
  if (!v8 && self->_lineJoin == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 1);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)fillColor
{
  unfair_lock *p_propertiesLock;
  CGColor *fillColor;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  fillColor = self->_fillColor;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return fillColor;
}

- (void)setFillColor:(CGColor *)a3
{
  unfair_lock *p_propertiesLock;
  BOOL v6;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  v6 = CGColorEqualToColor(a3, self->_fillColor);
  CGColorRelease(self->_fillColor);
  self->_fillColor = CGColorRetain(a3);
  -[VKVectorOverlayPolygonGroup _updateStyleColor](self, "_updateStyleColor");
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)strokeColor
{
  unfair_lock *p_propertiesLock;
  CGColor *strokeColor;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  strokeColor = self->_strokeColor;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeColor;
}

- (void)setStrokeColor:(CGColor *)a3
{
  unfair_lock *p_propertiesLock;
  BOOL v6;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  v6 = CGColorEqualToColor(a3, self->_strokeColor);
  CGColorRelease(self->_strokeColor);
  self->_strokeColor = CGColorRetain(a3);
  -[VKVectorOverlayPolygonGroup _updateStyleColor](self, "_updateStyleColor");
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)alpha
{
  unfair_lock *p_propertiesLock;
  double alpha;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  alpha = self->_alpha;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return alpha;
}

- (void)setAlpha:(double)a3
{
  unfair_lock *p_propertiesLock;
  double alpha;
  Style *ptr;
  float v8;
  uint64_t v9;
  double v10;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  alpha = self->_alpha;
  self->_alpha = a3;
  ptr = self->_style.__ptr_;
  v8 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 6);
  *((float *)ptr + 4) = v8;
  v9 = *((_QWORD *)ptr + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 196));
  *(float *)(v9 + 160) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 196));
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 6);
  v10 = vabdd_f64(a3, alpha);
  if (v10 > fabs(alpha + a3) * 2.22044605e-14 && v10 >= 2.22507386e-308)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)strokeStart
{
  unfair_lock *p_propertiesLock;
  double strokeStart;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  strokeStart = self->_strokeStart;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeStart;
}

- (void)setStrokeStart:(double)a3
{
  unfair_lock *p_propertiesLock;
  float strokeEnd;
  uint64_t v7;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_strokeStart = a3;
  strokeEnd = self->_strokeEnd;
  v7 = *((_QWORD *)self->_style.__ptr_ + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 196));
  *(float *)&a3 = a3;
  *(_DWORD *)(v7 + 152) = LODWORD(a3);
  *(float *)(v7 + 156) = strokeEnd;
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 196));
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)strokeEnd
{
  unfair_lock *p_propertiesLock;
  double strokeEnd;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  strokeEnd = self->_strokeEnd;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeEnd;
}

- (void)setStrokeEnd:(double)a3
{
  unfair_lock *p_propertiesLock;
  float strokeStart;
  uint64_t v7;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_strokeEnd = a3;
  strokeStart = self->_strokeStart;
  v7 = *((_QWORD *)self->_style.__ptr_ + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 196));
  *(float *)(v7 + 152) = strokeStart;
  *(float *)&a3 = a3;
  *(_DWORD *)(v7 + 156) = LODWORD(a3);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 196));
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (NSArray)polygons
{
  return self->_polygons;
}

- (shared_ptr<md::PolygonOverlayRenderable::Style>)_style
{
  Style **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::PolygonOverlayRenderable::Style> result;

  cntrl = self->_style.__cntrl_;
  *v2 = self->_style.__ptr_;
  v2[1] = (Style *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Style *)self;
  return result;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  cntrl = self->_style.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_polygons, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end
