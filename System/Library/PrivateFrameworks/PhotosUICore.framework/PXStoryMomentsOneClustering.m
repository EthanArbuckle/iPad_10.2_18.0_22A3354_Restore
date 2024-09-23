@implementation PXStoryMomentsOneClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditMomentsProvider.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataset.count > 0"));

  }
  objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
