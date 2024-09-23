@implementation MPSCNNInstanceNormalizationNode(TCMPSLayerHelper)

- (void)setTc_weightsData:()TCMPSLayerHelper
{
  objc_setAssociatedObject(a1, &kWeightsKey, a3, (void *)0x301);
}

- (id)tc_weightsData
{
  return objc_getAssociatedObject(a1, &kWeightsKey);
}

+ (id)createInstanceNormalization:()TCMPSLayerHelper channels:styles:gamma:beta:label:device:cmdQueue:
{
  id v15;
  id v16;
  id v17;
  id v18;
  TCMPSInstanceNormDataLoader *v19;
  id v20;
  uint64_t v21;
  id v22;
  TCMPSInstanceNormDataLoader *v23;
  void *v24;
  id v26;
  id v27;

  v15 = a3;
  v27 = a6;
  v26 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v19 = [TCMPSInstanceNormDataLoader alloc];
  v20 = objc_retainAutorelease(v27);
  v21 = objc_msgSend(v20, "bytes");
  v22 = objc_retainAutorelease(v26);
  v23 = -[TCMPSInstanceNormDataLoader initWithParams:gammaWeights:betaWeights:numberFeatureChannels:styles:device:cmd_queue:](v19, "initWithParams:gammaWeights:betaWeights:numberFeatureChannels:styles:device:cmd_queue:", v16, v21, objc_msgSend(v22, "bytes"), a4, a5, v17, v18);
  objc_msgSend(MEMORY[0x24BDDE298], "nodeWithSource:dataSource:", v15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTc_weightsData:", v23);

  return v24;
}

@end
