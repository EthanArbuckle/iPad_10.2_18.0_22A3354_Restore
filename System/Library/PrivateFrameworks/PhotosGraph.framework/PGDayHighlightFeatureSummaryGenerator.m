@implementation PGDayHighlightFeatureSummaryGenerator

- (PGDayHighlightFeatureSummaryGenerator)initWithHighlightNode:(id)a3 loggingConnection:(id)a4 highlightTailorContext:(id)a5 graph:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGDayHighlightFeatureSummaryGenerator *v15;
  PGDayHighlightFeatureSummaryGenerator *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGDayHighlightFeatureSummaryGenerator;
  v15 = -[PGDayHighlightFeatureSummaryGenerator init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_highlightNode, a3);
    objc_storeStrong((id *)&v16->_loggingConnection, a4);
    objc_storeStrong((id *)&v16->_highlightTailorContext, a5);
    objc_storeStrong((id *)&v16->_graph, a6);
  }

  return v16;
}

- (id)sortedSummarizedFeaturesForMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *loggingConnection;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGGraphHighlightNode *highlightNode;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGHighlightTailorContext locationFeatureSummarySource](self->_highlightTailorContext, "locationFeatureSummarySource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "summarizedFeaturesForMomentNodes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "addressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        highlightNode = self->_highlightNode;
        v25 = loggingConnection;
        -[PGGraphHighlightNode localIdentifier](highlightNode, "localIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v26;
        _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "No summarized features found for highlight, %@", buf, 0xCu);

      }
    }
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __80__PGDayHighlightFeatureSummaryGenerator_sortedSummarizedFeaturesForMomentNodes___block_invoke;
  v31[3] = &unk_1E842C9B8;
  v31[4] = self;
  v29 = v5;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightTailorContext meaningFeatureSummarySource](self->_highlightTailorContext, "meaningFeatureSummarySource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "summarizedFeaturesForMomentNodes:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightTailorContext holidayDateFeatureSummarySource](self->_highlightTailorContext, "holidayDateFeatureSummarySource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "summarizedFeaturesForMomentNodes:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightTailorContext publicEventFeatureSummarySource](self->_highlightTailorContext, "publicEventFeatureSummarySource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "summarizedFeaturesForMomentNodes:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightTailorContext businessFeatureSummarySource](self->_highlightTailorContext, "businessFeatureSummarySource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "summarizedFeaturesForMomentNodes:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v9;
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v9, "count"))
      goto LABEL_10;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  objc_msgSend(v16, "addObject:", v18);

  v9 = v17;
LABEL_10:
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);

    v9 = v17;
  }
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

    v9 = v17;
  }
  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v22);

    v9 = v17;
  }

  return v16;
}

- (double)durationFromDateIntervals:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "duration");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (unint64_t)locationGranularityScoreForSummarizedFeatureSubtype:(unsigned __int16)a3
{
  if ((a3 - 1) >= 5)
    return 0;
  else
    return 5 - (unsigned __int16)(a3 - 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_highlightTailorContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_highlightNode, 0);
}

uint64_t __80__PGDayHighlightFeatureSummaryGenerator_sortedSummarizedFeaturesForMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "numberOfAssets");
  v8 = objc_msgSend(v6, "numberOfAssets");
  if (v7 <= v8)
  {
    if (v8 > v7)
    {
      v9 = 1;
      goto LABEL_14;
    }
    objc_msgSend(v5, "intervalsPresent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intervalsPresent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "durationFromDateIntervals:", v10);
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "durationFromDateIntervals:", v11);
    if (v13 > v14)
      goto LABEL_10;
    if (v14 <= v13)
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "locationGranularityScoreForSummarizedFeatureSubtype:", objc_msgSend(v5, "subtype"));
      v16 = objc_msgSend(*(id *)(a1 + 32), "locationGranularityScoreForSummarizedFeatureSubtype:", objc_msgSend(v6, "subtype"));
      if (v15 > v16)
      {
LABEL_10:
        v9 = -1;
LABEL_13:

        goto LABEL_14;
      }
      if (v16 <= v15)
      {
        objc_msgSend(v5, "locationNode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "centroidCoordinate");
        v19 = v18;
        v21 = v20;

        objc_msgSend(v6, "locationNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centroidCoordinate");
        v24 = v23;
        v26 = v25;

        if (v19 > v24)
          goto LABEL_10;
        if (v19 >= v24)
        {
          if (v21 <= v26)
            v9 = 1;
          else
            v9 = -1;
          goto LABEL_13;
        }
      }
    }
    v9 = 1;
    goto LABEL_13;
  }
  v9 = -1;
LABEL_14:

  return v9;
}

@end
