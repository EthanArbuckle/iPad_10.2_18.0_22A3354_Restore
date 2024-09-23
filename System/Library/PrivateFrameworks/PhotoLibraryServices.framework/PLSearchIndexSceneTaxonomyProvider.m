@implementation PLSearchIndexSceneTaxonomyProvider

- (PLSearchIndexSceneTaxonomy)latestSceneTaxonomy
{
  PLSearchIndexSceneTaxonomyProvider *v2;
  PLSearchIndexSceneTaxonomy *latestSceneTaxonomy;
  void *v4;
  PLSearchIndexSceneTaxonomy *v5;
  id v6;
  PLSearchIndexSceneTaxonomy *v7;
  NSObject *v8;
  PLSearchIndexSceneTaxonomy *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  latestSceneTaxonomy = v2->_latestSceneTaxonomy;
  if (!latestSceneTaxonomy)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), 99);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v5 = -[PLSearchIndexSceneTaxonomy initWithIdentifier:error:]([PLSearchIndexSceneTaxonomy alloc], "initWithIdentifier:error:", v4, &v11);
    v6 = v11;
    v7 = v2->_latestSceneTaxonomy;
    v2->_latestSceneTaxonomy = v5;

    if (v6)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version: %@: %@", buf, 0x16u);
      }

    }
    latestSceneTaxonomy = v2->_latestSceneTaxonomy;
  }
  v9 = latestSceneTaxonomy;
  objc_sync_exit(v2);

  return v9;
}

- (PLSearchIndexSceneTaxonomy)previousSceneTaxonomy
{
  PLSearchIndexSceneTaxonomyProvider *v2;
  PLSearchIndexSceneTaxonomy *previousSceneTaxonomy;
  void *v4;
  PLSearchIndexSceneTaxonomy *v5;
  id v6;
  PLSearchIndexSceneTaxonomy *v7;
  NSObject *v8;
  PLSearchIndexSceneTaxonomy *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  previousSceneTaxonomy = v2->_previousSceneTaxonomy;
  if (!previousSceneTaxonomy)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), 84);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v5 = -[PLSearchIndexSceneTaxonomy initWithIdentifier:error:]([PLSearchIndexSceneTaxonomy alloc], "initWithIdentifier:error:", v4, &v11);
    v6 = v11;
    v7 = v2->_previousSceneTaxonomy;
    v2->_previousSceneTaxonomy = v5;

    if (v6)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version: %@: %@", buf, 0x16u);
      }

    }
    previousSceneTaxonomy = v2->_previousSceneTaxonomy;
  }
  v9 = previousSceneTaxonomy;
  objc_sync_exit(v2);

  return v9;
}

- (id)searchIndexSceneTaxonomyForSceneAnalysisVersion:(signed __int16)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 < 99)
  {
    v4 = a3;
    if (a3 < 84)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7[0] = 67109120;
        v7[1] = v4;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Unable to instantiate scene taxonomy for scene analysis version: %i", (uint8_t *)v7, 8u);
      }

      v3 = 0;
    }
    else
    {
      -[PLSearchIndexSceneTaxonomyProvider previousSceneTaxonomy](self, "previousSceneTaxonomy");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[PLSearchIndexSceneTaxonomyProvider latestSceneTaxonomy](self, "latestSceneTaxonomy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)digests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLSearchIndexSceneTaxonomyProvider latestSceneTaxonomy](self, "latestSceneTaxonomy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "digest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSearchIndexSceneTaxonomyProvider previousSceneTaxonomy](self, "previousSceneTaxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "digest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLSearchIndexSceneTaxonomyProvider latestSceneTaxonomy](self, "latestSceneTaxonomy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSearchIndexSceneTaxonomyProvider previousSceneTaxonomy](self, "previousSceneTaxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("latestTaxonomy: %@\npreviousTaxonomy: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setLatestSceneTaxonomy:(id)a3
{
  objc_storeStrong((id *)&self->_latestSceneTaxonomy, a3);
}

- (void)setPreviousSceneTaxonomy:(id)a3
{
  objc_storeStrong((id *)&self->_previousSceneTaxonomy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_latestSceneTaxonomy, 0);
}

@end
