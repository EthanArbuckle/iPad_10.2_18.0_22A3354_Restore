@implementation NSFileCoordinator(TSPersistence)

+ (uint64_t)tsp_coordinateReadingItemAtURL:()TSPersistence options:filePresenter:error:byAccessor:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v15 = (void *)objc_msgSend([a1 alloc], "initWithFilePresenter:", v13);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __106__NSFileCoordinator_TSPersistence__tsp_coordinateReadingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v19[3] = &unk_24D82A120;
  v16 = v14;
  v20 = v16;
  v21 = &v22;
  objc_msgSend(v15, "coordinateReadingItemAtURL:options:error:byAccessor:", v12, a4, a6, v19);
  v17 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v17;
}

+ (uint64_t)tsp_coordinateReadingItemAtURL:()TSPersistence options:writingItemAtURL:options:filePresenter:error:byAccessor:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v19 = (void *)objc_msgSend([a1 alloc], "initWithFilePresenter:", v17);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __131__NSFileCoordinator_TSPersistence__tsp_coordinateReadingItemAtURL_options_writingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v23[3] = &unk_24D82A148;
  v20 = v18;
  v24 = v20;
  v25 = &v26;
  objc_msgSend(v19, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v15, a4, v16, a6, a8, v23);
  v21 = *((unsigned __int8 *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v21;
}

+ (uint64_t)tsp_coordinateWritingItemAtURL:()TSPersistence options:filePresenter:error:byAccessor:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v15 = (void *)objc_msgSend([a1 alloc], "initWithFilePresenter:", v13);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __106__NSFileCoordinator_TSPersistence__tsp_coordinateWritingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v19[3] = &unk_24D82A120;
  v16 = v14;
  v20 = v16;
  v21 = &v22;
  objc_msgSend(v15, "coordinateWritingItemAtURL:options:error:byAccessor:", v12, a4, a6, v19);
  v17 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v17;
}

+ (uint64_t)tsp_coordinateWritingItemAtURL:()TSPersistence options:writingItemAtURL:options:filePresenter:error:byAccessor:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v19 = (void *)objc_msgSend([a1 alloc], "initWithFilePresenter:", v17);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __131__NSFileCoordinator_TSPersistence__tsp_coordinateWritingItemAtURL_options_writingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v24[3] = &unk_24D82A170;
  v20 = v18;
  v26 = v20;
  v21 = v19;
  v25 = v21;
  v27 = &v28;
  objc_msgSend(v21, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v15, a4, v16, a6, a8, v24);
  v22 = *((unsigned __int8 *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v22;
}

@end
