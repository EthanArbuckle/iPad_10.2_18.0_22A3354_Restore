@implementation SLASRFeatureExtractor

+ (id)extractASRFaturesFrom:(id)a3
{
  id v4;
  SLASRFeatures *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 *p_buf;
  uint64_t *v35;
  id v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(SLASRFeatures);
  if (v4)
  {
    objc_msgSend(v4, "recognition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "utterances");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 0xB)
      v9 = 11;
    else
      v9 = v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__209;
    v47 = __Block_byref_object_dispose__210;
    v48 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__209;
    v42 = __Block_byref_object_dispose__210;
    v43 = 0;
    objc_msgSend(v6, "utterances");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __47__SLASRFeatureExtractor_extractASRFaturesFrom___block_invoke;
    v28[3] = &unk_24D0C61C8;
    v36 = a1;
    v14 = v6;
    v29 = v14;
    v15 = v10;
    v30 = v15;
    v16 = v11;
    v31 = v16;
    v17 = v12;
    v32 = v17;
    v18 = v13;
    v37 = -8388608;
    v33 = v18;
    p_buf = &buf;
    v35 = &v38;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v28);
    -[SLASRFeatures setLatticePathMaxScores:](v5, "setLatticePathMaxScores:", v15);
    -[SLASRFeatures setLatticePathMeanScores:](v5, "setLatticePathMeanScores:", v17);
    -[SLASRFeatures setLatticePathMinScores:](v5, "setLatticePathMinScores:", v16);
    -[SLASRFeatures setLatticePathVarScores:](v5, "setLatticePathVarScores:", v18);
    -[SLASRFeatures setTopLatticePathScores:](v5, "setTopLatticePathScores:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    -[SLASRFeatures setTopLatticePathTokenCount:](v5, "setTopLatticePathTokenCount:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"));
    objc_msgSend(v4, "audioAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "snr");
    *(float *)&v20 = v20;
    -[SLASRFeatures setSnr:](v5, "setSnr:", v20);

    objc_msgSend((id)v39[5], "endTime");
    v22 = v21;
    objc_msgSend((id)v39[5], "silenceStartTime");
    v24 = v22 - v23;
    *(float *)&v24 = v24;
    -[SLASRFeatures setTrailingSilence:](v5, "setTrailingSilence:", v24);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v25 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[SLASRFeatureExtractor extractASRFaturesFrom:]";
      _os_log_error_impl(&dword_213B50000, v25, OS_LOG_TYPE_ERROR, "%s Received nil recog candidate, nothing to extract", (uint8_t *)&buf, 0xCu);
    }
  }

  return v5;
}

+ (id)_getLastTokenForPath:(id)a3 fromPhrases:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(a3, "interpretationIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v5, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "interpretations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_getTokenConfidenceForPath:(id)a3 fromPhrases:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v5, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "+[SLASRFeatureExtractor _getTokenConfidenceForPath:fromPhrases:]";
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_213B50000, v10, OS_LOG_TYPE_INFO, "%s Constructing tokens for speech path %{public}@", buf, 0x16u);

  }
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke;
  v21[3] = &unk_24D0C61F0;
  v22 = v5;
  v23 = v8;
  v13 = v8;
  v14 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke_2;
  v19[3] = &unk_24D0C6218;
  v15 = v7;
  v20 = v15;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
  v16 = v20;
  v17 = v15;

  return v17;
}

+ (id)getBestSpeechRecognitionTextFromPackage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  objc_msgSend(v31, "recognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "utterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v3;
  objc_msgSend(v3, "phrases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    v32 = v7;
    v33 = v6;
    do
    {
      objc_msgSend(v6, "interpretationIndices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 >= v11)
        break;
      objc_msgSend(v7, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "interpretationIndices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      objc_msgSend(v12, "interpretations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v15 >= v17)
      {

        v28 = &stru_24D0C6768;
        goto LABEL_19;
      }
      v35 = v12;
      objc_msgSend(v12, "interpretations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = v19;
      objc_msgSend(v19, "tokens");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            v25 = v8;
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if ((objc_msgSend(v26, "removeSpaceBefore") & 1) == 0
              && (objc_msgSend(v25, "removeSpaceAfter") & 1) == 0
              && v25)
            {
              objc_msgSend(v4, "appendString:", CFSTR(" "));
            }
            objc_msgSend(v26, "text");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendString:", v27);
            v8 = v26;

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v22);
      }

      ++v9;
      v7 = v32;
      v6 = v33;
    }
    while (v9 < objc_msgSend(v32, "count"));
  }
  v28 = (__CFString *)v4;
LABEL_19:

  return v28;
}

+ (id)extractLRNNFaturesFrom:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "+[SLASRFeatureExtractor extractLRNNFaturesFrom:]";
    _os_log_error_impl(&dword_213B50000, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

void __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "interpretationIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "interpretations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tokens");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v13);
    v12 = v13;
  }

}

void __64__SLASRFeatureExtractor__getTokenConfidenceForPath_fromPhrases___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "confidenceScore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  v5 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = objc_msgSend(v3, "confidenceScore");
    objc_msgSend(v3, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "+[SLASRFeatureExtractor _getTokenConfidenceForPath:fromPhrases:]_block_invoke_2";
    v11 = 2050;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_213B50000, v6, OS_LOG_TYPE_INFO, "%s Adding score %{public}ld for token %@", (uint8_t *)&v9, 0x20u);

  }
}

void __47__SLASRFeatureExtractor_extractASRFaturesFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  id v32;

  v32 = a2;
  v3 = *(void **)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "phrases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_getTokenConfidenceForPath:fromPhrases:", v32, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCE30];
  obj = (id)v5;
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1548], "expressionForFunction:arguments:", CFSTR("max:"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForFunction:arguments:", CFSTR("min:"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForFunction:arguments:", CFSTR("stddev:"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForFunction:arguments:", CFSTR("average:"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  objc_msgSend(v9, "expressionValueWithObject:context:", 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  objc_msgSend(v10, "expressionValueWithObject:context:", 0, 0, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
  objc_msgSend(v12, "expressionValueWithObject:context:", 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
  objc_msgSend(v11, "expressionValueWithObject:context:", 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v16, "doubleValue");
    v20 = v19;
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v18, "numberWithDouble:", v20 * v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v22);

  }
  objc_msgSend(v15, "floatValue");
  if (v23 > *(float *)(a1 + 96))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), obj);
    v24 = *(void **)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "phrases");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_getLastTokenForPath:fromPhrases:", v32, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
}

@end
