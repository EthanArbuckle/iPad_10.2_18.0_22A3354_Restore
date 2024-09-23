@implementation TSTLayoutHint

- (TSTLayoutHint)initWithRange:(id)a3 hintId:(id)a4 partitionPosition:(unsigned int)a5 maximumSize:(CGSize)a6 effectiveSize:(CGSize)a7 layout:(id)a8 validity:(BOOL)a9 horizontal:(BOOL)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat v17;
  CGFloat v18;
  TSTLayoutHint *result;
  objc_super v21;

  height = a7.height;
  width = a7.width;
  v17 = a6.height;
  v18 = a6.width;
  v21.receiver = self;
  v21.super_class = (Class)TSTLayoutHint;
  result = -[TSTLayoutHint init](&v21, sel_init);
  if (result)
  {
    result->mCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
    result->mCacheHintID = ($5CFCD363C99B2F51819B67AD7AD2E060)a4;
    result->mPartitionPosition = a5;
    result->mMaximumSize.width = v18;
    result->mMaximumSize.height = v17;
    result->mEffectiveSize.width = width;
    result->mEffectiveSize.height = height;
    result->mLayout = (TSTLayout *)a8;
    result->mIsValid = a9;
    result->mHorizontal = a10;
    result->mPartitioningPass = 0;
  }
  return result;
}

- (TSTLayoutHint)init
{
  return -[TSTLayoutHint initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:](self, "initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:", 0xFFFFFFLL, 0, 0, 0, 0, 0, INFINITY, INFINITY, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)dealloc
{
  TSTLayout *mLayout;
  objc_super v4;

  mLayout = self->mLayout;
  if (mLayout)
    -[TSTLayout setLayoutHint:](mLayout, "setLayoutHint:", 0);
  self->mLayout = 0;

  self->mPartitioningPass = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSTLayoutHint;
  -[TSTLayoutHint dealloc](&v4, sel_dealloc);
}

- (void)release
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTLayoutHint;
  -[TSTLayoutHint release](&v2, sel_release);
}

- (id)copyForArchiving
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;

  v3 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:", *(_QWORD *)&self->mCellRange, *(_DWORD *)&self->mCacheHintID, self->mPartitionPosition, 0, self->mIsValid, self->mHorizontal, self->mMaximumSize.width, self->mMaximumSize.height, self->mEffectiveSize.width, self->mEffectiveSize.height);
  if (v3)
  {
    v3[3] = self->mPartitioningPass;
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayoutHint copyForArchiving]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutHint.mm"), 111, CFSTR("invalid nil value for '%s'"), "copy");
  }
  return v3;
}

- (BOOL)overlapsWithSelection:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mCellRange;
  unsigned int column;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int16 v14;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
    return (char)v4;
  v5 = objc_msgSend((id)objc_msgSend(v4, "cellRegion"), "boundingCellRange");
  v6 = 0;
  if ((_WORD)v5 == 0xFFFF)
    goto LABEL_25;
  v7 = 0;
  if ((v5 & 0xFF0000) == 0xFF0000)
    goto LABEL_26;
  if (HIWORD(v5))
    v8 = (v5 & 0xFFFF00000000) == 0;
  else
    v8 = 1;
  if (v8)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_26;
  }
  v6 = 0;
  mCellRange = self->mCellRange;
  if (self->mCellRange.origin.row == 0xFFFF)
    goto LABEL_25;
  v7 = 0;
  if ((*(_QWORD *)&mCellRange & 0xFF0000) == 0xFF0000)
    goto LABEL_26;
  v6 = 0;
  if (!HIWORD(*(unint64_t *)&mCellRange))
  {
LABEL_25:
    v7 = 0;
    goto LABEL_26;
  }
  v7 = 0;
  if ((*(_QWORD *)&mCellRange & 0xFFFF00000000) != 0)
  {
    v6 = 0;
    column = BYTE2(v5);
    if (BYTE2(v5) <= mCellRange.origin.column)
      column = mCellRange.origin.column;
    v11 = (unsigned __int16)v5;
    if ((unsigned __int16)v5 <= mCellRange.origin.row)
      v11 = (unsigned __int16)*(_QWORD *)&self->mCellRange;
    v12 = (LOBYTE(mCellRange.size.numberOfColumns) + mCellRange.origin.column - 1);
    if ((BYTE4(v5) + BYTE2(v5) - 1) < v12)
      v12 = (BYTE4(v5) + BYTE2(v5) - 1);
    v13 = (unsigned __int16)(v5 + HIWORD(v5) - 1);
    v14 = mCellRange.origin.row + mCellRange.size.numberOfRows - 1;
    if (v13 >= v14)
      v13 = v14;
    if (v11 <= v13)
    {
      v7 = 0;
      if (column <= v12)
      {
        v7 = ((unint64_t)(v13 - v11) << 48) + 0x1000000000000;
        v6 = (unint64_t)(unsigned __int16)(v12 - column + 1) << 32;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_26:
  LOBYTE(v4) = ((v6 | v7) & 0xFFFF00000000) != 0 && HIWORD(v7) != 0;
  return (char)v4;
}

- (id)firstChildHint
{
  return 0;
}

- (id)lastChildHint
{
  return 0;
}

+ (Class)archivedHintClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isFirstHint
{
  return (self->mCellRange.origin.row | self->mCellRange.origin.column) == 0;
}

- (void)invalidate
{
  if (-[TSTLayoutHint layout](self, "layout"))
    -[TSTLayout invalidate](-[TSTLayoutHint layout](self, "layout"), "invalidate");
  -[TSTLayoutHint setIsValid:](self, "setIsValid:", 0);
}

- (NSString)description
{
  NSString *v3;
  uint64_t v4;
  $CA3468F20078D5D2DB35E78E73CA60DA v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  v3 = (NSString *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (uint64_t)-[TSTLayoutHint cacheHintID](self, "cacheHintID");
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("ID: %@ "), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(v4), (unsigned __int16)v4));
  v5 = -[TSTLayoutHint cellRange](self, "cellRange");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v5.var0.var1, v5.var0.var0);
  -[NSString appendFormat:](v3, "appendFormat:", CFSTR("Range: %@ "), objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@, %@)"), v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), v5.var1.var0, HIWORD(*(unint64_t *)&v5))));
  if (-[TSTLayoutHint horizontal](self, "horizontal"))
    v8 = CFSTR("H");
  else
    v8 = CFSTR("V");
  -[NSString appendString:](v3, "appendString:", v8);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TSTLayoutHint)initWithCoder:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  TSTLayoutHint *v15;

  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumSize"));
  if (v5)
  {
    objc_msgSend(v5, "CGSizeValue");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v10 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveSize"));
  if (v10)
  {
    objc_msgSend(v10, "CGSizeValue");
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x24BDBF148];
    v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v15 = -[TSTLayoutHint initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:](self, "initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:", (objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cellRangeSizeRows")) << 48) | ((unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cellRangeSizeColumns")) << 32) | ((unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cellRangeOriginColumn")) << 16) | (unsigned __int16)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cellRangeOriginRow")), (unsigned __int16)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cacheHintIDRow")) | ((unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cacheHintIDColumn")) << 16), objc_msgSend(a3, "decodeIntForKey:", CFSTR("partitionPosition")), 0, objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isValid")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("horizontal")), v7, v9, v12, v14);
  if (v15)
    v15->mPartitioningPass = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partitioningPass")), "copy");
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->mCellRange.origin.row, CFSTR("cellRangeOriginRow"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mCellRange.origin.column, CFSTR("cellRangeOriginColumn"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mCellRange.size.numberOfColumns, CFSTR("cellRangeSizeColumns"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mCellRange.size.numberOfRows, CFSTR("cellRangeSizeRows"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mCacheHintID.column, CFSTR("cacheHintIDColumn"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mCacheHintID.row, CFSTR("cacheHintIDRow"));
  objc_msgSend(a3, "encodeBool:forKey:", self->mIsValid, CFSTR("isValid"));
  objc_msgSend(a3, "encodeInt:forKey:", self->mPartitionPosition, CFSTR("partitionPosition"));
  objc_msgSend(a3, "encodeBool:forKey:", self->mHorizontal, CFSTR("horizontal"));
  objc_msgSend(a3, "encodeObject:forKey:", self->mPartitioningPass, CFSTR("partitioningPass"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", self->mMaximumSize.width, self->mMaximumSize.height), CFSTR("maximumSize"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", self->mEffectiveSize.width, self->mEffectiveSize.height), CFSTR("effectiveSize"));
}

- (BOOL)isValid
{
  return self->mIsValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->mIsValid = a3;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mCellRange;
}

- (void)setCellRange:(id)a3
{
  self->mCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cacheHintID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mCacheHintID;
}

- (void)setCacheHintID:(id)a3
{
  self->mCacheHintID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (unsigned)partitionPosition
{
  return self->mPartitionPosition;
}

- (void)setPartitionPosition:(unsigned int)a3
{
  self->mPartitionPosition = a3;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMaximumSize.width;
  height = self->mMaximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->mMaximumSize = a3;
}

- (CGSize)effectiveSize
{
  double width;
  double height;
  CGSize result;

  width = self->mEffectiveSize.width;
  height = self->mEffectiveSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEffectiveSize:(CGSize)a3
{
  self->mEffectiveSize = a3;
}

- (TSTLayout)layout
{
  return self->mLayout;
}

- (void)setLayout:(id)a3
{
  self->mLayout = (TSTLayout *)a3;
}

- (BOOL)horizontal
{
  return self->mHorizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->mHorizontal = a3;
}

- (NSNumber)partitioningPass
{
  return self->mPartitioningPass;
}

- (void)setPartitioningPass:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
