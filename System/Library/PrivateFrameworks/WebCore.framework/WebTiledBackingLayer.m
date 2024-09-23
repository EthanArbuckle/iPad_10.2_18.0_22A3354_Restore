@implementation WebTiledBackingLayer

- (WebTiledBackingLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebTiledBackingLayer;
  return -[WebTiledBackingLayer init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebTiledBackingLayer;
  -[WebTiledBackingLayer dealloc](&v2, sel_dealloc);
}

- (void)createTileController:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  TileController *value;
  double v8;
  objc_super v10;
  objc_super v11;

  v5 = WTF::fastMalloc((WTF *)0x158);
  v6 = WebCore::TileController::TileController(v5, (uint64_t)a3, 0);
  value = self->_tileController.__ptr_.__value_;
  self->_tileController.__ptr_.__value_ = (TileController *)v6;
  if (value)
  {
    (*(void (**)(TileController *))(*(_QWORD *)value + 8))(value);
    v6 = (uint64_t)self->_tileController.__ptr_.__value_;
  }
  v8 = (float)(*(float *)(*(_QWORD *)(v6 + 48) + 176) * *(float *)(v6 + 36));
  v11.receiver = self;
  v11.super_class = (Class)WebTiledBackingLayer;
  -[WebTiledBackingLayer setContentsScale:](&v11, sel_setContentsScale_, v8);
  v10.receiver = self;
  v10.super_class = (Class)WebTiledBackingLayer;
  -[WebTiledBackingLayer setRasterizationScale:](&v10, sel_setRasterizationScale_, v8);
  return self->_tileController.__ptr_.__value_;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)setBounds:(CGRect)a3
{
  TileController *value;
  WTF::MonotonicTime *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebTiledBackingLayer;
  -[WebTiledBackingLayer setBounds:](&v10, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  value = self->_tileController.__ptr_.__value_;
  v5 = (WTF::MonotonicTime *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)value + 2) + 48) + 144))(*(_QWORD *)(*((_QWORD *)value + 2) + 48));
  if (*((_BYTE *)value + 314))
  {
    v9 = *(_QWORD *)(*((_QWORD *)value + 2) + 48);
    if (v9)
    {
      *((_BYTE *)value + 312) = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 144))(v9);
    }
  }
  else
  {
    v6 = *((_QWORD *)value + 29);
    if ((v6 & 0xFFFFFFFFFFFFLL) == 0 || *(double *)((v6 & 0xFFFFFFFFFFFFLL) + 8) == 0.0)
    {
      v7 = *((double *)value + 32);
      *((_QWORD *)value + 28) = 0;
      WTF::MonotonicTime::now(v5);
      WebCore::TimerBase::setNextFireTime((uint64_t)value + 200, v7 + v8);
    }
    else
    {
      *((_QWORD *)value + 29) = v6 & 0xFDFFFFFFFFFFFFLL | 0x2000000000000;
    }
  }
}

- (void)setOpaque:(BOOL)a3
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  if (*((_BYTE *)value + 309) != a3)
  {
    *((_BYTE *)value + 309) = a3;
    WebCore::TileGrid::updateTileLayerProperties(*((_QWORD *)value + 6), (void *)a2);
  }
}

- (BOOL)isOpaque
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  return value && *((_BYTE *)value + 309) != 0;
}

- (void)setNeedsDisplay
{
  TileController *value;
  uint64_t v3;

  value = self->_tileController.__ptr_.__value_;
  WebCore::TileGrid::setNeedsDisplay(*((_QWORD **)value + 6));
  v3 = *((_QWORD *)value + 7);
  *((_QWORD *)value + 7) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 256))(v3);
  (*(void (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)value + 2) + 48) + 24))(*(_QWORD *)(*((_QWORD *)value + 2) + 48));
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TileController *value;
  float v10;
  float v11;
  CGFloat v12;
  float MaxX;
  unsigned int v14;
  float MaxY;
  WTF *v16;
  WebCore::TileCoverageMap *v17;
  int32x4_t v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  value = self->_tileController.__ptr_.__value_;
  v10 = a3.origin.x;
  LODWORD(v3) = vcvtms_s32_f32(v10);
  v11 = a3.origin.y;
  LODWORD(v4) = vcvtms_s32_f32(v11);
  v12 = x;
  MaxX = CGRectGetMaxX(a3);
  v14 = vcvtps_s32_f32(MaxX);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxY = CGRectGetMaxY(v19);
  v18.i64[0] = v3 | (v4 << 32);
  v18.i32[2] = v14 - v3;
  v18.i32[3] = vcvtps_s32_f32(MaxY) - v4;
  WebCore::TileGrid::setNeedsDisplayInRect(*((_QWORD *)value + 6), &v18);
  v16 = (WTF *)*((_QWORD *)value + 7);
  if (v16)
    WebCore::TileGrid::dropTilesInRect(v16, &v18);
  v17 = (WebCore::TileCoverageMap *)*((_QWORD *)value + 5);
  if (v17)
    WebCore::TileCoverageMap::setNeedsUpdate(v17);
}

- (void)setDrawsAsynchronously:(BOOL)a3
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  if (*((_BYTE *)value + 307) != a3)
  {
    *((_BYTE *)value + 307) = a3;
    WebCore::TileGrid::updateTileLayerProperties(*((_QWORD *)value + 6), (void *)a2);
  }
}

- (BOOL)drawsAsynchronously
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  return value && *((_BYTE *)value + 307) != 0;
}

- (void)setWantsDeepColorBackingStore:(BOOL)a3
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  if (*((_BYTE *)value + 308) != a3)
  {
    *((_BYTE *)value + 308) = a3;
    WebCore::TileGrid::updateTileLayerProperties(*((_QWORD *)value + 6), (void *)a2);
  }
}

- (BOOL)wantsDeepColorBackingStore
{
  return *((_BYTE *)self->_tileController.__ptr_.__value_ + 308);
}

- (void)setContentsScale:(double)a3
{
  float v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebTiledBackingLayer;
  -[WebTiledBackingLayer setContentsScale:](&v6, sel_setContentsScale_);
  v5 = a3;
  WebCore::TileController::setContentsScale((WebCore::TileController *)self->_tileController.__ptr_.__value_, v5);
}

- (double)contentsScale
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  if (value)
    return (float)(*(float *)(*((_QWORD *)value + 6) + 176) * *((float *)value + 9));
  else
    return 1.0;
}

- (void)tiledBacking
{
  return self->_tileController.__ptr_.__value_;
}

- (void)invalidate
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  self->_tileController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(TileController *))(*(_QWORD *)value + 8))(value);
}

- (void)setBorderColor:(CGColor *)a3
{
  TileController *value;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  value = self->_tileController.__ptr_.__value_;
  v4 = WebCore::roundAndClampToSRGBALossy(a3, (CGColor *)a2);
  v5 = bswap32(v4) | 0x1104000000000000;
  if (!BYTE4(v4))
    v5 = 0;
  v10 = v5;
  WebCore::TileController::setTileDebugBorderColor((uint64_t)value, &v10);
  if ((v10 & 0x8000000000000) != 0)
  {
    v7 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFLL);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v6);
    }
  }
}

- (void)setBorderWidth:(double)a3
{
  TileController *value;
  float v4;

  value = self->_tileController.__ptr_.__value_;
  v4 = a3 * 0.5;
  if (*((float *)value + 82) != v4)
  {
    *((float *)value + 82) = v4;
    WebCore::TileGrid::updateTileLayerProperties(*((_QWORD *)value + 6), (void *)a2);
  }
}

- (void).cxx_destruct
{
  TileController *value;

  value = self->_tileController.__ptr_.__value_;
  self->_tileController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(TileController *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
