@implementation PXStoryMomentsUniformClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditMomentsProvider.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataset.count > 0"));

  }
  v7 = -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects");
  v8 = v7 + objc_msgSend(v6, "count") - 1;
  v9 = v8 / v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8 / v7);
  if (v7 <= v8)
  {
    v11 = 0;
    v12 = 0;
    if (v9 <= 1)
      v13 = 1;
    else
      v13 = v9;
    do
    {
      v14 = objc_msgSend(v6, "count");
      v15 = v7;
      if (v7 + v11 > v14)
        v15 = objc_msgSend(v6, "count") + v12;
      v16 = (void *)MEMORY[0x1E0D716A0];
      objc_msgSend(v6, "subarrayWithRange:", v11, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clusterWithObjects:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v18);

      v12 -= v7;
      v11 += v7;
      --v13;
    }
    while (v13);
  }
  v19 = (void *)objc_msgSend(v10, "copy");

  return v19;
}

@end
