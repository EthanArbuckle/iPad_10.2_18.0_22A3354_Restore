@implementation PGRelationshipSocialGroupAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipSocialGroupAnalyzer");
}

- (PGRelationshipSocialGroupAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipSocialGroupAnalyzer *v5;
  PGRelationshipSocialGroupAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipSocialGroupAnalyzer;
  v5 = -[PGRelationshipSocialGroupAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  double Current;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "personNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleInferencesConveniences topPersonNodeIdentifierForTwoPersonSocialGroupsFromPersonNodes:personNodes:](PGPeopleInferencesConveniences, "topPersonNodeIdentifierForTwoPersonSocialGroupsFromPersonNodes:personNodes:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      if (v4)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v5 >= 0.01)
        {
          v15 = 0;
          v4[2](v4, &v15, 0.5);
          if (v15)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
LABEL_28:

              goto LABEL_29;
            }
            *(_DWORD *)buf = 67109378;
            v17 = 45;
            v18 = 2080;
            v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
            v12 = MEMORY[0x1E0C81028];
LABEL_18:
            _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_28;
          }
          v5 = Current;
        }
      }
      objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "registerTopTwoPersonSocialGroup");
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
        {
          v15 = 0;
          v4[2](v4, &v15, 1.0);
          if (v15)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v17 = 53;
              v18 = 2080;
              v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_28;
    }
    if (!v4)
      goto LABEL_28;
    if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
      goto LABEL_28;
    v15 = 0;
    v4[2](v4, &v15, 1.0);
    if (!v15 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_28;
    *(_DWORD *)buf = 67109378;
    v17 = 42;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_18;
  }
  v15 = 0;
  v4[2](v4, &v15, 0.0);
  if (!v15)
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v17 = 34;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_29:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
