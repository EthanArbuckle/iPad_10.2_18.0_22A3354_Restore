@implementation PASKVOHandler

void __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke_2;
  block[3] = &unk_1E442FF60;
  v13 = *(NSObject **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v23 = v12;
  v24 = v14;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  dispatch_async(v13, block);

}

void __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A1AFDC98]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
