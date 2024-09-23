@implementation RBDisplayList

- (void)translateByX:(double)a3 Y:(double)a4
{
  RBDrawingStateTranslateCTM(*((_QWORD *)self + 35), a3, a4);
}

- (int)defaultColorSpace
{
  return rb_color_space(*(_WORD *)(*((_QWORD *)self + 35) + 156));
}

- (id).cxx_construct
{
  RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)((char *)self + 16));
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 43) = 0x100000000;
  return self;
}

- (id)CGStyleHandler
{
  return (id)*((_QWORD *)self + 39);
}

- (void)setDeviceScale:(double)a3
{
  RB::XML::DisplayList *v3;

  if (*((double *)self + 45) != a3)
  {
    *((double *)self + 45) = a3;
    v3 = (RB::XML::DisplayList *)*((_QWORD *)self + 38);
    if (v3)
      RB::XML::DisplayList::device_scale(v3, (RB::XML::Document *)a2, a3);
  }
}

- (void).cxx_destruct
{
  CFTypeRef *v3;
  CFTypeRef *v4;
  CFTypeRef *v5;
  unint64_t v6;
  unint64_t i;
  uint64_t v8;

  v3 = (CFTypeRef *)((char *)self + 320);
  v4 = (CFTypeRef *)*((_QWORD *)self + 42);
  if (v4)
    v5 = v4;
  else
    v5 = v3;
  v6 = *((unsigned int *)self + 86);
  if ((_DWORD)v6)
  {
    for (i = 0; i < v6; ++i)
    {
      if (*v5)
      {
        CFRelease(*v5);
        v6 = *((unsigned int *)self + 86);
      }
      v5 += 2;
    }
    v4 = (CFTypeRef *)*((_QWORD *)self + 42);
  }
  if (v4)
    free(v4);

  v8 = *((_QWORD *)self + 38);
  *((_QWORD *)self + 38) = 0;
  if (v8)
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)self + 304, v8);
  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)((char *)self + 16));
}

- (void)setCGStyleHandler:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "copy");

  *((_QWORD *)self + 39) = v4;
}

- (void)endCGContext
{
  _RBDrawingState *v2;

  RBDrawingStateEndCGContext(*((_QWORD *)self + 35), a2, v2);
}

- (unsigned)profile
{
  return *((_DWORD *)self + 89);
}

- (CGRect)boundingRect
{
  uint64_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  double v8;
  CGRect result;

  v2 = *((_QWORD *)self + 3);
  if (v2)
  {
    v3 = RB::DisplayList::Layer::bounds((RB::DisplayList::Layer *)(v2 + 320));
    v5 = vcvtq_f64_f32(v4);
    v6 = vcvtq_f64_f32(v3);
  }
  else
  {
    v6 = *(float64x2_t *)MEMORY[0x24BDBF070];
    v5 = *(float64x2_t *)(MEMORY[0x24BDBF070] + 16);
  }
  v7 = v6.f64[1];
  v8 = v5.f64[1];
  result.size.width = v5.f64[0];
  result.origin.x = v6.f64[0];
  result.size.height = v8;
  result.origin.y = v7;
  return result;
}

- (void)drawDisplayList:(id)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  objc_msgSend(a3, "_drawInState:alpha:", *((_QWORD *)self + 35), v3);
}

- (CGContext)beginCGContextWithAlpha:(float)a3
{
  _RBDrawingState *v4;
  double v5;

  v4 = (_RBDrawingState *)*((_QWORD *)self + 35);
  -[RBDisplayList deviceScale](self, "deviceScale");
  return begin_cgcontext(v4, a3, v5, 0);
}

- (double)deviceScale
{
  return *((double *)self + 45);
}

- (void)renderInContext:(CGContext *)a3 options:(id)a4
{
  const RB::DisplayList::Contents *v5;

  v5 = (const RB::DisplayList::Contents *)*((_QWORD *)self + 3);
  if (v5)
  {
    render_contents(a3, (NSDictionary *)a4, v5, *((_RBDrawingState **)self + 38));
    RBXMLRecorderMarkCGFrame(self, a3);
  }
}

- (RBDisplayList)init
{
  RBDisplayList *v2;
  RBDisplayList *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBDisplayList;
  v2 = -[RBDisplayList init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 89) = 0;
    *((_QWORD *)v2 + 45) = 0x3FF0000000000000;
    *(_QWORD *)(*((_QWORD *)v2 + 35) + 8) = v2;
    if (RBXMLRecorderInstalled())
      -[RBDisplayList beginRecordingXML](v3, "beginRecordingXML");
  }
  return v3;
}

- (void)setDefaultColorSpace:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *((_QWORD *)self + 35);
  v5 = *(_QWORD *)(v4 + 8);
  *(_WORD *)(v4 + 156) = rb_color_space(a3);
  v6 = *(_QWORD *)(v5 + 304);
  if (v6)
    *(_DWORD *)(v6 + 120) = a3;
}

- (void)setProfile:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self + 3);
  if (v3 && *(_QWORD *)(v3 + 320))
    RB::precondition_failure((RB *)"may only set profile of empty display lists", a2, *(_QWORD *)&a3);
  if (*((_DWORD *)self + 89) != a3)
  {
    *((_DWORD *)self + 89) = a3;
    RB::DisplayList::Builder::set_optimized((uint64_t)self + 16, a3 != 0);
  }
}

- (void)setContentRect:(CGRect)a3
{
  CGFloat y;
  CGFloat height;

  y = a3.origin.y;
  height = a3.size.height;
  RB::DisplayList::Builder::set_crop((float32x2_t *)self + 2, vcvt_f32_f64((float64x2_t)a3.origin), vcvt_f32_f64((float64x2_t)a3.size));
}

- (const)_rb_contents
{
  return (const void *)*((_QWORD *)self + 3);
}

- (void)concat:(CGAffineTransform *)a3
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[3];

  v3 = *((_QWORD *)self + 35);
  v4 = *(_OWORD *)&a3->c;
  v5 = *(_OWORD *)&a3->tx;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v4;
  v6[2] = v5;
  RBDrawingStateConcatCTM(v3, (uint64_t)v6);
}

- (id)moveContents
{
  uint64_t v3;
  RB::XML::Document *v4;
  uint64_t v5;
  RBMovedDisplayListContents *v6;
  const char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = *((_QWORD *)self + 38);
  *((_QWORD *)self + 38) = 0;
  v19 = v3;
  if (v3)
  {
    v4 = (RB::XML::Document *)operator new();
    RB::XML::Document::Document(v4);
    v5 = *((_QWORD *)self + 38);
    *((_QWORD *)self + 38) = v4;
    if (v5)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)self + 304, v5);
  }
  v6 = [RBMovedDisplayListContents alloc];
  RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)((char *)self + 16), v7, &v18);
  v8 = v19;
  v19 = 0;
  v17 = v8;
  v9 = -[RBMovedDisplayListContents initWithContents:xmlDocument:](v6, &v18, &v17);
  v10 = v17;
  v17 = 0;
  if (v10)
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v17, v10);
  v11 = v18;
  if (v18)
  {
    v12 = (unsigned int *)(v18 + 8);
    do
    {
      v13 = __ldxr(v12);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, v12));
    if (!v14)
    {
      __dmb(9u);
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    }
  }
  v15 = v19;
  v19 = 0;
  if (v15)
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v19, v15);
  return v9;
}

- (void)dealloc
{
  objc_super v2;

  if (*((_DWORD *)self + 88))
    RB::precondition_failure((RB *)"not all states were destroyed", a2);
  v2.receiver = self;
  v2.super_class = (Class)RBDisplayList;
  -[RBDisplayList dealloc](&v2, sel_dealloc);
}

- (CGRect)contentRect
{
  float32x2_t v2;
  uint32x2_t v3;
  uint32x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t *v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *(float32x2_t *)((char *)self + 264);
  v3 = (uint32x2_t)vcge_f32(vabs_f32(v2), (float32x2_t)vdup_n_s32(0x7F7FFFFFu));
  if ((vpmax_u32(v3, v3).u32[0] & 0x80000000) != 0)
  {
    v7 = (float64x2_t *)MEMORY[0x24BDBF028];
LABEL_6:
    v6 = *v7;
    v5 = v7[1];
    goto LABEL_7;
  }
  v4 = (uint32x2_t)vclez_f32(v2);
  if ((vpmax_u32(v4, v4).u32[0] & 0x80000000) != 0)
  {
    v7 = (float64x2_t *)MEMORY[0x24BDBF070];
    goto LABEL_6;
  }
  v5 = vcvtq_f64_f32(v2);
  v6 = vcvtq_f64_f32(*(float32x2_t *)((char *)self + 256));
LABEL_7:
  v8 = v6.f64[1];
  v9 = v5.f64[1];
  result.size.width = v5.f64[0];
  result.origin.x = v6.f64[0];
  result.size.height = v9;
  result.origin.y = v8;
  return result;
}

- (BOOL)isEmpty
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 3);
  return !v2 || *(_QWORD *)(v2 + 320) == 0;
}

- (BOOL)linearColors
{
  unsigned int v2;

  v2 = *(unsigned __int16 *)(*((_QWORD *)self + 35) + 156);
  return (v2 & 1) == 0 && v2 > 0xFF;
}

- (void)setLinearColors:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a3;
  v5 = -[RBDisplayList defaultColorSpace](self, "defaultColorSpace");
  if (v5 >= 3)
  {
    if (v5 - 3 >= 2)
      return;
    v6 = !v3;
    v7 = 3;
  }
  else
  {
    v6 = !v3;
    v7 = 1;
  }
  if (v6)
    v8 = v7;
  else
    v8 = v7 + 1;
  -[RBDisplayList setDefaultColorSpace:](self, "setDefaultColorSpace:", v8);
}

- (void)clearCaches
{
  unsigned int v3;

  v3 = *((_DWORD *)self + 86);
  if (*((_DWORD *)self + 87) > v3)
    *((_QWORD *)self + 42) = RB::details::realloc_vector<unsigned int,16ul>(*((void **)self + 42), (char *)self + 320, 1u, (_DWORD *)self + 87, v3);
  RB::DisplayList::Builder::clear_caches((RB::DisplayList::Builder *)((char *)self + 16));
}

- (void)clear
{
  RB::DisplayList::Builder *v3;
  RB::XML::Document *v4;
  uint64_t v5;

  -[RBDisplayList clearCaches](self, "clearCaches");
  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)((char *)self + 16));
  RB::DisplayList::Builder::Builder(v3);
  if (*((_QWORD *)self + 38))
  {
    v4 = (RB::XML::Document *)operator new();
    RB::XML::Document::Document(v4);
    v5 = *((_QWORD *)self + 38);
    *((_QWORD *)self + 38) = v4;
    if (v5)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)self + 304, v5);
  }
}

- (void)save
{
  RB::XML::Document *v3;
  RB::XML::DisplayList *v4;

  RB::DisplayList::Builder::save((RB::DisplayList::Builder *)((char *)self + 16));
  v4 = (RB::XML::DisplayList *)*((_QWORD *)self + 38);
  if (v4)
    RB::XML::DisplayList::save(v4, v3);
}

- (void)restore
{
  RB::XML::Document *v3;
  RB::XML::DisplayList *v4;

  RB::DisplayList::Builder::restore((RB::DisplayList::Builder *)((char *)self + 16), 0);
  v4 = (RB::XML::DisplayList *)*((_QWORD *)self + 38);
  if (v4)
    RB::XML::DisplayList::restore(v4, v3);
}

- (void)beginLayerWithFlags:(unsigned int)a3
{
  _RBDrawingState *v3;
  RB::DisplayList::Builder *v5;
  unsigned int v6;
  LayerState *v7;
  RB::XML::DisplayList *v8;

  v3 = *(_RBDrawingState **)&a3;
  v5 = (RB::DisplayList::Builder *)((char *)self + 16);
  v6 = (a3 >> 1) & 4;
  if ((a3 & 4) != 0)
    v6 = 2;
  v7 = (LayerState *)RB::DisplayList::Builder::begin_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35), a3 & 1 | (8 * ((a3 >> 1) & 1)) & 0xFFFFF3FF | (((a3 >> 4) & 3) << 10) | v6);
  RB::DisplayList::Builder::save(v5, v7);
  v8 = (RB::XML::DisplayList *)*((_QWORD *)self + 38);
  if (v8)
    RB::XML::DisplayList::begin_layer(v8, *((_RBDrawingState **)self + 35), v3);
}

- (void)beginLayer
{
  -[RBDisplayList beginLayerWithFlags:](self, "beginLayerWithFlags:", 0);
}

- (void)drawLayerWithAlpha:(float)a3 blendMode:(int)a4
{
  RB::DisplayList::Builder *v7;
  uint64_t v8;
  int8x16_t *v9;
  int v10;
  RB::XML::Document *v11;

  v7 = (RB::DisplayList::Builder *)((char *)self + 16);
  v8 = RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v7, (const char *)1);
  v9 = (int8x16_t *)*((_QWORD *)self + 35);
  v10 = rb_blend_mode(a4);
  RB::DisplayList::Builder::draw_layer((uint64_t)v7, v8, v9, v10, a3);
  v11 = (RB::XML::Document *)*((_QWORD *)self + 38);
  if (v11)
    RB::XML::DisplayList::draw_layer(v11, a4, a3);
}

- (void)clipLayerWithAlpha:(float)a3 mode:(int)a4
{
  RB::DisplayList::Builder *v7;
  RB::DisplayList::Layer *v8;
  __n128 *v9;
  _BOOL8 v10;
  uint64_t v11;

  v7 = (RB::DisplayList::Builder *)((char *)self + 16);
  v8 = (RB::DisplayList::Layer *)RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v7, (const char *)1);
  v9 = (__n128 *)*((_QWORD *)self + 35);
  v10 = rb_clip_mode(a4);
  RB::DisplayList::Builder::clip_layer(v7, v8, v9, v10, a3);
  v11 = *((_QWORD *)self + 38);
  if (v11)
    RB::XML::DisplayList::clip_layer(v11, a4, a3);
}

- (CGContext)beginCGContextWithAlpha:(float)a3 flags:(unsigned int)a4
{
  _RBDrawingState *v6;
  double v7;

  v6 = (_RBDrawingState *)*((_QWORD *)self + 35);
  -[RBDisplayList deviceScale](self, "deviceScale");
  return begin_cgcontext(v6, a3, v7, a4);
}

- (const)_rb_xml_document
{
  return (const void *)*((_QWORD *)self + 38);
}

- (CGAffineTransform)CTM
{
  CGFloat ty;
  __int128 v4;

  ty = self[5].ty;
  v4 = *(_OWORD *)(*(_QWORD *)&ty + 32);
  *(_OWORD *)&retstr->a = *(_OWORD *)(*(_QWORD *)&ty + 16);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(*(_QWORD *)&ty + 48);
  return self;
}

- (void)setCTM:(CGAffineTransform *)a3
{
  RB::DisplayList::State *v3;
  float64x2_t v4;
  float64x2_t v5[3];

  v3 = (RB::DisplayList::State *)*((_QWORD *)self + 35);
  v4 = *(float64x2_t *)&a3->c;
  v5[0] = *(float64x2_t *)&a3->a;
  v5[1] = v4;
  v5[2] = *(float64x2_t *)&a3->tx;
  RBDrawingStateSetCTM(v3, v5);
}

- (CGRect)clipBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  RBDrawingStateGetClipBoundingBox(*((_QWORD *)self + 35));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)scaleByX:(double)a3 Y:(double)a4
{
  RBDrawingStateScaleCTM(*((_QWORD *)self + 35), *(float64x2_t *)&a3, a4);
}

- (void)rotateBy:(double)a3
{
  RBDrawingStateRotateCTM(*((_QWORD *)self + 35), a3);
}

- (unsigned)identifier
{
  return *(_DWORD *)(*((_QWORD *)self + 35) + 64);
}

- (NSUUID)identifierNamespace
{
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)(*((_QWORD *)self + 35) + 68);
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v3);
}

- (void)setIdentifier:(unsigned int)a3 namespace:(id)a4
{
  RBDrawingStateSetIdentifier(*((_QWORD *)self + 35), a3, a4);
}

- (RBTransition)transition
{
  return RBDrawingStateCopyTransition(*((_QWORD *)self + 35));
}

- (void)setTransition:(id)a3
{
  RBDrawingStateSetTransition(*((_QWORD *)self + 35), (uint64_t)a3);
}

- (void)setValue:(id)a3 forAttribute:(unsigned int)a4
{
  RBDrawingStateSetAttribute(*((RB::DisplayList::State **)self + 35), a3, a4);
}

- (id)valueForAttribute:(unsigned int)a3
{
  double v3;

  return (id)RBDrawingStateGetAttribute(*((_QWORD *)self + 35), a3, v3);
}

- (void)clipShape:(id)a3 alpha:(float)a4 mode:(int)a5
{
  RBDrawingStateClipShape2(*((RB::DisplayList::State **)self + 35), (uint64_t)a3, a5, a4);
}

- (void)clipShape:(id)a3 mode:(int)a4
{
  RBDrawingStateClipShape2(*((RB::DisplayList::State **)self + 35), (uint64_t)a3, a4, 1.0);
}

- (void)drawShape:(id)a3 fill:(id)a4 alpha:(float)a5 blendMode:(int)a6
{
  RBDrawingStateDrawShape(*((_QWORD *)self + 35), (uint64_t)a3, (float16x4_t *)a4, a6, a5);
}

- (void)drawInState:(_RBDrawingState *)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  -[RBDisplayList _drawInState:alpha:](self, "_drawInState:alpha:", a3, v3);
}

- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4
{
  const RB::XML::Document *v7;
  _QWORD *v8;
  const RB::DisplayList::Contents *v9;
  RB::XML::DisplayList *v10;
  _RBDrawingState *v11;

  -[RBDisplayList clearCaches](self, "clearCaches");
  v8 = (_QWORD *)*((_QWORD *)a3 + 1);
  if (!v8[3])
    make_contents(*((unsigned int **)a3 + 1));
  v9 = (const RB::DisplayList::Contents *)*((_QWORD *)self + 3);
  if (v9)
    RB::DisplayList::Builder::draw((RB::DisplayList::Builder *)(v8 + 2), v9, (RB::DisplayList::State *)a3, a4, 0, 0);
  v10 = (RB::XML::DisplayList *)v8[38];
  if (v10)
  {
    v11 = (_RBDrawingState *)*((_QWORD *)self + 38);
    if (v11)
      RB::XML::DisplayList::draw_list(v10, (RB::XML::Document *)a3, v11, v7, a4);
  }
}

- (void)drawDisplayList:(id)a3 alpha:(float)a4
{
  objc_msgSend(a3, "_drawInState:alpha:", *((_QWORD *)self + 35));
}

- (void)drawInRect:(CGRect)a3 alpha:(float)a4 blendMode:(int)a5 flags:(unsigned int)a6 operation:(id)a7
{
  RBDrawingStateDrawMetal(*((unsigned int ***)self + 35), a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)addPredicateStyle:(id)a3
{
  RBDrawingStateAddPredicateStyle(*((RB::DisplayList::State **)self + 35), (uint64_t)a3);
}

- (void)addTransformStyle:(id)a3
{
  RBDrawingStateAddTransformStyle(*((RB::DisplayList::State **)self + 35), (uint64_t)a3);
}

- (void)addAnimationStyle:(id)a3 id:(id)a4
{
  RBDrawingStateAddAnimationStyle2(*((_QWORD *)self + 35), (const RB::Animation *)a3, *(uint64_t *)a4.var0, *(uint64_t *)&a4.var0[8], (const UUID *)0x111);
}

- (void)addAnimationStyle:(id)a3 id:(id)a4 flags:(unsigned int)a5
{
  RBDrawingStateAddAnimationStyle2(*((_QWORD *)self + 35), (const RB::Animation *)a3, *(uint64_t *)a4.var0, *(uint64_t *)&a4.var0[8], *(const UUID **)&a5);
}

- (void)addShadowStyleWithRadius:(double)a3 midpoint:(float)a4 offset:(CGSize)a5 color:(id)a6 colorSpace:(int)a7 blendMode:(int)a8 flags:(unsigned int)a9
{
  RBDrawingStateAddShadowStyle3(*((_QWORD *)self + 35), a7, a8, a9, a3, a4, a5.width, a5.height, a6.var0, a6.var1, a6.var2, a6.var3);
}

- (void)addShadowStyleWithRadius:(double)a3 offset:(CGSize)a4 color:(id)a5 colorSpace:(int)a6 blendMode:(int)a7 flags:(unsigned int)a8
{
  RBDrawingStateAddShadowStyle3(*((_QWORD *)self + 35), a6, a7, a8, a3, 0.5, a4.width, a4.height, a5.var0, a5.var1, a5.var2, a5.var3);
}

- (void)addShadowStyleWithRadius:(double)a3 offset:(CGSize)a4 color:(id)a5 mode:(unsigned int)a6
{
  RBDrawingStateAddShadowStyle3(*((_QWORD *)self + 35), 0, 0, a6, a3, 0.5, a4.width, a4.height, a5.var0, a5.var1, a5.var2, a5.var3);
}

- (void)addProjectionStyleWithArray:(float)a3[9]
{
  RBDrawingStateAddProjectionStyle(*((RB::DisplayList::State **)self + 35), (RB::ProjectionMatrix *)a3);
}

- (void)addRotationStyleWithAngle:(double)a3 anchor:(CGPoint)a4
{
  RBDrawingStateAddRotationStyle(*((__n128 **)self + 35), a3, a4.x, a4.y);
}

- (void)addScaleStyleWithScale:(CGSize)a3 anchor:(CGPoint)a4
{
  RBDrawingStateAddScaleStyle(*((__n128 **)self + 35), (float64x2_t)a3, a3.height, a4.x, a4.y);
}

- (void)addTranslationStyleWithOffset:(CGSize)a3
{
  RBDrawingStateAddTranslationStyle(*((__n128 **)self + 35), (float64x2_t)a3, a3.height);
}

- (void)addRotation3DStyleWithAngle:(double)a3 axis:(id)a4 anchor:(id)a5 perspective:(double)a6 flipWidth:(double)a7
{
  RBDrawingStateAddRotation3DStyle(*((__n128 **)self + 35), a3, *(__n128 *)&a4.var0, a4.var1, a4.var2, *(__n128 *)&a5.var0, a5.var1, a5.var2, a6, a7);
}

- (void)addAffineTransformStyle:(CGAffineTransform *)a3
{
  uint64_t v3;
  float64x2_t v4;
  float64x2_t v5[3];

  v3 = *((_QWORD *)self + 35);
  v4 = *(float64x2_t *)&a3->c;
  v5[0] = *(float64x2_t *)&a3->a;
  v5[1] = v4;
  v5[2] = *(float64x2_t *)&a3->tx;
  RBDrawingStateAddAffineTransformStyle(v3, v5);
}

- (void)addPathProjectionStyleWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 path:(RBPath)a5 transform:(CGAffineTransform *)a6 flags:(unsigned int)a7
{
  uint64_t v7;
  __int128 v8;
  _OWORD v9[3];

  v7 = *((_QWORD *)self + 35);
  v8 = *(_OWORD *)&a6->c;
  v9[0] = *(_OWORD *)&a6->a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a6->tx;
  RBDrawingStateAddPathProjectionStyle(v7, (char *)a5.info, a5.callbacks, (uint64_t)v9, *(const RB::AffineTransform **)&a7, (__n128)a3, a3.y, a4.x, a4.y);
}

- (void)addBlurFilterWithRadius:(double)a3 bounds:(CGRect)a4 flags:(unsigned int)a5
{
  RBDrawingStateAddBlurFilter(*((__n128 **)self + 35), *(_RBDrawingState **)&a5, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)addBlurFilterWithRadius:(double)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddBlurFilter(*((__n128 **)self + 35), *(_RBDrawingState **)&a4, a3, *MEMORY[0x24BDBF028], *(CGFloat *)(MEMORY[0x24BDBF028] + 8), *(CGFloat *)(MEMORY[0x24BDBF028] + 16), *(CGFloat *)(MEMORY[0x24BDBF028] + 24));
}

- (void)addBlurFilterWithRadius:(double)a3 opaque:(BOOL)a4
{
  RBDrawingStateAddBlurFilter(*((__n128 **)self + 35), (_RBDrawingState *)a4, a3, *MEMORY[0x24BDBF028], *(CGFloat *)(MEMORY[0x24BDBF028] + 8), *(CGFloat *)(MEMORY[0x24BDBF028] + 16), *(CGFloat *)(MEMORY[0x24BDBF028] + 24));
}

- (void)addBlurFilterWithRadius:(double)a3
{
  RBDrawingStateAddBlurFilter(*((__n128 **)self + 35), 0, a3, *MEMORY[0x24BDBF028], *(CGFloat *)(MEMORY[0x24BDBF028] + 8), *(CGFloat *)(MEMORY[0x24BDBF028] + 16), *(CGFloat *)(MEMORY[0x24BDBF028] + 24));
}

- (void)addVariableBlurFilterWithRadius:(double)a3 mask:(id)a4 bounds:(CGRect)a5 flags:(unsigned int)a6
{
  RBDrawingStateAddVariableBlurFilter(*((_QWORD *)self + 35), (float16x4_t *)a4, *(RBFill **)&a6, a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)addVariableBlurLayerWithAlpha:(float)a3 scale:(double)a4 radius:(double)a5 bounds:(CGRect)a6 flags:(unsigned int)a7
{
  _RBDrawingState *v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  RB::DisplayList::Builder *v16;
  RB::DisplayList::Layer *v17;
  CGRect v18;

  v7 = *(_RBDrawingState **)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = (RB::DisplayList::Builder *)((char *)self + 16);
  v17 = (RB::DisplayList::Layer *)RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v16, (const char *)1);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  add_variable_blur_layer(*((__n128 **)self + 35), v17, a4, a3, a5, v18, v7);
}

- (void)addAlphaThresholdFilterWithMinAlpha:(float)a3 maxAlpha:(float)a4 color:(id)a5 colorSpace:(int)a6
{
  RBDrawingStateAddAlphaThresholdFilter2(*((_QWORD *)self + 35), a6, a3, a4, a5.var0, a5.var1, a5.var2, a5.var3);
}

- (void)addAlphaThresholdFilterWithAlpha:(float)a3 color:(id)a4 colorSpace:(int)a5
{
  RBDrawingStateAddAlphaThresholdFilter2(*((_QWORD *)self + 35), a5, a3, 1.0, a4.var0, a4.var1, a4.var2, a4.var3);
}

- (void)addAlphaGradientFilterWithStopCount:(int64_t)a3 colors:(id *)a4 colorSpace:(int)a5 locations:(const double *)a6 flags:(unsigned int)a7
{
  RBDrawingStateAddAlphaGradientFilter2(*((_QWORD *)self + 35), a3, (uint64_t)a4, a5, (uint64_t)a6, a7);
}

- (void)addColorMatrixFilterWithArray:(float)a3[20] flags:(unsigned int)a4
{
  RBDrawingStateAddColorMatrixFilter(*((_QWORD *)self + 35), a3, *(RB::XML::Document **)&a4);
}

- (void)addColorMatrixFilterWithArray:(float)a3[20]
{
  RBDrawingStateAddColorMatrixFilter(*((_QWORD *)self + 35), a3, 0);
}

- (void)addColorMultiplyFilterWithColor:(id)a3 colorSpace:(int)a4 flags:(unsigned int)a5
{
  RBDrawingStateAddColorMultiplyFilter2(*((_QWORD *)self + 35), a4, a5, a3.var0, a3.var1, a3.var2, a3.var3);
}

- (void)addColorMultiplyFilterWithColor:(id)a3
{
  RBDrawingStateAddColorMultiplyFilter2(*((_QWORD *)self + 35), 0, 0, a3.var0, a3.var1, a3.var2, a3.var3);
}

- (void)addAlphaMultiplyFilterWithColor:(id)a3 colorSpace:(int)a4 flags:(unsigned int)a5
{
  RBDrawingStateAddAlphaMultiplyFilter2(*((_QWORD *)self + 35), a4, a5, a3.var0, a3.var1, a3.var2, a3.var3);
}

- (void)addAlphaMultiplyFilterWithColor:(id)a3
{
  RBDrawingStateAddAlphaMultiplyFilter2(*((_QWORD *)self + 35), 0, 0, a3.var0, a3.var1, a3.var2, a3.var3);
}

- (void)addHueRotationFilterWithAngle:(double)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddHueRotationFilter(*((_QWORD *)self + 35), a4, a3);
}

- (void)addHueRotationFilterWithAngle:(double)a3
{
  RBDrawingStateAddHueRotationFilter(*((_QWORD *)self + 35), 0, a3);
}

- (void)addSaturationFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddSaturationFilter(*((_QWORD *)self + 35), a4, a3);
}

- (void)addSaturationFilterWithAmount:(float)a3
{
  RBDrawingStateAddSaturationFilter(*((_QWORD *)self + 35), 0, a3);
}

- (void)addBrightnessFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddBrightnessFilter(*((_QWORD *)self + 35), a4, a3);
}

- (void)addBrightnessFilterWithAmount:(float)a3
{
  RBDrawingStateAddBrightnessFilter(*((_QWORD *)self + 35), 0, a3);
}

- (void)addContrastFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddContrastFilter(*((_QWORD *)self + 35), a4, a3);
}

- (void)addContrastFilterWithAmount:(float)a3
{
  RBDrawingStateAddContrastFilter(*((_QWORD *)self + 35), 0, a3);
}

- (void)addLuminanceToAlphaFilterWithFlags:(unsigned int)a3
{
  RBDrawingStateAddLuminanceToAlphaFilter(*((_QWORD *)self + 35), a3);
}

- (void)addLuminanceToAlphaFilter
{
  RBDrawingStateAddLuminanceToAlphaFilter(*((_QWORD *)self + 35), 0);
}

- (void)addColorInvertFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddColorInvertFilter(*((_QWORD *)self + 35), a4, a3);
}

- (void)addColorInvertFilter
{
  RBDrawingStateAddColorInvertFilter(*((_QWORD *)self + 35), 0, 1.0);
}

- (void)addGrayscaleFilterWithAmount:(float)a3 flags:(unsigned int)a4
{
  RBDrawingStateAddGrayscaleFilter(*((_QWORD *)self + 35), a4, a3);
}

- (void)addGrayscaleFilterWithAmount:(float)a3
{
  RBDrawingStateAddGrayscaleFilter(*((_QWORD *)self + 35), 0, a3);
}

- (void)addColorMonochromeFilterWithAmount:(float)a3 color:(id)a4 colorSpace:(int)a5 bias:(float)a6 flags:(unsigned int)a7
{
  RBDrawingStateAddColorMonochromeFilter2(*((_QWORD *)self + 35), a5, 0, a3, a4.var0, a4.var1, a4.var2, a4.var3, a6);
}

- (void)addColorMonochromeFilterWithAmount:(float)a3 color:(id)a4 bias:(float)a5
{
  RBDrawingStateAddColorMonochromeFilter2(*((_QWORD *)self + 35), 0, 0, a3, a4.var0, a4.var1, a4.var2, a4.var3, a5);
}

- (void)addLuminanceCurveFilterWithCurve:(float)a3[4] color:(id)a4 colorSpace:(int)a5 flags:(unsigned int)a6
{
  RBDrawingStateAddLuminanceCurveFilter2(*((_QWORD *)self + 35), (float32x2_t *)a3, a5, a6, a4.var0, a4.var1, a4.var2, a4.var3);
}

- (void)addRGBACurvesFilterWithCurves:(float)a3[16] flags:(unsigned int)a4
{
  RBDrawingStateAddRGBACurvesFilter(*((_QWORD *)self + 35), (_RBDrawingState *)a3, *(RB::XML::Document **)&a4);
}

- (void)addFilterWithShader:(id)a3 border:(CGSize)a4 bounds:(const CGRect *)a5 flags:(unsigned int)a6
{
  RBDrawingStateAddShaderFilter(*((_QWORD *)self + 35), (char *)a3, (float64x2_t *)a5, *(const CGRect **)&a6, a4.width, a4.height);
}

- (void)addFilterLayerWithShader:(id)a3 border:(CGSize)a4 layerBorder:(CGSize)a5 bounds:(const CGRect *)a6 flags:(unsigned int)a7
{
  const CGRect *v7;
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  RB::DisplayList::Builder *v15;
  RB::DisplayList::Layer *v16;
  CGSize v17;
  CGSize v18;

  v7 = *(const CGRect **)&a7;
  height = a5.height;
  width = a5.width;
  v11 = a4.height;
  v12 = a4.width;
  v15 = (RB::DisplayList::Builder *)((char *)self + 16);
  v16 = (RB::DisplayList::Layer *)RB::DisplayList::Builder::end_layer((RB::DisplayList::Builder *)((char *)self + 16), *((const RB::DisplayList::State **)self + 35));
  RB::DisplayList::Builder::restore(v15, (const char *)1);
  v17.width = v12;
  v17.height = v11;
  v18.width = width;
  v18.height = height;
  add_shader_filter_layer(*((_RBDrawingState **)self + 35), (_RBDrawingState *)a3, v16, v17, v18, (const CGSize *)a6, v7);
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  return +[RBMovedDisplayListContents decodedObjectWithData:delegate:error:](RBMovedDisplayListContents, "decodedObjectWithData:delegate:error:", a3, a4, a5);
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  return encode_contents(*((RB::DisplayList::Contents **)self + 3), a3, a4);
}

- (void)beginRecordingXML
{
  RB::XML::Document *v3;
  uint64_t v4;

  if (!*((_QWORD *)self + 38))
  {
    v3 = (RB::XML::Document *)operator new();
    RB::XML::Document::Document(v3);
    v4 = *((_QWORD *)self + 38);
    *((_QWORD *)self + 38) = v3;
    if (v4)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)self + 304, v4);
    *(_DWORD *)(*((_QWORD *)self + 38) + 120) = -[RBDisplayList defaultColorSpace](self, "defaultColorSpace");
  }
}

@end
