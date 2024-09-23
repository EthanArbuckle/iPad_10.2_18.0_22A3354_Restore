@implementation Tailspin

+ (void)collectTailspinToFile:(id)a3 minTimestamp:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  unint64_t v15;

  v7 = a3;
  v8 = a5;
  dispatch_get_global_queue(9, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__Tailspin_collectTailspinToFile_minTimestamp_completion___block_invoke;
  block[3] = &unk_1E3A16088;
  v14 = v8;
  v15 = a4;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __58__Tailspin_collectTailspinToFile_minTimestamp_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DE8AD0];
  v8[0] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0DE8AF0];
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "fileDescriptor");
  v6 = *(id *)(a1 + 40);
  tailspin_dump_output_with_options();

}

void __58__Tailspin_collectTailspinToFile_minTimestamp_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = CFSTR("Unable to dump tailspin");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", &stru_1E3A161B0, -1, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
