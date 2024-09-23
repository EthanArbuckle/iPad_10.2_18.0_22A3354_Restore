@implementation UISceneEventResponder

void __58___UISceneEventResponder__enqueueCommitResponse_forPhase___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  uint64_t *v3;
  id *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  id *v8;
  void (**v9)(void);
  id v10;
  id v11;
  _BYTE *v12;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    v12 = v2;
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 8));
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 12));
    v12[24] = 1;
    v3 = (uint64_t *)(v1 + 16);
    v4 = (id *)*(id *)(v1 + 16);
    while (1)
    {
      v5 = *v3;
      if (!*v3)
        break;
      if (!*(_BYTE *)(v5 + 24))
        goto LABEL_7;
      objc_storeStrong((id *)(v1 + 16), *(id *)(v5 + 8));
    }
    v6 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0;

    v5 = *(_QWORD *)(v1 + 16);
LABEL_7:
    v7 = (id *)(id)v5;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 12));
    if (v4 != v7)
    {
      do
      {
        v8 = (id *)v4[1];
        v9 = (void (**)(void))v4[2];
        if (v9)
        {
          v9[2]();
          v10 = v4[2];
          v4[2] = 0;

        }
        v11 = v4[1];
        v4[1] = 0;

        v4 = v8;
      }
      while (v8 != v7);
      v4 = v7;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 8));

    v2 = v12;
  }

}

@end
