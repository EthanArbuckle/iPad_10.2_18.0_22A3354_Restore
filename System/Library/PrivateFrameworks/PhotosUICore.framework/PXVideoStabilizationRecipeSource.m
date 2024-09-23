@implementation PXVideoStabilizationRecipeSource

- (PXVideoStabilizationRecipeSource)init
{
  PXVideoStabilizationRecipeSource *v2;
  void *v3;
  NSDictionary *debugInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXVideoStabilizationRecipeSource;
  v2 = -[PXVideoStabilizationRecipeSource init](&v6, sel_init);
  if (v2)
  {
    +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_allowedAnalysisTypes = objc_msgSend(v3, "allowedAnalysisTypes");

    debugInfo = v2->_debugInfo;
    v2->_debugInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v2->_allowsOnDemandPixelAnalysis = 0;
  }
  return v2;
}

- (id)loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  unint64_t v15;

  self->_recipeLoadSignpost = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
  v15 = 0;
  -[PXVideoStabilizationRecipeSource _loadStabilizationRecipe:analysisType:](self, "_loadStabilizationRecipe:analysisType:", a3, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[PXVideoStabilizationRecipeSource analyticsPayload](self, "analyticsPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("com.apple.photos.CPAnalytics.inlineStabilizationRecipeLoading"), *MEMORY[0x1E0D09850]);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D09830]);

  PXVideoStabilizeAnalysisTypeDescription(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("com.apple.photos.PXVideoStabilizationRecipeSource.analysisType"));

  objc_msgSend(MEMORY[0x1E0D09910], "endSignpost:forEventName:withPayload:", self->_recipeLoadSignpost, *MEMORY[0x1E0D09708], v10);
  *a4 = v15;

  return v7;
}

- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoStabilizationRecipeSource.m"), 121, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoStabilizationRecipeSource _loadStabilizationRecipe:analysisType:]", v8);

  abort();
}

- (unint64_t)allowedAnalysisTypes
{
  return self->_allowedAnalysisTypes;
}

- (void)setAllowedAnalysisTypes:(unint64_t)a3
{
  self->_allowedAnalysisTypes = a3;
}

- (BOOL)allowsOnDemandPixelAnalysis
{
  return self->_allowsOnDemandPixelAnalysis;
}

- (void)setAllowsOnDemandPixelAnalysis:(BOOL)a3
{
  self->_allowsOnDemandPixelAnalysis = a3;
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)analyticsPayload
{
  return self->_analyticsPayload;
}

- (void)setAnalyticsPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPayload, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

@end
