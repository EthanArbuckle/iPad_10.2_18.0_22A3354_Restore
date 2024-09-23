@implementation ICSDefaultPRODID

void __ICSDefaultPRODID_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("-//Apple Inc."));
  v0 = (void *)_CFCopySystemVersionDictionary();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C9AB98]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2 && objc_msgSend(v2, "length"))
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("//%@"), v3);
      objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4 && objc_msgSend(v4, "length"))
        objc_msgSend(v8, "appendFormat:", CFSTR(" %@"), v5);

    }
  }
  objc_msgSend(v8, "appendString:", CFSTR("//EN"));
  v6 = objc_msgSend(v8, "copy");
  v7 = (void *)ICSDefaultPRODID_defaultPRODID;
  ICSDefaultPRODID_defaultPRODID = v6;

}

@end
