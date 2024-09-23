@implementation POSOAPBody

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("Fault"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("RequestSecurityToken"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("RequestSecurityToken"), CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("RequestSecurityTokenResponseCollection"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("RequestSecurityTokenResponse"), CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust"), objc_opt_class());
  return v2;
}

@end
