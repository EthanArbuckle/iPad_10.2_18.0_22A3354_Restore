@implementation POSOAPFault

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("faultactor"), 0, objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("faultcode"), 0, objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("faultstring"), 0, objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Code"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Reason"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (POSOAPFaultDetail)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
}

- (NSString)faultactor
{
  return self->_faultactor;
}

- (void)setFaultactor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)faultcode
{
  return self->_faultcode;
}

- (void)setFaultcode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)faultstring
{
  return self->_faultstring;
}

- (void)setFaultstring:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (POSOAPCode)Code
{
  return self->_Code;
}

- (void)setCode:(id)a3
{
  objc_storeStrong((id *)&self->_Code, a3);
}

- (POSOAPReason)Reason
{
  return self->_Reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_Reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Reason, 0);
  objc_storeStrong((id *)&self->_Code, 0);
  objc_storeStrong((id *)&self->_faultstring, 0);
  objc_storeStrong((id *)&self->_faultcode, 0);
  objc_storeStrong((id *)&self->_faultactor, 0);
  objc_storeStrong((id *)&self->_detail, 0);
}

@end
