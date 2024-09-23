@implementation NSArray(TransformUtilities)

+ (id)arrayWithObject:()TransformUtilities repeated:
{
  id v6;
  void *i;
  void *v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
    objc_msgSend(i, "addObject:", v6);
  v8 = (void *)objc_msgSend([a1 alloc], "initWithArray:", i);

  return v8;
}

- (void)sl_mapAsynchronouslyOnQueue:()TransformUtilities transform:completionHandler:
{
  void (**v8)(id, void *, _QWORD *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *queue;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v28[4];
  int v29;

  queue = a3;
  v8 = a4;
  v18 = a5;
  v9 = objc_msgSend(a1, "count");
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2810000000;
  v28[3] = "";
  v29 = 0;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObject:repeated:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = dispatch_group_create();
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      dispatch_group_enter(v13);
      objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __87__NSArray_TransformUtilities__sl_mapAsynchronouslyOnQueue_transform_completionHandler___block_invoke;
      v23[3] = &unk_1E3795FF8;
      v26 = v28;
      v24 = v12;
      v27 = i;
      v25 = v13;
      v8[2](v8, v15, v23);

    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__NSArray_TransformUtilities__sl_mapAsynchronouslyOnQueue_transform_completionHandler___block_invoke_2;
  block[3] = &unk_1E3794DE8;
  v21 = v12;
  v22 = v18;
  v16 = v18;
  v17 = v12;
  dispatch_group_notify(v13, queue, block);

  _Block_object_dispose(v28, 8);
}

- (void)sl_mapAsynchronously:()TransformUtilities completionHandler:
{
  id v7;

  dispatch_get_global_queue(0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sl_mapAsynchronouslyOnQueue:transform:completionHandler:", v7, a3, a4);

}

@end
