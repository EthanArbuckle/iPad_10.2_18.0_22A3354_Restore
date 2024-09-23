@implementation SXSanFranciscoFontFamilyProvider

- (SXSanFranciscoFontFamilyProvider)init
{
  SXSanFranciscoFontFamilyProvider *v2;
  SXSanFranciscoFontFamily *v3;
  SXSanFranciscoFontFamily *family;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXSanFranciscoFontFamilyProvider;
  v2 = -[SXSanFranciscoFontFamilyProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SXSanFranciscoFontFamily);
    family = v2->_family;
    v2->_family = v3;

  }
  return v2;
}

- (id)fontFamilies
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[SXSanFranciscoFontFamilyProvider family](self, "family");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SXSanFranciscoFontFamily)family
{
  return self->_family;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_family, 0);
}

@end
