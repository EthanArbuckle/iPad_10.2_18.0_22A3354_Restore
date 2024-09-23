@implementation MLCGraph(TCMLComputeObjectDetector)

+ (id)tc_graphForObjectDetectorDescriptor:()TCMLComputeObjectDetector
{
  id v4;
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "isComplete"))
  {
    v5 = objc_alloc_init(a1);
    objc_msgSend(v4, "inputTensor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 8; ++i)
    {
      v8 = v6;
      objc_msgSend(v4, "addCommonLayersWithIndex:outputChannels:source:graph:", i, qword_2187097B8[i], v6, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "convLayerForIndex:outputChannels:", 8, objc_msgSend(v4, "outputChannels"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "nodeWithLayer:source:", v9, v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
