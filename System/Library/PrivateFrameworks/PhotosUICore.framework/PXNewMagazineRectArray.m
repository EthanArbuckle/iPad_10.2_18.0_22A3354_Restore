@implementation PXNewMagazineRectArray

- (PXNewMagazineRectArray)initWithSize:(unint64_t)a3 tileGrid:(id)a4
{
  id v7;
  PXNewMagazineRectArray *v8;
  PXNewMagazineRectArray *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXNewMagazineRectArray;
  v8 = -[PXNewMagazineRectArray init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_size = a3;
    v8->_rects = (PXMagazineRect *)malloc_type_calloc(a3, 0x20uLL, 0x1000040E0EAB150uLL);
    objc_storeStrong((id *)&v9->_tileGrid, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_rects);
  v3.receiver = self;
  v3.super_class = (Class)PXNewMagazineRectArray;
  -[PXNewMagazineRectArray dealloc](&v3, sel_dealloc);
}

- (id)immutableCopyForCurrentRectsCount
{
  PXNewMagazineRectArray *v3;
  PXNewMagazineGrid *tileGrid;
  unint64_t endingType;

  v3 = -[PXNewMagazineRectArray initWithSize:tileGrid:]([PXNewMagazineRectArray alloc], "initWithSize:tileGrid:", -[PXNewMagazineRectArray count](self, "count"), 0);
  memcpy(v3->_rects, self->_rects, 32 * v3->_size);
  v3->_currentIndex = self->_currentIndex;
  tileGrid = self->_tileGrid;
  if (tileGrid)
    endingType = -[PXNewMagazineGrid endingType](tileGrid, "endingType");
  else
    endingType = self->_endingType;
  v3->_endingType = endingType;
  return v3;
}

- (void)reset
{
  bzero(self->_rects, 32 * self->_size);
  -[PXNewMagazineGrid reset](self->_tileGrid, "reset");
  self->_currentIndex = 0;
  self->_endingType = 0;
}

- (unint64_t)rowsUsed
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (!-[PXNewMagazineRectArray count](self, "count"))
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
  while (v4 < -[PXNewMagazineRectArray count](self, "count"));
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
  PXNewMagazineGrid *tileGrid;
  unint64_t v12;
  PXMagazineSize v13;
  _OWORD v14[2];

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
  tileGrid = self->_tileGrid;
  v12 = self->_currentIndex;
  v13 = a3->var1;
  v14[0] = a3->var0;
  v14[1] = v13;
  -[PXNewMagazineGrid setTileIdentifier:forArea:](tileGrid, "setTileIdentifier:forArea:", v12, v14);
  ++self->_currentIndex;
}

- (void)removeLastRect
{
  unint64_t v3;
  PXMagazineRect *v4;
  PXMagazineSize var1;
  PXNewMagazineGrid *tileGrid;
  PXMagazineRect *v7;
  _OWORD v8[2];
  PXMagazineOrigin var0;
  PXMagazineSize v10;

  if (-[PXNewMagazineRectArray count](self, "count"))
  {
    v3 = self->_currentIndex - 1;
    self->_currentIndex = v3;
    v4 = &self->_rects[v3];
    var1 = v4->var1;
    var0 = v4->var0;
    v10 = var1;
    tileGrid = self->_tileGrid;
    v8[0] = var0;
    v8[1] = var1;
    -[PXNewMagazineGrid clearArea:](tileGrid, "clearArea:", v8);
    v7 = &self->_rects[self->_currentIndex];
    v7->var0 = 0u;
    v7->var1 = 0u;
  }
}

- (PXMagazineRect)rectAtIndex:(SEL)a3
{
  unint64_t v4;
  PXMagazineSize v5;

  v4 = self[1].var1.var1 + 32 * a4;
  v5 = *(PXMagazineSize *)(v4 + 16);
  retstr->var0 = *(PXMagazineOrigin *)v4;
  retstr->var1 = v5;
  return self;
}

- (unint64_t)count
{
  return self->_currentIndex;
}

- (double)tileDensity
{
  unint64_t v3;
  double v4;

  v3 = -[PXNewMagazineGrid numberOfColumns](self->_tileGrid, "numberOfColumns");
  v4 = (double)(-[PXNewMagazineGrid currentRowsUsed](self->_tileGrid, "currentRowsUsed") * v3);
  return v4 / (double)(4 * -[PXNewMagazineRectArray count](self, "count"));
}

- (BOOL)isPerfectEnding
{
  PXNewMagazineGrid *tileGrid;
  _BOOL8 v4;

  tileGrid = self->_tileGrid;
  if (tileGrid)
    LOBYTE(v4) = -[PXNewMagazineGrid isPerfectEnding](tileGrid, "isPerfectEnding");
  else
    return self->_endingType == 2;
  return v4;
}

- (BOOL)isGoodEnding
{
  return -[PXNewMagazineGrid isGoodEnding](self->_tileGrid, "isGoodEnding");
}

- (BOOL)nextEmptyTileX:(int64_t *)a3 Y:(int64_t *)a4 maxWidth:(int64_t *)a5
{
  return -[PXNewMagazineGrid nextEmptyTileX:Y:maxWidth:](self->_tileGrid, "nextEmptyTileX:Y:maxWidth:", a3, a4, a5);
}

- (unint64_t)endingType
{
  return -[PXNewMagazineGrid endingType](self->_tileGrid, "endingType");
}

- (BOOL)isEqualToRectArray:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = -[PXNewMagazineRectArray count](self, "count");
  v6 = v5 == objc_msgSend(v4, "count")
    && !memcmp((const void *)objc_msgSend(objc_retainAutorelease(v4), "rects"), -[PXNewMagazineRectArray rects](objc_retainAutorelease(self), "rects"), 32 * v5);

  return v6;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void)setEndingType:(unint64_t)a3
{
  self->_endingType = a3;
}

- (PXMagazineRect)rects
{
  return self->_rects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileGrid, 0);
}

@end
