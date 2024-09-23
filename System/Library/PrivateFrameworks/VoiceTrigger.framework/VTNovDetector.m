@implementation VTNovDetector

- (VTNovDetector)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  VTNovDetector *v8;
  IntNovDetect *novDetect;
  NSObject *v10;
  void *v11;
  VTNovDetector *v12;
  void *v14;
  NSObject *v15;
  const char *v16;
  objc_super v17;
  uint8_t buf[4];
  _BYTE v19[18];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VTNovDetector;
  v8 = -[VTNovDetector init](&v17, sel_init);
  if (!v8)
    goto LABEL_9;
  if ((initndlib(void)::bNDLibInitialized & 1) == 0)
    initndlib(void)::bNDLibInitialized = 1;
  novDetect = (IntNovDetect *)operator new();
  IntNovDetect::IntNovDetect(novDetect);
  v8->_novDetect = novDetect;
  v10 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v19 = v6;
    *(_WORD *)&v19[8] = 2114;
    *(_QWORD *)&v19[10] = v7;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Initializing NDAPI using %{public}@, %{public}@", buf, 0x16u);
    novDetect = (IntNovDetect *)v8->_novDetect;
  }
  if (nd_initialize(novDetect, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4)))
  {
    v11 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v14 = v8->_novDetect;
      v15 = v11;
      if (v14)
      {
        if (*((_DWORD *)v14 + 1) == 2 || *(_DWORD *)v14 != -1838836561)
          v16 = "Invalid NovDetect object";
        else
          v16 = (const char *)*((_QWORD *)v14 + 4);
      }
      else
      {
        v16 = "Invalid NovDetect pointer (NULL)";
      }
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v19 = -1;
      *(_WORD *)&v19[4] = 2082;
      *(_QWORD *)&v19[6] = v16;
      _os_log_error_impl(&dword_20D965000, v15, OS_LOG_TYPE_ERROR, "Failed to initialize NDAPI: err=[%{public}d]:%{public}s", buf, 0x12u);

    }
    v12 = 0;
  }
  else
  {
LABEL_9:
    v12 = v8;
  }

  return v12;
}

- (void)dealloc
{
  IntNovDetect *novDetect;
  objc_super v4;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    IntNovDetect::~IntNovDetect(novDetect);
    MEMORY[0x212BAC9D8]();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VTNovDetector;
  -[VTNovDetector dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  nd_reset((IntNovDetect *)self->_novDetect, a2);
}

- (void)resetBest
{
  nd_resetbest((IntNovDetect *)self->_novDetect, a2);
}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  nd_wavedata((IntNovDetect *)self->_novDetect, (const char *)objc_msgSend(objc_retainAutorelease(a3), "bytes"), a4);
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
  nd_wavedataf((IntNovDetect *)self->_novDetect, (const float *)objc_msgSend(objc_retainAutorelease(a3), "bytes"), a4);
}

- (unsigned)numResultsAvailable
{
  return nd_phrasecount((uint64_t)self->_novDetect, a2);
}

- (id)getAnalyzedResultForPhId:(unsigned int)a3
{
  void *novDetect;
  const char *v5;
  const char *v6;
  int v7;
  char *v8;
  char *v9;

  novDetect = self->_novDetect;
  if (novDetect)
  {
    v5 = *(const char **)&a3;
    v7 = nd_phrasecount((uint64_t)novDetect, a2);
    v8 = (char *)self->_novDetect;
    if (v7 < 1)
      v9 = nd_getresults(v8, v6);
    else
      v9 = nd_getphraseresults(v8, v5);
    -[VTNovDetector _getAnalyzedResultFromNdresult:](self, "_getAnalyzedResultFromNdresult:", v9);
    novDetect = (void *)objc_claimAutoreleasedReturnValue();
  }
  return novDetect;
}

- (id)getBestAnalyzedResult
{
  char *novDetect;

  novDetect = (char *)self->_novDetect;
  if (novDetect)
  {
    -[VTNovDetector _getAnalyzedResultFromNdresult:](self, "_getAnalyzedResultFromNdresult:", nd_getresults(novDetect, a2));
    novDetect = (char *)objc_claimAutoreleasedReturnValue();
  }
  return novDetect;
}

- (id)_getAnalyzedResultFromNdresult:(_ndresult *)a3
{
  VTNovDetectorResult *v4;
  double v5;

  if (a3)
  {
    v4 = objc_alloc_init(VTNovDetectorResult);
    -[VTNovDetectorResult setSampleFed:](v4, "setSampleFed:", a3->var0);
    -[VTNovDetectorResult setBestPhrase:](v4, "setBestPhrase:", a3->var3);
    -[VTNovDetectorResult setBestStart:](v4, "setBestStart:", a3->var1);
    -[VTNovDetectorResult setBestEnd:](v4, "setBestEnd:", a3->var2);
    *(float *)&v5 = a3->var4;
    -[VTNovDetectorResult setBestScore:](v4, "setBestScore:", v5);
    -[VTNovDetectorResult setEarlyWarning:](v4, "setEarlyWarning:", a3->var5);
    -[VTNovDetectorResult setIsRescoring:](v4, "setIsRescoring:", a3->var6);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  double v3;
  char *novDetect;

  novDetect = (char *)self->_novDetect;
  if (novDetect)
  {
    novDetect = nd_getsupervector(novDetect, (const char *)a3, v3);
    if (novDetect)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)novDetect, 4 * *((unsigned int *)novDetect + 2));
      novDetect = (char *)objc_claimAutoreleasedReturnValue();
    }
  }
  return novDetect;
}

- (id)getOptionValue:(id)a3
{
  void *v4;
  IntNovDetect *novDetect;

  v4 = 0;
  if (a3)
  {
    novDetect = (IntNovDetect *)self->_novDetect;
    if (novDetect)
    {
      v4 = nd_getoption(novDetect, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

@end
