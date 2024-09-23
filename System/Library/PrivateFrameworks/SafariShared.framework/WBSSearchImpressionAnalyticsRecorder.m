@implementation WBSSearchImpressionAnalyticsRecorder

- (void)setSearchProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

void __54__WBSSearchImpressionAnalyticsRecorder_sharedRecorder__block_invoke()
{
  WBSSearchImpressionAnalyticsRecorder *v0;
  void *v1;

  v0 = objc_alloc_init(WBSSearchImpressionAnalyticsRecorder);
  v1 = (void *)sharedRecorder_sharedRecorder;
  sharedRecorder_sharedRecorder = (uint64_t)v0;

}

- (WBSSearchImpressionAnalyticsRecorder)init
{
  WBSSearchImpressionAnalyticsRecorder *v2;
  WBSSearchImpressionAnalyticsRecorder *v3;
  WBSSearchImpressionAnalyticsRecorder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSSearchImpressionAnalyticsRecorder;
  v2 = -[WBSSearchImpressionAnalyticsRecorder init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (WBSSearchImpressionAnalyticsRecorder)sharedRecorder
{
  if (sharedRecorder_onceToken != -1)
    dispatch_once(&sharedRecorder_onceToken, &__block_literal_global_92);
  return (WBSSearchImpressionAnalyticsRecorder *)(id)sharedRecorder_sharedRecorder;
}

- (void)setDefaultSearchProvider:(id)a3
{
  WBSSearchProvider *v5;
  WBSSearchProvider **p_defaultSearchProvider;
  WBSSearchProvider *defaultSearchProvider;
  WBSSearchProvider *v8;

  v5 = (WBSSearchProvider *)a3;
  defaultSearchProvider = self->_defaultSearchProvider;
  p_defaultSearchProvider = &self->_defaultSearchProvider;
  if (defaultSearchProvider != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_defaultSearchProvider, a3);
    v5 = v8;
  }

}

- (void)didActualizeImpressionForURL:(id)a3 provenance:(int64_t)a4
{
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = objc_msgSend(v13, "safari_isHTTPFamilyURL");
  v7 = v13;
  if (v6)
  {
    -[WBSSearchImpressionAnalyticsRecorder searchProviderForURL:](self, "searchProviderForURL:", v13);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a4 == 1 || v8)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSearchProvider shortName](self->_defaultSearchProvider, "shortName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier:searchProviderIdentifier:provenance:", v11, v12, a4);

    }
    v7 = v13;
  }

}

- (id)searchProviderForURL:(id)a3
{
  id v4;
  WBSSearchProvider *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WBSSearchProvider urlIsValidSearch:](self->_defaultSearchProvider, "urlIsValidSearch:", v4))
  {
    v5 = self->_defaultSearchProvider;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_searchProviders;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "urlIsValidSearch:", v4, (_QWORD)v13) & 1) != 0)
          {
            v5 = v11;

            goto LABEL_13;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (NSArray)searchProviders
{
  return self->_searchProviders;
}

- (WBSSearchProvider)defaultSearchProvider
{
  return self->_defaultSearchProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSearchProvider, 0);
  objc_storeStrong((id *)&self->_searchProviders, 0);
}

@end
