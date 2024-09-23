@implementation REMultipeerHelper

+ (Address)makeAddressFromPeerID:(SEL)a3
{
  void *v5;
  id v6;
  _anonymous_namespace_ *v7;
  Address *result;
  uint64_t v9;
  char v10;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (_anonymous_namespace_ *)objc_msgSend(v6, "UTF8String");
  re::DynamicString::DynamicString((re::DynamicString *)retstr, (const re::DynamicString *)&v9);
  if (v9 && (v10 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)v9 + 40))();

  return result;
}

@end
