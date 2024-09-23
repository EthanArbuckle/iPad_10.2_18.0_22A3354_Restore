@implementation SidecarOptOutOfReconnect

void __SidecarOptOutOfReconnect_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServiceProvider, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __SidecarOptOutOfReconnect_block_invoke_2;
  v3[3] = &unk_24E5E1028;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "relayOptOutOfReconnect:", v3);

}

uint64_t __SidecarOptOutOfReconnect_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
