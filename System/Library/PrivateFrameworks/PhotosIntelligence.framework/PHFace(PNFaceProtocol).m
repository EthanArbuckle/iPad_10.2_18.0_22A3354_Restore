@implementation PHFace(PNFaceProtocol)

- (id)faceprintData
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "faceClusteringProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceprintData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setQualityMeasure:()PNFaceProtocol
{
  id v4;

  objc_msgSend(MEMORY[0x24BDE3550], "changeRequestForFace:", a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityMeasure:", a3);

}

@end
