@implementation SBSUIRemoteAlertServiceObserverHandle

void __71___SBSUIRemoteAlertServiceObserverHandle_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x193FF87DC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    v4 = v5;
  }

}

void __73___SBSUIRemoteAlertServiceObserverHandle_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x193FF87DC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    v4 = v5;
  }

}

void __83___SBSUIRemoteAlertServiceObserverHandle_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))MEMORY[0x193FF87DC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  if (v7)
    v7[2](v7, 0);
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x193FF87DC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0;

  if (v4)
    v4[2](v4, 0);

}

@end
