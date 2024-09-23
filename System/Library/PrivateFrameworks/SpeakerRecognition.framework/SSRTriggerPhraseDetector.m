@implementation SSRTriggerPhraseDetector

- (SSRTriggerPhraseDetector)initWithLocale:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  SSRTriggerPhraseDetector *v8;
  void *v9;
  void *v10;
  SSRTriggerPhraseDetectorNDAPI *v11;
  void *v12;
  uint64_t v13;
  SSRTriggerPhraseDetectorNDAPI *detectorNDAPI;
  SSRTriggerPhraseDetectorQuasar *v15;
  void *v16;
  uint64_t v17;
  SSRTriggerPhraseDetectorQuasar *detectorQuasar;
  void *v19;
  void *v20;
  float v21;
  NSObject *v22;
  SSRTriggerPhraseDetector *v23;
  NSObject *v25;
  double recognizerScoreScaleFactor;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SSRTriggerPhraseDetector;
  v8 = -[SSRTriggerPhraseDetector init](&v27, sel_init);
  if (!v8)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BE284B0], "decodeConfigFrom:forFirstPassSource:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourcePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [SSRTriggerPhraseDetectorNDAPI alloc];
  objc_msgSend(v7, "keywordDetectorNDAPIConfigFilePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:](v11, "initWithConfigPath:resourcePath:phId:", v12, v10, 0);
  detectorNDAPI = v8->_detectorNDAPI;
  v8->_detectorNDAPI = (SSRTriggerPhraseDetectorNDAPI *)v13;

  if (objc_msgSend(MEMORY[0x24BE28488], "supportPremiumModel"))
  {
    if (objc_msgSend(v9, "useRecognizerCombination"))
    {
      v15 = [SSRTriggerPhraseDetectorQuasar alloc];
      objc_msgSend(v7, "keywordDetectorQuasarConfigFilePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SSRTriggerPhraseDetectorQuasar initWithLocale:configPath:resourcePath:](v15, "initWithLocale:configPath:resourcePath:", v6, v16, v10);
      detectorQuasar = v8->_detectorQuasar;
      v8->_detectorQuasar = (SSRTriggerPhraseDetectorQuasar *)v17;

      objc_msgSend(v9, "phraseConfigs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recognizerScoreScaleFactor");
      v8->_recognizerScoreScaleFactor = v21;

      v22 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEBUG))
      {
        recognizerScoreScaleFactor = v8->_recognizerScoreScaleFactor;
        *(_DWORD *)buf = 136315394;
        v29 = "-[SSRTriggerPhraseDetector initWithLocale:asset:]";
        v30 = 2048;
        v31 = recognizerScoreScaleFactor;
        _os_log_debug_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEBUG, "%s Using recognizer scale factor: %f for phrase detector", buf, 0x16u);
      }
    }
  }
  if (v8->_detectorQuasar || v8->_detectorNDAPI)
  {

LABEL_9:
    v23 = v8;
    goto LABEL_10;
  }
  v25 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[SSRTriggerPhraseDetector initWithLocale:asset:]";
    _os_log_error_impl(&dword_2117D4000, v25, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create trigger phrase detectors", buf, 0xCu);
  }

  v23 = 0;
LABEL_10:

  return v23;
}

- (void)computeTriggerConfidenceForAudio:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, float);
  id *v8;
  NSObject *v9;
  void *v10;
  id v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  SSRTriggerPhraseDetector *v34;
  uint64_t *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t *v39;
  char v40[40];
  _QWORD v41[4];
  _QWORD v42[4];
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, float))a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__2334;
  v59 = __Block_byref_object_dispose__2335;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2334;
  v53 = __Block_byref_object_dispose__2335;
  v54 = 0;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2334;
  v47 = __Block_byref_object_dispose__2335;
  v48 = 0;
  -[SSRTriggerPhraseDetectorNDAPI reset](self->_detectorNDAPI, "reset");
  -[SSRTriggerPhraseDetectorQuasar reset](self->_detectorQuasar, "reset");
  v8 = (id *)MEMORY[0x24BE284B8];
  v9 = (id)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
    v63 = 2114;
    v64 = v10;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@ for trigger word detection", buf, 0x16u);

  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0xFFFFFFFFLL;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __76__SSRTriggerPhraseDetector_computeTriggerConfidenceForAudio_withCompletion___block_invoke;
  v32[3] = &unk_24CC84EA0;
  v11 = v6;
  v35 = &v43;
  v36 = v42;
  v37 = v41;
  v38 = &v49;
  v33 = v11;
  v34 = self;
  v39 = &v55;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", v11, v40, 640, v32);
  v12 = v44[5];
  if (v12 == 0.0)
  {
    if (!self->_detectorNDAPI || v56[5])
    {
      if (!self->_detectorQuasar
        || (v14 = (void *)v50[5]) != 0
        && (objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("best_score")),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = v15 == 0,
            v15,
            !v16))
      {
        objc_msgSend((id)v50[5], "objectForKeyedSubscript:", CFSTR("best_score"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v19 = v18;

        objc_msgSend((id)v56[5], "bestScore");
        v21 = v20;
        v22 = v20 + (float)(self->_recognizerScoreScaleFactor * v19);
        v23 = *v8;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
          v63 = 2114;
          v64 = v24;
          v65 = 2050;
          v66 = v22;
          v67 = 2050;
          v68 = v21;
          v69 = 2050;
          v70 = v19;
          _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Best trigger score for %{public}@ is %{public}f (%{public}f, %{public}f)", buf, 0x34u);

        }
        if (v7)
          v7[2](v7, 0, v22);
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Quasar: missing best_score for %@"), v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *v8;
      if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
        v63 = 2114;
        v64 = v25;
        _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        if (!v7)
          goto LABEL_23;
        goto LABEL_18;
      }
      if (v7)
      {
LABEL_18:
        v27 = (void *)MEMORY[0x24BDD1540];
        v71 = *MEMORY[0x24BDD0FC8];
        v72 = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 112, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, float))v7)[2](v7, v29, -1000.0);
LABEL_22:

      }
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NDAPI: missing best_score for %@"), v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *v8;
    if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
      v63 = 2114;
      v64 = v25;
      _os_log_error_impl(&dword_2117D4000, v30, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      if (!v7)
        goto LABEL_23;
    }
    else if (!v7)
    {
      goto LABEL_23;
    }
    v31 = (void *)MEMORY[0x24BDD1540];
    v73 = *MEMORY[0x24BDD0FC8];
    v74[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 112, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, float))v7)[2](v7, v29, -1000.0);
    goto LABEL_22;
  }
  v13 = *v8;
  if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
    v63 = 2114;
    v64 = v11;
    v65 = 2114;
    v66 = v12;
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", buf, 0x20u);
    if (!v7)
      goto LABEL_24;
    goto LABEL_6;
  }
  if (v7)
LABEL_6:
    v7[2](v7, *((_QWORD *)v44 + 5), -1000.0);
LABEL_24:

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

}

- (SSRTriggerPhraseDetectorNDAPI)detectorNDAPI
{
  return self->_detectorNDAPI;
}

- (void)setDetectorNDAPI:(id)a3
{
  objc_storeStrong((id *)&self->_detectorNDAPI, a3);
}

- (SSRTriggerPhraseDetectorQuasar)detectorQuasar
{
  return self->_detectorQuasar;
}

- (void)setDetectorQuasar:(id)a3
{
  objc_storeStrong((id *)&self->_detectorQuasar, a3);
}

- (float)recognizerScoreScaleFactor
{
  return self->_recognizerScoreScaleFactor;
}

- (void)setRecognizerScoreScaleFactor:(float)a3
{
  self->_recognizerScoreScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorQuasar, 0);
  objc_storeStrong((id *)&self->_detectorNDAPI, 0);
}

void __76__SSRTriggerPhraseDetector_computeTriggerConfidenceForAudio_withCompletion___block_invoke(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  id v8;
  NSObject *v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (v8)
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v24 = a1[4];
      *(_DWORD *)buf = 136315394;
      v27 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]_block_invoke";
      v28 = 2112;
      v29 = v24;
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to read file: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }
  else if (a3)
  {
    v10 = (float)*(unint64_t *)(*(_QWORD *)(a1[8] + 8) + 24);
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = (unint64_t)(float)((float)(v10 / v11) * 1000.0);
    objc_msgSend(*(id *)(a1[5] + 24), "endAudio");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[9] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    v17 = v16 / v25;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += v17;
    objc_msgSend(*(id *)(a1[5] + 16), "analyzeWavData:numSamples:", v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[10] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    objc_msgSend(*(id *)(a1[5] + 24), "analyzeWavData:numSamples:", v15, v17);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1[9] + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
}

+ (id)filterVTAudioFiles:(id)a3 withLocale:(id)a4 withAsset:(id)a5
{
  id v7;
  id v8;
  SSRTriggerPhraseDetector *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  float v16;
  float v17;
  float v18;
  NSObject *v19;
  double v20;
  double v21;
  id v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id obj;
  id v28;
  _QWORD v29[6];
  uint64_t v30;
  float *v31;
  uint64_t v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  _BYTE v44[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v28 = a5;
  v9 = -[SSRTriggerPhraseDetector initWithLocale:asset:]([SSRTriggerPhraseDetector alloc], "initWithLocale:asset:", v8, v28);
  v25 = v7;
  v26 = v8;
  if (v9)
  {
    v10 = (void *)objc_msgSend(v7, "mutableCopy", v7, v8);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
          *(_QWORD *)v44 = 0;
          *(_QWORD *)&v44[8] = v44;
          *(_QWORD *)&v44[16] = 0x3032000000;
          v45 = __Block_byref_object_copy__2334;
          v46 = __Block_byref_object_dispose__2335;
          v47 = 0;
          v30 = 0;
          v31 = (float *)&v30;
          v32 = 0x2020000000;
          v33 = -8388608;
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __68__SSRTriggerPhraseDetector_filterVTAudioFiles_withLocale_withAsset___block_invoke;
          v29[3] = &unk_24CC85778;
          v29[4] = v44;
          v29[5] = &v30;
          -[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:](v9, "computeTriggerConfidenceForAudio:withCompletion:", v14, v29);
          if (*(_QWORD *)(*(_QWORD *)&v44[8] + 40))
          {
            v15 = (id)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "lastPathComponent");
              v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v21 = *(double *)(*(_QWORD *)&v44[8] + 40);
              *(_DWORD *)buf = 136315650;
              v39 = "+[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:]";
              v40 = 2114;
              v41 = v20;
              v42 = 2114;
              v43 = v21;
              _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s ERR: Failed in trigger processing %{public}@ with %{public}@", buf, 0x20u);

            }
            objc_msgSend(v10, "removeObject:", v14);
          }
          objc_msgSend(v28, "satVTImplicitThreshold");
          v17 = v16;
          v18 = v31[6];
          if (v18 < v16)
          {
            v19 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v39 = "+[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:]";
              v40 = 2050;
              v41 = v18;
              v42 = 2048;
              v43 = v17;
              _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s Trigger Score %{public}f not satisfied implicit VT threshold %f", buf, 0x20u);
            }
            objc_msgSend(v10, "removeObject:", v14);
          }
          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(v44, 8);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v10, "count"))
      v22 = (id)objc_msgSend(v10, "copy");
    else
      v22 = 0;

  }
  else
  {
    v23 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315650;
      *(_QWORD *)&v44[4] = "+[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:]";
      *(_WORD *)&v44[12] = 2114;
      *(_QWORD *)&v44[14] = v8;
      *(_WORD *)&v44[22] = 2114;
      v45 = (uint64_t (*)(uint64_t, uint64_t))v28;
      _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create TriggerPhraseDetector in %{public}@ with %{public}@", v44, 0x20u);
    }
    v22 = v7;
  }

  return v22;
}

void __68__SSRTriggerPhraseDetector_filterVTAudioFiles_withLocale_withAsset___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

@end
