@implementation NSNotificationCenter(SBHPPT)

+ (id)sbh_defaultPPTNotificationCenter
{
  void *v0;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

@end
