@implementation MLCGraph(TCMLComputeDrawingClassifier)

+ (id)tc_graphForDrawingClassifierDescriptor:()TCMLComputeDrawingClassifier batchSize:
{
  id v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "isComplete"))
  {
    v7 = objc_alloc_init(a1);
    objc_msgSend(v6, "inputTensor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 3; ++i)
    {
      v10 = v8;
      objc_msgSend(v6, "addConvLayer:outputChannels:source:graph:", i, qword_2186C4BA8[i], v8, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)MEMORY[0x24BDDAB40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = &unk_24D95EB60;
    v24[2] = &unk_24D95EB30;
    v24[3] = &unk_24D95EB30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layerWithShape:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "nodeWithLayer:source:", v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addDenseLayer:outputChannels:source:graph:", 0, 128, v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDDAA98];
    LODWORD(v18) = 0;
    objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layerWithDescriptor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "nodeWithLayer:source:", v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDenseLayer:outputChannels:source:graph:", 1, objc_msgSend(v6, "outputChannels"), v21, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOutputTensor:", v22);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
