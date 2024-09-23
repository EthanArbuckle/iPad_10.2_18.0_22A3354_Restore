@implementation CNVCardEncoding

+ (id)standardEncodings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CNVCardEncoding_standardEncodings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardEncodings_cn_once_token_1 != -1)
    dispatch_once(&standardEncodings_cn_once_token_1, block);
  return (id)standardEncodings_cn_once_object_1;
}

void __36__CNVCardEncoding_standardEncodings__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "makeStandardEncodings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)standardEncodings_cn_once_object_1;
  standardEncodings_cn_once_object_1 = v1;

}

+ (id)makeStandardEncodings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardEncoding asciiEncoding](CNVCardEncoding, "asciiEncoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  +[CNVCardEncoding isoLatin1Encoding](CNVCardEncoding, "isoLatin1Encoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  +[CNVCardEncoding macRomanEncoding](CNVCardEncoding, "macRomanEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  +[CNVCardEncoding utf8Encoding](CNVCardEncoding, "utf8Encoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

+ (id)addPreferredEncoding:(id)a3 toEncodings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__CNVCardEncoding_addPreferredEncoding_toEncodings___block_invoke;
    v11[3] = &unk_1E956FE30;
    v9 = v5;
    v12 = v9;
    objc_msgSend(v8, "_cn_removeObjectsPassingTest:", v11);
    if (objc_msgSend(v8, "count") == 1)
      objc_msgSend(v8, "_cn_addNonNilObject:", v9);
    else
      objc_msgSend(v8, "_cn_insertNonNilObject:atIndex:", v9, 1);

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

uint64_t __52__CNVCardEncoding_addPreferredEncoding_toEncodings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

+ (id)encodingsFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "standardEncodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredEncodingInUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addPreferredEncoding:toEncodings:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)preferredEncodingInUserDefaults
{
  void *v3;
  void *v4;
  const __CFString *v5;
  CFStringEncoding v6;

  +[CNVCardUserDefaults vCard21Encoding](CNVCardUserDefaults, "vCard21Encoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "uppercaseString");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v6 = CFStringConvertIANACharSetNameToEncoding(v5);
    if (v6 == -1)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(a1, "encodingWithName:stringEncoding:", v5, CFStringConvertEncodingToNSStringEncoding(v6));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v5;
  }

  return v4;
}

+ (id)encodingWithName:(id)a3 stringEncoding:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:stringEncoding:", v6, a4);

  return v7;
}

+ (id)asciiEncoding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CNVCardEncoding_asciiEncoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (asciiEncoding_cn_once_token_2 != -1)
    dispatch_once(&asciiEncoding_cn_once_token_2, block);
  return (id)asciiEncoding_cn_once_object_2;
}

void __32__CNVCardEncoding_asciiEncoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "encodingWithName:stringEncoding:", CFSTR("ASCII"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)asciiEncoding_cn_once_object_2;
  asciiEncoding_cn_once_object_2 = v1;

}

+ (id)isoLatin1Encoding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CNVCardEncoding_isoLatin1Encoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isoLatin1Encoding_cn_once_token_3 != -1)
    dispatch_once(&isoLatin1Encoding_cn_once_token_3, block);
  return (id)isoLatin1Encoding_cn_once_object_3;
}

void __36__CNVCardEncoding_isoLatin1Encoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "encodingWithName:stringEncoding:", CFSTR("LATIN1"), 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isoLatin1Encoding_cn_once_object_3;
  isoLatin1Encoding_cn_once_object_3 = v1;

}

+ (id)macRomanEncoding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CNVCardEncoding_macRomanEncoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (macRomanEncoding_cn_once_token_4 != -1)
    dispatch_once(&macRomanEncoding_cn_once_token_4, block);
  return (id)macRomanEncoding_cn_once_object_4;
}

void __35__CNVCardEncoding_macRomanEncoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "encodingWithName:stringEncoding:", CFSTR("MACINTOSH"), 30);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)macRomanEncoding_cn_once_object_4;
  macRomanEncoding_cn_once_object_4 = v1;

}

+ (id)utf8Encoding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CNVCardEncoding_utf8Encoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (utf8Encoding_cn_once_token_5 != -1)
    dispatch_once(&utf8Encoding_cn_once_token_5, block);
  return (id)utf8Encoding_cn_once_object_5;
}

void __31__CNVCardEncoding_utf8Encoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "encodingWithName:stringEncoding:", CFSTR("UTF-8"), 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)utf8Encoding_cn_once_object_5;
  utf8Encoding_cn_once_object_5 = v1;

}

- (CNVCardEncoding)initWithName:(id)a3 stringEncoding:(unint64_t)a4
{
  id v6;
  CNVCardEncoding *v7;
  uint64_t v8;
  NSString *name;
  CNVCardEncoding *v10;

  v6 = a3;
  v7 = -[CNVCardEncoding init](self, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_stringEncoding = a4;
    v10 = v7;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
