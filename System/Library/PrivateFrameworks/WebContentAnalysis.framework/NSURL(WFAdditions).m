@implementation NSURL(WFAdditions)

- (uint64_t)WF_hostnameIsIPAddress
{
  void *v2;
  uint64_t v3;
  id v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", objc_msgSend(a1, "host"));
  v5 = 0;
  if (objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(".0123456789")), &v5))v3 = objc_msgSend(v5, "isEqualToString:", objc_msgSend(a1, "host"));
  else
    v3 = 0;

  return v3;
}

- (const)WF_normalizedRelativePath
{
  void *v1;
  void *v2;
  uint64_t i;
  uint64_t v4;

  v1 = (void *)objc_msgSend(a1, "relativePath");
  if (!v1)
    return &stru_24C583DA8;
  v2 = (void *)objc_msgSend(v1, "lowercaseString");
  for (i = objc_msgSend(v2, "length"); i; i = objc_msgSend(v2, "length"))
  {
    v4 = i - 1;
    if (!objc_msgSend((id)objc_msgSend(v2, "substringFromIndex:", i - 1), "isEqualToString:", CFSTR("/")))
      break;
    v2 = (void *)objc_msgSend(v2, "substringToIndex:", v4);
  }
  return (const __CFString *)v2;
}

@end
