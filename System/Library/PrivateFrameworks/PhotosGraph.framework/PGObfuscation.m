@implementation PGObfuscation

+ (id)obfuscatedStringFromPlaintextString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  id v9;
  const void *v10;
  size_t v11;
  id v12;
  void *v13;
  size_t v15;

  v3 = a3;
  objc_msgSend(CFSTR("aE45Bhwo2Wf4re1A"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_retainAutorelease(v4);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v5);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  v12 = objc_retainAutorelease(v6);
  v13 = 0;
  if (!CCCrypt(0, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), &v15))
  {
    objc_msgSend(v12, "setLength:", v15);
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)plaintextStringFromObfuscatedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  id v9;
  const void *v10;
  size_t v11;
  id v12;
  void *v13;
  size_t v15;

  v3 = a3;
  objc_msgSend(CFSTR("aE45Bhwo2Wf4re1A"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_retainAutorelease(v4);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v5);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  v12 = objc_retainAutorelease(v6);
  v13 = 0;
  if (!CCCrypt(1u, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), &v15))
  {
    objc_msgSend(v12, "setLength:", v15);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
  }

  return v13;
}

+ (id)obfuscatedStringFromPlaintextNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  id v9;
  const void *v10;
  size_t v11;
  id v12;
  CCCryptorStatus v13;
  void *v14;
  size_t v16;

  objc_msgSend(a3, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("aE45Bhwo2Wf4re1A"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_retainAutorelease(v4);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v5);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  v12 = objc_retainAutorelease(v6);
  v13 = CCCrypt(0, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), &v16);
  v14 = 0;
  if (!v13)
  {
    objc_msgSend(v12, "setLength:", v16);
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)plaintextNumberFromObfuscatedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  id v9;
  const void *v10;
  size_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  size_t v18;

  v3 = a3;
  objc_msgSend(CFSTR("aE45Bhwo2Wf4re1A"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v7 = objc_retainAutorelease(v4);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v5);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  v12 = objc_retainAutorelease(v6);
  v13 = 0;
  if (!CCCrypt(1u, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), &v18))
  {
    objc_msgSend(v12, "setLength:", v18);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
    v15 = v14;
    if (v14)
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v16, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (id)obfuscatedStringFromPlaintextDate:(id)a3 usingDateFormatter:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a4, "stringFromDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGObfuscation obfuscatedStringFromPlaintextString:](PGObfuscation, "obfuscatedStringFromPlaintextString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)plaintextDateFromObfuscatedString:(id)a3 usingDateFormatter:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGObfuscation plaintextStringFromObfuscatedString:](PGObfuscation, "plaintextStringFromObfuscatedString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "dateFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
