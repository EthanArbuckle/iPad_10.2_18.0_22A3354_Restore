@implementation SISchemaUUID(TranslationDaemonAdditions)

- (id)ltd_safeUUID
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "toSafeNSUUID");
  else
    objc_msgSend(a1, "toNSUUID");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
