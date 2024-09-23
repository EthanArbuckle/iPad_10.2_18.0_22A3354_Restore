@implementation PNAssetSafeForDisplayModelSet

- (PNAssetSafeForDisplayModelSet)initWithSceneAnalysisVersion:(signed __int16)a3
{
  int v3;
  PNAssetSafeForDisplayModelSet *v4;
  PNAssetSafeForDisplayModelSet *v5;
  uint64_t v6;
  CLSIVSNSFWModel *ivsNSFWModel;
  uint64_t v8;
  CLSNSFWModel *nsfwModel;
  uint64_t v10;
  CLSTabooEventModel *tabooEventModel;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PNAssetSafeForDisplayModelSet;
  v4 = -[PNAssetSafeForDisplayModelSet init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sceneAnalysisVersion = v3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE72690]), "initWithSceneAnalysisVersion:", v3);
    ivsNSFWModel = v5->_ivsNSFWModel;
    v5->_ivsNSFWModel = (CLSIVSNSFWModel *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE726C0]), "initWithSceneAnalysisVersion:", v3);
    nsfwModel = v5->_nsfwModel;
    v5->_nsfwModel = (CLSNSFWModel *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE726E0]), "initWithSceneAnalysisVersion:", v3);
    tabooEventModel = v5->_tabooEventModel;
    v5->_tabooEventModel = (CLSTabooEventModel *)v10;

  }
  return v5;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (CLSIVSNSFWModel)ivsNSFWModel
{
  return self->_ivsNSFWModel;
}

- (CLSNSFWModel)nsfwModel
{
  return self->_nsfwModel;
}

- (CLSTabooEventModel)tabooEventModel
{
  return self->_tabooEventModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabooEventModel, 0);
  objc_storeStrong((id *)&self->_nsfwModel, 0);
  objc_storeStrong((id *)&self->_ivsNSFWModel, 0);
}

@end
