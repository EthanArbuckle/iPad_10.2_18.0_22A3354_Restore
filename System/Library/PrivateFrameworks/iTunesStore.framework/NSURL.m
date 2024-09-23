@implementation NSURL

uint64_t __64__NSURL_ISAdditions___URLQueryParameterValueAllowedCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1690], "URLQueryAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_URLQueryParameterValueAllowedCharacterSet_characterSet;
  _URLQueryParameterValueAllowedCharacterSet_characterSet = v1;

  return objc_msgSend((id)_URLQueryParameterValueAllowedCharacterSet_characterSet, "removeCharactersInString:", CFSTR("?=&+"));
}

@end
