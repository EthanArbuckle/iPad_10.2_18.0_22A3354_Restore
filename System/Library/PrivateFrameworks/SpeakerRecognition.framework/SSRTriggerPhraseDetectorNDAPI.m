@implementation SSRTriggerPhraseDetectorNDAPI

- (SSRTriggerPhraseDetectorNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4 phId:(unint64_t)a5
{
  id v8;
  id v9;
  SSRTriggerPhraseDetectorNDAPI *v10;
  os_log_t *v11;
  NSObject *v12;
  int v13;
  int v14;
  os_log_t v15;
  SSRTriggerPhraseDetectorNDAPI *v16;
  NSObject *v18;
  uint64_t v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  _BYTE v24[18];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SSRTriggerPhraseDetectorNDAPI;
  v10 = -[SSRTriggerPhraseDetectorNDAPI init](&v20, sel_init);
  if (!v10)
    goto LABEL_8;
  v10->_novDetect = (void *)nd_create();
  v10->_phId = a5;
  v11 = (os_log_t *)MEMORY[0x24BE284B8];
  v12 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:]";
    v23 = 2114;
    *(_QWORD *)v24 = v8;
    *(_WORD *)&v24[8] = 2114;
    *(_QWORD *)&v24[10] = v9;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Initializing NDAPI using %{public}@, %{public}@", buf, 0x20u);
  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  objc_msgSend(objc_retainAutorelease(v9), "cStringUsingEncoding:", 4);
  v13 = nd_initialize();
  if (v13)
  {
    v14 = v13;
    v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v18 = v15;
      v19 = nd_error();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:]";
      v23 = 1026;
      *(_DWORD *)v24 = v14;
      *(_WORD *)&v24[4] = 2082;
      *(_QWORD *)&v24[6] = v19;
      _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s Failed to initialize NDAPI: err=[%{public}d]:%{public}s", buf, 0x1Cu);

    }
    v16 = 0;
  }
  else
  {
LABEL_8:
    v16 = v10;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SSRTriggerPhraseDetectorNDAPI;
  -[SSRTriggerPhraseDetectorNDAPI dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  nd_reset();
}

- (id)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  uint64_t v5;
  unsigned int *v6;
  SSRTriggerPhraseDetectorNDAPIResult *v7;
  double v8;

  objc_msgSend(objc_retainAutorelease(a3), "bytes");
  nd_wavedata();
  if (self->_novDetect
    && ((int)nd_phrasecount() < 1 ? (v5 = nd_getresults()) : (v5 = nd_getphraseresults()),
        (v6 = (unsigned int *)v5) != 0))
  {
    v7 = objc_alloc_init(SSRTriggerPhraseDetectorNDAPIResult);
    -[SSRTriggerPhraseDetectorNDAPIResult setPhId:](v7, "setPhId:", self->_phId);
    -[SSRTriggerPhraseDetectorNDAPIResult setSamplesFed:](v7, "setSamplesFed:", *v6);
    -[SSRTriggerPhraseDetectorNDAPIResult setBestPhrase:](v7, "setBestPhrase:", v6[3]);
    -[SSRTriggerPhraseDetectorNDAPIResult setBestStart:](v7, "setBestStart:", v6[1]);
    -[SSRTriggerPhraseDetectorNDAPIResult setBestEnd:](v7, "setBestEnd:", v6[2]);
    LODWORD(v8) = v6[4];
    -[SSRTriggerPhraseDetectorNDAPIResult setBestScore:](v7, "setBestScore:", v8);
    -[SSRTriggerPhraseDetectorNDAPIResult setIsEarlyWarning:](v7, "setIsEarlyWarning:", *((unsigned __int8 *)v6 + 20));
    -[SSRTriggerPhraseDetectorNDAPIResult setIsRescoring:](v7, "setIsRescoring:", *((unsigned __int8 *)v6 + 21));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  unsigned int *novDetect;

  novDetect = (unsigned int *)self->_novDetect;
  if (novDetect)
  {
    novDetect = (unsigned int *)nd_getsupervector();
    if (novDetect)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)novDetect, 4 * novDetect[2]);
      novDetect = (unsigned int *)objc_claimAutoreleasedReturnValue();
    }
  }
  return novDetect;
}

@end
