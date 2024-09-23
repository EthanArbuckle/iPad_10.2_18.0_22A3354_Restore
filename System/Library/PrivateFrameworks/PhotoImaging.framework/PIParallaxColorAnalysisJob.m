@implementation PIParallaxColorAnalysisJob

uint64_t __40___PIParallaxColorAnalysisJob_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "imageHistogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sampleCount");

  objc_msgSend(v4, "imageHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "sampleCount");
  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

void __53___PIParallaxColorAnalysisJob__computeAllHistograms___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = (void *)a1[4];
  v4 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v3, "computeHistogramFromBuffer:error:", a2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
