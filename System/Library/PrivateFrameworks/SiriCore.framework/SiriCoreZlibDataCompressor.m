@implementation SiriCoreZlibDataCompressor

- (SiriCoreZlibDataCompressor)init
{
  SiriCoreZlibDataCompressor *v2;
  SiriCoreZlibDataCompressor *v3;
  int v4;
  int v5;
  NSObject *v6;
  SiriCoreZlibDataCompressor *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)SiriCoreZlibDataCompressor;
  v2 = -[SiriCoreZlibDataCompressor init](&v9, sel_init);
  v3 = v2;
  if (v2
    && (v2->_deflateStream.zfree = 0,
        v2->_deflateStream.opaque = 0,
        v2->_deflateStream.zalloc = 0,
        (v4 = deflateInit_(&v2->_deflateStream, 9, "1.2.12", 112)) != 0))
  {
    v5 = v4;
    v6 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SiriCoreZlibDataCompressor init]";
      v12 = 1026;
      v13 = v5;
      _os_log_error_impl(&dword_211AB2000, v6, OS_LOG_TYPE_ERROR, "%s inflateInit failed with status %{public}d", buf, 0x12u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  deflateEnd(&self->_deflateStream);
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreZlibDataCompressor;
  -[SiriCoreZlibDataCompressor dealloc](&v3, sel_dealloc);
}

- (id)compressedDataForData:(id)a3 error:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  char *msg;
  _QWORD applier[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6 && dispatch_data_get_size(v6))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2662;
    v26 = __Block_byref_object_dispose__2663;
    v8 = (void *)MEMORY[0x24BDAC990];
    v9 = MEMORY[0x24BDAC990];
    v27 = v8;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __58__SiriCoreZlibDataCompressor_compressedDataForData_error___block_invoke;
    applier[3] = &unk_24CCE6A38;
    applier[4] = self;
    applier[5] = &v18;
    applier[6] = &v22;
    dispatch_data_apply(v7, applier);
    v10 = *((_DWORD *)v19 + 6);
    if (v10 >= 2)
    {
      v11 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
      {
        msg = self->_deflateStream.msg;
        *(_DWORD *)buf = 136315650;
        v29 = "-[SiriCoreZlibDataCompressor compressedDataForData:error:]";
        v30 = 1026;
        v31 = v10;
        v32 = 2080;
        v33 = msg;
        _os_log_error_impl(&dword_211AB2000, v11, OS_LOG_TYPE_ERROR, "%s Deflate finished with unexpected status %{public}d. %s", buf, 0x1Cu);
      }
      v12 = (void *)v23[5];
      v23[5] = 0;

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreDataCompressorErrorDomain"), *((int *)v19 + 6), 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v13 = (id)v23[5];
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v13 = (id)MEMORY[0x24BDAC990];
    v14 = MEMORY[0x24BDAC990];
  }

  return v13;
}

uint64_t __58__SiriCoreZlibDataCompressor_compressedDataForData_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  NSObject *v7;
  dispatch_data_t concat;
  uint64_t v9;
  void *v10;

  *(_QWORD *)(a1[4] + 8) = a4;
  *(_DWORD *)(a1[4] + 16) = a5;
  v6 = a1[4];
  while (1)
  {
    *(_QWORD *)(v6 + 32) = v6 + 120;
    *(_DWORD *)(a1[4] + 40) = 0x2000;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = deflate((z_streamp)(a1[4] + 8), 2);
    if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > 1u)
      break;
    v7 = dispatch_data_create((const void *)(a1[4] + 120), 0x2000 - *(unsigned int *)(a1[4] + 40), 0, 0);
    concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = concat;

    if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
      break;
    v6 = a1[4];
    if (*(_DWORD *)(v6 + 40))
      return 1;
  }
  return 0;
}

@end
