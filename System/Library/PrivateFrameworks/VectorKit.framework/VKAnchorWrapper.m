@implementation VKAnchorWrapper

- (void)layoutWithContext:(const void *)a3
{
  uint64_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = *(id *)a3;
  objc_msgSend(v24, "size");
  v5 = (uint64_t *)*((_QWORD *)a3 + 1);
  v6 = (int8x8_t)v5[1];
  if (!*(_QWORD *)&v6)
  {
    v9 = 0;
    goto LABEL_48;
  }
  v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    v8 = 0x1AF456233693CD46;
    if (*(_QWORD *)&v6 <= 0x1AF456233693CD46uLL)
      v8 = 0x1AF456233693CD46uLL % *(_QWORD *)&v6;
  }
  else
  {
    v8 = (*(_QWORD *)&v6 - 1) & 0x1AF456233693CD46;
  }
  v10 = *v5;
  v11 = *(_QWORD **)(v10 + 8 * v8);
  if (!v11)
    goto LABEL_25;
  v12 = (_QWORD *)*v11;
  if (!v12)
    goto LABEL_25;
  if (v7.u32[0] < 2uLL)
  {
    while (1)
    {
      v14 = v12[1];
      if (v14 == 0x1AF456233693CD46)
      {
        if (v12[2] == 0x1AF456233693CD46)
          goto LABEL_23;
      }
      else if ((v14 & (*(_QWORD *)&v6 - 1)) != v8)
      {
        goto LABEL_25;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_25;
    }
  }
  while (1)
  {
    v13 = v12[1];
    if (v13 == 0x1AF456233693CD46)
      break;
    if (v13 >= *(_QWORD *)&v6)
      v13 %= *(_QWORD *)&v6;
    if (v13 != v8)
      goto LABEL_25;
LABEL_12:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_25;
  }
  if (v12[2] != 0x1AF456233693CD46)
    goto LABEL_12;
LABEL_23:
  v15 = v12[5];
  if (*(_QWORD *)(v15 + 8) == 0x1AF456233693CD46)
  {
    v9 = *(_QWORD *)(v15 + 32);
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
LABEL_26:
  if (v7.u32[0] > 1uLL)
  {
    v16 = 0x63B6FE00C0848868;
    if (*(_QWORD *)&v6 <= 0x63B6FE00C0848868uLL)
      v16 = 0x63B6FE00C0848868uLL % *(_QWORD *)&v6;
  }
  else
  {
    v16 = (*(_QWORD *)&v6 - 1) & 0x63B6FE00C0848868;
  }
  v17 = *(_QWORD **)(v10 + 8 * v16);
  if (!v17)
    goto LABEL_48;
  v18 = (_QWORD *)*v17;
  if (!v18)
    goto LABEL_48;
  if (v7.u32[0] < 2uLL)
  {
    v19 = *(_QWORD *)&v6 - 1;
    while (1)
    {
      v21 = v18[1];
      if (v21 == 0x63B6FE00C0848868)
      {
        if (v18[2] == 0x63B6FE00C0848868)
          goto LABEL_46;
      }
      else if ((v21 & v19) != v16)
      {
        goto LABEL_48;
      }
      v18 = (_QWORD *)*v18;
      if (!v18)
        goto LABEL_48;
    }
  }
  while (1)
  {
    v20 = v18[1];
    if (v20 == 0x63B6FE00C0848868)
      break;
    if (v20 >= *(_QWORD *)&v6)
      v20 %= *(_QWORD *)&v6;
    if (v20 != v16)
      goto LABEL_48;
LABEL_35:
    v18 = (_QWORD *)*v18;
    if (!v18)
      goto LABEL_48;
  }
  if (v18[2] != 0x63B6FE00C0848868)
    goto LABEL_35;
LABEL_46:
  v22 = v18[5];
  if (*(_QWORD *)(v22 + 8) != 0x63B6FE00C0848868)
  {
LABEL_48:
    v23 = 0;
    goto LABEL_49;
  }
  v23 = *(_QWORD *)(v22 + 32);
LABEL_49:
  -[VKAnchorWrapper prepare:cameraContext:anchorContext:](self, "prepare:cameraContext:anchorContext:", v9, v23);

}

- (void)prepare:(CGSize)a3 cameraContext:(const void *)a4 anchorContext:(const AnchorContext *)a5
{
  self->_canvasSize = a3;
  self->_cameraContext = a4;
  if (a5)
    self->_anchorManager = a5->var0;
  -[VKAnchorWrapper _updateCachedPoint](self, "_updateCachedPoint");
}

- (void)_updateCachedPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  char *cameraContext;
  double v8;
  float64x2_t v9;
  double v10;
  int64x2_t v11;
  BOOL v13;
  float64x2_t v18;
  float64x2_t v19;
  char v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  long double v27;
  long double v28;
  long double v29;
  long double v30;
  long double v31;
  long double v32;
  double v33;
  long double v34;
  double v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  int64x2_t v43;
  double v44;

  if (!self->_isUpdating)
  {
    if (self->_cameraContext && self->_anchorManager)
    {
      self->_isUpdating = 1;
      -[VKAnchorWrapper _anchorWithContext:](self, "_anchorWithContext:");
      v3 = (*(double (**)())(*(_QWORD *)v41 + 40))();
      v39 = v5;
      v40 = v4;
      v6 = v3
         + (double)(*(uint64_t (**)(uint64_t, const void *))(*(_QWORD *)v41 + 72))(v41, self->_cameraContext);
      cameraContext = (char *)self->_cameraContext;
      v8 = 1.0
         / (*((double *)cameraContext + 116)
          + *((double *)cameraContext + 104) * v6
          + *((double *)cameraContext + 108) * v40
          + *((double *)cameraContext + 112) * v39);
      v9 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*(float64x2_t *)(cameraContext + 904), *(float64x2_t *)(cameraContext + 808), v6), *(float64x2_t *)(cameraContext + 840), v40), *(float64x2_t *)(cameraContext + 872), v39), v8);
      v10 = v8
          * (*((double *)cameraContext + 115)
           + *((double *)cameraContext + 103) * v6
           + *((double *)cameraContext + 107) * v40
           + *((double *)cameraContext + 111) * v39);
      v11 = vdupq_n_s64(0x7FF8000000000000uLL);
      v43 = v11;
      v13 = *(_QWORD *)&v9.f64[0] == v11.i64[0]
         && *(_QWORD *)&v9.f64[1] == v11.i64[1]
         && *(_QWORD *)&v10 == 0x7FF8000000000000;
      if (v13 || v10 < -1.05 || v10 > 1.05)
      {
        self->_screenPointInCanvas = (CGPoint)vdupq_n_s64(0x43E0000000000000uLL);
      }
      else
      {
        v38 = v6;
        __asm { FMOV            V1.2D, #0.5 }
        v18 = vmulq_f64(v9, _Q1);
        *(_QWORD *)&v19.f64[0] = *(_OWORD *)&vaddq_f64(v18, _Q1);
        v19.f64[1] = vsubq_f64(_Q1, v18).f64[1];
        self->_screenPointInCanvas = (CGPoint)vmulq_f64((float64x2_t)self->_canvasSize, v19);
        v20 = (*(uint64_t (**)())(*(_QWORD *)v41 + 16))();
        v21 = (double *)self->_cameraContext;
        v23 = v21[62];
        v22 = v21[63];
        v24 = v21[64];
        v25 = 1.0;
        if ((v20 & 1) != 0)
        {
          v26 = exp(v40 * 6.28318531 + -3.14159265);
          v27 = atan(v26) * 114.591559 + -90.0;
          v28 = cos(v27 * 0.034906585) * -559.82 + 111132.92;
          v29 = v28 + cos(v27 * 0.0698131701) * 1.175;
          v30 = v29 + cos(v27 * 0.104719755) * -0.0023;
          v31 = v27 * 0.00872664626;
          v32 = tan(v27 * 0.00872664626 + 0.78103484);
          v33 = log(v32);
          v34 = tan(v31 + 0.789761487);
          v25 = fabs((log(v34) - v33) * 0.159154943) / v30;
        }
        v35 = (v38 - v23) * v21[386] + (v40 - v22) * v21[387] + (v39 - v24) * v21[388];
        self->_pointsPerMeter = self->_canvasSize.width * v25 / (v21[470] * (v35 + v35));
        (*(void (**)(int64x2_t *__return_ptr))(*(_QWORD *)v41 + 64))(&v43);
        *(int64x2_t *)&self->_lastCoordinate.latitude._value = v43;
        self->_lastCoordinate.altitude._value = v44;
      }
      self->_isUpdating = 0;
      if (v42)
      {
        p_shared_owners = (unint64_t *)&v42->__shared_owners_;
        do
          v37 = __ldaxr(p_shared_owners);
        while (__stlxr(v37 - 1, p_shared_owners));
        if (!v37)
        {
          ((void (*)())v42->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v42);
        }
      }
    }
    else
    {
      self->_screenPointInCanvas = (CGPoint)vdupq_n_s64(0x43E0000000000000uLL);
    }
  }
}

- (double)pointOffsetForDistanceOffset:(double)a3
{
  return self->_pointsPerMeter * a3;
}

- (void)setFollowsTerrain:(BOOL)a3
{
  self->_followsTerrain = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (CGPoint)pointInLayer:(id)a3 bound:(CGRect)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double x;
  double y;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  v7 = a3;
  v8 = v7;
  x = self->_screenPointInCanvas.x;
  if (x == 9.22337204e18 || (y = self->_screenPointInCanvas.y, y == 9.22337204e18))
  {
LABEL_3:
    y = NAN;
    x = NAN;
    goto LABEL_4;
  }
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MDRenderTarget convertPoint:toLayer:](self->_displayLayer, "convertPoint:toLayer:", v8, self->_screenPointInCanvas.x, self->_screenPointInCanvas.y);
      x = v13;
      y = v14;
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v16 = self->_canvasSize.width;
  v15 = self->_canvasSize.height;
  if (width != v16 || height != v15)
  {
    x = x + (width - v16) * 0.5;
    y = y + (height - v15) * 0.5;
  }
LABEL_4:

  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)destroyAnchor
{
  Anchor *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;

  ptr = self->_anchor.__ptr_;
  if (ptr)
    objc_storeWeak((id *)ptr + 8, 0);
  cntrl = self->_anchor.__cntrl_;
  self->_anchor.__ptr_ = 0;
  self->_anchor.__cntrl_ = 0;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  self->_displayLayer = 0;
  self->_canvasSize = 0u;
  *(_OWORD *)&self->_cameraContext = 0u;
}

- (shared_ptr<md::Anchor>)_anchorWithContext:(void *)a3
{
  Anchor **v3;
  Anchor **v6;
  Anchor *ptr;
  char v8;
  Anchor *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Anchor *v13;
  __shared_weak_count *v14;
  Anchor *v15;
  __shared_weak_count *cntrl;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  shared_ptr<md::Anchor> v22;
  __shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD v32[3];
  shared_ptr<md::Anchor> v33;
  _QWORD v34[3];
  shared_ptr<md::Anchor> result;

  v6 = v3;
  ptr = self->_anchor.__ptr_;
  if (ptr)
  {
    if (*((void **)ptr + 1) == a3)
    {
      v8 = (*(uint64_t (**)(Anchor *, SEL))(*(_QWORD *)ptr + 16))(ptr, a2) ^ (*((_BYTE *)a3 + 8) != 0);
      ptr = self->_anchor.__ptr_;
      if ((v8 & 1) == 0)
      {
        if (((*(uint64_t (**)(Anchor *))(*(_QWORD *)ptr + 24))(ptr) & 1) != 0
          || self->_followsTerrain == (*(unsigned int (**)(Anchor *))(*(_QWORD *)self->_anchor.__ptr_ + 32))(self->_anchor.__ptr_))
        {
          -[VKAnchorWrapper coordinate3D](self, "coordinate3D");
          v9 = self->_anchor.__ptr_;
          v34[0] = v10;
          v34[1] = v11;
          v34[2] = v12;
          v13 = (Anchor *)(*(uint64_t (**)(Anchor *, _QWORD *))(*(_QWORD *)v9 + 88))(v9, v34);
          v15 = self->_anchor.__ptr_;
          if (v15)
            goto LABEL_27;
          goto LABEL_16;
        }
        ptr = self->_anchor.__ptr_;
      }
    }
    v13 = (Anchor *)objc_storeWeak((id *)ptr + 8, 0);
    cntrl = self->_anchor.__cntrl_;
    self->_anchor.__ptr_ = 0;
    self->_anchor.__cntrl_ = 0;
    if (cntrl)
    {
      v17 = (unint64_t *)((char *)cntrl + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (v18)
      {
        v15 = self->_anchor.__ptr_;
        if (v15)
          goto LABEL_27;
      }
      else
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
        v15 = self->_anchor.__ptr_;
        if (v15)
          goto LABEL_27;
      }
    }
  }
LABEL_16:
  -[VKAnchorWrapper coordinate3D](self, "coordinate3D");
  v32[0] = v19;
  v32[1] = v20;
  v32[2] = v21;
  md::AnchorManager::newAnchorAtCoordinate((unint64_t *)&v33, (uint64_t)a3, (uint64_t)v32, self->_followsTerrain);
  v22 = v33;
  v33 = (shared_ptr<md::Anchor>)0;
  v23 = self->_anchor.__cntrl_;
  self->_anchor = v22;
  if (v23)
  {
    v24 = (unint64_t *)((char *)v23 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v23 + 16))(v23);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v23);
    }
  }
  v26 = (std::__shared_weak_count *)v33.__cntrl_;
  if (v33.__cntrl_)
  {
    v27 = (unint64_t *)((char *)v33.__cntrl_ + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v13 = (Anchor *)objc_storeWeak((id *)self->_anchor.__ptr_ + 8, self);
  v15 = self->_anchor.__ptr_;
LABEL_27:
  v29 = self->_anchor.__cntrl_;
  *v6 = v15;
  v6[1] = (Anchor *)v29;
  if (v29)
  {
    v30 = (unint64_t *)((char *)v29 + 8);
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  result.__cntrl_ = v14;
  result.__ptr_ = v13;
  return result;
}

- (void)updateIfNeeded
{
  double v3;
  double v4;
  double v5;

  if (self->_cameraContext)
  {
    if (self->_anchorManager)
    {
      -[VKAnchorWrapper coordinate3D](self, "coordinate3D");
      if (self->_lastCoordinate.latitude._value != v5
        || self->_lastCoordinate.longitude._value != v3
        || self->_lastCoordinate.altitude._value != v4)
      {
        -[VKAnchorWrapper _updateCachedPoint](self, "_updateCachedPoint");
      }
    }
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate3D
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[VKAnchorWrapper coordinate](self, "coordinate");
  v4 = v3;
  v6 = v5;
  -[VKAnchorWrapper elevationOffset](self, "elevationOffset");
  v8 = v7;
  v9 = v4;
  v10 = v6;
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (double)elevationOffset
{
  return 0.0;
}

- (void)setDisplayLayer:(id)a3
{
  self->_displayLayer = (MDRenderTarget *)a3;
}

- (void)dealloc
{
  Anchor *ptr;
  objc_super v4;

  ptr = self->_anchor.__ptr_;
  if (ptr)
    objc_storeWeak((id *)ptr + 8, 0);
  v4.receiver = self;
  v4.super_class = (Class)VKAnchorWrapper;
  -[VKAnchorWrapper dealloc](&v4, sel_dealloc);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = -180.0;
  v3 = -180.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)anchorWorldPointDidChange:(void *)a3
{
  if (self->_cameraContext)
  {
    if (self->_anchorManager)
      -[VKAnchorWrapper _updateCachedPoint](self, "_updateCachedPoint", a3);
  }
}

- (BOOL)followsTerrain
{
  return self->_followsTerrain;
}

- (MDRenderTarget)displayLayer
{
  return self->_displayLayer;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_anchor.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

@end
