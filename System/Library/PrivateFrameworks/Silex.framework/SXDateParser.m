@implementation SXDateParser

- (id)dateFromString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  SXParsedDate *v10;
  SXParsedDate *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([0-9]{4})-([01][0-9])-([0-3][0-9])(T([0-2][0-9]):([0-5][0-9]):([0-5][0-9])(Z|([+-])([0-2][0-9]):([0-9][0-9]))?)?"), 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    v6 = objc_alloc(MEMORY[0x24BDBCE48]);
    v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v5, "setCalendar:", v7);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v25 = 0;
    v8 = objc_msgSend(v3, "length");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __31__SXDateParser_dateFromString___block_invoke;
    v14[3] = &unk_24D68CE60;
    v15 = v3;
    v17 = &v30;
    v18 = &v20;
    v19 = &v26;
    v9 = v5;
    v16 = v9;
    objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:", v15, 2, 0, v8, v14);
    if (objc_msgSend(v9, "day") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v9, "month") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v9, "year") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v9, "setTimeZone:", v31[5]);
      v12 = [SXParsedDate alloc];
      objc_msgSend(v9, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SXParsedDate initWithDate:containedTime:timeZone:](v12, "initWithDate:containedTime:timeZone:", v13, *((unsigned __int8 *)v27 + 24), v21[5]);

    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __31__SXDateParser_dateFromString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;

  v29 = a2;
  if ((unint64_t)objc_msgSend(v29, "numberOfRanges") >= 2)
  {
    v3 = 1;
    while (1)
    {
      v4 = objc_msgSend(v29, "rangeAtIndex:", v3);
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_38;
      v6 = v5;
      if (!v5)
        goto LABEL_38;
      v7 = v4;
      if (v4 + v5 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
        goto LABEL_38;
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v3 == 9)
        break;
      if (v3 == 8)
      {
        objc_msgSend(v8, "uppercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Z"));

        if (!v11)
          goto LABEL_22;
        v12 = (void *)MEMORY[0x24BDBCF38];
        v13 = 0;
LABEL_18:
        objc_msgSend(v12, "timeZoneForSecondsFromGMT:", v13);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        goto LABEL_37;
      }
      if (v3 != 4 || !v8)
      {
LABEL_22:
        v28 = objc_msgSend(v9, "integerValue");
        if (v3 == 1 && v28)
        {
          objc_msgSend(*(id *)(a1 + 40), "setYear:", v28);
        }
        else if (v3 == 2 && v28)
        {
          objc_msgSend(*(id *)(a1 + 40), "setMonth:", v28);
        }
        else if (v3 == 3 && v28)
        {
          objc_msgSend(*(id *)(a1 + 40), "setDay:", v28);
        }
        else
        {
          switch(v3)
          {
            case 7:
              objc_msgSend(*(id *)(a1 + 40), "setSecond:", v28);
              break;
            case 6:
              objc_msgSend(*(id *)(a1 + 40), "setMinute:", v28);
              break;
            case 5:
              objc_msgSend(*(id *)(a1 + 40), "setHour:", v28);
              break;
          }
        }
        goto LABEL_37;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_37:

LABEL_38:
      if (++v3 >= (unint64_t)objc_msgSend(v29, "numberOfRanges"))
        goto LABEL_39;
    }
    v14 = objc_msgSend(v29, "rangeAtIndex:", 10);
    v16 = v15;
    v17 = objc_msgSend(v29, "rangeAtIndex:", 11);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_37;
    if (!v16)
      goto LABEL_37;
    v19 = v17;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_37;
    v20 = v18;
    if (!v18)
      goto LABEL_37;
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("-")))
      v13 = -60 * (v24 + 60 * v22);
    else
      v13 = 60 * (v24 + 60 * v22);
    v12 = (void *)MEMORY[0x24BDBCF38];
    goto LABEL_18;
  }
LABEL_39:

}

@end
