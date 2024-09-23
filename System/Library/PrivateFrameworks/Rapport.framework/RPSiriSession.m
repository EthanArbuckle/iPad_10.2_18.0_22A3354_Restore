@implementation RPSiriSession

- (RPSiriSession)init
{
  RPSiriSession *v2;
  RPSiriSession *v3;
  RPSiriSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPSiriSession;
  v2 = -[RPSiriSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_isSourcePTTEligible = _os_feature_enabled_impl();
    v4 = v3;
  }

  return v3;
}

- (void)setMessenger:(id)a3
{
  RPMessageable *v5;
  RPMessageable *messenger;
  _QWORD v7[5];

  v5 = (RPMessageable *)a3;
  if (self->_messenger != v5)
  {
    objc_storeStrong((id *)&self->_messenger, a3);
    if (_os_feature_enabled_impl())
    {
      if (-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
      {
        messenger = self->_messenger;
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __30__RPSiriSession_setMessenger___block_invoke;
        v7[3] = &unk_1E5F50D30;
        v7[4] = self;
        -[RPMessageable registerRequestID:options:handler:](messenger, "registerRequestID:options:handler:", CFSTR("_siriEndpoint"), 0, v7);
      }
    }
  }

}

void __30__RPSiriSession_setMessenger___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    v9 = v10;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_stopRecording", v9);
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA70], 0, 0);

}

- (void)_stopRecording
{
  int startRecordingState;
  id v4;

  startRecordingState = self->_startRecordingState;
  if (startRecordingState == 6 || startRecordingState == 1)
  {
    -[RPSiriSession delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rpSiriSessionDidReceiveStopRecording");

  }
}

- (NSString)description
{
  NSAppendPrintF();
  return (NSString *)0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__RPSiriSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __40__RPSiriSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)prewarmWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__RPSiriSession_prewarmWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __39__RPSiriSession_prewarmWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "voiceControllerSetupAndReturnError:", &v6);
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  if ((v3 & 1) != 0)
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPSiriSession <= 90
         && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_9;
  }

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  NSString *v5;
  RPMessageable *v6;
  void *v7;
  void *v8;
  int startRecordingState;
  id v10;
  void *v11;
  uint64_t activateState;
  _QWORD v13[7];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = self->_destinationID;
  if (v5)
  {
    v6 = self->_messenger;
    if (v6)
    {
      if (self->_activateState)
      {
        if (gLogCategory_RPSiriSession <= 40
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        activateState = self->_activateState;
        RPErrorF();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (_os_feature_enabled_impl()
          && -[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible", activateState)
          && ((startRecordingState = self->_startRecordingState, startRecordingState == 6) || startRecordingState == 1))
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSourcePTTEligible);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("_pttEligible"));

          if (gLogCategory_RPSiriSession <= 40
            && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __41__RPSiriSession__activateWithCompletion___block_invoke;
          v15[3] = &unk_1E5F4F6F8;
          v16 = v4;
          -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](v6, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_siriStartWhileRecording"), MEMORY[0x1E0C9AA70], v5, v10, v15);

        }
        else if (v4)
        {
          (*((void (**)(id, void *))v4 + 2))(v4, v8);
        }

      }
      else if (self->_voiceController)
      {
        -[RPSiriSession _startActivationWithDestinationID:messenger:completion:](self, "_startActivationWithDestinationID:messenger:completion:", v5, v6, v4);
      }
      else
      {
        if (gLogCategory_RPSiriSession <= 40
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __41__RPSiriSession__activateWithCompletion___block_invoke_2;
        v13[3] = &unk_1E5F4F5B8;
        v13[4] = self;
        v13[5] = v5;
        v13[6] = v6;
        v14 = v4;
        -[RPSiriSession prewarmWithCompletion:](self, "prewarmWithCompletion:", v13);

      }
    }
    else
    {
      RPErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPSiriSession <= 90
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v4)
        (*((void (**)(id, void *))v4 + 2))(v4, v7);

    }
  }
  else
  {
    RPErrorF();
    v6 = (RPMessageable *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      (*((void (**)(id, RPMessageable *))v4 + 2))(v4, v6);
  }

}

void __41__RPSiriSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);

}

void __41__RPSiriSession__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startActivationWithDestinationID:messenger:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_9:
    v4 = v7;
    goto LABEL_10;
  }
  v4 = v3;
  if (gLogCategory_RPSiriSession <= 90)
  {
    if (gLogCategory_RPSiriSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      LogPrintF();
      v4 = v7;
    }
  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_startActivationWithDestinationID:(id)a3 messenger:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id activateCompletion;
  id v12;
  void *v13;
  NSString *sourceID;
  id v15;
  _QWORD v16[5];

  v8 = a3;
  v9 = a4;
  self->_activateState = 1;
  v10 = (void *)MEMORY[0x1AF45BE48](a5);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = v10;

  objc_storeStrong((id *)&self->_selfRef, self);
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    v15 = v8;
    LogPrintF();
  }
  -[RPSiriSession _activate2](self, "_activate2", v15);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSourcePTTEligible);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("_pttEligible"));

  if (_os_feature_enabled_impl())
  {
    if (-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
    {
      sourceID = self->_sourceID;
      if (sourceID)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", sourceID, CFSTR("senderIDS"));
    }
  }
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__RPSiriSession__startActivationWithDestinationID_messenger_completion___block_invoke;
  v16[3] = &unk_1E5F4FAC0;
  v16[4] = self;
  objc_msgSend(v9, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_siriStart"), MEMORY[0x1E0C9AA70], v8, v12, v16);

}

void __72__RPSiriSession__startActivationWithDestinationID_messenger_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _DWORD *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (v8)
  {
    v9 = *(_DWORD **)(a1 + 32);
    if (v9[4] == 1)
      objc_msgSend(v9, "_activateCompletedWithError:", v8);
  }

}

- (void)_activate2
{
  void *v3;
  AVVoiceController *voiceController;
  char v5;
  id v6;
  void *v7;
  id v8;

  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_startRecordingState = 1;
  v3 = (void *)objc_msgSend(objc_alloc((Class)getAVVCStartRecordSettingsClass[0]()), "initWithStreamID:atStartHostTime:", self->_streamId, 0);
  voiceController = self->_voiceController;
  v8 = 0;
  v5 = -[AVVoiceController startRecordForStream:error:](voiceController, "startRecordForStream:error:", v3, &v8);
  v6 = v8;
  -[RPSiriSession _recordingLimitTimerStart:](self, "_recordingLimitTimerStart:", 60);
  if ((v5 & 1) == 0)
  {
    self->_startRecordingState = 3;
    RPNestedErrorF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPSiriSession _activateCompletedWithError:](self, "_activateCompletedWithError:", v7);

  }
}

- (void)_activateCompletedWithError:(id)a3
{
  int v4;
  void (**v5)(_QWORD, _QWORD);
  id activateCompletion;
  id v7;

  v7 = a3;
  if (v7)
  {
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = 3;
  }
  else
  {
    v4 = 4;
  }
  self->_activateState = v4;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v5)
    ((void (**)(_QWORD, id))v5)[2](v5, v7);
  if (self->_invalidateCalled)
    -[RPSiriSession _invalidated](self, "_invalidated");

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__RPSiriSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__RPSiriSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithCompletion:", 0);
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__RPSiriSession_invalidateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __42__RPSiriSession_invalidateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)receivedButtonUpWithCompletion:(id)a3
{
  if (_os_feature_enabled_impl()
    && -[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[RPSiriSession _sendSiriStop](self, "_sendSiriStop");
  }
}

- (void)_sendSiriStop
{
  int activateState;
  void *v5;
  id v6;

  activateState = self->_activateState;
  if (activateState == 4 || activateState == 1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSourcePTTEligible);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("_pttEligible"));

    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](self->_messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_siriStop"), MEMORY[0x1E0C9AA70], self->_destinationID, v6, &__block_literal_global_14);

  }
  else
  {
    if (gLogCategory_RPSiriSession <= 40
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[RPSiriSession invalidateWithCompletion:](self, "invalidateWithCompletion:", 0);
  }
}

void __30__RPSiriSession__sendSiriStop__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = a4;
  if (v7
    && gLogCategory_RPSiriSession <= 90
    && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_invalidateWithCompletion:(id)a3
{
  id v4;
  int activateState;
  id v6;
  void *v7;
  RPMessageable *v8;
  RPMessageable *messenger;
  NSString *destinationID;
  RPMessageable *v11;
  RPMessageable *v12;
  OS_dispatch_source *recordingLimitTimer;
  NSObject *v14;
  OS_dispatch_source *v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    activateState = self->_activateState;
    self->_activateState = 7;
    -[RPSiriSession voiceControllerTearDown](self, "voiceControllerTearDown");
    if (!_os_feature_enabled_impl()
      || !-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
    {
      if (activateState == 4 || activateState == 1)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSourcePTTEligible);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("_pttEligible"));

        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        messenger = self->_messenger;
        destinationID = self->_destinationID;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __43__RPSiriSession__invalidateWithCompletion___block_invoke;
        v16[3] = &unk_1E5F50C00;
        v16[4] = self;
        v17 = v4;
        -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_siriStop"), MEMORY[0x1E0C9AA70], destinationID, v6, v16);
        v11 = self->_messenger;
        self->_messenger = 0;

      }
      else
      {
        v8 = self->_messenger;
        self->_messenger = 0;

        -[RPSiriSession _invalidated](self, "_invalidated");
      }
    }
    v12 = self->_messenger;
    self->_messenger = 0;

    -[RPSiriSession _invalidated](self, "_invalidated");
    if (_os_feature_enabled_impl()
      && -[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
    {
      -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_siriEndpoint"));
    }
    recordingLimitTimer = self->_recordingLimitTimer;
    if (recordingLimitTimer)
    {
      v14 = recordingLimitTimer;
      dispatch_source_cancel(v14);
      v15 = self->_recordingLimitTimer;
      self->_recordingLimitTimer = 0;

    }
  }

}

void __43__RPSiriSession__invalidateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      v10 = v8;
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPSiriSession <= 30
         && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidated", v10);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);

}

- (void)_teardownVoiceController
{
  AVVoiceController *voiceController;
  id v4;
  void *v5;
  void *v6;
  AVVoiceController *v7;
  id v8;

  voiceController = self->_voiceController;
  if (voiceController)
  {
    v8 = 0;
    -[AVVoiceController teardownWithError:](voiceController, "teardownWithError:", &v8);
    v4 = v8;
    v5 = v4;
    if (v4)
    {
      if (gLogCategory_RPSiriSession <= 90)
      {
        if (gLogCategory_RPSiriSession != -1 || (v4 = (id)_LogCategory_Initialize(), (_DWORD)v4))
          v4 = (id)LogPrintF();
      }
    }
    v6 = (void *)MEMORY[0x1AF45BCB0](v4);
    v7 = self->_voiceController;
    self->_voiceController = 0;

    objc_autoreleasePoolPop(v6);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[RPSiriSession _teardownVoiceController](self, "_teardownVoiceController");
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v3.receiver = self;
  v3.super_class = (Class)RPSiriSession;
  -[RPSiriSession dealloc](&v3, sel_dealloc);
}

- (void)_invalidated
{
  int startRecordingState;
  AVVoiceController *voiceController;
  RPSiriSessionDelegate *delegate;
  RPSiriSession *selfRef;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_messenger)
  {
    startRecordingState = self->_startRecordingState;
    if (startRecordingState != 1 && startRecordingState != 6 && self->_stopRecordingState != 1)
    {
      -[AVVoiceController deactivateAudioSessionForStream:withOptions:error:](self->_voiceController, "deactivateAudioSessionForStream:withOptions:error:", self->_streamId, 1, 0);
      if (self->_voiceController)
      {
        -[RPSiriSession _teardownVoiceController](self, "_teardownVoiceController");
        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      voiceController = self->_voiceController;
      self->_voiceController = 0;

      delegate = self->_delegate;
      self->_delegate = 0;

      self->_streamId = 0;
      self->_invalidateDone = 1;
      if (gLogCategory_RPSiriSession <= 30
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      selfRef = self->_selfRef;
      self->_selfRef = 0;

    }
  }
}

- (BOOL)voiceControllerSetupAndReturnError:(id *)a3
{
  AVAudioFormat *v5;
  AVAudioFormat *audioFormat;
  char v7;
  AVVoiceController *voiceController;
  id v9;
  AVVoiceController *v10;
  AVVoiceController *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  AVVoiceController *v16;
  unint64_t streamId;
  id v18;
  void *v19;
  AVVoiceController *v20;
  uint64_t *v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;

  v30 = 0u;
  v31 = 0u;
  v29 = 0x40CF400000000000;
  LODWORD(v30) = 1869641075;
  HIDWORD(v30) = 320;
  DWORD1(v31) = 1;
  v5 = (AVAudioFormat *)objc_msgSend(objc_alloc((Class)getAVAudioFormatClass[0]()), "initWithStreamDescription:", &v29);
  audioFormat = self->_audioFormat;
  self->_audioFormat = v5;

  if (self->_audioFormat)
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      v22 = &v29;
      LogPrintF();
    }
    voiceController = self->_voiceController;
    if (voiceController)
    {
      v9 = 0;
    }
    else
    {
      v28 = 0;
      v10 = (AVVoiceController *)objc_msgSend(objc_alloc((Class)getAVVoiceControllerClass[0]()), "initVoiceControllerForClient:withError:", 3, &v28);
      v9 = v28;
      v11 = self->_voiceController;
      self->_voiceController = v10;

      voiceController = self->_voiceController;
      if (!voiceController)
      {
        if (a3)
        {
          RPNestedErrorF();
          v7 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
LABEL_38:

        return v7;
      }
    }
    -[AVVoiceController setRecordDelegate:](voiceController, "setRecordDelegate:", self, v22);
    v12 = (void *)objc_msgSend(objc_alloc((Class)getAVVCContextSettingsClass[0]()), "initWithMode:deviceUID:", 1969840752, 0);
    v26 = v9;
    v27 = 0;
    v13 = -[AVVoiceController setContext:streamType:error:](self->_voiceController, "setContext:streamType:error:", v12, &v27, &v26);
    v14 = v26;

    if (v13)
    {
      self->_streamId = v13;
      if (gLogCategory_RPSiriSession <= 30
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        v23 = v13;
        LogPrintF();
      }
      -[AVAudioFormat settings](self->_audioFormat, "settings", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = self->_voiceController;
        streamId = self->_streamId;
        v25 = v14;
        -[AVVoiceController activateAudioSessionForStream:isPrewarm:recordMode:error:](v16, "activateAudioSessionForStream:isPrewarm:recordMode:error:", streamId, 1, 1, &v25);
        v18 = v25;

        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v19 = (void *)objc_msgSend(objc_alloc((Class)getAVVCPrepareRecordSettingsClass[0]()), "initWithStreamID:settings:bufferDuration:", self->_streamId, v15, 0.1);
        objc_msgSend(v19, "setMeteringEnabled:", 1);
        v20 = self->_voiceController;
        v24 = v18;
        v7 = -[AVVoiceController prepareRecordForStream:error:](v20, "prepareRecordForStream:error:", v19, &v24);
        v14 = v24;

        if (v14)
          v7 = 0;
        if (a3 && (v7 & 1) == 0)
        {
          RPNestedErrorF();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else if (a3)
      {
        RPErrorF();
        v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else if (a3)
    {
      RPNestedErrorF();
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    v9 = v14;
    goto LABEL_38;
  }
  if (!a3)
    return 0;
  RPErrorF();
  v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)voiceControllerTearDown
{
  AVVoiceController *voiceController;
  unint64_t streamId;
  char v5;
  id v6;
  id v7;

  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  *(_QWORD *)&self->_startRecordingState = 0x100000007;
  voiceController = self->_voiceController;
  if (voiceController)
  {
    streamId = self->_streamId;
    v7 = 0;
    v5 = -[AVVoiceController stopRecordForStream:error:](voiceController, "stopRecordForStream:error:", streamId, &v7);
    v6 = v7;
    if ((v5 & 1) == 0
      && gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_RPSiriSession <= 40
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = 0;
  }

}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9;
  NSObject *dispatchQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  BOOL v15;

  v9 = a6;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__RPSiriSession_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v12[3] = &unk_1E5F50D58;
  v15 = a5;
  v12[4] = self;
  v13 = v9;
  v14 = a4;
  v11 = v9;
  dispatch_async(dispatchQueue, v12);

}

void __79__RPSiriSession_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _BYTE *v4;
  id v5;

  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 40))
      v2 = 3;
    else
      v2 = 6;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = v2;
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(_BYTE **)(a1 + 32);
    if (v4[40])
    {
      objc_msgSend(v4, "voiceControllerTearDown");
      v4 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v4, "_activateCompletedWithError:", 0);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 3;
    v3 = *(void **)(a1 + 32);
    RPNestedErrorF();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_activateCompletedWithError:", v5);

  }
}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RPSiriSession_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_1E5F50460;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(dispatchQueue, block);
}

_BYTE *__69__RPSiriSession_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 60) = 5;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  result = *(_BYTE **)(a1 + 32);
  if (result[40])
    return (_BYTE *)objc_msgSend(result, "_invalidated");
  return result;
}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RPSiriSession_voiceControllerAudioCallback_forStream_buffer___block_invoke;
  block[3] = &unk_1E5F50D80;
  v11 = v7;
  v12 = a4;
  block[4] = self;
  v9 = v7;
  dispatch_async(dispatchQueue, block);

}

void __63__RPSiriSession_voiceControllerAudioCallback_forStream_buffer___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56) == 6)
  {
    objc_msgSend(*(id *)(v1 + 64), "updateMeterForStream:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "getAveragePowerForStream:forChannel:", *(_QWORD *)(a1 + 48), 0);
    v4 = __exp10f(v3 / 20.0);
    if (gLogCategory_RPSiriSession <= 10
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "timeStamp");
      v6 = objc_msgSend(*(id *)(a1 + 40), "bytesDataSize");
      v23 = v4;
      v21 = objc_msgSend(*(id *)(a1 + 40), "packetDescriptionCount");
      v22 = objc_msgSend(*(id *)(a1 + 40), "channels");
      v19 = v5;
      v20 = v6;
      LogPrintF();
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_msgSend(*(id *)(a1 + 40), "packetDescriptions");
    v9 = objc_msgSend(*(id *)(a1 + 40), "packetDescriptionCount");
    if (v9)
    {
      v10 = 16 * v9;
      do
      {
        v26[0] = &unk_1E5F6A540;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v8 + 12), v19, v20, v21, v22, *(_QWORD *)&v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = &unk_1E5F6A558;
        v27[0] = v11;
        v12 = *(_QWORD *)v8;
        v8 += 16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

        v10 -= 16;
      }
      while (v10);
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(*(id *)(a1 + 40), "data"), (int)objc_msgSend(*(id *)(a1 + 40), "bytesDataSize"));
    v25[0] = v15;
    v24[0] = &unk_1E5F6A570;
    v24[1] = &unk_1E5F6A588;
    *(float *)&v16 = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = &unk_1E5F6A5A0;
    v25[1] = v17;
    v25[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "sendEventID:event:destinationID:options:completion:", CFSTR("_siA"), v18, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), 0, 0);
  }
}

- (void)voiceControllerDidDetectStartpoint:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_RPSiriSession <= 30
    && ((v6 = v3, gLogCategory_RPSiriSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)voiceControllerDidDetectEndpoint:(id)a3 ofType:(int)a4 atTime:(double)a5
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (gLogCategory_RPSiriSession <= 30)
  {
    v8 = v5;
    if (gLogCategory_RPSiriSession != -1 || (v7 = _LogCategory_Initialize(), v6 = v8, v7))
    {
      LogPrintF();
      v6 = v8;
    }
  }

}

- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_RPSiriSession <= 90 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

- (void)voiceControllerMediaServicesWereReset:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_RPSiriSession <= 60
    && ((v6 = v3, gLogCategory_RPSiriSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)_recordingLimitTimerStart:(unsigned int)a3
{
  OS_dispatch_source *recordingLimitTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[6];

  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  recordingLimitTimer = self->_recordingLimitTimer;
  if (recordingLimitTimer)
  {
    v5 = recordingLimitTimer;
    dispatch_source_cancel(v5);
    v6 = self->_recordingLimitTimer;
    self->_recordingLimitTimer = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v8 = self->_recordingLimitTimer;
  self->_recordingLimitTimer = v7;
  v9 = v7;

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__RPSiriSession__recordingLimitTimerStart___block_invoke;
  handler[3] = &unk_1E5F4ECF8;
  handler[4] = v9;
  handler[5] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);

}

_QWORD *__43__RPSiriSession__recordingLimitTimerStart___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[10])
    return (_QWORD *)objc_msgSend(result, "_recordingLimitTimerFired");
  return result;
}

- (void)_recordingLimitTimerFired
{
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (_os_feature_enabled_impl())
  {
    if (-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
      -[RPSiriSession _stopRecording](self, "_stopRecording");
  }
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationID, a3);
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceID, a3);
}

- (BOOL)isDestinationPTTEligible
{
  return self->_isDestinationPTTEligible;
}

- (void)setIsDestinationPTTEligible:(BOOL)a3
{
  self->_isDestinationPTTEligible = a3;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (RPSiriSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_recordingLimitTimer, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_audioFormat, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
