@implementation VATKeywordSpotter

- (id)_handleSecondPass:(id)a3 expectedKeyword:(id)a4 duration:(double *)a5 secondPassAudio:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  NSObject *v16;
  id v17;
  dispatch_time_t v18;
  NSObject *v19;
  id v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  void *v26;
  FILE *v27;
  id v28;
  id v30;
  _QWORD v32[4];
  NSObject *v33;
  VATKeywordSpotter *v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v30 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_24A2044A4;
  v41 = sub_24A2044B4;
  v42 = 0;
  -[VATKeywordSpotter recognizer](self, "recognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = dispatch_semaphore_create(0);
    v13 = mach_absolute_time();
    if (qword_25791D650 != -1)
      dispatch_once(&qword_25791D650, &unk_251B9F748);
    v14 = *(double *)&qword_25791D640;
    -[VATKeywordSpotter recognizer](self, "recognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_24A2044BC;
    v32[3] = &unk_251B9F770;
    v36 = &v37;
    v16 = v12;
    v33 = v16;
    v34 = self;
    v17 = v10;
    v35 = v17;
    objc_msgSend(v15, "startRecognitionWithAutoStop:pcmBuffer:resultHandler:", 1, v9, v32);

    v18 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v16, v18))
    {
      _VATLoggingFacility(kVATLogCategoryFramework);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_24A12D000, v19, OS_LOG_TYPE_ERROR, "2nd pass Timed out", buf, 2u);
      }

      fwrite("2nd pass timed out in 3 secs\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      -[VATKeywordSpotter recognizer](self, "recognizer");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 3.0;
      objc_msgSend(v20, "cancelRecognition");
    }
    else
    {
      -[VATKeywordSpotter recognizer](self, "recognizer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endAudio");

      v23 = mach_absolute_time();
      v24 = v14 * (double)v13;
      if (qword_25791D650 != -1)
        dispatch_once(&qword_25791D650, &unk_251B9F748);
      v21 = *(double *)&qword_25791D640 * (double)v23 - v24;
      _VATLoggingFacility(kVATLogCategoryFramework);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v26;
        v45 = 2048;
        v46 = v21;
        _os_log_impl(&dword_24A12D000, v25, OS_LOG_TYPE_INFO, "Got 2nd pass \"%@\" in %5.3f secs!", buf, 0x16u);

      }
      v27 = (FILE *)*MEMORY[0x24BDAC8D8];
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v27, "Got 2nd pass \"%s\" in %5.3f secs!\n", (const char *)objc_msgSend(v20, "UTF8String"), v21);
    }

  }
  else
  {
    v21 = 0.0;
  }
  *a6 = (id)objc_msgSend((id)v38[5], "copy");
  *a5 = v21;
  v28 = v10;
  _Block_object_dispose(&v37, 8);

  return v28;
}

- (BOOL)isValidRecognizer
{
  void *v2;
  BOOL v3;

  -[VATKeywordSpotter recognizer](self, "recognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)audioDebuggingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[VATKeywordSpotter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "audioDebug");

  return v4;
}

- (void)setAudioDebuggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioDebug:", v3);

}

- (BOOL)batchDecodeEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[VATKeywordSpotter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "batchDecode");

  return v4;
}

- (void)setBatchDecodeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBatchDecode:", v3);

}

- (void)setSecondPassEnabled:(BOOL)a3 customAssetPath:(id)a4
{
  -[VATKeywordSpotter setCustomSecondPassModelPath:](self, "setCustomSecondPassModelPath:", a4);
  MEMORY[0x24BEDD108](self, sel_setSecondPassEnabled_);
}

- (NSString)customSecondPassModelPath
{
  return (NSString *)objc_getAssociatedObject(self, &off_2579138A0);
}

- (void)setCustomSecondPassModelPath:(id)a3
{
  objc_setAssociatedObject(self, &off_2579138A0, a3, (void *)1);
}

- (VATConfiguration)configuration
{
  return (VATConfiguration *)objc_getAssociatedObject(self, off_257913890);
}

- (void)setConfiguration:(id)a3
{
  objc_setAssociatedObject(self, off_257913890, a3, (void *)1);
}

- (VATSpeechRecognizer)recognizer
{
  return (VATSpeechRecognizer *)objc_getAssociatedObject(self, off_257913898);
}

- (void)setRecognizer:(id)a3
{
  objc_setAssociatedObject(self, off_257913898, a3, (void *)1);
}

- (BOOL)secondPassEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[VATKeywordSpotter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secondPass");

  return v4;
}

- (void)setSecondPassEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  VATSpeechRecognizer *v13;
  void *v14;
  VATSpeechRecognizer *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  FILE *v20;
  id v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "secondPass");

  if (v7 != v3)
  {
    -[VATKeywordSpotter configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "runtime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSecondPass:", v3);

    if (v3)
    {
      -[VATKeywordSpotter customSecondPassModelPath](self, "customSecondPassModelPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _VATLoggingFacility(kVATLogCategoryFramework);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v10)
      {
        if (v12)
        {
          -[VATKeywordSpotter customSecondPassModelPath](self, "customSecondPassModelPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v22;
          _os_log_error_impl(&dword_24A12D000, v11, OS_LOG_TYPE_ERROR, "creating EARRecognizer from custom path \"%@\", buf, 0xCu);

        }
        v13 = [VATSpeechRecognizer alloc];
        -[VATKeywordSpotter customSecondPassModelPath](self, "customSecondPassModelPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[VATSpeechRecognizer initWithAssetPath:language:](v13, "initWithAssetPath:language:", v14, CFSTR("en-US"));

      }
      else
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_24A12D000, v11, OS_LOG_TYPE_ERROR, "creating EARRecognizer", buf, 2u);
        }

        v15 = -[VATSpeechRecognizer initWithLanguage:]([VATSpeechRecognizer alloc], "initWithLanguage:", CFSTR("en-US"));
      }
      -[VATKeywordSpotter setRecognizer:](self, "setRecognizer:", v15);
      -[VATKeywordSpotter recognizer](self, "recognizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[VATKeywordSpotter customSecondPassModelPath](self, "customSecondPassModelPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        _VATLoggingFacility(kVATLogCategoryFramework);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if (v17)
        {
          if (v19)
          {
            -[VATKeywordSpotter customSecondPassModelPath](self, "customSecondPassModelPath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v25 = v23;
            _os_log_error_impl(&dword_24A12D000, v18, OS_LOG_TYPE_ERROR, "Error creating EARRecognizer from \"%@\", buf, 0xCu);

          }
          v20 = (FILE *)*MEMORY[0x24BDAC8D8];
          -[VATKeywordSpotter customSecondPassModelPath](self, "customSecondPassModelPath");
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          fprintf(v20, "Error creating recognizer from \"%s\"\n", (const char *)objc_msgSend(v21, "UTF8String"));

        }
        else
        {
          if (v19)
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_24A12D000, v18, OS_LOG_TYPE_ERROR, "Error creating EARRecognizer", buf, 2u);
          }

          fwrite("Error creating recognizer\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        }
      }

    }
    else
    {
      -[VATKeywordSpotter setRecognizer:](self, "setRecognizer:", 0);
    }
  }
}

- (void)_categoryDealloc
{
  void *v3;

  -[VATKeywordSpotter recognizer](self, "recognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[VATKeywordSpotter setRecognizer:](self, "setRecognizer:", 0);
}

- (void)dealloc
{
  void *floatFstDecoder;
  objc_super v4;

  floatFstDecoder = self->_floatFstDecoder;
  if (floatFstDecoder)
    (*(void (**)(void *, SEL))(*(_QWORD *)floatFstDecoder + 8))(floatFstDecoder, a2);
  -[VATKeywordSpotter _categoryDealloc](self, "_categoryDealloc");
  v4.receiver = self;
  v4.super_class = (Class)VATKeywordSpotter;
  -[VATKeywordSpotter dealloc](&v4, sel_dealloc);
}

- (VATKeywordSpotter)initWithConfig:(id)a3 keywordsWithPhonemes:(id)a4 delegate:(id)a5 silenceLookback:(int)a6 silenceExpect:(int)a7 batchDecode:(BOOL)a8 enableAudioDebugging:(BOOL)a9
{
  _BOOL8 v9;
  VATKeywordSpotter *v12;
  VATKeywordSpotter *v13;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a8;
  v12 = -[VATKeywordSpotter initWithConfig:keywordsWithPhonemes:delegate:](self, "initWithConfig:keywordsWithPhonemes:delegate:", a3, a4, a5);
  v13 = v12;
  v15 = a6 > 0 && a7 > 0;
  if (v15)
  {
    -[VATKeywordSpotter configuration](v12, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "decoder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preKeywordSilence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLookbackFrames:", a6);

    -[VATKeywordSpotter configuration](v13, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "decoder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preKeywordSilence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMinSilenceInLookbackFrames:", a7);

  }
  -[VATKeywordSpotter setPreKeywordSilenceCheckEnabled:](v13, "setPreKeywordSilenceCheckEnabled:", v15);
  -[VATKeywordSpotter setAudioDebuggingEnabled:](v13, "setAudioDebuggingEnabled:", a9);
  -[VATKeywordSpotter setBatchDecodeEnabled:](v13, "setBatchDecodeEnabled:", v9);

  return v13;
}

- (id)init:(id)a3 delegate:(id)a4 silenceLookback:(int)a5 silenceExpect:(int)a6 batchDecode:(BOOL)a7 enableAudioDebugging:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[VATKeywordSpotter initWithConfig:keywordsWithPhonemes:delegate:silenceLookback:silenceExpect:batchDecode:enableAudioDebugging:](self, "initWithConfig:keywordsWithPhonemes:delegate:silenceLookback:silenceExpect:batchDecode:enableAudioDebugging:", 0, a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, v9);
}

- (VATKeywordSpotter)initWithKeywords:(id)a3 delegate:(id)a4
{
  return (VATKeywordSpotter *)MEMORY[0x24BEDD108](self, sel_initWithConfig_keywords_delegate_);
}

- (VATKeywordSpotter)initWithKeywordsWithPhonemes:(id)a3 delegate:(id)a4
{
  return -[VATKeywordSpotter initWithConfig:keywordsWithPhonemes:delegate:](self, "initWithConfig:keywordsWithPhonemes:delegate:", 0, a3, a4);
}

- (void)updateWithKeywords:(id)a3
{
  id v4;
  G2PFactoredObjc *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(G2PFactoredObjc);
  -[G2PFactoredObjc setup](v5, "setup");
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        -[G2PFactoredObjc getPhrasePronounciationWithPhrase:wordSep:prefixWithPhrase:](v5, "getPhrasePronounciationWithPhrase:wordSep:prefixWithPhrase:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), CFSTR("<w>"), 1, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[VATKeywordSpotter updateWithKeywordsWithPhonemes:](self, "updateWithKeywordsWithPhonemes:", v6);
}

- (void)updateWithKeywordsWithPhonemes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  char *v9;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 *v17;
  uint64_t floatFstDecoder;
  void *v19;
  void **v20;
  id v21;
  VATKeywordSpotter *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26[5];
  void *__p[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  char *v34;
  unint64_t v35;
  void **v36[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v22 = self;
  -[VATKeywordSpotter stop](self, "stop");
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v21;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i));
        sub_24A20E380(__p, (char *)objc_msgSend(v8, "UTF8String"));
        v9 = v34;
        if ((unint64_t)v34 >= v35)
        {
          v11 = 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 3);
          v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
            sub_24A20A098();
          if (0x5555555555555556 * ((uint64_t)(v35 - (_QWORD)v33) >> 3) > v12)
            v12 = 0x5555555555555556 * ((uint64_t)(v35 - (_QWORD)v33) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v35 - (_QWORD)v33) >> 3) >= 0x555555555555555)
            v13 = 0xAAAAAAAAAAAAAAALL;
          else
            v13 = v12;
          v36[4] = (void **)&v35;
          if (v13)
            v13 = (unint64_t)sub_24A20E42C(v13);
          else
            v14 = 0;
          v15 = v13 + 24 * v11;
          v36[0] = (void **)v13;
          v36[1] = (void **)v15;
          v36[3] = (void **)(v13 + 24 * v14);
          v16 = *(_OWORD *)__p;
          *(_QWORD *)(v15 + 16) = v28;
          *(_OWORD *)v15 = v16;
          __p[1] = 0;
          v28 = 0;
          __p[0] = 0;
          v36[2] = (void **)(v15 + 24);
          sub_24A20E470((uint64_t *)&v33, v36);
          v17 = (__int128 *)v34;
          sub_24A20E4F4((uint64_t)v36);
          v34 = (char *)v17;
          if (SHIBYTE(v28) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v10 = *(_OWORD *)__p;
          *((_QWORD *)v34 + 2) = v28;
          *(_OWORD *)v9 = v10;
          v34 = v9 + 24;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v5);
  }

  floatFstDecoder = (uint64_t)v22->_floatFstDecoder;
  v24 = 0;
  v25 = 0;
  v23 = 0;
  sub_24A20E554((char *)&v23, (__int128 *)v33, (__int128 *)v34, 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 3));
  sub_24A20E5D8((uint64_t)v26, floatFstDecoder, v23, v24);
  sub_24A20A008((void **)v26[2]);
  v19 = v26[0];
  v26[0] = 0;
  if (v19)
    operator delete(v19);
  v36[0] = (void **)&v23;
  sub_24A20E240(v36);
  v20 = (void **)v22->_floatFstDecoder;
  sub_24A20FFEC(v20 + 23, (int)(-1431655765 * ((unint64_t)((_BYTE *)v20[11] - (_BYTE *)v20[10]) >> 3)));
  sub_24A20BAF0(v20);
  sub_24A20BAF0((_QWORD *)v22->_floatFstDecoder);
  -[VATKeywordSpotter start](v22, "start");
  v36[0] = (void **)&v33;
  sub_24A20E240(v36);

}

- (VATKeywordSpotter)initWithConfig:(id)a3 keywords:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  G2PFactoredObjc *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  VATKeywordSpotter *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(G2PFactoredObjc);
  -[G2PFactoredObjc setup](v10, "setup", v8);
  v11 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        -[G2PFactoredObjc getPhrasePronounciationWithPhrase:wordSep:prefixWithPhrase:](v10, "getPhrasePronounciationWithPhrase:wordSep:prefixWithPhrase:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), CFSTR("<w>"), 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = -[VATKeywordSpotter initWithConfig:keywordsWithPhonemes:delegate:](self, "initWithConfig:keywordsWithPhonemes:delegate:", v7, v11, v9);
  return v17;
}

- (VATKeywordSpotter)initWithConfig:(id)a3 keywordsWithPhonemes:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  VATKeywordSpotter *v11;
  VATConfiguration *v12;
  id v13;
  FeatureExtractObjc *v14;
  FeatureExtractObjc *fe;
  FeatureExtractObjc *v16;
  VATKeywordSpotter *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t, uint64_t);
  void *v26;
  id v27;
  id v28;
  objc_super v29;
  _BYTE location[12];
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VATKeywordSpotter;
  v11 = -[VATKeywordSpotter init](&v29, sel_init);
  if (!v11)
    goto LABEL_5;
  v28 = 0;
  v12 = -[VATConfiguration initWithFilename:error:]([VATConfiguration alloc], "initWithFilename:error:", v8, &v28);
  v13 = v28;
  if (!v12)
  {
    _VATLoggingFacility((uint64_t)"VATKeywordSpotter");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v17 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v8;
    v31 = 2112;
    v32 = v13;
    v19 = "Failed to load config from %@: %@";
    v20 = v18;
    v21 = 22;
LABEL_12:
    _os_log_error_impl(&dword_24A12D000, v20, OS_LOG_TYPE_ERROR, v19, location, v21);
    goto LABEL_9;
  }
  -[VATKeywordSpotter setConfiguration:](v11, "setConfiguration:", v12);
  v14 = -[FeatureExtractObjc initWithConfig:]([FeatureExtractObjc alloc], "initWithConfig:", v12);
  fe = v11->fe;
  v11->fe = v14;

  if (!v11->fe)
  {
    _VATLoggingFacility((uint64_t)"VATKeywordSpotter");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)location = 0;
    v19 = "Failed to create frontend or AM neural net";
    v20 = v18;
    v21 = 2;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v11->_delegate, a5);
  objc_storeStrong((id *)&v11->_keywordsWithPhonemes, a4);
  -[VATKeywordSpotter _initializeDecoderForKeywordsWithPhonemes:](v11, "_initializeDecoderForKeywordsWithPhonemes:", v9);
  objc_initWeak((id *)location, v11);
  v16 = v11->fe;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = sub_24A214398;
  v26 = &unk_251B9F798;
  objc_copyWeak(&v27, (id *)location);
  -[FeatureExtractObjc addCallbackForAcousticModelOutputAvailableWithCallback:](v16, "addCallbackForAcousticModelOutputAvailableWithCallback:", &v23);
  -[VATKeywordSpotter start](v11, "start", v23, v24, v25, v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)location);

LABEL_5:
  v17 = v11;
LABEL_10:

  return v17;
}

- (void)start
{
  NSString *filePath;
  dispatch_semaphore_t v4;
  FeatureExtractObjc *fe;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;

  filePath = self->_filePath;
  self->_filePath = 0;

  self->_fileByteCount = 0;
  self->_fileCurrentDuration = 0.0;
  if (!self->_isRunning)
  {
    v4 = dispatch_semaphore_create(0);
    fe = self->fe;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_24A214390;
    v7[3] = &unk_251B9F7C0;
    v8 = v4;
    v6 = v4;
    -[FeatureExtractObjc startWithCompletionHandlerWithCompletionHandler:](fe, "startWithCompletionHandlerWithCompletionHandler:", v7);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    self->_isRunning = 1;

  }
}

- (void)setStreamingMode:(BOOL)a3
{
  FeatureExtractObjc *fe;
  NSObject *v4;
  uint8_t v5[16];

  fe = self->fe;
  if (fe)
  {
    MEMORY[0x24BEDD108](fe, sel_setStreamingModeWithStreaming_);
  }
  else
  {
    _VATLoggingFacility(kVATLogCategoryFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_24A12D000, v4, OS_LOG_TYPE_INFO, "VATKeywordSpotter setStreamingMode ignored due to fe being null", v5, 2u);
    }

  }
}

- (void)addAudioSamples:(const void *)a3 count:(int)a4
{
  MEMORY[0x24BEDD108](self, sel_addAudioSamples_count_isFloat_);
}

- (void)addAudioSamples:(const void *)a3 length:(int)a4
{
  MEMORY[0x24BEDD108](self, sel_addAudioSamples_count_isFloat_);
}

- (void)addAudioSamples:(const void *)a3 count:(int)a4 isFloat:(BOOL)a5
{
  FeatureExtractObjc *fe;

  fe = self->fe;
  if (a5)
    MEMORY[0x24BEDD108](fe, sel_addFloatSamples_count_);
  else
    MEMORY[0x24BEDD108](fe, sel_addSamples_count_);
}

- (void)addAudioSamples:(const void *)a3 count:(int)a4 isFloat:(BOOL)a5 filePath:(id)a6 byteCount:(int64_t)a7 currentDuration:(double)a8
{
  objc_storeStrong((id *)&self->_filePath, a6);
  self->_fileCurrentDuration = a8;
  self->_fileByteCount += a7;
  MEMORY[0x24BEDD108](self, sel_addAudioSamples_count_isFloat_);
}

- (void)stop
{
  dispatch_semaphore_t v3;
  FeatureExtractObjc *fe;
  NSObject *v5;
  _QWORD *floatFstDecoder;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char **v19;
  uint64_t v20;
  char **v21;
  char *v22;
  uint64_t *v23;
  char *v24;
  __n128 v25;
  uint64_t *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  VATKeywordSpotter *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  _QWORD v37[5];
  NSObject *v38;
  __n128 v39[2];

  if (self->_isRunning)
  {
    v3 = dispatch_semaphore_create(0);
    fe = self->fe;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = sub_24A212C28;
    v37[3] = &unk_251B9F7E8;
    v37[4] = self;
    v5 = v3;
    v38 = v5;
    -[FeatureExtractObjc stopWithCompletionHandlerWithCompletionHandler:](fe, "stopWithCompletionHandlerWithCompletionHandler:", v37);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    self->_isRunning = 0;
    self->_processedFrameCount = 0;
    floatFstDecoder = self->_floatFstDecoder;
    sub_24A20BAF0(floatFstDecoder);
    floatFstDecoder[8] = 0;
    v7 = floatFstDecoder[5];
    v9 = floatFstDecoder[2];
    v8 = floatFstDecoder[3];
    v10 = (char **)(v9 + 8 * (v7 >> 10));
    if (v8 == v9)
    {
      v11 = 0;
      v14 = 0;
      v12 = floatFstDecoder[6];
      v13 = (char *)(v9 + 8 * ((v12 + v7) >> 10));
    }
    else
    {
      v11 = (uint64_t)&(*v10)[4 * (floatFstDecoder[5] & 0x3FFLL)];
      v12 = floatFstDecoder[6];
      v13 = (char *)(v9 + 8 * ((v12 + v7) >> 10));
      v14 = *(_QWORD *)v13 + 4 * ((v12 + v7) & 0x3FF);
    }
    if (v14 == v11)
      v15 = 0;
    else
      v15 = ((v14 - *(_QWORD *)v13) >> 2) + ((v13 - (char *)v10) << 7) - ((v11 - (uint64_t)*v10) >> 2);
    if (v8 == v9)
      v16 = 0;
    else
      v16 = &(*v10)[4 * (floatFstDecoder[5] & 0x3FFLL)];
    v35 = floatFstDecoder[3];
    v36 = v5;
    v34 = floatFstDecoder[5];
    v17 = v12;
    if (v16 == (char *)v11)
      v18 = 0;
    else
      v18 = ((v11 - (uint64_t)*v10) >> 2) - ((v16 - *v10) >> 2);
    v19 = (char **)sub_24A20B048((_QWORD *)(v9 + 8 * (v7 >> 10)), (uint64_t)v16, v18);
    if (v15 >= 1)
    {
      v21 = v19;
      v22 = (char *)v20;
      v33 = self;
      v23 = sub_24A20B048(v19, v20, v15);
      if (v18 <= (unint64_t)(v17 - v15) >> 1)
      {
        sub_24A20B224(v39, v10, v16, v21, v22, v23, v24);
        v28 = floatFstDecoder[6] - v15;
        floatFstDecoder[5] += v15;
        floatFstDecoder[6] = v28;
        while (sub_24A20AFF4((uint64_t)(floatFstDecoder + 1)))
          ;
      }
      else
      {
        v25.n128_u64[0] = (unint64_t)v21;
        v25.n128_u64[1] = (unint64_t)v22;
        v26 = (uint64_t *)(v9 + 8 * ((unint64_t)(v34 + v17) >> 10));
        if (v35 == v9)
          v27 = 0;
        else
          v27 = (_BYTE *)(*v26 + 4 * (((_WORD)v34 + (_WORD)v17) & 0x3FF));
        v39[0] = v25;
        sub_24A20B09C(v23, v24, v26, v27, (uint64_t)v39);
        v29 = floatFstDecoder[6] - v15;
        floatFstDecoder[6] = v29;
        v30 = floatFstDecoder[3];
        while (1)
        {
          v31 = floatFstDecoder[2];
          v32 = v30 == v31 ? 0 : ((v30 - v31) << 7) - 1;
          if ((unint64_t)(v32 - (v29 + floatFstDecoder[5])) < 0x800)
            break;
          operator delete(*(void **)(v30 - 8));
          v30 = floatFstDecoder[3] - 8;
          floatFstDecoder[3] = v30;
          v29 = floatFstDecoder[6];
        }
      }
    }
    -[FeatureExtractObjc reset](self->fe, "reset", v33);

  }
}

- (BOOL)preKeywordSilenceCheckEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[VATKeywordSpotter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preKeywordSilence");

  return v4;
}

- (void)setPreKeywordSilenceCheckEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreKeywordSilence:", v3);

}

- (BOOL)duringKeywordSilenceCheckEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[VATKeywordSpotter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "duringKeywordSilence");

  return v4;
}

- (void)setDuringKeywordSilenceCheckEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuringKeywordSilence:", v3);

}

- (BOOL)postKeywordSilenceCheckEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[VATKeywordSpotter configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "postKeywordSilence");

  return v4;
}

- (void)setPostKeywordSilenceCheckEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPostKeywordSilence:", v3);

}

- (void)_initializeDecoderForKeywordsWithPhonemes:(id)a3
{
  _WORD *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *floatFstDecoder;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  std::ios_base *v15;
  uint64_t v16;
  uint64_t i;
  std::locale::id *v18;
  const std::locale::facet *v19;
  unsigned __int8 v20;
  std::string *p_p;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  std::ios_base *v28;
  std::locale::id *v29;
  const std::locale::facet *v30;
  unsigned __int8 v31;
  const std::string *v32;
  __int128 v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  id v38;
  _OWORD *size;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __int128 v46;
  std::string::size_type v47;
  uint64_t v48;
  unint64_t value;
  uint64_t k;
  void **v51;
  void **v52;
  void **v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void **v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  VATKeywordSpotter *v64;
  id obj;
  id obja;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74[2];
  char v75;
  void *__dst[2];
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  std::string __p;
  void **v81;
  _BYTE v82[128];
  void *v83;
  unint64_t v84;
  void **v85;
  unint64_t v86;
  _QWORD v87[49];
  _QWORD v88[22];

  v88[19] = *MEMORY[0x24BDAC8D0];
  v62 = a3;
  fwrite("Allocating new decoder\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  self->_processedFrameCount = 0;
  v4 = (_WORD *)operator new();
  v64 = self;
  *((_OWORD *)v4 + 31) = 0u;
  *((_OWORD *)v4 + 32) = 0u;
  *((_OWORD *)v4 + 29) = 0u;
  *((_OWORD *)v4 + 30) = 0u;
  *((_OWORD *)v4 + 27) = 0u;
  *((_OWORD *)v4 + 28) = 0u;
  *((_OWORD *)v4 + 25) = 0u;
  *((_OWORD *)v4 + 26) = 0u;
  *((_OWORD *)v4 + 23) = 0u;
  *((_OWORD *)v4 + 24) = 0u;
  *((_OWORD *)v4 + 21) = 0u;
  *((_OWORD *)v4 + 22) = 0u;
  *((_OWORD *)v4 + 19) = 0u;
  *((_OWORD *)v4 + 20) = 0u;
  *((_OWORD *)v4 + 17) = 0u;
  *((_OWORD *)v4 + 18) = 0u;
  *((_OWORD *)v4 + 15) = 0u;
  *((_OWORD *)v4 + 16) = 0u;
  *((_OWORD *)v4 + 13) = 0u;
  *((_OWORD *)v4 + 14) = 0u;
  *((_OWORD *)v4 + 11) = 0u;
  *((_OWORD *)v4 + 12) = 0u;
  *((_OWORD *)v4 + 10) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *((_OWORD *)v4 + 8) = 0u;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_OWORD *)v4 + 9) = 0u;
  *((_OWORD *)v4 + 5) = 0u;
  *(_QWORD *)v4 = &off_251B9F818;
  *(_OWORD *)(v4 + 4) = 0u;
  *(_OWORD *)(v4 + 12) = 0u;
  *(_OWORD *)(v4 + 20) = 0u;
  *((_DWORD *)v4 + 14) = 1000;
  *((_QWORD *)v4 + 8) = 0;
  *(_DWORD *)((char *)v4 + 71) = 0;
  *((_OWORD *)v4 + 5) = 0u;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *((_QWORD *)v4 + 16) = 0;
  *((_DWORD *)v4 + 34) = 1065353216;
  *((_OWORD *)v4 + 9) = 0u;
  *((_OWORD *)v4 + 10) = 0u;
  *((_DWORD *)v4 + 44) = 1065353216;
  *(_OWORD *)(v4 + 92) = 0u;
  *(_OWORD *)(v4 + 100) = 0u;
  *(_OWORD *)(v4 + 108) = 0u;
  v5 = voiceactions::kLogZero;
  *((_DWORD *)v4 + 58) = voiceactions::kLogZero;
  *((_DWORD *)v4 + 59) = v5;
  v6 = voiceactions::kNoTime;
  *((_DWORD *)v4 + 60) = voiceactions::kNoTime;
  *((_DWORD *)v4 + 61) = v6;
  *((_QWORD *)v4 + 31) = 0;
  *((_QWORD *)v4 + 32) = 0;
  *((_DWORD *)v4 + 66) = 0;
  *((_DWORD *)v4 + 67) = v5;
  *(_OWORD *)(v4 + 140) = 0u;
  *(_OWORD *)(v4 + 148) = 0u;
  *((_DWORD *)v4 + 78) = 1065353216;
  *((_OWORD *)v4 + 20) = 0u;
  *((_OWORD *)v4 + 21) = 0u;
  *((_DWORD *)v4 + 88) = 1065353216;
  *(_OWORD *)(v4 + 180) = 0u;
  *(_OWORD *)(v4 + 188) = 0u;
  *((_DWORD *)v4 + 98) = 1065353216;
  *((_OWORD *)v4 + 25) = 0u;
  *((_OWORD *)v4 + 26) = 0u;
  *((_DWORD *)v4 + 108) = 1065353216;
  *((_DWORD *)v4 + 118) = 1065353216;
  *((_DWORD *)v4 + 120) = -1;
  *(_OWORD *)(v4 + 220) = 0u;
  *(_OWORD *)(v4 + 228) = 0u;
  sub_24A20E380((_QWORD *)v4 + 61, "<blk>");
  *((_DWORD *)v4 + 128) = 1077516698;
  *((_DWORD *)v4 + 130) = 0;
  *((_BYTE *)v4 + 524) = 0;
  self->_floatFstDecoder = v4;
  v4[258] = 0;
  *((_BYTE *)self->_floatFstDecoder + 72) = -[VATKeywordSpotter preKeywordSilenceCheckEnabled](self, "preKeywordSilenceCheckEnabled");
  -[VATKeywordSpotter configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runtime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)self->_floatFstDecoder + 73) = objc_msgSend(v8, "duringKeywordSilence");

  *((_BYTE *)self->_floatFstDecoder + 74) = -[VATKeywordSpotter postKeywordSilenceCheckEnabled](self, "postKeywordSilenceCheckEnabled");
  +[VABundleUtil bundePathFallbackWithResource:type:](VABundleUtil, "bundePathFallbackWithResource:type:", CFSTR("FstSpotterConfig/ctc_tokens"), CFSTR("txt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  floatFstDecoder = self->_floatFstDecoder;
  v59 = objc_retainAutorelease(v9);
  sub_24A20E380(__dst, (char *)objc_msgSend(v59, "UTF8String"));
  v11 = MEMORY[0x24BEDB838];
  v12 = MEMORY[0x24BEDB838] + 64;
  v14 = *(void **)(MEMORY[0x24BEDB7E0] + 8);
  v13 = *(void **)(MEMORY[0x24BEDB7E0] + 16);
  v88[0] = MEMORY[0x24BEDB838] + 64;
  v83 = v14;
  obj = v13;
  *(void **)((char *)&v83 + *((_QWORD *)v14 - 3)) = v13;
  v84 = 0;
  v15 = (std::ios_base *)((char *)&v83 + *((_QWORD *)v83 - 3));
  std::ios_base::init(v15, &v85);
  v15[1].__vftable = 0;
  v15[1].__fmtflags_ = -1;
  v83 = (void *)(v11 + 24);
  v88[0] = v12;
  MEMORY[0x24BD0A068](&v85);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)&v83 + *((_QWORD *)v83 - 3)), *(_DWORD *)((char *)v87 + *((_QWORD *)v83 - 3)) | 4);
  if (*((_QWORD *)floatFstDecoder + 38))
  {
    sub_24A20A008(*((void ***)floatFstDecoder + 37));
    *((_QWORD *)floatFstDecoder + 37) = 0;
    v16 = *((_QWORD *)floatFstDecoder + 36);
    if (v16)
    {
      for (i = 0; i != v16; ++i)
        *(_QWORD *)(*((_QWORD *)floatFstDecoder + 35) + 8 * i) = 0;
    }
    *((_QWORD *)floatFstDecoder + 38) = 0;
  }
  sub_24A20E380(&__p, "<eps>");
  sub_24A210B1C((uint64_t)floatFstDecoder, (__int128 *)&__p);
  v61 = v14;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  memset(&__p, 0, sizeof(__p));
  v18 = (std::locale::id *)MEMORY[0x24BEDB350];
  while (1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v83 + *((_QWORD *)v83 - 3)));
    v19 = std::locale::use_facet((const std::locale *)&v78, v18);
    v20 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v19->__vftable[2].~facet_0)(v19, 10);
    std::locale::~locale((std::locale *)&v78);
    sub_24A212764(&v83, (uint64_t)&__p, v20);
    if ((*((_BYTE *)v87 + *((_QWORD *)v83 - 3)) & 5) != 0)
      break;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_)
      {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        goto LABEL_17;
      }
    }
    else if (*((_BYTE *)&__p.__r_.__value_.__s + 23))
    {
      p_p = &__p;
LABEL_17:
      if (p_p->__r_.__value_.__s.__data_[0] != 35)
      {
        voiceactions::StringSplit(&__p, "\t ", (uint64_t *)&v78);
        if (*((_QWORD *)&v78 + 1) - (_QWORD)v78 == 48)
        {
          v22 = std::stoi((const std::string *)(v78 + 24), 0, 10);
          v81 = (void **)v78;
          *((_DWORD *)sub_24A211A58((uint64_t *)floatFstDecoder + 35, (unsigned __int8 *)v78, (__int128 **)&v81) + 10) = v22 + 1;
        }
        v74[0] = &v78;
        sub_24A20E240((void ***)v74);
      }
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  sub_24A20B7CC(MEMORY[0x24BEDB310], (uint64_t)"Loaded ", 7);
  v23 = MEMORY[0x24BEDB838];
  v24 = (_QWORD *)std::ostream::operator<<();
  sub_24A20B7CC(v24, (uint64_t)" input symbols\n", 15);
  v25 = (void *)*MEMORY[0x24BEDB7E0];
  v83 = v25;
  v60 = *(void **)(MEMORY[0x24BEDB7E0] + 24);
  *(void **)((char *)&v83 + *((_QWORD *)v25 - 3)) = v60;
  MEMORY[0x24BD0A074](&v85);
  std::istream::~istream();
  MEMORY[0x24BD0A134](v88);
  if (SHIBYTE(v77) < 0)
    operator delete(__dst[0]);
  +[VABundleUtil bundePathFallbackWithResource:type:](VABundleUtil, "bundePathFallbackWithResource:type:", CFSTR("FstSpotterConfig/phone-thresholds"), CFSTR("txt"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v64->_floatFstDecoder;
  v63 = objc_retainAutorelease(v26);
  sub_24A20E380(v74, (char *)objc_msgSend(v63, "UTF8String"));
  v88[0] = v23 + 64;
  v83 = v61;
  *(void **)((char *)&v83 + *((_QWORD *)v61 - 3)) = obj;
  v84 = 0;
  v28 = (std::ios_base *)((char *)&v83 + *((_QWORD *)v83 - 3));
  std::ios_base::init(v28, &v85);
  v28[1].__vftable = 0;
  v28[1].__fmtflags_ = -1;
  v83 = (void *)(v23 + 24);
  v88[0] = v23 + 64;
  MEMORY[0x24BD0A068](&v85);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)&v83 + *((_QWORD *)v83 - 3)), *(_DWORD *)((char *)v87 + *((_QWORD *)v83 - 3)) | 4);
  if (v87[13])
  {
    memset(&__p, 0, sizeof(__p));
    v29 = (std::locale::id *)MEMORY[0x24BEDB350];
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v83 + *((_QWORD *)v83 - 3)));
      v30 = std::locale::use_facet((const std::locale *)&v78, v29);
      v31 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
      std::locale::~locale((std::locale *)&v78);
      sub_24A212764(&v83, (uint64_t)&__p, v31);
      if ((*((_BYTE *)v87 + *((_QWORD *)v83 - 3)) & 5) != 0)
        break;
      voiceactions::StringSplit(&__p, ", ", (uint64_t *)&v78);
      v32 = (const std::string *)v78;
      if (*((_QWORD *)&v78 + 1) - (_QWORD)v78 == 48)
      {
        if (*(char *)(v78 + 23) < 0)
        {
          sub_24A20C108(__dst, *(void **)v78, *(_QWORD *)(v78 + 8));
          v32 = (const std::string *)v78;
        }
        else
        {
          v33 = *(_OWORD *)v78;
          v77 = *(_QWORD *)(v78 + 16);
          *(_OWORD *)__dst = v33;
        }
        v34 = std::stof(v32 + 1, 0);
        v81 = __dst;
        *((float *)sub_24A2103D0((uint64_t)v27 + 440, (unsigned __int8 *)__dst, (__int128 **)&v81) + 10) = v34;
        if (SHIBYTE(v77) < 0)
          operator delete(__dst[0]);
      }
      __dst[0] = &v78;
      sub_24A20E240((void ***)__dst);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v83 = v25;
  *(void **)((char *)&v83 + *((_QWORD *)v25 - 3)) = v60;
  MEMORY[0x24BD0A074](&v85);
  std::istream::~istream();
  MEMORY[0x24BD0A134](v88);
  if (v75 < 0)
    operator delete(v74[0]);
  memset(&__p, 0, sizeof(__p));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obja = v62;
  v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v71 != v36)
          objc_enumerationMutation(obja);
        v38 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j));
        sub_24A20E380(&v78, (char *)objc_msgSend(v38, "UTF8String"));
        size = (_OWORD *)__p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v41 = 0xAAAAAAAAAAAAAAABLL
              * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
          v42 = v41 + 1;
          if (v41 + 1 > 0xAAAAAAAAAAAAAAALL)
            sub_24A20A098();
          if (0x5555555555555556
             * ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 3) > v42)
            v42 = 0x5555555555555556
                * ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 3);
          if (0xAAAAAAAAAAAAAAABLL
             * ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 3) >= 0x555555555555555)
            v43 = 0xAAAAAAAAAAAAAAALL;
          else
            v43 = v42;
          v87[0] = (char *)&__p.__r_.__value_.__l + 16;
          if (v43)
            v43 = (unint64_t)sub_24A20E42C(v43);
          else
            v44 = 0;
          v45 = v43 + 24 * v41;
          v83 = (void *)v43;
          v84 = v45;
          v86 = v43 + 24 * v44;
          v46 = v78;
          *(_QWORD *)(v45 + 16) = v79;
          *(_OWORD *)v45 = v46;
          v79 = 0;
          v78 = 0uLL;
          v85 = (void **)(v45 + 24);
          sub_24A20E470((uint64_t *)&__p, &v83);
          v47 = __p.__r_.__value_.__l.__size_;
          sub_24A20E4F4((uint64_t)&v83);
          __p.__r_.__value_.__l.__size_ = v47;
          if (SHIBYTE(v79) < 0)
            operator delete((void *)v78);
        }
        else
        {
          v40 = v78;
          *(_QWORD *)(__p.__r_.__value_.__l.__size_ + 16) = v79;
          *size = v40;
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)size + 24;
        }

      }
      v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v35);
  }

  v48 = (uint64_t)v64->_floatFstDecoder;
  v68 = 0;
  v69 = 0;
  v67 = 0;
  sub_24A20E554((char *)&v67, (__int128 *)__p.__r_.__value_.__l.__data_, (__int128 *)__p.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3));
  sub_24A20E5D8((uint64_t)&v83, v48, v67, v68);
  if (v64->_phraseThresholds.__table_.__p2_.__value_)
  {
    sub_24A20A008((void **)v64->_phraseThresholds.__table_.__p1_.__value_.__next_);
    v64->_phraseThresholds.__table_.__p1_.__value_.__next_ = 0;
    value = v64->_phraseThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (k = 0; k != value; ++k)
        v64->_phraseThresholds.__table_.__bucket_list_.__ptr_.__value_[k] = 0;
    }
    v64->_phraseThresholds.__table_.__p2_.__value_ = 0;
  }
  v51 = (void **)v83;
  v83 = 0;
  v52 = v64->_phraseThresholds.__table_.__bucket_list_.__ptr_.__value_;
  v64->_phraseThresholds.__table_.__bucket_list_.__ptr_.__value_ = v51;
  if (v52)
    operator delete(v52);
  v54 = v84;
  v53 = v85;
  v64->_phraseThresholds.__table_.__p1_.__value_.__next_ = v85;
  v64->_phraseThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = v54;
  v84 = 0;
  v55 = v86;
  v64->_phraseThresholds.__table_.__p2_.__value_ = v86;
  v64->_phraseThresholds.__table_.__p3_.__value_ = *(float *)v87;
  if (v55)
  {
    v56 = (unint64_t)v53[1];
    if ((v54 & (v54 - 1)) != 0)
    {
      if (v56 >= v54)
        v56 %= v54;
    }
    else
    {
      v56 &= v54 - 1;
    }
    v53 = 0;
    v64->_phraseThresholds.__table_.__bucket_list_.__ptr_.__value_[v56] = &v64->_phraseThresholds.__table_.__p1_;
    v85 = 0;
    v86 = 0;
  }
  sub_24A20A008(v53);
  v57 = v83;
  v83 = 0;
  if (v57)
    operator delete(v57);
  *(_QWORD *)&v78 = &v67;
  sub_24A20E240((void ***)&v78);
  v58 = (void **)v64->_floatFstDecoder;
  sub_24A20FFEC(v58 + 23, (int)(-1431655765 * ((unint64_t)((_BYTE *)v58[11] - (_BYTE *)v58[10]) >> 3)));
  sub_24A20BAF0(v58);
  sub_24A20BAF0((_QWORD *)v64->_floatFstDecoder);
  v83 = &__p;
  sub_24A20E240((void ***)&v83);

}

- (void)_acousticCallback:(id)a3 rows:(int64_t)a4 cols:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  FstSpotterResults *end;
  FstSpotterResults *begin;
  void *v13;
  NSObject *v14;
  __int128 v15;
  char *floatFstDecoder;
  char *v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  int64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD *i;
  void *v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void *v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  int64_t v63;
  char *v64;
  uint64_t v65;
  BOOL v66;
  float v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  float v76;
  float v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  float v85;
  float v86;
  uint64_t v87;
  float *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  int *v95;
  int v96;
  uint64_t *v97;
  _DWORD *v98;
  int v99;
  int v100;
  int v101;
  int v102;
  float v103;
  __int128 v104;
  unint64_t v105;
  uint8x8_t v106;
  unint64_t v107;
  uint64_t **v108;
  uint64_t *v109;
  unint64_t v110;
  char *v111;
  char *v112;
  __int128 v113;
  __int128 v114;
  _QWORD *v115;
  _QWORD *v116;
  int v117;
  _QWORD *v118;
  char v119;
  _QWORD *v120;
  _OWORD *v121;
  __int128 v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129;
  void *v130;
  __CFString *v131;
  BOOL v132;
  uint64_t v133;
  _BOOL4 v134;
  void *v135;
  void *v136;
  int v137;
  NSObject *v138;
  _BOOL4 v139;
  __int128 *v140;
  __int128 *v141;
  unint64_t v142;
  uint64_t value;
  uint64_t v144;
  __int128 *v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  FstSpotterResults *v149;
  uint64_t v150;
  char *v151;
  NSObject *v152;
  FstSpotterResults *v153;
  __int128 *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  int v159;
  int v160;
  unint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  _QWORD *v173;
  _QWORD *v174;
  _QWORD *v175;
  _QWORD *v176;
  _QWORD *v177;
  __int128 v178;
  __compressed_pair<voiceactions::FstSpotterResults *, std::allocator<voiceactions::FstSpotterResults>> *p_end_cap;
  uint64_t *p_keywordResults;
  id v181;
  size_t v182;
  uint64_t v183;
  int64_t v184;
  VATKeywordSpotter *v185;
  uint64_t v186;
  int processedFrameCount;
  uint64_t *v188;
  _DWORD *__p;
  unsigned __int8 *v190;
  __CFString *v191;
  uint64_t v192;
  __int128 __dst;
  unint64_t v194;
  _BYTE __str[73];
  uint64_t v196;

  v196 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v181 = v8;
  if (a4 != 8)
  {
    v174 = sub_24A20B7CC(v173, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VoiceActions/VoiceActions/v1/VATKeywordSpotter.m", 86);
    sub_24A20B7CC(v174, (uint64_t)" line ", 6);
    v175 = (_QWORD *)std::ostream::operator<<();
    v176 = sub_24A20B7CC(v175, (uint64_t)": ", 2);
    v177 = sub_24A20B7CC(v176, (uint64_t)"Mismatch in acoustic model output shape, expected 8 rows", 56);
    sub_24A20BA60(v177);
    std::terminate();
  }
  if (v8)
  {
    -[VATKeywordSpotter configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "runtime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "postKeywordSilence"))
    {
      begin = self->_keywordResults.__begin_;
      end = self->_keywordResults.__end_;

      v13 = v181;
      if (end != begin)
      {
        -[VATKeywordSpotter _postKeywordSilenceProcessingWithResults:rows:cols:](self, "_postKeywordSilenceProcessingWithResults:rows:cols:", v181, 8, a5);
        self->_processedFrameCount += 8;
        goto LABEL_9;
      }
    }
    else
    {

      v13 = v181;
    }
    v183 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
    v182 = 4 * a5;
    v186 = 0;
    p_end_cap = &self->_keywordResults.__end_cap_;
    p_keywordResults = (uint64_t *)&self->_keywordResults;
    *(_QWORD *)&v15 = 138413058;
    v178 = v15;
    v184 = a5;
    v185 = self;
    while (1)
    {
      if (a5)
      {
        if ((unint64_t)a5 >> 62)
          sub_24A20A098();
        __p = sub_24A20A0AC(a5);
        memmove(__p, (const void *)(v183 + 4 * v186 * a5), v182);
      }
      else
      {
        __p = 0;
      }
      floatFstDecoder = (char *)self->_floatFstDecoder;
      if (*((_QWORD *)floatFstDecoder + 23) == *((_QWORD *)floatFstDecoder + 24))
        goto LABEL_123;
      processedFrameCount = self->_processedFrameCount;
      v190 = (unsigned __int8 *)self->_floatFstDecoder;
      if (floatFstDecoder[72] || floatFstDecoder[73] || floatFstDecoder[74])
        break;
LABEL_68:
      v65 = *((_QWORD *)floatFstDecoder + 23);
      if (0xAAAAAAAAAAAAAAABLL
         * ((uint64_t)(*((_QWORD *)floatFstDecoder + 11) - *((_QWORD *)floatFstDecoder + 10)) >> 3) != (*((_QWORD *)floatFstDecoder + 24) - v65) >> 5)
        __assert_rtn("SearchFrame", "OnlineFstSpottingDecoder.hpp", 505, "tokens.size() == states.size()");
      if (processedFrameCount)
        v66 = floatFstDecoder[517] == 0;
      else
        v66 = 1;
      *(_DWORD *)v65 = voiceactions::kNolabel;
      v67 = *(float *)&voiceactions::kLogZero;
      v68 = voiceactions::kNoTime;
      if (v66)
      {
        v68 = processedFrameCount;
        v67 = 0.0;
      }
      *(_QWORD *)(v65 + 20) = 0;
      *(_QWORD *)(v65 + 12) = 0;
      *(_DWORD *)(v65 + 8) = v68;
      *(float *)(v65 + 4) = v67;
      v69 = -1
          - 1431655765 * ((*((_QWORD *)floatFstDecoder + 11) - *((_QWORD *)floatFstDecoder + 10)) >> 3);
      if ((v69 & 0x80000000) == 0)
      {
        do
        {
          v70 = *((_QWORD *)v190 + 10) + 24 * v69;
          v72 = *(_QWORD *)(v70 + 8);
          v71 = (uint64_t *)(v70 + 8);
          v188 = (uint64_t *)(*((_QWORD *)v190 + 10) + 24 * v69);
          v73 = *v188;
          if (v72 != *v188)
          {
            v74 = *(_DWORD *)(v73 + 8);
            v75 = v190[524];
            v76 = *(float *)&__p[v74 - 1];
            v77 = logf(v76);
            if (!v75)
              v77 = v76;
            sub_24A20D7E8(*((_QWORD *)v190 + 23) + 32 * v69, (float *)(*((_QWORD *)v190 + 23) + 32 * *(int *)(v73 + 4)), v74, *(_DWORD *)(v73 + 12), *((_DWORD *)v190 + 120), 1, *(float *)(v73 + 16) - v77);
            v78 = *v71;
            v79 = *v188;
            if (0xAAAAAAAAAAAAAAABLL * ((*v71 - *v188) >> 3) >= 2)
            {
              v80 = 0;
              v81 = 1;
              do
              {
                v82 = v79 + v80;
                v83 = *(_DWORD *)(v79 + v80 + 32);
                v84 = v190[524];
                v85 = *(float *)&__p[v83 - 1];
                v86 = logf(v85);
                if (!v84)
                  v86 = v85;
                v87 = *((_QWORD *)v190 + 23);
                v88 = (float *)(v87 + 32 * *(int *)(v82 + 28));
                v89 = v87 + 32 * v69;
                if ((float)(v88[1] - v86) < *(float *)(v89 + 4))
                {
                  sub_24A20D7E8(v89, v88, v83, *(_DWORD *)(v82 + 36), *((_DWORD *)v190 + 120), 0, -v86);
                  v78 = *v71;
                  v79 = *v188;
                }
                ++v81;
                v80 += 24;
              }
              while (0xAAAAAAAAAAAAAAABLL * ((v78 - v79) >> 3) > v81);
            }
          }
          v32 = v69-- <= 0;
        }
        while (!v32);
      }
      v90 = (_QWORD *)*((_QWORD *)v190 + 15);
      a5 = v184;
      self = v185;
      if (v90)
      {
        v91 = (uint64_t *)(v190 + 144);
        while (1)
        {
          v92 = v90[2];
          v192 = v92;
          v93 = *((_QWORD *)v190 + 23);
          v94 = *(float *)(v93 + 32 * (int)v92 + 4);
          if (v94 >= *(float *)&voiceactions::kLogZero)
            goto LABEL_120;
          v95 = (int *)(v93 + 32 * (int)v92);
          memset(__str, 0, 24);
          *(_DWORD *)&__str[60] = voiceactions::kLogZero;
          __str[64] = 0;
          *(float *)&__str[24] = v94 + *((float *)&v92 + 1);
          *(_DWORD *)&__str[56] = 0;
          *(_DWORD *)&__str[36] = processedFrameCount;
          v96 = v95[2];
          *(_DWORD *)&__str[32] = v96;
          if (*v95 >= 1 && (v97 = sub_24A20E2CC((_QWORD *)v190 + 45, *v95)) != 0)
          {
            if (*((char *)v97 + 47) < 0)
            {
              sub_24A20C108(&__dst, (void *)v97[3], v97[4]);
            }
            else
            {
              __dst = *(_OWORD *)(v97 + 3);
              v194 = v97[5];
            }
          }
          else
          {
            __dst = 0uLL;
            v194 = 0;
          }
          v98 = (_DWORD *)(v93 + 32 * (int)v92);
          v100 = v98[5];
          v99 = v98[6];
          v101 = v98[3];
          v102 = v98[4];
          *(_OWORD *)__str = __dst;
          *(_QWORD *)&__str[16] = v194;
          *(_DWORD *)&__str[28] = v102;
          *(_DWORD *)&__str[40] = v100;
          *(_DWORD *)&__str[44] = v101;
          *(_DWORD *)&__str[48] = v99;
          *(_DWORD *)&__str[52] = processedFrameCount + 1 - v96;
          *(_QWORD *)&__dst = __str;
          v103 = *((float *)sub_24A20D85C((uint64_t)(v190 + 400), __str, (__int128 **)&__dst) + 10);
          __str[64] = (float)(*(float *)&__str[24] - v103) < 0.0;
          *(float *)&__str[56] = v103;
          *(_DWORD *)&__str[60] = *(_DWORD *)&__str[24];
          if ((float)(*(float *)&__str[24] - v103) < 0.0 && *(float *)&__str[24] < *((float *)v190 + 67))
          {
            std::string::operator=((std::string *)(v190 + 208), (const std::string *)__str);
            v104 = *(_OWORD *)&__str[40];
            *(_OWORD *)(v190 + 232) = *(_OWORD *)&__str[24];
            *(_OWORD *)(v190 + 248) = v104;
            *(_OWORD *)(v190 + 257) = *(_OWORD *)&__str[49];
          }
          v105 = *((_QWORD *)v190 + 19);
          if (!v105)
            goto LABEL_117;
          v106 = (uint8x8_t)vcnt_s8((int8x8_t)v105);
          v106.i16[0] = vaddlv_u8(v106);
          if (v106.u32[0] > 1uLL)
          {
            v107 = (int)v92;
            if (v105 <= (int)v92)
              v107 = (int)v92 % v105;
          }
          else
          {
            v107 = (v105 - 1) & (int)v92;
          }
          v108 = *(uint64_t ***)(*v91 + 8 * v107);
          if (!v108 || (v109 = *v108) == 0)
          {
LABEL_117:
            v112 = sub_24A20BC88(v91, v92, &v192);
            std::string::operator=((std::string *)v112 + 1, (const std::string *)__str);
            v113 = *(_OWORD *)&__str[49];
            v114 = *(_OWORD *)&__str[40];
            *((_OWORD *)v112 + 3) = *(_OWORD *)&__str[24];
            *((_OWORD *)v112 + 4) = v114;
            *(_OWORD *)(v112 + 73) = v113;
            goto LABEL_118;
          }
          while (1)
          {
            v110 = v109[1];
            if (v110 == (int)v92)
              break;
            if (v106.u32[0] > 1uLL)
            {
              if (v110 >= v105)
                v110 %= v105;
            }
            else
            {
              v110 &= v105 - 1;
            }
            if (v110 != v107)
              goto LABEL_117;
LABEL_113:
            v109 = (uint64_t *)*v109;
            if (!v109)
              goto LABEL_117;
          }
          if (*((_DWORD *)v109 + 4) != (_DWORD)v92)
            goto LABEL_113;
          v111 = sub_24A20BC88(v91, v92, &v192);
          if (*((float *)v111 + 12) > *(float *)&__str[24])
            goto LABEL_117;
LABEL_118:
          if ((__str[23] & 0x80000000) != 0)
            operator delete(*(void **)__str);
LABEL_120:
          v90 = (_QWORD *)*v90;
          if (!v90)
          {
            v115 = (_QWORD *)*((_QWORD *)v190 + 15);
            a5 = v184;
            for (self = v185; v115; v115 = (_QWORD *)*v115)
              ;
            break;
          }
        }
      }
LABEL_123:
      v116 = self->_floatFstDecoder;
      v117 = self->_processedFrameCount;
      v194 = 0;
      __dst = 0uLL;
      v118 = (_QWORD *)v116[20];
      if (!v118)
        goto LABEL_144;
      v119 = 0;
      do
      {
        sub_24A20BC24((uint64_t)__str, (uint64_t)(v118 + 2));
        if (__str[72])
          v119 |= *(_DWORD *)&__str[44] >= v117 - *((_DWORD *)v116 + 130);
        if ((__str[31] & 0x80000000) != 0)
          operator delete(*(void **)&__str[8]);
        v118 = (_QWORD *)*v118;
      }
      while (v118);
      if ((v119 & 1) != 0)
      {
        v120 = (_QWORD *)v116[20];
        if (v120)
        {
          do
          {
            sub_24A20BC24((uint64_t)__str, (uint64_t)(v120 + 2));
            if (__str[72])
            {
              v121 = (_OWORD *)*((_QWORD *)&__dst + 1);
              if (*((_QWORD *)&__dst + 1) >= v194)
              {
                v123 = sub_24A20C320((uint64_t *)&__dst, (__int128 *)&__str[8]);
              }
              else
              {
                if ((__str[31] & 0x80000000) != 0)
                {
                  sub_24A20C108(*((_BYTE **)&__dst + 1), *(void **)&__str[8], *(unint64_t *)&__str[16]);
                }
                else
                {
                  v122 = *(_OWORD *)&__str[8];
                  *(_QWORD *)(*((_QWORD *)&__dst + 1) + 16) = *(_QWORD *)&__str[24];
                  *v121 = v122;
                }
                v124 = *(_OWORD *)&__str[32];
                v125 = *(_OWORD *)&__str[48];
                *(_OWORD *)((char *)v121 + 49) = *(_OWORD *)&__str[57];
                *(_OWORD *)((char *)v121 + 40) = v125;
                *(_OWORD *)((char *)v121 + 24) = v124;
                v123 = (uint64_t)v121 + 72;
              }
              *((_QWORD *)&__dst + 1) = v123;
            }
            if ((__str[31] & 0x80000000) != 0)
              operator delete(*(void **)&__str[8]);
            v120 = (_QWORD *)*v120;
          }
          while (v120);
          v127 = *((_QWORD *)&__dst + 1);
          v126 = __dst;
        }
        else
        {
          v127 = 0;
          v126 = 0;
        }
      }
      else
      {
LABEL_144:
        v127 = 0;
        v126 = 0;
      }
      v128 = 126 - 2 * __clz(0x8E38E38E38E38E39 * ((uint64_t)(v127 - v126) >> 3));
      if (v127 == v126)
        v129 = 0;
      else
        v129 = v128;
      sub_24A20C478(v126, v127, v129, 1);
      -[VATKeywordSpotter configuration](self, "configuration");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "runtime");
      v131 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString batchDecode](v131, "batchDecode") & 1) != 0 || *((_QWORD *)&__dst + 1) == (_QWORD)__dst)
        goto LABEL_191;
      v132 = *(_BYTE *)(__dst + 64) == 0;

      if (!v132)
      {
        v133 = __dst;
        if (*(char *)(__dst + 23) < 0)
          v133 = *(_QWORD *)__dst;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v133, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding", v178));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v191 = &stru_251B9F998;
        v134 = -[VATKeywordSpotter _isDetectionValidForResult:reason:](self, "_isDetectionValidForResult:reason:", (_QWORD)__dst, &v191);
        v131 = v191;
        if (v134)
        {
          -[VATKeywordSpotter configuration](self, "configuration");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "runtime");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend(v136, "postKeywordSilence");

          _VATLoggingFacility(kVATLogCategoryFramework);
          v138 = objc_claimAutoreleasedReturnValue();
          v139 = os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG);
          if (v137)
          {
            if (v139)
            {
              v168 = *(_DWORD *)(__dst + 32);
              v167 = *(_DWORD *)(__dst + 36);
              v169 = self->_processedFrameCount;
              *(_DWORD *)__str = v178;
              *(_QWORD *)&__str[4] = v130;
              *(_WORD *)&__str[12] = 1024;
              *(_DWORD *)&__str[14] = v168;
              *(_WORD *)&__str[18] = 1024;
              *(_DWORD *)&__str[20] = v167;
              *(_WORD *)&__str[24] = 1024;
              *(_DWORD *)&__str[26] = v169;
              _os_log_debug_impl(&dword_24A12D000, v138, OS_LOG_TYPE_DEBUG, "Got keyword \"%@\" [%d, %d] at frame %d, waiting for silence", __str, 0x1Eu);
            }

            if (p_keywordResults != (uint64_t *)&__dst)
            {
              v140 = (__int128 *)*((_QWORD *)&__dst + 1);
              v141 = (__int128 *)__dst;
              v142 = 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)&__dst + 1) - __dst) >> 3);
              value = (uint64_t)p_end_cap->__value_;
              v144 = *p_keywordResults;
              if (0x8E38E38E38E38E39 * (((uint64_t)p_end_cap->__value_ - *p_keywordResults) >> 3) < v142)
              {
                if (v144)
                {
                  v145 = (__int128 *)*((_QWORD *)&__dst + 1);
                  sub_24A20A04C(p_keywordResults);
                  operator delete((void *)*p_keywordResults);
                  value = 0;
                  *p_keywordResults = 0;
                  p_keywordResults[1] = 0;
                  p_keywordResults[2] = 0;
                  v140 = v145;
                }
                if (v142 > 0x38E38E38E38E38ELL)
                  goto LABEL_207;
                v146 = 0x8E38E38E38E38E39 * (value >> 3);
                v147 = 2 * v146;
                if (2 * v146 <= v142)
                  v147 = v142;
                v148 = v146 >= 0x1C71C71C71C71C7 ? 0x38E38E38E38E38ELL : v147;
                if (v148 > 0x38E38E38E38E38ELL)
LABEL_207:
                  sub_24A20A098();
                v149 = (FstSpotterResults *)sub_24A20C27C(v148);
                self->_keywordResults.__begin_ = v149;
                self->_keywordResults.__end_ = v149;
                self->_keywordResults.__end_cap_.__value_ = (FstSpotterResults *)((char *)v149 + 72 * v150);
                v151 = sub_24A20C1A4((uint64_t)p_end_cap, v141, v140, (char *)v149);
                goto LABEL_181;
              }
              v153 = self->_keywordResults.__end_;
              if (0x8E38E38E38E38E39 * (((uint64_t)v153 - v144) >> 3) >= v142)
              {
                if ((_QWORD)__dst != *((_QWORD *)&__dst + 1))
                {
                  do
                  {
                    std::string::operator=((std::string *)v144, (const std::string *)v141);
                    v157 = *(__int128 *)((char *)v141 + 24);
                    v158 = *(__int128 *)((char *)v141 + 40);
                    *(_OWORD *)(v144 + 49) = *(__int128 *)((char *)v141 + 49);
                    *(_OWORD *)(v144 + 40) = v158;
                    *(_OWORD *)(v144 + 24) = v157;
                    v144 += 72;
                    v141 = (__int128 *)((char *)v141 + 72);
                  }
                  while (v141 != v140);
                  v153 = self->_keywordResults.__end_;
                }
                while (v153 != (FstSpotterResults *)v144)
                {
                  if (*((char *)v153 - 49) < 0)
                    operator delete(*((void **)v153 - 9));
                  v153 = (FstSpotterResults *)((char *)v153 - 72);
                }
                self->_keywordResults.__end_ = (FstSpotterResults *)v144;
              }
              else
              {
                v154 = (__int128 *)(__dst + 8 * (((uint64_t)v153 - v144) >> 3));
                if (v153 != (FstSpotterResults *)v144)
                {
                  do
                  {
                    std::string::operator=((std::string *)v144, (const std::string *)v141);
                    v155 = *(__int128 *)((char *)v141 + 24);
                    v156 = *(__int128 *)((char *)v141 + 40);
                    *(_OWORD *)(v144 + 49) = *(__int128 *)((char *)v141 + 49);
                    *(_OWORD *)(v144 + 40) = v156;
                    *(_OWORD *)(v144 + 24) = v155;
                    v141 = (__int128 *)((char *)v141 + 72);
                    v144 += 72;
                  }
                  while (v141 != v154);
                  v144 = (uint64_t)self->_keywordResults.__end_;
                }
                v151 = sub_24A20C1A4((uint64_t)p_end_cap, v154, v140, (char *)v144);
LABEL_181:
                self->_keywordResults.__end_ = (FstSpotterResults *)v151;
              }
            }
          }
          else
          {
            if (v139)
            {
              v171 = *(_DWORD *)(__dst + 32);
              v170 = *(_DWORD *)(__dst + 36);
              v172 = self->_processedFrameCount;
              *(_DWORD *)__str = v178;
              *(_QWORD *)&__str[4] = v130;
              *(_WORD *)&__str[12] = 1024;
              *(_DWORD *)&__str[14] = v171;
              *(_WORD *)&__str[18] = 1024;
              *(_DWORD *)&__str[20] = v170;
              *(_WORD *)&__str[24] = 1024;
              *(_DWORD *)&__str[26] = v172;
              _os_log_debug_impl(&dword_24A12D000, v138, OS_LOG_TYPE_DEBUG, "Got keyword \"%@\" [%d, %d] after %d frames, not looking for silence after", __str, 0x1Eu);
            }

            -[VATKeywordSpotter _handleValidResult:](self, "_handleValidResult:", &__dst);
          }
        }
        else
        {
          _VATLoggingFacility(kVATLogCategoryFramework);
          v152 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
          {
            v160 = *(_DWORD *)(__dst + 32);
            v159 = *(_DWORD *)(__dst + 36);
            *(_DWORD *)__str = v178;
            *(_QWORD *)&__str[4] = v130;
            *(_WORD *)&__str[12] = 1024;
            *(_DWORD *)&__str[14] = v160;
            *(_WORD *)&__str[18] = 1024;
            *(_DWORD *)&__str[20] = v159;
            *(_WORD *)&__str[24] = 2112;
            *(_QWORD *)&__str[26] = v131;
            _os_log_debug_impl(&dword_24A12D000, v152, OS_LOG_TYPE_DEBUG, "Keyword \"%@\" [%d,%d] dismissed. %@", __str, 0x22u);
          }

        }
        sub_24A20BAF0((_QWORD *)self->_floatFstDecoder);
LABEL_191:

      }
      ++self->_processedFrameCount;
      *(_QWORD *)__str = &__dst;
      sub_24A209F90((void ***)__str);
      if (__p)
        operator delete(__p);
      if (++v186 == 8)
        goto LABEL_9;
    }
    v17 = (char *)*((_QWORD *)floatFstDecoder + 3);
    v18 = (char *)*((_QWORD *)floatFstDecoder + 2);
    v19 = v17 - v18;
    v20 = floatFstDecoder + 8;
    if (v17 == v18)
      v21 = 0;
    else
      v21 = ((v17 - v18) << 7) - 1;
    v22 = *((_QWORD *)floatFstDecoder + 5);
    v23 = *((_QWORD *)floatFstDecoder + 6);
    v24 = v23 + v22;
    if (v21 != v23 + v22)
    {
LABEL_66:
      *(_DWORD *)(*(_QWORD *)&v18[(v24 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v24 & 0x3FF)) = __p[54];
      *((_QWORD *)floatFstDecoder + 6) = v23 + 1;
      if (v23 + 1 == *((_DWORD *)floatFstDecoder + 14))
      {
        *((_QWORD *)floatFstDecoder + 5) = v22 + 1;
        *((_QWORD *)floatFstDecoder + 6) = v23;
        sub_24A20AFF4((uint64_t)v20);
        ++*((_QWORD *)floatFstDecoder + 8);
      }
      goto LABEL_68;
    }
    v25 = v22 >= 0x400;
    v26 = v22 - 1024;
    if (v25)
    {
      *((_QWORD *)floatFstDecoder + 5) = v26;
      v29 = *(_QWORD *)v18;
      v27 = v18 + 8;
      v28 = v29;
      *((_QWORD *)floatFstDecoder + 2) = v27;
      if (*((char **)floatFstDecoder + 4) == v17)
      {
        v30 = (uint64_t)&v27[-*v20];
        if ((unint64_t)v27 > *v20)
        {
          v31 = v30 >> 3;
          v32 = v30 >> 3 < -1;
          v33 = (v30 >> 3) + 2;
          if (v32)
            v34 = v33;
          else
            v34 = v31 + 1;
          v35 = &v27[-8 * (v34 >> 1)];
          v36 = v17 - v27;
          if (v17 == v27)
          {
            v37 = v17;
          }
          else
          {
            memmove(&v27[-8 * (v34 >> 1)], v27, v17 - v27);
            v37 = (char *)*((_QWORD *)floatFstDecoder + 2);
          }
          v17 = &v35[v36];
          v64 = &v37[-8 * (v34 >> 1)];
LABEL_63:
          *((_QWORD *)floatFstDecoder + 2) = v64;
          *((_QWORD *)floatFstDecoder + 3) = v17;
          goto LABEL_64;
        }
        if (v17 == (char *)*v20)
          v45 = 1;
        else
          v45 = (uint64_t)&v17[-*v20] >> 2;
        v46 = (char *)sub_24A20B418(v45);
        v48 = &v46[8 * (v45 >> 2)];
        v49 = (uint64_t *)*((_QWORD *)floatFstDecoder + 2);
        v17 = v48;
        v50 = *((_QWORD *)floatFstDecoder + 3) - (_QWORD)v49;
        if (v50)
        {
          v17 = &v48[v50 & 0xFFFFFFFFFFFFFFF8];
          v51 = 8 * (v50 >> 3);
          v52 = &v46[8 * (v45 >> 2)];
          do
          {
            v53 = *v49++;
            *(_QWORD *)v52 = v53;
            v52 += 8;
            v51 -= 8;
          }
          while (v51);
        }
LABEL_52:
        v54 = (void *)*((_QWORD *)floatFstDecoder + 1);
        *((_QWORD *)floatFstDecoder + 1) = v46;
        *((_QWORD *)floatFstDecoder + 2) = v48;
        *((_QWORD *)floatFstDecoder + 3) = v17;
        *((_QWORD *)floatFstDecoder + 4) = &v46[8 * v47];
        if (v54)
        {
          operator delete(v54);
          v17 = (char *)*((_QWORD *)floatFstDecoder + 3);
        }
      }
    }
    else
    {
      v38 = v19 >> 3;
      v39 = (char *)*((_QWORD *)floatFstDecoder + 4);
      v40 = (char *)*((_QWORD *)floatFstDecoder + 1);
      if (v19 >> 3 >= (unint64_t)((v39 - v40) >> 3))
      {
        if (v39 == v40)
          v41 = 1;
        else
          v41 = (v39 - v40) >> 2;
        *(_QWORD *)&__str[32] = floatFstDecoder + 32;
        *(_QWORD *)__str = sub_24A20B418(v41);
        *(_QWORD *)&__str[8] = *(_QWORD *)__str + 8 * v38;
        *(_QWORD *)&__str[16] = *(_QWORD *)&__str[8];
        *(_QWORD *)&__str[24] = *(_QWORD *)__str + 8 * v42;
        *(_QWORD *)&__dst = operator new(0x1000uLL);
        sub_24A20B44C(__str, &__dst);
        for (i = (_QWORD *)*((_QWORD *)floatFstDecoder + 3);
              i != *((_QWORD **)floatFstDecoder + 2);
              sub_24A20B55C((uint64_t)__str, i))
        {
          --i;
        }
        v44 = (void *)*((_QWORD *)floatFstDecoder + 1);
        *(_OWORD *)(floatFstDecoder + 8) = *(_OWORD *)__str;
        *(_OWORD *)(floatFstDecoder + 24) = *(_OWORD *)&__str[16];
        if (v44)
          operator delete(v44);
        goto LABEL_65;
      }
      if (v39 != v17)
      {
        *(_QWORD *)__str = operator new(0x1000uLL);
        sub_24A20B44C((_QWORD *)floatFstDecoder + 1, __str);
LABEL_65:
        v18 = (char *)*((_QWORD *)floatFstDecoder + 2);
        v22 = *((_QWORD *)floatFstDecoder + 5);
        v23 = *((_QWORD *)floatFstDecoder + 6);
        v24 = v22 + v23;
        goto LABEL_66;
      }
      *(_QWORD *)__str = operator new(0x1000uLL);
      sub_24A20B55C((uint64_t)(floatFstDecoder + 8), __str);
      v55 = (_QWORD *)*((_QWORD *)floatFstDecoder + 2);
      v17 = (char *)*((_QWORD *)floatFstDecoder + 3);
      v57 = *v55;
      v56 = (char *)(v55 + 1);
      v28 = v57;
      *((_QWORD *)floatFstDecoder + 2) = v56;
      if (v17 == *((char **)floatFstDecoder + 4))
      {
        v58 = (uint64_t)&v56[-*v20];
        if ((unint64_t)v56 > *v20)
        {
          v59 = v58 >> 3;
          v32 = v58 >> 3 < -1;
          v60 = (v58 >> 3) + 2;
          if (v32)
            v61 = v60;
          else
            v61 = v59 + 1;
          v62 = &v56[-8 * (v61 >> 1)];
          v63 = v17 - v56;
          if (v17 != v56)
          {
            memmove(&v56[-8 * (v61 >> 1)], v56, v17 - v56);
            v56 = (char *)*((_QWORD *)floatFstDecoder + 2);
          }
          v17 = &v62[v63];
          v64 = &v56[-8 * (v61 >> 1)];
          goto LABEL_63;
        }
        if (v17 == (char *)*v20)
          v161 = 1;
        else
          v161 = (uint64_t)&v17[-*v20] >> 2;
        v46 = (char *)sub_24A20B418(v161);
        v48 = &v46[8 * (v161 >> 2)];
        v162 = (uint64_t *)*((_QWORD *)floatFstDecoder + 2);
        v17 = v48;
        v163 = *((_QWORD *)floatFstDecoder + 3) - (_QWORD)v162;
        if (v163)
        {
          v17 = &v48[v163 & 0xFFFFFFFFFFFFFFF8];
          v164 = 8 * (v163 >> 3);
          v165 = &v46[8 * (v161 >> 2)];
          do
          {
            v166 = *v162++;
            *(_QWORD *)v165 = v166;
            v165 += 8;
            v164 -= 8;
          }
          while (v164);
        }
        goto LABEL_52;
      }
    }
LABEL_64:
    *(_QWORD *)v17 = v28;
    *((_QWORD *)floatFstDecoder + 3) += 8;
    goto LABEL_65;
  }
  _VATLoggingFacility(kVATLogCategoryFramework);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__str = 0;
    _os_log_error_impl(&dword_24A12D000, v14, OS_LOG_TYPE_ERROR, "Got nil acoustic model output", __str, 2u);
  }

LABEL_9:
}

- (void)_postKeywordSilenceProcessingWithResults:(id)a3 rows:(int64_t)a4 cols:(int64_t)a5
{
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  int v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int frameCountSinceKeywordDetected;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void *v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  FstSpotterResults *begin;
  NSObject *v53;
  VATKeywordSpotter *v54;
  uint64_t *v55;
  void *v56;
  void *v57;
  int v58;
  FstSpotterResults *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  VATKeywordSpotterDelegate *v75;
  FstSpotterResults *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t floatFstDecoder;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  vector<voiceactions::FstSpotterResults, std::allocator<voiceactions::FstSpotterResults>> *p_keywordResults;
  id v96;
  VATKeywordSpotter *v97;
  unsigned int v98;
  int v99;
  _BYTE buf[12];
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v96 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v96, "bytes");
  v97 = self;
  if (a4 < 1)
  {
    v9 = 0;
    v15 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v8 + 4 * a5 - 4;
    do
    {
      v14 = *(_DWORD *)(v13 + 4 * v12 * a5);
      if ((unint64_t)v10 >= v11)
      {
        v16 = (v10 - v9) >> 2;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62)
          sub_24A20A098();
        if ((uint64_t)(v11 - (_QWORD)v9) >> 1 > v17)
          v17 = (uint64_t)(v11 - (_QWORD)v9) >> 1;
        if (v11 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL)
          v18 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18)
          v18 = (unint64_t)sub_24A20A0AC(v18);
        else
          v19 = 0;
        v20 = (char *)(v18 + 4 * v16);
        *(_DWORD *)v20 = v14;
        v15 = v20 + 4;
        while (v10 != v9)
        {
          v21 = *((_DWORD *)v10 - 1);
          v10 -= 4;
          *((_DWORD *)v20 - 1) = v21;
          v20 -= 4;
        }
        v11 = v18 + 4 * v19;
        if (v9)
          operator delete(v9);
        v9 = v20;
      }
      else
      {
        *(_DWORD *)v10 = v14;
        v15 = v10 + 4;
      }
      ++v12;
      v10 = v15;
    }
    while (v12 != a4);
  }
  v22 = v97->_frameCountSinceKeywordDetected + a4;
  v97->_frameCountSinceKeywordDetected = v22;
  v98 = 0;
  v99 = -1;
  -[VATKeywordSpotter configuration](v97, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "decoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postKeywordSilence");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "lookForwardFrames");

  if (v26 <= v22)
  {
    -[VATKeywordSpotter configuration](v97, "configuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "decoder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "postKeywordSilence");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "lookForwardFrames");

    p_keywordResults = &v97->_keywordResults;
    v38 = *((_DWORD *)v97->_keywordResults.__begin_ + 9);
    if (v38 <= 0)
      v39 = -(-v38 & 7);
    else
      v39 = *((_DWORD *)v97->_keywordResults.__begin_ + 9) & 7;
    v40 = 15 - v39;
    if (v37 != 8)
      v40 = v37;
    v41 = v15 - v9;
    v93 = v40;
    floatFstDecoder = (uint64_t)v97->_floatFstDecoder;
    if (v15 == v9)
    {
      v42 = 0;
      v43 = 0;
    }
    else
    {
      if (v41 < 0)
        sub_24A20A098();
      v42 = (char *)sub_24A20A0AC(v41 >> 2);
      memmove(v42, v9, v15 - v9);
      v43 = &v42[4 * (v41 >> 2)];
    }
    -[VATKeywordSpotter configuration](v97, "configuration");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "decoder");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "postKeywordSilence");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "silenceProbability");
    v47 = v46;
    -[VATKeywordSpotter configuration](v97, "configuration");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "decoder");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "postKeywordSilence");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = sub_24A20A0E0(floatFstDecoder, v38, v42, v43, v93, objc_msgSend(v50, "minSilenceFramesExpected"), &v99, &v98, v47);

    if (v42)
      operator delete(v42);
    begin = p_keywordResults->__begin_;
    if (*((char *)p_keywordResults->__begin_ + 23) < 0)
      begin = *(FstSpotterResults **)begin;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", begin, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v94 = objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      _VATLoggingFacility(kVATLogCategoryFramework);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v98);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)MEMORY[0x24BDD16E0];
        -[VATKeywordSpotter configuration](v97, "configuration");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "decoder");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "postKeywordSilence");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "numberWithInteger:", objc_msgSend(v81, "minSilenceFramesExpected"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (void *)MEMORY[0x24BDD16E0];
        -[VATKeywordSpotter configuration](v97, "configuration");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "decoder");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "postKeywordSilence");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "numberWithInteger:", objc_msgSend(v86, "lookForwardFrames"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v94;
        v101 = 2112;
        v102 = v92;
        v103 = 2112;
        v104 = v82;
        v105 = 2112;
        v106 = v87;
        _os_log_debug_impl(&dword_24A12D000, v53, OS_LOG_TYPE_DEBUG, "Enough silence after keyword \"%@\", %@ > %@/%@", buf, 0x2Au);

      }
      v54 = v97;
      v55 = (uint64_t *)&v97->_keywordResults;
      -[VATKeywordSpotter _handleValidResult:](v97, "_handleValidResult:", p_keywordResults);
    }
    else
    {
      -[VATKeywordSpotter configuration](v97, "configuration");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "runtime");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "audioDebug");

      if (v58)
      {
        v59 = v97->_keywordResults.__begin_;
        v60 = *((int *)v59 + 8);
        *(_QWORD *)buf = *((int *)v59 + 9);
        -[FeatureExtractObjc audioForKeywordWithStartFrame:endFrame:actualEndFrame:](v97->fe, "audioForKeywordWithStartFrame:endFrame:actualEndFrame:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[VATKeywordSpotter _handleAudioDebuggingForKeyword:result:buffer:](v97, "_handleAudioDebuggingForKeyword:result:buffer:", v94, v97->_keywordResults.__begin_, v61);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v89 = 0;
      }
      v62 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v98);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)MEMORY[0x24BDD16E0];
      -[VATKeywordSpotter configuration](v97, "configuration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "decoder");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "postKeywordSilence");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "numberWithInteger:", objc_msgSend(v66, "minSilenceFramesExpected"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x24BDD16E0];
      -[VATKeywordSpotter configuration](v97, "configuration");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "decoder");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "postKeywordSilence");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v71, "lookForwardFrames"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("not enough silence after keyword %@ < %@/%@"), v91, v67, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      _VATLoggingFacility(kVATLogCategoryFramework);
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v94;
        v101 = 2112;
        v102 = v73;
        _os_log_impl(&dword_24A12D000, v74, OS_LOG_TYPE_INFO, "Discarding keyword \"%@\", %@", buf, 0x16u);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v75 = v97->_delegate;
        v76 = v97->_keywordResults.__begin_;
        if (*((char *)v76 + 23) < 0)
          v76 = *(FstSpotterResults **)v76;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v76, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[VATKeywordSpotterDelegate keywordDiscarded:failedPreSilence:failedDuringSilence:failedPostSilence:failedSecondPass:secondPassResult:reason:audioURL:](v75, "keywordDiscarded:failedPreSilence:failedDuringSilence:failedPostSilence:failedSecondPass:secondPassResult:reason:audioURL:", v77, 0, 0, 1, 0, 0, v73, v89);

      }
      v54 = v97;
      v55 = (uint64_t *)&v97->_keywordResults;
    }
    v54->_frameCountSinceKeywordDetected = 0;
    sub_24A20A04C(v55);
    v27 = v94;
  }
  else
  {
    _VATLoggingFacility(kVATLogCategoryFramework);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = (void *)MEMORY[0x24BDD16E0];
      -[VATKeywordSpotter configuration](v97, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "decoder");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "postKeywordSilence");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v31, "minSilenceFramesExpected"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      frameCountSinceKeywordDetected = v97->_frameCountSinceKeywordDetected;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v32;
      v101 = 1024;
      LODWORD(v102) = frameCountSinceKeywordDetected;
      _os_log_debug_impl(&dword_24A12D000, v27, OS_LOG_TYPE_DEBUG, "waiting for %@ frames, have only %d", buf, 0x12u);

    }
  }

  if (v9)
    operator delete(v9);

}

- (BOOL)_isDetectionValidForResult:(void *)a3 reason:(id *)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *floatFstDecoder;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int v26;
  float v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  NSObject *v64;
  int v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  int v77;
  id v79;
  _BYTE buf[12];
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v74 = -[VATKeywordSpotter preKeywordSilenceCheckEnabled](self, "preKeywordSilenceCheckEnabled");
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runtime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "duringKeywordSilence");

  -[VATKeywordSpotter configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runtime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "duringKeywordSilence");

  if (v10)
  {
    floatFstDecoder = self->_floatFstDecoder;
    v12 = *((_DWORD *)a3 + 8);
    v13 = *((int *)a3 + 9);
    -[VATKeywordSpotter configuration](self, "configuration");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "decoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "duringKeywordSilence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minPercentageOfNonSilenceFrames");
    v17 = v16;
    -[VATKeywordSpotter configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "decoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duringKeywordSilence");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "silenceProbability");
    v22 = floatFstDecoder[8];
    LODWORD(v23) = v12 - v22;
    v24 = v13 - v22;
    if (v24 >= (int)v23)
    {
      v25 = 0;
      v23 = (int)v23;
      do
      {
        if (*(float *)(*(_QWORD *)(floatFstDecoder[2] + (((floatFstDecoder[5] + v23) >> 7) & 0x1FFFFFFFFFFFFF8))
                      + 4 * ((floatFstDecoder[5] + v23) & 0x3FF)) >= v21)
          ++v25;
        ++v23;
      }
      while (v24 >= v23);
    }
    else
    {
      v25 = 0;
    }
    v27 = (float)(v13 - v12);
    v28 = (int)((float)(v17 * v27) + 0.5);
    v26 = v25 >= v28;

    if (a4 && v25 < v28)
    {
      v29 = (void *)MEMORY[0x24BDD17C8];
      -[VATKeywordSpotter configuration](self, "configuration");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "decoder");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "duringKeywordSilence");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "minPercentageOfNonSilenceFrames");
      objc_msgSend(v29, "stringWithFormat:", CFSTR("speechToSilence ratio %4.2f < %4.2f"), (float)((float)v25 / v27), v32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v26 = 0;
    }
  }
  else
  {
    v26 = v7 ^ 1;
  }
  if (-[VATKeywordSpotter preKeywordSilenceCheckEnabled](self, "preKeywordSilenceCheckEnabled"))
  {
    v68 = v26;
    v33 = self->_floatFstDecoder;
    v34 = *((int *)a3 + 8);
    -[VATKeywordSpotter configuration](self, "configuration");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "decoder");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "preKeywordSilence");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = objc_msgSend(v70, "lookbackFrames");
    -[VATKeywordSpotter configuration](self, "configuration");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "decoder");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "preKeywordSilence");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "minSilenceInLookbackFrames");
    -[VATKeywordSpotter configuration](self, "configuration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "decoder");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "preKeywordSilence");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "silenceProbability");
    v43 = v33[8];
    v44 = v34 - v43;
    if (v34 <= v43)
    {
      v47 = 0;
      v46 = 1;
    }
    else
    {
      if ((int)v35 < 1)
      {
        v45 = 0;
      }
      else
      {
        v45 = 0;
        v35 = v35;
        do
        {
          if (!v44)
            break;
          if (*(float *)(*(_QWORD *)(v33[2] + (((v44 + v33[5]) >> 7) & 0x1FFFFFFFFFFFFF8))
                        + 4 * ((v44 + v33[5]) & 0x3FF)) <= v42)
            ++v45;
          --v44;
          --v35;
        }
        while (v35);
      }
      v47 = (v35 + v45);
      v46 = (int)v47 >= v38;
    }

    if (a4 && (v46 & 1) == 0)
    {
      v48 = (void *)MEMORY[0x24BDD17C8];
      -[VATKeywordSpotter configuration](self, "configuration");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "decoder");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "preKeywordSilence");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "minSilenceInLookbackFrames");
      if (objc_msgSend(*a4, "length"))
        v52 = (const __CFString *)*a4;
      else
        v52 = &stru_251B9F998;
      objc_msgSend(v48, "stringWithFormat:", CFSTR("pre-keyword silence frames %d < %ld. %@"), v47, v51, v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = v68;
  }
  else
  {
    v46 = !v74;
  }
  if (((v46 ^ 1) & 1) != 0 || v26 != 1)
  {
    if (*((char *)a3 + 23) >= 0)
      v53 = a3;
    else
      v53 = *(void **)a3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[VATKeywordSpotter configuration](self, "configuration");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "runtime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "audioDebug");

    if (v57)
    {
      v58 = *((int *)a3 + 8);
      *(_QWORD *)buf = *((int *)a3 + 9);
      -[FeatureExtractObjc audioForKeywordWithStartFrame:endFrame:actualEndFrame:](self->fe, "audioForKeywordWithStartFrame:endFrame:actualEndFrame:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59
        && (-[VATKeywordSpotter configuration](self, "configuration"),
            v60 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v60, "runtime"),
            v61 = (void *)objc_claimAutoreleasedReturnValue(),
            v62 = objc_msgSend(v61, "audioDebug"),
            v61,
            v60,
            v62))
      {
        -[VATKeywordSpotter _handleAudioDebuggingForKeyword:result:buffer:](self, "_handleAudioDebuggingForKeyword:result:buffer:", v54, a3, v59);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = 0;
      }

    }
    else
    {
      v63 = 0;
    }
    _VATLoggingFacility(kVATLogCategoryFramework);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      v66 = *((_DWORD *)a3 + 8);
      v77 = *((_DWORD *)a3 + 9);
      v79 = *a4;
      objc_msgSend(v63, "path");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v54;
      v82 = 1024;
      v83 = v66;
      v84 = 1024;
      v85 = v77;
      v86 = 2112;
      v87 = v79;
      v88 = 2112;
      v89 = v67;
      _os_log_debug_impl(&dword_24A12D000, v64, OS_LOG_TYPE_DEBUG, "Keyword \"%@\" [%d,%d] dismissed. %@, %@", buf, 0x2Cu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[VATKeywordSpotterDelegate keywordDiscarded:failedPreSilence:failedDuringSilence:failedPostSilence:failedSecondPass:secondPassResult:reason:audioURL:](self->_delegate, "keywordDiscarded:failedPreSilence:failedDuringSilence:failedPostSilence:failedSecondPass:secondPassResult:reason:audioURL:", v54, v46 ^ 1u, v26 ^ 1u, 0, 0, 0, *a4, v63);

  }
  return v46 & v26;
}

- (void)_handleValidResult:(void *)a3
{
  _QWORD *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  int v52;
  char v53;
  NSObject *v54;
  void *v55;
  VATKeywordSpotterDelegate *v56;
  VATKeywordSpotterResult *v57;
  double v58;
  double v59;
  VATKeywordSpotterResult *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  char v66;
  VATKeywordSpotterDelegate *delegate;
  uint64_t v68;
  double v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  NSObject *v74;
  void *v75;
  VATKeywordSpotterDelegate *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v87;
  void *v88;
  void *v90;
  id obj;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  uint64_t v99;
  double v100;
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  int v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)a3;
  if (*(char *)(*(_QWORD *)a3 + 23) < 0)
    v3 = (_QWORD *)*v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0.0;
  v4 = *(_DWORD *)(*(_QWORD *)a3 + 32);
  -[VATKeywordSpotter configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioCapture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "leftOfStartFrameOffset");

  v9 = *(_DWORD *)(*(_QWORD *)a3 + 36);
  -[VATKeywordSpotter configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "audioCapture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 + objc_msgSend(v12, "rightOfEndFrameOffset");

  v14 = v13;
  v99 = v13;
  -[VATKeywordSpotter configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "runtime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (v4 - v8);
  if (objc_msgSend(v16, "secondPass"))
  {

  }
  else
  {
    -[VATKeywordSpotter configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "runtime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "audioDebug");

    if (!v19)
    {
      v88 = 0;
LABEL_44:
      obj = 0;
      v87 = 0;
      goto LABEL_45;
    }
  }
  -[FeatureExtractObjc audioForKeywordWithStartFrame:endFrame:actualEndFrame:](self->fe, "audioForKeywordWithStartFrame:endFrame:actualEndFrame:", (int)v85, v14, &v99);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[VATKeywordSpotter configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "runtime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "secondPass");

  if (v87)
    v23 = v22;
  else
    v23 = 1;
  if ((v23 & 1) != 0
    || (-[VATKeywordSpotter configuration](self, "configuration"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "runtime"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_msgSend(v25, "audioDebug"),
        v25,
        v24,
        !v26))
  {
    v88 = 0;
  }
  else
  {
    -[VATKeywordSpotter _handleAudioDebuggingForKeyword:result:buffer:](self, "_handleAudioDebuggingForKeyword:result:buffer:", v90, *(_QWORD *)a3, v87);
    v27 = objc_claimAutoreleasedReturnValue();
    _VATLoggingFacility(kVATLogCategoryFramework);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v102 = v27;
      _os_log_impl(&dword_24A12D000, v28, OS_LOG_TYPE_INFO, "audio %@", buf, 0xCu);
    }

    v88 = (void *)v27;
  }
  -[VATKeywordSpotter configuration](self, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "runtime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "secondPass");

  if (!v31)
  {
    obj = 0;
LABEL_45:
    v55 = 0;
    goto LABEL_46;
  }
  if (!v87)
  {
    _VATLoggingFacility(kVATLogCategoryFramework);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24A12D000, v54, OS_LOG_TYPE_INFO, "No audio for second pass", buf, 2u);
    }

    goto LABEL_44;
  }
  v98 = 0;
  -[VATKeywordSpotter _handleSecondPass:expectedKeyword:duration:secondPassAudio:](self, "_handleSecondPass:expectedKeyword:duration:secondPassAudio:", v87, v90, &v100, &v98);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v98;
  if (v84)
  {
    -[VATKeywordSpotter configuration](self, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "runtime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "audioDebug");

    if (v34)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &unk_24A21FE40);
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v35, objc_msgSend(v84, "length")/ *(_DWORD *)(objc_msgSend(v35, "streamDescription") + 24));
      objc_msgSend(v36, "setFrameLength:", objc_msgSend(v36, "frameCapacity"));
      v37 = objc_msgSend(v36, "frameCapacity");
      *(_DWORD *)(objc_msgSend(v36, "mutableAudioBufferList") + 12) = v37;
      memcpy(*(void **)(objc_msgSend(v36, "mutableAudioBufferList") + 16), (const void *)objc_msgSend(objc_retainAutorelease(v84), "bytes"), 2 * objc_msgSend(v36, "frameCapacity"));
      -[VATKeywordSpotter _handleAudioDebuggingForKeyword:result:buffer:](self, "_handleAudioDebuggingForKeyword:result:buffer:", v90, *(_QWORD *)a3, v36);
      v38 = objc_claimAutoreleasedReturnValue();

      _VATLoggingFacility(kVATLogCategoryFramework);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v38;
        _os_log_impl(&dword_24A12D000, v39, OS_LOG_TYPE_INFO, "audio %@", buf, 0xCu);
      }

      v88 = (void *)v38;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("_[0-9]+$"), 0, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "stringByReplacingMatchesInString:options:range:withTemplate:", v90, 0, 0, objc_msgSend(v90, "length"), &stru_251B9F998);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "lowercaseString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_251B9F998);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_251B9F998);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v82;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
  if (v42)
  {
    v43 = 0;
    v92 = 0;
    v44 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v95 != v44)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend(v46, "lowercaseString");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_251B9F998);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        _VATLoggingFacility(kVATLogCategoryFramework);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v52 = objc_msgSend(v48, "hasPrefix:", v93);
          *(_DWORD *)buf = 138412802;
          v102 = (uint64_t)v93;
          v103 = 2112;
          v104 = v48;
          v105 = 1024;
          v106 = v52;
          _os_log_debug_impl(&dword_24A12D000, v49, OS_LOG_TYPE_DEBUG, "\"%@\" is prefix of \"%@\" = %d", buf, 0x1Cu);
        }

        if (objc_msgSend(v48, "hasPrefix:", v93))
        {
          v50 = v46;

          _VATLoggingFacility(kVATLogCategoryFramework);
          v51 = objc_claimAutoreleasedReturnValue();
          v43 = 1;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v102 = (uint64_t)v50;
            v103 = 2112;
            v104 = v90;
            _os_log_impl(&dword_24A12D000, v51, OS_LOG_TYPE_INFO, "Second pass \"%@\" matches keyword \"%@\", buf, 0x16u);
          }
          v92 = v50;
        }
        else
        {
          _VATLoggingFacility(kVATLogCategoryFramework);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v102 = (uint64_t)v46;
            v103 = 2112;
            v104 = v90;
            _os_log_impl(&dword_24A12D000, v51, OS_LOG_TYPE_INFO, "Second pass \"%@\" doesn't match keyword \"%@\", buf, 0x16u);
          }
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    }
    while (v42);

    if ((v43 & 1) != 0)
    {
      v53 = 0;
      goto LABEL_64;
    }
    v73 = v92;
  }
  else
  {

    v73 = 0;
  }
  v92 = v73;
  _VATLoggingFacility(kVATLogCategoryFramework);
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(obj, "componentsJoinedByString:", CFSTR(","));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v102 = (uint64_t)v75;
    v103 = 2112;
    v104 = v90;
    _os_log_impl(&dword_24A12D000, v74, OS_LOG_TYPE_INFO, "Second pass \"%@\" doesn't match keyword \"%@\", buf, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v76 = self->_delegate;
    objc_msgSend(obj, "componentsJoinedByString:", CFSTR(","));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(obj, "componentsJoinedByString:", CFSTR(","));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "stringWithFormat:", CFSTR("\"%@\" vs \"%@\" mismatch"), v90, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[VATKeywordSpotterDelegate keywordDiscarded:failedPreSilence:failedDuringSilence:failedPostSilence:failedSecondPass:secondPassResult:reason:audioURL:](v76, "keywordDiscarded:failedPreSilence:failedDuringSilence:failedPostSilence:failedSecondPass:secondPassResult:reason:audioURL:", v90, 0, 0, 0, 1, v77, v80, v88);

  }
  v53 = 1;
LABEL_64:

  v55 = v92;
  if ((v53 & 1) != 0)
    goto LABEL_65;
LABEL_46:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v56 = self->_delegate;
    v57 = [VATKeywordSpotterResult alloc];
    LODWORD(v58) = *(_DWORD *)(*(_QWORD *)a3 + 24);
    LODWORD(v59) = *(_DWORD *)(*(_QWORD *)a3 + 56);
    v60 = -[VATKeywordSpotterResult initWithKeyword:cost:threshold:start:end:duration:](v57, "initWithKeyword:cost:threshold:start:end:duration:", v90, *(unsigned int *)(*(_QWORD *)a3 + 32), *(unsigned int *)(*(_QWORD *)a3 + 36), *(unsigned int *)(*(_QWORD *)a3 + 52), v58, v59);
    -[VATKeywordSpotterResult setAudioFileURL:](v60, "setAudioFileURL:", v88);
    -[VATKeywordSpotter configuration](self, "configuration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "runtime");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "secondPass");

    if (v63)
    {
      -[VATKeywordSpotterResult setSecondPassResult:](v60, "setSecondPassResult:", v55);
      -[VATKeywordSpotterResult setSecondPassDuration:](v60, "setSecondPassDuration:", v100);
    }
    -[VATKeywordSpotter configuration](self, "configuration");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "runtime");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v65, "secondPass"))
    {

    }
    else
    {
      -[VATKeywordSpotter configuration](self, "configuration");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "runtime");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "audioDebug");

      if (!v72)
      {
LABEL_56:
        -[VATKeywordSpotterDelegate keywordSpotted:nbestResults:filePath:fileByteCount:fileDuration:](v56, "keywordSpotted:nbestResults:filePath:fileByteCount:fileDuration:", v60, 0, self->_filePath, self->_fileByteCount, self->_fileCurrentDuration);

        goto LABEL_65;
      }
    }
    -[VATKeywordSpotterResult setAudioStart:](v60, "setAudioStart:", v85);
    -[VATKeywordSpotterResult setAudioEnd:](v60, "setAudioEnd:", v99);
    -[VATKeywordSpotterResult setAudioDuration:](v60, "setAudioDuration:", (double)objc_msgSend(v87, "frameLength") / 16000.0);
    goto LABEL_56;
  }
  v66 = objc_opt_respondsToSelector();
  delegate = self->_delegate;
  v68 = *(_QWORD *)a3;
  v69 = *(float *)(*(_QWORD *)a3 + 24);
  if ((v66 & 1) != 0)
    -[VATKeywordSpotterDelegate keywordSpotted:cost:threshold:start:end:](delegate, "keywordSpotted:cost:threshold:start:end:", v90, *(unsigned int *)(v68 + 32), *(unsigned int *)(v68 + 36), v69, *(float *)(v68 + 56));
  else
    -[VATKeywordSpotterDelegate keywordSpotted:cost:start:end:](delegate, "keywordSpotted:cost:start:end:", v90, *(unsigned int *)(v68 + 32), *(unsigned int *)(v68 + 36), v69);
LABEL_65:

}

- (id)_handleAudioDebuggingForKeyword:(id)a3 result:(void *)a4 buffer:(id)a5
{
  id v8;
  id v9;
  FeatureExtractObjc *fe;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  fe = self->fe;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), *((float *)a4 + 6));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FeatureExtractObjc saveAudioBufferToFileWithPcmBuffer:keyword:score:duration:](fe, "saveAudioBufferToFileWithPcmBuffer:keyword:score:duration:", v9, v8, v11, *((unsigned int *)a4 + 13));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_replaceModelPathWithAbsolutePathForTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FeatureExtractObjc configuration](self->fe, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_replaceModelPathWithCustomModelPathForTestWithPrefix:", v4);

  -[FeatureExtractObjc configuration](self->fe, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_thresholdsForAllPhrases
{
  id v3;
  char *next;
  _QWORD *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  next = (char *)self->_phraseThresholds.__table_.__p1_.__value_.__next_;
  while (next)
  {
    v5 = next + 16;
    if (next[39] < 0)
      v5 = (_QWORD *)*v5;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = *((_DWORD *)next + 10);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v8, v6);

    next = *(char **)next;
  }
  return v3;
}

- (void).cxx_destruct
{
  vector<voiceactions::FstSpotterResults, std::allocator<voiceactions::FstSpotterResults>> *p_keywordResults;

  p_keywordResults = &self->_keywordResults;
  sub_24A209F90((void ***)&p_keywordResults);
  objc_storeStrong((id *)&self->_filePath, 0);
  sub_24A209FD0((uint64_t)&self->_phraseThresholds);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->fe, 0);
  objc_storeStrong((id *)&self->_keywordsWithPhonemes, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

+ (id)pronounciationsFor:(id)a3 wordSeparator:(id)a4
{
  +[VATKeywordSpotter pronounciationsFor:wordSeparator:prefixWithPhrase:](VATKeywordSpotter, "pronounciationsFor:wordSeparator:prefixWithPhrase:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)pronounciationsFor:(id)a3 wordSeparator:(id)a4 prefixWithPhrase:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  G2PFactoredObjc *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v20 = objc_alloc_init(G2PFactoredObjc);
  -[G2PFactoredObjc setup](v20, "setup");
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v18;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend(v7, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if ((v14 & 1) == 0)
        {
          -[G2PFactoredObjc getPhrasePronounciationWithPhrase:wordSep:prefixWithPhrase:](v20, "getPhrasePronounciationWithPhrase:wordSep:prefixWithPhrase:", v12, v19, v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v12);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  return v7;
}

@end
