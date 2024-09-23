@implementation TVURLSessionDownloadTaskWrapper

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10[2];
  _QWORD v11[4];
  id v12;
  id v13[2];

  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E9F2C878;
  objc_copyWeak(v13, (id *)(a1 + 48));
  v13[1] = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "downloadTaskWithURL:completionHandler:", v3, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E9F2C8A0;
  objc_copyWeak(v10, (id *)(a1 + 48));
  v10[1] = *(id *)(a1 + 56);
  v8 = v5;
  v9 = *(id *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v10);
  objc_destroyWeak(v13);
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD block[5];
  id v14;
  uint64_t v15;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E9F2C850;
    v11 = *(_QWORD *)(a1 + 48);
    block[4] = WeakRetained;
    v15 = v11;
    v14 = v8;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1[4];
  if (v1 && a1[6] == *(_QWORD *)(v1 + 24))
  {
    v2 = 3;
    if (a1[5])
      v2 = 1;
    *(_QWORD *)(v1 + 32) = v2;
    v3 = a1[4];
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_4(id *a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (a1[7] == WeakRetained[3] && !WeakRetained[4])
    {
      objc_storeStrong(WeakRetained + 2, a1[4]);
      objc_msgSend(v3[2], "resume");
    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_5;
      block[3] = &unk_1E9F2B930;
      v6 = a1[5];
      dispatch_async(v4, block);

    }
  }

}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

@end
