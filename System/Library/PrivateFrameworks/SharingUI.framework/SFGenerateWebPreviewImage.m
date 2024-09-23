@implementation SFGenerateWebPreviewImage

void __SFGenerateWebPreviewImage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    sharing_ui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_212728000, v8, OS_LOG_TYPE_DEFAULT, "Unable to fetch metadata for URL %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __SFGenerateWebPreviewImage_block_invoke_14;
    v10[3] = &unk_24CE0FC98;
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v11, "_loadAsynchronousFieldsWithUpdateHandler:", v10);

  }
}

void __SFGenerateWebPreviewImage_block_invoke_14(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "platformImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v7 = v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "icon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "platformImage");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
