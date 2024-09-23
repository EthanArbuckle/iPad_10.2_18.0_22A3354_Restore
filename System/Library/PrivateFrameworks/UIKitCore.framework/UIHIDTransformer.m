@implementation UIHIDTransformer

uint64_t __37___UIHIDTransformer_initWithRunLoop___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __37___UIHIDTransformer_initWithRunLoop___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const void *v5;
  __CFRunLoop *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (const void *)*MEMORY[0x1E0C9B270];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37___UIHIDTransformer_initWithRunLoop___block_invoke_2;
    v7[3] = &unk_1E16B1B50;
    v6 = *(__CFRunLoop **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = v4;
    CFRunLoopPerformBlock(v6, v5, v7);

  }
}

@end
