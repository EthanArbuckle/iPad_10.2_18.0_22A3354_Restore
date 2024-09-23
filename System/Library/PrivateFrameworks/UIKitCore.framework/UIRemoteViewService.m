@implementation UIRemoteViewService

void __38___UIRemoteViewService_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_METACLASS____UIRemoteViewService;
  v2 = objc_msgSendSuper2(&v4, sel_allocWithZone_, v1);
  v3 = (void *)_MergedGlobals_1_24;
  _MergedGlobals_1_24 = (uint64_t)v2;

}

@end
