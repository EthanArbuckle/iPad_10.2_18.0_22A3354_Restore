@implementation NotificationCallback

void __NotificationCallback_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  id v5[2];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __NotificationCallback_block_invoke_2;
  v4[3] = &unk_1E243AF60;
  v3 = *(_OWORD *)(a1 + 32);
  v1 = *(void **)(v3 + 8);
  v2 = (id)v3;
  *(_OWORD *)v5 = v3;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __NotificationCallback_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v9 = v6;
  objc_msgSend(v6, "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "preferencesChangedCallback:", v9);
    *a4 = 1;
  }

}

@end
