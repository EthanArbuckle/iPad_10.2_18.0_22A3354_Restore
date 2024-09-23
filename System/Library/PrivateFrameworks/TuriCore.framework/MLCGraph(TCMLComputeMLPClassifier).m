@implementation MLCGraph(TCMLComputeMLPClassifier)

+ (id)tc_createGraphFromMLPClassifierDescriptor:()TCMLComputeMLPClassifier
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(v4, "isComplete"))
  {
    v5 = objc_alloc_init(a1);
    objc_msgSend(v4, "inputTensor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerSizes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 1;
      v10 = v6;
      do
      {
        objc_msgSend(v4, "layerSizes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v9 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addFullyConnectedLayerWithIndex:outputChannels:source:graph:", v9, objc_msgSend(v12, "unsignedIntegerValue"), v10, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "layerSizes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        v15 = v9 + 1;
        v10 = v6;
      }
      while (v9++ < v14);
    }
    else
    {
      v15 = 1;
    }
    objc_msgSend(v4, "fullyConnectedLayerForIndex:outputChannels:", v15, objc_msgSend(v4, "outputChannels"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodeWithLayer:source:", v17, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFcFinalTensor:", v18);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
