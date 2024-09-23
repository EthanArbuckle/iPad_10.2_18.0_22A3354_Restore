@implementation VKVectorOverlayPolylineGroup

- (VKVectorOverlayPolylineGroup)initWithPolylines:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  md::PolylineOverlayStyle *v9;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  os_unfair_lock_s *v14;
  uint32_t v15;
  uint32_t v16;
  os_unfair_lock_s *v17;
  char *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VKVectorOverlayPolylineGroup;
  v5 = -[VKVectorOverlayData init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v6;

    *((_QWORD *)v5 + 8) = 0x4024000000000000;
    *((_QWORD *)v5 + 9) = 0;
    *((_QWORD *)v5 + 10) = 0x3FF0000000000000;
    v8 = operator new(0xE0uLL);
    v8[1] = 0;
    v8[2] = 0;
    *v8 = &off_1E42DC4D8;
    v9 = md::PolylineOverlayStyle::PolylineOverlayStyle((md::PolylineOverlayStyle *)(v8 + 3));
    v10 = (os_unfair_lock_s **)(v5 + 96);
    v11 = (std::__shared_weak_count *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 12) = v9;
    *((_QWORD *)v5 + 13) = v8;
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
    v14 = *v10;
    *(float *)&v15 = *((double *)v5 + 9);
    *(float *)&v16 = *((double *)v5 + 10);
    v17 = *v10 + 49;
    os_unfair_lock_lock(v17);
    v14[38]._os_unfair_lock_opaque = v15;
    v14[39]._os_unfair_lock_opaque = v16;
    os_unfair_lock_unlock(v17);
    v18 = v5;
  }

  return (VKVectorOverlayPolylineGroup *)v5;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)VKVectorOverlayPolylineGroup;
  -[VKVectorOverlayPolylineGroup dealloc](&v3, sel_dealloc);
}

- (void)setBlendMode:(int64_t)a3
{
  PolylineOverlayStyle *ptr;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayPolylineGroup;
  -[VKVectorOverlayData setBlendMode:](&v7, sel_setBlendMode_);
  ptr = self->_style.__ptr_;
  if ((unint64_t)(a3 - 1) < 0x11)
    v6 = a3;
  else
    v6 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *((_DWORD *)ptr + 41) = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
}

- (void)setColorStopColors:(id)a3 locations:(id)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  float *v10;
  char *v11;
  float *v12;
  unint64_t v13;
  PolylineOverlayStyle *ptr;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *i;
  float *v22;
  int64_t v23;
  char *v24;
  char *v25;
  char *v26;
  float *v27;
  char *v28;
  char *v29;
  float *v30;
  float v31;
  BOOL v32;
  BOOL v33;
  unint64_t v34;
  const __CFString *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  float v40;
  CGColorSpace *v41;
  CGColor *CopyByMatchingToColorSpace;
  float v43;
  float v44;
  float v45;
  const CGFloat *Components;
  double v47;
  double v48;
  double v49;
  double v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  float *v54;
  char *v55;
  char *v56;
  VKVectorOverlayPolylineGroup *v57;
  id v58;

  v58 = a3;
  v6 = a4;
  v57 = self;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    if (v7 == objc_msgSend(v58, "count"))
    {
      v8 = objc_msgSend(v6, "count");
      v9 = v8;
      if (v8)
      {
        if (v8 > 0xCCCCCCCCCCCCCCCLL)
          abort();
        v10 = (float *)operator new(20 * v8);
        v11 = (char *)&v10[5 * v9];
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      v34 = 0;
      v35 = (const __CFString *)*MEMORY[0x1E0C9DA10];
      v12 = v10;
      while (1)
      {
        while (1)
        {
          if (v34 >= objc_msgSend(v6, "count", v57))
            goto LABEL_7;
          objc_msgSend(v6, "objectAtIndexedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "floatValue");
          v38 = v37;

          objc_msgSend(v58, "objectAtIndexedSubscript:", v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = 0.0;
          if (v39)
            break;
          v43 = 0.0;
          v44 = 0.0;
          v45 = 0.0;
          if (v12 >= (float *)v11)
            goto LABEL_55;
LABEL_47:
          *v12 = v40;
          v12[1] = v43;
          v12[2] = v44;
          v12[3] = v45;
          *((_DWORD *)v12 + 4) = v38;
          v12 += 5;
          ++v34;
        }
        v41 = CGColorSpaceCreateWithName(v35);
        CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v41, kCGRenderingIntentDefault, (CGColorRef)v39, 0);
        CFRelease(v41);
        v43 = 0.0;
        v44 = 0.0;
        v45 = 0.0;
        if (CopyByMatchingToColorSpace)
        {
          Components = CGColorGetComponents(CopyByMatchingToColorSpace);
          v47 = *Components;
          v48 = Components[1];
          v49 = Components[2];
          v50 = Components[3];
          CGColorRelease(CopyByMatchingToColorSpace);
          v40 = v47;
          v43 = v48;
          v44 = v49;
          v45 = v50;
        }
        if (v12 < (float *)v11)
          goto LABEL_47;
LABEL_55:
        v51 = 0xCCCCCCCCCCCCCCCDLL * (v12 - v10) + 1;
        if (v51 > 0xCCCCCCCCCCCCCCCLL)
          abort();
        if (0x999999999999999ALL * ((v11 - (char *)v10) >> 2) > v51)
          v51 = 0x999999999999999ALL * ((v11 - (char *)v10) >> 2);
        if (0xCCCCCCCCCCCCCCCDLL * ((v11 - (char *)v10) >> 2) >= 0x666666666666666)
          v52 = 0xCCCCCCCCCCCCCCCLL;
        else
          v52 = v51;
        if (v52 > 0xCCCCCCCCCCCCCCCLL)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v53 = (char *)operator new(20 * v52);
        v54 = (float *)&v53[4 * (v12 - v10)];
        *v54 = v40;
        v54[1] = v43;
        v54[2] = v44;
        v54[3] = v45;
        *((_DWORD *)v54 + 4) = v38;
        if (v12 == v10)
        {
          v56 = &v53[4 * (v12 - v10)];
        }
        else
        {
          v55 = &v53[4 * (v12 - v10)];
          do
          {
            v56 = v55 - 20;
            *(_OWORD *)(v55 - 20) = *(_OWORD *)(v12 - 5);
            *((float *)v55 - 1) = *(v12 - 1);
            v12 -= 5;
            v55 -= 20;
          }
          while (v12 != v10);
        }
        v11 = &v53[20 * v52];
        v12 = v54 + 5;
        if (v10)
          operator delete(v10);
        v10 = (float *)v56;
        ++v34;
      }
    }
  }
  v10 = 0;
  v12 = 0;
LABEL_7:
  v13 = 0xCCCCCCCCCCCCCCCDLL * (v12 - v10);
  if (v13 <= 0x10)
  {
    ptr = v57->_style.__ptr_;
    os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
    v15 = (char *)*((_QWORD *)ptr + 21);
    v16 = *((_QWORD *)ptr + 23);
    if (0xCCCCCCCCCCCCCCCDLL * ((v16 - (uint64_t)v15) >> 2) >= v13)
    {
      v20 = (char *)*((_QWORD *)ptr + 22);
      if (0xCCCCCCCCCCCCCCCDLL * ((v20 - v15) >> 2) >= v13)
      {
        v26 = (char *)*((_QWORD *)ptr + 21);
        if (v10 != v12)
        {
          v27 = v10;
          do
          {
            *(float *)v26 = *v27;
            *((float *)v26 + 1) = v27[1];
            *((float *)v26 + 2) = v27[2];
            *((float *)v26 + 3) = v27[3];
            *((float *)v26 + 4) = v27[4];
            v26 += 20;
            v27 += 5;
          }
          while (v27 != v12);
        }
        v23 = v26 - v15;
        v20 = v15;
        goto LABEL_32;
      }
      v24 = (char *)&v10[(v20 - v15) >> 2];
      if (v20 != v15)
      {
        v25 = (char *)v10;
        do
        {
          *(_DWORD *)v15 = *(_DWORD *)v25;
          *((_DWORD *)v15 + 1) = *((_DWORD *)v25 + 1);
          *((_DWORD *)v15 + 2) = *((_DWORD *)v25 + 2);
          *((_DWORD *)v15 + 3) = *((_DWORD *)v25 + 3);
          *((_DWORD *)v15 + 4) = *((_DWORD *)v25 + 4);
          v25 += 20;
          v15 += 20;
        }
        while (v25 != v24);
      }
      for (i = v20; v24 != (char *)v12; v24 += 20)
      {
        *(_OWORD *)i = *(_OWORD *)v24;
        *((_DWORD *)i + 4) = *((_DWORD *)v24 + 4);
        i += 20;
      }
    }
    else
    {
      if (v15)
      {
        *((_QWORD *)ptr + 22) = v15;
        operator delete(v15);
        v16 = 0;
        *((_QWORD *)ptr + 21) = 0;
        *((_QWORD *)ptr + 22) = 0;
        *((_QWORD *)ptr + 23) = 0;
      }
      v17 = 0xCCCCCCCCCCCCCCCDLL * (v16 >> 2);
      v18 = 0x999999999999999ALL * (v16 >> 2);
      if (v18 <= v13)
        v18 = 0xCCCCCCCCCCCCCCCDLL * (v12 - v10);
      if (v17 >= 0x666666666666666)
        v19 = 0xCCCCCCCCCCCCCCCLL;
      else
        v19 = v18;
      if (v19 > 0xCCCCCCCCCCCCCCCLL)
        abort();
      v20 = (char *)operator new(20 * v19);
      *((_QWORD *)ptr + 21) = v20;
      *((_QWORD *)ptr + 22) = v20;
      *((_QWORD *)ptr + 23) = &v20[20 * v19];
      i = v20;
      if (v10 != v12)
      {
        v22 = v10;
        i = v20;
        do
        {
          *(_OWORD *)i = *(_OWORD *)v22;
          *((float *)i + 4) = v22[4];
          i += 20;
          v22 += 5;
        }
        while (v22 != v12);
      }
    }
    v23 = i - v20;
LABEL_32:
    v28 = &v20[v23];
    *((_QWORD *)ptr + 22) = &v20[v23];
    v29 = (char *)*((_QWORD *)ptr + 21);
    if (v29 == v28)
    {
      v32 = 0;
    }
    else
    {
      v30 = (float *)(v29 + 20);
      do
      {
        v31 = *(v30 - 2);
        v32 = v31 < 1.0;
        v33 = v31 < 1.0 || v30 == (float *)v28;
        v30 += 5;
      }
      while (!v33);
    }
    *((_BYTE *)ptr + 192) = v32;
    os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
  }
  if (v10)
    operator delete(v10);

}

- (void)_updateStyleColor
{
  PolylineOverlayStyle *ptr;
  CGColor *color;
  CGColorSpace *v4;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  float32x4_t v7;

  ptr = self->_style.__ptr_;
  color = self->_color;
  v7 = 0u;
  if (color)
  {
    v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, kCGRenderingIntentDefault, color, 0);
    CFRelease(v4);
    if (CopyByMatchingToColorSpace)
    {
      Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
      v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
      CGColorRelease(CopyByMatchingToColorSpace);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *(float32x4_t *)((char *)ptr + 136) = v7;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
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
  PolylineOverlayStyle *ptr;
  float v8;
  double v9;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineWidth = self->_lineWidth;
  self->_lineWidth = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  v8 = a3;
  *((float *)ptr + 33) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
  v9 = vabdd_f64(a3, lineWidth);
  if (v9 > fabs(lineWidth + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)color
{
  unfair_lock *p_propertiesLock;
  CGColor *color;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  color = self->_color;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return color;
}

- (void)setColor:(CGColor *)a3
{
  unfair_lock *p_propertiesLock;
  BOOL v6;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  v6 = CGColorEqualToColor(a3, self->_color);
  CGColorRelease(self->_color);
  self->_color = CGColorRetain(a3);
  -[VKVectorOverlayPolylineGroup _updateStyleColor](self, "_updateStyleColor");
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
  PolylineOverlayStyle *ptr;
  float v8;
  double v9;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  alpha = self->_alpha;
  self->_alpha = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  v8 = a3;
  *((float *)ptr + 40) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
  v9 = vabdd_f64(a3, alpha);
  if (v9 > fabs(alpha + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
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

- (int64_t)lineCap
{
  unfair_lock *p_propertiesLock;
  int64_t lineCap;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineCap = self->_lineCap;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineCap;
}

- (void)setLineCap:(int64_t)a3
{
  unfair_lock *p_propertiesLock;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  if (self->_lineCap != a3)
  {
    self->_lineCap = a3;
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
  PolylineOverlayStyle *ptr;
  float strokeEnd;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_strokeStart = a3;
  ptr = self->_style.__ptr_;
  strokeEnd = self->_strokeEnd;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *(float *)&a3 = a3;
  *((_DWORD *)ptr + 38) = LODWORD(a3);
  *((float *)ptr + 39) = strokeEnd;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
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
  PolylineOverlayStyle *ptr;
  float strokeStart;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_strokeEnd = a3;
  ptr = self->_style.__ptr_;
  strokeStart = self->_strokeStart;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *((float *)ptr + 38) = strokeStart;
  *(float *)&a3 = a3;
  *((_DWORD *)ptr + 39) = LODWORD(a3);
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (shared_ptr<md::PolylineOverlayStyle>)style
{
  PolylineOverlayStyle **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::PolylineOverlayStyle> result;

  cntrl = self->_style.__cntrl_;
  *v2 = self->_style.__ptr_;
  v2[1] = (PolylineOverlayStyle *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PolylineOverlayStyle *)self;
  return result;
}

- (NSArray)polylines
{
  return self->_polylines;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_polylines, 0);
  cntrl = self->_style.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 22) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
