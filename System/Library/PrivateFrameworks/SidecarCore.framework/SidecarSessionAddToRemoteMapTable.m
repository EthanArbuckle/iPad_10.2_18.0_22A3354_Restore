@implementation SidecarSessionAddToRemoteMapTable

void __SidecarSessionAddToRemoteMapTable_block_invoke(uint64_t a1, void *a2)
{
  SidecarMapTableReplaceObject(a2, *(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

@end
