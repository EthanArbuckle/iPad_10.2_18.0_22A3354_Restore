@implementation SESEndPointRemoteTerminationRequestFromTSM

void __SESEndPointRemoteTerminationRequestFromTSM_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = *(void **)(a1 + 32);
  +[SEProxy withSession:seid:](SEProxy, "withSession:seid:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __SESEndPointRemoteTerminationRequestFromTSM_block_invoke_2;
  v7[3] = &unk_24C2BCD00;
  v8 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "remoteTerminationRequestWithProxy:remoteTerminationRequest:publicKeyIdentifier:taskID:reply:", v3, v4, v5, v6, v7);

}

void __SESEndPointRemoteTerminationRequestFromTSM_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

@end
