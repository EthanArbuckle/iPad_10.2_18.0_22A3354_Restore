@implementation GEOLogFormatter

- (id)descriptionForPropertyListData:(id)a3 capturedStateType:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)formattedStringForStructType:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEOLogFormatter formattedStringForStructType:data:](self, "formattedStringForStructType:data:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formattedStringForStructType:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  if (!StringsCaseInsensitiveEqual(v5, CFSTR("coordinate")))
  {
    v7 = 0;
    while (1)
    {
      if (v7 == 24 || (v8 = *(uint64_t *)((char *)&formatters + v7 + 8), v8 == objc_msgSend(v6, "length")))
      {
        if (StringsCaseInsensitiveEqual(v5, *(__CFString **)((char *)&formatters + v7)))
          break;
      }
      v7 += 24;
      if (v7 == 72)
        goto LABEL_16;
    }
    (*(void (**)(id))((char *)&formatters + v7 + 16))(v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (objc_msgSend(v6, "length") == 16)
  {
    v13 = 0.0;
    v14 = 0.0;
    objc_msgSend(v6, "getBytes:length:", &v13, 16);
    if (v13 != -180.0 || v14 != -180.0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f,%f"), v13, v14, *(_QWORD *)&v13, *(_QWORD *)&v14, v12);
LABEL_19:
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v9 = (__CFString *)v10;
      goto LABEL_21;
    }
  }
  else
  {
    if (objc_msgSend(v6, "length") != 24)
    {
LABEL_16:
      v9 = 0;
      goto LABEL_21;
    }
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0;
    objc_msgSend(v6, "getBytes:length:", &v13, 24);
    if (v13 != -180.0 || v14 != -180.0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f,%f,%f"), v13, v14, *(_QWORD *)&v13, *(_QWORD *)&v14, v15);
      goto LABEL_19;
    }
  }
  v9 = CFSTR("Invalid");
LABEL_21:

  return v9;
}

+ (id)sharedFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__GEOLogFormatter_sharedFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, block);
  return (id)sharedFormatter_formatter;
}

void __34__GEOLogFormatter_sharedFormatter__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedFormatter_formatter;
  sharedFormatter_formatter = (uint64_t)v1;

}

- (GEOLogFormatter)init
{
  GEOLogFormatter *v2;
  uint64_t v3;
  geo_isolater *isolation;
  uint64_t v5;
  NSMutableDictionary *requestResponseCollector;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOLogFormatter;
  v2 = -[GEOLogFormatter init](&v8, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    requestResponseCollector = v2->_requestResponseCollector;
    v2->_requestResponseCollector = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)formattedAttributedStringForType:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFString *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x22E2AE334]();
  -[GEOLogFormatter formattedStringForStructType:value:](self, "formattedStringForStructType:value:", v6, v7);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[GEOLogFormatter formattedStringForEnumType:value:](self, "formattedStringForEnumType:value:", v6, v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[GEOLogFormatter formattedStringForProtobufType:value:](self, "formattedStringForProtobufType:value:", v6, v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        -[GEOLogFormatter formattedStringForRequestResponseType:value:](self, "formattedStringForRequestResponseType:value:", v6, v7);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(v7, "description");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  objc_autoreleasePoolPop(v8);
  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  if (v9)
    v11 = v9;
  else
    v11 = &stru_24F0E2440;
  v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

  return v12;
}

- (id)formattedStringForStateType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "hasSuffix:", CFSTR("/plist"))
    || (objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - objc_msgSend(CFSTR("/plist"), "length")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[GEOLogFormatter descriptionForPropertyListData:capturedStateType:](self, "descriptionForPropertyListData:capturedStateType:", v7, v8), v9 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v9))
  {
    objc_msgSend(v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (geo_isolater)isolation
{
  return self->_isolation;
}

- (NSMutableDictionary)requestResponseCollector
{
  return self->_requestResponseCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestResponseCollector, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

- (id)formattedStringForProtobufType:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEOLogFormatter formattedStringForProtobufType:data:](self, "formattedStringForProtobufType:data:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formattedStringForProtobufType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PBCodable")))
  {
    -[GEOLogFormatter formattedStringForPBCodableData:](self, "formattedStringForPBCodableData:", v7);
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("pb/")))
  {
    objc_msgSend(v6, "substringFromIndex:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (protobufClassForType_onceToken != -1)
      dispatch_once(&protobufClassForType_onceToken, &__block_literal_global);
    objc_msgSend((id)protobufClassForType_typeToClassName, "objectForKeyedSubscript:", v6);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      NSClassFromString(v10);
      v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    if (v8)
    {
      v12 = [v8 alloc];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "initWithData:", v7);
        objc_msgSend(v13, "formattedText");
        v8 = (objc_class *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formattedStringForRequestResponseType:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("requestresponse/pbcodable")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("requestresponseV2/pbcodable")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("requestresponseV3/pbcodable")))
  {
    v8 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (getenv("GEO_RR_Log_Formatter_Disabled"))
      {
        objc_msgSend(v8, "debugDescription");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = __Block_byref_object_copy_;
        v17 = __Block_byref_object_dispose_;
        v18 = 0;
        -[GEOLogFormatter isolation](self, "isolation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v8;
        geo_isolate_sync();

        v9 = (id)v14[5];
        _Block_object_dispose(&v13, 8);

      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __80__GEOLogFormatter_RequestResponse__formattedStringForRequestResponseType_value___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "formattedStringForRequestResponse:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)formattedStringForRequestResponse:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    objc_msgSend(v4, "getBytes:range:", &v10, 0, 1);
    v5 = v10 & 0x3C;
    v6 = v10 & 3;
    if (v6 == 2)
    {
      -[GEOLogFormatter formattedStringForMultiPartRequestResponse:compressed:](self, "formattedStringForMultiPartRequestResponse:compressed:", v4, v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = 0;
    if (v6 == 1)
    {
      -[GEOLogFormatter formattedStringForSinglePartRequestResponse:compressed:](self, "formattedStringForSinglePartRequestResponse:compressed:", v4, v5);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v8;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)formattedStringForPBCodableData:(id)a3
{
  return -[GEOLogFormatter formattedStringForSinglePartRequestResponse:compressed:](self, "formattedStringForSinglePartRequestResponse:compressed:", a3, 0);
}

- (id)formattedStringForSinglePartRequestResponse:(id)a3 compressed:(unsigned __int8)a4
{
  int v4;
  id v5;
  _BOOL4 NameAndRemainderAtOffset;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  v4 = a4;
  v5 = a3;
  v15 = 0;
  v16 = 0;
  NameAndRemainderAtOffset = getNameAndRemainderAtOffset(v5, 1uLL, &v16, &v15);
  v7 = v16;
  v8 = v15;
  if (NameAndRemainderAtOffset)
  {
    if (v4)
    {
      v9 = (void *)MEMORY[0x22E2AE334]();
      decompress(v8, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;

        v8 = v12;
      }

      objc_autoreleasePoolPop(v9);
    }
    formattedStringFromProtobuf(v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)formattedStringForMultiPartRequestResponse:(id)a3 compressed:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  Multipart *v8;
  _BOOL4 NameAndRemainderAtOffset;
  id v10;
  id v11;
  id v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") >= 0xC)
  {
    v8 = objc_alloc_init(Multipart);
    objc_msgSend(v6, "getBytes:range:", &v8->identifier, 1, 8);
    objc_msgSend(v6, "getBytes:range:", &v8->partIndex, 9, 1);
    objc_msgSend(v6, "getBytes:range:", &v8->partCount, 10, 1);
    v13 = 0;
    v14 = 0;
    NameAndRemainderAtOffset = getNameAndRemainderAtOffset(v6, 0xBuLL, &v14, &v13);
    v10 = v14;
    v11 = v13;
    v7 = 0;
    if (NameAndRemainderAtOffset)
    {
      -[GEOLogFormatter formattedStringForRequestResponseMultipart:partData:className:compressed:](self, "formattedStringForRequestResponseMultipart:partData:className:compressed:", v8, v11, v10, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)formattedStringForRequestResponseMultipart:(id)a3 partData:(id)a4 className:(id)a5 compressed:(unsigned __int8)a6
{
  int v6;
  unsigned __int8 *v10;
  id v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  int v35;

  v6 = a6;
  v10 = (unsigned __int8 *)a3;
  v11 = a4;
  v12 = a5;
  v13 = v10[17];
  if (v13 > 0x64 || v13 <= v10[16])
  {
    v22 = 0;
  }
  else
  {
    -[GEOLogFormatter requestResponseCollector](self, "requestResponseCollector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v10);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v10[17]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10[17])
    {
      v16 = 0;
      while (1)
      {
        v17 = (void *)objc_msgSend(v10, "copyWithIndex:", v16);
        -[GEOLogFormatter requestResponseCollector](self, "requestResponseCollector");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          break;
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v17);

        ++v16;
        v20 = v10[17];
        if (v20 <= v16)
        {
          v21 = v20 << 15;
          goto LABEL_10;
        }
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%016llx/%u/%u] (waiting for %u)"), *((_QWORD *)v10 + 1), v10[16], v10[17], v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v10[17];
      if (v10[17])
      {
        v35 = v6;
        v24 = 0;
        do
        {
          v25 = (void *)objc_msgSend(v10, "copyWithIndex:", v24);
          objc_msgSend(v15, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOLogFormatter requestResponseCollector](self, "requestResponseCollector");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v25);

          objc_msgSend(v17, "appendData:", v26);
          ++v24;
          v23 = v10[17];
        }
        while (v23 > v24);
        v6 = v35;
      }
      if (v6)
      {
        v28 = (void *)MEMORY[0x22E2AE334]();
        decompress(v17, v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v29;

          v17 = v31;
        }

        objc_autoreleasePoolPop(v28);
        v23 = v10[17];
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%016llx/%u/%u] "), *((_QWORD *)v10 + 1), v10[16], v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      formattedStringFromProtobuf(v12, v17);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAppendingString:", v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v22;
}

- (id)formattedStringForEnumType:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEOLogFormatter formattedStringForEnumType:number:](self, "formattedStringForEnumType:number:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[GEOLogFormatter formattedStringForNumberType:unsignedLongLong:](self, "formattedStringForNumberType:unsignedLongLong:", v6, objc_msgSend(v7, "unsignedLongLongValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formattedStringForEnumType:(id)a3 number:(id)a4
{
  id v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;

  v5 = a4;
  v6 = 0;
  v7 = 1;
  while (1)
  {
    v8 = v7;
    if (StringsCaseInsensitiveEqual(a3, *((void **)&formatters_0 + 2 * v6)))
      break;
    v7 = 0;
    v6 = 1;
    if ((v8 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_6;
    }
  }
  (*((void (**)(void *))&formatters_0 + 2 * v6 + 1))(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (id)formattedStringForNumberType:(id)a3 unsignedLongLong:(unint64_t)a4
{
  return 0;
}

@end
