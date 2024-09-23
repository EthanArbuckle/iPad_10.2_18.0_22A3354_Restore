@implementation VATSpeechRecognizer

- (VATSpeechRecognizer)initWithLanguage:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  VATSpeechRecognizer *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)qword_25791D5E0;
  v22 = qword_25791D5E0;
  if (!qword_25791D5E0)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = sub_24A203394;
    v17 = &unk_251B9F6B8;
    v18 = &v19;
    sub_24A203394((uint64_t)&v14);
    v5 = (void *)v20[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithLanguage:assetType:", v4, 3);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)qword_25791D5F0;
  v22 = qword_25791D5F0;
  if (!qword_25791D5F0)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = sub_24A203400;
    v17 = &unk_251B9F6B8;
    v18 = &v19;
    sub_24A203400((uint64_t)&v14);
    v8 = (void *)v20[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v9, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "installedAssetWithConfig:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VATSpeechRecognizer initWithAssetPath:language:](self, "initWithAssetPath:language:", v11, v4);
  return v12;
}

- (VATSpeechRecognizer)initWithAssetPath:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  FILE *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  VATSpeechRecognizer *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE buf[24];
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("mini.json"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if ((v10 & 1) != 0)
    {
      v11 = (FILE *)*MEMORY[0x24BDAC8D8];
      v12 = objc_retainAutorelease(v8);
      fprintf(v11, "second pass: %s\n", (const char *)objc_msgSend(v12, "UTF8String"));
      v25 = 0;
      v26 = &v25;
      v27 = 0x2050000000;
      v13 = (void *)qword_25791D5F8;
      v28 = qword_25791D5F8;
      if (!qword_25791D5F8)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_24A203328;
        v30 = &unk_251B9F6B8;
        v31 = &v25;
        sub_24A203328((uint64_t)buf);
        v13 = (void *)v26[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v25, 8);
      v15 = (void *)objc_msgSend([v14 alloc], "initWithConfig:", v12);
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "version");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "language");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _VATLoggingFacility(kVATLogCategoryFramework);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          _os_log_impl(&dword_24A12D000, v19, OS_LOG_TYPE_INFO, "Datapack = %@/%@", buf, 0x16u);
        }

      }
      else
      {
        v18 = 0;
        v17 = 0;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v6, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[VATSpeechRecognizer initWithModelURL:language:modelVersion:](self, "initWithModelURL:language:modelVersion:", v22, v23, v17);

      v20 = self;
    }
    else
    {
      _VATLoggingFacility(kVATLogCategoryFramework);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_error_impl(&dword_24A12D000, v21, OS_LOG_TYPE_ERROR, "Missing file or cannot read: %@", buf, 0xCu);
      }

      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Missing file or cannot read: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (VATSpeechRecognizer)initWithModelURL:(id)a3 language:(id)a4 modelVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  VATSpeechRecognizer *v12;
  VATSpeechRecognizer *v13;
  NSString *task;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *recognitionQueue;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _EARSpeechRecognizer *recognizer;
  VATSpeechRecognizer *v39;
  uint64_t v41;
  objc_super v42;
  uint8_t buf[8];
  uint64_t v44;
  Class (*v45)(uint64_t);
  void *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)VATSpeechRecognizer;
  v12 = -[VATSpeechRecognizer init](&v42, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_17;
  v12->_sampleRate = 16000;
  task = v12->_task;
  v12->_task = (NSString *)CFSTR("Dictation");

  objc_storeStrong((id *)&v13->_modelURL, a3);
  objc_storeStrong((id *)&v13->_modelVersion, a5);
  objc_storeStrong((id *)&v13->_language, a4);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create("com.apple.mind.voiceactions", v15);
  recognitionQueue = v13->_recognitionQueue;
  v13->_recognitionQueue = (OS_dispatch_queue *)v16;

  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("mini.json"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x2050000000;
  v19 = (void *)qword_25791D608;
  v51 = qword_25791D608;
  if (!qword_25791D608)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v44 = 3221225472;
    v45 = sub_24A2031E4;
    v46 = &unk_251B9F6B8;
    v47 = &v48;
    sub_24A2031E4((uint64_t)buf);
    v19 = (void *)v49[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v48, 8);
  v21 = (void *)objc_opt_class();
  objc_msgSend(v18, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "supportedByQuasarConfig:", v22);

  _VATLoggingFacility(kVATLogCategoryFramework);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
  if (v23)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      v26 = "Initializing recognition with Quasar formatter";
LABEL_9:
      _os_log_impl(&dword_24A12D000, v24, OS_LOG_TYPE_INFO, v26, buf, 2u);
    }
  }
  else if (v25)
  {
    *(_WORD *)buf = 0;
    v26 = "Initializing recognition with config based formatter";
    goto LABEL_9;
  }

  v48 = 0;
  v49 = &v48;
  v50 = 0x2050000000;
  v27 = (void *)qword_25791D610;
  v51 = qword_25791D610;
  if (!qword_25791D610)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v44 = 3221225472;
    v45 = sub_24A203250;
    v46 = &unk_251B9F6B8;
    v47 = &v48;
    sub_24A203250((uint64_t)buf);
    v27 = (void *)v49[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v48, 8);
  v29 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_251BACAC8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSamplingRateFilter:", v30);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("Dictation"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTaskTypeFilter:", v31);

  if (!v13->_recognizer)
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x2050000000;
    v32 = (void *)qword_25791D618;
    v51 = qword_25791D618;
    if (!qword_25791D618)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v44 = 3221225472;
      v45 = sub_24A2032BC;
      v46 = &unk_251B9F6B8;
      v47 = &v48;
      sub_24A2032BC((uint64_t)buf);
      v32 = (void *)v49[3];
    }
    v33 = objc_retainAutorelease(v32);
    _Block_object_dispose(&v48, 8);
    v34 = [v33 alloc];
    objc_msgSend(v18, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = 0;
    v37 = objc_msgSend(v34, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:", v35, 0, 0, v36, v29, &unk_251BACB10, v41);
    recognizer = v13->_recognizer;
    v13->_recognizer = (_EARSpeechRecognizer *)v37;

    -[_EARSpeechRecognizer setHighPriority:](v13->_recognizer, "setHighPriority:", 1);
    -[_EARSpeechRecognizer setRecognitionReplacements:](v13->_recognizer, "setRecognitionReplacements:", &unk_251BACB38);
  }
  v39 = v13;

LABEL_17:
  return v13;
}

- (void)startRecognitionWithAutoStop:(BOOL)a3 resultHandler:(id)a4
{
  id v6;
  NSObject *recognitionQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_24A2030FC;
  v9[3] = &unk_251B9F5F0;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_async(recognitionQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)startRecognitionWithAutoStop:(BOOL)a3 pcmBuffer:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *recognitionQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  VATSpeechRecognizer *v15;
  id v16;
  id v17;
  BOOL v18;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_24A202EF8;
  v13[3] = &unk_251B9F618;
  objc_copyWeak(&v17, &location);
  v15 = self;
  v16 = v9;
  v18 = a3;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(recognitionQueue, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  NSObject *recognitionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24A202E94;
  block[3] = &unk_251B9F640;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(recognitionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)endAudio
{
  NSObject *recognitionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_24A202E50;
  v4[3] = &unk_251B9F668;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelRecognition
{
  NSObject *recognitionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_24A202DFC;
  v4[3] = &unk_251B9F668;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)triggerServerSideEndPointer
{
  NSObject *recognitionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_24A202DCC;
  v4[3] = &unk_251B9F668;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_recognizedResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  id recognitionHandler;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  double v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recognitionQueue);
  -[VATSpeechRecognizer recognitionHandler](self, "recognitionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VATSpeechRecognizer recognitionHandler](self, "recognitionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[VATSpeechRecognizer audioDataWithInjectedSilence](self, "audioDataWithInjectedSilence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, id))v9)[2](v9, v6, v10, v7);

    if (v7)
    {
LABEL_3:
      self->finalResultTime = (double)mach_absolute_time();
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v6, "transcriptions", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "formattedString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v11, "addObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v14);
      }

      if (self->endAudioTime > 0.0)
      {
        _VATLoggingFacility(kVATLogCategoryFramework);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          if (v7)
            objc_msgSend(v7, "description");
          else
            -[NSObject componentsJoinedByString:](v11, "componentsJoinedByString:", CFSTR(","));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (unint64_t)(self->finalResultTime - self->endAudioTime);
          if (qword_25791D630 != -1)
            dispatch_once(&qword_25791D630, &unk_251B9F708);
          *(_DWORD *)buf = 138412546;
          v31 = *(double *)&v20;
          v32 = 2048;
          v33 = *(double *)&qword_25791D620 * (double)v21;
          _os_log_impl(&dword_24A12D000, v18, OS_LOG_TYPE_INFO, "End audio to final \"%@\" = %lf", buf, 0x16u);

        }
      }
      _VATLoggingFacility(kVATLogCategoryFramework);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        if (v7)
          objc_msgSend(v7, "description");
        else
          -[NSObject componentsJoinedByString:](v11, "componentsJoinedByString:", CFSTR(","));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (unint64_t)(self->finalResultTime - self->firstSampleTime);
        if (qword_25791D630 != -1)
          dispatch_once(&qword_25791D630, &unk_251B9F708);
        *(_DWORD *)buf = 138412546;
        v31 = *(double *)&v23;
        v32 = 2048;
        v33 = *(double *)&qword_25791D620 * (double)v24;
        _os_log_impl(&dword_24A12D000, v22, OS_LOG_TYPE_INFO, "First audio to final \"%@\" = %lf", buf, 0x16u);

      }
      self->firstSampleTime = 0.0;
      self->firstPartialTime = 0.0;
      recognitionHandler = self->_recognitionHandler;
      self->_recognitionHandler = 0;

LABEL_35:
      goto LABEL_36;
    }
    if (v6)
    {
      if (objc_msgSend(v6, "isFinal"))
        goto LABEL_3;
      if ((objc_msgSend(v6, "isFinal") & 1) == 0 && self->firstPartialTime == 0.0)
      {
        self->firstPartialTime = (double)mach_absolute_time();
        _VATLoggingFacility(kVATLogCategoryFramework);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v19 = (unint64_t)(self->firstPartialTime - self->firstSampleTime);
          if (qword_25791D630 != -1)
            dispatch_once(&qword_25791D630, &unk_251B9F708);
          *(_DWORD *)buf = 134217984;
          v31 = *(double *)&qword_25791D620 * (double)v19;
          _os_log_impl(&dword_24A12D000, v11, OS_LOG_TYPE_INFO, "First audio to first partial = %lf", buf, 0xCu);
        }
        goto LABEL_35;
      }
    }
  }
LABEL_36:

}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v5;
  NSObject *recognitionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  VATSpeechRecognizer *v10;
  id v11;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_24A202BFC;
  v8[3] = &unk_251B9F690;
  objc_copyWeak(&v11, &location);
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v5;
  NSObject *recognitionQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_24A202B4C;
  v8[3] = &unk_251B9F690;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5;
  NSObject *recognitionQueue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24A202754;
  block[3] = &unk_251B9F640;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(recognitionQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSLocale)language
{
  return self->_language;
}

- (id)recognitionHandler
{
  return self->_recognitionHandler;
}

- (void)setRecognitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)audioDataWithInjectedSilence
{
  return self->_audioDataWithInjectedSilence;
}

- (void)setAudioDataWithInjectedSilence:(id)a3
{
  objc_storeStrong((id *)&self->_audioDataWithInjectedSilence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDataWithInjectedSilence, 0);
  objc_storeStrong(&self->_recognitionHandler, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_finalResult, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end
