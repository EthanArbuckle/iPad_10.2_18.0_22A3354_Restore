@implementation PRComplicationGalleryIconProvider

+ (void)loadIconImageForExtensionBundleIdentifier:(id)a3 atWidth:(double)a4 completion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (objc_class *)MEMORY[0x1E0CA5848];
  v9 = a5;
  v10 = a3;
  v13 = (id)objc_msgSend([v8 alloc], "initWithBundleIdentifier:error:", v10, 0);

  objc_msgSend(v13, "containingBundleRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadIconImageForApplicationBundleIdentifier:atWidth:completion:", v12, v9, a4);

}

+ (void)loadIconImageForApplicationBundleIdentifier:(id)a3 atWidth:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  double v15;

  v7 = a3;
  v8 = a5;
  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke;
  block[3] = &unk_1E21856D8;
  v15 = a4;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.mobilecal"));
  v3 = objc_alloc(MEMORY[0x1E0D3A820]);
  v4 = v3;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithDate:calendar:format:", v5, v6, 0);

  }
  else
  {
    v7 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  }
  v8 = *(double *)(a1 + 48);
  v9 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = (void *)objc_msgSend(v9, "initWithSize:scale:", v8, v8, v11);

  objc_msgSend(v7, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3870];
  v15 = objc_msgSend(v13, "CGImage");
  objc_msgSend(v13, "scale");
  objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke_2;
  v19[3] = &unk_1E21856B0;
  v17 = *(id *)(a1 + 40);
  v20 = v16;
  v21 = v17;
  v18 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], v19);

}

uint64_t __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
