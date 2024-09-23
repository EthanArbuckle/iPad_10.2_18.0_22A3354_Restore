@implementation PKPaymentSetupProductRegionDataComplexPolygon

- (PKPaymentSetupProductRegionDataComplexPolygon)initWithInclusionaryZones:(id)a3 exclusionaryZones:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  size_t v9;
  uint64_t v10;
  PKPaymentSetupProductRegionDataComplexPolygon *v11;
  size_t v12;
  PKPaymentSetupProductRegionDataComplexPolygon *v13;
  PKPaymentSetupProductRegionDataComplexPolygon *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  char **v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  char **v23;
  char *v24;
  objc_super v26;

  v6 = a4;
  CreateSanitizedZonesList(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CreateSanitizedZonesList(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 && objc_msgSend(v7, "count") || v8 && objc_msgSend(v8, "count"))
    && (v9 = objc_msgSend(v7, "count"), v10 = objc_msgSend(v8, "count"), v9 | v10))
  {
    v12 = v10;
    v26.receiver = self;
    v26.super_class = (Class)PKPaymentSetupProductRegionDataComplexPolygon;
    v13 = -[PKPaymentSetupProductRegionDataComplexPolygon init](&v26, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_inclusionaryPolygonCount = v9;
      if (v9)
      {
        v13->_inclusionaryPolygons = ($7FB7F208B14CD26DFD85FAEC176BF5BF *)malloc_type_calloc(v9, 0x10uLL, 0x1020040EDED9539uLL);
        if (v14->_inclusionaryPolygonCount)
        {
          v15 = 0;
          v16 = 0;
          do
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (char **)&v14->_inclusionaryPolygons[v15];
            *v18 = CreatePolygonForPoints(v17);
            v18[1] = v19;

            ++v16;
            ++v15;
          }
          while (v16 < v14->_inclusionaryPolygonCount);
        }
      }
      if (v14->_exclusionaryPolygonCount)
      {
        v14->_exclusionaryPolygonCount = v12;
        v14->_exclusionaryPolygons = ($7FB7F208B14CD26DFD85FAEC176BF5BF *)malloc_type_calloc(v12, 0x10uLL, 0x1020040EDED9539uLL);
        if (v14->_exclusionaryPolygonCount)
        {
          v20 = 0;
          v21 = 0;
          do
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (char **)&v14->_exclusionaryPolygons[v20];
            *v23 = CreatePolygonForPoints(v22);
            v23[1] = v24;

            ++v21;
            ++v20;
          }
          while (v21 < v14->_exclusionaryPolygonCount);
        }
      }
    }
    self = v14;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  $7FB7F208B14CD26DFD85FAEC176BF5BF *inclusionaryPolygons;
  uint64_t v4;
  unint64_t v5;
  $7FB7F208B14CD26DFD85FAEC176BF5BF *exclusionaryPolygons;
  uint64_t v7;
  unint64_t v8;
  objc_super v9;

  inclusionaryPolygons = self->_inclusionaryPolygons;
  if (inclusionaryPolygons)
  {
    if (self->_inclusionaryPolygonCount)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        free(self->_inclusionaryPolygons[v4].var0);
        ++v5;
        ++v4;
      }
      while (v5 < self->_inclusionaryPolygonCount);
      inclusionaryPolygons = self->_inclusionaryPolygons;
    }
    free(inclusionaryPolygons);
  }
  exclusionaryPolygons = self->_exclusionaryPolygons;
  if (exclusionaryPolygons)
  {
    if (self->_exclusionaryPolygonCount)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        free(self->_exclusionaryPolygons[v7].var0);
        ++v8;
        ++v7;
      }
      while (v8 < self->_exclusionaryPolygonCount);
      exclusionaryPolygons = self->_exclusionaryPolygons;
    }
    free(exclusionaryPolygons);
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProductRegionDataComplexPolygon;
  -[PKPaymentSetupProductRegionDataComplexPolygon dealloc](&v9, sel_dealloc);
}

- (BOOL)containsPoint:(CGPoint)a3 inExclusionaryRegion:(BOOL *)a4
{
  double v6;
  long double v7;
  double v8;
  unint64_t exclusionaryPolygonCount;
  unint64_t *p_var1;
  unint64_t inclusionaryPolygonCount;
  $7FB7F208B14CD26DFD85FAEC176BF5BF *inclusionaryPolygons;
  BOOL result;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;

  v6 = (a3.x + 180.0) * 10000.0 / 360.0;
  v7 = tan(a3.y * 3.14159265 / 180.0 * 0.5 + 0.785398163);
  v8 = log(v7) * 10000.0 / -6.28318531 + 2500.0;
  exclusionaryPolygonCount = self->_exclusionaryPolygonCount;
  if (exclusionaryPolygonCount)
  {
    p_var1 = &self->_exclusionaryPolygons->var1;
    while (!PolygonContainsNormalizedPoint(*(p_var1 - 1), *p_var1, v6, v8))
    {
      p_var1 += 2;
      if (!--exclusionaryPolygonCount)
        goto LABEL_5;
    }
    result = 0;
    *a4 = 1;
  }
  else
  {
LABEL_5:
    inclusionaryPolygonCount = self->_inclusionaryPolygonCount;
    if (inclusionaryPolygonCount)
    {
      inclusionaryPolygons = self->_inclusionaryPolygons;
      if ((PolygonContainsNormalizedPoint((uint64_t)inclusionaryPolygons->var0, inclusionaryPolygons->var1, v6, v8) & 1) != 0)
      {
        return 1;
      }
      else
      {
        v14 = &inclusionaryPolygons[1].var1;
        v15 = 1;
        do
        {
          v16 = v15;
          if (inclusionaryPolygonCount == v15)
            break;
          v17 = PolygonContainsNormalizedPoint(*(v14 - 1), *v14, v6, v8);
          v15 = v16 + 1;
          v14 += 2;
        }
        while (!v17);
        return v16 < inclusionaryPolygonCount;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)closestDistanceToPoint:(CGPoint)a3
{
  unint64_t inclusionaryPolygonCount;
  double x;
  uint64_t v5;
  $7FB7F208B14CD26DFD85FAEC176BF5BF *inclusionaryPolygons;
  double result;
  $7FB7F208B14CD26DFD85FAEC176BF5BF *v8;
  unint64_t var1;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  long double v19;
  double v20;
  long double v21;
  long double v22;
  long double v23;
  long double v24;
  double v25;
  double v26;
  double y;
  double v28;
  long double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;

  y = a3.y;
  inclusionaryPolygonCount = self->_inclusionaryPolygonCount;
  if (!inclusionaryPolygonCount)
    return 1.79769313e308;
  x = a3.x;
  v5 = 0;
  inclusionaryPolygons = self->_inclusionaryPolygons;
  result = 1.79769313e308;
  do
  {
    v8 = &inclusionaryPolygons[v5];
    var1 = v8->var1;
    if (var1)
    {
      v10 = (double *)((char *)v8->var0 + 40);
      do
      {
        v35 = result;
        v11 = *(v10 - 5);
        v12 = *(v10 - 4);
        v13 = *(v10 - 1);
        v14 = *v10;
        v30 = *v10;
        v31 = v13;
        v34 = HaversineDistanceBetweenPoints(y, x, v11, v12);
        v32 = HaversineDistanceBetweenPoints(v11, v12, y, x);
        v28 = BearingBetweenPoints(v11, v12, y, x) * 3.14159265 / 180.0;
        v15 = BearingBetweenPoints(v11, v12, v13, v14);
        v16 = x;
        v17 = v15 * 3.14159265 / 180.0;
        v18 = __sincos_stret(v32 / 6371.0);
        v19 = sin(v28 - v17);
        v33 = asin(v18.__sinval * v19) * 6371.0;
        v20 = cos(v33 / 6371.0);
        v29 = acos(v18.__cosval / v20) * 6371.0;
        x = v16;
        v21 = HaversineDistanceBetweenPoints(v31, v30, y, v16);
        v22 = cos(v21 / 6371.0);
        v23 = acos(v22 / v20) * 6371.0;
        v24 = HaversineDistanceBetweenPoints(v11, v12, v31, v30);
        v25 = fmin(v34, fabs(v33));
        if (v29 + v23 <= v24)
          v26 = v25;
        else
          v26 = v34;
        result = fmin(v26, v35);
        v10 += 8;
        --var1;
      }
      while (var1);
    }
    ++v5;
  }
  while (v5 != inclusionaryPolygonCount);
  return result;
}

@end
