@implementation SSQueryParserStripKindFromString

void __SSQueryParserStripKindFromString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("kind:")) & 1) == 0)
  {
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kQPKeyword"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = CFSTR("kQPKeyword");
LABEL_7:
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", v12);

        goto LABEL_10;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kQPTopic"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v10 = CFSTR("kQPTopic");
        goto LABEL_7;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kQPKind"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", v8);
  }
LABEL_10:

}

void __SSQueryParserStripKindFromString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", CFSTR("\\s*?"));
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

void __SSQueryParserStripKindFromString_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = objc_msgSend(a2, "range");
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", v6, &stru_1E6E549F0, 0, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"));

}

@end
