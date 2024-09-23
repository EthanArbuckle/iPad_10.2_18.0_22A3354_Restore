@implementation SRDRequestDispatcher

- (SRDRequestDispatcher)initWithRequestDispatcherServiceHelper:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  SRDRequestDispatcher *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[SRDRequestDispatcher initWithRequestDispatcherServiceHelper:bridgeConnectionListeners:](self, "initWithRequestDispatcherServiceHelper:bridgeConnectionListeners:", v5, v6);

  return v7;
}

- (SRDRequestDispatcher)initWithRequestDispatcherServiceHelper:(id)a3 bridgeConnectionListeners:(id)a4
{
  id v6;
  id v7;
  SRDRequestDispatcher *v8;
  SRDRequestDispatcherInternal *v9;
  SRDRequestDispatcherInternal *underlyingObject;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SRDRequestDispatcher;
  v8 = -[SRDRequestDispatcher init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SRDRequestDispatcherInternal initWithRequestDispatcherServiceHelper:bridgeConnectionListeners:]([SRDRequestDispatcherInternal alloc], "initWithRequestDispatcherServiceHelper:bridgeConnectionListeners:", v6, v7);
    underlyingObject = v8->_underlyingObject;
    v8->_underlyingObject = v9;

  }
  return v8;
}

- (SRDRequestDispatcher)initWithMock:(id)a3
{
  id v5;
  SRDRequestDispatcher *v6;
  SRDRequestDispatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRDRequestDispatcher;
  v6 = -[SRDRequestDispatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingObject, a3);

  return v7;
}

- (void)cancelRequestWithAssistantId:(id)a3 requestId:(id)a4 reason:(int64_t)a5
{
  -[SRDRequestDispatcherInternal cancelRequestWithAssistantId:requestId:reason:](self->_underlyingObject, "cancelRequestWithAssistantId:requestId:reason:", a3, a4, a5);
}

- (id)commandsForDomain:(id)a3
{
  return -[SRDRequestDispatcherInternal commandsForDomain:](self->_underlyingObject, "commandsForDomain:", a3);
}

- (id)domains
{
  return -[SRDRequestDispatcherInternal domains](self->_underlyingObject, "domains");
}

- (void)handleCommand:(id)a3 executionContextInfo:(id)a4 reply:(id)a5
{
  -[SRDRequestDispatcherInternal handleCommand:executionContextInfo:reply:](self->_underlyingObject, "handleCommand:executionContextInfo:reply:", a3, a4, a5);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return -[SRDRequestDispatcherInternal implementsCommand:forDomain:](self->_underlyingObject, "implementsCommand:forDomain:", a3, a4);
}

- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4
{
  -[SRDRequestDispatcherInternal requestCompletedWithAssistantId:requestId:](self->_underlyingObject, "requestCompletedWithAssistantId:requestId:", a3, a4);
}

- (BOOL)sessionExistsForAssistantId:(id)a3
{
  return -[SRDRequestDispatcherInternal sessionExistsForAssistantId:](self->_underlyingObject, "sessionExistsForAssistantId:", a3);
}

- (void)startSessionWithConfiguration:(id)a3
{
  -[SRDRequestDispatcherInternal startSessionWithConfiguration:](self->_underlyingObject, "startSessionWithConfiguration:", a3);
}

- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6
{
  -[SRDRequestDispatcherInternal prewarmWithAssistantId:languageCode:prewarmOptions:sharedUserId:](self->_underlyingObject, "prewarmWithAssistantId:languageCode:prewarmOptions:sharedUserId:", a3, a4, a5, a6);
}

- (void)endSessionWithAssistantId:(id)a3
{
  -[SRDRequestDispatcherInternal endSessionWithAssistantId:withDelay:](self->_underlyingObject, "endSessionWithAssistantId:withDelay:", a3, 1);
}

- (void)startSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8
{
  -[SRDRequestDispatcherInternal startSpeechRequestWithAssistantId:requestId:inputOrigin:location:asrOnServer:requestContextData:](self->_underlyingObject, "startSpeechRequestWithAssistantId:requestId:inputOrigin:location:asrOnServer:requestContextData:", a3, a4, a5, a6, a7, a8);
}

- (void)startLocalRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6
{
  -[SRDRequestDispatcherInternal startLocalRequestWithAssistantId:requestId:inputOrigin:requestContextData:](self->_underlyingObject, "startLocalRequestWithAssistantId:requestId:inputOrigin:requestContextData:", a3, a4, a5, a6);
}

- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10
{
  -[SRDRequestDispatcherInternal startTestSpeechRequestWithAssistantId:requestId:enableASR:inputOrigin:location:jitContext:overrideModelPath:requestContextData:](self->_underlyingObject, "startTestSpeechRequestWithAssistantId:requestId:enableASR:inputOrigin:location:jitContext:overrideModelPath:requestContextData:", a3, a4, a5, a6, a7, a8);
}

- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6
{
  -[SRDRequestDispatcherInternal postTestResultCandidateWithAssistantId:requestId:rcId:recognitionSausage:](self->_underlyingObject, "postTestResultCandidateWithAssistantId:requestId:rcId:recognitionSausage:", a3, a4, a5, a6);
}

- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5
{
  -[SRDRequestDispatcherInternal postTestResultSelectedWithAssistantId:requestId:rcId:](self->_underlyingObject, "postTestResultSelectedWithAssistantId:requestId:rcId:", a3, a4, a5);
}

- (void)startUnderstandingOnServerRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5
{
  -[SRDRequestDispatcherInternal startUnderstandingOnServerRequestWithAssistantId:requestId:inputOrigin:](self->_underlyingObject, "startUnderstandingOnServerRequestWithAssistantId:requestId:inputOrigin:", a3, a4, a5);
}

- (void)startUnderstandingOnServerTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  -[SRDRequestDispatcherInternal startUnderstandingOnServerTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:](self->_underlyingObject, "startUnderstandingOnServerTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:", a3, a4, a5, a6, a7);
}

- (void)startTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  -[SRDRequestDispatcherInternal startTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:](self->_underlyingObject, "startTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:", a3, a4, a5, a6, a7);
}

- (void)startDirectActionRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9
{
  -[SRDRequestDispatcherInternal startDirectActionRequestWithAssistantId:requestId:inputOrigin:directAction:requestExecutionParameters:requestContextData:](self->_underlyingObject, "startDirectActionRequestWithAssistantId:requestId:inputOrigin:directAction:requestExecutionParameters:requestContextData:", a3, a4, a5, a7, a8, a9);
}

- (void)startCorrectionSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8
{
  -[SRDRequestDispatcherInternal startCorrectionSpeechRequestWithAssistantId:requestId:inputOrigin:utterance:previousUtterance:requestContextData:](self->_underlyingObject, "startCorrectionSpeechRequestWithAssistantId:requestId:inputOrigin:utterance:previousUtterance:requestContextData:", a3, a4, a5, a6, a7, a8);
}

- (void)startSpeechDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5
{
  -[SRDRequestDispatcherInternal startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice:](self->_underlyingObject, "startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice:", a3, a4, a5);
}

- (void)startSpeechDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
{
  -[SRDRequestDispatcherInternal startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:](self->_underlyingObject, "startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:", a3, a4, a5, a6);
}

- (void)startUnderstandingDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 understandingOnDevice:(BOOL)a5
{
  -[SRDRequestDispatcherInternal startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevice:](self->_underlyingObject, "startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevice:", a3, a4, a5);
}

- (void)startUnderstandingDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
{
  -[SRDRequestDispatcherInternal startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:](self->_underlyingObject, "startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:", a3, a4, a5, a6);
}

- (void)endDictationSessionWithAssistantId:(id)a3
{
  -[SRDRequestDispatcherInternal endDictationSessionWithAssistantId:](self->_underlyingObject, "endDictationSessionWithAssistantId:", a3);
}

- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4
{
  -[SRDRequestDispatcherInternal pauseDictationRecognitionWithAssistantId:requestId:](self->_underlyingObject, "pauseDictationRecognitionWithAssistantId:requestId:", a3, a4);
}

- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7
{
  -[SRDRequestDispatcherInternal resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:](self->_underlyingObject, "resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:", a3, a4, a5, a6, a7);
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11
{
  -[SRDRequestDispatcherInternal updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:](self->_underlyingObject, "updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12
{
  -[SRDRequestDispatcherInternal updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:](self->_underlyingObject, "updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", a3, a4, a5, a6, a7, a8);
}

- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4
{
  -[SRDRequestDispatcherInternal announceNotificationHandlingStateUpdatedWithAssistantId:toState:](self->_underlyingObject, "announceNotificationHandlingStateUpdatedWithAssistantId:toState:", a3, a4);
}

- (SRDRequestDispatcherInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
