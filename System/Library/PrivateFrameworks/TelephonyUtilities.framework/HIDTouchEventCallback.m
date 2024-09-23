@implementation HIDTouchEventCallback

void ____HIDTouchEventCallback_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", *(_QWORD *)(a1 + 32));

}

@end
