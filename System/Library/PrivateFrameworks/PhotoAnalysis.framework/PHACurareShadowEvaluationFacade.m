@implementation PHACurareShadowEvaluationFacade

- (PHACurareShadowEvaluationFacade)initWithPhotosLibrary:(id)a3 graphManagerProgress:(id)a4
{
  id v6;
  id v7;
  PHACurareShadowEvaluationFacade *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHACurareShadowEvaluationFacade;
  v8 = -[PHACurareShadowEvaluationFacade init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D09910]);
    -[PHACurareShadowEvaluationFacade setAnalytics:](v8, "setAnalytics:", v9);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHACurareShadowEvaluationFacade analytics](v8, "analytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-photoanalysisd"), v10);

    -[PHACurareShadowEvaluationFacade analytics](v8, "analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setupSystemPropertyProvidersForLibrary:", v6);

    -[PHACurareShadowEvaluationFacade analytics](v8, "analytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateEventQueue");

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760A0]), "initWithPhotoLibrary:analytics:progressBlock:", v6, v8->_analytics, v7);
    -[PHACurareShadowEvaluationFacade setGraphManager:](v8, "setGraphManager:", v14);

    -[PHACurareShadowEvaluationFacade setSystemPhotoLibrary:](v8, "setSystemPhotoLibrary:", v6);
  }

  return v8;
}

- (void)runPFLRecipeUserInfo:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8
{
  void (**v14)(id, id);
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v14 = (void (**)(id, id))a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[PHACurareShadowEvaluationFacade systemPhotoLibrary](self, "systemPhotoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHACurareShadowEvaluationFacade graphManager](self, "graphManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  +[PHACurareShadowEvaluationRecipeDecoder decodeRecipeUserInfo:models:photoLibrary:graphManager:trialDeploymentID:trialExperimentID:trialTreatmentID:decodingError:](PHACurareShadowEvaluationRecipeDecoder, "decodeRecipeUserInfo:models:photoLibrary:graphManager:trialDeploymentID:trialExperimentID:trialTreatmentID:decodingError:", v19, v18, v20, v21, v17, v16, v15, &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v26;
  v25 = v23;
  objc_msgSend(v22, "runWithError:", &v25);
  v24 = v25;

  v14[2](v14, v24);
}

- (CPAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)setGraphManager:(id)a3
{
  objc_storeStrong((id *)&self->_graphManager, a3);
}

- (PHPhotoLibrary)systemPhotoLibrary
{
  return self->_systemPhotoLibrary;
}

- (void)setSystemPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_systemPhotoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

@end
