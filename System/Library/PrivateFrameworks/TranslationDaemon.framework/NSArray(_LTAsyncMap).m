@implementation NSArray(_LTAsyncMap)

- (void)_ltAsyncMap:()_LTAsyncMap completion:
{
  id v7;

  dispatch_get_global_queue(9, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ltAsyncMap:queue:completion:", a3, v7, a4);

}

- (void)_ltAsyncMap:()_LTAsyncMap queue:completion:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  dispatch_queue_t v14;
  dispatch_group_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      ++v12;
    }
    while (v12 < objc_msgSend(a1, "count"));
  }
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  v36 = 0;
  v14 = dispatch_queue_create("com.apple.translation.async-map", 0);
  v15 = dispatch_group_create();
  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke;
  v28[3] = &unk_251A11098;
  v17 = v15;
  v29 = v17;
  v18 = v9;
  v30 = v18;
  v19 = v8;
  v33 = v19;
  v34 = v35;
  v20 = v14;
  v31 = v20;
  v21 = v11;
  v32 = v21;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v28);
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_5;
  block[3] = &unk_251A110C0;
  v26 = v10;
  v27 = v35;
  v25 = v21;
  v22 = v21;
  v23 = v10;
  dispatch_group_notify(v17, v18, block);

  _Block_object_dispose(v35, 8);
}

- (void)_ltSequentialMap:()_LTAsyncMap completion:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__6;
  v28 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke;
  v17[3] = &unk_251A11110;
  v10 = v9;
  v18 = v10;
  v11 = v7;
  v20 = v11;
  v12 = v8;
  v19 = v12;
  v22 = &v23;
  v13 = v6;
  v21 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x2495AE9CC](v17);
  v15 = MEMORY[0x2495AE9CC]();
  v16 = (void *)v24[5];
  v24[5] = v15;

  v14[2](v14);
  _Block_object_dispose(&v23, 8);

}

@end
