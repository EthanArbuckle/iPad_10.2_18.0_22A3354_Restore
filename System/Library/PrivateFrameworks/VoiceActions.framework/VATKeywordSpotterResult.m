@implementation VATKeywordSpotterResult

- (VATKeywordSpotterResult)initWithKeyword:(id)a3 cost:(float)a4 threshold:(float)a5 start:(int)a6 end:(int)a7 duration:(int)a8
{
  id v15;
  VATKeywordSpotterResult *v16;
  VATKeywordSpotterResult *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VATKeywordSpotterResult;
  v16 = -[VATKeywordSpotterResult init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_keywordText, a3);
    v17->_threshold = a5;
    v17->_cost = a4;
    v17->_start = a6;
    v17->_end = a7;
    v17->_duration = a8;
  }

  return v17;
}

- (id)toJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSURL *audioFileURL;
  __CFString *v15;
  void *v16;
  double secondPassDuration;
  const __CFString *secondPassResult;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[6];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v34[0] = self->_keywordText;
  v33[0] = CFSTR("keyword");
  v33[1] = CFSTR("threshold");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%5.3f"), self->_threshold);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v4;
  v33[2] = CFSTR("cost");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%5.3f"), self->_cost);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v5;
  v33[3] = CFSTR("start");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_start);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v6;
  v33[4] = CFSTR("end");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_end);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v7;
  v33[5] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_duration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->__isNbestEntry)
  {
    if (self->_audioFileURL)
    {
      v31[0] = CFSTR("audioStart");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_audioStart);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v11;
      v31[1] = CFSTR("audioEnd");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_audioEnd);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v12;
      v31[2] = CFSTR("audioDuration");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%5.3f"), *(_QWORD *)&self->_audioDuration);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v13;
      v31[3] = CFSTR("audioFileURL");
      audioFileURL = self->_audioFileURL;
      if (audioFileURL)
      {
        -[NSURL path](self->_audioFileURL, "path");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = &stru_251B9F998;
      }
      v32[3] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (audioFileURL)

      objc_msgSend(v10, "addEntriesFromDictionary:", v16);
    }
    secondPassDuration = self->_secondPassDuration;
    if (secondPassDuration > 0.0)
    {
      if (self->_secondPassResult)
        secondPassResult = (const __CFString *)self->_secondPassResult;
      else
        secondPassResult = CFSTR("<nil>");
      v29[0] = CFSTR("secondPassResult");
      v29[1] = CFSTR("secondPassDuration");
      v30[0] = secondPassResult;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%5.3f"), *(_QWORD *)&secondPassDuration);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addEntriesFromDictionary:", v20);
    }
  }
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 11, &v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v26;
  if (v21)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v21, 4);
  }
  else
  {
    _VATLoggingFacility(kVATLogCategoryFramework);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v22;
      _os_log_error_impl(&dword_24A12D000, v24, OS_LOG_TYPE_ERROR, "Error serializing VATKeywordSpotterResult: %@", buf, 0xCu);
    }

    v23 = 0;
  }

  return v23;
}

- (NSString)keyword
{
  return self->_keywordText;
}

- (void)setKeyword:(id)a3
{
  objc_storeStrong((id *)&self->_keywordText, a3);
}

- (id)description
{
  return (id)MEMORY[0x24BEDD108](self, sel_toJSON);
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)cost
{
  return self->_cost;
}

- (void)setCost:(float)a3
{
  self->_cost = a3;
}

- (int)start
{
  return self->_start;
}

- (void)setStart:(int)a3
{
  self->_start = a3;
}

- (int)end
{
  return self->_end;
}

- (void)setEnd:(int)a3
{
  self->_end = a3;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  self->_duration = a3;
}

- (int)audioStart
{
  return self->_audioStart;
}

- (void)setAudioStart:(int)a3
{
  self->_audioStart = a3;
}

- (int)audioEnd
{
  return self->_audioEnd;
}

- (void)setAudioEnd:(int)a3
{
  self->_audioEnd = a3;
}

- (double)audioDuration
{
  return self->_audioDuration;
}

- (void)setAudioDuration:(double)a3
{
  self->_audioDuration = a3;
}

- (NSString)secondPassResult
{
  return self->_secondPassResult;
}

- (void)setSecondPassResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)secondPassDuration
{
  return self->_secondPassDuration;
}

- (void)setSecondPassDuration:(double)a3
{
  self->_secondPassDuration = a3;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)_isNbestEntry
{
  return self->__isNbestEntry;
}

- (void)set_isNbestEntry:(BOOL)a3
{
  self->__isNbestEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_secondPassResult, 0);
  objc_storeStrong((id *)&self->_keywordText, 0);
}

@end
