@implementation NSString(TSUFogAdditions)

+ (id)tsu_fogShareTokenFromFileURL:()TSUFogAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tsu_encodeToHexidecimalString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("fog");
    v10[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)tsu_fogFilenameFromShareToken:()TSUFogAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("fog")) && objc_msgSend(v3, "count") == 2)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "tsu_decodeFromHexidecimalString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
