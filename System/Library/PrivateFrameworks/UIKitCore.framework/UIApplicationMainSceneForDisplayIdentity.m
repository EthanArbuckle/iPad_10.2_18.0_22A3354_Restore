@implementation UIApplicationMainSceneForDisplayIdentity

void ___UIApplicationMainSceneForDisplayIdentity_block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)a1[4];
  if (v8)
  {
    if ((objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
      goto LABEL_13;
  }
  else
  {
    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_isMainScreen");

    if (!v10)
      goto LABEL_13;
  }
  v11 = (void *)a1[5];
  if (v11)
  {
    objc_msgSend(v16, "identityToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
      v13 = v16;
    else
      v13 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v13);
  }
  else
  {
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = v16;
    v12 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    *a4 = 1;
LABEL_13:

}

@end
