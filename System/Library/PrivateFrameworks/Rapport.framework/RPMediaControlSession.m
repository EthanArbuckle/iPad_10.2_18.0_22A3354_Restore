@implementation RPMediaControlSession

- (RPMediaControlSession)init
{
  RPMediaControlSession *v2;
  RPMediaControlSession *v3;
  RPMediaControlSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPMediaControlSession;
  v2 = -[RPMediaControlSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
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
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__RPMediaControlSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __48__RPMediaControlSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  RPMessageable *messenger;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (self->_messenger)
  {
    if (self->_mediaControlFlagsChangedHandler)
    {
      v9[0] = CFSTR("interest");
      v9[1] = CFSTR("statusFlags");
      v10[0] = MEMORY[0x1E0C9AAB0];
      v10[1] = &unk_1E5F6A4B0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      messenger = self->_messenger;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__RPMediaControlSession__activateWithCompletion___block_invoke;
      v8[3] = &unk_1E5F50968;
      v8[4] = self;
      -[RPMessageable registerEventID:options:handler:](messenger, "registerEventID:options:handler:", CFSTR("_iMC"), v5, v8);
      self->_registeredMediaControlInterest = 1;

    }
    if (gLogCategory_RPMediaControlSession <= 30
      && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    RPErrorF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPMediaControlSession <= 90
      && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      ((void (**)(id, void *))v4)[2](v4, v7);

  }
}

uint64_t __49__RPMediaControlSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMediaControlEvent:", a2);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RPMediaControlSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPMediaControlSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  id mediaControlFlagsChangedHandler;
  RPMessageable *messenger;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPMediaControlSession <= 30
      && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_registeredMediaControlInterest)
    {
      -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_iMC"));
      self->_registeredMediaControlInterest = 0;
    }
    mediaControlFlagsChangedHandler = self->_mediaControlFlagsChangedHandler;
    self->_mediaControlFlagsChangedHandler = 0;

    messenger = self->_messenger;
    self->_messenger = 0;

  }
}

- (void)_handleMediaControlEvent:(id)a3
{
  unint64_t Int64;
  uint64_t v5;
  void *v6;

  Int64 = CFDictionaryGetInt64();
  if (gLogCategory_RPMediaControlSession <= 30
    && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64 != self->_mediaControlFlags)
  {
    self->_mediaControlFlags = Int64;
    v5 = MEMORY[0x1AF45BE48](self->_mediaControlFlagsChangedHandler);
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t))(v5 + 16))(v5);

  }
}

- (void)mediaCaptionSettingGetFromDestinationID:(id)a3 completion:(id)a4
{
  id v6;
  RPMessageable *messenger;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  messenger = self->_messenger;
  v14 = CFSTR("_mcc");
  v15[0] = &unk_1E5F6A4C8;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__RPMediaControlSession_mediaCaptionSettingGetFromDestinationID_completion___block_invoke;
  v12[3] = &unk_1E5F4F6F8;
  v13 = v6;
  v11 = v6;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_mcc"), v10, v9, 0, v12);

}

void __76__RPMediaControlSession_mediaCaptionSettingGetFromDestinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  v5 = a4;
  CFDictionaryGetInt64Ranged();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)mediaCaptionSettingSet:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  RPMessageable *messenger;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v6 = *(_QWORD *)&a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  messenger = self->_messenger;
  v17[0] = CFSTR("_mcc");
  v17[1] = CFSTR("_mcs");
  v18[0] = &unk_1E5F6A4E0;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__RPMediaControlSession_mediaCaptionSettingSet_destinationID_completion___block_invoke;
  v15[3] = &unk_1E5F4F6F8;
  v16 = v8;
  v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_mcc"), v13, v11, 0, v15);

}

uint64_t __73__RPMediaControlSession_mediaCaptionSettingSet_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (void)mediaCommand:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  RPMessageable *messenger;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v6 = *(_QWORD *)&a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  messenger = self->_messenger;
  v17 = CFSTR("_mcc");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__RPMediaControlSession_mediaCommand_destinationID_completion___block_invoke;
  v15[3] = &unk_1E5F4F6F8;
  v16 = v8;
  v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_mcc"), v13, v11, 0, v15);

}

uint64_t __63__RPMediaControlSession_mediaCommand_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (void)mediaSkipBySeconds:(double)a3 destinationID:(id)a4 completion:(id)a5
{
  id v8;
  RPMessageable *messenger;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  messenger = self->_messenger;
  v17[0] = CFSTR("_mcc");
  v17[1] = CFSTR("_skpS");
  v18[0] = &unk_1E5F6A4F8;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__RPMediaControlSession_mediaSkipBySeconds_destinationID_completion___block_invoke;
  v15[3] = &unk_1E5F4F6F8;
  v16 = v8;
  v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_mcc"), v13, v11, 0, v15);

}

uint64_t __69__RPMediaControlSession_mediaSkipBySeconds_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (void)mediaGetVolumeFromDestinationID:(id)a3 completion:(id)a4
{
  id v6;
  RPMessageable *messenger;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  messenger = self->_messenger;
  v14 = CFSTR("_mcc");
  v15[0] = &unk_1E5F6A510;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__RPMediaControlSession_mediaGetVolumeFromDestinationID_completion___block_invoke;
  v12[3] = &unk_1E5F4F6F8;
  v13 = v6;
  v11 = v6;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_mcc"), v10, v9, 0, v12);

}

void __68__RPMediaControlSession_mediaGetVolumeFromDestinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  double v6;

  v5 = a4;
  CFDictionaryGetDouble();
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6);

}

- (void)mediaSetVolume:(double)a3 destinationID:(id)a4 completion:(id)a5
{
  id v8;
  RPMessageable *messenger;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  double v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  messenger = self->_messenger;
  v18[0] = CFSTR("_mcc");
  v18[1] = CFSTR("_vol");
  v19[0] = &unk_1E5F6A528;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__RPMediaControlSession_mediaSetVolume_destinationID_completion___block_invoke;
  v15[3] = &unk_1E5F50990;
  v17 = a3;
  v16 = v8;
  v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_mcc"), v13, v11, 0, v15);

}

void __65__RPMediaControlSession_mediaSetVolume_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  __n128 v6;
  uint64_t v7;

  v5 = a4;
  CFDictionaryGetDouble();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, __n128))(v7 + 16))(v7, v5, v6);

}

- (unint64_t)mediaControlFlags
{
  return self->_mediaControlFlags;
}

- (id)mediaControlFlagsChangedHandler
{
  return self->_mediaControlFlagsChangedHandler;
}

- (void)setMediaControlFlagsChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong(&self->_mediaControlFlagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
