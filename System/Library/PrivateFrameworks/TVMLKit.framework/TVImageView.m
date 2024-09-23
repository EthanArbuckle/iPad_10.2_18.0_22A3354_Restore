@implementation TVImageView

void __26___TVImageView__loadImage__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    objc_msgSend(v7, "setEnableCache:", 1);
    objc_msgSend(v7, "uiImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v11 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
        __26___TVImageView__loadImage__block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v8, v11);
    }
    v10 = 0;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __26___TVImageView__loadImage__block_invoke_16;
  v16[3] = &unk_24EB864D8;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  v12 = WeakRetained;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v21 = a4;
  v14 = v8;
  v19 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x22767F470](v16);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    v15[2](v15);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v15);

  objc_destroyWeak(&v20);
}

void __26___TVImageView__loadImage__block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "imageProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

    WeakRetained = v8;
    if (v4)
    {
      if (*(_QWORD *)(a1 + 40) && *(_BYTE *)(a1 + 64))
      {
        objc_msgSend(v8, "_setImage:");
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("TVMLImageViewImageDidLoadNotification"), v8);

      }
      objc_msgSend(v8, "setImageLoaded:", *(unsigned __int8 *)(a1 + 64));
      objc_msgSend(v8, "completion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v8;
      if (v6)
      {
        objc_msgSend(v8, "completion");
        v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

        WeakRetained = v8;
        if (*(_BYTE *)(a1 + 64))
        {
          objc_msgSend(v8, "setCompletion:", 0);
          WeakRetained = v8;
        }
      }
    }
  }

}

void __26___TVImageView__loadImage__block_invoke_2(uint64_t a1)
{
  id v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (id)WeakRetained[71] == v2)
  {
    objc_msgSend(WeakRetained, "completion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, 0, 1);

    objc_msgSend(WeakRetained, "setCompletion:", 0);
    objc_msgSend(WeakRetained, "setImageLoaded:", 0);
  }

}

void __26___TVImageView__loadImage__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "%@ was unable to load image: %@", (uint8_t *)&v3, 0x16u);
}

@end
