@implementation PXAssignLocationFromPasteboardToAsset

void __PXAssignLocationFromPasteboardToAsset_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocation:", *(_QWORD *)(a1 + 40));

}

@end
