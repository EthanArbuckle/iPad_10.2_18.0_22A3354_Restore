@implementation TSWPColumns

- (unint64_t)columnCount
{
  return self->_columnCount;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double *v10;
  double v11;

  v6 = 0;
  v7 = self->_columnCount - 1;
  v8 = 0.0;
  do
  {
    v9 = v8;
    v10 = (double *)(&self->super.isa + v6);
    v8 = v8 + v10[3];
    if (v7 > v6)
      v8 = v8 + v10[13];
    ++v6;
  }
  while (a3 >= v6);
  if (a5)
    *a5 = self->_widthArray[a3] * a4;
  if (a6)
  {
    v11 = 0.0;
    if (v7 > a3)
      v11 = self->_gapArray[a3] * a4;
    *a6 = v11;
  }
  return v9 * a4;
}

- (TSWPColumns)initWithEqualColumnCount:(unint64_t)a3 gapFraction:(double)a4
{
  TSWPColumns *v6;
  TSWPColumns *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPColumns;
  v6 = -[TSWPColumns init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_equalWidth = 1;
    -[TSWPColumns p_setColumnCount:gapFraction:](v6, "p_setColumnCount:gapFraction:", a3, a4);
  }
  return v7;
}

- (void)p_setEqualWidth:(double)a3 equalGap:(double)a4
{
  unint64_t columnCount;
  unint64_t v5;
  double *v6;

  columnCount = self->_columnCount;
  if (columnCount)
  {
    v5 = 0;
    do
    {
      v6 = (double *)(&self->super.isa + v5);
      v6[3] = a3;
      if (columnCount - 1 > v5)
        v6[13] = a4;
      ++v5;
    }
    while (columnCount > v5);
  }
}

- (void)p_setColumnCount:(unint64_t)a3 gapFraction:(double)a4
{
  double v5;

  self->_columnCount = a3;
  v5 = (double)(a3 - 1);
  if (a3 >= 2)
    a4 = fmin(v5 * a4, 0.75) / v5;
  -[TSWPColumns p_setEqualWidth:equalGap:](self, "p_setEqualWidth:equalGap:", (1.0 - v5 * a4) / (double)a3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  unint64_t columnCount;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v11;
  unsigned int v12;
  double v13;
  double v14;
  BOOL v15;

  objc_opt_class();
  v5 = TSUDynamicCast();
  LOBYTE(columnCount) = a3 == self;
  if (a3 != self && v5)
  {
    columnCount = self->_columnCount;
    if (columnCount != *(_QWORD *)(v5 + 8) || self->_equalWidth != *(unsigned __int8 *)(v5 + 16))
    {
LABEL_11:
      LOBYTE(columnCount) = 0;
      return columnCount;
    }
    if (columnCount)
    {
      v7 = 0;
      v8 = 1;
      while (*(double *)(v5 + 24 + 8 * v7) == self->_widthArray[v7])
      {
        v7 = v8;
        v15 = columnCount > v8++;
        if (!v15)
        {
          v9 = columnCount - 1;
          if (columnCount != 1)
            goto LABEL_14;
          return columnCount;
        }
      }
      goto LABEL_11;
    }
    v9 = -1;
LABEL_14:
    v11 = 0;
    v12 = 1;
    do
    {
      v13 = *(double *)(v5 + 104 + 8 * v11);
      v14 = self->_gapArray[v11];
      LOBYTE(columnCount) = v13 == v14;
      v11 = v12++;
      v15 = v13 == v14 && v9 > v11;
    }
    while (v15);
  }
  return columnCount;
}

+ (id)columns
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithColumnCount:", 1);
}

- (TSWPColumns)initWithColumnCount:(unint64_t)a3
{
  TSWPColumns *v4;
  TSWPColumns *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPColumns;
  v4 = -[TSWPColumns init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TSWPColumns p_setColumnCount:gapFraction:](v4, "p_setColumnCount:gapFraction:", a3, 0.0500000007);
  return v5;
}

- (TSWPColumns)init
{
  return -[TSWPColumns initWithColumnCount:](self, "initWithColumnCount:", 1);
}

- (TSWPColumns)initWithColumnCount:(unint64_t)a3 equalWidth:(BOOL)a4 widthArray:(double *)a5 gapArray:(double *)a6
{
  TSWPColumns *v10;
  TSWPColumns *v11;
  unint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSWPColumns;
  v10 = -[TSWPColumns init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      v12 = 10;
      if (a3 < 0xA)
        v12 = a3;
      v10->_columnCount = v12;
      v10->_equalWidth = a4;
      v13 = 8 * v12;
      memcpy(v10->_widthArray, a5, 8 * v12);
      memcpy(v11->_gapArray, a6, v13 - 8);
    }
    else
    {
      -[TSWPColumns p_setColumnCount:gapFraction:](v10, "p_setColumnCount:gapFraction:", 1, 0.0500000007);
    }
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSWPColumns initWithColumnCount:equalWidth:widthArray:gapArray:](+[TSWPColumns allocWithZone:](TSWPColumns, "allocWithZone:", a3), "initWithColumnCount:equalWidth:widthArray:gapArray:", self->_columnCount, self->_equalWidth, self->_widthArray, self->_gapArray);
}

- (void)setColumnCount:(unint64_t)a3
{
  double v3;

  if (a3 - 1 <= 9)
  {
    v3 = 0.0500000007;
    if (self->_equalWidth && self->_columnCount >= 2)
      v3 = self->_gapArray[0];
    -[TSWPColumns p_setColumnCount:gapFraction:](self, "p_setColumnCount:gapFraction:", v3);
  }
}

- (void)setEqualWidth:(BOOL)a3
{
  self->_equalWidth = a3;
  if (a3)
    -[TSWPColumns p_setColumnCount:gapFraction:](self, "p_setColumnCount:gapFraction:", self->_columnCount, 0.0500000007);
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return self->_widthArray[a3] * a4;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return self->_gapArray[a3] * a4;
}

- (double)p_equalGapForEqualWidth:(double)a3
{
  unint64_t columnCount;
  double v4;
  double v5;
  void *v8;
  uint64_t v9;

  columnCount = self->_columnCount;
  v4 = 0.0;
  if (columnCount >= 2)
  {
    v5 = (double)columnCount * a3;
    if (v5 <= 0.0 || v5 > 1.0)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumns p_equalGapForEqualWidth:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumns.mm"), 344, CFSTR("Bad column width fraction"));
      columnCount = self->_columnCount;
    }
    v4 = 0.0;
    if ((1.0 - v5) / (double)(columnCount - 1) >= 0.0)
      return (1.0 - v5) / (double)(columnCount - 1);
  }
  return v4;
}

- (double)p_equalWidthForEqualGap:(double)a3
{
  unint64_t columnCount;
  double v4;
  double v5;
  void *v8;
  uint64_t v9;

  columnCount = self->_columnCount;
  v4 = 1.0;
  if (columnCount >= 2)
  {
    v5 = (double)(columnCount - 1) * a3;
    if (v5 < 0.0 || v5 > 1.0)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumns p_equalWidthForEqualGap:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumns.mm"), 365, CFSTR("Bad column gap fraction"));
      columnCount = self->_columnCount;
    }
    if ((1.0 - v5) / (double)columnCount <= 1.0)
      return (1.0 - v5) / (double)columnCount;
    else
      return 1.0;
  }
  return v4;
}

- (void)setWidth:(double)a3 forColumnIndex:(unint64_t)a4 bodyWidth:(double)a5
{
  unint64_t columnCount;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double *widthArray;
  double v18;
  unint64_t v19;
  double v20;
  double v21;

  columnCount = self->_columnCount;
  if (columnCount < 2)
  {
    v9 = 1.0;
    v11 = 0.0;
LABEL_9:
    -[TSWPColumns p_setEqualWidth:equalGap:](self, "p_setEqualWidth:equalGap:", v9, v11);
    return;
  }
  v7 = 36.0 / a5;
  v8 = a3 / a5;
  if (self->_equalWidth)
  {
    v9 = (float)(1.0 / (float)columnCount);
    if (v8 >= v7)
      v10 = v8;
    else
      v10 = v7;
    v11 = 0.0;
    if (v10 < v9)
    {
      -[TSWPColumns p_equalGapForEqualWidth:](self, "p_equalGapForEqualWidth:", a4, v10, 0.0);
      v11 = v12;
      v9 = v10;
    }
    goto LABEL_9;
  }
  v13 = 1.0 - v7 * (double)(columnCount - 1);
  v14 = 13;
  do
  {
    v13 = v13 - *((double *)&self->super.isa + v14);
    v15 = (v14++ - 12);
  }
  while (columnCount - 1 > v15);
  if (v8 <= v13)
    v13 = v8;
  if (v13 >= v7)
    v16 = v13;
  else
    v16 = v7;
  widthArray = self->_widthArray;
  v18 = self->_widthArray[a4] - v16;
  if (v18 == 0.0)
    return;
  if (a4 + 1 < columnCount)
    v19 = a4 + 1;
  else
    v19 = 0;
  if (v18 >= 0.0)
  {
    widthArray[v19] = v18 + widthArray[v19];
    goto LABEL_36;
  }
  v20 = self->_widthArray[a4] - v16;
  if (v19 == a4)
    goto LABEL_35;
  v20 = v18;
  while (1)
  {
    v21 = widthArray[v19];
    if (v21 > v7)
      break;
LABEL_28:
    if (v19 + 1 < columnCount)
      ++v19;
    else
      v19 = 0;
    if (v19 == a4)
      goto LABEL_35;
  }
  if (v20 + v21 < v7)
  {
    v20 = v20 + v21 - v7;
    widthArray[v19] = v7;
    if (v20 < 0.000001 && v20 > -0.000001)
      goto LABEL_35;
    goto LABEL_28;
  }
  widthArray[v19] = v20 + v21;
  v20 = 0.0;
LABEL_35:
  v16 = widthArray[a4] + v20 - v18;
LABEL_36:
  widthArray[a4] = v16;
}

- (double)p_maxEqualGapForBodyWidth:(double)a3
{
  unint64_t columnCount;
  double v4;
  double v5;

  columnCount = self->_columnCount;
  v4 = 0.0;
  if (columnCount >= 2)
  {
    v5 = ((float)((float)columnCount * -36.0) / a3 + 1.0) / (double)(columnCount - 1);
    v4 = 0.0;
    if (v5 >= 0.0)
      return v5;
  }
  return v4;
}

- (void)setGap:(double)a3 forColumnIndex:(unint64_t)a4 bodyWidth:(double)a5
{
  TSWPColumns *v5;
  unint64_t columnCount;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double *gapArray;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double *widthArray;
  double v23;

  v5 = self;
  columnCount = self->_columnCount;
  if (columnCount < 2)
  {
    v11 = 1.0;
    v12 = 0.0;
LABEL_8:
    -[TSWPColumns p_setEqualWidth:equalGap:](self, "p_setEqualWidth:equalGap:", v11, v12);
    return;
  }
  if (self->_equalWidth)
  {
    -[TSWPColumns p_maxEqualGapForBodyWidth:](self, "p_maxEqualGapForBodyWidth:", a4, a5);
    if (a3 / a5 <= v9)
      v10 = a3 / a5;
    else
      v10 = v9;
    -[TSWPColumns p_equalWidthForEqualGap:](v5, "p_equalWidthForEqualGap:", v10);
    self = v5;
    v12 = v10;
    goto LABEL_8;
  }
  v13 = 0;
  v14 = a3 / a5;
  v15 = 36.0 / a5;
  v16 = 1.0 - 36.0 / a5 * (double)columnCount;
  gapArray = self->_gapArray;
  do
  {
    if (a4 != v13)
      v16 = v16 - gapArray[v13];
    ++v13;
  }
  while (columnCount - 1 > v13);
  if (v14 > v16)
    v14 = v16;
  v18 = 0.0;
  if (v14 >= 0.0)
    v18 = v14;
  v19 = gapArray[a4] - v18;
  if (v19 == 0.0)
    return;
  if (a4 + 1 < columnCount)
    v20 = a4 + 1;
  else
    v20 = 0;
  if (v19 >= 0.0)
  {
    self->_widthArray[v20] = v19 + self->_widthArray[v20];
    goto LABEL_36;
  }
  v21 = gapArray[a4] - v18;
  if (v20 == a4)
    goto LABEL_35;
  widthArray = self->_widthArray;
  v21 = v19;
  while (1)
  {
    v23 = widthArray[v20];
    if (v23 > v15)
      break;
LABEL_28:
    if (v20 + 1 < columnCount)
      ++v20;
    else
      v20 = 0;
    if (v20 == a4)
      goto LABEL_35;
  }
  if (v21 + v23 < v15)
  {
    v21 = v21 + v23 - v15;
    widthArray[v20] = v15;
    if (v21 < 0.000001 && v21 > -0.000001)
      goto LABEL_35;
    goto LABEL_28;
  }
  widthArray[v20] = v21 + v23;
  v21 = 0.0;
LABEL_35:
  v18 = gapArray[a4] + v21 - v19;
LABEL_36:
  gapArray[a4] = v18;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v8;
  objc_class *v9;
  void *v10;

  if (self->_equalWidth)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(" %lu equal columns"), self->_columnCount);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%f"), *(_QWORD *)&self->_widthArray[0]);
    if (self->_columnCount >= 2)
    {
      v5 = 2;
      v6 = 1;
      do
      {
        objc_msgSend(v4, "appendFormat:", CFSTR(" (%f) %f"), *(_QWORD *)&self->_widthArray[v5 + 8], *(_QWORD *)&self->_widthArray[v6]);
        v6 = v5;
      }
      while (self->_columnCount > v5++);
    }
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(" %lu columns: { %@ }"), self->_columnCount, v4);

  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>%@"), NSStringFromClass(v9), self, v3);

  return v10;
}

- (BOOL)equalWidth
{
  return self->_equalWidth;
}

@end
