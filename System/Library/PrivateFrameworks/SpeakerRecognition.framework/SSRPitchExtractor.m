@implementation SSRPitchExtractor

- (SSRPitchExtractor)initWithAsset:(id)a3
{
  id v4;
  SSRPitchExtractor *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  int v12;
  id v13;
  float v14;
  uint64_t v15;
  EARAudioResultsGenerator *resultsGenerator;
  SSRPitchExtractor *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SSRPitchExtractor;
  v5 = -[SSRPitchExtractor init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "resourcePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("pitchExtractorConfigFile.json"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SSRPitchExtractor initWithAsset:]";
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset pitch config path: %{public}@", buf, 0x16u);
    }
    v9 = dispatch_queue_create("SSR Pitch Extraction Queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v7);

    if (!v12)
    {

      v17 = 0;
      goto LABEL_8;
    }
    v13 = objc_alloc(MEMORY[0x24BE2E6C8]);
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v15 = objc_msgSend(v13, "initWithConfigFile:configRoot:sampleRate:delegate:queue:", v7, CFSTR("spid"), (unint64_t)v14, v5, v5->_queue);
    resultsGenerator = v5->_resultsGenerator;
    v5->_resultsGenerator = (EARAudioResultsGenerator *)v15;

  }
  v17 = v5;
LABEL_8:

  return v17;
}

- (void)_processAudioFileURL:(id)a3
{
  EARAudioResultsGenerator *resultsGenerator;
  id v5;
  _QWORD v6[5];
  _BYTE v7[40];

  resultsGenerator = self->_resultsGenerator;
  v5 = a3;
  -[EARAudioResultsGenerator resetForNewRequest](resultsGenerator, "resetForNewRequest");
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__SSRPitchExtractor__processAudioFileURL___block_invoke;
  v6[3] = &unk_24CC86688;
  v6[4] = self;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", v5, v7, 640, v6);

}

- (float)getPitchForUtteranceAudioFiles:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  float v10;
  float v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  float v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    v9 = (os_log_t *)MEMORY[0x24BE284B8];
    v10 = 0.0;
    *(_QWORD *)&v6 = 136315394;
    v18 = v6;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v24 = "-[SSRPitchExtractor getPitchForUtteranceAudioFiles:]";
          v25 = 2112;
          v26 = v13;
          _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Starting to extract pitch from URL: %@", buf, 0x16u);
        }
        -[SSRPitchExtractor _processAudioFileURL:](self, "_processAudioFileURL:", v13, v18);
        -[EARAudioResultsGenerator audioResultMatrix](self->_resultsGenerator, "audioResultMatrix");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRPitchExtractor _getVoicingWeightedPitchForResultMatrix:](self, "_getVoicingWeightedPitchForResultMatrix:", v15);
        v11 = v11 + v16;
        v10 = v10 + 1.0;

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  if (v10 <= 0.000001)
    v10 = 1.0;

  return v11 / v10;
}

- (float)_getVoicingWeightedPitchForResultMatrix:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  double v13;
  float v14;
  NSObject *v15;
  float v16;
  float v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "audioResultMat");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "bytes");

  if (v6)
  {
    if (objc_msgSend(v4, "audioResultsNumVectors"))
    {
      v7 = 0;
      v8 = 0.0;
      v9 = 0.0;
      do
      {
        LODWORD(v10) = *(_DWORD *)(v6 + 4 * objc_msgSend(v4, "audioResultsVectorSize") * v7 + 92);
        -[SSRPitchExtractor _getVoicingProbFromRawData:](self, "_getVoicingProbFromRawData:", v10);
        v12 = v11;
        LODWORD(v13) = *(_DWORD *)(v6 + 4 * objc_msgSend(v4, "audioResultsVectorSize") * v7 + 96);
        -[SSRPitchExtractor _getPitchHzFromRawData:](self, "_getPitchHzFromRawData:", v13);
        v8 = v8 + (float)(v12 * v14);
        v9 = v9 + v12;
        ++v7;
        objc_msgSend(v4, "audioResultsVectorSize");
      }
      while (v7 < objc_msgSend(v4, "audioResultsNumVectors"));
    }
    else
    {
      v9 = 0.0;
      v8 = 0.0;
    }
    v17 = 1.0;
    if (v9 > 0.000001)
      v17 = v9;
    v16 = v8 / v17;
  }
  else
  {
    v15 = *MEMORY[0x24BE284B8];
    v16 = -10000.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[SSRPitchExtractor _getVoicingWeightedPitchForResultMatrix:]";
      _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s Got unexpected empty result matrix!!", (uint8_t *)&v19, 0xCu);
    }
  }

  return v16;
}

- (float)_getVoicingProbFromRawData:(float)a3
{
  float v3;
  float v4;
  float v5;
  double v6;
  float v7;
  float v8;

  v3 = a3 * 0.5 + 1.0;
  v4 = 1.0001 - powf(v3, 6.6667);
  v5 = fabsf(v4);
  v6 = expf((float)(v5 + -1.0) * 7.5) * 5.4 + -5.2 + v5 * 4.8;
  v7 = expf(v5 * -10.0);
  v8 = v6 - (float)(v7 + v7) + expf((float)(v5 + -1.0) * 20.0) * 4.2;
  return 1.0 / (float)(expf(-v8) + 1.0);
}

- (EARAudioResultsGenerator)resultsGenerator
{
  return self->_resultsGenerator;
}

- (void)setResultsGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_resultsGenerator, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resultsGenerator, 0);
}

void __42__SSRPitchExtractor__processAudioFileURL___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  void *v8;

  v7 = a4;
  if (!v7)
  {
    if (a3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "endAudio");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addAudio:", v8);

    }
    v7 = 0;
  }

}

@end
