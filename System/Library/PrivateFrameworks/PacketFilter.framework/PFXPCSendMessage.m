@implementation PFXPCSendMessage

uint64_t ____PFXPCSendMessage_block_invoke(uint64_t a1, void *a2)
{
  return __PFXPCResponseHandler(a2, *(_QWORD *)(a1 + 32));
}

@end
