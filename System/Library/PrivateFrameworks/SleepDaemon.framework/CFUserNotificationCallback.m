@implementation CFUserNotificationCallback

void ___CFUserNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___CFUserNotificationCallback_block_invoke_2;
  v7[3] = &__block_descriptor_40_e51_B16__0___HDSPCFUserNotificationCenterRegistration_8l;
  v7[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "na_firstObjectPassingTest:", v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "registrations");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

BOOL ___CFUserNotificationCallback_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notification") == *(_QWORD *)(a1 + 32);

  return v4;
}

@end
