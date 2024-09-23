@implementation IOHIDPropertyChangedCallback

void __IOHIDPropertyChangedCallback_block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "operatorBlock");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

@end
