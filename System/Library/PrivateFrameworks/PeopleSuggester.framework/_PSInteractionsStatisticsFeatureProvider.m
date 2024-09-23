@implementation _PSInteractionsStatisticsFeatureProvider

- (_PSInteractionsStatisticsFeatureProvider)initWithInteractionsStatistics:(id)a3
{
  id v4;
  _PSInteractionsStatisticsFeatureProvider *v5;
  uint64_t v6;
  NSMutableDictionary *mlFeatures;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  id obja;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_PSInteractionsStatisticsFeatureProvider;
  v5 = -[_PSInteractionsStatisticsFeatureProvider init](&v41, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    mlFeatures = v5->_mlFeatures;
    v5->_mlFeatures = (NSMutableDictionary *)v6;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "properties");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          v13 = (void *)objc_opt_new();
          objc_msgSend(v4, "properties");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __75___PSInteractionsStatisticsFeatureProvider_initWithInteractionsStatistics___block_invoke;
          v35[3] = &unk_1E43FEA78;
          v36 = v13;
          v16 = v13;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v35);

          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_mlFeatures, "setObject:forKeyedSubscript:", v16, v12);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v9);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v4, "features");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(obja);
          v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_mlFeatures, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v22 = (void *)objc_opt_new();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_mlFeatures, "setObject:forKeyedSubscript:", v22, v21);
          }
          objc_msgSend(v4, "features");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __75___PSInteractionsStatisticsFeatureProvider_initWithInteractionsStatistics___block_invoke_2;
          v29[3] = &unk_1E43FEAA0;
          v30 = v22;
          v25 = v22;
          objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);

        }
        v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v18);
    }

  }
  return v5;
}

- (id)mlFeatures
{
  return (id)-[NSMutableDictionary copy](self->_mlFeatures, "copy");
}

- (id)mlFeaturesForConversationId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mlFeatures, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)featureValueForFeature:(id)a3 forConversationId:(id)a4
{
  NSMutableDictionary *mlFeatures;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  mlFeatures = self->_mlFeatures;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](mlFeatures, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureValueForName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlFeatures, 0);
}

@end
