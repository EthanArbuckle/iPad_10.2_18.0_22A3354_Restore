@implementation MLCGraph(TCMLComputeActivityClassifier)

+ (id)tc_graphForActivityClassifierDescriptor:()TCMLComputeActivityClassifier seed:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  if (objc_msgSend(v6, "isComplete"))
  {
    v7 = objc_alloc_init(a1);
    objc_msgSend(v6, "inputTensor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConvLayerWithOutputChannels:source:graph:", 64, v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = 1045220557;
    objc_msgSend(MEMORY[0x24BDDAAD0], "layerWithRate:seed:", a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeWithLayer:source:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addLSTMLayerWithInputSize:outputSize:source:graph:", 64, 200, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addDenseLayerWithIndex:outputChannels:source:graph:", 0, 128, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addBatchNormLayerWithSource:graph:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v16) = 0.5;
    objc_msgSend(MEMORY[0x24BDDAAD0], "layerWithRate:seed:", a4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeWithLayer:source:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addDenseLayerWithIndex:outputChannels:source:graph:", 1, objc_msgSend(v6, "outputChannels"), v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOutputTensor:", v19);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
