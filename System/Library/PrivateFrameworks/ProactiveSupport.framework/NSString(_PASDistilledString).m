@implementation NSString(_PASDistilledString)

- (id)_pas_distilledString
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  void *v7;
  int v9;
  _BYTE *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  uint64_t v22;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  char *__endptr;

  v1 = a1;
  v2 = objc_msgSend(a1, "length");
  if (!v2)
    goto LABEL_4;
  v3 = v2;
  v1 = objc_retainAutorelease(v1);
  v4 = objc_msgSend(v1, "UTF8String");
  if (!v4)
    goto LABEL_4;
  v5 = (unsigned __int8 *)v4;
  if (*(_BYTE *)(v4 + v3))
    goto LABEL_4;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("0")) & 1) != 0)
    return &unk_1E443F7D0;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v1, "hasPrefix:", CFSTR("+")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("-")) & 1) != 0)
  {
    goto LABEL_54;
  }
  if (v3 <= 0x14)
  {
    v10 = v5 + 1;
    v9 = *v5;
    v11 = v9 == 45;
    if (v9 != 45)
      v10 = v5;
    if (*v10 == 48)
      goto LABEL_33;
    __endptr = 0;
    if (v9 == 45)
    {
      v12 = strtol((const char *)v5, &__endptr, 10);
      if (*__endptr)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v12);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = strtoul((const char *)v5, &__endptr, 10);
      if (*__endptr)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v16);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_5;
  }
  if (v3 != 36)
  {
    v11 = 0;
    goto LABEL_33;
  }
  v13 = 0;
  v11 = 0;
  while (1)
  {
    if (v13 <= 0x24)
    {
      if (((1 << v13) & 0x842100) != 0)
      {
        if (v5[v13] != 45)
          goto LABEL_33;
        v11 = 1;
        goto LABEL_30;
      }
      if (v13 == 36)
        break;
    }
    v14 = (char)v5[v13];
    if ((v14 - 65) >= 6 && (v14 - 48) > 9)
      goto LABEL_33;
LABEL_30:
    ++v13;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v1);
  if (v7)
    return v7;
LABEL_33:
  if (v3 < 9)
    goto LABEL_54;
  if (v11)
    goto LABEL_54;
  if (((char)*v5 - 48) > 9)
    goto LABEL_54;
  v17 = v3 - 1;
  if (((char)v5[v3 - 1] - 48) > 9 || *v5 == 48 && v5[1] != 46 && v5[1])
    goto LABEL_54;
  v18 = (char *)v5;
  while (1)
  {
    v18 = strstr(v18 + 1, ".0");
    if (!v18)
      break;
    if (v18[2] && v18[2] != 46)
      goto LABEL_54;
  }
  if (v3 <= 0xB)
  {
    v19 = v3;
    v20 = v5;
    do
    {
      v21 = *v20++;
      v22 = (1 << v21) & 0x1B400000000000;
      if (v21 > 0x34 || v22 == 0)
        break;
      if (!v17)
        goto LABEL_54;
      --v17;
      --v19;
    }
    while (v19);
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "_pas_fromVersionStringIfPossible:", v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_54:
    if (v3 >= 0xC && (v3 & 3) == 0)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v1, 0);
      v7 = v24;
      if (!v24)
        goto LABEL_71;
      v25 = objc_msgSend(v24, "length");
      v26 = (v25 % 3) ^ 3;
      if (!(v25 % 3))
        v26 = 0;
      if (v5[v3 - 1] == 61)
      {
        if (!v26)
          goto LABEL_71;
        if (v5[v3 - 2] == 61)
        {
          if (v26 < 2)
          {
LABEL_71:

            goto LABEL_4;
          }
        }
        else if (v26 == 2)
        {
          goto LABEL_71;
        }
      }
      else if (v26)
      {
        goto LABEL_71;
      }
      if (v3 != 4 * ((objc_msgSend(v7, "length") + 2) / 3uLL))
        goto LABEL_71;
      return v7;
    }
LABEL_4:
    v6 = objc_msgSend(v1, "copy");
LABEL_5:
    v7 = (void *)v6;
  }
  return v7;
}

- (id)_pas_revivedString
{
  return (id)objc_msgSend(a1, "copy");
}

+ (id)_pas_distilledStringClasses
{
  if (_pas_distilledStringClasses__pasOnceToken2 != -1)
    dispatch_once(&_pas_distilledStringClasses__pasOnceToken2, &__block_literal_global_1580);
  return (id)_pas_distilledStringClasses__pasExprOnceResult;
}

@end
