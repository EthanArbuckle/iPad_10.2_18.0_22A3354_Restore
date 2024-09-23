@implementation AMSBagValue(MTAdditions)

- (void)asyncValueOnQueue:()MTAdditions withCompletion:
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke;
  v8[3] = &unk_1E54D1018;
  v8[4] = a1;
  v9 = v6;
  v7 = v6;
  dispatch_async(a3, v8);

}

- (id)asyncValuePromise
{
  void *v2;
  void *v3;

  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "asyncValuePromiseOnQueue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)asyncValuePromiseOnQueue:()MTAdditions
{
  objc_class *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0CFDBD8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke;
  v11[3] = &unk_1E54D11F8;
  v11[4] = a1;
  v7 = v6;
  v12 = v7;
  dispatch_async(v5, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (void)asyncValueWithCompletion:()MTAdditions
{
  id v5;

  dispatch_get_global_queue(0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "asyncValueOnQueue:withCompletion:", v5, a3);

}

- (uint64_t)unsafeSnapshotSyncValue
{
  return objc_msgSend(a1, "valueWithError:", 0);
}

@end
