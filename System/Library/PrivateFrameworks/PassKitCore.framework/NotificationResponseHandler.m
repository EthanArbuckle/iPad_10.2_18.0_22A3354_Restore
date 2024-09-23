@implementation NotificationResponseHandler

void ___NotificationResponseHandler_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  _NotificationHandlerMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___NotificationResponseHandler_block_invoke_2;
    block[3] = &unk_1E2ACB140;
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v10 = v4;
    v11 = v5;
    v12 = v6;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  _NotificationHandlerMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ___NotificationResponseHandler_block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

@end
