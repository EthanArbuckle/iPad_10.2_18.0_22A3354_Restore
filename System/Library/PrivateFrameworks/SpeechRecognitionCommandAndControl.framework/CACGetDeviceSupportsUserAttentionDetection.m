@implementation CACGetDeviceSupportsUserAttentionDetection

void __CACGetDeviceSupportsUserAttentionDetection_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.SpeechRecognitionCore.SerialUserAttentionSupportQueue", 0);
  v1 = (void *)CACGetDeviceSupportsUserAttentionDetection_serialUserAttentionSupportQueue;
  CACGetDeviceSupportsUserAttentionDetection_serialUserAttentionSupportQueue = (uint64_t)v0;

}

void __CACGetDeviceSupportsUserAttentionDetection_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  char v8;

  v2 = objc_msgSend(MEMORY[0x24BE09598], "supportedEvents");
  v3 = objc_msgSend(MEMORY[0x24BDC1448], "isWakeGestureAvailable");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __CACGetDeviceSupportsUserAttentionDetection_block_invoke_3;
  block[3] = &unk_24F2AB1F0;
  v4 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  dispatch_async(v4, block);

}

uint64_t __CACGetDeviceSupportsUserAttentionDetection_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
