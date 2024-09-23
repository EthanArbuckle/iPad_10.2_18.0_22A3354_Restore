@implementation TVRMSDAAPParser

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TVRMSDAAPParser_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __33__TVRMSDAAPParser_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

+ (id)objectWithData:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(a1, "objectWithData:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    _TVRCRMSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Failed to parse DAAP response data. %@", buf, 0xCu);

    }
  }

  return v3;
}

+ (id)objectWithData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[TVRMSDAAPParser sharedInstance](TVRMSDAAPParser, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  if (v7 > 7)
  {
    v13 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v14 = bswap64(v13[1] | ((unint64_t)*v13 << 32));
    v15 = HIDWORD(v14);
    v16 = v7 - 8;
    if (HIDWORD(v14) <= v7 - 8)
    {
      objc_msgSend(v6, "processResponseCode:bytes:length:");
      a4 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (a4)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), ((int)v14 >> 24), ((int)((_DWORD)v14 << 8) >> 24), ((__int16)v14 >> 8), (char)v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Expected body length (%d bytes) exceeds received body length (%zd bytes); response code '%@'."),
        v15,
        v16,
        v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD1398];
      v22 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      v12 = 2;
      goto LABEL_7;
    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Response did not include a body (only %zd bytes returned)."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FC8];
    v24[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = 1;
LABEL_7:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("RSDAAPParserErrorDomain"), v12, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return a4;
}

- (id)parseUTF8String:(const char *)a3 length:(unsigned int)a4
{
  unsigned int v4;
  uint64_t v5;
  __CFString *v6;

  if (a4)
  {
    v4 = a4 - 1;
    if (a4 == 1 && !*a3)
    {
      v6 = &stru_24DCDC4B0;
    }
    else
    {
      if (a3[v4])
        v5 = a4;
      else
        v5 = v4;
      v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, v5, 4);
    }
  }
  else
  {
    v6 = &stru_24DCDC4B0;
  }
  return v6;
}

- (id)parseUnicodeCharacter:(const char *)a3 length:(unsigned int)a4
{
  if (a4 == 2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, 2, 2415919360);
  else
    return 0;
}

- (id)parseXMLContent:(const char *)a3 length:(unsigned int)a4
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v6)
    {
      _TVRCRMSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to process XML response: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setBool:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  switch(a4)
  {
    case 1u:
      v11 = *(unsigned __int8 *)a3;
      goto LABEL_8;
    case 2u:
      v11 = *(unsigned __int16 *)a3;
      goto LABEL_8;
    case 4u:
      v11 = *(_DWORD *)a3;
LABEL_8:
      v13 = v11 == 0;
      goto LABEL_10;
    case 8u:
      v13 = *(_QWORD *)a3 == 0;
LABEL_10:
      v14 = !v13;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v10);

      break;
    default:
      _TVRCRMSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109378;
        v16[1] = a4;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setBool being passed a %u byte value for: <%@>!", (uint8_t *)v16, 0x12u);
      }

      break;
  }

}

- (void)setSInt8:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", *a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setSInt8 being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setUInt8:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setUInt8 being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setSInt16:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", ((int)bswap32(*(unsigned __int16 *)a3) >> 16));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setSInt16 being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setUInt16:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)a3) >> 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setUInt16 being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setDate:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)bswap32(*(_DWORD *)a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setDate being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setUInt32:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*(_DWORD *)a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setUInt32 being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setFloat32:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  double v11;
  void *v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 4)
  {
    LODWORD(v11) = *(_DWORD *)a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v10);

  }
  else
  {
    _TVRCRMSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109378;
      v14[1] = a4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "setFloat32 being passed a %u byte value for: <%@>!", (uint8_t *)v14, 0x12u);
    }

  }
}

- (void)setUInt64:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", bswap64(*(_QWORD *)a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = a4;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "setUInt64 being passed a %u byte value for: <%@>!", (uint8_t *)v13, 0x12u);
    }

  }
}

- (void)setString:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;

  if (a4)
  {
    v7 = *(_QWORD *)&a4;
    v10 = a6;
    v11 = a5;
    -[TVRMSDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", a3, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, v10);

  }
}

- (void)enumerateDAAPChunksInBytes:(const char *)a3 length:(unsigned int)a4 usingBlock:(id)a5
{
  unsigned int v6;
  const char *v7;
  unint64_t v8;
  unsigned int v9;

  if (a4)
  {
    v6 = a4;
    do
    {
      v7 = a3 + 8;
      v8 = bswap64(*((unsigned int *)a3 + 1) | ((unint64_t)*(unsigned int *)a3 << 32));
      (*((void (**)(id, unint64_t, const char *))a5 + 2))(a5, v8, a3 + 8);
      a3 = &v7[HIDWORD(v8)];
      v9 = v6 - HIDWORD(v8);
      v6 = v6 - HIDWORD(v8) - 8;
    }
    while (v9 != 8);
  }
}

- (id)parseMACAddressListing:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__TVRMSDAAPParser_parseMACAddressListing_length___block_invoke;
  v9[3] = &unk_24DCD72A0;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__TVRMSDAAPParser_parseMACAddressListing_length___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  void *v3;
  id v4;

  if ((_DWORD)a2 == 1836281185)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", bswap64(*a3));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)parseServerInfo:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__TVRMSDAAPParser_parseServerInfo_length___block_invoke;
  v9[3] = &unk_24DCD72C8;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __42__TVRMSDAAPParser_parseServerInfo_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;

  v4 = HIDWORD(a2);
  if ((int)a2 > 1836278123)
  {
    if ((int)a2 > 1836281195)
    {
      if ((int)a2 > 1836282988)
      {
        if ((int)a2 <= 1836282995)
        {
          if ((_DWORD)a2 == 1836282989)
          {
            v11 = *(void **)(a1 + 32);
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v13 = CFSTR("dmap.timeoutinterval");
          }
          else
          {
            if ((_DWORD)a2 != 1836282991)
              goto LABEL_101;
            v11 = *(void **)(a1 + 32);
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v13 = CFSTR("dmap.utcoffset");
          }
        }
        else
        {
          switch((_DWORD)a2)
          {
            case 0x7070726F:
              v11 = *(void **)(a1 + 32);
              v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v13 = CFSTR("dpap.protocolversion");
              break;
            case 0x6D737570:
              v17 = *(void **)(a1 + 32);
              v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v19 = CFSTR("dmap.supportsupdate");
              goto LABEL_98;
            case 0x6D737474:
              v11 = *(void **)(a1 + 32);
              v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v13 = CFSTR("dmap.status");
              break;
            default:
              goto LABEL_101;
          }
        }
      }
      else
      {
        if ((int)a2 <= 1836282232)
        {
          if ((_DWORD)a2 == 1836281196)
          {
            objc_msgSend(*(id *)(a1 + 32), "parseMACAddressListing:length:", a3, v4);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", v23, CFSTR("dmap.macaddresslisting"));

            return;
          }
          if ((_DWORD)a2 != 1836281961)
            goto LABEL_101;
          v17 = *(void **)(a1 + 32);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v19 = CFSTR("dmap.supportspersistentids");
          goto LABEL_98;
        }
        if ((_DWORD)a2 == 1836282233)
        {
          v17 = *(void **)(a1 + 32);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v19 = CFSTR("dmap.supportsquery");
          goto LABEL_98;
        }
        if ((_DWORD)a2 == 1836282483)
        {
          v17 = *(void **)(a1 + 32);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v19 = CFSTR("dmap.supportsresolve");
          goto LABEL_98;
        }
        if ((_DWORD)a2 != 1836282979)
          goto LABEL_101;
        v11 = *(void **)(a1 + 32);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = CFSTR("dmap.utctime");
      }
      goto LABEL_100;
    }
    if ((int)a2 > 1836278882)
    {
      if ((int)a2 > 1836279159)
      {
        switch((_DWORD)a2)
        {
          case 0x6D736578:
            v17 = *(void **)(a1 + 32);
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = CFSTR("dmap.supportsextensions");
            break;
          case 0x6D736978:
            v17 = *(void **)(a1 + 32);
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = CFSTR("dmap.supportsindex");
            break;
          case 0x6D736C72:
            v17 = *(void **)(a1 + 32);
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = CFSTR("dmap.loginrequired");
            break;
          default:
            goto LABEL_101;
        }
        goto LABEL_98;
      }
      if ((_DWORD)a2 != 1836278883)
      {
        if ((_DWORD)a2 == 1836279140)
        {
          v20 = *(void **)(a1 + 32);
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v22 = CFSTR("dmap.supportsedit");
          goto LABEL_93;
        }
LABEL_101:
        objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
        return;
      }
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = CFSTR("dmap.databasescount");
      goto LABEL_100;
    }
    if ((int)a2 <= 1836278132)
    {
      if ((_DWORD)a2 == 1836278124)
      {
        v17 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = CFSTR("dmap.supportsautologout");
      }
      else
      {
        if ((_DWORD)a2 != 1836278131)
          goto LABEL_101;
        v17 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = CFSTR("dmap.authenticationschemes");
      }
      goto LABEL_98;
    }
    if ((_DWORD)a2 == 1836278133)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = CFSTR("dmap.authenticationmethod");
      goto LABEL_98;
    }
    if ((_DWORD)a2 == 1836278386)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = CFSTR("dmap.supportsbrowse");
      goto LABEL_98;
    }
    if ((_DWORD)a2 != 1836278645)
      goto LABEL_101;
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = CFSTR("dmap.supportscombinedupdate");
LABEL_64:
    objc_msgSend(v5, "setUInt64:size:inDict:forKey:", a3, v4, *(_QWORD *)(v6 + 40), v7);
    return;
  }
  if ((int)a2 > 1634956132)
  {
    if ((int)a2 > 1685484664)
    {
      if ((int)a2 <= 1835885675)
      {
        if ((_DWORD)a2 == 1685484665)
        {
          v17 = *(void **)(a1 + 32);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v19 = CFSTR("arcp.devicetype");
          goto LABEL_98;
        }
        if ((_DWORD)a2 != 1835626093)
          goto LABEL_101;
        v8 = *(void **)(a1 + 32);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = CFSTR("dmap.itemname");
      }
      else
      {
        switch((_DWORD)a2)
        {
          case 0x6D6D646C:
            v8 = *(void **)(a1 + 32);
            v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v10 = CFSTR("arcp.model");
            break;
          case 0x6D6D6E66:
            v8 = *(void **)(a1 + 32);
            v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v10 = CFSTR("arcp.manufacturer");
            break;
          case 0x6D70726F:
            v11 = *(void **)(a1 + 32);
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v13 = CFSTR("dmap.protocolversion");
            goto LABEL_100;
          default:
            goto LABEL_101;
        }
      }
    }
    else
    {
      if ((int)a2 <= 1635018083)
      {
        if ((_DWORD)a2 == 1634956133)
        {
          v20 = *(void **)(a1 + 32);
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v22 = CFSTR("daap.supportssetproperty");
          goto LABEL_93;
        }
        if ((_DWORD)a2 != 1635013462)
          goto LABEL_101;
        v11 = *(void **)(a1 + 32);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = CFSTR("Client-ATV-Sharing-Version");
        goto LABEL_100;
      }
      if ((_DWORD)a2 == 1635018084)
      {
        v14 = *(void **)(a1 + 32);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = CFSTR("daap.supportsextradata");
        goto LABEL_78;
      }
      if ((_DWORD)a2 == 1667585615)
      {
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v22 = CFSTR("com.apple.itunes.jukebox-voting-enabled");
        goto LABEL_93;
      }
      if ((_DWORD)a2 != 1667585869)
        goto LABEL_101;
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = CFSTR("com.apple.itunes.jukebox-welcome-message");
    }
    objc_msgSend(v8, "setString:size:inDict:forKey:", a3, v4, *(_QWORD *)(v9 + 40), v10);
    return;
  }
  if ((int)a2 > 1634030421)
  {
    if ((int)a2 > 1634030705)
    {
      if ((_DWORD)a2 == 1634030706)
        return;
      if ((_DWORD)a2 != 1634759279)
      {
        if ((_DWORD)a2 != 1634953074)
          goto LABEL_101;
        v14 = *(void **)(a1 + 32);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = CFSTR("daap.supportsgroups");
LABEL_78:
        objc_msgSend(v14, "setUInt16:size:inDict:forKey:", a3, v4, *(_QWORD *)(v15 + 40), v16);
        return;
      }
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = CFSTR("daap.protocolversion");
LABEL_100:
      objc_msgSend(v11, "setUInt32:size:inDict:forKey:", a3, v4, *(_QWORD *)(v12 + 40), v13);
      return;
    }
    if ((_DWORD)a2 == 1634030422)
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = CFSTR("com.apple.itunes.music-sharing-version");
      goto LABEL_100;
    }
    if ((_DWORD)a2 != 1634030424)
      goto LABEL_101;
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = CFSTR("com.apple.itunes.supportedextensions");
    goto LABEL_64;
  }
  if ((int)a2 <= 1634028880)
  {
    if ((_DWORD)a2 != 1634027088)
    {
      if ((_DWORD)a2 == 1634027090)
      {
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v22 = CFSTR("com.apple.itunes.supports-fprap");
LABEL_93:
        objc_msgSend(v20, "setBool:size:inDict:forKey:", a3, v4, *(_QWORD *)(v21 + 40), v22);
        return;
      }
      goto LABEL_101;
    }
    v17 = *(void **)(a1 + 32);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = CFSTR("com.apple.itunes.req-fplay");
LABEL_98:
    objc_msgSend(v17, "setUInt8:size:inDict:forKey:", a3, v4, *(_QWORD *)(v18 + 40), v19);
    return;
  }
  if ((_DWORD)a2 == 1634028881)
  {
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = CFSTR("com.apple.itunes.playlist-contains-media-type");
    goto LABEL_93;
  }
  if ((_DWORD)a2 != 1634030412 && (_DWORD)a2 != 1634030418)
    goto LABEL_101;
}

- (id)parseContentCollectionDict:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__TVRMSDAAPParser_parseContentCollectionDict_length___block_invoke;
  v9[3] = &unk_24DCD72F0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __53__TVRMSDAAPParser_parseContentCollectionDict_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = HIDWORD(a2);
  switch((_DWORD)a2)
  {
    case 0x6D636E61:
      objc_msgSend(*(id *)(a1 + 32), "setString:size:inDict:forKey:", a3, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("name"));
      break;
    case 0x6D637479:
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(**(unsigned __int16 **)(a1 + 48)) >> 16, v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("type"));

      break;
    case 0x6D636E6D:
      objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", a3, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("number"));
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
      break;
  }
}

- (id)parseContentCodes:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__TVRMSDAAPParser_parseContentCodes_length___block_invoke;
  v9[3] = &unk_24DCD72C8;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __44__TVRMSDAAPParser_parseContentCodes_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3)
{
  unsigned int v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2 == 1835295596)
  {
    objc_msgSend(*(id *)(a1 + 32), "parseContentCollectionDict:length:", a3, HIDWORD(a2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:");

  }
  else if ((_DWORD)a2 == 1836282996)
  {
    v4 = *a3;
    if (*a3 != -939524096)
    {
      _TVRCRMSLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v8 = bswap32(v4);
        _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "DMAP returned status code %u", buf, 8u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)parseLogin:(const char *)a3 length:(unsigned int)a4
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__TVRMSDAAPParser_parseLogin_length___block_invoke;
  v6[3] = &unk_24DCD72A0;
  v6[4] = self;
  v6[5] = &v7;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, *(_QWORD *)&a4, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__TVRMSDAAPParser_parseLogin_length___block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2 == 1835821412)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*a3));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else if ((_DWORD)a2 == 1836282996)
  {
    v4 = *a3;
    if (*a3 != -939524096)
    {
      _TVRCRMSLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = bswap32(v4);
        _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "DMAP returned status code %u", (uint8_t *)v9, 8u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)parseQueueSectionItems:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__TVRMSDAAPParser_parseQueueSectionItems_length___block_invoke;
  v9[3] = &unk_24DCD72C8;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__TVRMSDAAPParser_parseQueueSectionItems_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v4;

  if ((_DWORD)a2 == 1835821428)
  {
    objc_msgSend(*(id *)(a1 + 32), "parseListingItem:length:", a3, HIDWORD(a2));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)parseListingItem:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = *(_QWORD *)&a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)objc_opt_new();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__TVRMSDAAPParser_parseListingItem_length___block_invoke;
  v9[3] = &unk_24DCD7318;
  v9[4] = self;
  v9[5] = &v12;
  v9[6] = v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v13[5];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__TVRMSDAAPParser_parseListingItem_length___block_invoke(uint64_t a1, unint64_t a2, unsigned __int8 *a3, double a4)
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;

  v6 = HIDWORD(a2);
  if ((int)a2 > 1667329909)
  {
    if ((int)a2 > 1668116076)
    {
      if ((int)a2 <= 1835492466)
      {
        if ((int)a2 <= 1668444011)
        {
          if ((int)a2 <= 1668117359)
          {
            if ((int)a2 > 1668117099)
            {
              switch((_DWORD)a2)
              {
                case 0x636D726C:
                  v13 = *(void **)(a1 + 32);
                  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                  v15 = CFSTR("supportsRemoteLibrarySelection");
                  break;
                case 0x636D7362:
                  v13 = *(void **)(a1 + 32);
                  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                  v15 = CFSTR("supportsBonjourSourcesUpdates");
                  break;
                case 0x636D7363:
                  v13 = *(void **)(a1 + 32);
                  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                  v15 = CFSTR("supportsControlPromptRequests");
                  break;
                default:
                  goto LABEL_347;
              }
              goto LABEL_345;
            }
            if ((_DWORD)a2 == 1668116077)
            {
              v10 = *(void **)(a1 + 32);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v12 = CFSTR("name");
              goto LABEL_352;
            }
            if ((_DWORD)a2 != 1668116594)
              goto LABEL_347;
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("dmcp.protocolversion");
            goto LABEL_358;
          }
          if ((int)a2 <= 1668118123)
          {
            if ((_DWORD)a2 == 1668117360)
            {
              v13 = *(void **)(a1 + 32);
              v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v15 = CFSTR("supportsPlayStatusUpdate");
            }
            else
            {
              if ((_DWORD)a2 != 1668117366)
                goto LABEL_347;
              v13 = *(void **)(a1 + 32);
              v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v15 = CFSTR("dacp.supportsVolume");
            }
            goto LABEL_345;
          }
          switch((_DWORD)a2)
          {
            case 0x636D766C:
              objc_msgSend(*(id *)(a1 + 32), "parseListingCollection:length:capacity:sectionHeaders:", a3, v6, 0, 0);
              v35 = objc_claimAutoreleasedReturnValue();
              v53 = (id)v35;
              v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              v34 = CFSTR("context");
              goto LABEL_328;
            case 0x636D766F:
              *(float *)&a4 = (float)bswap32(*(_DWORD *)a3) / 100.0;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a4);
              v23 = objc_claimAutoreleasedReturnValue();
              v53 = (id)v23;
              v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              v25 = CFSTR("dacp.volume");
              break;
            case 0x636D7674:
              if (v6 != 2)
                return;
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = bswap32(*(unsigned __int16 *)a3) >> 16;
              objc_msgSend((id)objc_opt_class(), "typeForDRCPValueType:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
              v23 = objc_claimAutoreleasedReturnValue();
              v53 = (id)v23;
              v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              v25 = CFSTR("type");
              break;
            default:
              goto LABEL_347;
          }
          goto LABEL_369;
        }
        if ((int)a2 > 1835299699)
        {
          if ((a2 - 1835364978) < 2)
          {
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("dmap.errorresponse");
            goto LABEL_358;
          }
          if ((_DWORD)a2 != 1835299700)
          {
            if ((_DWORD)a2 != 1835361395)
              goto LABEL_347;
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("dmap.editcommandssupported");
            goto LABEL_358;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *a3);
          v23 = objc_claimAutoreleasedReturnValue();
          v53 = (id)v23;
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v25 = CFSTR("dmap.downloadstatus");
          goto LABEL_369;
        }
        if ((int)a2 <= 1835234402)
        {
          if ((_DWORD)a2 == 1668444012)
          {
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("readOnly");
            goto LABEL_345;
          }
          if ((_DWORD)a2 == 1668702572)
          {
            switch(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              case 1:
                v13 = *(void **)(a1 + 32);
                v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v15 = CFSTR("value");
                goto LABEL_345;
              case 2:
                objc_msgSend(*(id *)(a1 + 32), "setUInt16:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("value"));
                break;
              case 3:
                v19 = *(void **)(a1 + 32);
                v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v21 = CFSTR("value");
                goto LABEL_358;
              case 4:
                objc_msgSend(*(id *)(a1 + 32), "setFloat32:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("value"));
                break;
              case 5:
              case 6:
              case 7:
                v10 = *(void **)(a1 + 32);
                v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v12 = CFSTR("value");
                goto LABEL_352;
              default:
                return;
            }
            return;
          }
          goto LABEL_347;
        }
        if ((_DWORD)a2 == 1835234403)
        {
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("dmap.container");
          goto LABEL_358;
        }
        if ((_DWORD)a2 == 1835234409)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*(_DWORD *)a3));
          v23 = objc_claimAutoreleasedReturnValue();
          v53 = (id)v23;
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v25 = CFSTR("dmap.containeritemid");
          goto LABEL_369;
        }
        if ((_DWORD)a2 != 1835295339)
          goto LABEL_347;
        if (HIDWORD(a2) != 8)
        {
          if (HIDWORD(a2) != 4)
            return;
          v19 = *(void **)(a1 + 32);
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("dmap.databasekind");
          goto LABEL_349;
        }
        v16 = *(void **)(a1 + 32);
        v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = CFSTR("dmap.databasekind");
        goto LABEL_374;
      }
      if ((int)a2 > 1836278130)
      {
        if ((int)a2 <= 1836279917)
        {
          if ((int)a2 <= 1836279906)
          {
            if ((_DWORD)a2 == 1836278131)
            {
              v7 = *(void **)(a1 + 32);
              v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v9 = CFSTR("dmap.authenticationschemes");
              goto LABEL_361;
            }
            if ((_DWORD)a2 == 1836278133)
            {
              v7 = *(void **)(a1 + 32);
              v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v9 = CFSTR("dmap.authenticationmethod");
              goto LABEL_361;
            }
            goto LABEL_347;
          }
          if ((_DWORD)a2 == 1836279907)
          {
            v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(*(id *)(a1 + 32), "parseUnicodeCharacter:length:", a3, v6);
            v35 = objc_claimAutoreleasedReturnValue();
            v53 = (id)v35;
            v34 = CFSTR("headerItemCharacter");
            v33 = v41;
            goto LABEL_328;
          }
          if ((_DWORD)a2 != 1836279913)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("headerItemIndex");
LABEL_358:
          v50 = *(_QWORD *)(v20 + 40);
          v51 = HIDWORD(a2);
          goto LABEL_359;
        }
        if ((int)a2 <= 1836282995)
        {
          if ((_DWORD)a2 != 1836279918)
          {
            if ((_DWORD)a2 != 1836281185)
              goto LABEL_347;
            v16 = *(void **)(a1 + 32);
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v18 = CFSTR("dacp.macAddress");
LABEL_320:
            v46 = *(_QWORD *)(v17 + 40);
            v47 = HIDWORD(a2);
LABEL_321:
            objc_msgSend(v16, "setUInt64:size:inDict:forKey:", a3, v47, v46, v18);
            return;
          }
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("headerItemCount");
          goto LABEL_358;
        }
        if ((_DWORD)a2 == 1836282996)
        {
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("dmap.status");
          goto LABEL_358;
        }
        if ((_DWORD)a2 == 1885434736)
        {
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("aspectRatio");
          goto LABEL_352;
        }
        if ((_DWORD)a2 != 1885758580)
          goto LABEL_347;
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, v6);
        v23 = objc_claimAutoreleasedReturnValue();
        v53 = (id)v23;
        v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v25 = CFSTR("fileData");
        goto LABEL_369;
      }
      if ((int)a2 > 1835626092)
      {
        if ((int)a2 <= 1836082030)
        {
          if ((_DWORD)a2 != 1835626093)
          {
            if ((_DWORD)a2 == 1835821428)
              return;
            goto LABEL_347;
          }
LABEL_243:
          if (!HIDWORD(a2))
            return;
          objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, HIDWORD(a2));
          v23 = objc_claimAutoreleasedReturnValue();
          v53 = (id)v23;
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v25 = CFSTR("dmap.itemname");
          goto LABEL_369;
        }
        if ((_DWORD)a2 != 1836082031)
        {
          if ((_DWORD)a2 == 1836082546)
          {
            v16 = *(void **)(a1 + 32);
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v18 = CFSTR("dmap.persistentid");
          }
          else
          {
            if ((_DWORD)a2 != 1836216434)
              goto LABEL_347;
            v16 = *(void **)(a1 + 32);
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v18 = CFSTR("dmap.remotepersistentid");
          }
          goto LABEL_320;
        }
        if (HIDWORD(a2) != 8)
        {
          if (HIDWORD(a2) != 4)
            return;
          v19 = *(void **)(a1 + 32);
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("dmap.parentcontainerid");
          goto LABEL_349;
        }
        v16 = *(void **)(a1 + 32);
        v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = CFSTR("dmap.parentcontainerid");
LABEL_374:
        v46 = *(_QWORD *)(v52 + 40);
        v47 = 8;
        goto LABEL_321;
      }
      if ((int)a2 > 1835625315)
      {
        if ((_DWORD)a2 == 1835625316)
          return;
        if ((_DWORD)a2 == 1835625827)
        {
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("dmap.itemcount");
          goto LABEL_358;
        }
        goto LABEL_347;
      }
      if ((_DWORD)a2 == 1835492467)
      {
        v7 = *(void **)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = CFSTR("dmap.groupdownloadstatus");
        goto LABEL_361;
      }
      if ((_DWORD)a2 != 1835624804)
        goto LABEL_347;
      if (HIDWORD(a2) != 8)
      {
        if (HIDWORD(a2) != 4)
          return;
        v29 = (void *)MEMORY[0x24BDD16E0];
        v30 = *(_DWORD *)a3;
LABEL_267:
        objc_msgSend(v29, "numberWithUnsignedInt:", bswap32(v30));
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_368;
      }
      v43 = (void *)MEMORY[0x24BDD16E0];
      v44 = *(_QWORD *)a3;
    }
    else
    {
      if ((int)a2 > 1667584352)
      {
        if ((int)a2 <= 1667584838)
        {
          switch((int)a2)
          {
            case 1667584353:
              v10 = *(void **)(a1 + 32);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v12 = CFSTR("album");
              goto LABEL_352;
            case 1667584359:
              goto LABEL_103;
            case 1667584360:
              v10 = *(void **)(a1 + 32);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v12 = CFSTR("com.apple.itunes.playqueue-section-headervalue");
              goto LABEL_352;
            case 1667584361:
              v19 = *(void **)(a1 + 32);
              v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v21 = CFSTR("com.apple.itunes.playqueue-section-startindex");
              goto LABEL_358;
            case 1667584363:
              v19 = *(void **)(a1 + 32);
              v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v21 = CFSTR("com.apple.itunes.playqueue-section-kind");
              goto LABEL_358;
            case 1667584364:
              v10 = *(void **)(a1 + 32);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v12 = CFSTR("com.apple.itunes.playqueue-section-headerlabel");
              goto LABEL_352;
            case 1667584365:
              v19 = *(void **)(a1 + 32);
              v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v21 = CFSTR("com.apple.itunes.playqueue-section-numitems");
              goto LABEL_358;
            case 1667584366:
              goto LABEL_243;
            case 1667584370:
              goto LABEL_245;
            case 1667584371:
              objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", a3, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.databaseid"));
              objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", a3 + 4, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.playlistid"));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v39, CFSTR("dmap.containeritemid"));

              v29 = (void *)MEMORY[0x24BDD16E0];
              v30 = *((_DWORD *)a3 + 3);
              goto LABEL_267;
            default:
              goto LABEL_347;
          }
        }
        if ((int)a2 <= 1668113011)
        {
          if ((int)a2 > 1668112995)
          {
            switch((_DWORD)a2)
            {
              case 0x636D6264:
                v10 = *(void **)(a1 + 32);
                v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v12 = CFSTR("libraryDisplayName");
                break;
              case 0x636D626D:
                v10 = *(void **)(a1 + 32);
                v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v12 = CFSTR("libraryServiceDomain");
                break;
              case 0x636D6273:
                v10 = *(void **)(a1 + 32);
                v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v12 = CFSTR("libraryServiceName");
                break;
              default:
                goto LABEL_347;
            }
            goto LABEL_352;
          }
          if ((_DWORD)a2 == 1667584839)
          {
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("com.apple.itunes.supports-genius-control");
            goto LABEL_345;
          }
          if ((_DWORD)a2 != 1667584856)
            goto LABEL_347;
          v16 = *(void **)(a1 + 32);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v18 = CFSTR("kExtDACPSupportediTunesExtensionsCode");
          goto LABEL_320;
        }
        if ((int)a2 <= 1668115818)
        {
          if ((_DWORD)a2 == 1668113012)
          {
            v10 = *(void **)(a1 + 32);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = CFSTR("libraryServiceType");
          }
          else
          {
            if ((_DWORD)a2 != 1668114788)
              goto LABEL_347;
            v10 = *(void **)(a1 + 32);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = CFSTR("identifier");
          }
          goto LABEL_352;
        }
        if ((_DWORD)a2 != 1668115819)
        {
          if ((_DWORD)a2 == 1668115822)
          {
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("minimum");
          }
          else
          {
            if ((_DWORD)a2 != 1668115832)
              goto LABEL_347;
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("maximum");
          }
          goto LABEL_358;
        }
LABEL_167:
        if (HIDWORD(a2) != 4)
        {
          if (HIDWORD(a2) == 1)
          {
            v7 = *(void **)(a1 + 32);
            v9 = CFSTR("mediaKind");
            v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            v32 = 1;
LABEL_362:
            objc_msgSend(v7, "setUInt8:size:inDict:forKey:", a3, v32, v31, v9);
            return;
          }
          return;
        }
        v19 = *(void **)(a1 + 32);
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = CFSTR("mediaKind");
        goto LABEL_349;
      }
      if ((int)a2 <= 1667582530)
      {
        if ((int)a2 > 1667330932)
        {
          if ((int)a2 > 1667581009)
          {
            if ((_DWORD)a2 == 1667581010)
            {
              v13 = *(void **)(a1 + 32);
              v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v15 = CFSTR("supportsDirectionalControl");
              goto LABEL_345;
            }
            if ((_DWORD)a2 != 1667581779)
              goto LABEL_347;
            goto LABEL_239;
          }
          if ((_DWORD)a2 == 1667330933)
          {
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("supportsSetUserRating");
          }
          else
          {
            if ((_DWORD)a2 != 1667331684)
              goto LABEL_347;
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("dacp.selectedForVideo");
          }
          goto LABEL_345;
        }
        if ((int)a2 <= 1667330912)
        {
          if ((_DWORD)a2 == 1667329910)
          {
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("supportsMultiSpeakerVolume");
            goto LABEL_345;
          }
          if ((_DWORD)a2 != 1667330162)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("dacp.protocolversion");
          goto LABEL_358;
        }
        if ((_DWORD)a2 != 1667330913)
        {
          if ((_DWORD)a2 != 1667330931)
            goto LABEL_347;
          v13 = *(void **)(a1 + 32);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = CFSTR("dacp.supportsSpeakerSelection");
          goto LABEL_345;
        }
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = CFSTR("nowPlayingSpeakersEnabled");
        goto LABEL_358;
      }
      if ((int)a2 <= 1667583312)
      {
        if ((int)a2 > 1667582546)
        {
          if ((_DWORD)a2 == 1667582547)
          {
            objc_msgSend(*(id *)(a1 + 32), "setSInt16:size:inDict:forKey:", a3, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("com.apple.itunes.jukebox-score"));
            return;
          }
          if ((_DWORD)a2 != 1667582550)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.jukebox-vote");
        }
        else
        {
          if ((_DWORD)a2 == 1667582531)
          {
            objc_msgSend(*(id *)(a1 + 32), "setSInt8:size:inDict:forKey:", a3, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("com.apple.itunes.jukebox-client-vote"));
            return;
          }
          if ((_DWORD)a2 != 1667582537)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("jukeboxCurrent");
        }
        goto LABEL_358;
      }
      if ((int)a2 <= 1667584331)
      {
        if ((_DWORD)a2 == 1667583313)
        {
          v7 = *(void **)(a1 + 32);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v9 = CFSTR("com.apple.itunes.manually-queued");
          goto LABEL_361;
        }
        if ((_DWORD)a2 != 1667584329)
          goto LABEL_347;
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = CFSTR("com.apple.itunes.queue-index");
        goto LABEL_358;
      }
      if ((_DWORD)a2 != 1667584332)
      {
        if ((_DWORD)a2 != 1667584336)
        {
          if ((_DWORD)a2 != 1667584343)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.playqueue-warning-threshold");
          goto LABEL_358;
        }
        if (!HIDWORD(a2))
          return;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "valueForKey:", CFSTR("com.apple.itunes.playqueue-item-preform-meta"));
        v53 = (id)objc_claimAutoreleasedReturnValue();
        if (!v53)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v53 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:");
        }
        objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, v6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v45);

        goto LABEL_370;
      }
      objc_msgSend(*(id *)(a1 + 32), "setUInt64:size:inDict:forKey:", a3, 8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.databaseid"));
      objc_msgSend(*(id *)(a1 + 32), "setUInt64:size:inDict:forKey:", a3 + 8, 8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.playlistid"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", bswap64(*((_QWORD *)a3 + 2)));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v42, CFSTR("dmap.containeritemid"));

      v43 = (void *)MEMORY[0x24BDD16E0];
      v44 = *((_QWORD *)a3 + 3);
    }
    objc_msgSend(v43, "numberWithUnsignedLongLong:", bswap64(v44));
    v40 = objc_claimAutoreleasedReturnValue();
LABEL_368:
    v23 = v40;
    v53 = (id)v40;
    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v25 = CFSTR("dmap.itemid");
    goto LABEL_369;
  }
  if ((int)a2 > 1634168160)
  {
    if ((int)a2 <= 1634952812)
    {
      if ((int)a2 > 1634951790)
      {
        if ((int)a2 > 1634952288)
        {
          switch((int)a2)
          {
            case 1634952299:
              return;
            case 1634952300:
            case 1634952301:
            case 1634952302:
            case 1634952303:
            case 1634952305:
            case 1634952307:
              goto LABEL_347;
            case 1634952304:
              v26 = *(void **)(a1 + 32);
              v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v28 = CFSTR("daap.songdatepurchased");
              goto LABEL_354;
            case 1634952306:
              v26 = *(void **)(a1 + 32);
              v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v28 = CFSTR("daap.songdatereleased");
              goto LABEL_354;
            case 1634952308:
              v10 = *(void **)(a1 + 32);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v12 = CFSTR("daap.songdescription");
              goto LABEL_352;
            default:
              if ((_DWORD)a2 == 1634952289)
              {
                v26 = *(void **)(a1 + 32);
                v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v28 = CFSTR("daap.songdateadded");
LABEL_354:
                objc_msgSend(v26, "setDate:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(v27 + 40), v28);
                return;
              }
              if ((_DWORD)a2 != 1634952290)
                goto LABEL_347;
              v13 = *(void **)(a1 + 32);
              v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v15 = CFSTR("disabled");
              break;
          }
          goto LABEL_345;
        }
        if ((int)a2 <= 1634952049)
        {
          if ((_DWORD)a2 != 1634951791)
          {
            if ((_DWORD)a2 != 1634952046)
              goto LABEL_347;
            v10 = *(void **)(a1 + 32);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = CFSTR("daap.songcontentdescription");
            goto LABEL_352;
          }
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("daap.songbookmark");
          goto LABEL_358;
        }
        if ((_DWORD)a2 == 1634952050)
        {
          v7 = *(void **)(a1 + 32);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v9 = CFSTR("daap.songcontentrating");
          goto LABEL_361;
        }
        if ((_DWORD)a2 == 1634952052)
        {
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("daap.songcategory");
          goto LABEL_352;
        }
        goto LABEL_347;
      }
      if ((int)a2 <= 1634951520)
      {
        if ((int)a2 <= 1634169455)
        {
          if ((_DWORD)a2 == 1634168161)
          {
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("daap.groupmatchedqueryalbumcount");
          }
          else
          {
            if ((_DWORD)a2 != 1634168169)
              goto LABEL_347;
            v19 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v21 = CFSTR("daap.groupmatchedqueryitemcount");
          }
          goto LABEL_358;
        }
        switch((_DWORD)a2)
        {
          case 0x61677270:
            v10 = *(void **)(a1 + 32);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = CFSTR("daap.songgrouping");
            goto LABEL_352;
          case 0x6170726D:
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("daap.playlistrepeatmode");
            goto LABEL_361;
          case 0x6170736D:
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("daap.playlistshufflemode");
            goto LABEL_361;
        }
        goto LABEL_347;
      }
      if ((int)a2 <= 1634951531)
      {
        if ((_DWORD)a2 == 1634951521)
        {
LABEL_245:
          if (!HIDWORD(a2))
            return;
          objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, HIDWORD(a2));
          v23 = objc_claimAutoreleasedReturnValue();
          v53 = (id)v23;
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v25 = CFSTR("daap.songalbumartist");
        }
        else
        {
          if ((_DWORD)a2 != 1634951529)
            goto LABEL_347;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", bswap64(*(_QWORD *)a3));
          v23 = objc_claimAutoreleasedReturnValue();
          v53 = (id)v23;
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v25 = CFSTR("daap.songalbumid");
        }
      }
      else
      {
        switch((_DWORD)a2)
        {
          case 0x6173616C:
            if (!HIDWORD(a2))
              return;
            objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, HIDWORD(a2));
            v23 = objc_claimAutoreleasedReturnValue();
            v53 = (id)v23;
            v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            v25 = CFSTR("daap.songalbum");
            break;
          case 0x61736172:
            if (!HIDWORD(a2))
              return;
            objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, HIDWORD(a2));
            v23 = objc_claimAutoreleasedReturnValue();
            v53 = (id)v23;
            v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            v25 = CFSTR("daap.songartist");
            break;
          case 0x6173626B:
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("daap.bookmarkable");
            goto LABEL_361;
          default:
            goto LABEL_347;
        }
      }
LABEL_369:
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);
      goto LABEL_370;
    }
    if ((int)a2 > 1634956141)
    {
      if ((int)a2 > 1634956657)
      {
        if ((int)a2 <= 1667328352)
        {
          if ((_DWORD)a2 == 1634956658)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("daap.songuserrating");
            goto LABEL_361;
          }
          if ((_DWORD)a2 == 1667328112)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("hasPassword");
            goto LABEL_361;
          }
          goto LABEL_347;
        }
        switch((_DWORD)a2)
        {
          case 0x63616961:
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("dacp.selectedForAudio");
            break;
          case 0x63616970:
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("isPlaying");
            break;
          case 0x63616976:
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("dacp.supportsVideo");
            break;
          default:
            goto LABEL_347;
        }
        goto LABEL_345;
      }
      if ((int)a2 <= 1634956396)
      {
        if ((_DWORD)a2 == 1634956142)
        {
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("daap.sortname");
        }
        else
        {
          if ((_DWORD)a2 != 1634956149)
            goto LABEL_347;
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("daap.sortalbum");
        }
        goto LABEL_352;
      }
      if ((_DWORD)a2 != 1634956397)
      {
        if ((_DWORD)a2 != 1634956652)
          goto LABEL_347;
        v10 = *(void **)(a1 + 32);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = CFSTR("daap.songdataurl");
        goto LABEL_352;
      }
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = CFSTR("daap.songtime");
      goto LABEL_358;
    }
    if ((int)a2 <= 1634955362)
    {
      if ((int)a2 <= 1634953327)
      {
        if ((_DWORD)a2 == 1634952813)
        {
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("daap.songformat");
        }
        else
        {
          if ((_DWORD)a2 != 1634953070)
            goto LABEL_347;
LABEL_103:
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("daap.songgenre");
        }
        goto LABEL_352;
      }
      if ((_DWORD)a2 == 1634953328)
      {
        v7 = *(void **)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = CFSTR("daap.songhasbeenplayed");
        goto LABEL_361;
      }
      if ((_DWORD)a2 == 1634954339)
      {
        v10 = *(void **)(a1 + 32);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = CFSTR("daap.songlongcontentdescription");
        goto LABEL_352;
      }
      goto LABEL_347;
    }
    if ((int)a2 <= 1634955880)
    {
      if ((_DWORD)a2 != 1634955363)
      {
        if ((_DWORD)a2 != 1634955381)
          goto LABEL_347;
        v10 = *(void **)(a1 + 32);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = CFSTR("daap.songpodcasturl");
        goto LABEL_352;
      }
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = CFSTR("daap.songuserplaycount");
      goto LABEL_358;
    }
    if ((_DWORD)a2 != 1634955881)
    {
      if ((_DWORD)a2 != 1634956129)
        goto LABEL_347;
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = CFSTR("daap.sortartist");
      goto LABEL_352;
    }
    if (HIDWORD(a2) != 8)
    {
      if (HIDWORD(a2) != 4)
        return;
      v19 = *(void **)(a1 + 32);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = CFSTR("daap.songartistid");
      goto LABEL_349;
    }
    v16 = *(void **)(a1 + 32);
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = CFSTR("daap.songartistid");
    goto LABEL_374;
  }
  if ((int)a2 > 1634028887)
  {
    if ((int)a2 <= 1634030191)
    {
      if ((int)a2 <= 1634029650)
      {
        if ((_DWORD)a2 != 1634028888)
        {
          if ((_DWORD)a2 != 1634028907)
          {
            if ((_DWORD)a2 == 1634029635)
            {
              v7 = *(void **)(a1 + 32);
              v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v9 = CFSTR("com.apple.itunes.is-podcast");
              goto LABEL_361;
            }
            goto LABEL_347;
          }
          goto LABEL_167;
        }
        objc_msgSend(*(id *)(a1 + 32), "parseXMLContent:length:", a3, v6);
        v53 = (id)objc_claimAutoreleasedReturnValue();
        if (!v53)
          goto LABEL_370;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_370;
        v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v34 = CFSTR("com.apple.itunes.movie-info-xml");
        v35 = (uint64_t)v53;
LABEL_328:
        objc_msgSend(v33, "setObject:forKey:", v35, v34);
        goto LABEL_370;
      }
      switch((int)a2)
      {
        case 1634030157:
          v16 = *(void **)(a1 + 32);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v18 = CFSTR("com.apple.itunes.remote-itunes-machine-id");
          goto LABEL_320;
        case 1634030158:
        case 1634030159:
        case 1634030161:
        case 1634030162:
        case 1634030164:
          goto LABEL_347;
        case 1634030160:
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.rental-pb-start");
          goto LABEL_358;
        case 1634030163:
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.rental-start");
          goto LABEL_358;
        case 1634030165:
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.rental-pb-duration");
          goto LABEL_358;
        default:
          if ((_DWORD)a2 == 1634029651)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("com.apple.itunes.special-playlist");
            goto LABEL_361;
          }
          if ((_DWORD)a2 != 1634030148)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.rental-duration");
          break;
      }
      goto LABEL_358;
    }
    if ((int)a2 <= 1634030420)
    {
      switch((int)a2)
      {
        case 1634030405:
          v16 = *(void **)(a1 + 32);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v18 = CFSTR("com.apple.itunes.store-pers-id");
          goto LABEL_320;
        case 1634030406:
        case 1634030408:
        case 1634030410:
        case 1634030411:
        case 1634030412:
        case 1634030413:
        case 1634030415:
          goto LABEL_347;
        case 1634030407:
          v13 = *(void **)(a1 + 32);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = CFSTR("com.apple.itunes.saved-genius");
          goto LABEL_345;
        case 1634030409:
          if (HIDWORD(a2) == 8)
          {
            v16 = *(void **)(a1 + 32);
            v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v18 = CFSTR("com.apple.itunes.itms-songid");
            goto LABEL_374;
          }
          if (HIDWORD(a2) != 4)
            return;
          v19 = *(void **)(a1 + 32);
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.itms-songid");
          break;
        case 1634030414:
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("com.apple.itunes.series-name");
          goto LABEL_352;
        case 1634030416:
          v13 = *(void **)(a1 + 32);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = CFSTR("smartPlaylist");
          goto LABEL_345;
        default:
          if ((_DWORD)a2 != 1634030192)
            goto LABEL_347;
          objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, v6);
          v36 = objc_claimAutoreleasedReturnValue();
          v53 = (id)v36;
          v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v38 = CFSTR("com.apple.itunes.item-redownload-param-2");
          goto LABEL_364;
      }
LABEL_349:
      v50 = *(_QWORD *)(v22 + 40);
      v51 = 4;
LABEL_359:
      objc_msgSend(v19, "setUInt32:size:inDict:forKey:", a3, v51, v50, v21);
      return;
    }
    switch((_DWORD)a2)
    {
      case 0x61655355:
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = CFSTR("com.apple.itunes.season-num");
        goto LABEL_358;
      case 0x61655472:
        return;
      case 0x61676163:
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = CFSTR("daap.groupalbumcount");
        goto LABEL_358;
    }
LABEL_347:
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
    return;
  }
  if ((int)a2 <= 1634026829)
  {
    if ((int)a2 <= 1634026322)
    {
      if ((int)a2 > 1634025800)
      {
        if ((_DWORD)a2 != 1634025801)
        {
          if ((_DWORD)a2 != 1634026322)
            goto LABEL_347;
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("com.apple.itunes.content-rating");
          goto LABEL_352;
        }
        v16 = *(void **)(a1 + 32);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = CFSTR("com.apple.itunes.adam-id");
      }
      else
      {
        if ((_DWORD)a2 == 1633841260)
        {
          v13 = *(void **)(a1 + 32);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = CFSTR("basePlaylist");
          goto LABEL_345;
        }
        if ((_DWORD)a2 != 1634025796)
          goto LABEL_347;
        v16 = *(void **)(a1 + 32);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = CFSTR("com.apple.itunes.adam-ids-array");
      }
      goto LABEL_320;
    }
    if ((int)a2 > 1634026336)
    {
      if ((_DWORD)a2 != 1634026337)
      {
        if ((_DWORD)a2 != 1634026340)
        {
          if ((_DWORD)a2 != 1634026355)
            goto LABEL_347;
          v19 = *(void **)(a1 + 32);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = CFSTR("com.apple.itunes.cloud-connect-status");
          goto LABEL_358;
        }
        v16 = *(void **)(a1 + 32);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = CFSTR("com.apple.itunes.cloud-id");
        goto LABEL_320;
      }
      objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, v6);
      v36 = objc_claimAutoreleasedReturnValue();
      v53 = (id)v36;
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v38 = CFSTR("com.apple.itunes.cloud-artwork-url");
      goto LABEL_364;
    }
    if ((_DWORD)a2 != 1634026323)
    {
      if ((_DWORD)a2 != 1634026325)
        goto LABEL_347;
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = CFSTR("com.apple.itunes.cloud-user-id");
      goto LABEL_320;
    }
    if (v6 != 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3, HIDWORD(a2));
      v36 = objc_claimAutoreleasedReturnValue();
      v53 = (id)v36;
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v38 = CFSTR("com.apple.itunes.artworkchecksum");
LABEL_364:
      objc_msgSend(v37, "setValue:forKey:", v36, v38);
      goto LABEL_370;
    }
    v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*(_DWORD *)a3));
    v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setValue:forKey:", v49, CFSTR("com.apple.itunes.artworkchecksum"));

LABEL_370:
    return;
  }
  if ((int)a2 > 1634027587)
  {
    if ((int)a2 > 1634027605)
    {
      if ((_DWORD)a2 == 1634027606)
      {
        if (*a3)
        {
          v7 = *(void **)(a1 + 32);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v9 = CFSTR("hasVideo");
          goto LABEL_361;
        }
        return;
      }
      if ((_DWORD)a2 != 1634027853)
      {
        if ((_DWORD)a2 == 1634028875)
        {
          v7 = *(void **)(a1 + 32);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v9 = CFSTR("mediaKind");
          goto LABEL_361;
        }
        goto LABEL_347;
      }
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = CFSTR("com.apple.itunes.itunes-machine-id");
      goto LABEL_320;
    }
    if ((_DWORD)a2 == 1634027588)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = CFSTR("com.apple.itunes.is-hd-video");
      goto LABEL_361;
    }
    if ((_DWORD)a2 != 1634027603)
      goto LABEL_347;
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = CFSTR("com.apple.itunes.is-homeshare");
LABEL_345:
    objc_msgSend(v13, "setBool:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(v14 + 40), v15);
    return;
  }
  if ((int)a2 <= 1634027089)
  {
    if ((_DWORD)a2 != 1634026830)
    {
      if ((_DWORD)a2 != 1634026835)
        goto LABEL_347;
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = CFSTR("com.apple.itunes.episode-sort");
      goto LABEL_358;
    }
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = CFSTR("com.apple.itunes.episode-num-str");
LABEL_352:
    objc_msgSend(v10, "setString:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(v11 + 40), v12);
    return;
  }
  if ((_DWORD)a2 == 1634027090)
  {
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = CFSTR("com.apple.itunes.supports-fprap");
    goto LABEL_345;
  }
  if ((_DWORD)a2 == 1634027379)
  {
LABEL_239:
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = CFSTR("com.apple.itunes.can-be-genius-seed");
    goto LABEL_345;
  }
  if ((_DWORD)a2 != 1634027587)
    goto LABEL_347;
  if (*a3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = CFSTR("com.apple.itunes.has-chapter-data");
LABEL_361:
    v31 = *(_QWORD *)(v8 + 40);
    v32 = HIDWORD(a2);
    goto LABEL_362;
  }
}

- (id)parseListingCollection:(const char *)a3 length:(unsigned int)a4 capacity:(int)a5 sectionHeaders:(id *)a6
{
  uint64_t v7;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = *(_QWORD *)&a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__TVRMSDAAPParser_parseListingCollection_length_capacity_sectionHeaders___block_invoke;
  v12[3] = &unk_24DCD7340;
  v12[4] = self;
  v12[5] = &v19;
  v12[6] = &v13;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v7, v12);
  if (a6)
    *a6 = objc_retainAutorelease((id)v14[5]);
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __73__TVRMSDAAPParser_parseListingCollection_length_capacity_sectionHeaders___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = HIDWORD(a2);
  if ((_DWORD)a2 == 1667584339)
  {
    objc_msgSend(*(id *)(a1 + 32), "parseQueueSectionItems:length:", a3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else if ((_DWORD)a2 != 1836282996)
  {
    if ((_DWORD)a2 == 1835821428)
    {
      objc_msgSend(*(id *)(a1 + 32), "parseListingItem:length:", a3, v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
    }
  }
}

- (id)parseBrowseResults:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__TVRMSDAAPParser_parseBrowseResults_length___block_invoke;
  v9[3] = &unk_24DCD72A0;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __45__TVRMSDAAPParser_parseBrowseResults_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  id v7;

  if ((_DWORD)a2 == 1835821428)
  {
    v5 = HIDWORD(a2);
    v7 = (id)objc_opt_new();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, v5, 4);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("dmap.listingitem"));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)parseListingHeader:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = *(_QWORD *)&a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__TVRMSDAAPParser_parseListingHeader_length___block_invoke;
  v9[3] = &unk_24DCD7340;
  v9[4] = self;
  v9[5] = &v12;
  v9[6] = v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v13[5];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__TVRMSDAAPParser_parseListingHeader_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3)
{
  id *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  unsigned __int16 v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = (id *)a1;
  v43 = *MEMORY[0x24BDAC8D0];
  v5 = HIDWORD(a2);
  if ((int)a2 <= 1668113009)
  {
    if ((int)a2 > 1633973615)
    {
      if ((int)a2 <= 1634759532)
      {
        if ((_DWORD)a2 == 1633973616)
        {
          if (HIDWORD(a2) == 4)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v35 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4[4], "setUInt32:size:inDict:forKey:", a3, 4);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "parseDACPPropertyResponse:length:", a3);
            v35 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = *(void **)(*((_QWORD *)v4[5] + 1) + 40);
          v14 = CFSTR("daap.updateinfo");
          v12 = (uint64_t)v35;
          goto LABEL_63;
        }
        if ((_DWORD)a2 != 1634759277)
          goto LABEL_60;
        v8 = *(void **)(a1 + 32);
        v9 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
        v10 = CFSTR("daap.playlistrepeatmode");
      }
      else
      {
        if ((_DWORD)a2 != 1634759533)
        {
          if ((_DWORD)a2 != 1667583569)
          {
            if ((_DWORD)a2 == 1667584373)
            {
              objc_msgSend(*(id *)(a1 + 32), "setBool:size:inDict:forKey:", a3, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("playQueueMode"));
              return;
            }
            goto LABEL_60;
          }
          v15 = *(void **)(a1 + 32);
          v16 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
          v17 = CFSTR("com.apple.itunes.num-manually-queued");
          goto LABEL_59;
        }
        v8 = *(void **)(a1 + 32);
        v9 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
        v10 = CFSTR("daap.playlistshufflemode");
      }
      goto LABEL_52;
    }
    if ((int)a2 > 1633837935)
    {
      if ((_DWORD)a2 == 1633837936)
        goto LABEL_34;
      v11 = 26478;
    }
    else
    {
      if ((_DWORD)a2 == 1633837420)
        goto LABEL_34;
      v11 = 24946;
    }
    if ((_DWORD)a2 != (v11 | 0x61620000))
      goto LABEL_60;
LABEL_34:
    objc_msgSend(*(id *)(a1 + 32), "parseBrowseResults:length:", a3, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*((_QWORD *)v4[5] + 1) + 40);
    goto LABEL_35;
  }
  if ((int)a2 > 1836282995)
  {
    if ((int)a2 <= 1836409963)
    {
      if ((_DWORD)a2 == 1836282996)
      {
        v15 = *(void **)(a1 + 32);
        v16 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
        v17 = CFSTR("statusCode");
      }
      else
      {
        if ((_DWORD)a2 != 1836344175)
          goto LABEL_60;
        v15 = *(void **)(a1 + 32);
        v16 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
        v17 = CFSTR("totalCount");
      }
      goto LABEL_59;
    }
    if ((_DWORD)a2 == 1836409964)
      return;
    if ((_DWORD)a2 == 1836413810)
    {
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
      v17 = CFSTR("revision");
      goto LABEL_59;
    }
    if ((_DWORD)a2 != 1836414073)
      goto LABEL_60;
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
    v10 = CFSTR("updateType");
LABEL_52:
    objc_msgSend(v8, "setUInt8:size:inDict:forKey:", a3, v5, v9, v10);
    return;
  }
  if ((int)a2 <= 1835819883)
  {
    if ((_DWORD)a2 != 1668113010)
    {
      if ((_DWORD)a2 != 1668117353)
        goto LABEL_60;
      objc_msgSend(*(id *)(a1 + 32), "parseDACPPropertyResponse:length:", a3, v5);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(*((_QWORD *)v4[5] + 1) + 40);
      v14 = CFSTR("playStatusUpdateInfo");
      v35 = (id)v12;
LABEL_63:
      objc_msgSend(v13, "setObject:forKey:", v12, v14);
      goto LABEL_64;
    }
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(*((_QWORD *)v4[5] + 1) + 40);
    v17 = CFSTR("dmcp.bonjoursourcesrevision");
LABEL_59:
    objc_msgSend(v15, "setUInt32:size:inDict:forKey:", a3, v5, v16, v17);
    return;
  }
  if ((_DWORD)a2 != 1835819884)
  {
    if ((_DWORD)a2 == 1836213103)
    {
      objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", a3, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("returnedCount"));
      *(_DWORD *)(*((_QWORD *)v4[6] + 1) + 24) = bswap32(*a3);
      return;
    }
    if ((_DWORD)a2 == 1836279916)
    {
      objc_msgSend(*(id *)(a1 + 32), "parseListingCollection:length:capacity:sectionHeaders:", a3, v5, 30, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*((_QWORD *)v4[5] + 1) + 40);
LABEL_35:
      v35 = (id)v6;
      objc_msgSend(v7, "setObject:forKeyedSubscript:");
LABEL_64:

      return;
    }
LABEL_60:
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
    return;
  }
  v18 = *(void **)(a1 + 32);
  v19 = *(unsigned int *)(*((_QWORD *)v4[6] + 1) + 24);
  v41 = 0;
  objc_msgSend(v18, "parseListingCollection:length:capacity:sectionHeaders:", a3, v5, v19, &v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v41;
  objc_msgSend(*(id *)(*((_QWORD *)v4[5] + 1) + 40), "setObject:forKeyedSubscript:", v20, CFSTR("items"));
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v24)
    {
      v25 = v24;
      v33 = v21;
      v34 = v20;
      v36 = v4;
      v26 = 0;
      v27 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v29, "valueForKey:", CFSTR("com.apple.itunes.playqueue-section-startindex"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "integerValue");

          if (v31 < 0)
          {
            v32 = v29;

            v26 = v32;
          }
          else if (v31)
          {
            objc_msgSend(v22, "addObject:", v29);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v25);

      v4 = v36;
      if (v26)
        objc_msgSend(*(id *)(*((_QWORD *)v36[5] + 1) + 40), "setObject:forKeyedSubscript:", v26, CFSTR("historySection"));
      v21 = v33;
      v20 = v34;
    }
    else
    {

      v26 = 0;
    }
    if (v22)
      objc_msgSend(*(id *)(*((_QWORD *)v4[5] + 1) + 40), "setObject:forKeyedSubscript:", v22, CFSTR("upNextSections"));

  }
}

- (id)parseControlPromptCollection:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__TVRMSDAAPParser_parseControlPromptCollection_length___block_invoke;
  v9[3] = &unk_24DCD72C8;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __55__TVRMSDAAPParser_parseControlPromptCollection_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  switch((_DWORD)a2)
  {
    case 0x636D6361:
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = CFSTR("attributes");
      return objc_msgSend(v3, "setString:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(v4 + 40), v5);
    case 0x636D6376:
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = CFSTR("value");
      return objc_msgSend(v3, "setString:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(v4 + 40), v5);
    case 0x636D6365:
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = CFSTR("name");
      return objc_msgSend(v3, "setString:size:inDict:forKey:", a3, HIDWORD(a2), *(_QWORD *)(v4 + 40), v5);
  }
  return objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
}

- (id)parseControlPromptResponse:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = *(_QWORD *)&a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__TVRMSDAAPParser_parseControlPromptResponse_length___block_invoke;
  v9[3] = &unk_24DCD7340;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  if (objc_msgSend((id)v11[5], "count"))
    objc_msgSend((id)v17[5], "setObject:forKeyedSubscript:", v11[5], CFSTR("items"));
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __53__TVRMSDAAPParser_parseControlPromptResponse_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3)
{
  unint64_t v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = HIDWORD(a2);
  switch((_DWORD)a2)
  {
    case 0x6D64636C:
      objc_msgSend(*(id *)(a1 + 32), "parseControlPromptCollection:length:", a3, v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:");

      break;
    case 0x6D696964:
      v7 = *(void **)(a1 + 32);
      if (v4 == 4)
        objc_msgSend(v7, "setUInt32:size:inDict:forKey:", a3);
      else
        objc_msgSend(v7, "setUInt64:size:inDict:forKey:", a3);
      break;
    case 0x6D737474:
      v5 = *a3;
      if (*a3 != -939524096)
      {
        _TVRCRMSLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v10 = bswap32(v5);
          _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "DMAP returned status code %u", buf, 8u);
        }

      }
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
      break;
  }
}

- (id)parseGetSpeakersResponse:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__TVRMSDAAPParser_parseGetSpeakersResponse_length___block_invoke;
  v9[3] = &unk_24DCD72C8;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __51__TVRMSDAAPParser_parseGetSpeakersResponse_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3)
{
  unsigned int v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2 == 1835295596)
  {
    objc_msgSend(*(id *)(a1 + 32), "parseListingItem:length:", a3, HIDWORD(a2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:");

  }
  else if ((_DWORD)a2 == 1836282996)
  {
    v4 = *a3;
    if (*a3 != -939524096)
    {
      _TVRCRMSLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v8 = bswap32(v4);
        _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "DMAP returned status code %u", buf, 8u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)parseDACPPropertyResponse:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__TVRMSDAAPParser_parseDACPPropertyResponse_length___block_invoke;
  v9[3] = &unk_24DCD72C8;
  v9[4] = self;
  v9[5] = &v10;
  -[TVRMSDAAPParser enumerateDAAPChunksInBytes:length:usingBlock:](self, "enumerateDAAPChunksInBytes:length:usingBlock:", a3, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__TVRMSDAAPParser_parseDACPPropertyResponse_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3, double a4)
{
  unsigned int *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;

  v4 = a3;
  v6 = HIDWORD(a2);
  if ((int)a2 <= 1667330914)
  {
    if ((int)a2 <= 1667327602)
    {
      if ((int)a2 > 1634036850)
      {
        if ((int)a2 > 1634956396)
        {
          if ((int)a2 <= 1667326322)
          {
            if ((_DWORD)a2 != 1634956397)
            {
              if ((_DWORD)a2 == 1667326322)
              {
                v7 = *(void **)(a1 + 32);
                v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v9 = CFSTR("availableRepeatStates");
LABEL_126:
                v16 = *(_QWORD *)(v8 + 40);
                goto LABEL_127;
              }
              goto LABEL_130;
            }
LABEL_15:
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("daap.songtime");
            goto LABEL_126;
          }
          if ((_DWORD)a2 == 1667326323)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("availableShuffleStates");
            goto LABEL_126;
          }
          if ((_DWORD)a2 == 1667327589)
          {
            v17 = *(void **)(a1 + 32);
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = CFSTR("fullscreenEnabled");
            goto LABEL_112;
          }
          goto LABEL_130;
        }
        if ((_DWORD)a2 != 1634036851)
        {
          if ((_DWORD)a2 != 1634951529)
          {
            if ((_DWORD)a2 != 1634955881)
              goto LABEL_130;
            if (HIDWORD(a2) != 8)
            {
              if (HIDWORD(a2) == 4)
              {
                v7 = *(void **)(a1 + 32);
                v9 = CFSTR("daap.songartistid");
                v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_127:
                objc_msgSend(v7, "setUInt32:size:inDict:forKey:", a3, v6, v16, v9);
                return;
              }
              return;
            }
            v26 = *(void **)(a1 + 32);
            v27 = CFSTR("daap.songartistid");
            v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_121:
            objc_msgSend(v26, "setUInt64:size:inDict:forKey:", a3, v6, v28, v27);
            return;
          }
          v26 = *(void **)(a1 + 32);
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v27 = CFSTR("daap.songalbumid");
LABEL_120:
          v28 = *(_QWORD *)(v29 + 40);
          goto LABEL_121;
        }
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("com.apple.itunes.liked-state");
LABEL_129:
        objc_msgSend(v13, "setUInt8:size:inDict:forKey:", a3, v6, *(_QWORD *)(v14 + 40), v15);
        return;
      }
      if ((int)a2 > 1634030408)
      {
        switch((_DWORD)a2)
        {
          case 0x61655349:
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("com.apple.itunes.itms-songid");
            goto LABEL_126;
          case 0x61656177:
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("com.apple.itunes.can-add-to-wishlist");
            break;
          case 0x61656C62:
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("com.apple.itunes.likeable");
            break;
          default:
            goto LABEL_130;
        }
        goto LABEL_129;
      }
      if ((_DWORD)a2 != 1634026323)
      {
        if ((_DWORD)a2 != 1634027379)
        {
          if ((_DWORD)a2 != 1634027587)
            goto LABEL_130;
          if (*(_BYTE *)a3)
          {
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = CFSTR("com.apple.itunes.has-chapter-data");
            goto LABEL_129;
          }
          return;
        }
LABEL_85:
        v17 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = CFSTR("com.apple.itunes.can-be-genius-seed");
        goto LABEL_112;
      }
      if (v6 == 4)
      {
        v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", bswap32(*a3));
        v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(v31, "stringValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setValue:forKey:", v25, CFSTR("com.apple.itunes.artworkchecksum"));

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v31, "longLongValue"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", v30, CFSTR("com.apple.itunes.artworkchecksum"));

      }
LABEL_132:

      return;
    }
    if ((int)a2 > 1667329643)
    {
      if ((int)a2 <= 1667330155)
      {
        switch((int)a2)
        {
          case 1667329644:
            v10 = *(void **)(a1 + 32);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = CFSTR("daap.songalbum");
            goto LABEL_124;
          case 1667329646:
            v10 = *(void **)(a1 + 32);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = CFSTR("dmap.itemname");
            goto LABEL_124;
          case 1667329648:
            objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", a3, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.databaseid"));
            objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", v4 + 1, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.playlistid"));
            objc_msgSend(*(id *)(a1 + 32), "setUInt32:size:inDict:forKey:", v4 + 2, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.containeritemid"));
            a3 = v4 + 3;
            v7 = *(void **)(a1 + 32);
            v9 = CFSTR("dmap.itemid");
            v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            v6 = 4;
            goto LABEL_127;
          case 1667329652:
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("daap.songtimeremaining");
            goto LABEL_126;
          default:
            goto LABEL_130;
        }
      }
      if ((int)a2 > 1667330671)
      {
        if ((_DWORD)a2 != 1667330672)
        {
          if ((_DWORD)a2 == 1667330913)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("nowPlayingSpeakersEnabled");
            goto LABEL_126;
          }
          goto LABEL_130;
        }
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("repeat");
      }
      else
      {
        if ((_DWORD)a2 == 1667330156)
        {
          objc_msgSend(*(id *)(a1 + 32), "setUInt64:size:inDict:forKey:", a3, 8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.databaseid"));
          objc_msgSend(*(id *)(a1 + 32), "setUInt64:size:inDict:forKey:", v4 + 2, 8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.playlistid"));
          objc_msgSend(*(id *)(a1 + 32), "setUInt64:size:inDict:forKey:", v4 + 4, 8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("dmap.containeritemid"));
          a3 = v4 + 6;
          v26 = *(void **)(a1 + 32);
          v27 = CFSTR("dmap.itemid");
          v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v6 = 8;
          goto LABEL_121;
        }
        if ((_DWORD)a2 != 1667330163)
          goto LABEL_130;
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("dacp.playerstate");
      }
      goto LABEL_129;
    }
    if ((int)a2 <= 1667329632)
    {
      if ((_DWORD)a2 == 1667327603)
      {
        v17 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = CFSTR("fullscreen");
        goto LABEL_112;
      }
      if ((_DWORD)a2 != 1667328883)
        goto LABEL_130;
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = CFSTR("dacp.available-skip-states");
      goto LABEL_129;
    }
    if ((_DWORD)a2 == 1667329633)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = CFSTR("daap.songartist");
    }
    else
    {
      if ((_DWORD)a2 != 1667329639)
        goto LABEL_130;
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = CFSTR("NPGenre");
    }
    goto LABEL_124;
  }
  if ((int)a2 > 1667584372)
  {
    if ((int)a2 > 1668115818)
    {
      if ((int)a2 > 1836082545)
      {
        if ((_DWORD)a2 != 1836082546)
        {
          if ((_DWORD)a2 == 1836282996)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("statusCode");
            goto LABEL_126;
          }
          if ((_DWORD)a2 == 1836413810)
          {
            v7 = *(void **)(a1 + 32);
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v9 = CFSTR("dmap.serverrevision");
            goto LABEL_126;
          }
          goto LABEL_130;
        }
        v26 = *(void **)(a1 + 32);
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v27 = CFSTR("dmap.persistentid");
        goto LABEL_120;
      }
      if ((_DWORD)a2 == 1668115819)
      {
        v7 = *(void **)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = CFSTR("mediaKind");
        goto LABEL_126;
      }
      if ((_DWORD)a2 == 1668117362)
      {
        v7 = *(void **)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = CFSTR("dmcp.playstatusrevision");
        goto LABEL_126;
      }
      if ((_DWORD)a2 != 1668118127)
        goto LABEL_130;
      *(float *)&a4 = (float)bswap32(*a3) / 100.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3, v6, a4);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v31, CFSTR("dacp.volume"));
      goto LABEL_132;
    }
    if ((int)a2 > 1668113004)
    {
      switch((_DWORD)a2)
      {
        case 0x636D626D:
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("libraryServiceDomain");
          break;
        case 0x636D6273:
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("libraryServiceName");
          break;
        case 0x636D6274:
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = CFSTR("libraryServiceType");
          break;
        default:
          goto LABEL_130;
      }
    }
    else
    {
      if ((_DWORD)a2 == 1667584373)
      {
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("com.apple.itunes.playqueue-mode");
        goto LABEL_129;
      }
      if ((_DWORD)a2 == 1667584836)
      {
        objc_msgSend(*(id *)(a1 + 32), "parseXMLContent:length:", a3, v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v32 = v20;
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v20 = v32;
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v32, "objectForKey:", CFSTR("id"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "length") && (objc_msgSend(v22, "isEqualToString:", CFSTR("(null)")) & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v22, CFSTR("dmap.itemstoreid"));
            objc_msgSend(v32, "objectForKey:", CFSTR("url"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "length"))
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v22, CFSTR("secondScreenURL"));

            v20 = v32;
          }
        }

        return;
      }
      if ((_DWORD)a2 != 1668112996)
        goto LABEL_130;
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = CFSTR("libraryDisplayName");
    }
LABEL_124:
    objc_msgSend(v10, "setString:size:inDict:forKey:", a3, v6, *(_QWORD *)(v11 + 40), v12);
    return;
  }
  if ((int)a2 > 1667331698)
  {
    if ((int)a2 <= 1667583568)
    {
      if ((_DWORD)a2 == 1667331699)
      {
        v17 = *(void **)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = CFSTR("visualizer");
        goto LABEL_112;
      }
      if ((_DWORD)a2 != 1667581779)
      {
        if ((_DWORD)a2 != 1667583313)
          goto LABEL_130;
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("com.apple.itunes.manually-queued");
        goto LABEL_129;
      }
      goto LABEL_85;
    }
    if ((_DWORD)a2 == 1667583569)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = CFSTR("com.apple.itunes.num-manually-queued");
      goto LABEL_126;
    }
    if ((_DWORD)a2 != 1667584326)
    {
      if ((_DWORD)a2 == 1667584343)
      {
        v7 = *(void **)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = CFSTR("com.apple.itunes.playqueue-warning-threshold");
        goto LABEL_126;
      }
      goto LABEL_130;
    }
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = CFSTR("com.apple.itunes.active-queue-feed-name");
    goto LABEL_124;
  }
  if ((int)a2 <= 1667330932)
  {
    switch((_DWORD)a2)
    {
      case 0x63617363:
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("dacp.scrubbable");
        break;
      case 0x63617368:
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = CFSTR("shuffle");
        break;
      case 0x63617374:
        goto LABEL_15;
      default:
        goto LABEL_130;
    }
    goto LABEL_129;
  }
  if ((_DWORD)a2 != 1667330933)
  {
    if ((_DWORD)a2 == 1667331683)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = CFSTR("dacp.volumecontrollable");
      goto LABEL_112;
    }
    if ((_DWORD)a2 == 1667331685)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = CFSTR("visualizerEnabled");
LABEL_112:
      objc_msgSend(v17, "setBool:size:inDict:forKey:", a3, v6, *(_QWORD *)(v18 + 40), v19);
      return;
    }
LABEL_130:
    objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
  }
}

- (id)processResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5
{
  int v5;
  void *v6;
  int v7;

  if ((int)a3 > 1668113263)
  {
    if ((int)a3 > 1835364977)
    {
      if ((int)a3 > 1836282485)
      {
        if (a3 == 1836413028 || a3 == 1836409717)
          goto LABEL_46;
        if (a3 != 1836282486)
          goto LABEL_51;
        -[TVRMSDAAPParser parseServerInfo:length:](self, "parseServerInfo:length:", a4, *(_QWORD *)&a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (a3 - 1835364978 >= 2)
      {
        if (a3 == 1835822951)
        {
          -[TVRMSDAAPParser parseLogin:length:](self, "parseLogin:length:", a4, *(_QWORD *)&a5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          return v6;
        }
        v5 = 1836278642;
        goto LABEL_45;
      }
LABEL_42:
      -[TVRMSDAAPParser parseListingItem:length:](self, "parseListingItem:length:", a4, *(_QWORD *)&a5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    if ((int)a3 <= 1668313711)
    {
      if (a3 == 1668113264)
      {
        -[TVRMSDAAPParser parseControlPromptResponse:length:](self, "parseControlPromptResponse:length:", a4, *(_QWORD *)&a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (a3 != 1668114292 && a3 != 1668117364)
        goto LABEL_51;
      -[TVRMSDAAPParser parseDACPPropertyResponse:length:](self, "parseDACPPropertyResponse:length:", a4, *(_QWORD *)&a5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    if ((int)a3 <= 1835234411)
    {
      if (a3 == 1668313712)
        goto LABEL_46;
      if (a3 != 1835230066)
        goto LABEL_51;
      -[TVRMSDAAPParser parseContentCodes:length:](self, "parseContentCodes:length:", a4, *(_QWORD *)&a5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    if (a3 == 1835234412)
      goto LABEL_46;
    v7 = 1835361379;
LABEL_41:
    if (a3 != v7)
      goto LABEL_51;
    goto LABEL_42;
  }
  if ((int)a3 > 1635148897)
  {
    if ((int)a3 > 1667330927)
    {
      if ((int)a3 > 1667584337)
      {
        if (a3 == 1667584338)
          goto LABEL_46;
        v5 = 1668113013;
LABEL_45:
        if (a3 == v5)
          goto LABEL_46;
        goto LABEL_51;
      }
      if (a3 == 1667330928)
      {
        -[TVRMSDAAPParser parseGetSpeakersResponse:length:](self, "parseGetSpeakersResponse:length:", a4, *(_QWORD *)&a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (a3 != 1667581769)
        goto LABEL_51;
      -[TVRMSDAAPParser parseListingCollection:length:capacity:sectionHeaders:](self, "parseListingCollection:length:capacity:sectionHeaders:", a4, *(_QWORD *)&a5, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    if (a3 == 1635148898 || a3 == 1667326825)
      goto LABEL_46;
    v7 = 1667326834;
    goto LABEL_41;
  }
  if ((int)a3 <= 1634165105)
  {
    if (a3 == 1633841775 || a3 == 1633968755)
      goto LABEL_46;
    v5 = 1634165100;
    goto LABEL_45;
  }
  if ((int)a3 <= 1634759534)
  {
    if (a3 != 1634165106)
    {
      v5 = 1634757753;
      goto LABEL_45;
    }
LABEL_46:
    -[TVRMSDAAPParser parseListingHeader:length:](self, "parseListingHeader:length:", a4, *(_QWORD *)&a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a3 == 1634759535)
    goto LABEL_46;
  if (a3 != 1634890614)
LABEL_51:
    -[TVRMSDAAPParser unknownChunk:](self, "unknownChunk:", bswap64(*((unsigned int *)a4 + 1) | ((unint64_t)*(unsigned int *)a4 << 32)), a4 + 8, *(_QWORD *)&a5);
  return 0;
}

+ (id)typeForDRCPValueType:(int)a3
{
  if ((a3 - 1) > 0x13)
    return CFSTR("undefined");
  else
    return off_24DCD7360[a3 - 1];
}

@end
