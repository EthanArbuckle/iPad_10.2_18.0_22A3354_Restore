@implementation TSTSearchReference

+ (TSTSearchReference)searchReferenceWithTableInfo:(id)a3 cellID:(id)a4 range:(_NSRange)a5
{
  return -[TSTSearchReference initWithTableInfo:cellID:range:]([TSTSearchReference alloc], "initWithTableInfo:cellID:range:", a3, *(unsigned int *)&a4, a5.location, a5.length);
}

- (TSTSearchReference)initWithTableInfo:(id)a3 cellID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  TSTSearchReference *v9;
  objc_super v11;

  length = a5.length;
  location = a5.location;
  v11.receiver = self;
  v11.super_class = (Class)TSTSearchReference;
  v9 = -[TSTSearchReference init](&v11, sel_init);
  if (v9)
  {
    v9->_tableInfo = (TSTTableInfo *)a3;
    v9->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a4;
    v9->_range.location = location;
    v9->_range.length = length;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTSearchReference;
  -[TSTSearchReference dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  NSUInteger location;
  NSUInteger length;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $5CFCD363C99B2F51819B67AD7AD2E060 cellID;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[TSTSearchReference model](self, "model");
  v6 = objc_msgSend(a3, "model");
  location = self->_range.location;
  length = self->_range.length;
  v9 = objc_msgSend(a3, "range");
  v11 = v10;
  cellID = self->_cellID;
  return ((objc_msgSend(a3, "cellID") ^ *(_DWORD *)&cellID) & 0xFFFFFF) == 0
      && v5 == (id)v6
      && location == v9
      && length == v11;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCellID:(id)a3
{
  self->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_cellID;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (uint64_t)-[TSTSearchReference cellID](self, "cellID");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("TSTSearchReference %p cellID %@ range %@"), self, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(v4), (unsigned __int16)v4), NSStringFromRange(self->_range));
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (id)model
{
  return self->_tableInfo;
}

- (id)tableInfo
{
  return self->_tableInfo;
}

- (id)selection
{
  TSTTableSelection *v3;

  v3 = -[TSTTableSelection initWithTableModel:andCellID:]([TSTTableSelection alloc], "initWithTableModel:andCellID:", -[TSTTableInfo tableModel](self->_tableInfo, "tableModel"), *(_DWORD *)&self->_cellID);
  -[TSTTableSelection setSearchReferenceRange:](v3, "setSearchReferenceRange:", self->_range.location, self->_range.length);
  return v3;
}

- (BOOL)isReplaceable
{
  TSTTableInfo *tableInfo;
  TSTCell *v4;
  unsigned int v5;
  $F03D4CA5AAEDD23196D77D4402B24C2D *p_mCurrentCellFormat;
  BOOL v8;
  int mPrivate;

  tableInfo = self->_tableInfo;
  if (!tableInfo)
  {
LABEL_6:
    v4 = objc_alloc_init(TSTCell);
    if (TSTCellAtCellID((uint64_t)-[TSTTableInfo tableModel](self->_tableInfo, "tableModel"), *(_DWORD *)&self->_cellID, v4)|| !self->_range.length)
    {
      goto LABEL_7;
    }
    p_mCurrentCellFormat = ($F03D4CA5AAEDD23196D77D4402B24C2D *)&TSUInvalidFormat;
    if (v4)
      p_mCurrentCellFormat = &v4->mPrivate.mCellFormats.mCurrentCellFormat;
    if (v4->mPrivate.mCellFormats.mCurrentCellFormatID)
      v8 = v4->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 266;
    else
      v8 = 0;
    LOBYTE(v5) = 0;
    if (v8 || p_mCurrentCellFormat->mFormatType == 267)
      goto LABEL_8;
    mPrivate = (int)v4->mPrivate;
    if (BYTE1(mPrivate) > 9u)
LABEL_7:
      LOBYTE(v5) = 0;
    else
      v5 = (0x2ECu >> SBYTE1(mPrivate)) & 1;
LABEL_8:

    return v5;
  }
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[TSDDrawableInfo isLocked](tableInfo, "isLocked"))
      break;
    tableInfo = -[TSDDrawableInfo parentInfo](tableInfo, "parentInfo");
    if (!tableInfo)
      goto LABEL_6;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4 authorCreatedWithCommand:(id *)a5
{
  return +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", self->_tableInfo, *(_DWORD *)&self->_cellID, -[TSTSearchReference range](self, "range", a3, a4, a5), objc_msgSend(a3, "length"));
}

- (id)searchReferenceStart
{
  return +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", self->_tableInfo, *(_DWORD *)&self->_cellID, -[TSTSearchReference range](self, "range"), 0);
}

- (id)searchReferenceEnd
{
  TSTTableInfo *tableInfo;
  uint64_t cellID;
  uint64_t v4;
  uint64_t v5;

  tableInfo = self->_tableInfo;
  cellID = self->_cellID;
  v4 = -[TSTSearchReference range](self, "range");
  return +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", tableInfo, cellID, v4 + v5, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTSearchReference *v4;

  v4 = -[TSTSearchReference initWithTableInfo:cellID:range:]([TSTSearchReference alloc], "initWithTableInfo:cellID:range:", self->_tableInfo, *(_DWORD *)&self->_cellID, self->_range.location, self->_range.length);
  -[TSTSearchReference searchReferencePoint](self, "searchReferencePoint");
  -[TSTSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  return v4;
}

- (NSArray)findHighlights
{
  return self->_findHighlights;
}

- (void)setFindHighlights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)autohideHighlight
{
  return self->_autohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->_autohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->_pulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->_pulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->searchReferencePoint.x;
  y = self->searchReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->searchReferencePoint = a3;
}

- (TSKAnnotation)annotation
{
  return self->annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
