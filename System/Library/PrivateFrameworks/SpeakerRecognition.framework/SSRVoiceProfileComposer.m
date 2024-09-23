@implementation SSRVoiceProfileComposer

- (BOOL)addUtterance:(id)a3 toProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "installedAssetOfType:forLanguage:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (os_log_t *)MEMORY[0x24BE284B8];
  v12 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[SSRVoiceProfileComposer addUtterance:toProfile:]";
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset found: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (!v10)
  {
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[SSRVoiceProfileComposer addUtterance:toProfile:]";
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework", (uint8_t *)&v16, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE28388], "defaultFallBackAssetForVoiceTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = -[SSRVoiceProfileComposer addUtterance:toProfile:withAsset:](self, "addUtterance:toProfile:withAsset:", v6, v7, v10);

  return v14;
}

- (BOOL)addUtterance:(id)a3 toProfile:(id)a4 withAsset:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  CSVoiceTriggerUserSelectedPhrase *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CSVTUIKeywordDetector *p_super;
  CSVTUITwoPassKeywordDetector *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  id v53;
  void *v54;
  void *v55;
  CSVTUIKeywordDetector *v56;
  uint64_t v57;
  uint64_t v58;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE284B0], "decodeConfigFrom:forFirstPassSource:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "useRecognizerCombination")
    && +[SSRUtils isMphVTUIKeywordDetectorSupportedPlatform](SSRUtils, "isMphVTUIKeywordDetectorSupportedPlatform"))
  {
    v11 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]([CSVoiceTriggerUserSelectedPhrase alloc], "initWithEndpointId:", 0);
    v12 = (void *)MEMORY[0x24BE28488];
    objc_msgSend(v8, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "supportsMphForLanguageCode:", v13))
      v14 = -[CSVoiceTriggerUserSelectedPhrase multiPhraseSelected](v11, "multiPhraseSelected");
    else
      v14 = 0;

    v16 = -[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]([CSVTUITwoPassKeywordDetector alloc], "initWithAsset:supportMph:", v9, v14);
    p_super = &v16->super;
  }
  else
  {
    p_super = -[CSVTUIKeywordDetector initWithAsset:]([CSVTUIKeywordDetector alloc], "initWithAsset:", v9);
  }
  v17 = objc_msgSend(v7, "length");
  if (v17 < 1)
  {
    LOBYTE(v34) = 0;
    goto LABEL_26;
  }
  v18 = v17;
  v53 = v9;
  v54 = v10;
  v55 = v8;
  v19 = 0;
  v58 = *MEMORY[0x24BE28540];
  v57 = *MEMORY[0x24BE28548];
  v20 = *MEMORY[0x24BE28580];
  v56 = p_super;
  while (1)
  {
    v21 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth", v53);
    if ((uint64_t)(v18 / (unint64_t)v21) >= 160)
      v22 = 160;
    else
      v22 = v18 / (unint64_t)v21;
    v23 = v22 * objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth");
    objc_msgSend(v7, "subdataWithRange:", v19, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSVTUIKeywordDetector analyze:](p_super, "analyze:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_17;
    v26 = (void *)objc_msgSend(v25, "mutableCopy");
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, v58);

    objc_msgSend(MEMORY[0x24BE28488], "deviceProductVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v57);

    objc_msgSend(v26, "objectForKeyedSubscript:", v20);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      objc_msgSend(v26, "objectForKeyedSubscript:", v20);
      v31 = v7;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "BOOLValue");

      v7 = v31;
      p_super = v56;

      if (v33)
        break;
    }

LABEL_17:
    v18 -= v23;
    v19 += v23;

    if (v18 <= 0)
    {
      LOBYTE(v34) = 0;
      v10 = v54;
      v8 = v55;
      v9 = v53;
      goto LABEL_26;
    }
  }
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BE285D8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedIntegerValue");
  v37 = v36 * objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth");

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BE285A8]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "unsignedIntegerValue");
  v40 = v7;
  v41 = v39 * objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth");

  objc_msgSend(v54, "preTriggerAudioTime");
  v43 = v42;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  v45 = (float)(v43 * v44) * (float)objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth");
  if (v37 >= (unint64_t)v45)
    v46 = v37 - (unint64_t)v45;
  else
    v46 = 0;
  objc_msgSend(v55, "voiceProfileAudioDirPathForSpidType:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v47);
  objc_msgSend(v55, "voiceProfileAudioDirPathForSpidType:", 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v48);
  if (v41 >= objc_msgSend(v40, "length"))
    v41 = objc_msgSend(v40, "length") - 1;
  objc_msgSend(v40, "subdataWithRange:", v46, v41 - v46 + 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = +[SSREnrollmentDataManager saveUtteranceAndMetadata:atDirectory:isExplicitEnrollment:](SSREnrollmentDataManager, "saveUtteranceAndMetadata:atDirectory:isExplicitEnrollment:", v49, v47, 1);
  objc_msgSend(v40, "subdataWithRange:", v46, objc_msgSend(v40, "length") - v46);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v50 & +[SSREnrollmentDataManager saveUtteranceAndMetadata:atDirectory:isExplicitEnrollment:](SSREnrollmentDataManager, "saveUtteranceAndMetadata:atDirectory:isExplicitEnrollment:", v51, v48, 1);
  v7 = v40;
  v10 = v54;
  v8 = v55;
  v9 = v53;
  p_super = v56;
LABEL_26:

  return v34;
}

+ (id)sharedTrainer
{
  if (sharedTrainer_onceToken != -1)
    dispatch_once(&sharedTrainer_onceToken, &__block_literal_global_2733);
  return (id)sharedTrainer_sharedTrainer;
}

void __40__SSRVoiceProfileComposer_sharedTrainer__block_invoke()
{
  SSRVoiceProfileComposer *v0;
  void *v1;

  v0 = objc_alloc_init(SSRVoiceProfileComposer);
  v1 = (void *)sharedTrainer_sharedTrainer;
  sharedTrainer_sharedTrainer = (uint64_t)v0;

}

@end
