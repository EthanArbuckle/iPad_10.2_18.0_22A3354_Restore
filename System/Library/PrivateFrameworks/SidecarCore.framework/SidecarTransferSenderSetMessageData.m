@implementation SidecarTransferSenderSetMessageData

void __SidecarTransferSenderSetMessageData_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(v3, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SidecarMessageSetItemData(*(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v2);
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
  }

}

@end
