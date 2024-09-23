@implementation PKAttributedStringByParsingLinksInString

void __PKAttributedStringByParsingLinksInString_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("\\<([\\/A-Za-z0-9]+)(?:\\s*([A-Za-z0-9]+)\\s*\\=\\s*((?:[^\\'\\\"][^\\s\\>]+)|(?:\\\"[^\\\"]+\\\")|(?:\\'[^\\']+\\'))\\s*)*\\s*\\>"), 1, 0);
  v1 = (void *)qword_1ECF21C98;
  qword_1ECF21C98 = v0;

}

void __PKAttributedStringByParsingLinksInString_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a2;
  if (objc_msgSend(v27, "range") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), objc_msgSend(v27, "range") - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setDictionary:", *(_QWORD *)(a1 + 48));
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v4)
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v4, CFSTR("NSLink"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "appendAttributedString:", v5);
    if ((unint64_t)objc_msgSend(v27, "numberOfRanges") < 3
      || (v6 = *(void **)(a1 + 32),
          v7 = objc_msgSend(v27, "rangeAtIndex:", 1),
          objc_msgSend(v6, "compare:options:range:", CFSTR("A"), 1, v7, v8))
      || (v9 = *(void **)(a1 + 32),
          v10 = objc_msgSend(v27, "rangeAtIndex:", 2),
          objc_msgSend(v9, "compare:options:range:", CFSTR("HREF"), 1, v10, v11)))
    {
      v12 = *(void **)(a1 + 32);
      v13 = objc_msgSend(v27, "rangeAtIndex:", 1);
      if (objc_msgSend(v12, "compare:options:range:", CFSTR("/A"), 1, v13, v14))
      {
LABEL_10:
        v17 = objc_msgSend(v27, "range");
        objc_msgSend(v27, "range");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18 + v17;

        goto LABEL_11;
      }
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = 0;
    }
    else
    {
      v19 = objc_msgSend(v27, "rangeAtIndex:", 3);
      v21 = v20;
      v22 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v19);
      if (v22 == 39 || v22 == 34)
      {
        ++v19;
        v21 -= 2;
      }
      v23 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v19, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLWithString:", v16);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

    }
    goto LABEL_10;
  }
LABEL_11:

}

@end
