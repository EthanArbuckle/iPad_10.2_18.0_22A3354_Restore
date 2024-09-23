@implementation PHQuestion

void __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  objc_msgSend((id)objc_opt_class(), "_px_configurationCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || objc_msgSend(v4, "isStale"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_px_requestQueue_fetchConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "_px_configurationCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v7);

      v4 = (void *)v5;
    }
    else
    {
      v4 = 0;
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke_2;
  block[3] = &unk_1E5148F60;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v14 = v9;
  v12 = v4;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __58__PHQuestion_PhotosUICore___px_fetchRequestIdAndIncrement__block_invoke()
{
  _px_fetchRequestIdAndIncrement__px_requestId = 0;
}

void __50__PHQuestion_PhotosUICore___px_configurationCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_px_configurationCache_cache;
  _px_configurationCache_cache = (uint64_t)v0;

}

void __44__PHQuestion_PhotosUICore___px_requestQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mobileslideshow.PHQuestionConfigurationRequestQueue", v2);
  v1 = (void *)_px_requestQueue_queue;
  _px_requestQueue_queue = (uint64_t)v0;

}

@end
