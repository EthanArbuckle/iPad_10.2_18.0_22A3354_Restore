@implementation PKGetClassNFFieldNotificationECP2

Class __PKGetClassNFFieldNotificationECP2_0_block_invoke()
{
  Class result;

  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  result = objc_getClass("NFFieldNotificationECP2_0");
  qword_1ECF22BA0 = (uint64_t)result;
  return result;
}

@end
