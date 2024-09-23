@implementation PKGetClassNFTrustSignResponse

Class __PKGetClassNFTrustSignResponse_block_invoke()
{
  Class result;

  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  result = objc_getClass("NFTrustSignResponse");
  qword_1ECF22BD0 = (uint64_t)result;
  return result;
}

@end
