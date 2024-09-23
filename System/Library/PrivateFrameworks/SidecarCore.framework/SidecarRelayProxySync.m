@implementation SidecarRelayProxySync

void __SidecarRelayProxySync_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  SidecarRelayConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __SidecarRelayProxySync_block_invoke_2;
  v7[3] = &unk_24E5E0DC0;
  v3 = a1[6];
  v7[4] = a1[4];
  v7[5] = v3;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __SidecarRelayProxySync_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  SidecarCoreLogAPIError(*(const void **)(a1 + 40), v4);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

@end
