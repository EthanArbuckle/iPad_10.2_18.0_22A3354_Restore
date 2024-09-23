@implementation CLSCurationModel_v5

+ (id)baseSpecificationWithSpecification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  CLSCurationModelSpecification *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLSCurationModel_v5;
  v3 = a3;
  objc_msgSendSuper2(&v12, sel_baseSpecificationWithSpecification_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "sceneAnalysisVersion", v12.receiver, v12.super_class);

  v6 = objc_msgSend(v4, "sceneAnalysisVersion");
  v7 = objc_msgSend(MEMORY[0x24BE726F0], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v7)
    v6 = v7;
  v8 = objc_msgSend(MEMORY[0x24BE72670], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v8)
    v6 = v8;
  v9 = objc_msgSend(MEMORY[0x24BE72678], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v9)
    v6 = v9;
  v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, objc_msgSend(v4, "mediaAnalysisVersion"), objc_msgSend(v4, "faceAnalysisVersion"));

  return v10;
}

- (CLSCurationModel_v5)initWithCurationModelSpecification:(id)a3
{
  id v4;
  CLSCurationModel_v5 *v5;
  uint64_t v6;
  uint64_t v7;
  CLSWallpaperScoreModel *wallpaperScoreModel;
  uint64_t v9;
  CLSCLIPprintModel *CLIPprintModel;
  uint64_t v11;
  CLSCityNatureModel *cityNatureModel;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSCurationModel_v5;
  v5 = -[CLSCurationModel_v4 initWithCurationModelSpecification:](&v14, sel_initWithCurationModelSpecification_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "sceneAnalysisVersion");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE726F0]), "initWithSceneAnalysisVersion:", v6);
    wallpaperScoreModel = v5->_wallpaperScoreModel;
    v5->_wallpaperScoreModel = (CLSWallpaperScoreModel *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE72670]), "initWithSceneAnalysisVersion:", v6);
    CLIPprintModel = v5->_CLIPprintModel;
    v5->_CLIPprintModel = (CLSCLIPprintModel *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE72678]), "initWithSceneAnalysisVersion:", v6);
    cityNatureModel = v5->_cityNatureModel;
    v5->_cityNatureModel = (CLSCityNatureModel *)v11;

  }
  return v5;
}

- (BOOL)isShowcasingFoodWithAsset:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "clsProcessedSignals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowcasingFood");

  return v4;
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4;
  id v5;
  uint64_t *v6;
  CLSWallpaperScoreModel *wallpaperScoreModel;
  CLSCLIPprintModel *CLIPprintModel;
  CLSCityNatureModel *cityNatureModel;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CLSCurationModel_v5_enumerateSignalModelsUsingBlock___block_invoke;
  v11[3] = &unk_251480458;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v5;
  -[CLSCurationModel_v4 enumerateSignalModelsUsingBlock:](&v10, sel_enumerateSignalModelsUsingBlock_, v11);
  v6 = v15;
  if (!*((_BYTE *)v15 + 24))
  {
    wallpaperScoreModel = self->_wallpaperScoreModel;
    if (!wallpaperScoreModel
      || ((*((void (**)(id, CLSWallpaperScoreModel *, uint64_t *))v5 + 2))(v5, wallpaperScoreModel, v15 + 3),
          v6 = v15,
          !*((_BYTE *)v15 + 24)))
    {
      CLIPprintModel = self->_CLIPprintModel;
      if (!CLIPprintModel
        || ((*((void (**)(id, CLSCLIPprintModel *, uint64_t *))v5 + 2))(v5, CLIPprintModel, v6 + 3),
            v6 = v15,
            !*((_BYTE *)v15 + 24)))
      {
        cityNatureModel = self->_cityNatureModel;
        if (cityNatureModel)
          (*((void (**)(id, CLSCityNatureModel *, uint64_t *))v5 + 2))(v5, cityNatureModel, v6 + 3);
      }
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  id v4;
  id v5;
  CLSCityNatureModel *cityNatureModel;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__CLSCurationModel_v5_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke;
  v8[3] = &unk_251480480;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  v7.receiver = self;
  v7.super_class = (Class)CLSCurationModel_v5;
  -[CLSCurationModel_v4 enumerateClassificationBasedSignalModelsUsingBlock:](&v7, sel_enumerateClassificationBasedSignalModelsUsingBlock_, v8);
  if (!*((_BYTE *)v12 + 24))
  {
    cityNatureModel = self->_cityNatureModel;
    if (cityNatureModel)
      (*((void (**)(id, CLSCityNatureModel *, uint64_t *))v5 + 2))(v5, cityNatureModel, v12 + 3);
  }

  _Block_object_dispose(&v11, 8);
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSCurationModel_v5;
  if (-[CLSCurationModel_v4 avoidIfPossibleForKeyAssetWithAsset:statistics:](&v11, sel_avoidIfPossibleForKeyAssetWithAsset_statistics_, v6, a4))
  {
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x24BDE36A8];
  objc_msgSend(v6, "clsFaceInformationSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userFeedbackScore");
  LOBYTE(v7) = objc_msgSend(v7, "score:meetsScoreThreshold:");

  if ((v7 & 1) == 0)
  {
    ++a4->var12;
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (CLSWallpaperScoreModel)wallpaperScoreModel
{
  return (CLSWallpaperScoreModel *)objc_getProperty(self, a2, 176, 1);
}

- (CLSCLIPprintModel)CLIPprintModel
{
  return (CLSCLIPprintModel *)objc_getProperty(self, a2, 184, 1);
}

- (CLSCityNatureModel)cityNatureModel
{
  return (CLSCityNatureModel *)objc_getProperty(self, a2, 192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureModel, 0);
  objc_storeStrong((id *)&self->_CLIPprintModel, 0);
  objc_storeStrong((id *)&self->_wallpaperScoreModel, 0);
}

@end
