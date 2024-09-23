@implementation PHAPrivateFederatedLearningFacade

- (PHAPrivateFederatedLearningFacade)initWithPhotosLibrary:(id)a3 graphManagerProgress:(id)a4
{
  id v6;
  id v7;
  PHAPrivateFederatedLearningFacade *v8;
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
  v16.super_class = (Class)PHAPrivateFederatedLearningFacade;
  v8 = -[PHAPrivateFederatedLearningFacade init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D09910]);
    -[PHAPrivateFederatedLearningFacade setAnalytics:](v8, "setAnalytics:", v9);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningFacade analytics](v8, "analytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-photoanalysisd"), v10);

    -[PHAPrivateFederatedLearningFacade analytics](v8, "analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setupSystemPropertyProvidersForLibrary:", v6);

    -[PHAPrivateFederatedLearningFacade analytics](v8, "analytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateEventQueue");

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760A0]), "initWithPhotoLibrary:analytics:progressBlock:", v6, v8->_analytics, v7);
    -[PHAPrivateFederatedLearningFacade setGraphManager:](v8, "setGraphManager:", v14);

    -[PHAPrivateFederatedLearningFacade setSystemPhotoLibrary:](v8, "setSystemPhotoLibrary:", v6);
  }

  return v8;
}

- (void)runPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5
{
  void (**v8)(id, void *, void *, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v8 = (void (**)(id, void *, void *, id))a5;
  v9 = a4;
  v10 = a3;
  -[PHAPrivateFederatedLearningFacade systemPhotoLibrary](self, "systemPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningFacade graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  +[PHAPrivateFederatedLearningRecipeDecoder decodeRecipeUserInfo:attachmentURLs:photoLibrary:graphManager:decodingError:](PHAPrivateFederatedLearningRecipeDecoder, "decodeRecipeUserInfo:attachmentURLs:photoLibrary:graphManager:decodingError:", v9, v10, v11, v12, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v25;
  objc_msgSend(v13, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "learningFramework");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v16, "isEqualToString:", CFSTR("coreML"));

  if ((_DWORD)v9)
  {
    v24 = v14;
    v17 = &v24;
    objc_msgSend(v13, "runCoreMLModelWithError:", &v24);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v14;
    v17 = &v23;
    objc_msgSend(v13, "runWithError:", &v23);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  v20 = *v17;

  objc_msgSend(v19, "dataPackage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trainingMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v21, v22, v20);

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
