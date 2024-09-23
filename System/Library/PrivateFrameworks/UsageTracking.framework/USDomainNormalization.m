@implementation USDomainNormalization

- (void)dealloc
{
  UIDNA *idna;
  objc_super v4;

  idna = self->_idna;
  if (idna)
    uidna_close(idna);
  v4.receiver = self;
  v4.super_class = (Class)USDomainNormalization;
  -[USDomainNormalization dealloc](&v4, sel_dealloc);
}

- (id)normalizeDomainName:(id)a3
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  UIDNA *idna;
  int32_t v10;
  int32_t v11;
  UErrorCode v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UErrorCode pErrorCode;
  UIDNAInfo pInfo;

  v5 = a3;
  v6 = v5;
  if ((objc_msgSend(v5, "canBeConvertedToEncoding:", 1) & 1) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v14);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "lowercaseString");
      v16 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v16;
    }
    v17 = v6;
    goto LABEL_22;
  }
  objc_msgSend(v5, "precomposedStringWithCanonicalMapping");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  idna = self->_idna;
  if (!idna)
  {
    *(_DWORD *)&pInfo.size = 0;
    idna = (UIDNA *)MEMORY[0x212BAB414](0, &pInfo);
    self->_idna = idna;
    if (*(int *)&pInfo.size >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USDomainNormalization.m"), 45, CFSTR("Failed to create UIDNA service object %d"), *(unsigned int *)&pInfo.size);

      idna = self->_idna;
    }
  }
  pInfo = (UIDNAInfo)xmmword_20D8BC830;
  pErrorCode = U_ZERO_ERROR;
  v10 = uidna_nameToASCII_UTF8(idna, v8, -1, 0, 0, &pInfo, &pErrorCode);
  v11 = v10;
  v12 = pErrorCode;
  if (pErrorCode == U_BUFFER_OVERFLOW_ERROR)
  {
    v12 = U_ZERO_ERROR;
    pErrorCode = U_ZERO_ERROR;
  }
  if (v12 <= U_ZERO_ERROR && !pInfo.errors)
  {
    if (v10 < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USDomainNormalization.m"), 62, CFSTR("Got a negative ACE length for domain %@"), v5);

    }
    v13 = (char *)malloc_type_malloc(v11, 0xF6001D5FuLL);
    if (uidna_nameToASCII_UTF8(self->_idna, v8, -1, v13, v11, &pInfo, &pErrorCode) != v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USDomainNormalization.m"), 65, CFSTR("Got a different ACE length for the same input"));

    }
    if (pErrorCode > U_ZERO_ERROR || pInfo.errors)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USDomainNormalization.m"), 66, CFSTR("Got an error the second time uidna_nameToASCII_UTF8 was called, %d (%u)"), pErrorCode, pInfo.errors);

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13, v11, 4);

    free(v13);
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[USDomainNormalization normalizeDomainName:].cold.1((uint64_t)v5, (int *)&pErrorCode, (int *)&pInfo.errors);
  v17 = v5;
LABEL_22:
  v18 = v17;

  return v18;
}

- (id)normalizeDomainNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (!objc_msgSend(v11, "canBeConvertedToEncoding:", 1)
          || objc_msgSend(v11, "rangeOfCharacterFromSet:", v5) != 0x7FFFFFFFFFFFFFFFLL)
        {

          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v6, "count"));
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v23 != v16)
                  objc_enumerationMutation(v13);
                -[USDomainNormalization normalizeDomainName:](self, "normalizeDomainName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v15);
          }
          goto LABEL_20;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v12 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_20:

  if (v12)
    v19 = v12;
  else
    v19 = v6;
  v20 = v19;

  return v20;
}

- (id)normalizeURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USDomainNormalization normalizeDomainName:](self, "normalizeDomainName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v7;
  if (v5 != v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v7, 1);
    objc_msgSend(v9, "setHost:", v6);
    objc_msgSend(v9, "URL");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[USDomainNormalization normalizeURL:].cold.1((uint64_t)v7);
    v8 = v7;
  }

  return v8;
}

- (void)normalizeDomainName:(int *)a3 .cold.1(uint64_t a1, int *a2, int *a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = *a3;
  v5 = 138412802;
  v6 = a1;
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to encode domain %@, %d (%u)", (uint8_t *)&v5, 0x18u);
}

- (void)normalizeURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_fault_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to normalize URL: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
