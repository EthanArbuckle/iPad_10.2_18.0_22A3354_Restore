@implementation POSOAPHeader

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("Action"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("MessageID"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("ReplyTo"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("To"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("Security"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"), objc_opt_class());
  objc_msgSend(v2, "setName:namespaceURI:forType:", CFSTR("RelatesTo"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  return v2;
}

@end
