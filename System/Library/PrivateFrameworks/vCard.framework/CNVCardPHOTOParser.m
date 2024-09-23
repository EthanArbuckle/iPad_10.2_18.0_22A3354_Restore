@implementation CNVCardPHOTOParser

+ (void)parseBase64:(BOOL)a3 parser:(id)a4 callback:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, id, const __CFString *, void *, void *);
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  id v22;

  v6 = a3;
  v22 = a4;
  v8 = (void (**)(id, id, const __CFString *, void *, void *))a5;
  objc_msgSend(a1, "parseClipRectsWithParser:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "parameterValuesForName:", CFSTR("VALUE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6 & ~objc_msgSend(v10, "_cn_any:", &__block_literal_global_1);
  objc_msgSend(v22, "parameterValuesForName:", CFSTR("VND-63-MEMOJI-DETAILS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithBase64EncodedString:options:", v15, 0);

  }
  v16 = v22;
  if (v11 && (objc_msgSend(v22, "parseBase64Data"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v16 = v22, v17))
  {
    objc_msgSend(v17, "_cn_decodeBase64IgnoringWhitespace");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v18, &stru_1E95708D8, v9, v13);
  }
  else
  {
    objc_msgSend(v16, "parseRemainingLine");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = &stru_1E95708D8;
    if (v19)
      v21 = (__CFString *)v19;
    v18 = v21;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v17, v18, v9, v13);
  }

}

+ (id)parseClipRectsWithParser:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "parameterValuesForName:", CFSTR("X-ABCROP-RECTANGLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CNVCardPHOTOParser_parseClipRectsWithParser___block_invoke;
  v7[3] = &__block_descriptor_40_e32___NSDictionary_16__0__NSString_8l;
  v7[4] = a1;
  objc_msgSend(v4, "_cn_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __47__CNVCardPHOTOParser_parseClipRectsWithParser___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clipRectInfoFromString:", a2);
}

+ (id)clipRectInfoFromString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 6)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v3, "objectAtIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v3, "objectAtIndex:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    objc_msgSend(v3, "objectAtIndex:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", (double)v7, (double)v9, (double)v11, (double)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_cn_decodeBase64");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    if (v5)
    {
      if (v14)
        v18 = v17 == 0;
      else
        v18 = 1;
      if (!v18)
      {
        v20[0] = CFSTR("kABImageInfoImageTypeKey");
        v20[1] = CFSTR("kABImageInfoClipRectKey");
        v21[0] = v5;
        v21[1] = v14;
        v20[2] = CFSTR("kABImageInfoHashKey");
        v21[2] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
