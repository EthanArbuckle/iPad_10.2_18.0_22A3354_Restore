@implementation PXRegionOfInterestForAssetReference

void __PXRegionOfInterestForAssetReference_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "contentSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE9E4BE0) & 1) != 0)
  {
    objc_msgSend(v6, "contentSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_msgSend(v5, "supportedDisplayAssetPresentationStylesInLayout:", v6) & 4) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {

    v5 = 0;
  }

}

@end
