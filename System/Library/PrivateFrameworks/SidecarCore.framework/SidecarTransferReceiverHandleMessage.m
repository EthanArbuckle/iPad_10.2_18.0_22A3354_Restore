@implementation SidecarTransferReceiverHandleMessage

void __SidecarTransferReceiverHandleMessage_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "type", (_QWORD)v14);
        v6 |= v10 == 4;
        v11 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "items");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "sidecarTransfer:receivedItems:messageType:", v11, v12, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_12:
      objc_msgSend(v2, "sidecarTransfer:didComplete:", *(_QWORD *)(a1 + 32), v13, (_QWORD)v14);
      goto LABEL_13;
    }
  }
  else
  {

  }
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v13)
    goto LABEL_12;
LABEL_13:

}

@end
