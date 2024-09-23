@implementation SVXSpeechSynthesisContext

- (void)dealloc
{
  objc_super v3;

  -[SVXSpeechSynthesisContext finalizeWithResultType:utteranceInfo:error:](self, "finalizeWithResultType:utteranceInfo:error:", 2, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)SVXSpeechSynthesisContext;
  -[SVXSpeechSynthesisContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t operationType;
  __CFString *v6;
  __CFString *v7;
  SVXSpeechSynthesisRequest *request;
  NSString *languageCode;
  unint64_t gender;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)SVXSpeechSynthesisContext;
  -[SVXSpeechSynthesisContext description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  operationType = self->_operationType;
  if (operationType > 2)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_24D24C530[operationType];
  v7 = v6;
  request = self->_request;
  languageCode = self->_languageCode;
  gender = self->_gender;
  if (gender > 3)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_24D24C478[gender];
  v12 = v11;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {operationType = %@, request = %@, languageCode = %@, gender = %@, name = %@, audioSessionID = %u, taskTracker = %@}"), v4, v7, request, languageCode, v12, self->_voiceName, self->_audioSessionID, self->_taskTracker);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SVXSpeechSynthesisContext)initWithOperationType:(int64_t)a3 request:(id)a4 languageCode:(id)a5 voiceName:(id)a6 gender:(int64_t)a7 audioSessionID:(unsigned int)a8 preparation:(id)a9 audioChunkHandler:(id)a10 finalization:(id)a11 taskTracker:(id)a12 analyticsContext:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SVXSpeechSynthesisContext *v24;
  SVXSpeechSynthesisContext *v25;
  uint64_t v26;
  SVXSpeechSynthesisRequest *request;
  uint64_t v28;
  NSString *languageCode;
  uint64_t v30;
  NSString *voiceName;
  uint64_t v32;
  id preparation;
  uint64_t v34;
  id audioChunkHandler;
  uint64_t v36;
  id finalization;
  uint64_t v38;
  NSDictionary *analyticsContext;
  id v43;
  objc_super v44;

  v43 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v44.receiver = self;
  v44.super_class = (Class)SVXSpeechSynthesisContext;
  v24 = -[SVXSpeechSynthesisContext init](&v44, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_operationType = a3;
    v26 = objc_msgSend(v43, "copy");
    request = v25->_request;
    v25->_request = (SVXSpeechSynthesisRequest *)v26;

    v28 = objc_msgSend(v17, "copy");
    languageCode = v25->_languageCode;
    v25->_languageCode = (NSString *)v28;

    v30 = objc_msgSend(v18, "copy");
    voiceName = v25->_voiceName;
    v25->_voiceName = (NSString *)v30;

    v25->_gender = a7;
    v25->_audioSessionID = a8;
    v32 = objc_msgSend(v19, "copy");
    preparation = v25->_preparation;
    v25->_preparation = (id)v32;

    v25->_audioChunkCount = 0;
    v34 = MEMORY[0x2199D950C](v20);
    audioChunkHandler = v25->_audioChunkHandler;
    v25->_audioChunkHandler = (id)v34;

    v36 = objc_msgSend(v21, "copy");
    finalization = v25->_finalization;
    v25->_finalization = (id)v36;

    objc_storeStrong((id *)&v25->_taskTracker, a12);
    v38 = objc_msgSend(v23, "copy");
    analyticsContext = v25->_analyticsContext;
    v25->_analyticsContext = (NSDictionary *)v38;

  }
  return v25;
}

- (void)prepare
{
  void (**preparation)(id, SEL);
  id v4;

  preparation = (void (**)(id, SEL))self->_preparation;
  if (preparation)
  {
    preparation[2](preparation, a2);
    v4 = self->_preparation;
    self->_preparation = 0;

  }
}

- (void)handleAudioChunkData:(id)a3
{
  id v4;
  id audioChunkHandler;
  unint64_t audioChunkCount;
  SVXSpeechSynthesizerAudioData *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  audioChunkCount = self->_audioChunkCount;
  audioChunkHandler = self->_audioChunkHandler;
  self->_audioChunkCount = audioChunkCount + 1;
  if (audioChunkHandler)
  {
    v7 = -[SVXSpeechSynthesizerAudioData initWithAudioChunkData:audioChunkIndex:]([SVXSpeechSynthesizerAudioData alloc], "initWithAudioChunkData:audioChunkIndex:", v4, audioChunkCount);
    (*((void (**)(void))self->_audioChunkHandler + 2))();

  }
  else
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[SVXSpeechSynthesisContext handleAudioChunkData:]";
      _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, "%s AudioChunkData received but no handler is set to take it", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)finalizeWithResultType:(int64_t)a3 utteranceInfo:(id)a4 error:(id)a5
{
  id v8;
  id preparation;
  void (**finalization)(id, SVXSpeechSynthesisResult *);
  SVXSpeechSynthesisResult *v11;
  id v12;
  id v13;

  v13 = a4;
  v8 = a5;
  preparation = self->_preparation;
  if (preparation)
  {
    self->_preparation = 0;

  }
  -[SVXAudioSessionAssertion relinquish](self->_audioSessionAssertion, "relinquish");
  finalization = (void (**)(id, SVXSpeechSynthesisResult *))self->_finalization;
  if (finalization)
  {
    v11 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", a3, v13, v8);
    finalization[2](finalization, v11);

    v12 = self->_finalization;
    self->_finalization = 0;

  }
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (SVXSpeechSynthesisRequest)request
{
  return self->_request;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (int64_t)gender
{
  return self->_gender;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (BOOL)handledPresynthesizedAudioRequest
{
  return self->_handledPresynthesizedAudioRequest;
}

- (void)setHandledPresynthesizedAudioRequest:(BOOL)a3
{
  self->_handledPresynthesizedAudioRequest = a3;
}

- (BOOL)handledSpeechRequest
{
  return self->_handledSpeechRequest;
}

- (void)setHandledSpeechRequest:(BOOL)a3
{
  self->_handledSpeechRequest = a3;
}

- (BOOL)isStreamingSynthesisRequest
{
  return self->_isStreamingSynthesisRequest;
}

- (void)setIsStreamingSynthesisRequest:(BOOL)a3
{
  self->_isStreamingSynthesisRequest = a3;
}

- (SiriTTSAudioRequest)presynthesizedAudioRequest
{
  return self->_presynthesizedAudioRequest;
}

- (void)setPresynthesizedAudioRequest:(id)a3
{
  objc_storeStrong((id *)&self->_presynthesizedAudioRequest, a3);
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequest, a3);
}

- (SiriTTSSynthesisRequest)synthesisRequest
{
  return self->_synthesisRequest;
}

- (void)setSynthesisRequest:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisRequest, a3);
}

- (SiriTTSInstrumentationMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (NSArray)speechWordTimingInfoArray
{
  return self->_speechWordTimingInfoArray;
}

- (void)setSpeechWordTimingInfoArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (SVXTaskTracking)taskTracker
{
  return self->_taskTracker;
}

- (SVXAudioSessionAssertion)audioSessionAssertion
{
  return self->_audioSessionAssertion;
}

- (void)setAudioSessionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionAssertion, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_speechWordTimingInfoArray, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_synthesisRequest, 0);
  objc_storeStrong((id *)&self->_speechRequest, 0);
  objc_storeStrong((id *)&self->_presynthesizedAudioRequest, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_finalization, 0);
  objc_storeStrong(&self->_audioChunkHandler, 0);
  objc_storeStrong(&self->_preparation, 0);
}

@end
