@implementation PGWaitForNotificationWithTimeout

void __PGWaitForNotificationWithTimeout_block_invoke(_QWORD *a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v3 = a2;
  v4 = a1[6];
  if (v4 && (*(unsigned int (**)(void))(v4 + 16))())
  {
    v3[2](v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v7 = a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __PGWaitForNotificationWithTimeout_block_invoke_2;
    v11[3] = &unk_1E62306E0;
    v12 = v3;
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, v7, 0, v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

uint64_t __PGWaitForNotificationWithTimeout_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PGWaitForNotificationWithTimeout_block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
