@implementation SXAdvertisementComponentSizerFactory

- (NSString)type
{
  return (NSString *)CFSTR("advertisement");
}

- (int)role
{
  return 0;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  SXAdvertisementComponentSizer *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "componentStyleForComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:]([SXAdvertisementComponentSizer alloc], "initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:", v12, v11, v13, v9, v10);

  return v14;
}

@end
