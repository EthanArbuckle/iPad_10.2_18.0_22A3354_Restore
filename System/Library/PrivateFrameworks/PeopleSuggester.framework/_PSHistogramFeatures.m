@implementation _PSHistogramFeatures

+ (id)conditionedProbabilityAcrossAllBucketsWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6 histogramSmoothingParameterK:(id)a7 histogramSmoothingParameterV:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  id v47;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  id obj;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v12 = *(_QWORD *)&a4;
  v75 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v63 = a6;
  v55 = a7;
  v54 = a8;
  if (objc_msgSend(v13, "count"))
  {
    v15 = (void *)objc_opt_new();
    +[_PSHistogramFeatures virtualFeatureToDurableFeatureSourceMapping:](_PSHistogramFeatures, "virtualFeatureToDurableFeatureSourceMapping:", v12);
    BMMLSEDurableFeatureStorefeatureNameAsString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSHistogramFeatures computeFactorNameForFeature:](_PSHistogramFeatures, "computeFactorNameForFeature:", v16);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    +[_PSHistogramFeatures fetchIntervalStringForFeatureName:](_PSHistogramFeatures, "fetchIntervalStringForFeatureName:", v12);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSHistogramFeatures fetchBucketNamesFromPredictionContextForFeatureName:predictionContext:](_PSHistogramFeatures, "fetchBucketNamesFromPredictionContextForFeatureName:predictionContext:", v12, v14);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "count"))
    {
      v50 = v13;
      v51 = v15;
      v49 = v14;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v13;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v70;
        v52 = *(_QWORD *)v70;
        do
        {
          v20 = 0;
          v56 = v18;
          do
          {
            if (*(_QWORD *)v70 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v20);
            v22 = (void *)MEMORY[0x1A1AFCA24]();
            if (objc_msgSend(v21, "hasCandidateIdentifier"))
            {
              v64 = v21;
              v67 = 0u;
              v68 = 0u;
              v65 = 0u;
              v66 = 0u;
              v60 = v53;
              v23 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
              v58 = v22;
              v59 = v20;
              if (v23)
              {
                v24 = v23;
                v25 = 0;
                v26 = *(_QWORD *)v66;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v66 != v26)
                      objc_enumerationMutation(v60);
                    v28 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
                    objc_msgSend(v63, "cache", v49, v50);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "candidateIdentifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "objectForKeyedSubscript:", v30);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "objectForKeyedSubscript:", v62);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "objectForKeyedSubscript:", v61);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "objectForKeyedSubscript:", v28);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = v34;
                    if (!v34)
                      v34 = &unk_1E442B588;
                    v25 += objc_msgSend(v34, "intValue");

                  }
                  v24 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
                }
                while (v24);
              }
              else
              {
                v25 = 0;
              }

              objc_msgSend(v63, "bucketSums");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "candidateIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKeyedSubscript:", v62);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", v61);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40;
              if (!v40)
                v40 = &unk_1E442B588;
              v42 = objc_msgSend(v40, "intValue", v49, v50);

              v43 = objc_msgSend(v55, "intValue");
              v44 = objc_msgSend(v55, "intValue");
              v45 = v42 + objc_msgSend(v54, "intValue") * v44;
              v19 = v52;
              v18 = v56;
              v22 = v58;
              v20 = v59;
              if (v45 >= 1)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v43 + v25) / (double)v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addFeatureWithIntValue:doubleValue:stringValue:BOOLValue:timeBucket:forKey:", 0, v46, 0, 0, 0, v64);

              }
            }
            objc_autoreleasePoolPop(v22);
            ++v20;
          }
          while (v20 != v18);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        }
        while (v18);
      }

      v15 = v51;
      v47 = v51;
      v14 = v49;
      v13 = v50;
    }
    else
    {
      v47 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v47 = (id)MEMORY[0x1E0C9AA70];
  }

  return v47;
}

+ (id)conditionedProbabilityAcrossAllCandidatesWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6 histogramSmoothingParameterK:(id)a7 histogramSmoothingParameterV:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v12 = *(_QWORD *)&a4;
  v71 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v54 = a6;
  v47 = a7;
  v46 = a8;
  if (objc_msgSend(v13, "count"))
  {
    v43 = (void *)objc_opt_new();
    +[_PSHistogramFeatures virtualFeatureToDurableFeatureSourceMapping:](_PSHistogramFeatures, "virtualFeatureToDurableFeatureSourceMapping:", v12);
    BMMLSEDurableFeatureStorefeatureNameAsString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSHistogramFeatures computeFactorNameForFeature:](_PSHistogramFeatures, "computeFactorNameForFeature:", v15);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    +[_PSHistogramFeatures fetchIntervalStringForFeatureName:](_PSHistogramFeatures, "fetchIntervalStringForFeatureName:", v12);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSHistogramFeatures fetchBucketNamesFromPredictionContextForFeatureName:predictionContext:](_PSHistogramFeatures, "fetchBucketNamesFromPredictionContextForFeatureName:predictionContext:", v12, v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "count"))
    {
      v42 = v13;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = v13;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v66;
        v44 = *(_QWORD *)v66;
        do
        {
          v19 = 0;
          v48 = v17;
          do
          {
            if (*(_QWORD *)v66 != v18)
              objc_enumerationMutation(obj);
            v56 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
            if (objc_msgSend(v56, "hasCandidateIdentifier"))
            {
              v50 = v19;
              v63 = 0u;
              v64 = 0u;
              v61 = 0u;
              v62 = 0u;
              v51 = v45;
              v57 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
              if (v57)
              {
                v60 = 0;
                v20 = 0;
                v55 = *(_QWORD *)v62;
                do
                {
                  for (i = 0; i != v57; ++i)
                  {
                    v59 = v20;
                    if (*(_QWORD *)v62 != v55)
                      objc_enumerationMutation(v51);
                    v22 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
                    v58 = v22;
                    objc_msgSend(v54, "cache");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "candidateIdentifier");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "objectForKeyedSubscript:", v53);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "objectForKeyedSubscript:", v52);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "objectForKeyedSubscript:", v22);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = v28;
                    if (!v28)
                      v28 = &unk_1E442B588;
                    v60 += objc_msgSend(v28, "intValue");

                    objc_msgSend(v54, "candidateTimeIntervalSums");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "objectForKeyedSubscript:", v53);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "objectForKeyedSubscript:", v58);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "objectForKeyedSubscript:", v52);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v33;
                    if (!v33)
                      v33 = &unk_1E442B588;
                    v20 = objc_msgSend(v33, "intValue") + v59;

                  }
                  v57 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                }
                while (v57);
              }
              else
              {
                v60 = 0;
                v20 = 0;
              }

              v35 = objc_msgSend(v47, "intValue");
              v36 = objc_msgSend(v47, "intValue");
              v37 = v20 + objc_msgSend(v46, "intValue") * v36;
              v18 = v44;
              v17 = v48;
              v19 = v50;
              if (v37 >= 1)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v35 + v60) / (double)v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "addFeatureWithIntValue:doubleValue:stringValue:BOOLValue:timeBucket:forKey:", 0, v38, 0, 0, 0, v56);

              }
            }
            ++v19;
          }
          while (v19 != v17);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        }
        while (v17);
      }

      v39 = v43;
      v40 = v43;
      v13 = v42;
    }
    else
    {
      v40 = (id)MEMORY[0x1E0C9AA70];
      v39 = v43;
    }

  }
  else
  {
    v40 = (id)MEMORY[0x1E0C9AA70];
  }

  return v40;
}

+ (id)hasEverInBucketWithCandidates:(id)a3 featureName:(int)a4 predictionContext:(id)a5 histogramFeatureData:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v8 = *(_QWORD *)&a4;
  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "count"))
  {
    v12 = (void *)objc_opt_new();
    +[_PSHistogramFeatures virtualFeatureToDurableFeatureSourceMapping:](_PSHistogramFeatures, "virtualFeatureToDurableFeatureSourceMapping:", v8);
    BMMLSEDurableFeatureStorefeatureNameAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSHistogramFeatures computeFactorNameForFeature:](_PSHistogramFeatures, "computeFactorNameForFeature:", v13);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bucketHasEver");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSHistogramFeatures fetchBucketNamesFromPredictionContextForFeatureName:predictionContext:](_PSHistogramFeatures, "fetchBucketNamesFromPredictionContextForFeatureName:predictionContext:", v8, v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "count"))
    {
      v34 = v11;
      v35 = v10;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v36 = v9;
      obj = v9;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v50;
        v37 = *(_QWORD *)v50;
        v38 = v12;
        do
        {
          v17 = 0;
          v40 = v15;
          do
          {
            if (*(_QWORD *)v50 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
            if (objc_msgSend(v18, "hasCandidateIdentifier"))
            {
              v42 = v17;
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              v19 = v39;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
              if (v20)
              {
                v21 = v20;
                v22 = 0;
                v23 = *(_QWORD *)v46;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v46 != v23)
                      objc_enumerationMutation(v19);
                    if ((v22 & 1) != 0)
                    {
                      v25 = 0;
                    }
                    else
                    {
                      v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                      objc_msgSend(v18, "candidateIdentifier");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "objectForKeyedSubscript:", v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "objectForKeyedSubscript:", v44);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "objectForKeyedSubscript:", v26);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = v30 != 0;

                    }
                    v22 |= v25;
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
                }
                while (v21);
              }
              else
              {
                v22 = 0;
              }

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22 & 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = v38;
              objc_msgSend(v38, "addFeatureWithIntValue:doubleValue:stringValue:BOOLValue:timeBucket:forKey:", 0, 0, 0, v31, 0, v18);

              v16 = v37;
              v15 = v40;
              v17 = v42;
            }
            ++v17;
          }
          while (v17 != v15);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v15);
      }

      v32 = v12;
      v10 = v35;
      v9 = v36;
      v11 = v34;
    }
    else
    {
      v32 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v32 = (id)MEMORY[0x1E0C9AA70];
  }

  return v32;
}

+ (id)fetchBucketNamesFromPredictionContextForFeatureName:(int)a3 predictionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t ii;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t jj;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  switch(a3)
  {
    case 524:
    case 525:
    case 526:
    case 527:
    case 528:
    case 529:
    case 530:
    case 531:
    case 532:
    case 533:
    case 644:
      objc_msgSend(v5, "suggestionDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "suggestionDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "components:fromDate:", 96, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "hour");
        goto LABEL_51;
      }
      goto LABEL_80;
    case 534:
    case 535:
    case 536:
    case 537:
    case 538:
    case 539:
    case 540:
    case 541:
    case 542:
    case 543:
    case 645:
      objc_msgSend(v5, "suggestionDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "suggestionDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithBool:", objc_msgSend(v8, "isDateInWeekend:", v10));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      }
      goto LABEL_80;
    case 544:
    case 545:
    case 546:
    case 547:
    case 548:
    case 549:
    case 550:
    case 551:
    case 552:
    case 553:
    case 646:
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v5, "locationUUIDs", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v92, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v65 != v17)
              objc_enumerationMutation(v8);
            if (*(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i))
              objc_msgSend(v6, "addObject:");
          }
          v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v92, 16);
        }
        while (v16);
      }
      break;
    case 554:
    case 555:
    case 556:
    case 557:
    case 558:
    case 559:
    case 560:
    case 561:
    case 562:
    case 563:
    case 647:
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      objc_msgSend(v5, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v89;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v89 != v21)
              objc_enumerationMutation(v8);
            v23 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            objc_msgSend(v23, "peopleInPhoto");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v85;
              do
              {
                for (k = 0; k != v26; ++k)
                {
                  if (*(_QWORD *)v85 != v27)
                    objc_enumerationMutation(v24);
                  if (*(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k))
                    objc_msgSend(v6, "addObject:");
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
              }
              while (v26);
            }

          }
          v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
        }
        while (v20);
      }
      break;
    case 564:
    case 565:
    case 566:
    case 567:
    case 568:
    case 569:
    case 570:
    case 571:
    case 572:
    case 573:
    case 648:
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(v5, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v69;
        do
        {
          for (m = 0; m != v30; ++m)
          {
            if (*(_QWORD *)v69 != v31)
              objc_enumerationMutation(v8);
            v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
            objc_msgSend(v33, "contentURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v33, "contentURL");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "baseURL");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "absoluteString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "contentURL");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "absoluteString");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37)
                objc_msgSend(v6, "addObject:", v37);
              if (v39)
                objc_msgSend(v6, "addObject:", v39);

            }
          }
          v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
        }
        while (v30);
      }
      break;
    case 574:
    case 575:
    case 576:
    case 577:
    case 578:
    case 579:
    case 580:
    case 581:
    case 582:
    case 583:
    case 649:
      objc_msgSend(v5, "bundleID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
        goto LABEL_80;
      objc_msgSend(v5, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);
      break;
    case 604:
    case 605:
    case 606:
    case 607:
    case 608:
    case 609:
    case 610:
    case 611:
    case 612:
    case 613:
    case 652:
      objc_msgSend(v5, "suggestionDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_80;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "components:fromDate:", 512, v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "weekday");
LABEL_51:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
      v43 = v14;
      objc_msgSend(v14, "stringValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v44);

      break;
    case 614:
    case 615:
    case 616:
    case 617:
    case 618:
    case 619:
    case 620:
    case 621:
    case 622:
    case 623:
    case 653:
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v5, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v81;
        do
        {
          for (n = 0; n != v46; ++n)
          {
            if (*(_QWORD *)v81 != v47)
              objc_enumerationMutation(v8);
            v49 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * n);
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend(v49, "photoSceneDescriptors");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
            if (v51)
            {
              v52 = v51;
              v53 = *(_QWORD *)v77;
              do
              {
                for (ii = 0; ii != v52; ++ii)
                {
                  if (*(_QWORD *)v77 != v53)
                    objc_enumerationMutation(v50);
                  if (*(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * ii))
                    objc_msgSend(v6, "addObject:");
                }
                v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
              }
              while (v52);
            }

          }
          v46 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
        }
        while (v46);
      }
      break;
    case 634:
    case 635:
    case 636:
    case 637:
    case 638:
    case 639:
    case 640:
    case 641:
    case 642:
    case 643:
    case 655:
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend(v5, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v73;
        do
        {
          for (jj = 0; jj != v56; ++jj)
          {
            if (*(_QWORD *)v73 != v57)
              objc_enumerationMutation(v8);
            v59 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * jj);
            objc_msgSend(v59, "UTI");
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            {
              objc_msgSend(v59, "UTI");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v61);

            }
          }
          v56 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
        }
        while (v56);
      }
      break;
    default:
      goto LABEL_80;
  }

LABEL_80:
  objc_msgSend(v6, "allObjects");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

+ (id)fetchIntervalStringForFeatureName:(int)a3
{
  objc_msgSend(a1, "bucketCounttimeIntervalForFeatureName:", *(_QWORD *)&a3);
  return (id)BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalAsString();
}

+ (int)bucketCounttimeIntervalForFeatureName:(int)a3
{
  if ((a3 - 524) > 0x77)
    return 0;
  else
    return dword_1A08F95F0[a3 - 524];
}

+ (int)virtualFeatureToDurableFeatureSourceMapping:(int)a3
{
  if ((a3 - 524) > 0x83)
    return 0;
  else
    return dword_1A08F97D0[a3 - 524];
}

+ (id)computeFactorNameForFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("SortedDescending"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("SortedDescending"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("ShareEventList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("Unknown");
  }
  -[__CFString componentsSeparatedByString:](v8, "componentsSeparatedByString:", CFSTR("Photo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 2)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v10;
  }

  return v8;
}

@end
