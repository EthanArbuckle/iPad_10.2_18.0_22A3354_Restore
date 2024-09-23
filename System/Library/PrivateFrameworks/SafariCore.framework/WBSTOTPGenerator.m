@implementation WBSTOTPGenerator

+ (id)_keyDataForBase32EncodedString:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  size_t v6;
  size_t v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  signed int v15;
  char *v16;
  char v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;

  v3 = a3;
  if (_keyDataForBase32EncodedString__onceToken != -1)
    dispatch_once(&_keyDataForBase32EncodedString__onceToken, &__block_literal_global_62);
  v4 = objc_retainAutorelease(v3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  if (v6)
  {
    v7 = v6;
    v8 = malloc_type_calloc(v6, 1uLL, 0x826F2895uLL);
    v9 = 0;
    v10 = 0;
    do
    {
      v12 = *(unsigned __int8 *)v5++;
      v11 = v12;
      if (v12 != 61 && memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZ234567", v11, 0x21uLL))
      {
        v13 = *((unsigned __int8 *)&_keyDataForBase32EncodedString__inverseAlphabet + v11);
        v14 = 5 * v9 + 7;
        if (5 * v9 >= 0)
          v14 = 5 * v9;
        v15 = 5 * v9 - (v14 & 0xFFFFFFF8);
        v10 = (uint64_t)v14 >> 3;
        v16 = &v8[v14 >> 3];
        v17 = *v16;
        if (v15 >= 4)
        {
          v8[v10] = v17 | (v13 >> (v15 - 3));
          v16 = &v8[v10 + 1];
          v17 = *v16;
          v18 = 11;
        }
        else
        {
          v18 = 3;
        }
        *v16 = v17 | ((_BYTE)v13 << (v18 - v15));
        ++v9;
      }
      --v7;
    }
    while (v7);
    if (v8[v10 + 1])
      v19 = v10 + 2;
    else
      v19 = v10 + 1;
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v8, v19, 1);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  }
  v21 = v20;

  return v21;
}

void __51__WBSTOTPGenerator__keyDataForBase32EncodedString___block_invoke()
{
  uint64_t v0;

  v0 = 0;
  xmmword_1EEFE62C8 = 0u;
  unk_1EEFE62D8 = 0u;
  xmmword_1EEFE62A8 = 0u;
  unk_1EEFE62B8 = 0u;
  xmmword_1EEFE6288 = 0u;
  unk_1EEFE6298 = 0u;
  xmmword_1EEFE6268 = 0u;
  unk_1EEFE6278 = 0u;
  xmmword_1EEFE6248 = 0u;
  unk_1EEFE6258 = 0u;
  xmmword_1EEFE6228 = 0u;
  unk_1EEFE6238 = 0u;
  xmmword_1EEFE6208 = 0u;
  unk_1EEFE6218 = 0u;
  _keyDataForBase32EncodedString__inverseAlphabet = 0u;
  unk_1EEFE61F8 = 0u;
  do
  {
    *((_BYTE *)&_keyDataForBase32EncodedString__inverseAlphabet + aAbcdefghijklmn_2[v0]) = v0;
    ++v0;
  }
  while (v0 != 32);
}

+ (id)_base32EncodedStringForKeyData:(id)a3
{
  id v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  char v13;
  char v14;
  __CFString *v15;
  uint64_t v16;
  unint64_t v17;

  v3 = objc_retainAutorelease(a3);
  v4 = (char *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = (2 * (((unint64_t)(v5 + 4) * (unsigned __int128)0xCCCCCCCCCCCCCCCDLL) >> 64)) & 0xFFFFFFFFFFFFFFF8;
  if (v6)
  {
    v7 = v5;
    v8 = malloc_type_calloc(v6 | 1, 1uLL, 0xD9DA89CAuLL);
    v9 = v8;
    if (v7)
    {
      v10 = 0;
      do
      {
        v11 = v10 / 5;
        v12 = v10 % 5;
        v13 = v12 + 3;
        v8[v10 / 5] |= *v4 >> (v10 % 5 + 3);
        if (v12 >= 3)
        {
          v13 = v12 - 2;
          v8[++v11] |= (*v4 >> (v12 - 2)) & 0x1F;
        }
        v14 = *v4++;
        v8[v11 + 1] |= (v14 << (5 - v13)) & 0x1F;
        v10 += 8;
        --v7;
      }
      while (v7);
    }
    else
    {
      v11 = 0;
    }
    v16 = 0;
    v17 = v11 + 2;
    do
    {
      v8[v16] = aAbcdefghijklmn_2[v8[v16]];
      ++v16;
    }
    while (v17 != v16);
    if (v17 < v6)
    {
      memset(&v8[v17], 61, v6 - v11 - 2);
      v17 = v6;
    }
    v9[v17] = 0;
    v15 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, v17, 1, 1);
  }
  else
  {
    v15 = &stru_1E64A2498;
  }

  return v15;
}

+ (BOOL)_urlWithComponentsHasValidOtpauthURLScheme:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("otpauth")))
  {
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("apple-otpauth")) == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (WBSTOTPGenerator)initWithOTPAuthURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  WBSTOTPGenerator *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  WBSTOTPGenerator *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 1);
  v50 = self;
  if ((objc_msgSend((id)objc_opt_class(), "_urlWithComponentsHasValidOtpauthURLScheme:", v5) & 1) == 0)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSTOTPGenerator initWithOTPAuthURL:].cold.3(v9, v4);
    goto LABEL_7;
  }
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("totp"));

  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSTOTPGenerator initWithOTPAuthURL:].cold.2(v8, v4);
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v13;
  if (v13)
  {
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(":"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") == 2)
    {
      objc_msgSend(v14, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    v47 = (void *)v15;

  }
  else
  {
    v47 = 0;
    v16 = 0;
  }
  v42 = (void *)v16;
  v44 = (void *)v12;
  v45 = v5;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v5, "queryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (!v18)
  {
    v20 = 0;
    v48 = 6;
    v49 = 0;
    v46 = 30;
    goto LABEL_38;
  }
  v19 = v18;
  v20 = 0;
  v21 = *(_QWORD *)v52;
  v48 = 6;
  v49 = 0;
  v46 = 30;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v52 != v21)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v22);
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("secret")))
      {
        objc_msgSend(v23, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uppercaseString");
        v29 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v29;
        goto LABEL_32;
      }
      if (!objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("algorithm")))
      {
        objc_msgSend(v23, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[WBSTOTPGenerator _algorithmForQueryItemValue:](v50, "_algorithmForQueryItemValue:", v30);
LABEL_31:

        goto LABEL_32;
      }
      if (!objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("digits")))
      {
        objc_msgSend(v23, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v30, "integerValue");
        goto LABEL_31;
      }
      if (!objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("period")))
      {
        objc_msgSend(v23, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v30, "integerValue");
        goto LABEL_31;
      }
      if (objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("issuer")))
      {
        v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = v25;
          objc_msgSend(v4, "absoluteString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138739971;
          v56 = v27;
          _os_log_impl(&dword_1B2621000, v26, OS_LOG_TYPE_INFO, "Found invalid parameter in otpauth URL. url=%{sensitive}@", buf, 0xCu);

        }
      }
      else
      {
        objc_msgSend(v23, "value");
        v31 = objc_claimAutoreleasedReturnValue();

        v47 = (void *)v31;
      }
LABEL_32:

      ++v22;
    }
    while (v19 != v22);
    v32 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    v19 = v32;
  }
  while (v32);
LABEL_38:

  if (objc_msgSend(v20, "length"))
  {
    v5 = v45;
    objc_msgSend(v45, "scheme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("apple-otpauth"));

    v35 = v44;
    v36 = v47;
    v37 = v42;
    if (v34)
    {
      v38 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B2621000, v38, OS_LOG_TYPE_INFO, "Rewriting apple-otpauth:// URL.", buf, 2u);
      }
      objc_msgSend(v45, "setScheme:", CFSTR("otpauth"));
      objc_msgSend(v45, "URL");
      v39 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v39;
    }
    objc_msgSend((id)objc_opt_class(), "_keyDataForBase32EncodedString:", v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WBSTOTPGenerator initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:](v50, "initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:", v40, v44, v46, v48, v49, v47, v42, v4);

    if (v10)
    {
      v10 = v10;
      v50 = v10;
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    v41 = WBS_LOG_CHANNEL_PREFIXPasswords();
    v35 = v44;
    v5 = v45;
    v36 = v47;
    v37 = v42;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[WBSTOTPGenerator initWithOTPAuthURL:].cold.1(v41, v4);
    v10 = 0;
  }

LABEL_8:
  return v10;
}

- (WBSTOTPGenerator)initWithASCIIEncodedKey:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7
{
  id v12;
  void *v13;
  WBSTOTPGenerator *v14;

  v12 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WBSTOTPGenerator initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:](self, "initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:", v13, v12, a5, a6, a7, 0, 0, 0);

  return v14;
}

- (WBSTOTPGenerator)initWithBase32EncodedKey:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  WBSTOTPGenerator *v17;

  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_class();
  objc_msgSend(v13, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_keyDataForBase32EncodedString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WBSTOTPGenerator initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:](self, "initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:", v16, v12, a5, a6, a7, 0, 0, 0);

  return v17;
}

- (WBSTOTPGenerator)initWithBase32EncodedKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WBSTOTPGenerator *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSTOTPGenerator initWithBase32EncodedKey:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:](self, "initWithBase32EncodedKey:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:", v5, v6, 30, 6, 0);

  return v7;
}

- (WBSTOTPGenerator)initWithUserProvidedString:(id)a3
{
  void *v4;
  void *v5;
  WBSTOTPGenerator *v6;

  objc_msgSend(a3, "safari_stringByTrimmingWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", CFSTR("otpauth:")) & 1) != 0
      || objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", CFSTR("apple-otpauth:")))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[WBSTOTPGenerator initWithOTPAuthURL:](self, "initWithOTPAuthURL:", v5);

      v6 = self;
    }
    else
    {
      self = -[WBSTOTPGenerator initWithBase32EncodedKey:](self, "initWithBase32EncodedKey:", v4);
      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSTOTPGenerator)initWithKeyData:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7 issuer:(id)a8 accountName:(id)a9 originalURL:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSData *v21;
  NSData *key;
  NSDate *v23;
  WBSTOTPGenerator *v24;
  NSDate *initialDate;
  unint64_t v26;
  unint64_t v27;
  NSString *v28;
  NSString *issuer;
  NSString *v30;
  NSString *accountName;
  NSURL *v32;
  NSURL *originalURL;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (objc_msgSend(v16, "length")
    && (v35.receiver = self,
        v35.super_class = (Class)WBSTOTPGenerator,
        (self = -[WBSTOTPGenerator init](&v35, sel_init)) != 0))
  {
    v21 = (NSData *)objc_msgSend(v16, "copy");
    key = self->_key;
    self->_key = v21;

    if (v17)
    {
      v23 = (NSDate *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
      v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    initialDate = self->_initialDate;
    self->_initialDate = v23;

    v26 = 30;
    if (a5 - 5 < 0x128)
      v26 = a5;
    self->_codeGenerationPeriod = v26;
    self->_algorithm = a7;
    v27 = 6;
    if (a6 - 5 < 0xB)
      v27 = a6;
    self->_numberOfDigitsInCode = v27;
    v28 = (NSString *)objc_msgSend(v18, "copy");
    issuer = self->_issuer;
    self->_issuer = v28;

    v30 = (NSString *)objc_msgSend(v19, "copy");
    accountName = self->_accountName;
    self->_accountName = v30;

    v32 = (NSURL *)objc_msgSend(v20, "copy");
    originalURL = self->_originalURL;
    self->_originalURL = v32;

    self = self;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSURL)exportableURL
{
  NSURL *originalURL;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  originalURL = self->_originalURL;
  if (originalURL)
    return (NSURL *)(id)-[NSURL copy](originalURL, "copy");
  v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v5, "setScheme:", CFSTR("otpauth"));
  objc_msgSend(v5, "setHost:", CFSTR("totp"));
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend((id)objc_opt_class(), "_base32EncodedStringForKeyData:", self->_key);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_1E64A2498);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("secret"), v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v7 = (void *)MEMORY[0x1E0CB39D8];
  -[WBSTOTPGenerator _stringForAlgorithm:](self, "_stringForAlgorithm:", self->_algorithm);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("algorithm"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfDigitsInCode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("digits"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  v14 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_codeGenerationPeriod);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queryItemWithName:value:", CFSTR("period"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v18);

  objc_msgSend(v5, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v19;
}

- (BOOL)isEqual:(id)a3
{
  WBSTOTPGenerator *v4;
  WBSTOTPGenerator *v5;
  char v6;

  v4 = (WBSTOTPGenerator *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSData isEqualToData:](self->_key, "isEqualToData:", v5->_key)
        && -[NSDate isEqualToDate:](self->_initialDate, "isEqualToDate:", v5->_initialDate)
        && self->_codeGenerationPeriod == v5->_codeGenerationPeriod
        && self->_algorithm == v5->_algorithm
        && self->_numberOfDigitsInCode == v5->_numberOfDigitsInCode
        && WBSIsEqual(self->_issuer, v5->_issuer)
        && WBSIsEqual(self->_accountName, v5->_accountName))
      {
        v6 = WBSIsEqual(self->_originalURL, v5->_originalURL);
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSData hash](self->_key, "hash");
  v4 = -[NSDate hash](self->_initialDate, "hash") ^ v3 ^ self->_codeGenerationPeriod ^ self->_algorithm ^ self->_numberOfDigitsInCode;
  v5 = -[NSString hash](self->_issuer, "hash");
  v6 = v5 ^ -[NSString hash](self->_accountName, "hash");
  return v4 ^ v6 ^ -[NSURL hash](self->_originalURL, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t numberOfDigitsInCode;
  void *v6;
  void *v7;
  __int128 v9;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WBSTOTPGenerator;
  -[WBSTOTPGenerator description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&self->_initialDate;
  numberOfDigitsInCode = self->_numberOfDigitsInCode;
  -[WBSTOTPGenerator _stringForAlgorithm:](self, "_stringForAlgorithm:", self->_algorithm);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ date=%@ period=%i digits=%i alg=%@>"), v4, v9, numberOfDigitsInCode, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)heuristicallyDeterminedServiceNameHints
{
  NSArray *cachedHeuristicallyDeterminedServiceNameHints;
  NSString *issuer;
  NSArray *v5;
  NSArray *v6;

  cachedHeuristicallyDeterminedServiceNameHints = self->_cachedHeuristicallyDeterminedServiceNameHints;
  if (cachedHeuristicallyDeterminedServiceNameHints)
    goto LABEL_4;
  issuer = self->_issuer;
  if (issuer)
  {
    -[NSString componentsSeparatedByString:](issuer, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedHeuristicallyDeterminedServiceNameHints;
    self->_cachedHeuristicallyDeterminedServiceNameHints = v5;

    cachedHeuristicallyDeterminedServiceNameHints = self->_cachedHeuristicallyDeterminedServiceNameHints;
LABEL_4:
    issuer = cachedHeuristicallyDeterminedServiceNameHints;
  }
  return (NSArray *)issuer;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *issuer;
  id v5;

  issuer = self->_issuer;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", issuer, CFSTR("issuer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountName, CFSTR("accountName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialDate, CFSTR("_initialDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_codeGenerationPeriod, CFSTR("period"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_algorithm, CFSTR("algorithm"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfDigitsInCode, CFSTR("digits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalURL, CFSTR("originalURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("secret"));

}

- (WBSTOTPGenerator)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WBSTOTPGenerator *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initialDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("period"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("algorithm"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("digits"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secret"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[WBSTOTPGenerator initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:](self, "initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:", v12, v7, v8, v10, v9, v5, v6, v11);
  return v13;
}

+ (id)countdownStringForSecondsRemaining:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (a3 == 1)
  {
    _WBSLocalizedString(CFSTR("This code is valid for the next %zu second."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, 1);
  }
  else
  {
    _WBSLocalizedString(CFSTR("This code is valid for the next %zu seconds."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, a3);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString(CFSTR("A new code will be generated when it expires."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@\n%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)countdownStringForMultipleCodesWithSecondsRemaining:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "shortCountdownStringForSecondsRemaining:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString(CFSTR("Verification codes are valid for a short window. New codes will be generated when they expire."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@\n%@"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)shortCountdownStringForSecondsRemaining:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString(CFSTR("%zu seconds left."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WBSTOTPGenerator)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WBSTOTPGenerator *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  WBSTOTPGenerator *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalURL"));
    v5 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v5;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secret"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_initialDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("period"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v19, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("digits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("algorithm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("issuer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WBSTOTPGenerator initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:](self, "initWithKeyData:initialDate:codeGenerationPeriod:numberOfDigits:algorithm:issuer:accountName:originalURL:", v8, v18, v17, v10, v12, v13, v14, v6);

    if (self)
      v15 = self;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  NSData *key;
  NSDate *initialDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *issuer;
  NSString *accountName;
  NSURL *originalURL;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  key = self->_key;
  v16[0] = CFSTR("secret");
  v16[1] = CFSTR("_initialDate");
  initialDate = self->_initialDate;
  v17[0] = key;
  v17[1] = initialDate;
  v16[2] = CFSTR("digits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfDigitsInCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  v16[3] = CFSTR("period");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_codeGenerationPeriod);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("algorithm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_algorithm);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  issuer = self->_issuer;
  if (issuer)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", issuer, CFSTR("issuer"));
  accountName = self->_accountName;
  if (accountName)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", accountName, CFSTR("accountName"));
  originalURL = self->_originalURL;
  if (originalURL)
  {
    -[NSURL absoluteString](originalURL, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("originalURL"));

  }
  return (NSDictionary *)v10;
}

- (id)codeForDate:(id)a3
{
  unint64_t algorithm;
  id v5;
  unint64_t v6;
  CCHmacAlgorithm v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t numberOfDigitsInCode;
  uint64_t v13;
  unint64_t data;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  algorithm = self->_algorithm;
  v5 = a3;
  v6 = -[WBSTOTPGenerator _HMACLengthForAlgorithm:](self, "_HMACLengthForAlgorithm:", algorithm);
  v7 = -[WBSTOTPGenerator _commonCryptoAlgorithmForTOTPAlgorithm:](self, "_commonCryptoAlgorithmForTOTPAlgorithm:", self->_algorithm);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&data - v8;
  v10 = -[WBSTOTPGenerator _numberOfIntervalsSinceInitialDateForDate:](self, "_numberOfIntervalsSinceInitialDateForDate:", v5);

  data = bswap64(v10);
  CCHmac(v7, -[NSData bytes](self->_key, "bytes", data, v15), -[NSData length](self->_key, "length"), &data, 8uLL, v9);
  LODWORD(v6) = bswap32(*(_DWORD *)&v9[v9[v6 - 1] & 0xF] & 0xFFFFFF7F);
  numberOfDigitsInCode = self->_numberOfDigitsInCode;
  v13 = v6 % __exp10((double)numberOfDigitsInCode);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*u"), numberOfDigitsInCode, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)startDateOfIntervalContainingDate:(id)a3
{
  unint64_t v4;

  v4 = -[WBSTOTPGenerator _numberOfIntervalsSinceInitialDateForDate:](self, "_numberOfIntervalsSinceInitialDateForDate:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_initialDate, (double)(self->_codeGenerationPeriod * v4));
}

- (BOOL)generatesIdenticalCodesToGenerator:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && -[NSData isEqualToData:](self->_key, "isEqualToData:", v4[1])
    && -[NSDate isEqualToDate:](self->_initialDate, "isEqualToDate:", v4[5])
    && self->_codeGenerationPeriod == v4[6]
    && self->_algorithm == v4[7]
    && self->_numberOfDigitsInCode == v4[8];

  return v5;
}

- (unint64_t)_numberOfIntervalsSinceInitialDateForDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceDate:", self->_initialDate);
  return vcvtmd_u64_f64(v4 / (double)self->_codeGenerationPeriod);
}

- (unint64_t)_algorithmForQueryItemValue:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("sha256")))
    {
      v5 = 1;
      goto LABEL_7;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("sha512")))
    {
      v5 = 2;
      goto LABEL_7;
    }
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (unsigned)_commonCryptoAlgorithmForTOTPAlgorithm:(unint64_t)a3
{
  if (a3 == 2)
    return 4;
  else
    return 2 * (a3 == 1);
}

- (unint64_t)_HMACLengthForAlgorithm:(unint64_t)a3
{
  unint64_t v3;

  v3 = 20;
  if (a3 == 1)
    v3 = 32;
  if (a3 == 2)
    return 64;
  else
    return v3;
}

- (id)_stringForAlgorithm:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("SHA1");
  if (a3 == 1)
    v3 = CFSTR("SHA256");
  if (a3 == 2)
    return CFSTR("SHA512");
  else
    return (id)v3;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (unint64_t)codeGenerationPeriod
{
  return self->_codeGenerationPeriod;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (unint64_t)numberOfDigitsInCode
{
  return self->_numberOfDigitsInCode;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_cachedHeuristicallyDeterminedServiceNameHints, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithOTPAuthURL:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Otpauth URL is missing a secret. url=%{sensitive}@", v7, v8, v9, v10, 3u);

  OUTLINED_FUNCTION_4();
}

- (void)initWithOTPAuthURL:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Attempting to create a TOTP generator from a URL with a non-TOTP host portion. url=%{sensitive}@", v7, v8, v9, v10, 3u);

  OUTLINED_FUNCTION_4();
}

- (void)initWithOTPAuthURL:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Attempting to create a TOTP generator from a URL with a non-otpauth scheme. url=%{sensitive}@", v7, v8, v9, v10, 3u);

  OUTLINED_FUNCTION_4();
}

@end
