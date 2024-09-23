@implementation PXMagazineRectArray

- (PXMagazineRectArray)initWithSize:(unint64_t)a3
{
  PXMagazineRectArray *v4;
  PXMagazineRectArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMagazineRectArray;
  v4 = -[PXMagazineRectArray init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    v4->_rects = (PXMagazineRect *)malloc_type_calloc(a3, 0x20uLL, 0x1000040E0EAB150uLL);
  }
  return v5;
}

- (void)dealloc
{
  PXMagazineRect *rects;
  objc_super v4;

  rects = self->_rects;
  if (rects)
  {
    free(rects);
    self->_rects = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMagazineRectArray;
  -[PXMagazineRectArray dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXMagazineRectArray *v4;

  v4 = -[PXMagazineRectArray initWithSize:]([PXMagazineRectArray alloc], "initWithSize:", self->_size);
  memcpy(v4->_rects, self->_rects, 32 * v4->_size);
  v4->_currentIndex = self->_currentIndex;
  return v4;
}

- (unint64_t)rowsUsed
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (!-[PXMagazineRectArray count](self, "count"))
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  do
  {
    if (self->_rects[v3].var1.var1 + self->_rects[v3].var0.var1 > v5)
      v5 = self->_rects[v3].var1.var1 + self->_rects[v3].var0.var1;
    ++v4;
    ++v3;
  }
  while (v4 < -[PXMagazineRectArray count](self, "count"));
  return v5;
}

- (void)addRect:(PXMagazineRect *)a3
{
  unint64_t currentIndex;
  unint64_t size;
  PXMagazineRect *rects;
  unint64_t v8;
  PXMagazineRect *v9;
  PXMagazineSize var1;

  currentIndex = self->_currentIndex;
  size = self->_size;
  if (currentIndex >= size)
  {
    v8 = 2 * size + 2;
    self->_size = v8;
    rects = (PXMagazineRect *)malloc_type_realloc(self->_rects, 32 * v8, 0x1000040E0EAB150uLL);
    self->_rects = rects;
    currentIndex = self->_currentIndex;
  }
  else
  {
    rects = self->_rects;
  }
  v9 = &rects[currentIndex];
  var1 = a3->var1;
  v9->var0 = a3->var0;
  v9->var1 = var1;
  ++self->_currentIndex;
}

- (void)removeLastRect
{
  PXMagazineRect *rects;
  unint64_t v4;
  PXMagazineRect *v5;

  if (-[PXMagazineRectArray count](self, "count"))
  {
    rects = self->_rects;
    v4 = self->_currentIndex - 1;
    self->_currentIndex = v4;
    v5 = &rects[v4];
    v5->var0 = 0u;
    v5->var1 = 0u;
  }
}

- (PXMagazineRect)rectAtIndex:(SEL)a3
{
  unint64_t v4;
  PXMagazineSize v5;

  v4 = self->var0.var1 + 32 * a4;
  v5 = *(PXMagazineSize *)(v4 + 16);
  retstr->var0 = *(PXMagazineOrigin *)v4;
  retstr->var1 = v5;
  return self;
}

- (unint64_t)count
{
  return self->_currentIndex;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

@end
