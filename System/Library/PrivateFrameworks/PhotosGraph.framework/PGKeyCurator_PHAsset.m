@implementation PGKeyCurator_PHAsset

- (id)keyAssetWithFeeder:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGKeyCurator_PHAsset;
  -[PGKeyCurator keyItemWithFeeder:options:criteria:debugInfo:progressBlock:](&v8, sel_keyItemWithFeeder_options_criteria_debugInfo_progressBlock_, a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyAssetInAssets:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGKeyCurator_PHAsset;
  -[PGKeyCurator keyItemInItems:options:criteria:debugInfo:progressBlock:](&v8, sel_keyItemInItems_options_criteria_debugInfo_progressBlock_, a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyAssetInAssets:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGKeyCurator_PHAsset;
  -[PGKeyCurator keyItemInItems:options:criteria:debugInfo:progressBlock:](&v6, sel_keyItemInItems_options_criteria_debugInfo_progressBlock_, a3, a4, 0, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
