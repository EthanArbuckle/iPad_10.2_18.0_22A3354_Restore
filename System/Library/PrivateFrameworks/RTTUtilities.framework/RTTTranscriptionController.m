@implementation RTTTranscriptionController

- (RTTTranscriptionController)initWithDelegate:(id)a3
{
  id v4;
  RTTTranscriptionController *v5;
  RTTTranscriptionController *v6;

  v4 = a3;
  v5 = -[RTTTranscriptionController init](self, "init");
  v6 = v5;
  if (v5)
    -[RTTTranscriptionController setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (RTTTranscriptionController)init
{
  RTTTranscriptionController *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v7.receiver = self;
  v7.super_class = (Class)RTTTranscriptionController;
  v2 = -[RTTTranscriptionController init](&v7, sel_init);
  if (v2)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v3 = (void *)getAXLTLiveTranscriptionClass_softClass;
    v12 = getAXLTLiveTranscriptionClass_softClass;
    if (!getAXLTLiveTranscriptionClass_softClass)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __getAXLTLiveTranscriptionClass_block_invoke;
      v8[3] = &unk_24D203C78;
      v8[4] = &v9;
      __getAXLTLiveTranscriptionClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v9, 8);
    v5 = (void *)objc_opt_new();
    -[RTTTranscriptionController setTranscriber:](v2, "setTranscriber:", v5);

  }
  return v2;
}

- (void)startTranscribingForCallUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "rttLiveTranscriptionsFeatureFlagEnabled") & 1) == 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rttLiveTranscriptionsEnabled");

  if (!v7)
    goto LABEL_17;
  -[RTTTranscriptionController currentCallUUID](self, "currentCallUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v4);

  if (!v9)
  {
    -[RTTTranscriptionController currentCallUUID](self, "currentCallUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[RTTTranscriptionController currentCallUUID](self, "currentCallUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTTranscriptionController stopTranscribingForCallUUID:](self, "stopTranscribingForCallUUID:", v12);

    }
    -[RTTTranscriptionController transcriber](self, "transcriber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __59__RTTTranscriptionController_startTranscribingForCallUUID___block_invoke;
    v23[3] = &unk_24D204380;
    v23[4] = self;
    objc_msgSend(v13, "startTranscribing:targetPID:callbackBlock:error:", 1, 4294967294, v23, &v22);
    v5 = v22;

    AXLogRTT();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v5)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[RTTTranscriptionController startTranscribingForCallUUID:].cold.1((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);

    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Started transcription for callUUID %@", buf, 0xCu);
      }

      -[RTTTranscriptionController setCurrentTranscription:](self, "setCurrentTranscription:", 0);
      -[RTTTranscriptionController setCurrentCallUUID:](self, "setCurrentCallUUID:", v4);
    }
    goto LABEL_16;
  }
  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Already transcribing for callUUID %@", buf, 0xCu);
  }

LABEL_17:
}

void __59__RTTTranscriptionController_startTranscribingForCallUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentCallUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v14;
  if (v3)
  {
    objc_msgSend(v14, "transcribedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      ttyLocString(CFSTR("RTTTranscriptionPrefix"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transcribedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "currentTranscription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentCallUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v12, "transcriptionDidUpdate:forCallUUID:", v10, v13);
      else
        objc_msgSend(v12, "transcriptionDidStart:forCallUUID:", v10, v13);

      objc_msgSend(*(id *)(a1 + 32), "setCurrentTranscription:", v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setCurrentTranscription:", 0);
    }
    v4 = v14;
  }

}

- (void)stopTranscribingForCallUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTTranscriptionController currentCallUUID](self, "currentCallUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    -[RTTTranscriptionController transcriber](self, "transcriber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "stopTranscribing:targetPID:error:", 1, 4294967294, &v17);
    v8 = v17;

    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RTTTranscriptionController stopTranscribingForCallUUID:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Stopped transcription for callUUID %@", buf, 0xCu);
      }

      -[RTTTranscriptionController setCurrentTranscription:](self, "setCurrentTranscription:", 0);
      -[RTTTranscriptionController setCurrentCallUUID:](self, "setCurrentCallUUID:", 0);
    }
  }
  else
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Already not transcribing for callUUID %@", buf, 0xCu);
    }
  }

}

- (AXLTLiveTranscription)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
{
  objc_storeStrong((id *)&self->_transcriber, a3);
}

- (RTTTranscriptionControllerDelegate)delegate
{
  return (RTTTranscriptionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)currentTranscription
{
  return self->_currentTranscription;
}

- (void)setCurrentTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_currentTranscription, a3);
}

- (NSString)currentCallUUID
{
  return self->_currentCallUUID;
}

- (void)setCurrentCallUUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentCallUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCallUUID, 0);
  objc_storeStrong((id *)&self->_currentTranscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transcriber, 0);
}

- (void)startTranscribingForCallUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21473C000, a2, a3, "Failed to start transcribing: %@", a5, a6, a7, a8, 2u);
}

- (void)stopTranscribingForCallUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21473C000, a2, a3, "Failed to stop transcribing: %@", a5, a6, a7, a8, 2u);
}

@end
