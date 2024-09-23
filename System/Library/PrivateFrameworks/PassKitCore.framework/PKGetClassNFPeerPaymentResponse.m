@implementation PKGetClassNFPeerPaymentResponse

Class __PKGetClassNFPeerPaymentResponse_block_invoke()
{
  Class result;

  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  result = objc_getClass("NFPeerPaymentResponse");
  qword_1ECF22BC0 = (uint64_t)result;
  return result;
}

@end
