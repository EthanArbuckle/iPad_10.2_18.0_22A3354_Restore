@implementation MLCGraph(TCMLComputeObjectDetectorSceneNetDescriptor)

+ (id)tc_inferenceGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor batchSize:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(a1);
  objc_msgSend(v6, "defineGraph:batchSize:", v7, a4);
  objc_msgSend(MEMORY[0x24BDDAB50], "layerWithOperation:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classificationOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeWithLayer:source:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizationOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concatenateWithSources:dimension:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tc_trainingGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor batchSize:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(v6, "isComplete"))
  {
    v7 = objc_alloc_init(a1);
    objc_msgSend(v6, "defineGraph:batchSize:", v7, a4);
    objc_msgSend(MEMORY[0x24BDDAB50], "layerWithOperation:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classificationOutput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeWithLayer:source:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSoftmaxOutput:", v10);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)tc_lossGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[2];
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isComplete"))
  {
    v5 = objc_alloc_init(a1);
    v6 = (void *)MEMORY[0x24BDDAB18];
    objc_msgSend(v4, "weightsCoordinates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1035489772;
    objc_msgSend(v6, "huberLossWithReductionType:delta:weights:", 2, v7, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizationOutput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelCoordinates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodeWithLayer:sources:lossLabels:", v28, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDDAB18];
    v15 = objc_msgSend(v4, "numClasses") + 1;
    objc_msgSend(v4, "weightsClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 0;
    objc_msgSend(v14, "softmaxCrossEntropyLossWithReductionType:labelSmoothing:classCount:weights:", 2, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "classificationOutput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelClass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodeWithLayer:sources:lossLabels:", v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v29[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodeWithLayer:sources:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLossResultTensor:", v26);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
