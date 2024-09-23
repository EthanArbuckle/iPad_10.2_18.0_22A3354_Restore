@implementation PPSModelURLDecoder

+ (BOOL)isDecodableMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(&unk_251440218, "containsObject:", v5))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("modelURL")))
      {
        objc_msgSend(v4, "subsystem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ANE"));

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)prefixDecodingDictionary
{
  if (prefixDecodingDictionary_onceToken != -1)
    dispatch_once(&prefixDecodingDictionary_onceToken, &__block_literal_global_9);
  return (id)prefixDecodingDictionary_modelURLPrefixDecoder;
}

void __46__PPSModelURLDecoder_prefixDecodingDictionary__block_invoke()
{
  void *v0;

  v0 = (void *)prefixDecodingDictionary_modelURLPrefixDecoder;
  prefixDecodingDictionary_modelURLPrefixDecoder = (uint64_t)&unk_251440230;

}

+ (id)decodeValue:(id)a3 withMetric:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v5, "length") > 1)
    {
      v24 = v6;
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSModelURLDecoder prefixDecodingDictionary](PPSModelURLDecoder, "prefixDecodingDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = v11;
        while (1)
        {
          v15 = v14 - 2;
          v16 = v14 >= 2 ? 2 : v14;
          objc_msgSend(v10, "substringWithRange:", v13, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v17);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
            break;
          v19 = (void *)v18;
          objc_msgSend(v8, "appendString:", v18);

          v13 += 2;
          v14 = v15;
          if (v12 <= v13)
            goto LABEL_13;
        }
        v7 = v5;

        v20 = v23;
        v6 = v24;
      }
      else
      {
LABEL_13:
        v20 = v23;
        if ((unint64_t)objc_msgSend(v23, "count") >= 2)
        {
          objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v10, "length"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v21);

        }
        v7 = v8;
        v6 = v24;
      }

    }
    else
    {
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
