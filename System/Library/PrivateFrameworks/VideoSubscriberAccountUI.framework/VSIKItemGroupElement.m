@implementation VSIKItemGroupElement

+ (id)supportedFeaturesForElementName:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isEqual:", CFSTR("itemGroup")))
  {
    v5[0] = 0x24FE1C188;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (VSIKItemGroupElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  VSIKItemGroupElement *v5;
  VSIKItemGroupElement *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  VSIKItemGroup *itemGroup;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VSIKItemGroupElement;
  v5 = -[VSIKItemGroupElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[VSIKItemGroupElement features](v5, "features");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[self features] firstObject] parameter must not be nil."));
    -[VSIKItemGroupElement features](v6, "features");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    itemGroup = v6->_itemGroup;
    v6->_itemGroup = (VSIKItemGroup *)v10;

  }
  return v6;
}

- (VSIKItemGroup)itemGroup
{
  return self->_itemGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemGroup, 0);
}

@end
