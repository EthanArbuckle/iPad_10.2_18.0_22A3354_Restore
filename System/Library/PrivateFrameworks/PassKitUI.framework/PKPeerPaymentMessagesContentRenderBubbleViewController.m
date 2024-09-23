@implementation PKPeerPaymentMessagesContentRenderBubbleViewController

- (void)loadView
{
  PKPeerPaymentBubbleView *bubbleView;
  PKPeerPaymentBubbleView *v4;
  PKPeerPaymentBubbleView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentBubbleView *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id location;

  bubbleView = self->_bubbleView;
  if (!bubbleView)
  {
    v4 = objc_alloc_init(PKPeerPaymentBubbleView);
    v5 = self->_bubbleView;
    self->_bubbleView = v4;

    -[PKPeerPaymentBubbleView setDisplaysApplePayLogo:](self->_bubbleView, "setDisplaysApplePayLogo:", 1);
    -[PKPeerPaymentBubbleView setLiveRenderingEnabled:](self->_bubbleView, "setLiveRenderingEnabled:", 1);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__bubbleViewPanned);
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__bubbleViewDoubleTapped);
    objc_msgSend(v7, "setNumberOfTapsRequired:", 2);
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__bubbleViewLongPressed);
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v8);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__bubbleViewSelected);
    objc_msgSend(v9, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v6);
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v7);
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v8);
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v9);
    objc_initWeak(&location, self);
    v10 = self->_bubbleView;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke;
    v14 = &unk_1E3E6F8A0;
    objc_copyWeak(&v15, &location);
    -[PKPeerPaymentBubbleView setActionHandler:](v10, "setActionHandler:", &v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    bubbleView = self->_bubbleView;
  }
  -[PKPeerPaymentMessagesContentRenderBubbleViewController setView:](self, "setView:", bubbleView, v11, v12, v13, v14);
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3 == 2)
    {
      objc_msgSend(v5, "setShowsActionSpinner:", 1);
      objc_msgSend(WeakRetained, "appController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_4;
      v10[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v12, v6);
      v11 = v5;
      objc_msgSend(v9, "handleAction:sender:completion:", 4, v11, v10);

      objc_destroyWeak(&v12);
    }
    else if (a3 == 1)
    {
      objc_msgSend(v5, "setShowsActionSpinner:", 1);
      objc_msgSend(WeakRetained, "appController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_2;
      v13[3] = &unk_1E3E62288;
      v14 = v5;
      objc_msgSend(v8, "handleAction:sender:completion:", 3, v14, v13);

    }
  }

}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_3;
  block[3] = &unk_1E3E612E8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowsActionSpinner:", 0);
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_4(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_5;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowsActionSpinner:", 0);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "updateWithPeerPaymentStatus:animated:", 1, 1);
      v4 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_6;
      block[3] = &unk_1E3E61310;
      objc_copyWeak(&v6, v2);
      dispatch_after(v4, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v6);
    }
  }

}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resizeBubbleViewToReferenceSizeAnimated");
    WeakRetained = v2;
  }

}

- (void)reloadContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPeerPaymentMessage *currentMessage;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v12;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerPaymentMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  currentMessage = self->_currentMessage;
  if (!currentMessage
    || (-[PKPeerPaymentMessage identifier](currentMessage, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentMessage, v6);
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218242;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: rendering message : %@", (uint8_t *)&v12, 0x16u);
    }

    -[PKPeerPaymentBubbleView updateWithPeerPaymentMessage:animated:](self->_bubbleView, "updateWithPeerPaymentMessage:animated:", v6, 0);
    if (objc_msgSend(v6, "type") == 2
      && !-[PKPeerPaymentMessagesContentRenderBubbleViewController _isMessageFromMe:](self, "_isMessageFromMe:", v6))
    {
      -[PKPeerPaymentBubbleView setAction:animated:](self->_bubbleView, "setAction:animated:", 1, 0);
    }
    -[PKPeerPaymentBubbleView sizeToFit](self->_bubbleView, "sizeToFit");
  }
  -[PKPeerPaymentMessagesContentRenderBubbleViewController _fetchStatus](self, "_fetchStatus");

}

- (BOOL)_isMessageFromMe:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(a3, "underlyingMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderParticipantIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeConversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localParticipantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 && v8)
    v9 = objc_msgSend(v5, "isEqual:", v8);

  return v9;
}

- (BOOL)_isMessage:(id)a3 validForTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;
  NSObject *v13;
  int v15;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "peerPaymentMessageReceivedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "underlyingMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPeerPaymentMessagesContentRenderBubbleViewController _isMessageFromMe:](self, "_isMessageFromMe:", v6))
  {
    v11 = 1;
  }
  else
  {
    v11 = 1;
    if (objc_msgSend(v6, "hasBeenSent"))
    {
      if (v8)
      {
        if (v10)
        {
          objc_msgSend(v8, "timeIntervalSinceDate:", v10);
          if (fabs(v12) >= 1.0)
          {
            PKLogFacilityTypeGetObject();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v15 = 134219010;
              v16 = self;
              v17 = 2112;
              v18 = v6;
              v19 = 2112;
              v20 = v7;
              v21 = 2114;
              v22 = v10;
              v23 = 2114;
              v24 = v8;
              _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Message: %@ is not valid for Transaction: %@. (%{public}@ != %{public}@)", (uint8_t *)&v15, 0x34u);
            }

            v11 = 0;
          }
        }
      }
    }
  }

  return v11;
}

- (id)bubbleView
{
  return self->_bubbleView;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPeerPaymentMessagesContentRenderBubbleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (!self->_currentMessage)
    -[PKPeerPaymentMessagesContentRenderBubbleViewController reloadContent](self, "reloadContent");
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v7 = self->_pendingBubbleViewSize.width;
  v8 = self->_pendingBubbleViewSize.height;
  if (*MEMORY[0x1E0C9D820] == v7 && v6 == v8)
    -[PKPeerPaymentBubbleView sizeThatFits:](self->_bubbleView, "sizeThatFits:", width, height, *MEMORY[0x1E0C9D820], v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)generatedSnapshot
{
  return -[PKPeerPaymentBubbleView generatedSnapshot](self->_bubbleView, "generatedSnapshot");
}

- (void)_fetchStatus
{
  PKPeerPaymentMessage *v3;
  PKPeerPaymentBubbleView *bubbleView;
  id *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  PKPeerPaymentBubbleView *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  PKPeerPaymentMessage *v15;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  objc_initWeak(&location, self);
  v3 = self->_currentMessage;
  if (PKUseMockSURFServer())
  {
    if (-[PKPeerPaymentMessage type](v3, "type") == 1)
    {
      -[PKPeerPaymentBubbleView setAction:animated:](self->_bubbleView, "setAction:animated:", 0, 0);
      -[PKPeerPaymentBubbleView setState:animated:](self->_bubbleView, "setState:animated:", 5, 0);
    }
    -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToReferenceSizeAnimated](self, "_resizeBubbleViewToReferenceSizeAnimated");
    bubbleView = self->_bubbleView;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke;
    v18[3] = &unk_1E3E61310;
    objc_copyWeak(&v19, &location);
    -[PKPeerPaymentBubbleView performPostRender:](bubbleView, "performPostRender:", v18);
    v5 = &v19;
  }
  else
  {
    if (!v3 || -[PKPeerPaymentMessage type](v3, "type") != 1)
    {
      -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "noteReadyForDisplay");

      goto LABEL_11;
    }
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "peerPaymentRequiresEnablement");

    if (v7)
    {
      -[PKPeerPaymentBubbleView setState:animated:](self->_bubbleView, "setState:animated:", 10, 0);
      -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "noteReadyForDisplay");

      -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToReferenceSizeAnimated](self, "_resizeBubbleViewToReferenceSizeAnimated");
      goto LABEL_11;
    }
    if (-[PKPeerPaymentMessagesContentRenderBubbleViewController _isMessageFromMe:](self, "_isMessageFromMe:", v3)
      && !-[PKPeerPaymentMessage hasBeenSent](v3, "hasBeenSent"))
    {
      v11 = self->_bubbleView;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_286;
      v12[3] = &unk_1E3E61B68;
      objc_copyWeak(&v13, &location);
      v12[4] = self;
      -[PKPeerPaymentBubbleView performPostRender:](v11, "performPostRender:", v12);
      v5 = &v13;
    }
    else
    {
      -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2;
      v14[3] = &unk_1E3E6F8F0;
      objc_copyWeak(&v17, &location);
      v15 = v3;
      v16 = self;
      objc_msgSend(v10, "localStatusForMessage:completion:", v15, v14);

      v5 = &v17;
    }
  }
  objc_destroyWeak(v5);
LABEL_11:

  objc_destroyWeak(&location);
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "appController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "noteReadyForDisplay");

    WeakRetained = v3;
  }

}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD *v5;
  _BYTE *v6;
  NSObject *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3;
    block[3] = &unk_1E3E61EE8;
    objc_copyWeak(&v16, a1 + 6);
    v14 = a1[4];
    v4 = v3;
    v15 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v16);
    v5 = a1 + 5;
    if (*((_BYTE *)a1[5] + 1000) || objc_msgSend(v4, "peerPaymentStatus"))
      goto LABEL_9;
    v6 = (_BYTE *)*v5;
  }
  else
  {
    v5 = a1 + 5;
    v6 = a1[5];
    if (v6[1000])
      goto LABEL_9;
  }
  v6[1000] = 1;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (_BYTE *)*v5;
    *(_DWORD *)buf = 134217984;
    v18 = v8;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Fetching remote status.", buf, 0xCu);
  }

  objc_msgSend(a1[5], "appController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[4];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_279;
  v11[3] = &unk_1E3E6F8C8;
  objc_copyWeak(&v12, a1 + 6);
  v11[4] = a1[5];
  objc_msgSend(v9, "remoteStatusForMessage:completion:", v10, v11);

  objc_destroyWeak(&v12);
LABEL_9:

}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_isMessage:validForTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = v3[123];
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "appController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateWithPaymentTransaction:animated:", v6, objc_msgSend(v7, "appReadyForDisplay"));
    }
    else
    {
      objc_msgSend(v3, "appController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setState:animated:", 9, objc_msgSend(v7, "appReadyForDisplay"));
    }

    if (objc_msgSend(v3[123], "state") != 4)
    {
      v8 = v3[123];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4;
      v9[3] = &unk_1E3E612E8;
      v9[4] = v3;
      objc_msgSend(v8, "performPostRender:", v9);
    }
  }

}

uint64_t __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteReadyForDisplay");

  return objc_msgSend(*(id *)(a1 + 32), "_resizeBubbleViewToReferenceSizeAnimated");
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_280;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_280(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  dispatch_time_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1000) = 0;
    v5 = WeakRetained[123];
    v6 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend((id)objc_opt_class(), "referenceSizeForPeerPaymentStatusResponse:", *(_QWORD *)(a1 + 32));
      v8 = v7;
      v10 = v9;
      objc_msgSend(v4[123], "frame");
      if (v10 <= v11)
      {
        v14 = v4[123];
        v15 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v4, "appController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateWithPeerPaymentStatusResponse:animated:", v15, objc_msgSend(v16, "appReadyForDisplay"));

        v17 = dispatch_time(0, 300000000);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4_282;
        block[3] = &unk_1E3E61310;
        objc_copyWeak(&v22, v2);
        dispatch_after(v17, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v22);
      }
      else
      {
        v23[0] = v6;
        v23[1] = 3221225472;
        v23[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3_281;
        v23[3] = &unk_1E3E61388;
        v23[4] = v4;
        v24 = *(id *)(a1 + 32);
        objc_msgSend(v4, "_resizeBubbleViewToSize:completion:", v23, v8, v10);

      }
    }
    else
    {
      objc_msgSend(v5, "setState:animated:", 10, 1);
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        v26 = v13;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Failed to get remote status.", buf, 0xCu);
      }

      objc_msgSend(v4, "_resizeBubbleViewToReferenceSizeAnimated");
    }
    v18 = v4[123];
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_283;
    v19[3] = &unk_1E3E61310;
    objc_copyWeak(&v20, v2);
    objc_msgSend(v18, "performPostRender:", v19);
    objc_destroyWeak(&v20);
  }

}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3_281(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
  objc_msgSend(*(id *)(a1 + 32), "appController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithPeerPaymentStatusResponse:animated:", v1, objc_msgSend(v3, "appReadyForDisplay"));

}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4_282(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resizeBubbleViewToReferenceSizeAnimated");
    WeakRetained = v2;
  }

}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_283(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "appController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "noteReadyForDisplay");

    WeakRetained = v3;
  }

}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_286(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "appController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "noteReadyForDisplay");

    WeakRetained = v4;
  }

}

- (void)_resizeBubbleViewToReferenceSizeAnimated
{
  -[PKPeerPaymentBubbleView referenceSize](self->_bubbleView, "referenceSize");
  -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToSize:completion:](self, "_resizeBubbleViewToSize:completion:", 0);
}

- (void)_resizeBubbleViewToSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void (**v7)(_QWORD);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  id v22[3];
  id location;
  uint8_t buf[4];
  PKPeerPaymentMessagesContentRenderBubbleViewController *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  NSSize v31;
  NSSize v32;
  NSSize v33;

  height = a3.height;
  width = a3.width;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  v10 = v9;
  v12 = v11;

  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (width == v10 && height == v12)
  {
    if (v14)
    {
      v31.width = width;
      v31.height = height;
      NSStringFromSize(v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: No bubble view resize needed. Size: %{public}@.", buf, 0x16u);

    }
    if (v7)
      v7[2](v7);
  }
  else
  {
    if (v14)
    {
      v32.width = width;
      v32.height = height;
      NSStringFromSize(v32);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v33.width = v10;
      v33.height = v12;
      NSStringFromSize(v33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2114;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Resize bubble view to size: %{public}@ content size: %{public}@.", buf, 0x20u);

    }
    self->_pendingBubbleViewSize.width = width;
    self->_pendingBubbleViewSize.height = height;
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "noteContentSizeNeedsUpdate");

    v19 = dispatch_time(0, 800000000);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __93__PKPeerPaymentMessagesContentRenderBubbleViewController__resizeBubbleViewToSize_completion___block_invoke;
    v20[3] = &unk_1E3E6F918;
    objc_copyWeak(v22, &location);
    v20[4] = self;
    v22[1] = *(id *)&width;
    v22[2] = *(id *)&height;
    v21 = v7;
    dispatch_after(v19, MEMORY[0x1E0C80D38], v20);

    objc_destroyWeak(v22);
  }
  objc_destroyWeak(&location);

}

void __93__PKPeerPaymentMessagesContentRenderBubbleViewController__resizeBubbleViewToSize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1008) = *MEMORY[0x1E0C9D820];
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
    objc_msgSend(v2, "frame");
    objc_msgSend(v2, "setFrame:");
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }

}

- (void)_bubbleViewSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerPaymentMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_11;
  if (objc_msgSend(v6, "type") == 1
    && objc_msgSend(v6, "hasBeenSent")
    && -[PKPeerPaymentBubbleView state](self->_bubbleView, "state") != 9)
  {
    -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleAction:sender:completion:](v9, "handleAction:sender:completion:", 6, self, 0);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v6, "type") != 3 || !objc_msgSend(v6, "hasBeenSent"))
  {
LABEL_11:
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Ignoring bubble tap on message: %@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isFromMe"))
    v7 = 8;
  else
    v7 = 5;
  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleAction:sender:completion:", v7, self, 0);

LABEL_14:
}

- (void)_bubbleViewPanned
{
  NSObject *v3;
  int v4;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Pan gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_bubbleViewDoubleTapped
{
  NSObject *v3;
  int v4;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Double tap gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_bubbleViewLongPressed
{
  NSObject *v3;
  int v4;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Long press gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_bubbleView, 0);
}

@end
