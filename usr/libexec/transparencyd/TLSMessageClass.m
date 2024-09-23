@implementation TLSMessageClass

- (const)parseBool:(const char *)a3 end:(const char *)a4 result:(BOOL *)a5
{
  const char *result;
  int v6;

  result = 0;
  if (a3 && a4 > a3)
  {
    v6 = *(unsigned __int8 *)a3;
    if (v6 == 255 || v6 == 0)
    {
      if (a5)
        *a5 = v6 == 255;
      return a3 + 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (const)parseByte:(const char *)a3 end:(const char *)a4 result:(char *)a5
{
  const char *result;

  result = 0;
  if (a3 && a4 > a3)
  {
    if (a5)
      *a5 = *a3;
    return a3 + 1;
  }
  return result;
}

- (const)parseUint64:(const char *)a3 end:(const char *)a4 result:(unint64_t *)a5
{
  const char *result;
  uint64_t v6;
  unint64_t v7;

  result = 0;
  if (a4 >= a3 && a3 && a4 && (unint64_t)(a4 - a3) >= 8)
  {
    v6 = 0;
    v7 = 0;
    do
      v7 = a3[v6++] | (v7 << 8);
    while (v6 != 8);
    if (a5)
      *a5 = v7;
    return a3 + 8;
  }
  return result;
}

- (const)parseByteArray:(const char *)a3 end:(const char *)a4 minLength:(unint64_t)a5 maxLength:(unint64_t)a6 result:(id *)a7
{
  const char *v7;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;

  v7 = 0;
  if (a3 && a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v14 = v13;
    v15 = 0;
    if (a6)
    {
      do
      {
        ++v15;
        v16 = a6 > 0xFF;
        a6 >>= 8;
      }
      while (v16);
      v7 = 0;
      if (a4 >= a3 && a4 - a3 > (unint64_t)(v15 - 1))
      {
        v17 = 0;
        a6 = 0;
        do
          a6 = a3[v17++] | (a6 << 8);
        while (v15 != v17);
LABEL_11:
        if (!a5 || a6)
        {
          v18 = (unint64_t)&a3[v15];
          if (a6 | a5)
          {
            v7 = 0;
            if (v18 <= (unint64_t)a4 && (unint64_t)&a4[-v18] >= a6)
            {
              objc_msgSend(v13, "appendBytes:length:", v18, a6);
              if (a7)
                *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v14));
              v7 = (const char *)(v18 + a6);
            }
          }
          else
          {
            if (a7)
              *a7 = 0;
            v7 = (const char *)v18;
          }
        }
        else
        {
          v7 = 0;
        }
      }
    }
    else
    {
      v7 = 0;
      if (a4 >= a3)
        goto LABEL_11;
    }

  }
  return v7;
}

- (const)parseVRFOutput:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  return -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:](self, "parseByteArray:end:minLength:maxLength:result:", a3, a4, 1, 255, a5);
}

- (const)parseHashValue:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  return -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:](self, "parseByteArray:end:minLength:maxLength:result:", a3, a4, 1, 255, a5);
}

- (const)parseExtensions:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  _BYTE *v14;
  _BYTE *v15;
  const char *v17;
  id v18;
  id v19;

  v19 = 0;
  v6 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:](self, "parseByteArray:end:minLength:maxLength:result:", a3, a4, 0, 0xFFFFLL, &v19);
  v7 = v19;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v17 = v6;
    if (objc_msgSend(v7, "length"))
    {
      while (1)
      {
        v18 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[TLSExtension parseFromData:error:](TLSExtension, "parseFromData:error:", v7, &v18, v17));
        v10 = v18;
        if (!v9)
          break;
        objc_msgSend(v8, "addObject:", v9);
        v11 = objc_retainAutorelease(v7);
        v12 = objc_msgSend(v11, "bytes");
        v13 = (char *)objc_msgSend(v9, "parsedLength");
        v14 = objc_msgSend(v11, "length");
        v15 = objc_msgSend(v9, "parsedLength");
        if (v14 < v15)
          break;
        v7 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13[(_QWORD)v12], v14 - v15));

        if (!objc_msgSend(v7, "length"))
          goto LABEL_6;
      }

      v6 = 0;
    }
    else
    {
LABEL_6:
      if (a5 && objc_msgSend(v8, "count"))
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
      v6 = v17;
    }

  }
  return v6;
}

- (BOOL)encodeBool:(BOOL)a3 buffer:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  char *v8;
  BOOL v9;
  char v11;
  char v12;

  v4 = a3;
  v6 = a4;
  if (v6 && (v7 = objc_opt_class(NSMutableData, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v12 = -1;
    v11 = 0;
    if (v4)
      v8 = &v12;
    else
      v8 = &v11;
    v9 = 1;
    objc_msgSend(v6, "appendBytes:length:", v8, 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)encodeByte:(unsigned __int8)a3 buffer:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  unsigned __int8 v9;

  v9 = a3;
  v5 = a4;
  if (v5 && (v6 = objc_opt_class(NSMutableData, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = 1;
    objc_msgSend(v5, "appendBytes:length:", &v9, 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)encodeUint64:(unint64_t)a3 buffer:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  char v11;

  v6 = a4;
  if (v6 && (v7 = objc_opt_class(NSMutableData, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    for (i = 56; i != -8; i -= 8)
    {
      v11 = a3 >> i;
      v9 = 1;
      objc_msgSend(v6, "appendBytes:length:", &v11, 1);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)encodeByteArray:(id)a3 minLength:(unint64_t)a4 maxLength:(unint64_t)a5 buffer:(id)a6
{
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  char v18;

  v9 = a3;
  v11 = a6;
  if (v11
    && (v12 = objc_opt_class(NSMutableData, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (unint64_t)objc_msgSend(v9, "length") >= a4)
  {
    if (a5)
    {
      v15 = -8;
      do
      {
        v15 += 8;
        v16 = a5 > 0xFF;
        a5 >>= 8;
      }
      while (v16);
      v17 = v15 - 8;
      do
      {
        v18 = 0;
        v18 = (unint64_t)objc_msgSend(v9, "length") >> v15;
        objc_msgSend(v11, "appendBytes:length:", &v18, 1);
        v17 -= 8;
        LOBYTE(v15) = v15 - 8;
      }
      while (v17 != -16);
    }
    objc_msgSend(v11, "appendData:", v9);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)encodeVRFOutput:(id)a3 buffer:(id)a4
{
  return -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", a3, 1, 255, a4);
}

- (BOOL)encodeHashValue:(id)a3 buffer:(id)a4
{
  return -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", a3, 1, 255, a4);
}

- (BOOL)encodeExtensions:(id)a3 buffer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "data", (_QWORD)v18));
          if (!v14)
          {

            v16 = 0;
            goto LABEL_14;
          }
          v15 = (void *)v14;
          objc_msgSend(v8, "appendData:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  }
  v16 = -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v8, 0, 0xFFFFLL, v7, (_QWORD)v18);
LABEL_14:

  return v16;
}

@end
