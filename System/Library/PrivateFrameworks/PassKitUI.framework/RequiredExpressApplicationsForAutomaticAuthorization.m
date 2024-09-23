@implementation RequiredExpressApplicationsForAutomaticAuthorization

uint64_t __RequiredExpressApplicationsForAutomaticAuthorization_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsInSessionExpress");
}

@end
