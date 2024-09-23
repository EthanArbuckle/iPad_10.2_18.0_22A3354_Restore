@implementation PKGetClassNFRemoteAdminManager

Class __PKGetClassNFRemoteAdminManager_block_invoke()
{
  Class result;

  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  result = objc_getClass("NFRemoteAdminManager");
  PKGetClassNFRemoteAdminManager_cls = (uint64_t)result;
  return result;
}

@end
