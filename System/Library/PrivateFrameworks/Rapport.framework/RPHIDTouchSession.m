@implementation RPHIDTouchSession

- (RPHIDTouchSession)init
{
  RPHIDTouchSession *v2;
  RPHIDTouchSession *v3;
  RPHIDTouchSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPHIDTouchSession;
  v2 = -[RPHIDTouchSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_screenSize = (CGSize)vdupq_n_s64(0x408F400000000000uLL);
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
  v9[2] = __44__RPHIDTouchSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __44__RPHIDTouchSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  RPMessageable *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat width;
  CGFloat height;
  uint64_t flags;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    if (gLogCategory_RPHIDTouchSession <= 30
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
      flags = self->_flags;
      v14 = &unk_1AF3077A8;
      width = self->_screenSize.width;
      height = self->_screenSize.height;
      LogPrintF();
    }
    v17[0] = CFSTR("_tFl");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_flags, *(_QWORD *)&width, *(_QWORD *)&height, flags, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = CFSTR("_height");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_screenSize.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = CFSTR("_width");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_screenSize.width);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__RPHIDTouchSession__activateWithCompletion___block_invoke;
    v15[3] = &unk_1E5F50620;
    v15[4] = self;
    v16 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_touchStart"), v10, CFSTR("rapport:rdid:DirectPeer"), 0, v15);

  }
  else
  {
    RPErrorF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPHIDTouchSession <= 90
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v6);

  }
}

void __45__RPHIDTouchSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDTouchSession <= 90
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v8);
  }
  else
  {
    NSDictionaryGetNSNumber();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v9);
      if (gLogCategory_RPHIDTouchSession <= 30
        && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v12 = *(_QWORD *)(a1 + 40);
      if (v12)
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
    }
    else
    {
      RPErrorF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPHIDTouchSession <= 90
        && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v10);

    }
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__RPHIDTouchSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__RPHIDTouchSession_invalidate__block_invoke(uint64_t a1)
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
  v7[2] = __46__RPHIDTouchSession_invalidateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __46__RPHIDTouchSession_invalidateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidateWithCompletion:(id)a3
{
  id v4;
  NSNumber *touchSessionID;
  void *v6;
  NSNumber *v7;
  void *v8;
  RPMessageable *messenger;
  NSNumber *v10;
  RPMessageable *v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_RPHIDTouchSession <= 30
    && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  touchSessionID = self->_touchSessionID;
  if (touchSessionID)
  {
    v14 = CFSTR("_i");
    v15[0] = touchSessionID;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = touchSessionID;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    messenger = self->_messenger;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__RPHIDTouchSession__invalidateWithCompletion___block_invoke;
    v12[3] = &unk_1E5F4F6F8;
    v13 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_touchStop"), v8, CFSTR("rapport:rdid:DirectPeer"), 0, v12);
    v10 = self->_touchSessionID;
    self->_touchSessionID = 0;

  }
  v11 = self->_messenger;
  self->_messenger = 0;

}

void __47__RPHIDTouchSession__invalidateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDTouchSession <= 90
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPHIDTouchSession <= 30
         && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);

}

- (void)sendTouchEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RPMessageable *v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_messenger;
  if (v8)
  {
    objc_msgSend(v6, "location");
    v10 = (int)(v9 * self->_screenSize.width);
    v12 = (int)(v11 * self->_screenSize.height);
    objc_msgSend(v6, "timestampSeconds");
    v20[0] = CFSTR("_ns");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v13 * 1000000000.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v20[1] = CFSTR("_tFg");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "finger"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    v20[2] = CFSTR("_tPh");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "phase"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v16;
    v20[3] = CFSTR("_cx");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v17;
    v20[4] = CFSTR("_cy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPMessageable sendEventID:event:destinationID:options:completion:](v8, "sendEventID:event:destinationID:options:completion:", CFSTR("_hidT"), v19, CFSTR("rapport:rdid:DirectPeer"), 0, v7);
  }
  else if (gLogCategory_RPHIDTouchSession <= 90
         && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_touchSessionID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
