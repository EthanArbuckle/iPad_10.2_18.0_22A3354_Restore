@implementation VSWebAuthenticationTemplateElement

+ (id)supportedFeatures
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("WebMessagePort");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VSWebAuthenticationTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  VSWebAuthenticationTemplateElement *v5;
  VSWebAuthenticationTemplateElement *v6;
  void *v7;
  uint64_t v8;
  VSMessagePortFeature *messagePort;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSWebAuthenticationTemplateElement;
  v5 = -[VSWebAuthenticationTemplateElement initWithDOMElement:parent:elementFactory:](&v11, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[VSWebAuthenticationTemplateElement features](v5, "features");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    messagePort = v6->_messagePort;
    v6->_messagePort = (VSMessagePortFeature *)v8;

  }
  return v6;
}

- (VSMessagePortFeature)messagePort
{
  return self->_messagePort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePort, 0);
}

@end
