@implementation SidecarRequestCreateSendTransfer

void __SidecarRequestCreateSendTransfer_block_invoke(_QWORD *a1)
{
  SidecarMapTable *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  SidecarTransferSender *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (SidecarMapTable *)*(id *)(a1[4] + 96);
  if (!v2)
  {
    v2 = -[SidecarMapTable initWithKeyMask:weakObjects:]([SidecarMapTable alloc], "initWithKeyMask:weakObjects:", 0x7FFFFFFFLL, 0);
    objc_storeStrong((id *)(a1[4] + 96), v2);
  }
  v3 = (void *)a1[5];
  v10[0] = 0;
  v10[1] = 0;
  objc_msgSend(v3, "getUUIDBytes:", v10);
  v4 = bswap32(v10[0]);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SidecarMapTableAddObject(v2, v5);

  v7 = -[SidecarTransferSender initWithSession:requestID:transferID:]([SidecarTransferSender alloc], "initWithSession:requestID:transferID:", a1[6], v4, v6);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setDelegate:", a1[4]);
  SidecarMapTableReplaceObject(v2, v6, *(void **)(*(_QWORD *)(a1[7] + 8) + 40));

}

@end
