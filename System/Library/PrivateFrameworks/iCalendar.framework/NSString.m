@implementation NSString

void __43__NSString_VCSUtilities__VCS_isPhoneNumber__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2080, 0);
  v1 = (void *)VCS_isPhoneNumber_phoneNumberDetector;
  VCS_isPhoneNumber_phoneNumberDetector = v0;

}

@end
