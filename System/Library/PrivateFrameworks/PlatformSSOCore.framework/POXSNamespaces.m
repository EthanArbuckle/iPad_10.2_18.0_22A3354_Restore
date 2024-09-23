@implementation POXSNamespaces

+ (id)prefixForNamespaceURI:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = prefixForNamespaceURI__predicate;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&prefixForNamespaceURI__predicate, &__block_literal_global_12);
  objc_msgSend((id)prefixForNamespaceURI__namespaces, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__POXSNamespaces_prefixForNamespaceURI___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("http://www.w3.org/2003/05/soap-envelope");
  v2[1] = CFSTR("http://www.w3.org/2005/08/addressing");
  v3[0] = CFSTR("s");
  v3[1] = CFSTR("a");
  v2[2] = CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd");
  v2[3] = CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd");
  v3[2] = CFSTR("u");
  v3[3] = CFSTR("o");
  v2[4] = CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512");
  v2[5] = CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust");
  v3[4] = CFSTR("trust");
  v3[5] = CFSTR("trust");
  v2[6] = CFSTR("http://schemas.xmlsoap.org/ws/2004/09/policy");
  v3[6] = CFSTR("wsp");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)prefixForNamespaceURI__namespaces;
  prefixForNamespaceURI__namespaces = v0;

}

@end
