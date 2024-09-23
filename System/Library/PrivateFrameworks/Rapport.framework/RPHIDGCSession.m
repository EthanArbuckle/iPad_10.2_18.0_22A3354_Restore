@implementation RPHIDGCSession

- (RPHIDGCSession)initWithOptions:(id)a3
{
  id v5;
  RPHIDGCSession *v6;
  RPHIDGCSession *v7;
  RPHIDGCSession *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPHIDGCSession;
  v6 = -[RPHIDGCSession init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1E0C80D38]);
    objc_storeStrong((id *)&v7->_options, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  RPMessageable *v5;
  NSDictionary *options;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    options = self->_options;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__RPHIDGCSession__activateWithCompletion___block_invoke;
    v8[3] = &unk_1E5F4F6F8;
    v9 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_gcStart"), options, CFSTR("rapport:rdid:DirectPeer"), 0, v8);

  }
  else
  {
    RPErrorF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v7);

  }
}

void __42__RPHIDGCSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
  }
  else
  {
    if (gLogCategory_RPHIDGCSession <= 30
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }

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
  v9[2] = __41__RPHIDGCSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __41__RPHIDGCSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidate
{
  RPMessageable *messenger;

  if (gLogCategory_RPHIDGCSession <= 30
    && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](self->_messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_gcStop"), MEMORY[0x1E0C9AA70], CFSTR("rapport:rdid:DirectPeer"), 0, &__block_literal_global_6);
  messenger = self->_messenger;
  self->_messenger = 0;

}

void __29__RPHIDGCSession__invalidate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPHIDGCSession <= 30
         && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__RPHIDGCSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__RPHIDGCSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)sendGCEvent:(RPHIDGCEvent *)a3 destinationID:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RPHIDGCSession *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(id, void *);
  _QWORD v50[21];
  _QWORD v51[23];

  v51[21] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (a3)
  {
    v11 = a3->var17 | (a3->var16 << 8);
    v12 = a3->var19 | (a3->var18 << 8);
    v42 = a3->var21 | (a3->var20 << 8);
    v50[0] = CFSTR("_gcDU");
    *(float *)&v10 = a3->var0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v48;
    v50[1] = CFSTR("_gcDD");
    *(float *)&v13 = a3->var1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v47;
    v50[2] = CFSTR("_gcDL");
    *(float *)&v14 = a3->var2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v46;
    v50[3] = CFSTR("_gcDR");
    *(float *)&v15 = a3->var3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v45;
    v50[4] = CFSTR("_gcLThx");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4.x);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v44;
    v50[5] = CFSTR("_gcLThy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4.y);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v43;
    v50[6] = CFSTR("_gcRThx");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var5.x);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[6] = v41;
    v50[7] = CFSTR("_gcRThy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var5.y);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51[7] = v40;
    v50[8] = CFSTR("_gcBtA");
    *(float *)&v16 = a3->var6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51[8] = v39;
    v50[9] = CFSTR("_gcBtB");
    *(float *)&v17 = a3->var7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[9] = v38;
    v50[10] = CFSTR("_gcBtX");
    *(float *)&v18 = a3->var8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[10] = v37;
    v50[11] = CFSTR("_gcBtY");
    *(float *)&v19 = a3->var9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[11] = v36;
    v50[12] = CFSTR("_gcL1");
    *(float *)&v20 = a3->var13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[12] = v35;
    v50[13] = CFSTR("_gcL2");
    *(float *)&v21 = a3->var10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51[13] = v22;
    v50[14] = CFSTR("_gcR1");
    *(float *)&v23 = a3->var14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[14] = v24;
    v50[15] = CFSTR("_gcR2");
    *(float *)&v25 = a3->var11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v49 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[15] = v26;
    v50[16] = CFSTR("_gcLThB");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51[16] = v27;
    v50[17] = CFSTR("_gcRThB");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var15);
    v34 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[17] = v28;
    v50[18] = CFSTR("_gcBtHome");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[18] = v29;
    v50[19] = CFSTR("_gcBtMenu");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[19] = v30;
    v50[20] = CFSTR("_gcBtOptions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[20] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v49;
    -[RPMessageable sendEventID:event:destinationID:options:completion:](v34->_messenger, "sendEventID:event:destinationID:options:completion:", CFSTR("_hidGC"), v32, v8, 0, v49);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RPHIDGCSessionErrorDomain"), 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v9[2](v9, v33);

  }
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
