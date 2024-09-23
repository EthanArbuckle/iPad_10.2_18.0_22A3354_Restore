@implementation PLDataClustering

- (PLDataClustering)initWithDistanceBlock:(id)a3
{
  id v4;
  PLDataClustering *v5;
  uint64_t v6;
  id distanceBlock;

  v4 = a3;
  v5 = -[PLDataClustering init](self, "init");
  if (v5)
  {
    v6 = MEMORY[0x19AEC174C](v4);
    distanceBlock = v5->_distanceBlock;
    v5->_distanceBlock = (id)v6;

  }
  return v5;
}

- (PLDataClustering)initWithNumericValueKeypaths:(id)a3
{
  id v5;
  PLDataClustering *v6;
  PLDataClustering *v7;

  v5 = a3;
  v6 = -[PLDataClustering init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_numericValueKeypaths, a3);

  return v7;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)distanceBlock
{
  return self->_distanceBlock;
}

- (id)clusterConsolidationBlock
{
  return self->_clusterConsolidationBlock;
}

- (void)setClusterConsolidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)clusterKeyElementBlock
{
  return self->_clusterKeyElementBlock;
}

- (void)setClusterKeyElementBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)numericValueKeypaths
{
  return self->_numericValueKeypaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericValueKeypaths, 0);
  objc_storeStrong(&self->_clusterKeyElementBlock, 0);
  objc_storeStrong(&self->_clusterConsolidationBlock, 0);
  objc_storeStrong(&self->_distanceBlock, 0);
}

- (double)createDistancesFlatMatrixForDataset:(id)a3
{
  unint64_t v5;
  PLDataClustering *v6;
  double (**v7)(id, uint64_t, uint64_t);
  double (**v8)(id, uint64_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  unint64_t v15;
  void *context;
  unint64_t v17;
  double *v18;

  v5 = objc_msgSend(a3, "count");
  v18 = (double *)malloc_type_malloc(4 * ((v5 * (v5 - 1)) & 0x1FFFFFFFFFFFFFFFLL), 0xF726CC50uLL);
  v6 = self;
  v7 = -[PLDataClustering distanceBlock](self, "distanceBlock");
  if (v5)
  {
    v8 = v7;
    v9 = 0;
    v15 = v5;
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        context = (void *)MEMORY[0x19AEC1554]();
        v17 = v11 + 500;
        if (v11 + 500 < v5)
          v5 = v11 + 500;
        if (v11 < v5)
        {
          v12 = 0;
          do
          {
            if (v10 != v12)
            {
              v13 = v8[2](v8, objc_msgSend(a3, "objectAtIndexedSubscript:", v9), objc_msgSend(a3, "objectAtIndexedSubscript:", v11 + v12));
              v18[-[PLDataClustering flatMatrixIndexForRow:andColumn:]((uint64_t)v6, v9, v11 + v12)] = v13;
            }
            ++v12;
          }
          while (v11 + v12 < v5);
        }
        objc_autoreleasePoolPop(context);
        v10 -= 500;
        v11 += 500;
        v5 = v15;
      }
      while (v17 < v15);
      ++v9;
    }
    while (v9 != v15);
  }
  return v18;
}

- (void)freeDistancesFlatMatrix:(double *)a3
{
  free(a3);
}

- (uint64_t)flatMatrixIndexForRow:(unint64_t)a3 andColumn:
{
  unint64_t v3;
  unint64_t v4;

  if (result)
  {
    if (a2 == a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_flatMatrixIndexForRow_andColumn_, result, CFSTR("PLDataClustering-NOARC.m"), 114, CFSTR("distance when row == column should be considered as 0.0 in a flat matrix"));
      return -1;
    }
    else
    {
      if (a2 >= a3)
        v3 = a3;
      else
        v3 = a2;
      if (a2 <= a3)
        v4 = a3;
      else
        v4 = a2;
      return v3 + (((v4 - 1) * v4) >> 1);
    }
  }
  return result;
}

- (double)createDistancesMatrixForDataset:(id)a3
{
  return -[PLDataClustering createDistancesMatrixForDataset:progressBlock:](self, "createDistancesMatrixForDataset:progressBlock:", a3, 0);
}

- (double)createDistancesMatrixForDataset:(id)a3 progressBlock:(id)a4
{
  unint64_t v7;
  double **v8;
  uint64_t i;
  double (**v10)(id, uint64_t, uint64_t);
  unint64_t v11;
  double v12;
  double v13;
  double **v14;
  uint64_t v15;
  double **v16;
  unint64_t v17;
  double **v18;
  double **v19;
  double v20;
  double **v21;
  double **v22;
  double **v24;
  void (**v25)(id, _BYTE *, double);
  double **v26;
  unint64_t v27;
  void *context;
  unint64_t v29;
  uint64_t v30;
  char v31;

  v7 = objc_msgSend(a3, "count");
  v8 = (double **)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      v8[i] = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    v10 = -[PLDataClustering distanceBlock](self, "distanceBlock");
    v11 = 0;
    v31 = 0;
    v12 = 1.0 / (double)v7;
    v13 = 0.0;
    v14 = v8;
    v24 = v8;
    v25 = (void (**)(id, _BYTE *, double))a4;
    v27 = v7;
    do
    {
      v15 = 0;
      v26 = v14;
      v16 = v14;
      v17 = v11;
      v18 = &v8[v11];
      do
      {
        context = (void *)MEMORY[0x19AEC1554]();
        v29 = v17 + 500;
        if (v17 + 500 < v7)
          v7 = v17 + 500;
        v30 = v15;
        v19 = v16;
        while (v17 < v7)
        {
          if (v15)
          {
            v20 = v10[2](v10, objc_msgSend(a3, "objectAtIndexedSubscript:", v11), objc_msgSend(a3, "objectAtIndexedSubscript:", v17));
            (*v18)[v17] = v20;
            v21 = v19;
          }
          else
          {
            v20 = 0.0;
            v21 = v18;
          }
          (*v21)[v11] = v20;
          ++v17;
          ++v19;
          --v15;
        }
        objc_autoreleasePoolPop(context);
        v16 += 500;
        v15 = v30 - 500;
        v17 = v29;
        v7 = v27;
      }
      while (v29 < v27);
      if (v25)
      {
        v13 = v12 + v13;
        v25[2](v25, &v31, v13);
        v8 = v24;
        v22 = v26;
        if (v31)
          return v8;
      }
      else
      {
        v8 = v24;
        v22 = v26;
      }
      ++v11;
      v14 = v22 + 1;
    }
    while (v11 != v27);
  }
  return v8;
}

- (void)freeDistancesMatrix:(double *)a3 forDataset:(id)a4
{
  unint64_t v6;

  if (objc_msgSend(a4, "count"))
  {
    v6 = 0;
    do
      free(a3[v6++]);
    while (v6 < objc_msgSend(a4, "count"));
  }
  free(a3);
}

@end
