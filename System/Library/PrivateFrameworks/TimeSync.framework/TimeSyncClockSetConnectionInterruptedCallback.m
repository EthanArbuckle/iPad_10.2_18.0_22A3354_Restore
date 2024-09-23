@implementation TimeSyncClockSetConnectionInterruptedCallback

void __TimeSyncClockSetConnectionInterruptedCallback_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  (*(void (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v3);

}

@end
