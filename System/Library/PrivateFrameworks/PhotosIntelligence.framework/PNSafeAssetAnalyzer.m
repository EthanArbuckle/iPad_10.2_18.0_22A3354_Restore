@implementation PNSafeAssetAnalyzer

- (PNSafeAssetAnalyzer)initWithPhotoLibrary:(id)a3
{
  id v4;
  PNSafeAssetAnalyzer *v5;
  _PNSafeAssetAnalyzer *v6;
  _PNSafeAssetAnalyzer *safeAssetAnalyzer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PNSafeAssetAnalyzer;
  v5 = -[PNSafeAssetAnalyzer init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_PNSafeAssetAnalyzer initWithPhotoLibrary:computeIsUtilityForMemories:]([_PNSafeAssetAnalyzer alloc], "initWithPhotoLibrary:computeIsUtilityForMemories:", v4, 1);
    safeAssetAnalyzer = v5->_safeAssetAnalyzer;
    v5->_safeAssetAnalyzer = v6;

  }
  return v5;
}

- (signed)eligibilityStateWithAsset:(id)a3 curationContext:(id)a4
{
  return -[_PNSafeAssetAnalyzer eligibilityStateWithAsset:curationContext:](self->_safeAssetAnalyzer, "eligibilityStateWithAsset:curationContext:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAssetAnalyzer, 0);
}

@end
