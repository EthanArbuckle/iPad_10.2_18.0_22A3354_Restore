@implementation CSVTUITwoPassKeywordDetector

- (CSVTUITwoPassKeywordDetector)initWithAsset:(id)a3 supportMph:(BOOL)a4
{
  id v6;
  CSVTUITwoPassKeywordDetector *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CSKeywordAnalyzerNDAPI *keywordAnalyzer;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  float v15;
  void *v16;
  CSPhraseDetector *v17;
  CSPhraseDetector *phraseDetector;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  id v25;
  int v26;
  int v27;
  int v28;
  double v29;
  double v30;
  uint64_t v31;
  CSAudioCircularBuffer *audioBuffer;
  CSVTUITwoPassKeywordDetector *v33;
  NSObject *v34;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CSVTUITwoPassKeywordDetector;
  v7 = -[CSVTUITwoPassKeywordDetector init](&v36, sel_init);
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "resourcePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("config_1st.txt"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE28450]), "initWithConfigPath:resourcePath:", v9, v8);
      keywordAnalyzer = v7->_keywordAnalyzer;
      v7->_keywordAnalyzer = (CSKeywordAnalyzerNDAPI *)v10;

      v12 = *MEMORY[0x24BE28368];
      v13 = *MEMORY[0x24BE28368];
      if (v7->_keywordAnalyzer)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "-[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]";
          v39 = 2112;
          v40 = v9;
          _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Initialized with config path: %@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BE284A8], "decodeConfigFrom:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "threshold");
        v7->_keywordThreshold = v15;
        objc_msgSend(MEMORY[0x24BE284B0], "decodeConfigFrom:forFirstPassSource:", v6, 10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (CSPhraseDetector *)objc_alloc_init(MEMORY[0x24BE28468]);
        phraseDetector = v7->_phraseDetector;
        v7->_phraseDetector = v17;

        -[CSPhraseDetector setConfig:](v7->_phraseDetector, "setConfig:", v16);
        objc_msgSend(v16, "preTriggerAudioTime");
        v20 = v19;
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
        v7->_extraSamplesAtStart = (unint64_t)(float)(v20 * v21);
        objc_msgSend(v16, "trailingAudioTime");
        v23 = v22;
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
        v7->_analyzerTrailingSamples = (unint64_t)(float)(v23 * v24);
        v25 = objc_alloc(MEMORY[0x24BE28398]);
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingDurationInSecs");
        v27 = v26;
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
        LODWORD(v29) = v28;
        LODWORD(v30) = v27;
        v31 = objc_msgSend(v25, "initWithNumChannels:recordingDuration:samplingRate:", 1, v30, v29);
        audioBuffer = v7->_audioBuffer;
        v7->_audioBuffer = (CSAudioCircularBuffer *)v31;

        v7->_supportsMph = a4;
        -[CSVTUITwoPassKeywordDetector reset](v7, "reset");

        goto LABEL_7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]";
        _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since we cannot initialize NDAPI", buf, 0xCu);
      }

    }
    else
    {
      v34 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]";
        _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since there is no asset available", buf, 0xCu);
      }
    }
    v33 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v33 = v7;
LABEL_14:

  return v33;
}

- (CSVTUITwoPassKeywordDetector)initWithAsset:(id)a3
{
  return -[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:](self, "initWithAsset:supportMph:", a3, 0);
}

- (void)reset
{
  -[CSVTUITwoPassKeywordDetector internalReset](self, "internalReset");
  -[CSAudioCircularBuffer reset](self->_audioBuffer, "reset");
}

- (void)internalReset
{
  CSKeywordAnalyzerNDAPIResult *firstPassResult;

  -[CSKeywordAnalyzerNDAPI reset](self->_keywordAnalyzer, "reset");
  -[CSPhraseDetector reset](self->_phraseDetector, "reset");
  self->_isFirstPassTriggered = 0;
  firstPassResult = self->_firstPassResult;
  self->_firstPassResult = 0;

}

- (id)analyze:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  CSAudioCircularBuffer *audioBuffer;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  id *p_firstPassResult;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t extraSamplesAtStart;
  unint64_t v28;
  void *v29;
  CSAudioCircularBuffer *v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  double v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 / objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingBytesPerFrame");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28390]), "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", v4, 1, v6, 2, -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount"), 0, 0);
  audioBuffer = self->_audioBuffer;
  v9 = objc_retainAutorelease(v4);
  v10 = objc_msgSend(v9, "bytes");

  -[CSAudioCircularBuffer addSamples:numSamples:](audioBuffer, "addSamples:numSamples:", v10, v6);
  if (v7)
  {
    -[CSKeywordAnalyzerNDAPI getBestAnalyzedResultsFromAudioChunk:](self->_keywordAnalyzer, "getBestAnalyzedResultsFromAudioChunk:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!self->_isFirstPassTriggered)
    {
      if (v11)
      {
        objc_msgSend(v11, "bestScore");
        v14 = v13;
        if (v13 >= self->_keywordThreshold)
        {
          p_firstPassResult = (id *)&self->_firstPassResult;
          objc_storeStrong((id *)&self->_firstPassResult, v12);
          self->_isFirstPassTriggered = 1;
          v16 = (void *)*MEMORY[0x24BE28368];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
          {
            v17 = *p_firstPassResult;
            v18 = v16;
            v19 = objc_msgSend(v17, "bestStart");
            v20 = objc_msgSend(*p_firstPassResult, "bestEnd");
            v21 = objc_msgSend(*p_firstPassResult, "samplesAtFire");
            *(_DWORD *)buf = 136316162;
            v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
            v71 = 2048;
            v72 = v14;
            v73 = 2048;
            v74 = v19;
            v75 = 2048;
            v76 = v20;
            v77 = 2048;
            v78 = v21;
            _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s FirstPass triggered, score %f start %lu end %lu fire %lu", buf, 0x34u);

          }
        }
      }
    }
    if (self->_firstPassResult)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[CSKeywordAnalyzerNDAPIResult bestStart](self->_firstPassResult, "bestStart");
      v26 = -[CSKeywordAnalyzerNDAPIResult samplesAtFire](self->_firstPassResult, "samplesAtFire");
      extraSamplesAtStart = self->_extraSamplesAtStart;
      v28 = self->_analyzerTrailingSamples + v26;
      if (-[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount") >= v28)
      {
        if (v25 >= extraSamplesAtStart)
          v33 = v25 - extraSamplesAtStart;
        else
          v33 = 0;
        v34 = (void *)-[CSAudioCircularBuffer copySamplesFrom:to:](self->_audioBuffer, "copySamplesFrom:to:", v33, v28);
        v35 = (id)-[CSPhraseDetector getAnalyzedResultFromAudioChunk:](self->_phraseDetector, "getAnalyzedResultFromAudioChunk:", v34);
        v36 = objc_msgSend(v34, "numSamples");
        v37 = v28 - v33;
        v38 = *MEMORY[0x24BE28368];
        if (v36 != v37 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
        {
          v66 = v38;
          v67 = objc_msgSend(v34, "numSamples");
          *(_DWORD *)buf = 136315650;
          v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          v71 = 2048;
          v72 = *(double *)&v67;
          v73 = 2048;
          v74 = v37;
          _os_log_error_impl(&dword_2117D4000, v66, OS_LOG_TYPE_ERROR, "%s numSamplesinAudioChunk %lu not matching requiredNumSamples %lu !", buf, 0x20u);

          v38 = *MEMORY[0x24BE28368];
        }
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = v38;
          v40 = objc_msgSend(v34, "numSamples");
          *(_DWORD *)buf = 136315394;
          v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          v71 = 2048;
          v72 = *(double *)&v40;
          _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s Second pass set to analyze %lu samples, stop feeding", buf, 0x16u);

        }
        -[CSPhraseDetector getAnalyzedResultFromFlushedAudio](self->_phraseDetector, "getAnalyzedResultFromFlushedAudio");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "ndapiResult");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v42, "bestStart"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v43, *MEMORY[0x24BE285D8]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v42, "bestEnd"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v44, *MEMORY[0x24BE285B8]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v42, "samplesFed"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v45, *MEMORY[0x24BE285A8]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v42, "samplesAtFire"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v46, *MEMORY[0x24BE285C8]);

        v47 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v41, "combinedScore");
        objc_msgSend(v47, "numberWithFloat:");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v48, *MEMORY[0x24BE285D0]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v41, "phId"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v49, *MEMORY[0x24BE28568]);

        -[CSPhraseDetector phraseDetectorInfoFromPhId:](self->_phraseDetector, "phraseDetectorInfoFromPhId:", objc_msgSend(v41, "phId"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "phraseConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v50, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v52, *MEMORY[0x24BE28560]);

        }
        if (objc_msgSend(v41, "isRunningQuasar"))
        {
          v53 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v41, "recognizerScore");
          objc_msgSend(v53, "numberWithFloat:");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v54, *MEMORY[0x24BE28590]);

          v55 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v50, "recognizerScoreOffset");
          objc_msgSend(v55, "numberWithFloat:");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v56, *MEMORY[0x24BE28598]);

          v57 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v50, "recognizerScoreScaleFactor");
          objc_msgSend(v57, "numberWithFloat:");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v58, *MEMORY[0x24BE28588]);

        }
        v59 = objc_msgSend(v41, "decision") == 1;
        if (!self->_supportsMph)
        {
          if (objc_msgSend(v41, "phId"))
          {
            v65 = *MEMORY[0x24BE28368];
            v59 = 0;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
              _os_log_impl(&dword_2117D4000, v65, OS_LOG_TYPE_DEFAULT, "%s Report as rejection since the detected phId is not the default", buf, 0xCu);
              v59 = 0;
            }
          }
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v60, *MEMORY[0x24BE28580]);

        v61 = (void *)*MEMORY[0x24BE28368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
        {
          v62 = v61;
          objc_msgSend(v41, "description");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          v71 = 2112;
          v72 = *(double *)&v63;
          _os_log_impl(&dword_2117D4000, v62, OS_LOG_TYPE_DEFAULT, "%s Phrase detector result: %@", buf, 0x16u);

        }
        -[CSVTUITwoPassKeywordDetector internalReset](self, "internalReset");
        v23 = v24;

      }
      else
      {
        v29 = (void *)*MEMORY[0x24BE28368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_audioBuffer;
          v31 = v29;
          v32 = -[CSAudioCircularBuffer sampleCount](v30, "sampleCount");
          *(_DWORD *)buf = 136315650;
          v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          v71 = 2048;
          v72 = *(double *)&v32;
          v73 = 2048;
          v74 = v28;
          _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s Waiting for the entire audio... samplesInBuffer %lu triggerSampleFedCount %lu", buf, 0x20u);

        }
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v22 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v70 = "-[CSVTUITwoPassKeywordDetector analyze:]";
      _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s Unable to create audio chunk, not feeding to analyzer", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)triggeredUtterance:(id)a3
{
  void *v4;
  unsigned int v5;
  unint64_t extraSamplesAtStart;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE285D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  extraSamplesAtStart = self->_extraSamplesAtStart;
  if (extraSamplesAtStart <= v5)
    v7 = v5 - extraSamplesAtStart;
  else
    v7 = 0;
  v8 = (void *)-[CSAudioCircularBuffer copySamplesFrom:to:](self->_audioBuffer, "copySamplesFrom:to:", -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount")- -[CSVTUITwoPassKeywordDetector _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", v7, -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount")), -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount"));
  objc_msgSend(v8, "dataForChannel:", objc_msgSend(MEMORY[0x24BE283F0], "channelForProcessedInput"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4
{
  unsigned int v4;

  v4 = -a3;
  if (a3 > a4)
    v4 = ~a3;
  return v4 + a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPassResult, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_phraseDetector, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
}

@end
