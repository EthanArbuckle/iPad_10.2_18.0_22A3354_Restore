@implementation REAppIconCache

- (id)_init
{
  _QWORD *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REAppIconCache;
  v2 = -[RESingleton _init](&v9, sel__init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.RelevanceEngine", v3);
    v5 = (void *)v2[2];
    v2[2] = v4;

    v6 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v7 = (void *)v2[1];
    v2[1] = v6;

  }
  return v2;
}

- (void)iconForApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t IsRemote;
  _REAppKey *v9;
  void *v10;
  uint64_t v11;
  _REAppKey *v12;
  id v13;
  void *v14;
  NSObject *queue;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[5];
  _REAppKey *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  IsRemote = REApplicationIsRemote(v6);
  v9 = -[_REAppKey initWithIdentifier:remote:]([_REAppKey alloc], "initWithIdentifier:remote:", v6, IsRemote);
  -[NSCache objectForKey:](self->_imageCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke;
  v19[3] = &unk_24CF8B910;
  v19[4] = self;
  v12 = v9;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  v14 = (void *)MEMORY[0x2199B2434](v19);
  if (v10)
  {
    queue = self->_queue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke_2;
    block[3] = &unk_24CF8B2E0;
    v18 = v13;
    v17 = v10;
    dispatch_async(queue, block);

  }
  else if ((_DWORD)IsRemote)
  {
    -[REAppIconCache _loadRemoteIconForIdentifier:completion:](self, "_loadRemoteIconForIdentifier:completion:", v6, v14);
  }
  else
  {
    -[REAppIconCache _loadIconForIdentifier:completion:](self, "_loadIconForIdentifier:completion:", v6, v14);
  }

}

void __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", v3, a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_loadRemoteIconForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  float v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  OS_dispatch_queue *queue;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  Class (*v24)(uint64_t);
  void *v25;
  void **v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  if (!RelevanceEngineUILibraryCore_frameworkLibrary)
  {
    v23 = xmmword_24CF8B970;
    v24 = 0;
    RelevanceEngineUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RelevanceEngineUILibraryCore_frameworkLibrary)
    {
      v16 = (void *)abort_report_np();
      __break(1u);
      free(v16);
    }
  }
  v8 = REDeviceScreenScale();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v9 = (void *)getNanoResourceGrabberClass_softClass;
  v22 = getNanoResourceGrabberClass_softClass;
  v10 = MEMORY[0x24BDAC760];
  if (!getNanoResourceGrabberClass_softClass)
  {
    *(_QWORD *)&v23 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v23 + 1) = 3221225472;
    v24 = __getNanoResourceGrabberClass_block_invoke;
    v25 = &unk_24CF8AC38;
    v26 = &v19;
    __getNanoResourceGrabberClass_block_invoke((uint64_t)&v23);
    v9 = v20[3];
  }
  if (v8 < 3.0)
    v11 = 47;
  else
    v11 = 48;
  v12 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v12, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __58__REAppIconCache__loadRemoteIconForIdentifier_completion___block_invoke;
  v17[3] = &unk_24CF8B938;
  v18 = v7;
  v15 = v7;
  objc_msgSend(v13, "getIconForBundleID:iconVariant:queue:block:timeout:", v6, v11, queue, v17, 0.0);

}

void __58__REAppIconCache__loadRemoteIconForIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[REImage imageWithImage:](REImage, "imageWithImage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_loadIconForIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__REAppIconCache__loadIconForIdentifier_completion___block_invoke;
  v9[3] = &unk_24CF8AA78;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __52__REAppIconCache__loadIconForIdentifier_completion___block_invoke(uint64_t a1)
{
  float v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = REDeviceScreenScale();
  _REIconDescriptionForDevice(0, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getISIconClass_softClass;
  v12 = getISIconClass_softClass;
  if (!getISIconClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getISIconClass_block_invoke;
    v8[3] = &unk_24CF8AC38;
    v8[4] = &v9;
    __getISIconClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_msgSend(v6, "CGImageForImageDescriptor:", v3);
  if (v7)
  {
    +[REImage imageWithCGImage:scale:](REImage, "imageWithCGImage:scale:", v7, REDeviceScreenScale());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
