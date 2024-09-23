@implementation UISceneAccessClassComponentArray

void ____UISceneAccessClassComponentArray_block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79200;
  qword_1ECD79200 = v0;

  v2 = dispatch_queue_create("com.apple.UIKit.UIFrameClassBasedComponentAccess", MEMORY[0x1E0C80D50]);
  v3 = (void *)qword_1ECD79208;
  qword_1ECD79208 = (uint64_t)v2;

}

uint64_t ____UISceneAccessClassComponentArray_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ____UISceneAccessClassComponentArray_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
