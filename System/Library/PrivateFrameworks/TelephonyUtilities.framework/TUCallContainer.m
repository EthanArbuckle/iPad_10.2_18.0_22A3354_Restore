@implementation TUCallContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calls, 0);
}

- (unint64_t)currentCallCount
{
  return -[TUCallContainer countOfCallsPassingTest:](self, "countOfCallsPassingTest:", TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate);
}

- (TUCallContainer)initWithCalls:(id)a3
{
  id v4;
  TUCallContainer *v5;
  uint64_t v6;
  NSArray *calls;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUCallContainer;
  v5 = -[TUCallContainer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    calls = v5->_calls;
    v5->_calls = (NSArray *)v6;

  }
  return v5;
}

- (id)callPassingTest:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__TUCallContainer_callPassingTest_withOptions___block_invoke;
  v9[3] = &unk_1E38A23C0;
  v9[4] = &v10;
  -[TUCallContainer enumerateCallsWithOptions:invokingBlock:forCallsPassingTest:](self, "enumerateCallsWithOptions:invokingBlock:forCallsPassingTest:", a4, v9, v6);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (unint64_t)countOfCallsPassingTest:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__TUCallContainer_countOfCallsPassingTest___block_invoke;
  v7[3] = &unk_1E38A23C0;
  v7[4] = &v8;
  -[TUCallContainer enumerateCallsInvokingBlock:forCallsPassingTest:](self, "enumerateCallsInvokingBlock:forCallsPassingTest:", v7, v4);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)enumerateCallsWithOptions:(unint64_t)a3 invokingBlock:(id)a4 forCallsPassingTest:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v10 = a4;
  v8 = a5;
  if (v10 && v8)
  {
    -[TUCallContainer calls](self, "calls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__TUCallContainer_enumerateCallsWithOptions_invokingBlock_forCallsPassingTest___block_invoke;
    v11[3] = &unk_1E38A2338;
    v12 = v8;
    v13 = v10;
    objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", a3, v11);

  }
}

- (NSArray)calls
{
  return self->_calls;
}

- (void)enumerateCallsInvokingBlock:(id)a3 forCallsPassingTest:(id)a4
{
  -[TUCallContainer enumerateCallsWithOptions:invokingBlock:forCallsPassingTest:](self, "enumerateCallsWithOptions:invokingBlock:forCallsPassingTest:", 0, a3, a4);
}

- (id)callPassingTest:(id)a3
{
  return -[TUCallContainer callPassingTest:withOptions:](self, "callPassingTest:withOptions:", a3, 0);
}

- (TUCall)activeVideoCall
{
  return (TUCall *)-[TUCallContainer callPassingTest:](self, "callPassingTest:", &__block_literal_global_23);
}

- (NSArray)displayedCalls
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallContainer conferenceCall](self, "conferenceCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "arrayByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)conferenceCall
{
  return -[TUCallContainer callPassingTest:sortedUsingComparator:](self, "callPassingTest:sortedUsingComparator:", &__block_literal_global_13, &__block_literal_global_16);
}

- (id)callsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__TUCallContainer_callsPassingTest___block_invoke;
  v8[3] = &unk_1E38A23C0;
  v8[4] = &v9;
  -[TUCallContainer enumerateCallsInvokingBlock:forCallsPassingTest:](self, "enumerateCallsInvokingBlock:forCallsPassingTest:", v8, v4);
  v5 = (void *)v10[5];
  if (v5)
    v6 = (void *)objc_msgSend(v5, "copy");
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)callPassingTest:(id)a3 sortedUsingComparator:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__TUCallContainer_callPassingTest_sortedUsingComparator___block_invoke;
  v11[3] = &unk_1E38A2450;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  -[TUCallContainer enumerateCallsInvokingBlock:forCallsPassingTest:](self, "enumerateCallsInvokingBlock:forCallsPassingTest:", v11, v6);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (TUCallContainer)init
{
  return -[TUCallContainer initWithCalls:](self, "initWithCalls:", MEMORY[0x1E0C9AA60]);
}

void __79__TUCallContainer_enumerateCallsWithOptions_invokingBlock_forCallsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isPTT") & 1) == 0 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __36__TUCallContainer_callsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);

}

- (NSArray)currentCalls
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate);
}

- (NSArray)currentVideoCalls
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_18);
}

- (NSArray)currentAudioAndVideoCalls
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_5_0);
}

- (NSArray)incomingCalls
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_9_0);
}

uint64_t __33__TUCallContainer_displayedCalls__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (TUCallCenterDisplayedAudioCallPredicate_block_invoke_12((uint64_t)v2, v2)
    && !objc_msgSend(v2, "isConferenced"))
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isConversation");
  }

  return v3;
}

- (NSArray)displayedAudioAndVideoCalls
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallContainer conferenceCall](self, "conferenceCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "arrayByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

uint64_t __46__TUCallContainer_displayedAudioAndVideoCalls__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "status") - 1 > 2)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isConferenced") ^ 1;

  return v3;
}

- (NSArray)conferenceParticipantCalls
{
  void *v2;
  void *v3;

  -[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)callsHostedElsewhere
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_20_0);
}

uint64_t __39__TUCallContainer_callsHostedElsewhere__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHostedOnCurrentDevice") ^ 1;
}

- (NSArray)callsWithAnEndpointElsewhere
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_21);
}

uint64_t __47__TUCallContainer_callsWithAnEndpointElsewhere__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEndpointOnCurrentDevice") ^ 1;
}

- (NSArray)callsHostedOrAnEndpointElsewhere
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_22_0);
}

uint64_t __51__TUCallContainer_callsHostedOrAnEndpointElsewhere__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isHostedOnCurrentDevice"))
    v3 = objc_msgSend(v2, "isEndpointOnCurrentDevice") ^ 1;
  else
    v3 = 1;

  return v3;
}

- (NSArray)callsOnDefaultPairedDevice
{
  return (NSArray *)-[TUCallContainer callsPassingTest:](self, "callsPassingTest:", &__block_literal_global_6_0);
}

- (id)callsWithStatus:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__TUCallContainer_callsWithStatus___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v5 = a3;
  -[TUCallContainer callsPassingTest:](self, "callsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __35__TUCallContainer_callsWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "status") == *(_DWORD *)(a1 + 32))
    v4 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v3);
  else
    v4 = 0;

  return v4;
}

- (id)audioAndVideoCallsWithStatus:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__TUCallContainer_audioAndVideoCallsWithStatus___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v5 = a3;
  -[TUCallContainer callsPassingTest:](self, "callsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__TUCallContainer_audioAndVideoCallsWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "status");
  if ((_DWORD)v4 == *(_DWORD *)(a1 + 32))
    v5 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v4, v3);
  else
    v5 = 0;

  return v5;
}

- (id)callsWithGroupUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__TUCallContainer_callsWithGroupUUID___block_invoke;
  v8[3] = &unk_1E38A2428;
  v9 = v4;
  v5 = v4;
  -[TUCallContainer callsPassingTest:](self, "callsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __38__TUCallContainer_callsWithGroupUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "callGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

void __47__TUCallContainer_callPassingTest_withOptions___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __57__TUCallContainer_callPassingTest_sortedUsingComparator___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = v4;
  if (!*(_QWORD *)(v5 + 40))
    goto LABEL_5;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
    goto LABEL_5;
  if ((*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, v6) == -1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_5:
    objc_storeStrong((id *)(v5 + 40), a2);
  }

}

- (TUCall)incomingCall
{
  return (TUCall *)-[TUCallContainer callPassingTest:](self, "callPassingTest:", &__block_literal_global_9_0);
}

- (TUCall)incomingVideoCall
{
  return (TUCall *)-[TUCallContainer callPassingTest:withOptions:](self, "callPassingTest:withOptions:", &__block_literal_global_10_0, 2);
}

BOOL __34__TUCallContainer_activeVideoCall__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "isVideo"))
  {
    v3 = objc_msgSend(v2, "status");
    v5 = v3 == 2 || (v3 & 0xFFFFFFFD) == 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TUCall)currentVideoCall
{
  void *v3;
  void *v4;

  -[TUCallContainer incomingVideoCall](self, "incomingVideoCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[TUCallContainer activeVideoCall](self, "activeVideoCall");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[TUCallContainer currentVideoCalls](self, "currentVideoCalls");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        objc_msgSend(v4, "lastObject");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  return (TUCall *)v3;
}

- (TUCall)screeningCall
{
  return (TUCall *)-[TUCallContainer callPassingTest:](self, "callPassingTest:", &__block_literal_global_14);
}

- (id)callWithStatus:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__TUCallContainer_callWithStatus___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v5 = a3;
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __34__TUCallContainer_callWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "status") == *(_DWORD *)(a1 + 32))
    v4 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v3);
  else
    v4 = 0;

  return v4;
}

- (id)videoCallWithStatus:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__TUCallContainer_videoCallWithStatus___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v5 = a3;
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __39__TUCallContainer_videoCallWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "status") == *(_DWORD *)(a1 + 32))
    v4 = objc_msgSend(v3, "isVideo");
  else
    v4 = 0;

  return v4;
}

- (id)audioOrVideoCallWithStatus:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__TUCallContainer_audioOrVideoCallWithStatus___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v5 = a3;
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __46__TUCallContainer_audioOrVideoCallWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "status");
  if ((_DWORD)v4 == *(_DWORD *)(a1 + 32))
    v5 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v4, v3);
  else
    v5 = 0;

  return v5;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__TUCallContainer_callWithUniqueProxyIdentifier___block_invoke;
  v8[3] = &unk_1E38A2428;
  v9 = v4;
  v5 = v4;
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __49__TUCallContainer_callWithUniqueProxyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)callWithCallUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__TUCallContainer_callWithCallUUID___block_invoke;
  v8[3] = &unk_1E38A2428;
  v9 = v4;
  v5 = v4;
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __36__TUCallContainer_callWithCallUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "callUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)displayedCall
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t aBlock;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  int v19;

  v3 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = TUCallCenterCallDateConnectedComparator_block_invoke_17;
  v18 = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v19 = 3;
  v4 = _Block_copy(&aBlock);
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock = v3;
  v16 = 3221225472;
  v17 = TUCallCenterCallDateConnectedComparator_block_invoke_17;
  v18 = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v19 = 1;
  v6 = _Block_copy(&aBlock);
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock = v3;
  v16 = 3221225472;
  v17 = TUCallCenterCallDateConnectedComparator_block_invoke_17;
  v18 = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v19 = 4;
  v8 = _Block_copy(&aBlock);
  -[TUCallContainer callPassingTest:](self, "callPassingTest:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  v11 = v10;
  if (v10 && (v12 = v9) != 0 || (v12 = v5, v13 = v10, v5))
  {
    v13 = v12;

  }
  return v13;
}

- (id)frontmostCall
{
  void *v3;

  v3 = -[TUCallContainer currentCallCount](self, "currentCallCount");
  if (v3)
  {
    -[TUCallContainer incomingCall](self, "incomingCall");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[TUCallContainer callWithStatus:](self, "callWithStatus:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        -[TUCallContainer callWithStatus:](self, "callWithStatus:", 3);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          -[TUCallContainer callWithStatus:](self, "callWithStatus:", 2);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return v3;
}

- (id)frontmostAudioOrVideoCall
{
  void *v3;

  v3 = -[TUCallContainer currentAudioAndVideoCallCount](self, "currentAudioAndVideoCallCount");
  if (v3)
  {
    -[TUCallContainer audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[TUCallContainer audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        -[TUCallContainer audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 3);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          -[TUCallContainer audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 2);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return v3;
}

- (id)displayedCallFromCalls:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[TUCallContainer currentCalls](self, "currentCalls");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v6)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_32;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v28;
  v11 = 0.0;
  v12 = 0.0;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v5);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      v15 = objc_msgSend(v14, "status", (_QWORD)v27);
      if ((v15 - 5) > 0xFFFFFFFD)
      {
        v25 = v14;

        v8 = v25;
        goto LABEL_32;
      }
      if (v15 == 1)
      {
        if (v8)
        {
          objc_msgSend(v14, "callDuration");
          if (v16 <= v12)
            goto LABEL_24;
          v17 = v16;
          v18 = v14;

          v8 = v18;
          v12 = v17;
          if (v18)
            goto LABEL_24;
          goto LABEL_22;
        }
        v8 = v14;
        objc_msgSend(v8, "callDuration");
        v12 = v22;
      }
      else if (v15 == 2 && v12 == 0.0)
      {
        if (!v9)
        {
          v9 = v14;
          objc_msgSend(v9, "callDuration");
          v11 = v23;
          if (v8)
            goto LABEL_24;
          goto LABEL_22;
        }
        objc_msgSend(v14, "callDuration");
        if (v19 > v11)
        {
          v20 = v19;
          v21 = v14;

          v9 = v21;
          v11 = v20;
          if (v8)
            goto LABEL_24;
          goto LABEL_22;
        }
      }
      if (v8)
        goto LABEL_24;
LABEL_22:
      if (v9)
      {
        v8 = v9;
        v9 = v8;
      }
LABEL_24:
      ++v13;
    }
    while (v7 != v13);
    v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v7 = v24;
  }
  while (v24);
LABEL_32:

  return v8;
}

uint64_t __43__TUCallContainer_countOfCallsPassingTest___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (unint64_t)currentVideoCallCount
{
  return -[TUCallContainer countOfCallsPassingTest:](self, "countOfCallsPassingTest:", &__block_literal_global_18);
}

- (unint64_t)currentAudioAndVideoCallCount
{
  return -[TUCallContainer countOfCallsPassingTest:](self, "countOfCallsPassingTest:", &__block_literal_global_5_0);
}

- (unint64_t)callCountOnDefaultPairedDevice
{
  return -[TUCallContainer countOfCallsPassingTest:](self, "countOfCallsPassingTest:", &__block_literal_global_6_0);
}

- (BOOL)anyCallPassesTest:(id)a3
{
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__TUCallContainer_anyCallPassesTest___block_invoke;
  v6[3] = &unk_1E38A23C0;
  v6[4] = &v7;
  -[TUCallContainer enumerateCallsInvokingBlock:forCallsPassingTest:](self, "enumerateCallsInvokingBlock:forCallsPassingTest:", v6, v4);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __37__TUCallContainer_anyCallPassesTest___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (BOOL)allCallsPassTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__TUCallContainer_allCallsPassTest___block_invoke;
  v7[3] = &unk_1E38A2478;
  v8 = v4;
  v5 = v4;
  LODWORD(self) = !-[TUCallContainer anyCallPassesTest:](self, "anyCallPassesTest:", v7);

  return (char)self;
}

uint64_t __36__TUCallContainer_allCallsPassTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

- (BOOL)hasCurrentCalls
{
  return -[TUCallContainer anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_5_0);
}

- (BOOL)hasCurrentAudioCalls
{
  return -[TUCallContainer anyCallPassesTest:](self, "anyCallPassesTest:", TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate);
}

- (BOOL)hasCurrentVideoCalls
{
  return -[TUCallContainer anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_18);
}

- (BOOL)anyCallIsHostedOnCurrentDevice
{
  return -[TUCallContainer anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_3_1);
}

- (BOOL)anyCallIsEndpointOnCurrentDevice
{
  return -[TUCallContainer anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_4_0);
}

- (BOOL)allCallsAreOfService:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__TUCallContainer_allCallsAreOfService___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v5 = a3;
  return -[TUCallContainer allCallsPassTest:](self, "allCallsPassTest:", v4);
}

uint64_t __40__TUCallContainer_allCallsAreOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "service");
  if ((_DWORD)v4 == *(_DWORD *)(a1 + 32))
    v5 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v4, v3);
  else
    v5 = 0;

  return v5;
}

- (BOOL)existingCallsHaveMultipleProviders
{
  TUCallContainer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v2 = self;
  -[TUCallContainer currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__TUCallContainer_existingCallsHaveMultipleProviders__block_invoke;
  v9[3] = &unk_1E38A2428;
  v10 = v6;
  v7 = v6;
  LOBYTE(v2) = -[TUCallContainer anyCallPassesTest:](v2, "anyCallPassesTest:", v9);

  return (char)v2;
}

uint64_t __53__TUCallContainer_existingCallsHaveMultipleProviders__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v5;
}

- (NSArray)currentCallGroups
{
  void *v3;
  void *v4;

  -[TUCallContainer currentCalls](self, "currentCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallContainer _callGroupsFromCalls:](self, "_callGroupsFromCalls:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)currentAudioAndVideoCallGroups
{
  void *v3;
  void *v4;

  -[TUCallContainer currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallContainer _callGroupsFromCalls:](self, "_callGroupsFromCalls:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)callGroupsOnDefaultPairedDevice
{
  void *v3;
  void *v4;

  -[TUCallContainer callsOnDefaultPairedDevice](self, "callsOnDefaultPairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallContainer _callGroupsFromCalls:](self, "_callGroupsFromCalls:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_callGroupsFromCalls:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  TUCallGroup *v7;
  void *v8;
  TUCallGroup *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TUCallGroup *v17;
  TUCallGroup *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallContainer conferenceCall](self, "conferenceCall");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [TUCallGroup alloc];
    -[TUCallContainer conferenceParticipantCalls](self, "conferenceParticipantCalls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TUCallGroup initWithCalls:](v7, "initWithCalls:", v8);

    objc_msgSend(v5, "addObject:", v9);
    -[TUCallGroup calls](v9, "calls");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v10);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = [TUCallGroup alloc];
        v18 = -[TUCallGroup initWithCall:](v17, "initWithCall:", v16, (_QWORD)v20);
        objc_msgSend(v5, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v5;
}

- (void)setCalls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)bargeCallWithStatus:(int)a3
{
  id v3;
  _QWORD v5[4];
  int v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke;
  v7[3] = &unk_1E38A23C0;
  v7[4] = &v8;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke_2;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  v6 = a3;
  -[TUCallContainer enumerateBargeCallsInvokingBlock:forCallsPassingTest:](self, "enumerateBargeCallsInvokingBlock:forCallsPassingTest:", v7, v5);
  v3 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "status") == *(_DWORD *)(a1 + 32))
    v4 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v3);
  else
    v4 = 0;

  return v4;
}

- (NSArray)bargeCalls
{
  return (NSArray *)-[TUCallContainer bargeCallsPassingTest:](self, "bargeCallsPassingTest:", &__block_literal_global_38);
}

uint64_t __42__TUCallContainer_TUBargeCall__bargeCalls__block_invoke()
{
  return 1;
}

- (id)bargeCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__TUCallContainer_TUBargeCall__bargeCallWithUniqueProxyIdentifier___block_invoke;
  v9[3] = &unk_1E38A2428;
  v10 = v4;
  v5 = v4;
  -[TUCallContainer bargeCallsPassingTest:](self, "bargeCallsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __67__TUCallContainer_TUBargeCall__bargeCallWithUniqueProxyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(v3, "uniqueProxyIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)bargeCallsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__TUCallContainer_TUBargeCall__bargeCallsPassingTest___block_invoke;
  v8[3] = &unk_1E38A23C0;
  v8[4] = &v9;
  -[TUCallContainer enumerateBargeCallsInvokingBlock:forCallsPassingTest:](self, "enumerateBargeCallsInvokingBlock:forCallsPassingTest:", v8, v4);
  v5 = (void *)v10[5];
  if (v5)
    v6 = (void *)objc_msgSend(v5, "copy");
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __54__TUCallContainer_TUBargeCall__bargeCallsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);

}

- (void)enumerateBargeCallsInvokingBlock:(id)a3 forCallsPassingTest:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    -[TUCallContainer _allCalls](self, "_allCalls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__TUCallContainer_TUBargeCall__enumerateBargeCallsInvokingBlock_forCallsPassingTest___block_invoke;
    v9[3] = &unk_1E38A2338;
    v10 = v6;
    v11 = v8;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 0, v9);

  }
}

void __85__TUCallContainer_TUBargeCall__enumerateBargeCallsInvokingBlock_forCallsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isPTT") && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (TUCall)frontmostBargeCall
{
  void *v3;

  -[TUCallContainer bargeCallWithStatus:](self, "bargeCallWithStatus:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[TUCallContainer bargeCallWithStatus:](self, "bargeCallWithStatus:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (TUCall *)v3;
}

@end
