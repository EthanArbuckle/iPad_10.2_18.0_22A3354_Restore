@implementation SASTestingInputController

- (SASTestingInputController)init
{
  SASTestingInputController *v2;
  SASTestingInputController *v3;
  SiriTestingContext *preloadedTestingInput;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SASTestingInputController;
  v2 = -[SASTestingInputController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SASTestingInputController _registerForTestingNotifications](v2, "_registerForTestingNotifications");
    preloadedTestingInput = v3->_preloadedTestingInput;
    v3->_preloadedTestingInput = 0;

  }
  return v3;
}

- (void)_registerForTestingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__testingStringsDidChange_, CFSTR("SBTestingConfigureNextAssistantRecognitionStrings"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__testingAudioInputPathsDidChange_, CFSTR("SBTestingConfigureNextVoiceRecognitionAudioInputPathsNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SASTestingInputController;
  -[SASTestingInputController dealloc](&v4, sel_dealloc);
}

- (void)_testingStringsDidChange:(id)a3
{
  SiriTestingContext *preloadedTestingInput;
  id v5;
  SiriTestingContext *v6;
  SiriTestingContext *v7;
  id v8;

  preloadedTestingInput = self->_preloadedTestingInput;
  self->_preloadedTestingInput = 0;
  v5 = a3;

  objc_msgSend(v5, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v6 = -[SiriTestingContext initWithRecognitionStrings:]([SiriTestingContext alloc], "initWithRecognitionStrings:", v8);
    v7 = self->_preloadedTestingInput;
    self->_preloadedTestingInput = v6;

  }
}

- (void)_testingAudioInputPathsDidChange:(id)a3
{
  SiriTestingContext *v4;
  SiriTestingContext *preloadedTestingInput;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[SiriTestingContext initWithAudioInput:]([SiriTestingContext alloc], "initWithAudioInput:", v6);
    preloadedTestingInput = self->_preloadedTestingInput;
    self->_preloadedTestingInput = v4;

  }
}

- (id)dequeuePreloadedTestingContext
{
  SiriTestingContext *v3;
  SiriTestingContext *preloadedTestingInput;

  v3 = self->_preloadedTestingInput;
  preloadedTestingInput = self->_preloadedTestingInput;
  self->_preloadedTestingInput = 0;

  return v3;
}

- (SiriTestingContext)preloadedTestingInput
{
  return self->_preloadedTestingInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedTestingInput, 0);
}

@end
