@implementation PKZipArchiver

- (void)unzipStream:(id)a3 toPath:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "fileURLWithPath:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKZipArchiver unzipStream:toURL:completionHandler:](self, "unzipStream:toURL:completionHandler:", v10, v11, v9);

}

- (void)unzipStream:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PKZipArchiver_unzipStream_toURL_completionHandler___block_invoke;
    v14[3] = &unk_1E2ABE030;
    v15 = v7;
    v16 = v8;
    v17 = v10;
    v13 = v14;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_1;
    block[3] = &unk_1E2ABD9A0;
    v19 = v13;
    dispatch_async(v11, block);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __53__PKZipArchiver_unzipStream_toURL_completionHandler___block_invoke(uint64_t a1)
{
  size_t v2;
  void *v3;
  NSData *v4;
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v2 = NSPageSize();
  v3 = malloc_type_malloc(v2, 0xD780132FuLL);
  if (!v3)
    goto LABEL_10;
  v4 = (NSData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(*(id *)(a1 + 32), "read:maxLength:", v3, v2);
    if (!v6)
    {
LABEL_7:
      free(v3);
      v3 = (void *)PKUnarchiverZip(v5, *(NSURL **)(a1 + 40));

      goto LABEL_10;
    }
    v7 = v6;
    while ((v7 & 0x8000000000000000) == 0)
    {
      -[NSData appendBytes:length:](v5, "appendBytes:length:", v3);
      v7 = objc_msgSend(*(id *)(a1 + 32), "read:maxLength:", v3, v2);
      if (!v7)
        goto LABEL_7;
    }

  }
  free(v3);
  v3 = 0;
LABEL_10:
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, v3);
  return result;
}

- (id)zippedDataForURL:(id)a3
{
  return PKArchiverZipData((NSURL *)a3);
}

@end
