@implementation CHDChartTypeWithGrouping

- (CHDChartTypeWithGrouping)initWithChart:(id)a3
{
  CHDChartTypeWithGrouping *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDChartTypeWithGrouping;
  result = -[CHDChartType initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
    *((_DWORD *)&result->super.mVaryColors + 1) = 3;
  return result;
}

- (BOOL)isGroupingStacked
{
  return (*((_DWORD *)&self->super.mVaryColors + 1) - 1) < 2;
}

- (int)grouping
{
  return *((_DWORD *)&self->super.mVaryColors + 1);
}

- (void)setGrouping:(int)a3
{
  *((_DWORD *)&self->super.mVaryColors + 1) = a3;
}

- (id)chdGroupingString
{
  uint64_t v2;

  v2 = *((int *)&self->super.mVaryColors + 1);
  if (v2 > 3)
    return &stru_24F3BFFF8;
  else
    return off_24F3A78A8[v2];
}

@end
