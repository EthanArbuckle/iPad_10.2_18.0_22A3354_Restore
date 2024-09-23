@implementation WBFont

+ (id)readFrom:(const WrdFontFamilyName *)a3 withFontTable:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 v17;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", &a3->var1);
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeOfString:", v7);
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v6, "substringWithRange:", 0, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(v6, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);

  objc_msgSend(v5, "createFontWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", &a3->var2);
    objc_msgSend(v14, "addAlternateName:", v15);
    objc_msgSend(v14, "setFontFamily:", a3->var9);
    objc_msgSend(v14, "setCharacterSet:", a3->var3);
    objc_msgSend(v14, "setPitch:", a3->var8);

  }
  return v14;
}

+ (void)write:(id)a3 to:(WrdFontFamilyName *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "copyToCsString:", &a4->var1);

  CsString::append(&a4->var1, 0);
  objc_msgSend(v9, "secondName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    objc_msgSend(v9, "secondName");
  else
    objc_msgSend(v9, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "copyToCsString:", &a4->var2);

  a4->var7 = 1;
  a4->var9 = objc_msgSend(v9, "fontFamily");
  a4->var6 = 400;
  a4->var3 = objc_msgSend(v9, "characterSet");
  a4->var10 = 0;
  a4->var8 = objc_msgSend(v9, "pitch");

}

@end
