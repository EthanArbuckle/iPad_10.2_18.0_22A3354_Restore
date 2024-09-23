@implementation NSObject(REMHumanReadableIdentifier)

- (__CFString)rem_humanReadableIdentifier
{
  __CFString *v1;
  int v3;

  v3 = (objc_msgSend(a1, "hash") % 0xF0uLL) | 0x1F300;
  v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v3, 4, 2617245952);
  if (!v1)
    v1 = CFSTR("❓");
  return v1;
}

@end
