@implementation RBSymbolAnimator

- (unsigned)styleMask
{
  return RB::Symbol::Animator::style_mask(&self->_animator._lock._lock);
}

- (unsigned)version
{
  return *(_DWORD *)&self->_anon_38[12];
}

- (BOOL)isAnimating
{
  return RB::Symbol::Animator::animating(&self->_animator._lock._lock);
}

- (CUINamedVectorGlyph)glyph
{
  return (CUINamedVectorGlyph *)RB::Symbol::Animator::glyph(&self->_animator._lock._lock);
}

- (void)notifyObservers
{
  void **v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  size_t v8;
  size_t v9;
  _BYTE *v10;
  _QWORD *v11;
  void *v12;
  _BYTE *v13;
  size_t v14;
  id *v15;
  _QWORD *v16;
  _QWORD *v17;
  size_t v18;
  id *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  size_t v24;
  _QWORD *v25;
  _BYTE *v26;
  size_t v27;
  id *v28;
  _BYTE v29[64];
  void *v30;
  size_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (a1 && (*(_BYTE *)(a1 + 120) & 1) != 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 4;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if (*(_QWORD *)(a1 + 104))
      v2 = *(void ***)(a1 + 104);
    else
      v2 = (void **)(a1 + 88);
    v3 = *(unsigned int *)(a1 + 112);
    if ((_DWORD)v3)
    {
      v4 = 8 * v3;
      do
      {
        v5 = *v2;
        v6 = (id)a1;
        v7 = v5;
        v8 = v31;
        v9 = v31 + 1;
        if (v32 < v31 + 1)
        {
          RB::vector<std::pair<RB::objc_ptr<RBSymbolAnimator *>,RB::objc_ptr<objc_object  {objcproto24RBSymbolAnimatorObserver}*>>,4ul,unsigned long>::reserve_slow(v29, v9);
          v8 = v31;
          v9 = v31 + 1;
        }
        v10 = v30;
        if (!v30)
          v10 = v29;
        v11 = &v10[16 * v8];
        *v11 = v6;
        v11[1] = v7;
        v31 = v9;
        ++v2;
        v4 -= 8;
      }
      while (v4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 120) = 0;
    if (!v31)
      goto LABEL_37;
    if (pthread_main_np())
    {
      v12 = v30;
      v13 = v29;
      if (v30)
        v13 = v30;
      if (!v31)
        goto LABEL_38;
      v14 = 16 * v31;
      v15 = (id *)(v13 + 8);
      do
      {
        objc_msgSend(*v15, "symbolAnimatorDidChange:", *v15);
        v15 += 2;
        v14 -= 16;
      }
      while (v14);
      goto LABEL_32;
    }
    v16 = (_QWORD *)operator new();
    v17 = v16;
    v16[8] = 0;
    v16[9] = 0;
    v16[10] = 4;
    v18 = v31;
    if (v30)
      v19 = (id *)v30;
    else
      v19 = (id *)v29;
    if (v31 >= 5)
    {
      RB::vector<std::pair<RB::objc_ptr<RBSymbolAnimator *>,RB::objc_ptr<objc_object  {objcproto24RBSymbolAnimatorObserver}*>>,4ul,unsigned long>::reserve_slow(v16, v31);
      v20 = (_QWORD *)v17[8];
      v21 = v17[9];
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      if (!v31)
      {
LABEL_31:
        v17[9] = v22 + v18;
        dispatch_async_f(MEMORY[0x24BDAC9B8], v17, (dispatch_function_t)-[RBSymbolAnimator notifyObservers]::$_0::__invoke);
LABEL_32:
        v12 = v30;
        v26 = v29;
        if (v30)
          v26 = v30;
        if (!v31)
          goto LABEL_38;
        v27 = 0;
        v28 = (id *)(v26 + 8);
        do
        {

          ++v27;
          v28 += 2;
        }
        while (v27 < v31);
LABEL_37:
        v12 = v30;
LABEL_38:
        if (v12)
          free(v12);
        return;
      }
    }
    if (!v20)
      v20 = v17;
    v23 = &v20[2 * v21];
    v24 = v18;
    do
    {
      v25 = std::pair<RB::objc_ptr<RBSymbolAnimator *>,RB::objc_ptr<objc_object  {objcproto24RBSymbolAnimatorObserver}*>>::pair[abi:nn180100](v23, v19);
      v19 += 2;
      v23 = v25 + 2;
      --v24;
    }
    while (v24);
    v22 = v17[9];
    goto LABEL_31;
  }
}

- (unsigned)renderingMode
{
  return RB::Symbol::Animator::rendering_mode(&self->_animator._lock._lock);
}

- (void)setPresentationPosition:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  if (RB::Symbol::Animator::set_presentation_position((uint64_t)&self->_animator, vcvt_f32_f64((float64x2_t)a3)))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (id).cxx_construct
{
  RB::Symbol::Animator::Animator((RB::Symbol::Animator *)&self->_animator);
  self->_lock._lock._os_unfair_lock_opaque = 0;
  self->_observers._p_2 = 0;
  *(_QWORD *)&self->_observers.var0 = 0x200000000;
  self->_needs_notify.__a_.__a_value = 0;
  return self;
}

- (void)setVariableValue:(double)a3
{
  float v4;

  v4 = a3;
  if (RB::Symbol::Animator::set_variable_value(&self->_animator._lock._lock, v4))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setSize:(CGSize)a3
{
  CGFloat height;

  height = a3.height;
  if (RB::Symbol::Animator::set_size(&self->_animator._lock._lock, vcvt_f32_f64((float64x2_t)a3)))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setAnchorPoint:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  if (RB::Symbol::Animator::set_anchor_point(&self->_animator._lock._lock, vcvt_f32_f64((float64x2_t)a3)))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setGlyph:(id)a3
{
  if (RB::Symbol::Animator::set_glyph((RB::Symbol::Animator *)&self->_animator, (CUINamedVectorGlyph *)a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setPosition:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  if (RB::Symbol::Animator::set_position(&self->_animator._lock._lock, vcvt_f32_f64((float64x2_t)a3)))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setRenderingMode:(unsigned int)a3
{
  if (RB::Symbol::Animator::set_rendering_mode((uint64_t)&self->_animator, a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (CGRect)alignmentRect
{
  float32x2_t *v2;
  int32x4_t v3;
  float32x2_t v4;
  uint32x2_t v5;
  int32x4_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  double v10;
  double v11;
  CGRect result;

  v2 = (float32x2_t *)RB::Symbol::Model::glyph_info((RB::Symbol::Model *)self->_animator._model._p);
  v3.i32[0] = 0;
  v4 = v2[10];
  v5 = (uint32x2_t)vcgtz_f32(v4);
  *(uint32x2_t *)v6.i8 = vpmin_u32(v5, v5);
  v7 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v3, v6), 0);
  v8 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v4), *(int8x16_t *)(MEMORY[0x24BDBF070] + 16));
  v9 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v2[9]), *MEMORY[0x24BDBF070]);
  v10 = *(double *)&v9.i64[1];
  v11 = *(double *)&v8.i64[1];
  result.size.width = *(double *)v8.i64;
  result.origin.x = *(double *)v9.i64;
  result.size.height = v11;
  result.origin.y = v10;
  return result;
}

- (_RBSymbolUpdate)beginUpdateWithRenderingMode:(unsigned int)a3 position:(const CGPoint *)a4 size:(const CGSize *)a5 flags:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v11;
  _QWORD *v12;
  CGPoint v13;
  float32x2_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a3;
  v11 = RB::Symbol::Presentation::shared((RB::Symbol::Presentation *)self);
  os_unfair_lock_lock((os_unfair_lock_t)v11);
  v12 = *(_QWORD **)(v11 + 8);
  if (v12)
    *(_QWORD *)(v11 + 8) = *v12;
  else
    v12 = malloc_type_malloc(0x820uLL, 0x9E39E26DuLL);
  os_unfair_lock_unlock((os_unfair_lock_t)v11);
  if (!a4)
  {
    v13.x = 0.0;
    if (a5)
      goto LABEL_6;
LABEL_8:
    v14 = 0;
    v15 = 0;
    return (_RBSymbolUpdate *)RB::Symbol::Presentation::Presentation(v12, &self->_animator, *(_QWORD *)&v14, v15, v9, v6, (__n128)v13);
  }
  v13 = *a4;
  *(float32x2_t *)&v13.x = vcvt_f32_f64(*(float64x2_t *)a4);
  if (!a5)
    goto LABEL_8;
LABEL_6:
  v14 = vcvt_f32_f64(*(float64x2_t *)a5);
  v15 = 1;
  return (_RBSymbolUpdate *)RB::Symbol::Presentation::Presentation(v12, &self->_animator, *(_QWORD *)&v14, v15, v9, v6, (__n128)v13);
}

- (void)endUpdate:(_RBSymbolUpdate *)a3
{
  uint64_t v4;

  v4 = RB::Symbol::Presentation::shared((RB::Symbol::Presentation *)self);
  RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)a3);
  os_unfair_lock_lock((os_unfair_lock_t)v4);
  *(_QWORD *)a3 = *(_QWORD *)(v4 + 8);
  *(_QWORD *)(v4 + 8) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)v4);
}

- (double)variableValue
{
  return RB::Symbol::Animator::variable_value(&self->_animator._lock._lock);
}

- (void)dealloc
{
  objc_super v3;

  RB::Symbol::Animator::remove_all_animations(&self->_animator._lock._lock);
  v3.receiver = self;
  v3.super_class = (Class)RBSymbolAnimator;
  -[RBSymbolAnimator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  _size **p_2;
  Animation *p;
  unint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  Model *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;

  p_2 = self->_observers._p_2;
  if (p_2)
    free(p_2);
  p = self->_animator._animations._p;
  if (self->_animator._animations._size)
  {
    v5 = 0;
    do
    {
      v6 = *(unsigned int **)&p[2].terms_and_args._p[88 * v5 + 16];
      if (v6)
      {
        v7 = v6 + 2;
        do
        {
          v8 = __ldxr(v7);
          v9 = v8 - 1;
        }
        while (__stlxr(v9, v7));
        if (!v9)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
        }
      }
      v10 = (char *)p + 88 * v5;
      v13 = *((_QWORD *)v10 + 9);
      v11 = v10 + 72;
      v12 = v13;
      *v11 = 0;
      if (v13)
        std::default_delete<RB::Symbol::Animation::Timing>::operator()[abi:nn180100]((uint64_t)v11, v12);

    }
    while (v5 < self->_animator._animations._size);
    p = self->_animator._animations._p;
  }
  if (p)
    free(p);
  v14 = self->_animator._model._p;
  if (v14)
  {
    v15 = (unsigned int *)((char *)v14 + 8);
    do
    {
      v16 = __ldxr(v15);
      v17 = v16 - 1;
    }
    while (__stlxr(v17, v15));
    if (!v17)
    {
      __dmb(9u);
      (*(void (**)(Model *))(*(_QWORD *)v14 + 8))(v14);
    }
  }
}

- (void)addObserver:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v5 = *(_QWORD *)(a1 + 104);
    if (v5)
      v6 = *(_QWORD **)(a1 + 104);
    else
      v6 = (_QWORD *)(a1 + 88);
    v7 = *(unsigned int *)(a1 + 112);
    if ((_DWORD)v7)
    {
      v8 = 8 * v7;
      while (*v6 != a2)
      {
        ++v6;
        v8 -= 8;
        if (!v8)
          goto LABEL_9;
      }
    }
    else
    {
LABEL_9:
      if (*(_DWORD *)(a1 + 116) < (v7 + 1))
      {
        RB::vector<objc_object  {objcproto24RBSymbolAnimatorObserver}*,2ul,unsigned int>::reserve_slow((void *)(a1 + 88), v7 + 1);
        v5 = *(_QWORD *)(a1 + 104);
        v7 = *(unsigned int *)(a1 + 112);
      }
      if (!v5)
        v5 = a1 + 88;
      *(_QWORD *)(v5 + 8 * v7) = a2;
      ++*(_DWORD *)(a1 + 112);
      *(_BYTE *)(a1 + 120) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)removeObserver:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v5 = *(unsigned int *)(a1 + 112);
    if ((_DWORD)v5)
    {
      v6 = 0;
      v7 = 8 * v5;
      do
      {
        v8 = *(_QWORD *)(a1 + 104);
        if (!v8)
          v8 = a1 + 88;
        if (*(_QWORD *)(v8 + v6) == a2)
        {
          v9 = v5 - 1;
          *(_QWORD *)(v8 + v6) = *(_QWORD *)(v8 + 8 * v9);
          *(_QWORD *)(v8 + 8 * v9) = a2;
          LODWORD(v5) = *(_DWORD *)(a1 + 112) - 1;
          *(_DWORD *)(a1 + 112) = v5;
        }
        v6 += 8;
      }
      while (v7 != v6);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (uint64_t)unblockObservers
{
  if (result)
    *(_BYTE *)(result + 120) = 1;
  return result;
}

- (BOOL)flipsRightToLeft
{
  return RB::Symbol::Animator::flips_rtl(&self->_animator._lock._lock);
}

- (void)setFlipsRightToLeft:(BOOL)a3
{
  if (RB::Symbol::Animator::set_flips_rtl(&self->_animator._lock._lock, a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- ($4C453035CF9D444C7FDAB91FAAAE42FC)transform
{
  double v2;
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  $4C453035CF9D444C7FDAB91FAAAE42FC result;

  v2 = RB::Symbol::Animator::transform(&self->_animator._lock._lock);
  v3 = *((float *)&v2 + 1);
  v5 = v4;
  v7 = v6;
  v8 = *(float *)&v2;
  v9 = v3;
  result.var1.dy = v7;
  result.var1.dx = v5;
  result.var0.dy = v9;
  result.var0.dx = v8;
  return result;
}

- (void)setTransform:(id)a3
{
  CGFloat dy;
  CGFloat v5;
  Transform var20;

  dy = a3.var0.dy;
  v5 = a3.var1.dy;
  *(float32x2_t *)var20._terms._p = vcvt_f32_f64((float64x2_t)a3.var0);
  *(float32x2_t *)&var20._terms._p[8] = vcvt_f32_f64((float64x2_t)a3.var1);
  if (RB::Symbol::Animator::set_transform(&self->_animator._lock._lock, &var20))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorForStyle:(unsigned int)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v3 = RB::Symbol::Animator::color((uint64_t)&self->_animator, a3);
  result.var3 = v6;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)setColor:(id)a3 forStyle:(unsigned int)a4
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 v5;

  v5 = a3;
  if (RB::Symbol::Animator::set_color(&self->_animator._lock._lock, a4, (float32x4_t *)&v5))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)opacities
{
  float v2;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 0, v2);
  v5 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 1uLL, v4);
  v6 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 2uLL, v5);
  v7 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 3uLL, v6);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.var3 = v7;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)setOpacities:(id)a3
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 v4;

  v4 = a3;
  if (RB::Symbol::Animator::set_alpha(&self->_animator._lock._lock, &v4.var0, 4uLL))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (BOOL)isHidden
{
  return RB::Symbol::Animator::hidden(&self->_animator._lock._lock);
}

- (void)setHidden:(BOOL)a3
{
  if (RB::Symbol::Animator::set_hidden(&self->_animator._lock._lock, a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (int)scaleLevel
{
  int v2;
  int v3;

  v2 = RB::Symbol::Animator::scale_level(&self->_animator._lock._lock);
  if (v2)
    v3 = -1;
  else
    v3 = 0;
  if (v2 >= 1)
    return 1;
  else
    return v3;
}

- (void)setScaleLevel:(int)a3
{
  if (RB::Symbol::Animator::set_scale_level(&self->_animator._lock._lock, a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (unsigned)depth
{
  int v2;

  v2 = -[RBSymbolAnimator scaleLevel](self, "scaleLevel");
  if (v2 == -1)
    return 2;
  else
    return v2 == 1;
}

- (void)setDepth:(unsigned int)a3
{
  uint64_t v3;

  if (a3 == 2)
    v3 = 0xFFFFFFFFLL;
  else
    v3 = a3 == 1;
  -[RBSymbolAnimator setScaleLevel:](self, "setScaleLevel:", v3);
}

- (CGPoint)anchorPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::anchor_point(&self->_animator._lock._lock)));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (CGPoint)position
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::position(&self->_animator._lock._lock)));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (CGSize)size
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::size(&self->_animator._lock._lock)));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (CGPoint)presentationPosition
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::presentation_position(&self->_animator._lock._lock)));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (unsigned)addAnimation:(unsigned int)a3 options:(id)a4
{
  void *v7;
  int v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  char v23;
  int v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  unsigned int v37;
  void *v38;
  void *v39;
  float v40;
  __float2 v41;
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;
  void *v46;
  char v47;
  CUINamedVectorGlyph *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  unsigned int v52;
  CUINamedVectorGlyph *v53;
  CUINamedVectorGlyph *v54;
  CUINamedVectorGlyph *v55;
  CUINamedVectorGlyph *v56;
  void *v57;
  int v58;
  unsigned int v59;
  void *v60;
  double v61;
  __float2 v62;
  unsigned int v63;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  __int128 v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v66 = 0;
  v67 = 0;
  v65 = a3;
  v68 = xmmword_209BD95E0;
  v70 = 0;
  v71 = 0;
  v69 = 0;
  if (a4)
  {
    v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationPriority);
    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      LODWORD(v68) = v8;
    }
    v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationSpeed);
    if (v9)
    {
      objc_msgSend(v9, "floatValue");
      v11 = v10;
      *((float *)&v68 + 1) = v10;
      v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationClampsSpeed);
      if (!v12 || objc_msgSend(v12, "BOOLValue"))
      {
        v13 = 0.5;
        if (v11 >= 0.5)
          v13 = v11;
        if (v13 > 2.0)
          v13 = 2.0;
        *((float *)&v68 + 1) = v13;
      }
    }
    v14 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationRepeatCount);
    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      DWORD2(v68) = v15;
    }
    v16 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationRepeatDelay);
    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      HIDWORD(v68) = v17;
    }
    v18 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationByLayer);
    if (v18)
    {
      v19 = 16;
      if (objc_msgSend(v18, "BOOLValue"))
        v20 = 16;
      else
        v20 = 0;
      v66 = v20;
      v67 = 16;
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    v70 = objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationTiming);
    v21 = objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationOnCompletion);
    if (v21)
      v71 = v21;
    switch(a3)
    {
      case 1u:
        v26 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationVariableColorOptions);
        if (v26)
        {
          v27 = objc_msgSend(v26, "unsignedIntValue");
          v20 |= (v27 << 27) & 0x40000000 | (v27 << 31) | (((v27 >> 1) & 1) << 29);
          if ((v27 & 0xB) != 0)
            v66 = v20;
          v19 |= 0xE0000000;
          v67 = v19;
        }
        v28 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationSymbolDefaults);
        if (v28
          || (v53 = -[RBSymbolAnimator glyph](self, "glyph")) != 0
          && (v54 = v53, (objc_opt_respondsToSelector() & 1) != 0)
          && (v28 = (void *)-[CUINamedVectorGlyph symbolDefaults](v54, "symbolDefaults")) != 0)
        {
          v29 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("variableColorContinuous"));
          if (v29)
          {
            if (objc_msgSend(v29, "BOOLValue"))
              v66 = v20 | 0x10000000;
            v30 = v19 | 0x10000000;
            goto LABEL_131;
          }
        }
        break;
      case 2u:
        v31 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationPulseOptions);
        if (v31)
        {
          v32 = objc_msgSend(v31, "unsignedIntValue") & 0xF;
          if (v32 == 2)
            goto LABEL_57;
          if (v32 == 1)
            goto LABEL_81;
        }
        break;
      case 3u:
        v33 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationBounceOptions);
        if (!v33)
          break;
        v34 = objc_msgSend(v33, "unsignedIntValue");
        if ((v34 & 0xF) == 1)
          goto LABEL_48;
        if ((v34 & 0xF) == 2)
        {
          v20 |= 0x80000000;
          v66 = v20;
LABEL_48:
          v67 = v19 | 0x80000000;
        }
        if ((v34 & 0x10) != 0)
          v66 = v20 | 0x20;
        break;
      case 4u:
      case 8u:
        v65 = 4;
        break;
      case 5u:
      case 9u:
        v22 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationAppearDisappearOptions);
        if (!v22)
          break;
        v23 = objc_msgSend(v22, "unsignedIntValue");
        v24 = v23 & 0xF;
        switch(v24)
        {
          case 1:
            goto LABEL_88;
          case 2:
            v25 = 0x40000000;
            break;
          case 3:
            v25 = 0x80000000;
            break;
          default:
            v30 = 16;
            if ((v23 & 0x10) != 0)
              goto LABEL_131;
            goto LABEL_132;
        }
        v66 = v20 | v25;
LABEL_88:
        v67 = v19 | 0xC0000000;
        v30 = -1073741808;
        if ((v23 & 0x10) != 0)
          goto LABEL_131;
        break;
      case 6u:
        v35 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationReplaceOptions);
        if (!v35)
          break;
        v36 = objc_msgSend(v35, "unsignedIntValue");
        v37 = 0x40000000;
        switch(v36 & 0xF)
        {
          case 1:
            goto LABEL_97;
          case 2:
            goto LABEL_96;
          case 3:
            v37 = 0x80000000;
            goto LABEL_96;
          case 4:
            v37 = -1073741824;
LABEL_96:
            v20 |= v37;
            v66 = v20;
LABEL_97:
            v19 |= 0xC0000000;
            v67 = v19;
            break;
          default:
            break;
        }
        if ((v36 & 0x10) != 0)
        {
          v19 |= 0x10u;
          v67 = v19;
          if ((v36 & 0x20) == 0)
          {
LABEL_100:
            if ((v36 & 0x40) == 0)
              break;
LABEL_104:
            v51 = v20 & 0xEFFFFFFF;
            v52 = v19 | 0x10000000;
            goto LABEL_105;
          }
        }
        else if ((v36 & 0x20) == 0)
        {
          goto LABEL_100;
        }
        v20 &= ~0x20000000u;
        v19 |= 0x20000000u;
        v66 = v20;
        v67 = v19;
        if ((v36 & 0x40) == 0)
          break;
        goto LABEL_104;
      case 7u:
        v38 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationInterpolateOptions);
        if (!v38)
          break;
        if ((objc_msgSend(v38, "unsignedIntValue") & 1) != 0)
          goto LABEL_56;
        goto LABEL_57;
      case 0xAu:
        v39 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationWiggleAngle);
        if (v39)
        {
          objc_msgSend(v39, "floatValue");
          v41 = __sincosf_stret(v40);
          v69 = __PAIR64__(LODWORD(v41.__sinval), LODWORD(v41.__cosval));
          v19 |= 0x80000000;
          v67 = v19;
        }
        v42 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationWiggleOptions);
        if (!v42)
          goto LABEL_117;
        v43 = objc_msgSend(v42, "unsignedIntValue");
        v44 = v43 & 0xF;
        if ((v43 & 0xF) == 0 || v19 < 0)
          goto LABEL_111;
        if (v44 == 3)
        {
          v20 |= 0x80000000;
          v66 = v20;
        }
        else
        {
          if (v44 == 2)
          {
            v45 = 0x3F80000000000000;
          }
          else
          {
            if (v44 != 1)
              goto LABEL_111;
            v45 = 1065353216;
          }
          v69 = v45;
        }
        v19 |= 0x80000000;
        v67 = v19;
LABEL_111:
        if ((v43 & 0xF0) == 0x10)
          goto LABEL_114;
        if ((v43 & 0xF0) == 0x20)
        {
          v20 |= 0x40000000u;
          v66 = v20;
LABEL_114:
          v19 |= 0x40000000u;
          v67 = v19;
        }
        if ((v43 & 0x100) != 0)
        {
          v20 |= 0x20u;
          v66 = v20;
        }
LABEL_117:
        if (v19 < 0)
          break;
        v56 = (CUINamedVectorGlyph *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationSymbolDefaults);
        if (!v56)
        {
          v56 = -[RBSymbolAnimator glyph](self, "glyph");
          if (v56)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v56 = (CUINamedVectorGlyph *)-[CUINamedVectorGlyph symbolDefaults](v56, "symbolDefaults");
            else
              v56 = 0;
          }
        }
        v57 = (void *)-[CUINamedVectorGlyph objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", CFSTR("wiggleStyle"));
        if (!v57)
          break;
        v58 = objc_msgSend(v57, "unsignedIntValue");
        if ((v58 - 1) >= 2)
        {
          if (v58 != 3)
            break;
          v60 = (void *)-[CUINamedVectorGlyph objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", CFSTR("wiggleAngle"));
          if (!v60)
            break;
          objc_msgSend(v60, "doubleValue");
          *(float *)&v61 = v61 * 0.0174532925;
          v62 = __sincosf_stret(*(float *)&v61);
          v69 = __PAIR64__(LODWORD(v62.__sinval), LODWORD(v62.__cosval));
          v59 = v19 | 0x80000000;
          v67 = v19 | 0x80000000;
          if ((v19 & 0x40000000) != 0)
            break;
        }
        else
        {
          v59 = v19 | 0x80000000;
          v66 = v20 | 0x80000000;
          v67 = v19 | 0x80000000;
          if ((v19 & 0x40000000) != 0)
            break;
          if (v58 != 1)
            v66 = v20 | 0xC0000000;
        }
        v30 = v59 | 0x40000000;
LABEL_131:
        v67 = v30;
        break;
      case 0xBu:
        v46 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationRotateOptions);
        if (!v46)
          goto LABEL_75;
        v47 = objc_msgSend(v46, "unsignedIntValue");
        if ((v47 & 0xF) == 1)
          goto LABEL_71;
        if ((v47 & 0xF) == 2)
        {
          v20 |= 0x80000000;
          v66 = v20;
LABEL_71:
          v19 |= 0x80000000;
          v67 = v19;
        }
        if ((v47 & 0x10) != 0)
        {
          v20 |= 0x20u;
          v66 = v20;
        }
        if (v19 < 0)
          break;
LABEL_75:
        v48 = (CUINamedVectorGlyph *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationSymbolDefaults);
        if (!v48)
        {
          v48 = -[RBSymbolAnimator glyph](self, "glyph");
          if (v48)
          {
            v55 = v48;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v48 = (CUINamedVectorGlyph *)-[CUINamedVectorGlyph symbolDefaults](v55, "symbolDefaults");
            else
              v48 = 0;
          }
        }
        v49 = (void *)-[CUINamedVectorGlyph objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("rotatesClockwise"));
        if (!v49)
          break;
        if ((objc_msgSend(v49, "BOOLValue") & 1) == 0)
LABEL_56:
          v66 = v20 | 0x80000000;
LABEL_57:
        v30 = v19 | 0x80000000;
        goto LABEL_131;
      case 0xCu:
        v50 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBSymbolAnimationBreatheOptions);
        if (v50 && (objc_msgSend(v50, "unsignedIntValue") & 1) != 0)
        {
LABEL_81:
          v51 = v20 | 0x80000000;
          v52 = v19 | 0x80000000;
LABEL_105:
          v66 = v51;
          v67 = v52;
        }
        break;
      default:
        break;
    }
  }
LABEL_132:
  v63 = RB::Symbol::Animator::add_animation((uint64_t)&self->_animator, &v65);
  if (v63)
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  return v63;
}

- (void)cancelAnimationWithID:(unsigned int)a3
{
  if (a3)
  {
    if (RB::Symbol::Animator::cancel_animation_by_id(&self->_animator._lock._lock, a3))
      -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)cancelAnimation:(unsigned int)a3
{
  if (RB::Symbol::Animator::cancel_animations_by_mask(&self->_animator._lock._lock, 1 << a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)cancelAllAnimations
{
  if (RB::Symbol::Animator::cancel_animations_by_mask(&self->_animator._lock._lock, 0xFFFFFFFF))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)removeAnimationWithID:(unsigned int)a3
{
  if (a3)
  {
    if (RB::Symbol::Animator::remove_animation_by_id(&self->_animator._lock._lock, a3))
      -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)removeAnimation:(unsigned int)a3
{
  if (RB::Symbol::Animator::remove_animations_by_mask(&self->_animator._lock._lock, 1 << a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)removeAllAnimations
{
  if (RB::Symbol::Animator::remove_all_animations(&self->_animator._lock._lock))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setPriority:(float)a3 ofAnimationWithID:(unsigned int)a4
{
  if (RB::Symbol::Animator::set_priority_by_id(&self->_animator._lock._lock, a4, a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (void)setCurrentTime:(double)a3
{
  if (RB::Symbol::Animator::set_current_time(&self->_animator._lock._lock, a3))
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
}

- (double)currentTime
{
  return self->_animator._current_time;
}

- (double)maxVelocity
{
  return *(float *)&self->_anon_38[16];
}

- (CGRect)unroundedAlignmentRect
{
  float32x2_t *v2;
  int32x4_t v3;
  float32x2_t v4;
  uint32x2_t v5;
  int32x4_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  double v10;
  double v11;
  CGRect result;

  v2 = (float32x2_t *)RB::Symbol::Model::glyph_info((RB::Symbol::Model *)self->_animator._model._p);
  v3.i32[0] = 0;
  v4 = v2[8];
  v5 = (uint32x2_t)vcgtz_f32(v4);
  *(uint32x2_t *)v6.i8 = vpmin_u32(v5, v5);
  v7 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v3, v6), 0);
  v8 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v4), *(int8x16_t *)(MEMORY[0x24BDBF070] + 16));
  v9 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v2[7]), *MEMORY[0x24BDBF070]);
  v10 = *(double *)&v9.i64[1];
  v11 = *(double *)&v8.i64[1];
  result.size.width = *(double *)v8.i64;
  result.origin.x = *(double *)v9.i64;
  result.size.height = v11;
  result.origin.y = v10;
  return result;
}

- (CGRect)boundingRect
{
  __n128 v2;
  double v3;
  double v4;
  float64x2_t v5;
  int32x4_t v6;
  double v7;
  float32x2_t v8;
  float32x2_t v9;
  int32x4_t v10;
  uint32x2_t v11;
  int32x4_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  double v16;
  double v17;
  int8x16_t v18;
  int8x16_t v19;
  _BYTE v20[2088];
  uint64_t v21;
  CGRect result;

  v21 = *MEMORY[0x24BDAC8D0];
  v2.n128_u64[0] = (unint64_t)vdup_n_s32(0x437F0000u);
  RB::Symbol::Presentation::Presentation(v20, &self->_animator, 0, 0, 255, 0, v2);
  v7 = RB::Symbol::Presentation::bounding_rect((RB::Symbol::Presentation *)v20, v3, v4, v5, v6);
  v9 = v8;
  v18 = *(int8x16_t *)(MEMORY[0x24BDBF070] + 16);
  v19 = *(int8x16_t *)MEMORY[0x24BDBF070];
  RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)v20);
  v10.i32[0] = 0;
  v11 = (uint32x2_t)vcgtz_f32(v9);
  *(uint32x2_t *)v12.i8 = vpmin_u32(v11, v11);
  v13 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v10, v12), 0);
  v14 = vbslq_s8(v13, (int8x16_t)vcvtq_f64_f32(v9), v18);
  v15 = vbslq_s8(v13, (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&v7), v19);
  v16 = *(double *)&v15.i64[1];
  v17 = *(double *)&v14.i64[1];
  result.size.width = *(double *)v14.i64;
  result.origin.x = *(double *)v15.i64;
  result.size.height = v17;
  result.origin.y = v16;
  return result;
}

- (_RBSymbolUpdate)beginUpdateWithRenderingMode:(unsigned int)a3
{
  return -[RBSymbolAnimator beginUpdateWithRenderingMode:position:size:flags:](self, "beginUpdateWithRenderingMode:position:size:flags:", *(_QWORD *)&a3, 0, 0, 0);
}

- (id)copyDebugDescriptionForUpdate:(_RBSymbolUpdate *)a3
{
  Animator *p_animator;
  id v5;
  void **v6;
  void *v7;
  void *__p[2];
  _BYTE v10[25];

  *(_OWORD *)&v10[9] = 0u;
  if (self)
    p_animator = &self->_animator;
  else
    p_animator = 0;
  *(_OWORD *)__p = 0uLL;
  *(_OWORD *)v10 = 0uLL;
  RB::Symbol::Presentation::print((RB::Symbol::Presentation *)a3, (std::string *)__p, &p_animator->_lock._lock, 0);
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v10[7] >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  v7 = (void *)objc_msgSend(v5, "initWithUTF8String:", v6);
  if ((v10[7] & 0x80000000) != 0)
    operator delete(__p[0]);
  return v7;
}

- (uint64_t)notifyObservers
{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  uint64_t result;
  char *v9;
  unint64_t v10;
  id *v11;

  v2 = (char *)*((_QWORD *)a1 + 8);
  v3 = *((_QWORD *)a1 + 9);
  if (v2)
    v4 = v2;
  else
    v4 = a1;
  if (!v3)
    goto LABEL_15;
  v5 = 16 * v3;
  v6 = (void **)(v4 + 8);
  do
  {
    v7 = *v6;
    v6 += 2;
    result = objc_msgSend(v7, "symbolAnimatorDidChange:", v7);
    v5 -= 16;
  }
  while (v5);
  if (a1)
  {
    v2 = (char *)*((_QWORD *)a1 + 8);
    if (v2)
      v9 = (char *)*((_QWORD *)a1 + 8);
    else
      v9 = a1;
    if (*((_QWORD *)a1 + 9))
    {
      v10 = 0;
      v11 = (id *)(v9 + 8);
      do
      {

        ++v10;
        v11 += 2;
      }
      while (v10 < *((_QWORD *)a1 + 9));
      v2 = (char *)*((_QWORD *)a1 + 8);
    }
LABEL_15:
    if (v2)
      free(v2);
    JUMPOUT(0x20BD16544);
  }
  return result;
}

@end
