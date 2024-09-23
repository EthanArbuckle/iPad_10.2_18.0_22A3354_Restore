@implementation MLCGraph(TCMLComputeStyleTransfer)

+ (id)tc_inferenceGraphForStyleTransferDescriptor:()TCMLComputeStyleTransfer algorithm:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  if (objc_msgSend(v6, "isComplete"))
  {
    v7 = objc_alloc_init(a1);
    objc_msgSend(v6, "inferenceContentTensor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inferencePixelScaleTensor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "weights");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v7, "styleNetwork:pixelScale:weights:descriptors:prefix:algorithm:", v8, v9, v10, v11, CFSTR("transformer_"), a4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)tc_trainingGraphForStyleTransferDescriptor:()TCMLComputeStyleTransfer stopGradientList:lossTensorDictionary:algorithm:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isComplete"))
  {
    v13 = objc_alloc_init(a1);
    objc_msgSend(v10, "contentTensor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "styleTensor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pixelScaleTensor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "meanTensor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "varianceTensor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "styleLossWeightTensor");
    v26 = v12;
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "weights");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = a6;
    v20 = (id)objc_msgSend(v13, "defineTraining:style:pixelScale:mean:variance:styleLossWeightTensor:weights:stopGradientList:descriptors:lossTensorDictionary:algorithm:", v24, v25, v14, v23, v15, v17, v18, v16, v19, v26, v22);

    v11 = v16;
    v12 = v26;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
