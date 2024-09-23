@implementation PXStoryPhotoAnalysisComposabilityScorer

- (id)computeComposabilityScoresForDisplayAssets:(id)a3 error:(id *)a4
{
  void *v4;
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  PXStoryComposabilityScoresMutableArray *v17;
  unint64_t j;
  unint64_t v19;
  int v20;
  int v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  v10 = *MEMORY[0x1E0CD1840];
  v28[0] = *MEMORY[0x1E0CD1838];
  v28[1] = v10;
  v29[0] = MEMORY[0x1E0C9AAB0];
  v29[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "composabilityScoresOfAssets:options:error:", v7, v27, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1858]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1860]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {
    v17 = 0;
  }
  else
  {
    v17 = -[PXStoryComposabilityScoresArray initWithCapacity:]([PXStoryComposabilityScoresMutableArray alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
    for (j = 0; j < objc_msgSend(v7, "count"); ++j)
    {
      v19 = objc_msgSend(v12, "count");
      v20 = 0;
      if (j < v19)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", j);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "floatValue");
        v20 = v21;
      }
      v24 = 0;
      if (j < objc_msgSend(v14, "count"))
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", j);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        v24 = v26;

      }
      if (j < v19)

      LODWORD(v22) = v20;
      LODWORD(v23) = v24;
      -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v17, "addComposabilityScores:", v22, v23);
    }
  }

  return v17;
}

@end
