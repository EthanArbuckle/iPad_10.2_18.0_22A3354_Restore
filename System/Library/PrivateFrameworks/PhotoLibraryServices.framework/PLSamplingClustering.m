@implementation PLSamplingClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  unint64_t numberOfClusters;
  void *v9;
  float v10;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, unint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  unint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  if (self->_numberOfClusters <= 1)
    numberOfClusters = 1;
  else
    numberOfClusters = self->_numberOfClusters;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", numberOfClusters);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (float)(unint64_t)objc_msgSend(v6, "count") / (float)numberOfClusters;
  v11 = vcvtps_u32_f32(v10);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__31386;
  v33 = __Block_byref_object_dispose__31387;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __57__PLSamplingClustering_performWithDataset_progressBlock___block_invoke;
  v22 = &unk_1E36682B0;
  v28 = v10;
  v12 = v9;
  v23 = v12;
  v26 = &v29;
  v27 = v11;
  v13 = v7;
  v25 = v13;
  v14 = v6;
  v24 = v14;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v19);
  if (objc_msgSend((id)v30[5], "count", v19, v20, v21, v22))
  {
    +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v30[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = v24;
  v17 = v12;

  _Block_object_dispose(&v29, 8);
  return v17;
}

- (unint64_t)numberOfClusters
{
  return self->_numberOfClusters;
}

- (void)setNumberOfClusters:(unint64_t)a3
{
  self->_numberOfClusters = a3;
}

void __57__PLSamplingClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  float v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v7 = (float)a3;
  v8 = (unint64_t)(float)((float)a3 / *(float *)(a1 + 72)) - 1;
  if (v8 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 64));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, uint64_t, double))(v13 + 16))(v13, a4, (float)(v7 / (float)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count")));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v14);

}

@end
