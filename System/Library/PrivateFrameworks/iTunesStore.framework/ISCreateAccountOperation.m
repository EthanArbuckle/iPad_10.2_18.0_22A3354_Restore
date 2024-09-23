@implementation ISCreateAccountOperation

- (ISCreateAccountOperation)init
{
  return -[ISCreateAccountOperation initWithDSID:additionalQueryParams:targetIdentifier:](self, "initWithDSID:additionalQueryParams:targetIdentifier:", 0, 0, 0);
}

- (ISCreateAccountOperation)initWithDSID:(id)a3 additionalQueryParams:(id)a4 targetIdentifier:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ISOpenURLRequest *v16;
  void *v17;
  ISOpenURLRequest *v18;
  ISCreateAccountOperation *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x24BDD16A8];
  v11 = a5;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithString:", CFSTR("http://?action=account"));
  if (objc_msgSend(v8, "unsignedLongLongValue"))
  {
    objc_msgSend(v8, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("&dsid=%@"), v13);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "queryStringForDictionary:escapedValues:", v9, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "escapedStringForString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
      objc_msgSend(v12, "appendFormat:", CFSTR("&continuation=%@"), v15);
  }
  else
  {
    v15 = v14;
  }
  v16 = [ISOpenURLRequest alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ISOpenURLRequest initWithURL:](v16, "initWithURL:", v17);

  -[ISOpenURLRequest setInterruptsKeybagRefresh:](v18, "setInterruptsKeybagRefresh:", 1);
  -[ISOpenURLRequest setTargetIdentifier:](v18, "setTargetIdentifier:", v11);

  v21.receiver = self;
  v21.super_class = (Class)ISCreateAccountOperation;
  v19 = -[ISOpenURLOperation initWithOpenURLRequest:](&v21, sel_initWithOpenURLRequest_, v18);

  return v19;
}

@end
