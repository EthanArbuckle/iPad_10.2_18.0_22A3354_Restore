@implementation RBDisplayListInterpolator

+ (id)interpolatorWithFrom:(id)a3 to:(id)a4 options:(id)a5
{
  return (id)objc_msgSend(a1, "newInterpolatorWithFrom:to:options:", a3, a4, a5);
}

+ (id)newInterpolatorWithFrom:(id)a3 to:(id)a4 options:(id)a5
{
  return -[RBDisplayListInterpolator initWithFrom:to:options:]([RBDisplayListInterpolator alloc], "initWithFrom:to:options:", a3, a4, a5);
}

- (RBDisplayListInterpolator)initWithFrom:(id)a3 to:(id)a4 options:(id)a5
{
  RBDisplayListInterpolator *v8;
  RBDisplayListInterpolator *v9;
  _RBDisplayListContents *p;
  _RBDisplayListContents *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  const RB::Animation *v18;
  int v19;
  RB::DisplayList::Interpolator::Layer **v20;
  const RB::DisplayList::Item **v21;
  const RB::DisplayList::Contents *v22;
  Object *v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)RBDisplayListInterpolator;
  v8 = -[RBDisplayListInterpolator init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    p = v8->_from._p;
    if (p != a3)
    {

      v9->_from._p = (_RBDisplayListContents *)a3;
    }
    v11 = v9->_to._p;
    if (v11 != a4)
    {

      v9->_to._p = (_RBDisplayListContents *)a4;
    }
    v12 = objc_msgSend(a5, "copy");

    v9->_options._p = (NSDictionary *)v12;
    v13 = objc_msgSend(a5, "objectForKeyedSubscript:", RBDisplayListInterpolatorTransition);
    if (!v13 || (v14 = -[RBDecodedFontMetadata fontUID](v13), !*(_BYTE *)(v14 + 12)))
    {
      if ((v15 & 1) == 0
      {
        -[RBDisplayListInterpolator initWithFrom:to:options:]::shared_default_transition = -[RBDisplayListInterpolator initWithFrom:to:options:]::$_0::operator()();
      }
      v14 = -[RBDisplayListInterpolator initWithFrom:to:options:]::shared_default_transition;
    }
    v16 = operator new();
    *(_DWORD *)(v16 + 8) = 1;
    *(_QWORD *)v16 = off_24C223AF8;
    *(_OWORD *)(v16 + 24) = 0u;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 56) = 0u;
    *(_QWORD *)(v16 + 72) = 0;
    *(_DWORD *)(v16 + 80) = 1065353216;
    *(_OWORD *)(v16 + 140) = 0u;
    *(_QWORD *)(v16 + 144) = v16 + 16;
    *(_DWORD *)(v16 + 88) = 0;
    *(_QWORD *)(v16 + 320) = 0;
    *(_OWORD *)(v16 + 96) = 0u;
    *(_OWORD *)(v16 + 112) = 0u;
    *(_OWORD *)(v16 + 128) = 0u;
    *(_QWORD *)(v16 + 328) = 0x400000000;
    *(_DWORD *)(v16 + 336) = 0;
    *(_QWORD *)(v16 + 376) = 0;
    *(_QWORD *)(v16 + 384) = 0x200000000;
    *(_DWORD *)(v16 + 392) = 1;
    *(_QWORD *)(v16 + 16) = v14;
    v17 = objc_msgSend(a5, "objectForKeyedSubscript:", RBDisplayListInterpolatorAnimation);
    if (v17)
    {
      v18 = (const RB::Animation *)-[RBAnimation rb_animation](v17);
      *(_QWORD *)(v16 + 24) = v18;
      v19 = RB::DisplayList::Interpolator::Contents::intern_animation((RB::DisplayList::Interpolator::Contents *)(v16 + 16), v18);
      *(_DWORD *)(v16 + 32) = v19;
      *(_DWORD *)(v16 + 36) = v19;
    }
    v20 = (RB::DisplayList::Interpolator::Layer **)objc_msgSend(a3, "_rb_contents");
    v21 = (const RB::DisplayList::Item **)objc_msgSend(a4, "_rb_contents");
    RB::DisplayList::make_interpolator((RB::DisplayList *)(v16 + 144), v20, v21, v22);
    v23 = v9->_interp._p;
    v9->_interp._p = (Object *)v16;
    if (v23)
    {
      v24 = (unsigned int *)((char *)v23 + 8);
      do
      {
        v25 = __ldxr(v24);
        v26 = v25 - 1;
      }
      while (__stlxr(v26, v24));
      if (!v26)
      {
        __dmb(9u);
        (*(void (**)(Object *))(*(_QWORD *)v23 + 8))(v23);
      }
    }
  }
  return v9;
}

- (uint64_t)initWithFrom:to:options:
{
  uint64_t v0;

  v0 = operator new();
  *(_DWORD *)(v0 + 8) = 1;
  *(_QWORD *)v0 = off_24C224008;
  *(_BYTE *)(v0 + 14) = 32;
  *(_DWORD *)(v0 + 16) = -1;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0x400000000;
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 0x600000000;
  *(_WORD *)(v0 + 12) = 7;
  RB::Transition::add_default_effect((_DWORD *)v0);
  *(_BYTE *)(v0 + 13) = 1;
  return v0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  _QWORD *v5;
  Object *v6;
  Object *p;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  _RBDisplayListContents *v13;
  _RBDisplayListContents *v14;
  _RBDisplayListContents *v15;
  _RBDisplayListContents *v16;
  NSDictionary *v17;
  NSDictionary *v18;

  objc_opt_class();
  v4 = objc_opt_new();
  v5 = (_QWORD *)v4;
  if (v4)
  {
    v6 = *(Object **)(v4 + 8);
    p = self->_interp._p;
    if (v6 != p)
    {
      if (v6)
      {
        v8 = (unsigned int *)((char *)v6 + 8);
        do
        {
          v9 = __ldxr(v8);
          v10 = v9 - 1;
        }
        while (__stlxr(v10, v8));
        if (!v10)
        {
          __dmb(9u);
          (*(void (**)(Object *))(*(_QWORD *)v6 + 8))(v6);
        }
        p = self->_interp._p;
      }
      if (p)
      {
        v11 = (unsigned int *)((char *)p + 8);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
      v5[1] = p;
    }
    v13 = self->_from._p;
    v14 = (_RBDisplayListContents *)v5[2];
    if (v14 != v13)
    {

      v5[2] = v13;
    }
    v15 = self->_to._p;
    v16 = (_RBDisplayListContents *)v5[3];
    if (v16 != v15)
    {

      v5[3] = v15;
    }
    v17 = self->_options._p;
    v18 = (NSDictionary *)v5[4];
    if (v18 != v17)
    {

      v5[4] = v17;
    }
  }
  return v5;
}

- (RBDisplayListContents)from
{
  return self->_from._p;
}

- (void)setFrom:(id)a3
{
  _RBDisplayListContents *p;

  p = self->_from._p;
  if (p != a3)
  {

    self->_from._p = (_RBDisplayListContents *)a3;
  }
}

- (RBDisplayListContents)to
{
  return self->_to._p;
}

- (NSDictionary)options
{
  return self->_options._p;
}

- (double)activeDuration
{
  Object *p;

  p = self->_interp._p;
  if (p)
    return *((float *)p + 38);
  else
    return 0.0;
}

- (BOOL)isIdentity
{
  Object *p;

  p = self->_interp._p;
  return p && *((_BYTE *)p + 392) && *((_DWORD *)p + 82) && *((_DWORD *)p + 84) == 32;
}

- (BOOL)onlyFades
{
  Object *p;

  p = self->_interp._p;
  return p && RB::DisplayList::Interpolator::Layer::is_fade((RB::DisplayList::Interpolator::Layer *)((char *)p + 144));
}

- (CGRect)boundingRectWithProgress:(float)a3
{
  uint64_t v5;
  const RB::DisplayList::Contents *v6;
  const RB::DisplayList::Contents *v7;
  Object *p;
  float32x2_t v9;
  float64x2_t v10;
  float32x2_t v11;
  float64x2_t v12;
  double v13;
  double v14;
  CGRect result;

  v5 = -[_RBDisplayListContents _rb_contents](self->_from._p, "_rb_contents");
  v6 = (const RB::DisplayList::Contents *)-[_RBDisplayListContents _rb_contents](self->_to._p, "_rb_contents");
  p = self->_interp._p;
  if (p)
  {
    RB::DisplayList::interpolated_bounds((RB::DisplayList *)((char *)p + 144), 0, a3, v5, v6, v7);
    v10 = vcvtq_f64_f32(v9);
    v12 = vcvtq_f64_f32(v11);
  }
  else
  {
    v12 = *(float64x2_t *)MEMORY[0x24BDBF070];
    v10 = *(float64x2_t *)(MEMORY[0x24BDBF070] + 16);
  }
  v13 = v12.f64[1];
  v14 = v10.f64[1];
  result.size.width = v10.f64[0];
  result.origin.x = v12.f64[0];
  result.size.height = v14;
  result.origin.y = v13;
  return result;
}

- (double)maxAbsoluteVelocityWithProgress:(float)a3
{
  Object *p;
  double result;
  int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double width;
  float v21;
  int v22;
  BOOL v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  p = self->_interp._p;
  result = 0.0;
  if (p)
  {
    v7 = *((_DWORD *)p + 84);
    if ((v7 & 0x44) != 0
      || *((_BYTE *)p + 394)
      && ((v22 = *((unsigned __int8 *)p + 392), (v7 & 3) == 0) ? (v23 = v22 == 0) : (v23 = 1), v23))
    {
      -[_RBDisplayListContents boundingRect](self->_from._p, "boundingRect", 0.0);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[_RBDisplayListContents boundingRect](self->_to._p, "boundingRect");
      v26.origin.x = v16;
      v26.origin.y = v17;
      v26.size.width = v18;
      v26.size.height = v19;
      v24.origin.x = v9;
      v24.origin.y = v11;
      v24.size.width = v13;
      v24.size.height = v15;
      v25 = CGRectUnion(v24, v26);
      if (v25.size.width >= v25.size.height)
        width = v25.size.width;
      else
        width = v25.size.height;
      v21 = a3;
      return width
           * RB::DisplayList::Interpolator::Contents::max_animation_speed((RB::DisplayList::Interpolator::Contents *)((char *)self->_interp._p + 16), v25.origin.x, v25.origin.y);
    }
  }
  return result;
}

- (void)drawInState:(_RBDrawingState *)a3 by:(float)a4
{
  -[RBDisplayListInterpolator _drawInState:alpha:by:]((uint64_t)self, (unsigned int **)a3, 1.0, a4);
}

- (void)_drawInState:(float32_t)a3 alpha:(float)a4 by:
{
  const RB::DisplayList::Contents *v8;
  const RB::DisplayList::Contents *v9;
  unsigned int *v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  RBDisplayListInterpolator *v14;
  RB::XML::Element **v15;
  const RB::XML::Document *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  if (a1)
  {
    v8 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 16), "_rb_contents");
    v9 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 24), "_rb_contents");
    v10 = a2[1];
    if (!*((_QWORD *)v10 + 3))
      make_contents(a2[1]);
    objc_msgSend(v10, "deviceScale");
    *(_QWORD *)&v11 = 0;
    *((_QWORD *)&v11 + 1) = v12;
    v17 = v12;
    v18 = v11;
    v19 = 0;
    v20 = 0;
    v13 = *(_QWORD *)(a1 + 8);
    if (v13)
      RB::DisplayList::Builder::draw_interpolated((RB::DisplayList::Layer ***)v10 + 2, (RB::DisplayList::State *)a2, (const RB::DisplayList::Interpolator::Layer *)(v13 + 144), a3, a4, v8, v9, (const RB::AffineTransform *)&v17);
    if (*((_QWORD *)v10 + 38))
    {
      v14 = (RBDisplayListInterpolator *)objc_msgSend(*(id *)(a1 + 16), "_rb_xml_document", v17, v18, v19, v20);
      v15 = (RB::XML::Element **)objc_msgSend(*(id *)(a1 + 24), "_rb_xml_document");
      if (v14)
      {
        if (v15)
          RB::XML::DisplayList::draw_interpolated(*((RB::XML::DisplayList **)v10 + 38), (_RBDrawingState *)a2, (_RBDrawingState *)a1, v14, v15, v16, a3, a4);
      }
    }
  }
}

- (id)copyContentsWithProgress:(float)a3
{
  return -[RBInterpolatedDisplayListContents initWithInterpolator:by:]([RBInterpolatedDisplayListContents alloc], self, a3);
}

- (id)contentsWithProgress:(float)a3
{
  return -[RBDisplayListInterpolator copyContentsWithProgress:](self, "copyContentsWithProgress:");
}

- (void).cxx_destruct
{
  Object *p;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  p = self->_interp._p;
  if (p)
  {
    v4 = (unsigned int *)((char *)p + 8);
    do
    {
      v5 = __ldxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      __dmb(9u);
      (*(void (**)(Object *))(*(_QWORD *)p + 8))(p);
    }
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
