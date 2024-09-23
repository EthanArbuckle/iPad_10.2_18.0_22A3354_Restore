@implementation PXStoryAutoEditClipComposabilityProvider

- (PXStoryAutoEditClipComposabilityProvider)initWithDisplayAssets:(id)a3 chapterCollection:(id)a4
{
  id v7;
  id v8;
  PXStoryAutoEditClipComposabilityProvider *v9;
  PXStoryAutoEditClipComposabilityProvider *v10;
  PXStoryPhotoAnalysisComposabilityScorer *v11;
  PXStoryAutoEditComposabilityScorer *similarityScorer;
  PXStoryCropQualityComposabilityScorer *v13;
  PXStoryAutoEditComposabilityScorer *cropQualityScorer;
  objc_class *v15;
  id v16;
  const char *v17;
  os_log_t v18;
  OS_os_log *log;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryAutoEditClipComposabilityProvider;
  v9 = -[PXStoryAutoEditClipComposabilityProvider init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayAssets, a3);
    objc_storeStrong((id *)&v10->_chapterCollection, a4);
    v11 = objc_alloc_init(PXStoryPhotoAnalysisComposabilityScorer);
    similarityScorer = v10->_similarityScorer;
    v10->_similarityScorer = (PXStoryAutoEditComposabilityScorer *)v11;

    v13 = objc_alloc_init(PXStoryCropQualityComposabilityScorer);
    cropQualityScorer = v10->_cropQualityScorer;
    v10->_cropQualityScorer = (PXStoryAutoEditComposabilityScorer *)v13;

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    v18 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v17);
    log = v10->_log;
    v10->_log = (OS_os_log *)v18;

  }
  return v10;
}

- (void)_computeComposabilityScores
{
  os_signpost_id_t v3;
  OS_os_log *v4;
  NSObject *v5;
  unint64_t v6;
  OS_os_log *v7;
  PXStoryAutoEditComposabilityScorer *similarityScorer;
  PXDisplayAssetFetchResult *displayAssets;
  PXStoryComposabilityResults *v10;
  id v11;
  PXStoryComposabilityResults *similarityScoreResults;
  NSObject *v13;
  OS_os_log *v14;
  NSObject *v15;
  OS_os_log *v16;
  PXStoryAutoEditComposabilityScorer *cropQualityScorer;
  PXDisplayAssetFetchResult *v18;
  PXStoryComposabilityResults *v19;
  id v20;
  PXStoryComposabilityResults *cropScoreResults;
  NSObject *v22;
  OS_os_log *v23;
  NSObject *v24;
  PXStoryComposabilityScoresMutableArray *v25;
  unint64_t i;
  float v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  double v32;
  double v33;
  PXStoryComposabilityScoresArray *v34;
  OS_os_log *v35;
  NSObject *v36;
  OS_os_log *v37;
  void *v38;
  PXStoryChapteredComposabilityResults *v39;
  PXStoryComposabilityScoresArray *v40;
  OS_os_log *v41;
  NSObject *v42;
  PXStoryComposabilityResults *composabilityResults;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v4 = self->_log;
  v5 = v4;
  v6 = v3 - 1;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v7 = self->_log;
  }
  else
  {
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipComposabilityScoreRequest", ", buf, 2u);
    }

    v7 = self->_log;
    if (os_signpost_enabled((os_log_t)v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, (os_log_t)v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipSimilarityScoreRequest", ", buf, 2u);
    }
  }

  similarityScorer = self->_similarityScorer;
  displayAssets = self->_displayAssets;
  v45 = 0;
  -[PXStoryAutoEditComposabilityScorer computeComposabilityScoresForDisplayAssets:error:](similarityScorer, "computeComposabilityScoresForDisplayAssets:error:", displayAssets, &v45);
  v10 = (PXStoryComposabilityResults *)objc_claimAutoreleasedReturnValue();
  v11 = v45;
  similarityScoreResults = self->_similarityScoreResults;
  self->_similarityScoreResults = v10;

  if (!self->_similarityScoreResults)
  {
    PLStoryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v11;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Similarity composability scorer error: %{public}@", buf, 0xCu);
    }

  }
  v14 = self->_log;
  v15 = v14;
  if (v6 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v16 = self->_log;
  }
  else
  {
    if (os_signpost_enabled((os_log_t)v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipSimilarityScoreRequest", ", buf, 2u);
    }

    v16 = self->_log;
    if (os_signpost_enabled((os_log_t)v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, (os_log_t)v16, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipCropQualityScoreRequest", ", buf, 2u);
    }
  }

  cropQualityScorer = self->_cropQualityScorer;
  v18 = self->_displayAssets;
  v44 = 0;
  -[PXStoryAutoEditComposabilityScorer computeComposabilityScoresForDisplayAssets:error:](cropQualityScorer, "computeComposabilityScoresForDisplayAssets:error:", v18, &v44);
  v19 = (PXStoryComposabilityResults *)objc_claimAutoreleasedReturnValue();
  v20 = v44;
  cropScoreResults = self->_cropScoreResults;
  self->_cropScoreResults = v19;

  if (!self->_cropScoreResults)
  {
    PLStoryGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v20;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Crop composability scorer error: %{public}@", buf, 0xCu);
    }

  }
  v23 = self->_log;
  v24 = v23;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipCropQualityScoreRequest", ", buf, 2u);
  }

  v25 = -[PXStoryComposabilityScoresArray initWithCapacity:]([PXStoryComposabilityScoresMutableArray alloc], "initWithCapacity:", -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"));
  for (i = 0; (uint64_t)i < -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"); ++i)
  {
    v27 = 0.0;
    v28 = 0.0;
    if (i < -[PXStoryComposabilityResults count](self->_similarityScoreResults, "count"))
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_similarityScoreResults, "composabilityScoresAtIndex:", i);
      v27 = v29;
      v28 = v30;
    }
    v31 = -[PXStoryComposabilityResults count](self->_cropScoreResults, "count");
    LODWORD(v32) = 0;
    LODWORD(v33) = 0;
    if (i < v31)
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_cropScoreResults, "composabilityScoresAtIndex:", i, v32, v33);
    *(float *)&v32 = v27 * *(float *)&v32;
    *(float *)&v33 = v28 * *(float *)&v33;
    -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v25, "addComposabilityScores:", v32, v33);
  }
  v34 = (PXStoryComposabilityScoresArray *)-[PXStoryComposabilityScoresMutableArray copy](v25, "copy");
  v35 = self->_log;
  v36 = v35;
  if (v6 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v37 = self->_log;
  }
  else
  {
    if (os_signpost_enabled((os_log_t)v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v36, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipComposabilityScoreRequest", ", buf, 2u);
    }

    v37 = self->_log;
    if (os_signpost_enabled((os_log_t)v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, (os_log_t)v37, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipChapteredScoreRequest", ", buf, 2u);
    }
  }

  -[PXStoryAutoEditClipComposabilityProvider chapterCollection](self, "chapterCollection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = -[PXStoryChapteredComposabilityResults initWithDisplayAssets:originalResults:chapterCollection:]([PXStoryChapteredComposabilityResults alloc], "initWithDisplayAssets:originalResults:chapterCollection:", self->_displayAssets, v34, v38);
    v40 = -[PXStoryComposabilityScoresArray initWithComposabilityResults:]([PXStoryComposabilityScoresArray alloc], "initWithComposabilityResults:", v39);

    v34 = v40;
  }
  v41 = self->_log;
  v42 = v41;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v42, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipChapteredScoreRequest", ", buf, 2u);
  }

  composabilityResults = self->_composabilityResults;
  self->_composabilityResults = (PXStoryComposabilityResults *)v34;

}

- (id)results
{
  PXStoryComposabilityResults *composabilityResults;

  composabilityResults = self->_composabilityResults;
  if (!composabilityResults)
  {
    -[PXStoryAutoEditClipComposabilityProvider _computeComposabilityScores](self, "_computeComposabilityScores");
    composabilityResults = self->_composabilityResults;
  }
  return composabilityResults;
}

- ($94F468A8D4C62B317260615823C2B210)composabilityScoresForDisplayAssetIndex:(unint64_t)a3
{
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  $94F468A8D4C62B317260615823C2B210 result;

  if (-[PXDisplayAssetFetchResult count](self->_displayAssets, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditClipComposabilityProvider.mm"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _displayAssets.count"));

  }
  -[PXStoryAutoEditClipComposabilityProvider results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composabilityScoresAtIndex:", a3);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (int64_t)count
{
  return -[PXDisplayAssetFetchResult count](self->_displayAssets, "count");
}

- (id)diagnosticDescription
{
  id v3;
  unint64_t i;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  float v10;
  unint64_t v11;
  double v12;
  float v13;
  unint64_t j;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  float v20;
  unint64_t v21;
  double v22;
  float v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("-- Diptych Composability Results --\n"));
  objc_msgSend(v3, "appendString:", CFSTR("Index\tAsset\tSimilarity\tCrop\tComposability\n"));
  for (i = 0; (uint64_t)i < -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"); ++i)
  {
    -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_similarityScoreResults, "composabilityScoresAtIndex:", i);
    v8 = v7;
    v9 = 0.0;
    if (i < -[PXStoryComposabilityResults count](self->_cropScoreResults, "count"))
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_cropScoreResults, "composabilityScoresAtIndex:", i);
      v9 = v10;
    }
    v11 = -[PXStoryComposabilityResults count](self->_composabilityResults, "count");
    v12 = 0.0;
    if (i < v11)
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_composabilityResults, "composabilityScoresAtIndex:", i, 0.0);
      v12 = v13;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("%lu\t%@\t%0.3f\t%0.3f\t%0.3f\n"), i, v6, v8, *(_QWORD *)&v9, *(_QWORD *)&v12);

  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("-- Triptych Composability Results --\n"));
  objc_msgSend(v3, "appendString:", CFSTR("Index\tAsset\tSimilarity\tCrop\tComposability\n"));
  for (j = 0; (uint64_t)j < -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"); ++j)
  {
    -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", j);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_similarityScoreResults, "composabilityScoresAtIndex:", j);
    v18 = v17;
    v19 = 0.0;
    if (j < -[PXStoryComposabilityResults count](self->_cropScoreResults, "count"))
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_cropScoreResults, "composabilityScoresAtIndex:", j);
      v19 = v20;
    }
    v21 = -[PXStoryComposabilityResults count](self->_composabilityResults, "count");
    v22 = 0.0;
    if (j < v21)
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_composabilityResults, "composabilityScoresAtIndex:", j, 0.0);
      v22 = v23;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("%lu\t%@\t%0.3f\t%0.3f\t%0.3f\n"), j, v16, v18, *(_QWORD *)&v19, *(_QWORD *)&v22);

  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXStoryAutoEditComposabilityScorer diagnosticDescription](self->_cropQualityScorer, "diagnosticDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v24);

  }
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXStoryAutoEditComposabilityScorer)cropQualityScorer
{
  return self->_cropQualityScorer;
}

- (PXStoryAutoEditComposabilityScorer)similarityScorer
{
  return self->_similarityScorer;
}

- (void)setSimilarityScorer:(id)a3
{
  objc_storeStrong((id *)&self->_similarityScorer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarityScorer, 0);
  objc_storeStrong((id *)&self->_cropQualityScorer, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_composabilityResults, 0);
  objc_storeStrong((id *)&self->_cropScoreResults, 0);
  objc_storeStrong((id *)&self->_similarityScoreResults, 0);
}

@end
