@implementation TUIKeyboardCandidateMultiplexer

- (TUIKeyboardCandidateMultiplexer)init
{
  TUIKeyboardCandidateMultiplexer *v2;
  uint64_t v3;
  NSMutableDictionary *generators;
  _TUIKeyboardCorrectionListAccumulatorCache *v5;
  _TUIKeyboardCorrectionListAccumulatorCache *pendingRequests;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *receiverQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUIKeyboardCandidateMultiplexer;
  v2 = -[TUIKeyboardCandidateMultiplexer init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    generators = v2->_generators;
    v2->_generators = (NSMutableDictionary *)v3;

    v5 = -[_TUIKeyboardCorrectionListAccumulatorCache initWithSize:]([_TUIKeyboardCorrectionListAccumulatorCache alloc], "initWithSize:", 20);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;

    v2->_enableKbdSource = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.TextInputUI.CandidateMux.Internal", v7);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.TextInputUI.CandidateMux.Receiver", v7);
    receiverQueue = v2->_receiverQueue;
    v2->_receiverQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)receiveExternalAutocorrectionUpdate:(id)a3 requestToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (self->_enableKbdSource)
  {
    -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__TUIKeyboardCandidateMultiplexer_receiveExternalAutocorrectionUpdate_requestToken___block_invoke;
    block[3] = &unk_1E24FBDA8;
    block[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

- (void)addGenerator:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TUIKeyboardCandidateMultiplexer_addGenerator___block_invoke;
  v7[3] = &unk_1E24FC1F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_queueOnly_enabledGenerators
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TUIKeyboardCandidateMultiplexer generators](self, "generators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_4399);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_queueOnly_enabledCandidateSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_enableKbdSource)
    objc_msgSend(v3, "addObject:", &unk_1E2517338);
  -[TUIKeyboardCandidateMultiplexer _queueOnly_enabledGenerators](self, "_queueOnly_enabledGenerators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__TUIKeyboardCandidateMultiplexer__queueOnly_enabledCandidateSources__block_invoke;
  v9[3] = &unk_1E24FB588;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_queueOnly_correctionListAccumulatorFor:(id)a3 keyboardState:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _TUIKeyboardCorrectionListAccumulator *v13;
  _TUIKeyboardCorrectionListAccumulator *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  int v19;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[_TUIKeyboardCorrectionListAccumulatorCache accumulatorForToken:type:](self->_pendingRequests, "accumulatorForToken:type:", v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[TUIKeyboardCandidateMultiplexer _queueOnly_enabledCandidateSources](self, "_queueOnly_enabledCandidateSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TUIKeyboardCorrectionListAccumulatorPolicy standard](_TUIKeyboardCorrectionListAccumulatorPolicy, "standard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "containsObject:", &unk_1E2517350))
      objc_msgSend(v12, "setAccumulatorTimeout:", 3.0);
    v13 = [_TUIKeyboardCorrectionListAccumulator alloc];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke;
    v17[3] = &unk_1E24FB5D8;
    v17[4] = self;
    v18 = v8;
    v19 = v5;
    v14 = -[_TUIKeyboardCorrectionListAccumulator initWithRequestToken:keyboardState:enabledCandidateSources:policy:onComplete:](v13, "initWithRequestToken:keyboardState:enabledCandidateSources:policy:onComplete:", v18, v9, v11, v12, v17);
    -[_TUIKeyboardCorrectionListAccumulatorCache addToCache:type:](self->_pendingRequests, "addToCache:type:", v14, v5);

  }
  -[_TUIKeyboardCorrectionListAccumulatorCache accumulatorForToken:type:](self->_pendingRequests, "accumulatorForToken:type:", v8, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4 fromCandidate:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = (void *)objc_msgSend(a3, "copy");
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken_fromCandidate___block_invoke;
  block[3] = &unk_1E24FBDA8;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken___block_invoke;
  block[3] = &unk_1E24FBDA8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_queueOnly_generateCandidatesForKeyboardState:(id)a3 requestToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  TUIKeyboardCandidateMultiplexer *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  -[TUIKeyboardCandidateMultiplexer _queueOnly_enabledGenerators](self, "_queueOnly_enabledGenerators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[TUIKeyboardCandidateMultiplexer candidateReceiver](self, "candidateReceiver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v9)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__4377;
      v15[4] = __Block_byref_object_dispose__4378;
      -[TUIKeyboardCandidateMultiplexer _queueOnly_correctionListAccumulatorFor:keyboardState:type:](self, "_queueOnly_correctionListAccumulatorFor:keyboardState:type:", v7, v6, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[TUIKeyboardCandidateMultiplexer _queueOnly_enabledGenerators](self, "_queueOnly_enabledGenerators");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke;
      v11[3] = &unk_1E24FB650;
      v12 = v6;
      v13 = self;
      v14 = v15;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

      _Block_object_dispose(v15, 8);
    }
  }
  else
  {

  }
}

- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(a4, "copy");
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__TUIKeyboardCandidateMultiplexer_candidateAccepted_keyboardState_candidateRequestToken___block_invoke;
  v15[3] = &unk_1E24FBDD0;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_queueOnly_candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUIKeyboardCandidateMultiplexer _queueOnly_enabledGenerators](self, "_queueOnly_enabledGenerators");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__TUIKeyboardCandidateMultiplexer__queueOnly_candidateAccepted_keyboardState_candidateRequestToken___block_invoke;
  v15[3] = &unk_1E24FB678;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

}

- (id)_queueOnly_mergeKBDCorrections:(id)a3 withTextEffectsCorrections:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v8 = 0;
    goto LABEL_18;
  }
  if (!v5)
  {
    v25 = (id)v6;
LABEL_17:
    v8 = v25;
    goto LABEL_18;
  }
  if (!v6)
  {
    v25 = (id)v5;
    goto LABEL_17;
  }
  objc_msgSend((id)v6, "corrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v7;
  else
    v10 = (void *)v5;
  objc_msgSend(v10, "corrections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictions");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v7, "predictions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      objc_msgSend(v7, "predictions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v18);

    }
  }
  objc_msgSend((id)v5, "predictions");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend((id)v5, "predictions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      objc_msgSend((id)v5, "predictions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v24);

    }
  }
  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v8;
}

- (void)_queueOnly_performUpdatesToCandidateReceiverForRequest:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((_DWORD)v4 == 1
    || (-[_TUIKeyboardCorrectionListAccumulatorCache accumulatorForToken:type:](self->_pendingRequests, "accumulatorForToken:type:", v6, 1), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    -[_TUIKeyboardCorrectionListAccumulatorCache accumulatorForToken:type:](self->_pendingRequests, "accumulatorForToken:type:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_14;
    if (objc_msgSend(v8, "hasCorrectionsForCandidateSource:", 2))
    {
      objc_msgSend(v9, "correctionsForCandidateSource:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyboardState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyboardCandidateMultiplexer _sendSmartRepliesTelemetryForCandidates:forKeyboardState:](self, "_sendSmartRepliesTelemetryForCandidates:forKeyboardState:", v10, v11);
      goto LABEL_12;
    }
    if (objc_msgSend(v9, "hasCorrectionsForCandidateSource:", 1))
    {
      v12 = v9;
      v13 = 1;
    }
    else
    {
      if (objc_msgSend(v9, "hasCorrectionsForCandidateSource:", 3))
      {
        objc_msgSend(v9, "correctionsForCandidateSource:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "correctionsForCandidateSource:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyboardCandidateMultiplexer _queueOnly_mergeKBDCorrections:withTextEffectsCorrections:](self, "_queueOnly_mergeKBDCorrections:withTextEffectsCorrections:", v14, v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        if (v10)
        {
LABEL_13:
          -[TUIKeyboardCandidateMultiplexer receiverQueue](self, "receiverQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __95__TUIKeyboardCandidateMultiplexer__queueOnly_performUpdatesToCandidateReceiverForRequest_type___block_invoke;
          block[3] = &unk_1E24FBDA8;
          block[4] = self;
          v18 = v10;
          v19 = v6;
          v16 = v10;
          dispatch_async(v15, block);

        }
LABEL_14:

        goto LABEL_15;
      }
      if (!objc_msgSend(v9, "hasCorrectionsForCandidateSource:", 0))
        goto LABEL_14;
      v12 = v9;
      v13 = 0;
    }
    objc_msgSend(v12, "correctionsForCandidateSource:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_15:

}

- (void)_sendSmartRepliesTelemetryForCandidates:(id)a3 forKeyboardState:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(a4, "inputContextHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "corrections");
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v7, "alternateCorrections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "candidateProperty");

  if ((v7 & 2) != 0 && v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:](TUIInputAnalytics, "didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:", 4, v11, 0, v12, 0);

  }
}

- (void)syncToKeyboardState:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TUIKeyboardCandidateMultiplexer_syncToKeyboardState___block_invoke;
  v7[3] = &unk_1E24FC1F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)willHandleDeliveryForCandidates:(id)a3 requestToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__TUIKeyboardCandidateMultiplexer_willHandleDeliveryForCandidates_requestToken___block_invoke;
  v12[3] = &unk_1E24FB6A0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v6) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (BOOL)_queueOnly_willHandleDeliveryForCandidates:(id)a3 requestToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "predictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKeyboardCandidateMultiplexer _queueOnly_correctionListAccumulatorFor:keyboardState:type:](self, "_queueOnly_correctionListAccumulatorFor:keyboardState:type:", v6, 0, (objc_msgSend(v9, "customInfoType") >> 5) & 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateWithCorrections:forType:", v7, 0);
  return 1;
}

- (NSString)debugDescription
{
  NSObject *v3;
  void *v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4377;
  v11 = __Block_byref_object_dispose__4378;
  v12 = 0;
  -[TUIKeyboardCandidateMultiplexer internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TUIKeyboardCandidateMultiplexer_debugDescription__block_invoke;
  block[3] = &unk_1E24FB6C8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, enabledGenerators: %@>"), objc_opt_class(), self, v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (TUIKeyboardCandidateReceiver)candidateReceiver
{
  return (TUIKeyboardCandidateReceiver *)objc_loadWeakRetained((id *)&self->_candidateReceiver);
}

- (void)setCandidateReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_candidateReceiver, a3);
}

- (BOOL)enableKbdSource
{
  return self->_enableKbdSource;
}

- (void)setEnableKbdSource:(BOOL)a3
{
  self->_enableKbdSource = a3;
}

- (NSMutableDictionary)generators
{
  return self->_generators;
}

- (void)setGenerators:(id)a3
{
  objc_storeStrong((id *)&self->_generators, a3);
}

- (_TUIKeyboardCorrectionListAccumulatorCache)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_generators, 0);
  objc_destroyWeak((id *)&self->_candidateReceiver);
}

void __51__TUIKeyboardCandidateMultiplexer_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queueOnly_enabledGenerators");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __80__TUIKeyboardCandidateMultiplexer_willHandleDeliveryForCandidates_requestToken___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queueOnly_willHandleDeliveryForCandidates:requestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __55__TUIKeyboardCandidateMultiplexer_syncToKeyboardState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "generators", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "syncToKeyboardState:", *(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __95__TUIKeyboardCandidateMultiplexer__queueOnly_performUpdatesToCandidateReceiverForRequest_type___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "candidateReceiver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushAutocorrections:requestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __100__TUIKeyboardCandidateMultiplexer__queueOnly_candidateAccepted_keyboardState_candidateRequestToken___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "candidateAccepted:keyboardState:candidateRequestToken:", a1[4], a1[5], a1[6]);

}

uint64_t __89__TUIKeyboardCandidateMultiplexer_candidateAccepted_keyboardState_candidateRequestToken___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queueOnly_candidateAccepted:keyboardState:candidateRequestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = objc_msgSend(*(id *)(a1 + 40), "candidateProperty");
  if ((result & 0x10) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "generateCandidatesForKeyboardState:requestToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

void __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_2;
  v8[3] = &unk_1E24FB628;
  v5 = a1[4];
  v4 = a1[5];
  v6 = a1[6];
  v9 = v3;
  v10 = v6;
  v8[4] = v4;
  v7 = v3;
  objc_msgSend(v7, "generateCandidatesForKeyboardState:completion:", v5, v8);

}

void __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_3;
  block[3] = &unk_1E24FB600;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __94__TUIKeyboardCandidateMultiplexer__queueOnly_generateCandidatesForKeyboardState_requestToken___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "updateWithCorrections:forType:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "candidateSourceType"));
}

uint64_t __83__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueOnly_generateCandidatesForKeyboardState:requestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __97__TUIKeyboardCandidateMultiplexer_generateCandidatesForKeyboardState_requestToken_fromCandidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueOnly_generateCandidatesForKeyboardState:requestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke_2;
  block[3] = &unk_1E24FB5B0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_DWORD *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __94__TUIKeyboardCandidateMultiplexer__queueOnly_correctionListAccumulatorFor_keyboardState_type___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueOnly_performUpdatesToCandidateReceiverForRequest:type:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __69__TUIKeyboardCandidateMultiplexer__queueOnly_enabledCandidateSources__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "candidateSourceType"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __63__TUIKeyboardCandidateMultiplexer__queueOnly_enabledGenerators__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enabled");
}

void __48__TUIKeyboardCandidateMultiplexer_addGenerator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "generators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "candidateSourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    TUICandidateGenerationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_18C785000, v5, OS_LOG_TYPE_ERROR, "generator of same source type already exists, should only be one per source", v9, 2u);
    }

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "generators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "candidateSourceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

void __84__TUIKeyboardCandidateMultiplexer_receiveExternalAutocorrectionUpdate_requestToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queueOnly_correctionListAccumulatorFor:keyboardState:type:", *(_QWORD *)(a1 + 40), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithCorrections:forType:", *(_QWORD *)(a1 + 48), 0);

}

@end
