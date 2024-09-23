@implementation SESEndPointConfigureWithProxy

uint64_t __SESEndPointConfigureWithProxy_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 104);
  v10 = *(_QWORD *)(a1 + 112);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __SESEndPointConfigureWithProxy_block_invoke_2;
  v12[3] = &unk_24C2BCCB0;
  v12[4] = *(_QWORD *)(a1 + 120);
  return objc_msgSend(v2, "configureEndpointWithProxy:identifier:privateData:confidentialData:contactlessVolatileVisibility:contactlessPersistentVisibility:wiredVolatileVisibility:wiredPersistentVisibility:keySlot:nfcExpressOnlyInLPM:reply:", v1, v3, v4, v5, v6, v7, v8, v9, v10, v12);
}

void __SESEndPointConfigureWithProxy_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
