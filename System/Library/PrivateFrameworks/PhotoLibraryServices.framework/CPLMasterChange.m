@implementation CPLMasterChange

BOOL __70__CPLMasterChange_BatchUploader__hasResourceOfType_notInMasterChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resourceType") == *(_QWORD *)(a1 + 32);
}

@end
