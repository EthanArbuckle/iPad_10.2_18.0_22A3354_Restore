id formatTileKey(void *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = 0uLL;
  objc_msgSend(a1, "getBytes:length:", &v12, 16);
  v1 = v12 & 0x7F;
  if (v1 == *MEMORY[0x24BE3CA20])
  {
    if (GEOSelectionTileKeyGetXYZId())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{Transit %u.%u.%u muid=%llu}"), 0, 0, 0, 0, v11);
LABEL_27:
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
  }
  else if (v1 == *MEMORY[0x24BE3CAB0])
  {
    if (GEOSelectionTileKeyGetXYZId())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{PolySel %u.%u.%u id=%llu}"), 0, 0, 0, 0, v11);
      goto LABEL_27;
    }
  }
  else if (v1 == *MEMORY[0x24BE3CAC0])
  {
    if (GEOSelectionTileKeyGetXYZId())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{TrailSel %u.%u.%u id=%llu}"), 0, 0, 0, 0, v11);
      goto LABEL_27;
    }
  }
  else if (v1 == *MEMORY[0x24BE3C9D0])
  {
    if (GEOContourLinesTileKeyGetXYZSizeUnits())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{Contour %u.%u.%u tileSize=%u units=%llu}"), 0, 0, 0, 0, 0);
      goto LABEL_27;
    }
  }
  else
  {
    if (v1 == *MEMORY[0x24BE3CA38])
    {
      v2 = ((*(unsigned __int16 *)((char *)&v12 + 9) | (BYTE11(v12) << 16)) >> 6) & 0x3FFF;
      v3 = BYTE1(v12) & 0x3F;
      *((_QWORD *)&v5 + 1) = *(unsigned __int16 *)((char *)&v12 + 9) | ((unint64_t)BYTE11(v12) << 16);
      *(_QWORD *)&v5 = *(_QWORD *)((char *)&v12 + 1);
      v4 = v5 >> 6;
      if ((_DWORD)v2 == 80)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{Gloria z=%u qk=%llu t=%u mcc=%u mnc=%u}"), v3, v4, 80, WORD6(v12) & 0x3FF, (HIDWORD(v12) >> 10) & 0x3FF);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{Gloria z=%u qk=%llu t=%u}"), v3, v4, v2, v10, v11);
      goto LABEL_27;
    }
    if (v1 == *MEMORY[0x24BE3CA98]
      || v1 == *MEMORY[0x24BE3CA88]
      || v1 == *MEMORY[0x24BE3CA90])
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{Munin lod=%u pointId=%llu buildId=%u bucketId=%u cameraId=%u}"), (*(unsigned __int16 *)((char *)&v12 + 13) | (HIBYTE(v12) << 16)) >> 21, *(_QWORD *)((char *)&v12 + 1), *(unsigned int *)((char *)&v12 + 9) | ((unint64_t)((*(unsigned __int16 *)((char *)&v12 + 13) | (HIBYTE(v12) << 16)) & 0xFFFFFF) << 32), *(unsigned __int16 *)((char *)&v12 + 13), HIBYTE(v12) & 0x1F);
      goto LABEL_27;
    }
  }
  GEOStringFromTileKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

uint64_t formatTileKeyList(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE3D080], "formatOSLogData:", a1);
}

id formatDataRequestKind(void *a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getBytes:length:", &v2, 8);
  GEODataRequestKindAsString();
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL StringsCaseInsensitiveEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  if (StringsCaseInsensitiveEqual_onceToken != -1)
    dispatch_once(&StringsCaseInsensitiveEqual_onceToken, &__block_literal_global_11);
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "length");
    v6 = v5 == objc_msgSend(v4, "length")
      && objc_msgSend(v3, "compare:options:range:locale:", v4, 3, 0, v5, StringsCaseInsensitiveEqual_posix) == 0;
  }

  return v6;
}

void __protobufClassForType_block_invoke()
{
  CFDictionaryRef v0;
  void *v1;

  v0 = CFDictionaryCreate(0, (const void **)allTypes, (const void **)allClassNames, 659, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  v1 = (void *)protobufClassForType_typeToClassName;
  protobufClassForType_typeToClassName = (uint64_t)v0;

}

uint64_t OSLogCopyFormattedString(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x22E2AE334]();
  +[GEOLogFormatter sharedFormatter](GEOLogFormatter, "sharedFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedAttributedStringForType:value:", v6, v3);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v7;
}

uint64_t OSStateCreateStringWithData(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = (void *)MEMORY[0x22E2AE334]();
  +[GEOLogFormatter sharedFormatter](GEOLogFormatter, "sharedFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedStringForStateType:data:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v10;
}

void sub_2282A80B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

BOOL getNameAndRemainderAtOffset(void *a1, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  char v16;

  v7 = a1;
  if (objc_msgSend(v7, "length") <= a2)
  {
    v12 = 0;
  }
  else
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, a2, objc_msgSend(v7, "length") - a2);
    v11 = v10;

    v12 = 0;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "subdataWithRange:", a2, v9 - a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
      *a3 = v14;
      v12 = v14 != 0;
      if (v14)
      {
        objc_msgSend(v7, "subdataWithRange:", v9 + v11, objc_msgSend(v7, "length") - (v9 + v11));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v12;
}

id decompress(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  size_t v7;
  compression_algorithm v8;
  void *v9;
  int v10;
  id v11;
  uint8_t *v12;
  id v13;
  size_t v14;

  v3 = a1;
  v4 = v3;
  v5 = 0;
  HIDWORD(v6) = a2;
  LODWORD(v6) = a2 - 4;
  switch((v6 >> 2))
  {
    case 0u:
      v7 = 4 * objc_msgSend(v3, "length");
      v8 = COMPRESSION_LZFSE;
      goto LABEL_6;
    case 1u:
      v7 = (unint64_t)(5 * objc_msgSend(v3, "length")) >> 1;
      v8 = COMPRESSION_LZ4;
      goto LABEL_6;
    case 3u:
      v7 = 4 * objc_msgSend(v3, "length");
      v8 = COMPRESSION_ZLIB;
      goto LABEL_6;
    case 7u:
      v7 = 4 * objc_msgSend(v3, "length");
      v8 = COMPRESSION_LZMA;
LABEL_6:
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 3;
      break;
    default:
      goto LABEL_13;
  }
  while (1)
  {
    v11 = objc_retainAutorelease(v9);
    v12 = (uint8_t *)objc_msgSend(v11, "mutableBytes");
    v13 = objc_retainAutorelease(v4);
    v14 = compression_decode_buffer(v12, v7, (const uint8_t *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 0, v8);
    if (!v14)
    {
LABEL_10:
      v5 = 0;
      goto LABEL_12;
    }
    if (v14 < v7)
      break;
    v7 += 2 * objc_msgSend(v13, "length", v14);
    objc_msgSend(v11, "setLength:", v7);
    if (!--v10)
      goto LABEL_10;
  }
  objc_msgSend(v11, "setLength:", v14);
  v5 = v11;
LABEL_12:

LABEL_13:
  return v5;
}

id formattedStringFromProtobuf(void *a1, void *a2)
{
  NSString *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc(NSClassFromString(v3));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(not a protobuf %@)"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  v6 = objc_msgSend(v5, "initWithData:", v4);
  if (v6)
  {
    v5 = (id)v6;
    v7 = (void *)MEMORY[0x22E2AE334]();
    if (getOutputMode_onceToken != -1)
      dispatch_once(&getOutputMode_onceToken, &__block_literal_global_0);
    if (getOutputMode_mode == 2)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_23;
      objc_msgSend(v5, "dictionaryRepresentation");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (getOutputMode_mode != 1)
      {
        if (getOutputMode_mode
          || (objc_msgSend(v5, "formattedText"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_23:
          objc_msgSend(v5, "formattedText");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unable to format protobuf %@) %@"), v3, v4);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
LABEL_25:
        objc_autoreleasePoolPop(v7);
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_23;
      objc_msgSend(v5, "jsonRepresentation");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 3, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
        else
          v8 = 0;

      }
      else
      {
        v8 = 0;
      }

    }
    if (!v8)
      goto LABEL_23;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unable to parse protobuf %@) %@"), v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v8;
}

char *__getOutputMode_block_invoke()
{
  char *v0;
  char *result;
  uint64_t v2;

  v0 = getenv("GEO_RR_Log_Formatter_Mode");
  result = getenv("GEO_RR_Log_Formatter_PBText");
  if (!v0 || !*v0)
  {
    if (!result || *result != 49)
      return result;
LABEL_10:
    v2 = 1;
    goto LABEL_11;
  }
  result = (char *)strncmp(v0, "json", 4uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = (char *)strncmp(v0, "dictionary", 0xAuLL);
  if (!(_DWORD)result
    || (result = (char *)strncmp(v0, "description", 0xBuLL), !(_DWORD)result)
    || (result = (char *)strncmp(v0, "formattedText", 0xDuLL), !(_DWORD)result))
  {
    v2 = 2;
LABEL_11:
    getOutputMode_mode = v2;
  }
  return result;
}

id scanDict(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = (void *)MEMORY[0x24BDD17C8];
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is actually a %@"), v6, v7, (_QWORD)v16);
          v8 = objc_claimAutoreleasedReturnValue();
LABEL_20:
          v9 = (void *)v8;
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(v1, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          scanDict(v7);
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
            goto LABEL_20;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            scanArr(v7);
            v8 = objc_claimAutoreleasedReturnValue();
            if (v8)
              goto LABEL_20;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v13 = (void *)MEMORY[0x24BDD17C8];
                v14 = (objc_class *)objc_opt_class();
                NSStringFromClass(v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "stringWithFormat:", CFSTR("value for %@ is actually a %@"), v6, v15, (_QWORD)v16);
                v9 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_21;
              }
            }
          }
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = 0;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_22:

  return v9;
}

id scanArr(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
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
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          scanDict(v6);
          v7 = objc_claimAutoreleasedReturnValue();
          if (v7)
            goto LABEL_17;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            scanArr(v6);
            v7 = objc_claimAutoreleasedReturnValue();
            if (v7)
            {
LABEL_17:
              v8 = (void *)v7;
              goto LABEL_18;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v10 = (void *)MEMORY[0x24BDD17C8];
                v11 = (objc_class *)objc_opt_class();
                NSStringFromClass(v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "stringWithFormat:", CFSTR("value %@ is actually a %@"), v6, v12, (_QWORD)v13);
                v8 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_18;
              }
            }
          }
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_18:

  return v8;
}

id formattedTileLoadOptionsForNumber(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (void *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  objc_msgSend(v1, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "unsignedIntegerValue");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("CheckDisk"));
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("CheckNetwork"));
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "addObject:", CFSTR("RequireWiFi"));
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "addObject:", CFSTR("Preload"));
  if ((v4 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x20) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("AllowPreliminary"));
LABEL_7:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("{"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("}"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

__CFString *formattedGEOTileSetStyleForNumber(void *a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = objc_msgSend(a1, "unsignedIntegerValue");
  v2 = CFSTR("RASTER_STANDARD");
  switch((int)v1)
  {
    case 0:
      return v2;
    case 1:
      return CFSTR("VECTOR_STANDARD");
    case 2:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
    case 3:
      return CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
    case 4:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
    case 5:
      return CFSTR("RASTER_STANDARD_BACKGROUND");
    case 6:
      return CFSTR("RASTER_HYBRID");
    case 7:
      return CFSTR("RASTER_SATELLITE");
    case 8:
      return CFSTR("RASTER_TERRAIN");
    case 11:
      return CFSTR("VECTOR_BUILDINGS");
    case 12:
      return CFSTR("VECTOR_TRAFFIC");
    case 13:
      return CFSTR("VECTOR_POI");
    case 14:
      return CFSTR("SPUTNIK_METADATA");
    case 15:
      return CFSTR("SPUTNIK_C3M");
    case 16:
      return CFSTR("SPUTNIK_DSM");
    case 17:
      return CFSTR("SPUTNIK_DSM_GLOBAL");
    case 18:
      return CFSTR("VECTOR_REALISTIC");
    case 19:
      return CFSTR("VECTOR_LEGACY_REALISTIC");
    case 20:
      return CFSTR("VECTOR_ROADS");
    case 21:
      return CFSTR("RASTER_VEGETATION");
    case 22:
      return CFSTR("VECTOR_TRAFFIC_SKELETON");
    case 23:
      return CFSTR("RASTER_COASTLINE_MASK");
    case 24:
      return CFSTR("RASTER_HILLSHADE");
    case 25:
      return CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
    case 26:
      return CFSTR("VECTOR_TRAFFIC_STATIC");
    case 27:
      return CFSTR("RASTER_COASTLINE_DROP_MASK");
    case 28:
      return CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
    case 29:
      return CFSTR("VECTOR_SPEED_PROFILES");
    case 30:
      return CFSTR("VECTOR_VENUES");
    case 31:
      return CFSTR("RASTER_DOWN_SAMPLED");
    case 32:
      return CFSTR("RASTER_COLOR_BALANCED");
    case 33:
      return CFSTR("RASTER_SATELLITE_NIGHT");
    case 34:
      return CFSTR("SPUTNIK_VECTOR_BORDER");
    case 35:
      return CFSTR("RASTER_SATELLITE_DIGITIZE");
    case 36:
      return CFSTR("RASTER_HILLSHADE_PARKS");
    case 37:
      return CFSTR("VECTOR_TRANSIT");
    case 38:
      return CFSTR("RASTER_STANDARD_BASE");
    case 39:
      return CFSTR("RASTER_STANDARD_LABELS");
    case 40:
      return CFSTR("RASTER_HYBRID_ROADS");
    case 41:
      return CFSTR("RASTER_HYBRID_LABELS");
    case 42:
      return CFSTR("FLYOVER_C3M_MESH");
    case 43:
      return CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
    case 44:
      return CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
    case 45:
      return CFSTR("RASTER_SATELLITE_ASTC");
    case 46:
      return CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
    case 47:
      return CFSTR("VECTOR_TRANSIT_SELECTION");
    case 48:
      return CFSTR("VECTOR_COVERAGE");
    case 52:
      return CFSTR("FLYOVER_METADATA");
    case 53:
      return CFSTR("VECTOR_ROAD_NETWORK");
    case 54:
      return CFSTR("VECTOR_LAND_COVER");
    case 55:
      return CFSTR("VECTOR_DEBUG");
    case 56:
      return CFSTR("VECTOR_STREET_POI");
    case 57:
      return CFSTR("MUNIN_METADATA");
    case 58:
      return CFSTR("VECTOR_SPR_MERCATOR");
    case 59:
      return CFSTR("VECTOR_SPR_MODELS");
    case 60:
      return CFSTR("VECTOR_SPR_MATERIALS");
    case 61:
      return CFSTR("VECTOR_SPR_METADATA");
    case 62:
      return CFSTR("VECTOR_TRACKS");
    case 63:
      return CFSTR("VECTOR_RESERVED_2");
    case 64:
      return CFSTR("VECTOR_STREET_LANDMARKS");
    case 65:
      return CFSTR("COARSE_LOCATION_POLYGONS");
    case 66:
      return CFSTR("VECTOR_SPR_ROADS");
    case 67:
      return CFSTR("VECTOR_SPR_STANDARD");
    case 68:
      return CFSTR("VECTOR_POI_V2");
    case 69:
      return CFSTR("VECTOR_POLYGON_SELECTION");
    case 70:
      return CFSTR("VL_METADATA");
    case 71:
      return CFSTR("VL_DATA");
    case 72:
      return CFSTR("PROACTIVE_APP_CLIP");
    case 73:
      return CFSTR("VECTOR_BUILDINGS_V2");
    case 74:
      return CFSTR("POI_BUSYNESS");
    case 75:
      return CFSTR("POI_DP_BUSYNESS");
    case 76:
      return CFSTR("SMART_INTERFACE_SELECTION");
    case 77:
      return CFSTR("VECTOR_ASSETS");
    case 78:
      return CFSTR("SPR_ASSET_METADATA");
    case 79:
      return CFSTR("VECTOR_SPR_POLAR");
    case 80:
      return CFSTR("SMART_DATA_MODE");
    case 81:
      return CFSTR("CELLULAR_PERFORMANCE_SCORE");
    case 82:
      return CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
    case 83:
      return CFSTR("VECTOR_TOPOGRAPHIC");
    case 84:
      return CFSTR("VECTOR_POI_V2_UPDATE");
    case 85:
      return CFSTR("VECTOR_LIVE_DATA_UPDATES");
    case 86:
      return CFSTR("VECTOR_TRAFFIC_V2");
    case 87:
      return CFSTR("VECTOR_ROAD_SELECTION");
    case 88:
      return CFSTR("VECTOR_REGION_METADATA");
    case 89:
      return CFSTR("RAY_TRACING");
    case 90:
      return CFSTR("VECTOR_CONTOURS");
    case 91:
      return CFSTR("RASTER_SATELLITE_POLAR");
    case 92:
      return CFSTR("VMAP4_ELEVATION");
    case 93:
      return CFSTR("VMAP4_ELEVATION_POLAR");
    case 94:
      return CFSTR("CELLULAR_COVERAGE_PLMN");
    case 95:
      return CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
    case 96:
      return CFSTR("UNUSED_96");
    case 97:
      return CFSTR("UNUSED_97");
    case 98:
      return CFSTR("UNUSED_98");
    case 99:
      return CFSTR("UNUSED_99");
    case 100:
      return CFSTR("UNUSED_100");
    case 101:
      return CFSTR("UNUSED_101");
    case 102:
      return CFSTR("UNUSED_102");
    case 103:
      return CFSTR("UNUSED_103");
    case 104:
      return CFSTR("UNUSED_104");
    case 105:
      return CFSTR("UNUSED_105");
    case 106:
      return CFSTR("UNUSED_106");
    case 107:
      return CFSTR("UNUSED_107");
    case 108:
      return CFSTR("UNUSED_108");
    case 109:
      return CFSTR("UNUSED_109");
    case 110:
      return CFSTR("UNUSED_110");
    case 111:
      return CFSTR("UNUSED_111");
    case 112:
      return CFSTR("UNUSED_112");
    case 113:
      return CFSTR("UNUSED_113");
    case 114:
      return CFSTR("UNUSED_114");
    case 115:
      return CFSTR("UNUSED_115");
    case 116:
      return CFSTR("UNUSED_116");
    case 117:
      return CFSTR("UNUSED_117");
    case 118:
      return CFSTR("UNUSED_118");
    case 119:
      v2 = CFSTR("UNUSED_119");
      return v2;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v2;
  }
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

uint64_t GEOContourLinesTileKeyGetXYZSizeUnits()
{
  return MEMORY[0x24BE3C9C8]();
}

uint64_t GEODataRequestKindAsString()
{
  return MEMORY[0x24BE3C9E8]();
}

uint64_t GEOSelectionTileKeyGetXYZId()
{
  return MEMORY[0x24BE3CAC8]();
}

uint64_t GEOStringFromTileKey()
{
  return MEMORY[0x24BE3CAD8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x24BE3D1A0]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x24BE3D1B0]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

