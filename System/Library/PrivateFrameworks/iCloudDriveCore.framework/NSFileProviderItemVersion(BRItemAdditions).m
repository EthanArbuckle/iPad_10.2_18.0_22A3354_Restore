@implementation NSFileProviderItemVersion(BRItemAdditions)

- (id)br_prettyDescription
{
  void *v2;
  BRFieldContentSignature *v3;
  void *v4;
  BRFieldContentSignature *v5;
  void *v6;
  BRFieldStructureSignature *v7;
  void *v8;
  BRFieldStructureSignature *v9;
  void *v10;

  objc_msgSend(a1, "contentVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = [BRFieldContentSignature alloc];
    objc_msgSend(a1, "contentVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BRFieldContentSignature initWithData:](v3, "initWithData:", v4);

  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(a1, "metadataVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = [BRFieldStructureSignature alloc];
    objc_msgSend(a1, "metadataVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BRFieldStructureSignature initWithData:](v7, "initWithData:", v8);

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@,%@]"), v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
