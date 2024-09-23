@implementation TSTLayoutSpace

- (TSTLayout)layout
{
  return -[TSTLayoutSpaceBundle layout](-[TSTLayoutSpace bundle](self, "bundle"), "layout");
}

- (TSTMasterLayout)masterLayout
{
  return -[TSTLayout masterLayout](-[TSTLayoutSpaceBundle layout](-[TSTLayoutSpace bundle](self, "bundle"), "layout"), "masterLayout");
}

- (BOOL)p_getLayoutDirectionLeftToRight
{
  return -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTLayout tableModel](-[TSTLayoutSpace layout](self, "layout"), "tableModel"), "tableStyle"), "intValueForProperty:", 798) != 1;
}

- (BOOL)isMain
{
  return self->mLayoutSpaceType == 0;
}

- (BOOL)isFrozen
{
  return (self->mLayoutSpaceType - 1) < 3;
}

- (BOOL)isRepeat
{
  return (self->mLayoutSpaceType - 4) < 3;
}

- (BOOL)isColumns
{
  int mLayoutSpaceType;

  mLayoutSpaceType = self->mLayoutSpaceType;
  return mLayoutSpaceType == 2 || mLayoutSpaceType == 5;
}

- (BOOL)isRows
{
  int mLayoutSpaceType;

  mLayoutSpaceType = self->mLayoutSpaceType;
  return mLayoutSpaceType == 3 || mLayoutSpaceType == 6;
}

- (BOOL)isCorner
{
  int mLayoutSpaceType;

  mLayoutSpaceType = self->mLayoutSpaceType;
  return mLayoutSpaceType == 1 || mLayoutSpaceType == 4;
}

- (TSTLayoutSpace)initWithLayoutSpaceBundle:(id)a3 type:(int)a4
{
  TSTLayoutSpace *v6;
  TSTLayoutSpace *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGPoint *v12;
  CGPoint v13;
  CGSize v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSTLayoutSpace;
  v6 = -[TSTLayoutSpace init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mBundle = (TSTLayoutSpaceBundle *)a3;
    v6->mLayoutSpaceType = a4;
    v6->mInvalidFlags = ($0970EE139DC40728BCB6A4443C122593)257;
    TSTLayoutSpaceSetGridRange((uint64_t)v6, -1, -1);
    *(_WORD *)&v7->mHeaderColumnsRepeat = 0;
    v7->mViewScale = 1.0;
    v8 = MEMORY[0x24BDBD8B8];
    v9 = *MEMORY[0x24BDBD8B8];
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v7->mTransformToCanvas.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v7->mTransformToCanvas.c = v10;
    v11 = *(_OWORD *)(v8 + 32);
    *(_OWORD *)&v7->mTransformToCanvas.tx = v11;
    *(_OWORD *)&v7->mTransformFromCanvas.a = v9;
    *(_OWORD *)&v7->mTransformFromCanvas.c = v10;
    *(_OWORD *)&v7->mTransformFromCanvas.tx = v11;
    *(_OWORD *)&v7->mTransformToDevice.c = v10;
    *(_OWORD *)&v7->mTransformToDevice.a = v9;
    *(_OWORD *)&v7->mTransformToDevice.tx = v11;
    *(_OWORD *)&v7->mTransformFromDevice.a = v9;
    *(_OWORD *)&v7->mTransformFromDevice.c = v10;
    *(_OWORD *)&v7->mTransformFromDevice.tx = v11;
    *(_WORD *)&v7->mDrawBlackAndWhite = 256;
    v12 = (CGPoint *)MEMORY[0x24BDBF090];
    *(_OWORD *)&v7->mHeaderRowColumnCoordinates = 0u;
    *(_OWORD *)&v7->mHeaderColumnRowCoordinates = 0u;
    v13 = *v12;
    v14 = (CGSize)v12[1];
    v7->mCachedFrame.origin = *v12;
    v7->mCachedFrame.size = v14;
    v7->mCachedAlignedFrame.origin = v13;
    v7->mCachedAlignedFrame.size = v14;
    v7->mCachedStrokeFrame.origin = v13;
    v7->mCachedStrokeFrame.size = v14;
    v7->mCachedAlignedStrokeFrame.origin = v13;
    v7->mCachedAlignedStrokeFrame.size = v14;
    pthread_rwlock_init(&v7->mLock, 0);
    v7->mLayoutDirectionIsLeftToRight = -[TSTLayoutSpace p_getLayoutDirectionLeftToRight](v7, "p_getLayoutDirectionLeftToRight");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->mHeaderRowColumnCoordinates = 0;
  self->mBodyColumnCoordinates = 0;

  self->mHeaderColumnRowCoordinates = 0;
  self->mBodyRowCoordinates = 0;
  pthread_rwlock_destroy(&self->mLock);
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutSpace;
  -[TSTLayoutSpace dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t mLayoutSpaceType;
  const __CFString *v7;
  unsigned int column;
  uint64_t row;
  $3C36844D3994842D9102894F8152D7DE bottomRight;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  __int128 v16;
  NSString *v17;
  uint64_t v19;
  CGAffineTransform transform;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  mLayoutSpaceType = self->mLayoutSpaceType;
  if (mLayoutSpaceType > 6)
    v7 = CFSTR("TSTLayoutSpaceTypeUnknown");
  else
    v7 = off_24D82F658[mLayoutSpaceType];
  column = self->mGridRange.topLeft.column;
  row = self->mGridRange.topLeft.row;
  bottomRight = self->mGridRange.bottomRight;
  v11 = (void *)MEMORY[0x24BDD17C8];
  if ((row & column) == 0xFFFFFFFF)
  {
    v13 = CFSTR("{invalid, invalid}");
  }
  else
  {
    if (column == -1)
    {
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{invalid, %u}"), self->mGridRange.topLeft.row, v19);
    }
    else if ((_DWORD)row == -1)
    {
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%u, invalid}"), self->mGridRange.topLeft.column, v19);
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%u, %u}"), self->mGridRange.topLeft.column, row);
    }
    v13 = (const __CFString *)v12;
  }
  if ((bottomRight.row & bottomRight.column) == -1)
  {
    v14 = CFSTR("{invalid, invalid}");
  }
  else if (bottomRight.column == -1)
  {
    v14 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{invalid, %u}"), HIDWORD(*(unint64_t *)&bottomRight), v19);
  }
  else if (bottomRight.row == -1)
  {
    v14 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%u, invalid}"), bottomRight, v19);
  }
  else
  {
    v14 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%u, %u}"), bottomRight, HIDWORD(*(unint64_t *)&bottomRight));
  }
  v15 = objc_msgSend(v11, "stringWithFormat:", CFSTR("{%@->%@}"), v13, v14);
  v16 = *(_OWORD *)&self->mTransformToDevice.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->mTransformToDevice.a;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->mTransformToDevice.tx;
  v17 = NSStringFromCGAffineTransform(&transform);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p type=%@ gridRange=%@ transformToDevice=%@ tableOffset=%@ invalidFlags=%d>"), v5, self, v7, v15, v17, NSStringFromCGPoint(self->mTableOffset), self->mInvalidFlags.coordinates);
}

- (void)lockForRead
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = pthread_rwlock_rdlock(&self->mLock);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayoutSpace lockForRead]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 287, CFSTR("Unable to lock layout space for reading: %d"), v3);
  }
}

- (void)lockForWrite
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = pthread_rwlock_wrlock(&self->mLock);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayoutSpace lockForWrite]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 311, CFSTR("Unable to lock layout space for writing: %d"), v3);
  }
}

- (void)unlock
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = pthread_rwlock_unlock(&self->mLock);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayoutSpace unlock]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 321, CFSTR("Unable to unlock layout space: %d"), v3);
  }
}

- (void)invalidateCoordinates
{
  -[TSTLayoutSpace lockForWrite](self, "lockForWrite");
  self->mInvalidFlags.coordinates = 1;
  -[TSTLayoutSpace unlock](self, "unlock");
}

- (void)invalidateTableOffset
{
  -[TSTLayoutSpace lockForWrite](self, "lockForWrite");
  self->mInvalidFlags.tableOffset = 1;
  -[TSTLayoutSpace unlock](self, "unlock");
}

- (int)validate:(id)a3
{
  int v5;
  int v7;

  if (!*(_WORD *)&self->mInvalidFlags)
    return 0;
  -[TSTLayoutSpace lockForWrite](self, "lockForWrite");
  self->mLayoutDirectionIsLeftToRight = -[TSTLayoutSpace p_getLayoutDirectionLeftToRight](self, "p_getLayoutDirectionLeftToRight");
  -[TSTLayoutSpace validateCachedFrames](self, "validateCachedFrames");
  v5 = -[TSTLayoutSpace validateCoordinateCache:](self, "validateCoordinateCache:", a3);
  v7 = -[TSTLayoutSpace validateTableOffset:](self, "validateTableOffset:", a3) | v5;
  -[TSTLayoutSpace unlock](self, "unlock");
  return v7;
}

- (int)validateTableOffset:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  $3C36844D3994842D9102894F8152D7DE topLeft;
  $3C36844D3994842D9102894F8152D7DE bottomRight;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  int Range;
  double v19;
  double v20;
  double v21;
  double v22;

  if (!self->mInvalidFlags.tableOffset)
    return 0;
  if (a3)
  {
    objc_msgSend(a3, "tableOffset");
    v5 = v4;
    v7 = v6;
    v8 = 0;
  }
  else
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    topLeft = self->mGridRange.topLeft;
    bottomRight = self->mGridRange.bottomRight;
    v12 = topLeft.column == -1 || bottomRight.column == -1 || topLeft.column > bottomRight.column;
    v13 = HIDWORD(*(unint64_t *)&topLeft);
    v14 = HIDWORD(*(unint64_t *)&bottomRight);
    if (!v12 && (_DWORD)v13 != -1 && (_DWORD)v14 != -1 && v13 <= v14)
    {
      Range = TSTLayoutSpaceGetRange((uint64_t)self);
      v19 = TSTMasterLayoutStrokeHeightOfGridRow(-[TSTLayoutSpace masterLayout](self, "masterLayout"), (unsigned __int16)Range, 0, 0xFFFFFFFF);
      v5 = -floor(v5- TSTMasterLayoutStrokeWidthOfGridColumn(-[TSTLayoutSpace masterLayout](self, "masterLayout"), BYTE2(Range), 0, 0xFFFFFFFF)* 0.5+ -1.0+ 0.00000011920929);
      TSTLayoutGetTableNameHeight((uint64_t)-[TSTLayoutSpace layout](self, "layout"));
      v7 = v20 - floor(v7 - v19 * 0.5 + -1.0 + 0.00000011920929);
    }
    -[TSTLayoutSpace tableOffset](self, "tableOffset");
    if (v22 == v7 && v21 == v5)
      v8 = 0;
    else
      v8 = 3;
  }
  -[TSTLayoutSpace setTableOffset:](self, "setTableOffset:", v5, v7);
  self->mInvalidFlags.tableOffset = 0;
  return v8;
}

- (void)setTransformToCanvas:(CGAffineTransform *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v4 = *(_OWORD *)&a3->a;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformToCanvas.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformToCanvas.c = v5;
  *(_OWORD *)&self->mTransformToCanvas.a = v4;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v8.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformInvert(&v9, &v8);
  v7 = *(_OWORD *)&v9.c;
  *(_OWORD *)&self->mTransformFromCanvas.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&self->mTransformFromCanvas.c = v7;
  *(_OWORD *)&self->mTransformFromCanvas.tx = *(_OWORD *)&v9.tx;
}

- (void)setViewScale:(double)a3
{
  if (self->mViewScale != a3)
  {
    self->mViewScale = a3;
    self->mInvalidFlags.tableOffset = 1;
  }
}

- (void)validateCachedFrames
{
  CGPoint v2;
  CGSize v3;

  if (self->mInvalidFlags.coordinates || self->mInvalidFlags.tableOffset)
  {
    v2 = (CGPoint)*MEMORY[0x24BDBF090];
    v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->mCachedFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->mCachedFrame.size = v3;
    self->mCachedAlignedFrame.origin = v2;
    self->mCachedAlignedFrame.size = v3;
    self->mCachedStrokeFrame.origin = v2;
    self->mCachedStrokeFrame.size = v3;
    self->mCachedAlignedStrokeFrame.origin = v2;
    self->mCachedAlignedStrokeFrame.size = v3;
  }
}

- (int)validateCoordinateCache:(id)a3
{
  TSTCoordinateArray *RowCoordinates;
  TSTCoordinateArray *ColumnCoordinates;
  TSTCoordinateArray *v7;
  TSTCoordinateArray *v8;
  unint64_t TopLeftCornerGridRange;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t HeaderColumnsGridRange;
  unint64_t v15;
  unint64_t HeaderRowsGridRange;
  uint64_t v17;
  unint64_t ExtendedBodyGridRange;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  $3C36844D3994842D9102894F8152D7DE bottomRight;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  double Coordinate;
  double v29;
  __int16 v30;

  v30 = 0;
  if (!self->mInvalidFlags.coordinates)
    return 0;
  if ((self->mLayoutSpaceType - 1) > 5)
  {
    TopLeftCornerGridRange = TSTLayoutSpaceGetTopLeftCornerGridRange(self);
    v12 = TopLeftCornerGridRange;
    if ((_DWORD)TopLeftCornerGridRange == -1
      || (v13 = v11, (_DWORD)v11 == -1)
      || TopLeftCornerGridRange > v11
      || HIDWORD(TopLeftCornerGridRange) == -1
      || HIDWORD(v11) == -1
      || HIDWORD(TopLeftCornerGridRange) > HIDWORD(v11))
    {
      HeaderColumnsGridRange = TSTLayoutSpaceGetHeaderColumnsGridRange((uint64_t)self);
      RowCoordinates = 0;
      if ((_DWORD)HeaderColumnsGridRange != -1
        && (_DWORD)v15 != -1
        && HeaderColumnsGridRange <= v15)
      {
        RowCoordinates = 0;
        if (HIDWORD(HeaderColumnsGridRange) != -1
          && HIDWORD(v15) != -1
          && HIDWORD(HeaderColumnsGridRange) <= HIDWORD(v15))
        {
          RowCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, HeaderColumnsGridRange, v15, self->mHeaderColumnRowCoordinates, (char *)&v30);
        }
      }
      HeaderRowsGridRange = TSTLayoutSpaceGetHeaderRowsGridRange((uint64_t)self);
      v12 = HeaderRowsGridRange;
      ColumnCoordinates = 0;
      if ((_DWORD)HeaderRowsGridRange == -1)
        goto LABEL_26;
      v13 = v17;
      if ((_DWORD)v17 == -1)
        goto LABEL_26;
      if (HeaderRowsGridRange > v17)
        goto LABEL_26;
      ColumnCoordinates = 0;
      if (HIDWORD(HeaderRowsGridRange) == -1 || HIDWORD(v17) == -1 || HIDWORD(HeaderRowsGridRange) > HIDWORD(v17))
        goto LABEL_26;
    }
    else
    {
      RowCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, TopLeftCornerGridRange, v11, self->mHeaderColumnRowCoordinates, (char *)&v30);
    }
    ColumnCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateColumnCoordinates(self, v12, v13, self->mHeaderRowColumnCoordinates, (char *)&v30 + 1);
LABEL_26:
    ExtendedBodyGridRange = (unint64_t)TSTLayoutSpaceGetExtendedBodyGridRange(self);
    v20 = ExtendedBodyGridRange;
    v7 = 0;
    if ((_DWORD)ExtendedBodyGridRange == -1
      || (v21 = v19, (_DWORD)v19 == -1)
      || ExtendedBodyGridRange > v19
      || (v7 = 0, HIDWORD(ExtendedBodyGridRange) == -1)
      || HIDWORD(v19) == -1
      || HIDWORD(ExtendedBodyGridRange) > HIDWORD(v19))
    {
      v8 = 0;
    }
    else
    {
      v8 = (TSTCoordinateArray *)TSTLayoutSpaceCreateColumnCoordinates(self, ExtendedBodyGridRange, v19, self->mBodyColumnCoordinates, (char *)&v30 + 1);
      v7 = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, v20, v21, self->mBodyRowCoordinates, (char *)&v30);
    }
    goto LABEL_34;
  }
  RowCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, *(_QWORD *)&self->mGridRange.topLeft, *(_QWORD *)&self->mGridRange.bottomRight, self->mHeaderColumnRowCoordinates, (char *)&v30);
  ColumnCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateColumnCoordinates(self, *(_QWORD *)&self->mGridRange.topLeft, *(_QWORD *)&self->mGridRange.bottomRight, self->mHeaderRowColumnCoordinates, (char *)&v30 + 1);
  v7 = 0;
  v8 = 0;
LABEL_34:

  self->mHeaderRowColumnCoordinates = 0;
  self->mBodyColumnCoordinates = 0;

  self->mHeaderColumnRowCoordinates = 0;
  self->mBodyRowCoordinates = 0;
  if (!self->mLayoutDirectionIsLeftToRight)
  {
    if (v8)
    {
      TSTLayoutSpaceGetExtendedBodyGridRange(self);
      bottomRight.column = v22;
      v24 = (uint64_t)v8;
    }
    else
    {
      bottomRight = self->mGridRange.bottomRight;
      if (ColumnCoordinates)
      {
        v24 = (uint64_t)ColumnCoordinates;
      }
      else
      {
        v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayoutSpace validateCoordinateCache:]");
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 3121, CFSTR("There are no column coordinates"));
        v24 = 0;
      }
    }
    v27 = -[TSTLayoutSpace isMain](self, "isMain");
    if (!a3 || v27)
      Coordinate = TSTCoordinateArrayGetCoordinate(v24, bottomRight.column + 1);
    else
      Coordinate = TSTLayoutSpaceGetRawTableCoordinateForGridColumn((TSTLayoutSpace *)a3, (*((_DWORD *)a3 + 8) + 1));
    v29 = Coordinate;
    if (v8)
      -[TSTCoordinateArray hasRightToLeftOrderingWithWidth:](v8, "hasRightToLeftOrderingWithWidth:", Coordinate);
    if (ColumnCoordinates)
      -[TSTCoordinateArray hasRightToLeftOrderingWithWidth:](ColumnCoordinates, "hasRightToLeftOrderingWithWidth:", v29);
  }
  self->mHeaderRowColumnCoordinates = ColumnCoordinates;
  self->mBodyColumnCoordinates = v8;
  self->mHeaderColumnRowCoordinates = RowCoordinates;
  self->mBodyRowCoordinates = v7;
  self->mInvalidFlags.coordinates = 0;
  return HIBYTE(v30) | (2 * v30);
}

- (TSTLayoutSpaceBundle)bundle
{
  return self->mBundle;
}

- (int)layoutSpaceType
{
  return self->mLayoutSpaceType;
}

- (BOOL)layoutDirectionIsLeftToRight
{
  return self->mLayoutDirectionIsLeftToRight;
}

- (BOOL)headerColumnsRepeat
{
  return self->mHeaderColumnsRepeat;
}

- (void)setHeaderColumnsRepeat:(BOOL)a3
{
  self->mHeaderColumnsRepeat = a3;
}

- (BOOL)headerRowsRepeat
{
  return self->mHeaderRowsRepeat;
}

- (void)setHeaderRowsRepeat:(BOOL)a3
{
  self->mHeaderRowsRepeat = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (CGAffineTransform)transformToCanvas
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (CGAffineTransform)transformFromCanvas
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setTransformFromCanvas:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformFromCanvas.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformFromCanvas.c = v4;
  *(_OWORD *)&self->mTransformFromCanvas.a = v3;
}

- (CGAffineTransform)transformToDevice
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setTransformToDevice:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformToDevice.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformToDevice.c = v4;
  *(_OWORD *)&self->mTransformToDevice.a = v3;
}

- (CGAffineTransform)transformFromDevice
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].ty;
  return self;
}

- (void)setTransformFromDevice:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformFromDevice.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformFromDevice.c = v4;
  *(_OWORD *)&self->mTransformFromDevice.a = v3;
}

- (BOOL)drawBlackAndWhite
{
  return self->mDrawBlackAndWhite;
}

- (void)setDrawBlackAndWhite:(BOOL)a3
{
  self->mDrawBlackAndWhite = a3;
}

- (BOOL)drawPreventAntialias
{
  return self->mDrawPreventAntialias;
}

- (void)setDrawPreventAntialias:(BOOL)a3
{
  self->mDrawPreventAntialias = a3;
}

- (CGPoint)tableOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->mTableOffset.x;
  y = self->mTableOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTableOffset:(CGPoint)a3
{
  self->mTableOffset = a3;
}

@end
