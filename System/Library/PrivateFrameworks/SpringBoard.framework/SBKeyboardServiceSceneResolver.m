@implementation SBKeyboardServiceSceneResolver

void __72___SBKeyboardServiceSceneResolver_sceneForSceneIdentityToken_inProcess___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    objc_msgSend(v11, "clientHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pid");
    v10 = *(_DWORD *)(a1 + 48);

    if (v9 == v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }
  else
  {

  }
}

@end
