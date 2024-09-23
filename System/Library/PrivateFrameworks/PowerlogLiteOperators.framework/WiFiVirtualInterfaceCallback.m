@implementation WiFiVirtualInterfaceCallback

void __WiFiVirtualInterfaceCallback_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAWDLState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_autoreleasePoolPop(v2);
}

void __WiFiVirtualInterfaceCallback_block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardHotspotState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_autoreleasePoolPop(v2);
}

@end
