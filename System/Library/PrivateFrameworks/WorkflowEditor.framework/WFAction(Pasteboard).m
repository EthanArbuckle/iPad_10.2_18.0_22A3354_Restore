@implementation WFAction(Pasteboard)

- (uint64_t)loadDataWithTypeIdentifier:()Pasteboard forItemProviderCompletionHandler:
{
  void *v5;
  void (**v6)(id, void *, id);
  void *v7;
  void *v8;
  id v9;
  id v11;

  v5 = (void *)MEMORY[0x24BDD1770];
  v6 = a4;
  objc_msgSend(a1, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v7, 200, 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  v6[2](v6, v8, v9);
  return 0;
}

+ (id)readableTypeIdentifiersForItemProvider
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF8238], "exportedTypeWithIdentifier:", CFSTR("com.apple.shortcuts.action"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF8238], "exportedTypeWithIdentifier:", CFSTR("com.apple.shortcuts.action"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)objectWithItemProviderData:()Pasteboard typeIdentifier:error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BEC3A28];
    objc_msgSend(MEMORY[0x24BEC3A60], "sharedRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionFromSerializedRepresentation:actionRegistry:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
