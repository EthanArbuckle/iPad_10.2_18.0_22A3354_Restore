@implementation BluetoothDeviceEvent

void __BluetoothDeviceEvent_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(*(id *)(a1 + 32), "bluetoothDeviceEvent:onDevice:withResult:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
  objc_autoreleasePoolPop(v2);
}

@end
