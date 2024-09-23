@implementation RBSServiceInitialize

void __RBSServiceInitialize_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = -[RBSService _init]([RBSService alloc]);
  v3 = (void *)RBSServiceInitialize___sharedInstance;
  RBSServiceInitialize___sharedInstance = (uint64_t)v2;

  objc_storeStrong((id *)(RBSServiceInitialize___sharedInstance + 8), *(id *)(a1 + 32));
  -[RBSConnection registerServiceDelegate:](*(_QWORD *)(RBSServiceInitialize___sharedInstance + 32), (void *)RBSServiceInitialize___sharedInstance);
}

@end
