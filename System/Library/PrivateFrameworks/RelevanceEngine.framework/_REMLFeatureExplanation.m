@implementation _REMLFeatureExplanation

+ (id)combinedExplanationsFromExplanations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t j;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  uint64_t v31;
  float *v32;
  float v33;
  float v34;
  float *v35;
  _REMLFeatureExplanation *v36;
  double v37;
  double v38;
  _REMLFeatureExplanation *v39;
  void *v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i) + 8), "allFeatures");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v41 = v5;
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "mutableCopy");
  v43 = v11;
  while (objc_msgSend(v11, "count"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (!v13)
    {

      break;
    }
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        v19 = v16;
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v21 = objc_msgSend(v12, "countForObject:", v20);
        if (v21 <= v19)
        {
          v16 = v19;
        }
        else
        {
          v22 = v20;

          v15 = v22;
          v16 = v21;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v14);

    if (!v15)
      break;
    if (v16)
    {
      if (v21 <= v19)
        v23 = v19;
      else
        v23 = v21;
      do
      {
        objc_msgSend(v12, "removeObject:", v15);
        --v23;
      }
      while (v23);
    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v25 = v43;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
          if (objc_msgSend(*(id *)(v30 + 8), "containsFeature:", v15))
            objc_msgSend(v24, "addObject:", v30);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v27);
    }

    objc_msgSend(v25, "minusSet:", v24);
    objc_msgSend(v24, "anyObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (float *)v31;
      objc_msgSend(v24, "removeObject:", v31);
      v33 = v32[4];
      v34 = v32[5];
      while (objc_msgSend(v24, "count"))
      {
        objc_msgSend(v24, "anyObject");
        v35 = (float *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObject:", v35);
        v33 = v33 + v35[4];
        if (v34 >= v35[5])
          v34 = v35[5];

      }
      v36 = [_REMLFeatureExplanation alloc];
      *(float *)&v37 = v33;
      *(float *)&v38 = v34;
      v39 = -[_REMLFeatureExplanation initWithFeature:mean:variance:](v36, "initWithFeature:mean:variance:", v15, v37, v38);

      objc_msgSend(v42, "addObject:", v39);
    }

    v11 = v25;
  }

  return v42;
}

- (_REMLFeatureExplanation)initWithFeature:(id)a3 mean:(float)a4 variance:(float)a5
{
  id v8;
  _REMLFeatureExplanation *v9;
  void *v10;
  uint64_t v11;
  REFeatureSet *features;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_REMLFeatureExplanation;
  v9 = -[_REMLFeatureExplanation init](&v14, sel_init);
  if (v9)
  {
    +[REFeatureSet featureSetWithFeature:](REFeatureSet, "featureSetWithFeature:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    RERootFeatureSetForFeatures(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    features = v9->_features;
    v9->_features = (REFeatureSet *)v11;

    v9->_mean = a4;
    v9->_variance = a5;
  }

  return v9;
}

- (BOOL)shouldProvideExplanation
{
  return fabsf(self->_mean) > 0.33;
}

- (id)explanationByCombiningWithExplanation:(id)a3
{
  id v4;
  _REMLFeatureExplanation *v5;
  void *v6;
  uint64_t v7;
  REFeatureSet *features;
  float variance;
  float v10;
  float v11;

  v4 = a3;
  v5 = objc_alloc_init(_REMLFeatureExplanation);
  v6 = (void *)objc_msgSend(*((id *)v4 + 1), "mutableCopy");
  objc_msgSend(v6, "intersetFeatureSet:", self->_features);
  v7 = objc_msgSend(v6, "copy");
  features = v5->_features;
  v5->_features = (REFeatureSet *)v7;

  v5->_mean = self->_mean + *((float *)v4 + 4);
  variance = self->_variance;
  v10 = *((float *)v4 + 5);

  if (variance >= v10)
    v11 = v10;
  else
    v11 = variance;
  v5->_mean = v11;

  return v5;
}

- (BOOL)_canCombineWithSimilarExplanation:(id)a3
{
  return objc_msgSend(*((id *)a3 + 1), "intersectsFeatureSet:", self->_features);
}

- (int64_t)_rankExplanationToSimilarExplanation:(id)a3
{
  double v3;
  void *v5;
  double v6;
  void *v7;
  int64_t v8;

  LODWORD(v3) = *((_DWORD *)a3 + 4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = self->_mean;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (_REMLFeatureExplanation)explanationWithStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;

  -[REFeatureSet allFeatures](self->_features, "allFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLExplanation _formattedFeatureListFromFeatures:style:](self, "_formattedFeatureListFromFeatures:style:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    if (self->_mean <= 0.0)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Low probability from %@"), v6);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("High probability from %@"), v6);
    goto LABEL_10;
  }
  if (!a3)
  {
    if (self->_mean <= 0.0)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Low %@"), v6);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("High %@"), v6);
LABEL_10:
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = CFSTR("Unknown style");
LABEL_11:

  return (_REMLFeatureExplanation *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

@end
