@implementation TSTCoordinateArray

- (TSTCoordinateArray)initWithCount:(unsigned int)a3 atOffset:(unsigned int)a4
{
  TSTCoordinateArray *v6;
  TSTCoordinateArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSTCoordinateArray;
  v6 = -[TSTCoordinateArray init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mOffset = a4;
    v6->mCount = a3;
    v6->mCoordinates = (double *)malloc_type_calloc(8uLL, a3 + 1, 0x4AEC3DE8uLL);
    v7->mAverage = 0.0;
    v7->mVisibleIndices = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", v7->mOffset, a3);
    v7->mLayoutDirectionIsLeftToRight = 1;
    v7->mTableWidth = 0.0;
  }
  return v7;
}

- (void)hasRightToLeftOrderingWithWidth:(double)a3
{
  self->mLayoutDirectionIsLeftToRight = 0;
  self->mTableWidth = a3;
}

- (void)dealloc
{
  double *mCoordinates;
  objc_super v4;

  mCoordinates = self->mCoordinates;
  if (mCoordinates)
    free(mCoordinates);

  v4.receiver = self;
  v4.super_class = (Class)TSTCoordinateArray;
  -[TSTCoordinateArray dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  double v7;
  double v8;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (!v4 || *(_QWORD *)&self->mOffset != *(_QWORD *)(v4 + 8) || self->mAverage != *(double *)(v4 + 24))
    return 0;
  v5 = self->mCount - 1;
  do
  {
    v6 = (int)v5 + 1 < 1;
    if ((int)v5 + 1 < 1)
      break;
    v7 = self->mCoordinates[v5];
    v8 = *(double *)(*(_QWORD *)(v4 + 16) + 8 * v5--);
  }
  while (v7 == v8);
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p offset=%u average=%f"), NSStringFromClass(v4), self, self->mOffset, *(_QWORD *)&self->mAverage);
  v6 = v5;
  if (self->mCoordinates)
  {
    objc_msgSend(v5, "appendString:", CFSTR(" coordinates={"));
    if (self->mCount)
    {
      v7 = 0;
      v8 = CFSTR("}>");
      do
      {
        objc_msgSend(v6, "appendFormat:", CFSTR("\n  { offset=%u -> coordinate=%f }"), v7 + self->mOffset, *(_QWORD *)&self->mCoordinates[v7]);
        ++v7;
      }
      while (v7 < self->mCount);
    }
    else
    {
      v8 = CFSTR("}>");
    }
  }
  else
  {
    v8 = CFSTR(" coordinates={empty}>");
  }
  objc_msgSend(v6, "appendString:", v8);
  return v6;
}

@end
