@implementation NAFuture(HKSPSleep)

- (id)hksp_BOOLErrorCompletionHandlerAdapter
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__NAFuture_HKSPSleep__hksp_BOOLErrorCompletionHandlerAdapter__block_invoke;
  v2[3] = &unk_1E4E3C878;
  v2[4] = a1;
  return (id)MEMORY[0x1A85ABD18](v2);
}

+ (id)hksp_expiringFutureWithTimeout:()HKSPSleep
{
  id v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  if (a1 > 0.0)
  {
    v3 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NAFuture_HKSPSleep__hksp_expiringFutureWithTimeout___block_invoke;
    block[3] = &unk_1E4E3AF48;
    v7 = v2;
    dispatch_after(v3, v4, block);

  }
  return v2;
}

+ (uint64_t)hksp_chainFutures:()HKSPSleep returningFirstPassingTest:
{
  return objc_msgSend(a1, "hksp_chainFutures:returningFirstPassingTest:ignoreErrors:", a3, a4, 0);
}

+ (id)hksp_chainFutures:()HKSPSleep returningFirstPassingTest:ignoreErrors:
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
    objc_msgSend(a1, "_hksp_chainFutureHelperWithFutures:index:block:ignoreErrors:", v8, 0, v9, a5);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_hksp_chainFutureHelperWithFutures:()HKSPSleep index:block:ignoreErrors:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  char v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke;
  v28[3] = &unk_1E4E3C8A0;
  v31 = a4;
  v32 = a1;
  v29 = v10;
  v14 = v11;
  v30 = v14;
  v33 = a6;
  v15 = v10;
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_2;
  v25[3] = &unk_1E4E3C8C8;
  v26 = v14;
  v16 = (id)MEMORY[0x1A85ABD18](v28);
  v27 = v16;
  v17 = v14;
  objc_msgSend(v12, "flatMap:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_3;
  v22[3] = &unk_1E4E3C8F0;
  v24 = a6;
  v23 = v16;
  v19 = v16;
  objc_msgSend(v18, "recover:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
