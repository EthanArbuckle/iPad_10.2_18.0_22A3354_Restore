@implementation NSString

void __94__NSString_RadioRequestAdditions__queryStringForRadioRequestParameters_protocolVersion_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "removeCharactersInString:", CFSTR(":/?#[]@!$&'()*+,;="));
  v2 = (void *)queryStringForRadioRequestParameters_protocolVersion_error__sQueryStringAllowedCharacterSet;
  queryStringForRadioRequestParameters_protocolVersion_error__sQueryStringAllowedCharacterSet = (uint64_t)v1;

}

@end
