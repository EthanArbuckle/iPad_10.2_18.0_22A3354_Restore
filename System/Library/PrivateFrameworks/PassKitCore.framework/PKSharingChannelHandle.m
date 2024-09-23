@implementation PKSharingChannelHandle

- (PKSharingChannelHandle)init
{

  return 0;
}

- (id)_initWithQueue:(id)a3
{
  id v5;
  PKSharingChannelHandle *v6;
  PKSharingChannelHandle *v7;
  NSMutableArray *v8;
  NSMutableArray *outstandingMessages;
  NSMutableSet *v10;
  NSMutableSet *receivedMessageIdentifiers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSharingChannelHandle;
  v6 = -[PKSharingChannelHandle init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    outstandingMessages = v7->_outstandingMessages;
    v7->_outstandingMessages = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    receivedMessageIdentifiers = v7->_receivedMessageIdentifiers;
    v7->_receivedMessageIdentifiers = v10;

    v7->_status = 0;
  }

  return v7;
}

+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4
{
  return +[PKSharingChannelHandle_Client createHandleForDescriptor:queue:](PKSharingChannelHandle_Client, "createHandleForDescriptor:queue:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[PKSharingChannelHandle invalidateWithSource:completion:](self, "invalidateWithSource:completion:", 3, 0);
  v3.receiver = self;
  v3.super_class = (Class)PKSharingChannelHandle;
  -[PKSharingChannelHandle dealloc](&v3, sel_dealloc);
}

- (BOOL)hasOutstandingMessage
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = 0;
  if (-[PKSharingChannelHandle _lock_isStatusValidForAction:](self, "_lock_isStatusValidForAction:", 0))
    v4 = -[NSMutableArray count](self->_outstandingMessages, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)handleOutstandingMessage:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  PKDeallocationGuard *v10;
  id v11;
  PKDeallocationGuard *v12;
  id v13;
  _QWORD v14[4];
  PKDeallocationGuard *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id location;

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v4[2](v4, 0, &__block_literal_global_192);
LABEL_8:

    return;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_messageBeingHandled)
  {
    -[NSMutableArray firstObject](self->_outstandingMessages, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&self->_messageBeingHandled, v6);
      os_unfair_lock_unlock(&self->_lock);
      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_3;
      aBlock[3] = &unk_1E2AD91F8;
      objc_copyWeak(&v22, &location);
      v8 = v6;
      v20 = v8;
      v21 = v5;
      v9 = _Block_copy(aBlock);
      v10 = [PKDeallocationGuard alloc];
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_4;
      v17[3] = &unk_1E2ABD9A0;
      v11 = v9;
      v18 = v11;
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_5;
      v14[3] = &unk_1E2ABDCE8;
      v12 = -[PKDeallocationGuard initWithBlock:](v10, "initWithBlock:", v17);
      v15 = v12;
      v13 = v11;
      v16 = v13;
      ((void (**)(id, id, void *))v4)[2](v4, v8, v14);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v4[2](v4, 0, &__block_literal_global_43_2);
    }

    goto LABEL_8;
  }
  __break(1u);
}

void __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_3(uint64_t a1, int a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  id v6;
  id v7;
  id *v8;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = (id *)WeakRetained;
    v5 = WeakRetained + 2;
    os_unfair_lock_lock(WeakRetained + 2);
    if (a2)
    {
      objc_msgSend(v8[10], "removeObjectAtIndex:", 0);
      v6 = v8[8];
      v8[8] = 0;

      os_unfair_lock_unlock(v5);
      objc_msgSend(v8, "markMessageAsHandled:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v7 = v8[8];
      v8[8] = 0;

      os_unfair_lock_unlock(v5);
    }
    WeakRetained = (os_unfair_lock_s *)v8;
  }

}

uint64_t __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)waitForMessageWithTimeout:(double)a3 messageHandler:(id)a4 invalidationHandler:(id)a5
{
  id v8;
  id v9;
  PKSharingChannelHandleMessageWaiter *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[PKSharingChannelHandleMessageWaiter initWithTimeout:messageHandler:invalidationHandler:replyQueue:]([PKSharingChannelHandleMessageWaiter alloc], "initWithTimeout:messageHandler:invalidationHandler:replyQueue:", v9, v8, self->_replyQueue, a3);

  -[PKSharingChannelHandleMessageWaiter startForHandle:](v10, "startForHandle:", self);
}

- (void)sendMessageAndWaitForReply:(id)a3 timeout:(double)a4 messageHandler:(id)a5 invalidationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke;
  v14[3] = &unk_1E2AD9220;
  v14[4] = self;
  v15 = v11;
  v17 = a4;
  v16 = v10;
  v12 = v10;
  v13 = v11;
  -[PKSharingChannelHandle sendMessage:completion:](self, "sendMessage:completion:", a3, v14);

}

void __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke(uint64_t a1, char a2)
{
  double v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if ((a2 & 1) != 0)
  {
    v2 = *(double *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke_2;
    v5[3] = &unk_1E2ABE518;
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "waitForMessageWithTimeout:messageHandler:invalidationHandler:", v4, v5, v2);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didReceiveMessages:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v10, "identifier", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[NSMutableSet containsObject:](self->_receivedMessageIdentifiers, "containsObject:", v11) & 1) == 0)
          {
            -[NSMutableSet addObject:](self->_receivedMessageIdentifiers, "addObject:", v11);
            -[NSMutableArray addObject:](self->_outstandingMessages, "addObject:", v10);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
    -[PKSharingChannelHandle _didReceiveMessage](self, "_didReceiveMessage");
  }

}

- (void)_didReceiveMessage
{
  NSObject *replyQueue;
  _QWORD block[5];

  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKSharingChannelHandle__didReceiveMessage__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(replyQueue, block);
}

uint64_t __44__PKSharingChannelHandle__didReceiveMessage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (result)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setMessageReceivedHandler:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id messageReceivedHandler;
  void *v7;
  void (**aBlock)(_QWORD);

  aBlock = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_outstandingMessages, "count"))
    v4 = self->_messageBeingHandled == 0;
  else
    v4 = 0;
  v5 = _Block_copy(aBlock);
  messageReceivedHandler = self->_messageReceivedHandler;
  self->_messageReceivedHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
  v7 = aBlock;
  if (aBlock && v4)
  {
    aBlock[2](aBlock);
    v7 = aBlock;
  }

}

- (void)setInvalidationHandler:(id)a3
{
  void *v4;
  id invalidationHandler;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status > 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (aBlock)
      aBlock[2]();
  }
  else
  {
    v4 = _Block_copy(aBlock);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = v4;

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)attachAndFetchMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke;
  v6[3] = &unk_1E2ABDF68;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKSharingChannelHandle attachWithCompletion:](self, "attachWithCompletion:", v6);

}

void __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke_2;
    v4[3] = &unk_1E2AD9248;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "handleOutstandingMessage:", v4);

  }
}

void __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(uint64_t, _QWORD);
  id v6;

  v5 = *(void (**)(uint64_t, _QWORD))(a3 + 16);
  v6 = a2;
  v5(a3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_lock_isStatusValidForAction:(BOOL)a3
{
  unint64_t status;
  unint64_t v4;
  BOOL v5;
  BOOL v6;

  status = self->_status;
  v4 = status - 2;
  v5 = status == 1 && a3;
  if (status)
    v6 = v5;
  else
    v6 = 1;
  return v4 >= 2 && v6;
}

- (void)invalidate
{
  -[PKSharingChannelHandle invalidateWithSource:completion:](self, "invalidateWithSource:completion:", 0, 0);
}

- (void)invalidateWithCompletion:(id)a3
{
  -[PKSharingChannelHandle invalidateWithSource:completion:](self, "invalidateWithSource:completion:", 0, a3);
}

- (void)invalidateWithSource:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  os_unfair_lock_s *p_lock;
  unint64_t actionAssertionCount;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  id invalidationHandler;
  NSMutableArray *invalidationCompletions;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD);
  void *v29;
  void *v30;
  id didInvalidateReply;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status <= 1)
  {
    actionAssertionCount = self->_actionAssertionCount;
    PKLogFacilityTypeGetObject(0x21uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PKSharingChannelHandle transportIdentifier](self, "transportIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKSharingLoggableMailboxAddress(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (a3 > 4)
        v13 = CFSTR("unknown");
      else
        v13 = off_1E2AD92B8[a3];
      *(_DWORD *)buf = 138412546;
      v40 = v11;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Handle<%@> invalidating from source: '%@'", buf, 0x16u);

    }
    self->_status = 2;
    v16 = (void *)objc_msgSend(self->_invalidationHandler, "copy");
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    invalidationCompletions = self->_invalidationCompletions;
    if (invalidationCompletions)
      v19 = invalidationCompletions;
    else
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = self->_invalidationCompletions;
    self->_invalidationCompletions = v19;

    v21 = self->_invalidationCompletions;
    v22 = _Block_copy(v16);
    -[NSMutableArray safelyAddObject:](v21, "safelyAddObject:", v22);

    v23 = self->_invalidationCompletions;
    v24 = _Block_copy(v6);
    -[NSMutableArray safelyAddObject:](v23, "safelyAddObject:", v24);

    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke;
    aBlock[3] = &unk_1E2ABE120;
    aBlock[4] = self;
    v26 = _Block_copy(aBlock);
    v27 = v26;
    if (a3 - 1 >= 3)
    {
      if (a3 == 4)
      {
        v32[0] = v25;
        v32[1] = 3221225472;
        v32[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_5;
        v32[3] = &unk_1E2ABE058;
        v32[4] = self;
        v33 = v26;
        v28 = (void (**)(_QWORD))_Block_copy(v32);
        v29 = v33;
      }
      else
      {
        if (a3)
        {
          v28 = 0;
          if (!actionAssertionCount)
          {
LABEL_21:

            os_unfair_lock_unlock(&self->_lock);
            if (v28)
            {
              v28[2](v28);

            }
            goto LABEL_23;
          }
LABEL_20:
          v30 = _Block_copy(v28);
          didInvalidateReply = self->_didInvalidateReply;
          self->_didInvalidateReply = v30;

          v28 = 0;
          goto LABEL_21;
        }
        v36[0] = v25;
        v36[1] = 3221225472;
        v36[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_2;
        v36[3] = &unk_1E2ABE058;
        v36[4] = self;
        v37 = v26;
        v28 = (void (**)(_QWORD))_Block_copy(v36);
        v29 = v37;
      }
    }
    else
    {
      v34[0] = v25;
      v34[1] = 3221225472;
      v34[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_4;
      v34[3] = &unk_1E2ABDA18;
      v34[4] = self;
      v35 = v26;
      v28 = (void (**)(_QWORD))_Block_copy(v34);
      v29 = v35;
    }

    if (!actionAssertionCount)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (-[NSMutableArray count](self->_invalidationCompletions, "count") || self->_didInvalidateReply)
  {
    v14 = self->_invalidationCompletions;
    v15 = _Block_copy(v6);
    -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v15);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
      v6[2](v6);
  }
LABEL_23:

}

void __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_3;
  v4[3] = &unk_1E2ABDA18;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "invalidateWithRemoteWithCompletion:", v4);

}

uint64_t __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didInvalidate");
}

uint64_t __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didInvalidate");
}

void __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_5(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_6;
  v2[3] = &unk_1E2ABD9A0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "invalidateWithRemoteWithCompletion:", v2);

}

uint64_t __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didInvalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_status = 3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalid
{
  PKSharingChannelHandle *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_status != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)createActionAssertion
{
  return -[PKSharingChannelHandle createActionAssertionAllowWhileTransferring:](self, "createActionAssertionAllowWhileTransferring:", 0);
}

- (id)createActionAssertionAllowWhileTransferring:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  PKDeallocationGuard *v6;
  _QWORD v8[5];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[PKSharingChannelHandle _lock_isStatusValidForAction:](self, "_lock_isStatusValidForAction:", v3))
  {
    ++self->_actionAssertionCount;
    os_unfair_lock_unlock(p_lock);
    v6 = [PKDeallocationGuard alloc];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__PKSharingChannelHandle_createActionAssertionAllowWhileTransferring___block_invoke;
    v8[3] = &unk_1E2ABE120;
    v8[4] = self;
    return -[PKDeallocationGuard initWithBlock:](v6, "initWithBlock:", v8);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
}

void __70__PKSharingChannelHandle_createActionAssertionAllowWhileTransferring___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  if (v3 == 2)
  {
    if (*(_QWORD *)(v2 + 24) || (v6 = *(void **)(v2 + 32)) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      v4 = 0;
      goto LABEL_12;
    }
    v12 = (id)objc_msgSend(v6, "copy");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 56);
  }
  else
  {
    v12 = 0;
  }
  if (v3 == 1 && !*(_QWORD *)(v2 + 24) && (v9 = *(void **)(v2 + 40)) != 0)
  {
    v5 = (void (**)(_QWORD))objc_msgSend(v9, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  v4 = v12;
  if (v12)
  {
    (*((void (**)(void))v12 + 2))();
    v4 = v12;
  }
  if (v5)
  {
    v5[2](v5);

    v4 = v12;
  }
LABEL_12:

}

- (void)pingWithCompletion:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)attachWithCompletion:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

- (void)closeWithCompletion:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)relinquishWithCompletion:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)markMessageAsHandled:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)invalidateWithRemoteWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)detachHandleForTransfer:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  unint64_t actionAssertionCount;
  void *v8;
  id pendingOwnershipTransfer;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PKSharingChannelHandle *v14;
  id v15;

  v4 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __50__PKSharingChannelHandle_detachHandleForTransfer___block_invoke;
  v13 = &unk_1E2ABE058;
  v14 = self;
  v5 = v4;
  v15 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v10);
  os_unfair_lock_lock(&self->_lock);
  if (-[PKSharingChannelHandle _lock_isStatusValidForAction:](self, "_lock_isStatusValidForAction:", 0, v10, v11, v12, v13, v14))
  {
    actionAssertionCount = self->_actionAssertionCount;
    self->_status = 1;
    if (!actionAssertionCount)
    {
      os_unfair_lock_unlock(&self->_lock);
      v6[2](v6);
      goto LABEL_6;
    }
    v8 = _Block_copy(v6);
    pendingOwnershipTransfer = self->_pendingOwnershipTransfer;
    self->_pendingOwnershipTransfer = v8;

  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_6:

}

uint64_t __50__PKSharingChannelHandle_detachHandleForTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchHandleTransferToken:", *(_QWORD *)(a1 + 40));
}

- (void)fetchHandleTransferToken:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)remoteDeviceInformation:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

+ (void)descriptorsForAccountDevices:(id)a3
{
  id v3;

  v3 = a3;
  if (PKRunningInPassd())
  {
    __break(1u);
  }
  else
  {
    +[PKSharingChannelHandle_Client descriptorsForAccountDevices:](PKSharingChannelHandle_Client, "descriptorsForAccountDevices:", v3);

  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)messageReceivedHandler
{
  return self->_messageReceivedHandler;
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_replyQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong((id *)&self->_receivedMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_messageBeingHandled, 0);
  objc_storeStrong((id *)&self->_invalidationCompletions, 0);
  objc_storeStrong(&self->_pendingOwnershipTransfer, 0);
  objc_storeStrong(&self->_didInvalidateReply, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

uint64_t __65__PKSharingChannelHandle_Client_createHandleForDescriptor_queue___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 == 0;
  return result;
}

void __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v9 = a1[6];
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
}

void __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_4;
  block[3] = &unk_1E2ABDAB8;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v9 = a1[6];
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
}

void __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_4;
  block[3] = &unk_1E2ABDAB8;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v9 = a1[6];
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_4;
  block[3] = &unk_1E2ABDAB8;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v9 = a1[6];
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_4;
  block[3] = &unk_1E2ABDAB8;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v9 = a1[6];
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_4;
  block[3] = &unk_1E2ABDAB8;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__PKSharingChannelHandle_Client_fetchHandleTransferToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_2;
  v3[3] = &unk_1E2ABDA18;
  v5 = a1[6];
  v4 = a1[5];
  dispatch_async(v2, v3);

}

uint64_t __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_4;
  v7[3] = &unk_1E2ABDA18;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__PKSharingChannelHandle_Client__fetchTransportIdentifier__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_4;
  v7[3] = &unk_1E2ABDA18;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
