@implementation VCSParsedLine

+ (int64_t)tokenizeKeyword:(const char *)a3 withType:(unint64_t *)a4
{
  int64_t *v5;

  v5 = (int64_t *)bsearch(a3, &vcsTokensList, 0x29uLL, 0x18uLL, (int (__cdecl *)(const void *, const void *))vcsTokenCompare);
  if (v5)
  {
    if (a4)
      *a4 = v5[2];
    return *v5;
  }
  else
  {
    if (a4)
      *a4 = 0;
    return 50;
  }
}

+ (int64_t)tokenizeNSStringKeyword:(id)a3 withType:(unint64_t *)a4
{
  return objc_msgSend(a1, "tokenizeKeyword:withType:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), a4);
}

+ (const)lookupProperty:(int64_t)a3
{
  int64_t __key;

  __key = a3;
  return (const $E9F79BE52C26C7385FEA6DDCC3A6974D *)bsearch(&__key, &vcsPropertyList, 0x24uLL, 0x28uLL, (int (__cdecl *)(const void *, const void *))vcsPropertyCompare);
}

- (VCSParsedLine)init
{
  char *v2;
  VCSParsedLine *v3;
  void *v4;
  NSMutableData *v5;
  NSMutableData *content;
  NSMutableDictionary *v7;
  NSMutableDictionary *params;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VCSParsedLine;
  v2 = -[VCSParsedLine init](&v10, sel_init);
  v3 = (VCSParsedLine *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1D34840E0;
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = 0;

    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    content = v3->_content;
    v3->_content = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    params = v3->_params;
    v3->_params = v7;

    v3->_usePalmD4Hooks = 0;
  }
  return v3;
}

- (void)reset
{
  NSString *keyword;

  *(_OWORD *)&self->_type = xmmword_1D34840E0;
  keyword = self->_keyword;
  self->_keyword = 0;

  -[NSMutableData setLength:](self->_content, "setLength:", 0);
  -[NSMutableDictionary removeAllObjects](self->_params, "removeAllObjects");
}

- (id)loadFromCString:(char *)a3 withParseState:(id)a4
{
  id v6;
  size_t v7;
  VCSParsedLine *v8;
  int v9;
  int v10;
  void *v12;
  unsigned int i;
  int v14;
  int64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  int v21;
  const char *v22;
  int v23;
  size_t v24;
  _BYTE *v25;
  int v26;
  _BYTE *v27;
  NSMutableDictionary *params;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *v32;
  void *v33;
  NSObject *v34;
  int v35;
  int v36;
  int v37;
  char *v38;
  NSObject *v39;
  VCSParsedLine *v40;
  char *v41;
  uint64_t v43;
  uint64_t v44;

  v6 = a4;
  v44 = 0;
  v7 = strlen(a3);
  switch(v7)
  {
    case 0uLL:
      goto LABEL_66;
    case 2uLL:
      v10 = *a3;
      if (v10 == 10 || v10 == 13)
        goto LABEL_66;
      break;
    case 1uLL:
      v8 = 0;
      v9 = *a3;
      if (v9 == 10 || v9 == 13)
        goto LABEL_67;
      break;
  }
  v12 = malloc_type_malloc(v7 + 1, 0xA964C1C8uLL);
  -[VCSParsedLine reset](self, "reset");
  for (i = 0; ; ++i)
  {
    v14 = a3[i];
    if (v14 != 45)
    {
      if (!a3[i])
      {
        i = 0;
        goto LABEL_18;
      }
      if ((v14 & 0xFFFFFFDF) - 65 >= 0x1A)
        break;
    }
  }
  memcpy(v12, a3, i);
  *((_BYTE *)v12 + i) = 0;
  -[VCSParsedLine setKeywordFromCString:](self, "setKeywordFromCString:", v12);
  v15 = +[VCSParsedLine tokenizeKeyword:withType:](VCSParsedLine, "tokenizeKeyword:withType:", v12, &v44);
  -[VCSParsedLine setType:](self, "setType:", v44);
  -[VCSParsedLine setTokenID:](self, "setTokenID:", v15);
LABEL_18:
  for (LODWORD(v16) = i; ; LODWORD(v16) = v16 + 1)
  {
    v17 = a3[v16];
    if (v17 != 32)
      break;
  }
  if ((v17 - 58) >= 2)
  {
    VCSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[VCSParsedLine loadFromCString:withParseState:].cold.1(v6, &a3[v16], v34);
    goto LABEL_65;
  }
  if (v44 == 1)
  {
    if (v17 == 58)
    {
      v35 = v16 + 1;
      v43 = 0;
      do
      {
        v36 = v35;
        v37 = a3[v35++];
      }
      while (v37 == 32);
      v38 = &a3[v36];
      +[VCSParsedLine tokenizeKeyword:withType:](VCSParsedLine, "tokenizeKeyword:withType:", v38, &v43);
      if (v43 != 2)
      {
        VCSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[VCSParsedLine loadFromCString:withParseState:].cold.3((uint64_t)v38);

      }
      v40 = self;
      v41 = v38;
      goto LABEL_59;
    }
    VCSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[VCSParsedLine loadFromCString:withParseState:].cold.4(v6, v34);
    goto LABEL_65;
  }
  if (v44 != 3)
  {
    VCSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[VCSParsedLine loadFromCString:withParseState:].cold.2((uint64_t)v12);
LABEL_65:

    free(v12);
LABEL_66:
    v8 = 0;
    goto LABEL_67;
  }
  while (v17 == 59)
  {
    v18 = 0;
    v19 = v16 + 1;
    while (1)
    {
      v20 = v19 + v18;
      v21 = a3[v20];
      if (v21 != 45)
      {
        if (!a3[v20])
        {
          v22 = &a3[v20];
          goto LABEL_32;
        }
        if ((v21 & 0xFFFFFFDF) - 65 >= 0x1A)
          break;
      }
      ++v18;
    }
    v22 = &a3[v20];
    memcpy(v12, &a3[v19], v18);
    *((_BYTE *)v12 + v18) = 0;
    i = v19 + v18;
LABEL_32:
    for (LODWORD(v16) = i; ; LODWORD(v16) = v16 + 1)
    {
      v23 = a3[v16];
      if (v23 != 32)
        break;
    }
    if (v23 == 61)
    {
      v24 = strlen(v22);
      v25 = malloc_type_malloc(v24 + 1, 0x100004077774924uLL);
      LODWORD(v16) = v16 + 1;
      v26 = a3[v16];
      v27 = v25;
      do
      {
        if (v26 == 92)
        {
          if (a3[(v16 + 1)] == 59)
            LODWORD(v16) = v16 + 1;
          LOBYTE(v26) = a3[v16];
        }
        *v27++ = v26;
        v16 = (v16 + 1);
        v26 = a3[v16];
      }
      while ((v26 & 0xFE) != 0x3A);
      *v27 = 0;
      params = self->_params;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](params, "setObject:forKey:", v29, v30);

      free(v25);
      v31 = v16;
    }
    else
    {
      v31 = v16;
      v32 = self->_params;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", &stru_1E953C148, v33);

    }
    v17 = a3[v31];
  }
  if (v17 != 58)
    goto LABEL_60;
  v41 = &a3[(v16 + 1)];
  v40 = self;
LABEL_59:
  -[VCSParsedLine setContentFromCString:](v40, "setContentFromCString:", v41);
LABEL_60:
  if (self)
    -[VCSParsedLine setUsePalmD4Hooks:](self, "setUsePalmD4Hooks:", objc_msgSend(v6, "palmImport"));
  free(v12);
  v8 = self;
LABEL_67:

  return v8;
}

- (void)setKeywordFromCString:(char *)a3
{
  NSString *v4;
  NSString *keyword;

  v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
  keyword = self->_keyword;
  self->_keyword = v4;

}

- (id)keyword
{
  return self->_keyword;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *keyword;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VCSParsedLine;
  -[VCSParsedLine description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  keyword = self->_keyword;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = (void *)objc_msgSend(v6, "initWithData:encoding:", self->_content, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@,%@"), v4, keyword, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setContentFromCString:(char *)a3
{
  -[NSMutableData setLength:](self->_content, "setLength:", 0);
  -[NSMutableData appendBytes:length:](self->_content, "appendBytes:length:", a3, strlen(a3) + 1);
}

- (id)content
{
  return self->_content;
}

- (id)convertedContent
{
  __CFString *v3;
  NSMutableDictionary *params;
  uint64_t v5;
  void *v6;
  NSMutableData *v7;
  int v8;
  NSMutableData *content;
  NSMutableData *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t SystemEncoding;
  uint64_t v14;
  void *v15;
  void *v16;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_params, "objectForKeyedSubscript:", CFSTR("ENCODING"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  params = self->_params;
  if (v3)
  {
    -[NSMutableDictionary removeObjectForKey:](params, "removeObjectForKey:", CFSTR("ENCODING"));
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](params, "objectForKeyedSubscript:", CFSTR("QUOTED-PRINTABLE"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = self->_content;
      goto LABEL_11;
    }
    v6 = (void *)v5;
    v3 = CFSTR("QUOTED-PRINTABLE");
    -[NSMutableDictionary removeObjectForKey:](self->_params, "removeObjectForKey:", CFSTR("QUOTED-PRINTABLE"));

  }
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("QUOTED-PRINTABLE")))
  {
    -[NSMutableData VCSDecodeQuotedPrintableForText:](self->_content, "VCSDecodeQuotedPrintableForText:", 0);
    v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("BASE64"));
    content = self->_content;
    if (v8)
    {
      -[NSMutableData VCSDecodeBase64](content, "VCSDecodeBase64");
      v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = content;
    }
  }
  v10 = v7;

LABEL_11:
  -[NSMutableDictionary objectForKey:](self->_params, "objectForKey:", CFSTR("CHARSET"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && !-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("macintosh")))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_params, "removeObjectForKey:", CFSTR("CHARSET"));
    SystemEncoding = CFStringConvertIANACharSetNameToEncoding(v12);
    goto LABEL_16;
  }
  if (self->_usePalmD4Hooks)
  {
    SystemEncoding = CFStringGetSystemEncoding();
LABEL_16:
    v14 = SystemEncoding;
    goto LABEL_18;
  }
  v14 = 134217984;
LABEL_18:
  -[NSMutableData VCSConvert8bitBufferToUTF8From:](v10, "VCSConvert8bitBufferToUTF8From:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
  else
    v16 = 0;

  return v16;
}

- (id)params
{
  return self->_params;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (int64_t)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(int64_t)a3
{
  self->_tokenID = a3;
}

- (BOOL)usePalmD4Hooks
{
  return self->_usePalmD4Hooks;
}

- (void)setUsePalmD4Hooks:(BOOL)a3
{
  self->_usePalmD4Hooks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)loadFromCString:(NSObject *)a3 withParseState:.cold.1(void *a1, char *a2, NSObject *a3)
{
  int v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "lineNumber");
  v6 = *a2;
  v7[0] = 67109376;
  v7[1] = v5;
  v8 = 1024;
  v9 = v6;
  _os_log_error_impl(&dword_1D3456000, a3, OS_LOG_TYPE_ERROR, "File syntax error at line %d: found %c", (uint8_t *)v7, 0xEu);
}

- (void)loadFromCString:(uint64_t)a1 withParseState:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D3456000, v2, v3, "Unknown keyword %@ at line %d.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadFromCString:(uint64_t)a1 withParseState:.cold.3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D3456000, v2, v3, "Non entity-name keyword '%@' at line %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadFromCString:(void *)a1 withParseState:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "lineNumber");
  _os_log_error_impl(&dword_1D3456000, a2, OS_LOG_TYPE_ERROR, "Semi-colon expected at line %d", (uint8_t *)v3, 8u);
}

@end
