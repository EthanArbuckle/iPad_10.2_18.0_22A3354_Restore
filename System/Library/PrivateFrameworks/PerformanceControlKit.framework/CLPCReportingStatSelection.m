@implementation CLPCReportingStatSelection

- (CLPCReportingStatSelection)init
{
  CLPCReportingStatSelection *v2;
  CLPCReportingStatSelection *v3;
  CLPCReportingStatSelection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLPCReportingStatSelection;
  v2 = -[CLPCReportingStatSelection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)v2->selection.__elems_ = 0;
    *(_QWORD *)&v2->selection.__elems_[8] = 0;
    v2->selection.__elems_[24] = 0;
    *(_QWORD *)&v2->selection.__elems_[16] = 0;
    v4 = v2;
  }

  return v3;
}

- (unint64_t)isSelected:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4;

  v4 = 0;
  {
    if (++v4 == 25)
    {
      return 0;
    }
  }
  if (self->selection.__elems_[v4])
    return 2;
  else
    return 1;
}

- (BOOL)selectStat:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4;
  char *v5;

  if (self)
  {
    v4 = 0;
    {
      if (++v4 == 25)
      {
        LOBYTE(self) = 0;
        return (char)self;
      }
    }
    v5 = (char *)self + v4;
    LOBYTE(self) = 1;
    v5[8] = 1;
  }
  return (char)self;
}

- (BOOL)deselectStat:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4;

  if (self)
  {
    v4 = 0;
    {
      if (++v4 == 25)
      {
        LOBYTE(self) = 0;
        return (char)self;
      }
    }
    self->selection.__elems_[v4] = 0;
    LOBYTE(self) = 1;
  }
  return (char)self;
}

- (uint64_t)setStatsOfSchema:(char)a3 selected:(_QWORD *)a4 error:
{
  int v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  if (result)
  {
    if (a2)
    {
      v4 = 0;
      v5 = result + 8;
      do
      {
        v7 = *(_QWORD *)v6;
        if (*(_QWORD *)v6 >> 35)
          v8 = 0;
        else
          v8 = BYTE4(*(_QWORD *)v6) == a2;
        if (v8)
        {
          v9 = 0;
          {
            if (++v9 == 25)
            {
              return 0;
            }
          }
          *(_BYTE *)(v5 + v9) = a3;
          ++v4;
        }
        v6 += 8;
      }
      while (v6 != "emit");
      if (v4)
        return 1;
      v10 = a2;
    }
    else
    {
      v10 = 0;
    }
    return 0;
  }
  return result;
}

- (BOOL)selectStatsOfSchema:(unint64_t)a3 error:(id *)a4
{
  return -[CLPCReportingStatSelection setStatsOfSchema:selected:error:]((uint64_t)self, a3, 1, a4);
}

- (BOOL)deselectStatsOfSchema:(unint64_t)a3 error:(id *)a4
{
  return -[CLPCReportingStatSelection setStatsOfSchema:selected:error:]((uint64_t)self, a3, 0, a4);
}

- (void)selectAll
{
  *(_QWORD *)&self->selection.__elems_[8] = 0x101010101010101;
  *(_QWORD *)&self->selection.__elems_[16] = 0x101010101010101;
  *(_QWORD *)self->selection.__elems_ = 0x101010101010101;
  self->selection.__elems_[24] = 1;
}

- (void)deselectAll
{
  *(_QWORD *)self->selection.__elems_ = 0;
  *(_QWORD *)&self->selection.__elems_[8] = 0;
  self->selection.__elems_[24] = 0;
  *(_QWORD *)&self->selection.__elems_[16] = 0;
}

- (void)enumerate:(id)a3
{
  uint64_t v4;
  array<BOOL, 25UL> *p_selection;
  int v6;
  BOOL v7;
  BOOL v8;

  v4 = 0;
  p_selection = &self->selection;
  do
  {
    v8 = p_selection->__elems_[v4];
    p_selection->__elems_[v4] = v8;
    if (v6)
      v7 = v4 == 24;
    else
      v7 = 1;
    ++v4;
  }
  while (!v7);
}

- (double)selectedStats
{
  uint64_t v3;
  double result;
  uint64_t v5;
  unint64_t *v6;

  if (a1)
  {
    v3 = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_DWORD *)(a2 + 32) = 1065353216;
    v5 = a1 + 8;
    do
    {
      if (*(_BYTE *)(v5 + v3))
        std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>(a2, v6, v6);
      ++v3;
      ++v6;
    }
    while (v3 != 25);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

@end
