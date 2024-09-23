@implementation PLTimeSpanClustering

- (PLTimeSpanClustering)init
{
  PLTimeSpanClustering *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLTimeSpanClustering;
  result = -[PLTimeSpanClustering init](&v3, sel_init);
  if (result)
  {
    result->_minimumSpan = 21600.0;
    result->_averageNumberOfObjects = 500;
  }
  return result;
}

- (unint64_t)_findNearestIndexMatchingTimeSpan:(unint64_t)a3 inDataset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  PLTimeSpanClustering *v35;

  v6 = a4;
  if (objc_msgSend(v6, "count") <= a3)
  {
    v13 = objc_msgSend(v6, "count") - 1;
  }
  else
  {
    v35 = self;
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 + 1 >= objc_msgSend(v6, "count"))
    {
      v22 = v7;
      v15 = v8;
LABEL_18:
      v13 = objc_msgSend(v6, "count") - 1;
      v7 = v22;
    }
    else
    {
      v9 = a3 - 1;
      v10 = a3 - 2;
      v11 = 0.0;
      v12 = 2;
      v13 = a3;
      v34 = v6;
      v31 = a3 - 2;
      v32 = a3;
      while (1)
      {
        v14 = v10 + v12 + 1;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pl_date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSince1970");
        v18 = v17;
        objc_msgSend(v8, "pl_date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSince1970");
        v21 = v18 - v20;

        if (v21 >= v35->_minimumSpan)
        {
          v13 = v14 - 1;
LABEL_21:

          v15 = v8;
          goto LABEL_25;
        }
        v33 = v7;
        if (v11 < v21)
        {
          v13 = v14;
          v11 = v21;
        }
        v15 = v15;

        if (v12 > v35->_averageNumberOfObjects)
        {
          v8 = v15;
          v6 = v34;
          goto LABEL_21;
        }
        objc_msgSend(v34, "objectAtIndexedSubscript:", v9);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pl_date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSince1970");
        v25 = v24;
        objc_msgSend(v22, "pl_date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSince1970");
        v28 = v25 - v27;

        if (v28 >= v35->_minimumSpan)
        {
          v6 = v34;
          v13 = v9;
          goto LABEL_24;
        }
        if (v28 > v11)
          v13 = v9;
        --v9;
        v22 = v22;

        if (v9 <= (uint64_t)(v32 - v35->_averageNumberOfObjects))
          break;
        if (v28 > v11)
          v11 = v28;

        v6 = v34;
        v29 = objc_msgSend(v34, "count");
        ++v12;
        v10 = v31;
        v8 = v15;
        v7 = v22;
        if (v31 + v12 + 1 >= v29)
          goto LABEL_18;
      }
      v33 = v22;
      v6 = v34;
LABEL_24:

      v7 = v33;
    }
LABEL_25:

  }
  return v13;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(id, _BYTE *, double);
  void *v8;
  void *v9;
  unint64_t averageNumberOfObjects;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  char v24;

  v6 = a3;
  v7 = (void (**)(id, _BYTE *, double))a4;
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_26273);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  averageNumberOfObjects = self->_averageNumberOfObjects;
  v11 = objc_msgSend(v6, "count");
  v24 = 0;
  v22 = v6;
  if (averageNumberOfObjects >= v11)
  {
    v13 = 0;
  }
  else
  {
    v12 = 0;
    while (1)
    {
      v7[2](v7, &v24, (double)averageNumberOfObjects / (double)v11);
      if (v24)
        break;
      v13 = -[PLTimeSpanClustering _findNearestIndexMatchingTimeSpan:inDataset:](self, "_findNearestIndexMatchingTimeSpan:inDataset:", averageNumberOfObjects, v8);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v12, v13 - v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectsAtIndexes:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      averageNumberOfObjects = self->_averageNumberOfObjects + v13;
      v12 = v13;
      if (averageNumberOfObjects >= v11)
        goto LABEL_8;
    }
    v13 = v12;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v13, v11 - v13, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectsAtIndexes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)averageNumberOfObjects
{
  return self->_averageNumberOfObjects;
}

- (void)setAverageNumberOfObjects:(unint64_t)a3
{
  self->_averageNumberOfObjects = a3;
}

- (double)minimumSpan
{
  return self->_minimumSpan;
}

- (void)setMinimumSpan:(double)a3
{
  self->_minimumSpan = a3;
}

uint64_t __57__PLTimeSpanClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "pl_date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
