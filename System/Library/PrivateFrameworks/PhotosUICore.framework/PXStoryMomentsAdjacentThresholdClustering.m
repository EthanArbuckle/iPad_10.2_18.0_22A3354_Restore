@implementation PXStoryMomentsAdjacentThresholdClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  void (**v7)(id, _BYTE *);
  id v8;
  uint64_t v9;
  NSProgress *v10;
  NSProgress *progress;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  char v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _BYTE *))a4;
  v8 = a3;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditMomentsProvider.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataset.count > 0"));

  }
  v20 = 0;
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v9);
  v10 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v10;

  v21[0] = CFSTR("minimumNumberOfObjects");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("maximumDistance");
  v22[0] = v12;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PLDataDensityClustering maximumDistance](self, "maximumDistance");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDataClustering distanceBlock](self, "distanceBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryClusteringAlgorithmCutAdjacentWithAssetIndicesOptionsAndDistanceBlock(v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v9);
  if (v7)
  {
    -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
    v7[2](v7, &v20);
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
