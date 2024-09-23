@implementation PXStoryMomentsFibonacciClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditMomentsProvider.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataset.count > 0"));

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v9 = 0;
    v10 = 1;
    v11 = 2;
    v12 = 2;
    do
    {
      v8 = v11;
      v13 = (void *)MEMORY[0x1E0D716A0];
      objc_msgSend(v6, "subarrayWithRange:", v9, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clusterWithObjects:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15);

      v16 = v10 + v12;
      v11 = v8 + v10 + v12;
      v17 = objc_msgSend(v6, "count");
      v9 = v8;
      v10 = v12;
      v12 = v16;
    }
    while (v11 <= v17);
  }
  else
  {
    v8 = 0;
  }
  if (v8 < objc_msgSend(v6, "count"))
  {
    v18 = objc_msgSend(v6, "count");
    v19 = (void *)MEMORY[0x1E0D716A0];
    objc_msgSend(v6, "subarrayWithRange:", v8, v18 - v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clusterWithObjects:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v21);

  }
  v22 = (void *)objc_msgSend(v7, "copy");

  return v22;
}

@end
