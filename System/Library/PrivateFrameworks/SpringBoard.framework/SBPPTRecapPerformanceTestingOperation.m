@implementation SBPPTRecapPerformanceTestingOperation

+ (id)scrollViewRecapPerformanceTestOperationWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke;
  v7[3] = &unk_1E8EA9E48;
  v8 = v3;
  v4 = v3;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTRecapPerformanceTestingOperation, "operationWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeoutInterval:", 60.0);

  return v5;
}

void __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke_2;
  v11 = &unk_1E8EA02D8;
  v12 = v3;
  v13 = v5;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v4, "setCompletionHandler:", &v8);
  objc_msgSend(MEMORY[0x1E0D83C80], "runTestWithParameters:", v4, v8, v9, v10, v11);

}

uint64_t __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "finish");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
