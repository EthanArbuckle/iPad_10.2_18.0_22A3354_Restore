@implementation NSTextTableBlock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextTableBlock setVersion:](NSTextTableBlock, "setVersion:", 1);
    __NSTextTableBlockClass = (uint64_t)a1;
  }
}

- (NSTextTableBlock)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Non-designated initializer called for NSTextTableBlock"));
  return -[NSTextTableBlock initWithTable:startingRow:rowSpan:startingColumn:columnSpan:](self, "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", objc_alloc_init(NSTextTable), 0, 9, 9, 0);
}

- (NSTextTableBlock)initWithTable:(NSTextTable *)table startingRow:(NSInteger)row rowSpan:(NSInteger)rowSpan startingColumn:(NSInteger)col columnSpan:(NSInteger)colSpan
{
  NSTextTableBlock *v12;
  NSTextTableBlock *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSTextTableBlock;
  v12 = -[NSTextBlock init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    if (table)
    {
      v12->_table = table;
      v13->_rowNum = row;
      v13->_colNum = col;
      v13->_rowSpan = rowSpan;
      v13->_colSpan = colSpan;
    }
    else
    {

      return 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextTableBlock;
  -[NSTextBlock dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rowNum;
  int colSpan;
  int rowSpan;
  int colNum;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSTextTableBlock;
  -[NSTextBlock encodeWithCoder:](&v10, sel_encodeWithCoder_);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_table, CFSTR("NSTable"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_rowNum, CFSTR("NSRowNum"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_colNum, CFSTR("NSColNum"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_rowSpan, CFSTR("NSRowSpan"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_colSpan, CFSTR("NSColSpan"));
  }
  else
  {
    rowNum = self->_rowNum;
    colNum = self->_colNum;
    v9 = rowNum;
    rowSpan = self->_rowSpan;
    colSpan = self->_colSpan;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@IIII", &self->_table, &v9, &colNum, &rowSpan, &colSpan);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextTableBlock)initWithCoder:(id)a3
{
  NSTextTableBlock *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSTextTableBlock;
  v4 = -[NSTextBlock initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
    {
      v4->_table = (NSTextTable *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSTable"));
      v4->_rowNum = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSRowNum"));
      v4->_colNum = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSColNum"));
      v4->_rowSpan = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSRowSpan"));
      v4->_colSpan = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSColSpan"));
    }
    else
    {
      v5 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextTableBlock"));
      if (v5 == 1)
      {
        v11 = 0;
        v10 = 0;
        v9 = 0;
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@IIII", &v4->_table, &v11, &v10, (char *)&v9 + 4, &v9);
        v4->_rowNum = v11;
        v4->_colNum = v10;
        v4->_rowSpan = HIDWORD(v9);
        v4->_colSpan = v9;
      }
      else
      {
        v6 = v5;
        v7 = _NSFullMethodName();
        NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v7, 1, v6);

        return 0;
      }
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", self->_table, self->_rowNum, self->_rowSpan, self->_colNum, self->_colSpan);
  objc_msgSend(v4, "_takeValuesFromTextBlock:", self);
  return v4;
}

- (NSTextTable)table
{
  return self->_table;
}

- (NSInteger)startingRow
{
  return self->_rowNum;
}

- (NSInteger)rowSpan
{
  return self->_rowSpan;
}

- (NSInteger)startingColumn
{
  return self->_colNum;
}

- (NSInteger)columnSpan
{
  return self->_colSpan;
}

- (void)_setRowSpan:(int64_t)a3
{
  self->_rowSpan = a3;
}

- (void)_setColumnSpan:(int64_t)a3
{
  self->_colSpan = a3;
}

- (CGRect)rectForLayoutAtPoint:(CGPoint)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterRange:(_NSRange)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[NSTextTable rectForBlock:layoutAtPoint:inRect:textContainer:characterRange:](self->_table, "rectForBlock:layoutAtPoint:inRect:textContainer:characterRange:", self, a5, a6.location, a6.length, a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)boundsRectForContentRect:(CGRect)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterRange:(_NSRange)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[NSTextTable boundsRectForBlock:contentRect:inRect:textContainer:characterRange:](self->_table, "boundsRectForBlock:contentRect:inRect:textContainer:characterRange:", self, a5, a6.location, a6.length, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)drawBackgroundWithFrame:(CGRect)a3 inView:(id)a4 characterRange:(_NSRange)a5 layoutManager:(id)a6
{
  -[NSTextTable drawBackgroundForBlock:withFrame:inView:characterRange:layoutManager:](self->_table, "drawBackgroundForBlock:withFrame:inView:characterRange:layoutManager:", self, a4, a5.location, a5.length, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
