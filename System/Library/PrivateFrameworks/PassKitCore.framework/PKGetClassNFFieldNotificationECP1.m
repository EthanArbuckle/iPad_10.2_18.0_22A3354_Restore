@implementation PKGetClassNFFieldNotificationECP1

Class __PKGetClassNFFieldNotificationECP1_0_block_invoke()
{
  Class result;

  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  result = objc_getClass("NFFieldNotificationECP1_0");
  qword_1ECF22B90 = (uint64_t)result;
  return result;
}

@end
