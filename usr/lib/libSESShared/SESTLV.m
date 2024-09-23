@implementation SESTLV

+ (id)dataWithTLVs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "asData", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendData:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)TLVsWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v7;

  v4 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v4, "bytes");
  v5 = objc_msgSend(v4, "length");

  objc_msgSend(a1, "_parseTLVs:end:simple:", &v7, v7 + v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)simpleTLVsWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v7;

  v4 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v4, "bytes");
  v5 = objc_msgSend(v4, "length");

  objc_msgSend(a1, "_parseTLVs:end:simple:", &v7, v7 + v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)TLVWithData:(id)a3
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  __int16 v9;
  uint8_t buf[2];

  objc_msgSend(a1, "TLVsWithData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      objc_msgSend(v3, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 0;
      v5 = "More than one TLV detected";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }
  else
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v5 = "No TLV detected";
      v6 = buf;
      goto LABEL_7;
    }
  }

  v7 = 0;
LABEL_10:

  return v7;
}

+ (id)TLVWithTag:(unsigned int)a3 fromData:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[SESTLV TLVsWithData:](SESTLV, "TLVsWithData:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "tag") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)simpleTLVsWithTag:(unsigned int)a3 fromData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[SESTLV simpleTLVsWithData:](SESTLV, "simpleTLVsWithData:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "tag") == a3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 children:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_opt_new();
  *(_DWORD *)(v7 + 8) = a3;
  objc_storeStrong((id *)(v7 + 24), a4);
  if (*(_QWORD *)(v7 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = *(id *)(v7 + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(v7 + 16);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "asData", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appendData:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  return (id)v7;
}

+ (id)TLVWithTag:(unsigned int)a3 value:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  v6 = objc_opt_new();
  *(_DWORD *)(v6 + 8) = a3;
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  return (id)v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedLongValue:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SESTLV TLVWithTag:value:](SESTLV, "TLVWithTag:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedChar:(unsigned __int8)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SESTLV TLVWithTag:value:](SESTLV, "TLVWithTag:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedShort:(unsigned __int16)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int16 v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SESTLV TLVWithTag:value:](SESTLV, "TLVWithTag:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t tag;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (self->_children)
  {
    v13.receiver = self;
    v13.super_class = (Class)SESTLV;
    -[SESTLV description](&v13, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    tag = self->_tag;
    -[SESTLV children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %02x : %@"), v4, tag, v6, v10);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_value, 1);
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (v4)
    {
      v12.receiver = self;
      v12.super_class = (Class)SESTLV;
      -[SESTLV description](&v12, sel_description);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %02x = %@ \"%@\"), v6, self->_tag, self->_value, v4);
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)SESTLV;
      -[SESTLV description](&v11, sel_description);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %02x = %@"), v6, self->_tag, self->_value, v10);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)tag
{
  return self->_tag;
}

- (NSData)value
{
  return self->_value;
}

- (id)valueAsString
{
  void *v2;

  if (self->_value)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_value, 1);
  else
    v2 = 0;
  return v2;
}

- (unsigned)valueAsUnsignedChar
{
  NSObject *v4;
  NSData *value;
  int v6;
  NSData *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[NSData length](self->_value, "length") == 1)
    return *(_BYTE *)-[NSData bytes](self->_value, "bytes");
  SESDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    value = self->_value;
    v6 = 138412290;
    v7 = value;
    _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, "Unexpected length %@", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (unsigned)valueAsUnsignedLong
{
  NSData *value;
  NSObject *v4;
  NSData *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unsigned int v8;
  int v10;
  NSData *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  value = self->_value;
  if (!value)
    return 0;
  if (-[NSData length](value, "length") >= 5)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = self->_value;
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, "Value too large: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  v6 = -[NSData bytes](self->_value, "bytes");
  if (!-[NSData length](self->_value, "length"))
    return 0;
  v7 = 0;
  v8 = 0;
  do
    v8 = v6[v7++] | (v8 << 8);
  while (-[NSData length](self->_value, "length") > v7);
  return v8;
}

- (unsigned)valueAsUnsignedShort
{
  NSData *value;
  NSObject *v4;
  NSData *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unsigned __int16 v8;
  int v10;
  NSData *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  value = self->_value;
  if (!value)
    return 0;
  if (-[NSData length](value, "length") >= 3)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = self->_value;
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, "Value too large: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  v6 = -[NSData bytes](self->_value, "bytes");
  if (!-[NSData length](self->_value, "length"))
    return 0;
  v7 = 0;
  v8 = 0;
  do
    v8 = v6[v7++] | (unsigned __int16)(v8 << 8);
  while (-[NSData length](self->_value, "length") > v7);
  return v8;
}

- (unint64_t)valueAsUnsignedLongLong
{
  NSData *value;
  NSObject *v4;
  NSData *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  int v10;
  NSData *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  value = self->_value;
  if (!value)
    return 0;
  if (-[NSData length](value, "length") >= 9)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = self->_value;
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, "Value too large: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  v6 = -[NSData bytes](self->_value, "bytes");
  if (!-[NSData length](self->_value, "length"))
    return 0;
  v7 = 0;
  v8 = 0;
  do
    v8 = v6[v7++] | (v8 << 8);
  while (-[NSData length](self->_value, "length") > v7);
  return v8;
}

- (NSArray)children
{
  return self->_children;
}

- (id)childrenWithTag:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SESTLV children](self, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "tag") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)childWithTag:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SESTLV children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "tag") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)_intToData:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  char v9;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v9 = 0;
  if (a3)
  {
    v6 = 4;
    if (HIBYTE(a3))
      goto LABEL_12;
    do
    {
      v7 = HIWORD(a3);
      a3 <<= 8;
      --v6;
    }
    while (!v7 && v6);
    if (v6)
    {
LABEL_12:
      do
      {
        v9 = HIBYTE(a3);
        objc_msgSend(v5, "appendBytes:length:", &v9, 1);
        a3 <<= 8;
        --v6;
      }
      while (v6);
    }
  }
  else
  {
    objc_msgSend(v4, "appendBytes:length:", &v9, 1);
  }
  return v5;
}

- (id)asData
{
  void *v3;
  void *v4;
  NSData *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SESTLV _intToData:](SESTLV, "_intToData:", self->_tag);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  v5 = self->_value;
  if (!v5)
  {
    if (self->_children)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v6 = self->_children;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "asData");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSData appendData:](v5, "appendData:", v11);

          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

    }
    else
    {
      v5 = 0;
    }
  }
  v12 = -[NSData length](v5, "length");
  +[SESTLV _intToData:](SESTLV, "_intToData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 >= 0x80)
  {
    v16 = objc_msgSend(v13, "length") | 0x80;
    objc_msgSend(v3, "appendBytes:length:", &v16, 1);
  }
  objc_msgSend(v3, "appendData:", v14);
  if (v5)
    objc_msgSend(v3, "appendData:", v5);

  return v3;
}

+ (id)_parseTLVs:(const char *)a3 end:(const char *)a4 simple:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  _BOOL4 v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  int v29;
  unint64_t v30;
  id v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  int v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a3;
  if (*a3 >= a4)
  {
LABEL_32:
    v31 = v9;
    goto LABEL_46;
  }
  while (1)
  {
    v11 = v10 + 1;
    *a3 = v10 + 1;
    v12 = *(unsigned __int8 *)v10;
    if (!v5)
      break;
    if (v11 >= a4)
    {
      SESDefaultLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v37 = 67109120;
      v38 = v12;
      v33 = "Underflow: tag=0x%x";
      goto LABEL_43;
    }
    v13 = (unint64_t)(v10 + 2);
    *a3 = v10 + 2;
    v14 = *((unsigned __int8 *)v10 + 1);
    if (v14 == 255)
    {
      v14 = 0;
      v19 = 1;
      while (v13 < (unint64_t)a4)
      {
        v20 = v19;
        v19 = 0;
        v21 = v13 + 1;
        *a3 = (const char *)(v13 + 1);
        v14 = *(unsigned __int8 *)v13++ | (v14 << 8);
        if ((v20 & 1) == 0)
        {
          v15 = 1;
          v13 = v21;
          goto LABEL_18;
        }
      }
      SESDefaultLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v37 = 67109120;
        v38 = v12;
        v33 = "Underflow: tag=0x%x";
        goto LABEL_43;
      }
      goto LABEL_45;
    }
    v15 = 1;
LABEL_18:
    if (!(v12 | v14))
      goto LABEL_32;
    if (!v15)
    {
      if ((uint64_t)&a4[-v13] >= v14)
      {
        v24 = v13 + v14;
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_parseTLVs:end:simple:", a3, v24, v5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[SESTLV TLVWithTag:children:](SESTLV, "TLVWithTag:children:", v12, v26);
        v27 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)v27[2];
        v27[2] = v25;

        objc_msgSend(v9, "addObject:", v27);
        v10 = *a3;
        goto LABEL_24;
      }
      SESDefaultLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
LABEL_50:
      v37 = 67109376;
      v38 = v12;
      v39 = 1024;
      v40 = v14;
      v33 = "Underflow: tag=0x%x len=%u";
      v34 = v32;
      v35 = 14;
      goto LABEL_44;
    }
    if ((uint64_t)&a4[-v13] < v14)
    {
      SESDefaultLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      goto LABEL_50;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SESTLV TLVWithTag:value:](SESTLV, "TLVWithTag:value:", v12, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

    v10 = &(*a3)[v14];
    *a3 = v10;
LABEL_24:
    if (v10 >= a4)
      goto LABEL_32;
  }
  v15 = (v12 & 0x20) == 0;
  if ((~(_DWORD)v12 & 0x1F) == 0)
  {
    while (v11 < a4)
    {
      v16 = (unsigned __int8 *)(v11 + 1);
      *a3 = v11 + 1;
      v17 = *v11;
      v18 = *(unsigned __int8 *)v11++ | ((_DWORD)v12 << 8);
      LODWORD(v12) = v18;
      if ((v17 & 0x80000000) == 0)
        goto LABEL_11;
    }
    SESDefaultLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    LOWORD(v37) = 0;
    v33 = "Underflow";
    v34 = v32;
    v35 = 2;
LABEL_44:
    _os_log_impl(&dword_24B9C8000, v34, OS_LOG_TYPE_ERROR, v33, (uint8_t *)&v37, v35);
    goto LABEL_45;
  }
  v16 = (unsigned __int8 *)v11;
  v18 = v12;
LABEL_11:
  if (v16 >= (unsigned __int8 *)a4)
  {
    SESDefaultLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v37 = 67109120;
    v38 = v18;
    v33 = "Underflow: tag=0x%x";
LABEL_43:
    v34 = v32;
    v35 = 8;
    goto LABEL_44;
  }
  v13 = (unint64_t)(v16 + 1);
  *a3 = (const char *)(v16 + 1);
  v14 = *v16;
  if (((char)*v16 & 0x80000000) == 0)
  {
LABEL_13:
    v12 = v18;
    goto LABEL_18;
  }
  v29 = v14 & 0x7F;
  if ((v14 & 0x7F) == 0)
  {
    v14 = 0;
    goto LABEL_13;
  }
  v14 = 0;
  while (v13 < (unint64_t)a4)
  {
    v30 = v13 + 1;
    *a3 = (const char *)(v13 + 1);
    v14 = *(unsigned __int8 *)v13++ | (v14 << 8);
    if (!--v29)
    {
      v13 = v30;
      goto LABEL_13;
    }
  }
  SESDefaultLogObject();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v37 = 67109120;
    v38 = v18;
    v33 = "Underflow: tag=0x%x";
    goto LABEL_43;
  }
LABEL_45:

  v31 = 0;
LABEL_46:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
