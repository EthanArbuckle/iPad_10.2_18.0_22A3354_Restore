@implementation _SWCDomain

+ (_SWCDomain)new
{
  abort();
}

- (_SWCDomain)init
{
  abort();
}

- (_SWCDomain)initWithString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  _SWCDomain *v30;
  void *context;
  void *v33;
  void *v34;
  unsigned int v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1A85D4B3C](self, a2);
  objc_msgSend(CFSTR("https://"), "stringByAppendingString:", a3);
  context = (void *)v4;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v33);
  objc_msgSend(v37, "host");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E547D930;
  v8 = v7;

  v38 = v8;
  v36 = -[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("*."));
  if (v36)
  {
    -[__CFString substringFromIndex:](v8, "substringFromIndex:", 2);
    v9 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v9;
  }
  objc_msgSend(v37, "port");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "percentEncodedQueryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_32;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "value");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (__CFString *)v18;
        else
          v20 = &stru_1E547D930;
        v21 = v20;

        objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v17);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v13);
  }

  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("+"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = v23;
      v25 = 0;
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
            if (objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("developer")))
            {
              if (!objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("managed")))
                v25 |= 2u;
            }
            else
            {
              v25 |= 1u;
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v26);
      }

    }
    else
    {
      LOBYTE(v25) = 0;
    }

  }
  else
  {
LABEL_32:
    LOBYTE(v25) = 0;
  }

  objc_autoreleasePoolPop(context);
  v30 = -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:](self, "initWithHost:port:wildcard:modeOfOperation:", v38, v34, v36, (char)v25);

  return v30;
}

- (_SWCDomain)initWithHost:(id)a3 port:(id)a4 wildcard:(BOOL)a5 modeOfOperation:(char)a6
{
  id v10;
  id v11;
  _SWCDomain *v12;
  void *v13;
  uint64_t v14;
  NSString *host;
  uint64_t v16;
  NSNumber *port;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SWCDomain;
  v12 = -[_SWCDomain init](&v19, sel_init);
  if (v12)
  {
    objc_msgSend(v10, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    host = v12->_host;
    v12->_host = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    port = v12->_port;
    v12->_port = (NSNumber *)v16;

    v12->_wildcard = a5;
    v12->_modeOfOperation = a6;
  }

  return v12;
}

+ (_SWCDomain)appleDomain
{
  return -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:]([_SWCDomain alloc], "initWithHost:port:wildcard:modeOfOperation:", CFSTR("apple.com"), 0, 1, 0);
}

+ (_SWCDomain)exampleDomain
{
  return -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:]([_SWCDomain alloc], "initWithHost:port:wildcard:modeOfOperation:", CFSTR("example.com"), 0, 1, 0);
}

- (NSString)rawValue
{
  NSString *host;
  NSString *v4;
  void *v5;
  NSNumber *port;
  uint64_t v7;
  id v8;
  void *v9;
  char modeOfOperation;
  void *v11;
  uint64_t v12;

  host = self->_host;
  if (self->_wildcard)
  {
    objc_msgSend(CFSTR("*."), "stringByAppendingString:", host);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = host;
  }
  v5 = v4;
  port = self->_port;
  if (port)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(":%llu"), -[NSNumber unsignedLongLongValue](port, "unsignedLongLongValue"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (self->_modeOfOperation)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = v8;
    modeOfOperation = self->_modeOfOperation;
    if ((modeOfOperation & 1) != 0)
    {
      objc_msgSend(v8, "addObject:", CFSTR("developer"));
      modeOfOperation = self->_modeOfOperation;
    }
    if ((modeOfOperation & 2) != 0)
      objc_msgSend(v9, "addObject:", CFSTR("managed"));
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("+"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("?mode=%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  return (NSString *)v5;
}

- (BOOL)isValid
{
  _SWCDomain *v2;
  int modeOfOperation;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *host;
  const char *CStringPtr;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unsigned __int16 v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  NSNumber *port;
  uint64_t v33;
  uint64_t v35;
  _SWCDomain *v36;
  unsigned __int16 v37;
  uint8_t v38[4];
  _SWCDomain *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint8_t buf[4];
  _SWCDomain *v45;
  __int16 v46;
  uint64_t v47;
  CFStringRef v48;
  const UniChar *CharactersPtr;
  const char *v50;
  uint64_t v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t v55;
  CFRange v56;

  v2 = self;
  v55 = *MEMORY[0x1E0C80C00];
  modeOfOperation = self->_modeOfOperation;
  if (modeOfOperation == 1)
  {
    if (-[NSString isEqual:](self->_host, "isEqual:", CFSTR("localhost")))
    {
      if (qword_1ED1B62E8 != -1)
        dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
      v4 = qword_1ED1B62E0;
      if (os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v2;
        _os_log_impl(&dword_1A855A000, v4, OS_LOG_TYPE_INFO, "Domain %@ is localhost in developer mode, explicitly allowing.", buf, 0xCu);
      }
LABEL_70:
      port = v2->_port;
      if (!port || -[NSNumber unsignedLongLongValue](port, "unsignedLongLongValue") - 0x10000 > 0xFFFFFFFFFFFF0000)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
      if (qword_1ED1B62E8 != -1)
        dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
      v7 = (id)qword_1ED1B62E0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v33 = -[NSNumber unsignedLongLongValue](v2->_port, "unsignedLongLongValue");
        *(_DWORD *)buf = 138412546;
        v45 = v2;
        v46 = 2048;
        v47 = v33;
        _os_log_impl(&dword_1A855A000, v7, OS_LOG_TYPE_INFO, "Domain %@ contained an invalid port %llu", buf, 0x16u);
      }
LABEL_21:

      goto LABEL_84;
    }
    modeOfOperation = v2->_modeOfOperation;
  }
  if (!modeOfOperation && -[_SWCDomain isHostIPAddress](v2, "isHostIPAddress"))
  {
    if (qword_1ED1B62E8 != -1)
      dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
    v5 = qword_1ED1B62E0;
    v6 = os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO);
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v45 = v2;
      _os_log_impl(&dword_1A855A000, v5, OS_LOG_TYPE_INFO, "Domain %@ is an IP address in normal mode, explicitly blocking.", buf, 0xCu);
      goto LABEL_84;
    }
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSString length](v2->_host, "length");
  v9 = v8;
  v10 = v8 - 1;
  if (v8 < 1)
  {
    if (qword_1ED1B62E8 != -1)
      dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
    v13 = qword_1ED1B62E0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v2;
      _os_log_impl(&dword_1A855A000, v13, OS_LOG_TYPE_INFO, "Domain %@ contained empty hostname", buf, 0xCu);
    }
    goto LABEL_21;
  }
  host = (const __CFString *)v2->_host;
  v48 = host;
  v51 = 0;
  v52 = v8;
  CharactersPtr = CFStringGetCharactersPtr(host);
  v35 = v10;
  v36 = v2;
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(host, 0x600u);
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v50 = CStringPtr;
  v18 = 64;
  v53 = 0;
  v54 = 0;
  do
  {
    if ((unint64_t)v17 >= 4)
      v19 = 4;
    else
      v19 = v17;
    v20 = v52;
    if (v52 <= v17)
    {
      v21 = 0;
      v37 = 0;
LABEL_47:
      if ((-[NSObject characterIsMember:](v7, "characterIsMember:", v21) & 1) == 0)
      {
        if (qword_1ED1B62E8 != -1)
          dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
        v30 = (id)qword_1ED1B62E0;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v37, 1);
          *(_DWORD *)v38 = 138412802;
          v39 = v36;
          v40 = 2048;
          v41 = v21;
          v42 = 2114;
          v43 = v31;
          _os_log_impl(&dword_1A855A000, v30, OS_LOG_TYPE_INFO, "Domain %@ contained illegal character %llx ('%{public}@')", v38, 0x20u);

        }
        goto LABEL_83;
      }
      goto LABEL_48;
    }
    if (CharactersPtr)
    {
      v21 = CharactersPtr[v17 + v51];
    }
    else if (v50)
    {
      v21 = v50[v51 + v17];
    }
    else
    {
      v22 = v53;
      if (v54 <= v17 || v53 > v17)
      {
        v24 = v19 + v14;
        v25 = v18 - v19;
        v26 = v17 - v19;
        v27 = v26 + 64;
        if (v26 + 64 >= v52)
          v27 = v52;
        v53 = v26;
        v54 = v27;
        if (v52 >= v25)
          v20 = v25;
        v56.length = v20 + v24;
        v56.location = v26 + v51;
        CFStringGetCharacters(v48, v56, (UniChar *)buf);
        v22 = v53;
      }
      v21 = *(_WORD *)&buf[2 * v17 + -2 * v22];
    }
    v37 = v21;
    if (v21 != 46)
      goto LABEL_47;
    if (!v17)
    {
      if (qword_1ED1B62E8 != -1)
        dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
      v28 = qword_1ED1B62E0;
      if (!os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO))
        goto LABEL_83;
      *(_DWORD *)v38 = 138412290;
      v39 = v36;
      v29 = "Domain %@ began with a period character";
      goto LABEL_82;
    }
    if (v16 == 46)
    {
      if (qword_1ED1B62E8 != -1)
        dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
      v28 = qword_1ED1B62E0;
      if (!os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO))
        goto LABEL_83;
      *(_DWORD *)v38 = 138412290;
      v39 = v36;
      v29 = "Domain %@ contained two period characters in a row";
      goto LABEL_82;
    }
    ++v15;
    v21 = 46;
LABEL_48:
    ++v17;
    --v14;
    ++v18;
    v16 = v21;
  }
  while (v9 != v17);
  if (v15 == 1)
  {
    v2 = v36;
    if (-[NSString characterAtIndex:](v36->_host, "characterAtIndex:", v35) != 46)
      goto LABEL_69;
    if (qword_1ED1B62E8 != -1)
      dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
    v28 = qword_1ED1B62E0;
    if (!os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO))
      goto LABEL_83;
    *(_DWORD *)v38 = 138412290;
    v39 = v36;
    v29 = "Domain %@ was a TLD";
LABEL_82:
    _os_log_impl(&dword_1A855A000, v28, OS_LOG_TYPE_INFO, v29, v38, 0xCu);
    goto LABEL_83;
  }
  v2 = v36;
  if (v15)
  {
LABEL_69:

    goto LABEL_70;
  }
  if (qword_1ED1B62E8 != -1)
    dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
  v28 = qword_1ED1B62E0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v38 = 138412290;
    v39 = v36;
    v29 = "Domain %@ did not contain a period character";
    goto LABEL_82;
  }
LABEL_83:

LABEL_84:
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)isHostIPAddress
{
  _BOOL4 v2;
  _BYTE v4[4];
  char v5[256];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[NSString getCString:maxLength:encoding:](self->_host, "getCString:maxLength:encoding:", v5, 256, 1);
  if (v2)
    LOBYTE(v2) = v5[0] == 91 || inet_pton(2, v5, v4) == 1;
  return v2;
}

- (NSString)topLevelDomainValue
{
  uint64_t v3;
  uint64_t v4;
  NSString *host;
  NSString *v6;

  v4 = -[NSString rangeOfString:options:](self->_host, "rangeOfString:options:", CFSTR("."), 4);
  host = self->_host;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = host;
  }
  else
  {
    -[NSString substringFromIndex:](host, "substringFromIndex:", v4 + v3);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)encompassesDomain:(id)a3
{
  id *v4;
  NSNumber *port;
  BOOL v6;
  NSString *host;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (-[_SWCDomain isEqual:](self, "isEqual:", v4))
    goto LABEL_2;
  host = self->_host;
  if (self->_wildcard)
  {
    v8 = -[NSString length](host, "length");
    v9 = objc_msgSend(v4[2], "length");
    v10 = v9 - v8;
    if (v9 < v8
      || objc_msgSend(v4[2], "compare:options:range:", self->_host, 0, v10, v8)
      || v9 > v8 && objc_msgSend(v4[2], "characterAtIndex:", v10 - 1) != 46)
    {
      goto LABEL_25;
    }
    if (qword_1ED1B62E8 != -1)
      dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
    v11 = qword_1ED1B62E0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_DEBUG))
    {
LABEL_20:
      *(_DWORD *)v14 = 138412546;
      *(_QWORD *)&v14[4] = self;
      *(_WORD *)&v14[12] = 2112;
      *(_QWORD *)&v14[14] = v4;
      _os_log_debug_impl(&dword_1A855A000, v11, OS_LOG_TYPE_DEBUG, "Domain %@ encompasses %@", v14, 0x16u);
    }
  }
  else
  {
    if (!-[NSString isEqualToString:](host, "isEqualToString:", v4[2]))
    {
LABEL_25:
      v6 = 0;
      goto LABEL_26;
    }
    if (qword_1ED1B62E8 != -1)
      dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
    v11 = qword_1ED1B62E0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
  }
LABEL_2:
  port = self->_port;
  if (port && (!v4[3] || !-[NSNumber isEqualToNumber:](port, "isEqualToNumber:")))
    goto LABEL_25;
  if ((objc_msgSend(v4, "isValid", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15) & 1) == 0)
  {
    if (qword_1ED1B62E8 != -1)
      dispatch_once(&qword_1ED1B62E8, &__block_literal_global_136);
    v12 = qword_1ED1B62E0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B62E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 138412546;
      *(_QWORD *)&v14[4] = v4;
      *(_WORD *)&v14[12] = 2112;
      *(_QWORD *)&v14[14] = self;
      _os_log_debug_impl(&dword_1A855A000, v12, OS_LOG_TYPE_DEBUG, "Domain %@ is not valid; discarding matching result against %@",
        v14,
        0x16u);
    }
    goto LABEL_25;
  }
  v6 = 1;
LABEL_26:

  return v6;
}

- (_SWCDomain)nonWildcardDomain
{
  _SWCDomain *v2;

  if (self->_wildcard)
    v2 = -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:]([_SWCDomain alloc], "initWithHost:port:wildcard:modeOfOperation:", self->_host, self->_port, 0, self->_modeOfOperation);
  else
    v2 = self;
  return v2;
}

- (_SWCDomain)wildcardDomain
{
  _SWCDomain *v2;

  if (self->_wildcard)
    v2 = self;
  else
    v2 = -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:]([_SWCDomain alloc], "initWithHost:port:wildcard:modeOfOperation:", self->_host, self->_port, 1, self->_modeOfOperation);
  return v2;
}

- (id)domainRequiringModeOfOperation:(char)a3
{
  _SWCDomain *v3;

  if (self->_modeOfOperation == a3)
    v3 = self;
  else
    v3 = -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:]([_SWCDomain alloc], "initWithHost:port:wildcard:modeOfOperation:", self->_host, self->_port, self->_wildcard, a3);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_host, "hash") ^ self->_wildcard;
  return v3 ^ -[NSNumber hash](self->_port, "hash") ^ (2 * self->_modeOfOperation);
}

- (BOOL)isEqual:(id)a3
{
  _SWCDomain *v4;
  _SWCDomain *v5;
  NSNumber *port;
  NSNumber *v7;
  BOOL v8;

  v4 = (_SWCDomain *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_wildcard == v5->_wildcard && -[NSString isEqual:](self->_host, "isEqual:", v5->_host))
      {
        port = self->_port;
        v7 = v5->_port;
        if (port)
        {
          if (v7 && -[NSNumber isEqualToNumber:](port, "isEqualToNumber:"))
            goto LABEL_8;
        }
        else if (!v7)
        {
LABEL_8:
          v8 = self->_modeOfOperation == v5->_modeOfOperation;
LABEL_13:

          goto LABEL_14;
        }
      }
      v8 = 0;
      goto LABEL_13;
    }
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_SWCDomain description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSString *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  NSNumber *port;
  uint64_t v21;
  id v22;
  void *v23;
  char modeOfOperation;
  void *v25;
  uint64_t v26;

  if (qword_1ED1B62D8 != -1)
    dispatch_once(&qword_1ED1B62D8, &__block_literal_global_8);
  v3 = (void *)MEMORY[0x1A85D4B3C]();
  -[NSString componentsSeparatedByString:](self->_host, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 < 2)
  {
    v12 = self->_host;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)_MergedGlobals_7;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "member:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    v13 = v5 - 1;
    if (v11 < v5 - 1)
    {
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v14, "length") >= 3)
        {
          objc_msgSend(v14, "substringToIndex:", 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingString:", CFSTR("…"));
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v16;
        }
        objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v13 != v11);
    }
    objc_msgSend(v4, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v17);

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v3);
  if (self->_wildcard)
  {
    objc_msgSend(CFSTR("*."), "stringByAppendingString:", v12);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v12;
  }
  v19 = v18;
  port = self->_port;
  if (port)
  {
    objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(":%llu"), -[NSNumber unsignedLongLongValue](port, "unsignedLongLongValue"));
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  if (self->_modeOfOperation)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = v22;
    modeOfOperation = self->_modeOfOperation;
    if ((modeOfOperation & 1) != 0)
    {
      objc_msgSend(v22, "addObject:", CFSTR("developer"));
      modeOfOperation = self->_modeOfOperation;
    }
    if ((modeOfOperation & 2) != 0)
      objc_msgSend(v23, "addObject:", CFSTR("managed"));
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("?mode=%@"), v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v26;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_host, CFSTR("host"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_port, CFSTR("port"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_wildcard, CFSTR("wildcard"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modeOfOperation, CFSTR("modeOfOperation"));

}

- (_SWCDomain)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _SWCDomain *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("host"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("port"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wildcard"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modeOfOperation"));
  if (!v5)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15[0] = CFSTR("Line");
    v15[1] = CFSTR("Function");
    v16[0] = &unk_1E5480F18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCDomain initWithCoder:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, v11);
    objc_msgSend(v4, "failWithError:", v12);

    self = 0;
  }
  v13 = -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:](self, "initWithHost:port:wildcard:modeOfOperation:", v5, v6, v7, v8);

  return v13;
}

- (NSString)host
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)port
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isWildcard
{
  return self->_wildcard;
}

- (char)modeOfOperation
{
  return self->_modeOfOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
