@implementation NSManagedObjectContext

void __78__NSManagedObjectContext_RCExtensions__rc_performAndWaitReturningError_block___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = (*(uint64_t (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

@end
