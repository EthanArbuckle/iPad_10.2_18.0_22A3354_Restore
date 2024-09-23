@implementation LTLanguageDetectorFeatureCombinationModel

void __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t ModelFeature;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  v3 = a2;
  ModelFeature = getModelFeature(v3);
  if (ModelFeature > 0x13)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = _LTOSLogLID();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke_cold_1((uint64_t)v3, v7, v8);
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", ModelFeature);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  id v76;
  void *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  switch(objc_msgSend(a2, "integerValue"))
  {
    case 0:
      v7 = *(void **)(a1 + 40);
      if (v7)
      {
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "bestTranscription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "minConfidence");
        objc_msgSend(v8, "numberWithDouble:");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v9;
      }
      else
      {
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }

      v70 = _LTOSLogLID();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_1(v70);
      goto LABEL_98;
    case 1:
      v11 = *(void **)(a1 + 40);
      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v11, "bestTranscription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "maxConfidence");
        objc_msgSend(v12, "numberWithDouble:");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v13;
      }
      else
      {
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }

      v71 = _LTOSLogLID();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_2(v71);
      goto LABEL_98;
    case 2:
      v14 = *(void **)(a1 + 40);
      if (v14)
      {
        v15 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v14, "bestTranscription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "confidence");
        objc_msgSend(v15, "numberWithDouble:");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v16;
      }
      else
      {
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }

      v72 = _LTOSLogLID();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_3(v72);
      goto LABEL_98;
    case 3:
      if (*(_QWORD *)(a1 + 40))
      {
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 56), "bestTranscription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "minConfidence");
        objc_msgSend(v17, "numberWithDouble:");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v18;
      }
      else
      {
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }

      v73 = _LTOSLogLID();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_4(v73);
      goto LABEL_98;
    case 4:
      if (*(_QWORD *)(a1 + 40))
      {
        v19 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 56), "bestTranscription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "maxConfidence");
        objc_msgSend(v19, "numberWithDouble:");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v20;
      }
      else
      {
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }

      v74 = _LTOSLogLID();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_5(v74);
      goto LABEL_98;
    case 5:
      if (*(_QWORD *)(a1 + 40))
      {
        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 56), "bestTranscription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "confidence");
        objc_msgSend(v21, "numberWithDouble:");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v22;
      }
      else
      {
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }

      v75 = _LTOSLogLID();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_6(v75);
      goto LABEL_98;
    case 6:
      v23 = *(void **)(a1 + 32);
      v24 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 64), "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      objc_msgSend(*(id *)(a1 + 72), "sourceLocale");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getAcousticLidConfidenceFromResult:locale:", v25, v77);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
      v78 = _LTOSLogLID();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_7(v78);
      goto LABEL_110;
    case 7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "count"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v26 = _LTOSLogLID();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_8(v26, v10);
      objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v10, a3);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      if (*(_BYTE *)(v27 + 24))
        goto LABEL_111;
      v28 = objc_msgSend(*(id *)(a1 + 64), "count") != 0;
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      goto LABEL_114;
    case 8:
      v29 = *(void **)(a1 + 32);
      v30 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (v30)
      {
        objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(*(id *)(a1 + 72), "sourceLocale");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "getAcousticLidConfidenceFromResult:locale:", v31, v79);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v30)
      v80 = _LTOSLogLID();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_9(v80);
      goto LABEL_110;
    case 9:
      v32 = *(void **)(a1 + 32);
      v33 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (v33 < 2)
      {
        v34 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 72), "sourceLocale");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "getAcousticLidConfidenceFromResult:locale:", v34, v66);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v33 >= 2)
      v67 = _LTOSLogLID();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_10(v67);
      goto LABEL_110;
    case 10:
      v35 = *(void **)(a1 + 32);
      v36 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (v36 < 3)
      {
        v37 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 72), "sourceLocale");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "getAcousticLidConfidenceFromResult:locale:", v37, v68);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v36 >= 3)
      v69 = _LTOSLogLID();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_11(v69);
LABEL_110:
      objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v10, a3);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      if (*(_BYTE *)(v27 + 24))
        goto LABEL_111;
      v76 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
      goto LABEL_113;
    case 11:
      v38 = *(void **)(a1 + 80);
      if (v38 && objc_msgSend(v38, "count"))
      {
        objc_msgSend(*(id *)(a1 + 80), "lastObject");
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }
      v10 = v39;

      v60 = _LTOSLogLID();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_12(v60);
      goto LABEL_98;
    case 12:
      v40 = *(void **)(a1 + 80);
      if (v40 && objc_msgSend(v40, "count"))
      {
        objc_msgSend(*(id *)(a1 + 80), "valueForKeyPath:", CFSTR("@max.doubleValue"));
        v41 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }
      v10 = v41;

      v61 = _LTOSLogLID();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_13(v61);
      goto LABEL_98;
    case 13:
      v42 = *(void **)(a1 + 80);
      if (v42 && objc_msgSend(v42, "count"))
      {
        objc_msgSend(*(id *)(a1 + 80), "valueForKeyPath:", CFSTR("@avg.doubleValue"));
        v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }
      v10 = v43;

      v62 = _LTOSLogLID();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_14(v62);
      goto LABEL_98;
    case 14:
      v44 = *(void **)(a1 + 88);
      if (v44 && objc_msgSend(v44, "count"))
      {
        objc_msgSend(*(id *)(a1 + 88), "lastObject");
        v45 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }
      v10 = v45;

      v63 = _LTOSLogLID();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_15(v63);
      goto LABEL_98;
    case 15:
      v46 = *(void **)(a1 + 88);
      if (v46 && objc_msgSend(v46, "count"))
      {
        objc_msgSend(*(id *)(a1 + 88), "valueForKeyPath:", CFSTR("@max.doubleValue"));
        v47 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }
      v10 = v47;

      v64 = _LTOSLogLID();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_16(v64);
      goto LABEL_98;
    case 16:
      v48 = *(void **)(a1 + 88);
      if (v48 && objc_msgSend(v48, "count"))
      {
        objc_msgSend(*(id *)(a1 + 88), "valueForKeyPath:", CFSTR("@avg.doubleValue"));
        v49 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      }
      v10 = v49;

      v65 = _LTOSLogLID();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_17(v65);
LABEL_98:
      objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v10, a3);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      if (*(_BYTE *)(v27 + 24))
      {
LABEL_111:
        v28 = 1;
      }
      else
      {
        v76 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
LABEL_113:
        v28 = v10 != v76;
      }
LABEL_114:
      *(_BYTE *)(v27 + 24) = v28;
      break;
    case 17:
      v50 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(*(id *)(a1 + 72), "sourceLocale");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localeIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v52);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v53 = _LTOSLogLID();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_18(a1 + 72, v53);
      goto LABEL_51;
    case 18:
      v54 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(*(id *)(a1 + 72), "targetLocale");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localeIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", v56);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v57 = _LTOSLogLID();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_19(a1 + 72, v57);
      goto LABEL_51;
    case 19:
      objc_msgSend(*(id *)(a1 + 72), "sourceLocale");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      _LTPreferencesLanguageDetectorFeatureCombinationASRTypeIdentifierForASRDataPack(v58, *(void **)(a1 + 96));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v59 = _LTOSLogLID();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_20((uint64_t *)(a1 + 96), v59);
LABEL_51:
      objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v10, a3);
      break;
    default:
      v10 = v6;
      break;
  }

}

void __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, a2, a3, "Unknown feature in model file: %@", (uint8_t *)&v3);
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_1(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Min confidence source: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_2(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Max confidence source: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_3(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Average confidence source: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_4(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Min confidence target: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_5(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Max confidence target: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_6(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Average confidence target: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_7(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v2, v3, "Acoustic LID: %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_8(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "integerValue");
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v4, v5, "Acoustic LID count: %zd", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_9(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v2, v3, "Acoustic LID0: %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_10(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v2, v3, "Acoustic LID1: %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_11(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v2, v3, "Acoustic LID2: %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_12(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Most recent partial confidence source: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_13(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Max partial confidence source: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_14(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Average partial confidence source: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_15(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Most recent partial confidence target: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_16(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Max partial confidence target: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_17(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(v2);
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "Average partial confidence target: %f", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_18(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  float v6;
  uint64_t v7;
  uint8_t v8[24];

  v4 = OUTLINED_FUNCTION_12(a1, a2);
  objc_msgSend(v2, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v6);
  OUTLINED_FUNCTION_13(&dword_2491B9000, v4, v7, "Language %{public}@ locale identifier source: %f", v8);

  OUTLINED_FUNCTION_1_3();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_19(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  float v6;
  uint64_t v7;
  uint8_t v8[24];

  v4 = OUTLINED_FUNCTION_12(a1, a2);
  objc_msgSend(v2, "targetLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v6);
  OUTLINED_FUNCTION_13(&dword_2491B9000, v4, v7, "Language %{public}@ locale identifier source: %f", v8);

  OUTLINED_FUNCTION_1_3();
}

void __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke_cold_20(uint64_t *a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  float v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = a2;
  OUTLINED_FUNCTION_4_1();
  v7 = 138543618;
  v8 = v3;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_13(&dword_2491B9000, v2, v6, "ASR-type identifier for model version=%{public}@ -> feature: %f", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_3();
}

@end
