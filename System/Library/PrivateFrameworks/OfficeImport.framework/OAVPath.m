@implementation OAVPath

+ (void)readPath:(id)a3 toGeometry:(id)a4
{
  id v6;
  id v7;
  id v8;
  char *v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  char v18;
  int v19;
  char v20;
  char *i;
  unsigned int v22;
  unsigned int v24;
  unsigned int v26;
  int v27;
  unsigned int v29;
  int v30;
  uint64_t v31;
  char *v32;
  void (**v33)();
  void *__p;
  void *v35;
  uint64_t v36;
  void (**v37)();
  void *v38;
  void *v39;
  uint64_t v40;

  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = 0;
  v37 = (void (**)())&off_24F39D6E0;
  v38 = 0;
  v35 = 0;
  v36 = 0;
  v33 = (void (**)())&off_24F39D578;
  __p = 0;
  objc_msgSend(v6, "uppercaseString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v8, "UTF8String");

  v10 = 0;
  v32 = v9;
  v11 = MEMORY[0x24BDAC740];
  while (1)
  {
    while (1)
    {
      v12 = *v9;
      if (!((v12 & 0x80000000) != 0 ? __maskrune(v12, 0x4000uLL) : *(_DWORD *)(v11 + 4 * v12 + 60) & 0x4000))
        break;
      v9 = ++v32;
    }
    if (!*v32)
      break;
    v14 = objc_msgSend(a1, "parseCommand:", &v32);
    v15 = v14;
    if (v14 == -1)
      break;
    v16 = EshPathCommand::paramsPerCommand(v14);
    v17 = 1;
    v18 = 1;
    while (1)
    {
      if (v16 >= 1)
      {
        LOWORD(v19) = 0;
        v20 = v18;
        do
        {
          objc_msgSend(a1, "parseParam:first:", &v32, v20 & 1);
          EshBasicTablePropVal<EshComputedValue>::append(&v33, &v31);
          v18 = 0;
          v20 = 0;
          v19 = (__int16)(v19 + 1);
        }
        while (v19 < v16);
      }
      for (i = v32; ; i = ++v32)
      {
        v22 = *i;
        if (!((v22 & 0x80000000) != 0 ? __maskrune(v22, 0x4000uLL) : *(_DWORD *)(v11 + 4 * v22 + 60) & 0x4000))
          break;
      }
      v24 = *v32;
      if ((v24 & 0x80000000) != 0 ? __maskrune(v24, 0x100uLL) : *(_DWORD *)(v11 + 4 * v24 + 60) & 0x100)
        break;
      v26 = *v32;
      if (!*v32)
        break;
      v27 = (v26 & 0x80000000) != 0 ? __maskrune(v26, 0x4000uLL) : *(_DWORD *)(v11 + 4 * v26 + 60) & 0x4000;
      if (!v27 && v16 == 0)
      {
        v29 = *v32;
        v30 = (v29 & 0x80000000) != 0 ? __maskrune(v29, 0x100uLL) : *(_DWORD *)(v11 + 4 * v29 + 60) & 0x100;
        if (!v30 && *v32)
          break;
      }
      ++v17;
    }
    LOWORD(v31) = v17;
    HIDWORD(v31) = v15;
    EshBasicTablePropVal<EshComputedValue>::append(&v37, &v31);
    v10 = 1;
    v9 = v32;
  }
  if ((v10 & 1) != 0)
    +[OABShapeGeometry readFromPathCommands:pathParams:toGeometry:](OABShapeGeometry, "readFromPathCommands:pathParams:toGeometry:", &v37, &v33, v7);
  v33 = off_24F39D608;
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  v37 = off_24F39D748;
  if (v38)
  {
    v39 = v38;
    operator delete(v38);
  }

}

+ (int)parseCommand:(const char *)a3
{
  unsigned int v4;
  const char *v5;
  int result;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;

  v4 = **a3;
  if ((v4 & 0x80000000) != 0)
  {
    if (!__maskrune(v4, 0x100uLL))
      return -1;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v4 + 60) & 0x100) == 0)
  {
    return -1;
  }
  v5 = (*a3)++;
  result = 0;
  switch(*v5)
  {
    case 'A':
      *a3 = v5 + 2;
      v7 = v5[1];
      if (v7 > 81)
      {
        if (v7 == 82)
        {
          return 9;
        }
        else
        {
          if (v7 != 84)
            return -1;
          return 8;
        }
      }
      else if (v7 == 69)
      {
        return 6;
      }
      else
      {
        if (v7 != 76)
          return -1;
        return 7;
      }
    case 'C':
      return 1;
    case 'E':
      return 4;
    case 'H':
      *a3 = v5 + 2;
      v8 = v5[1];
      if ((v8 - 65) >= 9)
        return -1;
      return v8 - 48;
    case 'L':
      return result;
    case 'M':
      return 2;
    case 'N':
      *a3 = v5 + 2;
      v9 = *((unsigned __int8 *)v5 + 1);
      if (v9 == 83)
        v10 = 16;
      else
        v10 = -1;
      v11 = v9 == 70;
      v12 = 15;
      goto LABEL_28;
    case 'Q':
      *a3 = v5 + 2;
      v13 = v5[1];
      switch(v13)
      {
        case 'B':
          result = 14;
          break;
        case 'X':
          result = 12;
          break;
        case 'Y':
          result = 13;
          break;
        default:
          return -1;
      }
      break;
    case 'R':
      return 29;
    case 'T':
      return 28;
    case 'V':
      return 30;
    case 'W':
      *a3 = v5 + 2;
      v14 = *((unsigned __int8 *)v5 + 1);
      if (v14 == 82)
        v10 = 11;
      else
        v10 = -1;
      v11 = v14 == 65;
      v12 = 10;
LABEL_28:
      if (v11)
        return v12;
      else
        return v10;
    case 'X':
      return 3;
    default:
      return -1;
  }
  return result;
}

+ (EshComputedValue)parseParam:(const char *)a3 first:(BOOL)a4
{
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  const char *v15;
  EshComputedValue v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  unsigned __int8 v20;
  int v21;

  v7 = v4;
  v8 = *a3;
  v9 = MEMORY[0x24BDAC740];
  if (a4)
    goto LABEL_9;
  while (1)
  {
    v10 = *v8;
    v11 = (v10 & 0x80000000) != 0 ? __maskrune(v10, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v10 + 60) & 0x4000;
    v8 = *a3;
    if (!v11)
      break;
    *a3 = ++v8;
  }
  if (*v8 != 44)
  {
LABEL_9:
    v12 = 0;
  }
  else
  {
    *a3 = ++v8;
    v12 = 1;
  }
  while (1)
  {
    v13 = *v8;
    v14 = (v13 & 0x80000000) != 0 ? __maskrune(v13, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v13 + 60) & 0x4000;
    v15 = *a3;
    if (!v14)
      break;
    v8 = v15 + 1;
    *a3 = v8;
  }
  v16 = (EshComputedValue)*v15;
  if (*(_DWORD *)&v16.var0 == 44)
    goto LABEL_32;
  if ((*(_DWORD *)&v16.var0 & 0x80000000) != 0)
  {
    v16 = (EshComputedValue)__maskrune(*(__darwin_ct_rune_t *)&v16.var0, 0x100uLL);
    if (*(_DWORD *)&v16.var0)
      goto LABEL_31;
  }
  else
  {
    v16 = (EshComputedValue)(*(_DWORD *)(v9 + 4 * *(unsigned int *)&v16.var0 + 60) & 0x100);
    if (*(_DWORD *)&v16.var0)
      goto LABEL_31;
  }
  v17 = *a3;
  v18 = *(unsigned __int8 *)*a3;
  if (!**a3)
  {
LABEL_31:
    if (!v12)
      return (EshComputedValue)objc_msgSend(a1, "noneParam");
LABEL_32:
    *(_BYTE *)v7 = 0;
    *(_DWORD *)(v7 + 4) = 0;
    return v16;
  }
  if (((v18 & 0x80) != 0 || (*(_DWORD *)(v9 + 4 * v18 + 60) & 0x400) == 0) && (_DWORD)v18 != 64 && (_DWORD)v18 != 45)
    return (EshComputedValue)objc_msgSend(a1, "noneParam");
  if ((_DWORD)v18 == 64)
    *a3 = ++v17;
  v16 = (EshComputedValue)atol(v17);
  v19 = v17 + 1;
  do
  {
    *a3 = v19;
    v21 = *v19++;
    v20 = v21;
  }
  while ((v21 & 0x80000000) == 0 && (*(_DWORD *)(v9 + 4 * v20 + 60) & 0x400) != 0);
  *(_BYTE *)v7 = (_DWORD)v18 == 64;
  *(_DWORD *)(v7 + 4) = *(_DWORD *)&v16.var0;
  return v16;
}

+ (EshComputedValue)noneParam
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = v2;
  if (+[OAVPath noneParam]::once != -1)
    dispatch_once(&+[OAVPath noneParam]::once, &__block_literal_global_65);
  *v3 = *(_QWORD *)+[OAVPath noneParam]::param;
  return (EshComputedValue)a1;
}

uint64_t __20__OAVPath_noneParam__block_invoke()
{
  uint64_t result;

  result = operator new();
  *(_BYTE *)result = 1;
  *(_DWORD *)(result + 4) = -1;
  +[OAVPath noneParam]::param = result;
  return result;
}

+ (void)writePath:(id)a3 toString:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  __CFString *v23;
  const __CFString *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  __CFString *v49;
  const __CFString *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  const __CFString *v54;
  const __CFString *v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;

  v59 = a3;
  v5 = a4;
  v6 = objc_msgSend(v59, "elementCount");
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    v57 = v6;
    v58 = v5;
    while (1)
    {
      objc_msgSend(v59, "elementAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v5, "appendString:", CFSTR("X"));
LABEL_57:
      objc_msgSend(v5, "appendString:", CFSTR(" "));

      if (v7 == ++v8)
        goto LABEL_71;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "toPoint");
      v12 = v11;
      v13 = objc_msgSend(v9, "relative");
      v14 = CFSTR("M");
      if (v13)
        v14 = CFSTR("T");
      v15 = v14;
      if ((v10 & 1) != 0)
        v16 = CFSTR("@");
      else
        v16 = &stru_24F3BFFF8;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v16, HIDWORD(v10));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD17C8];
      if ((v12 & 1) != 0)
        v19 = CFSTR("@");
      else
        v19 = &stru_24F3BFFF8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = objc_msgSend(v9, "toPoint");
        v12 = v21;
        v22 = objc_msgSend(v9, "relative");
        v23 = CFSTR("L");
        if (v22)
          v23 = CFSTR("R");
        v15 = v23;
        if ((v20 & 1) != 0)
          v24 = CFSTR("@");
        else
          v24 = &stru_24F3BFFF8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v24, HIDWORD(v20));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD17C8];
        if ((v12 & 1) != 0)
          v19 = CFSTR("@");
        else
          v19 = &stru_24F3BFFF8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = objc_msgSend(v9, "controlPoint1");
          v27 = v26;
          v28 = objc_msgSend(v9, "controlPoint2");
          v30 = v29;
          v31 = objc_msgSend(v9, "toPoint");
          v56 = v32;
          v33 = objc_msgSend(v9, "relative");
          v34 = CFSTR("C");
          if (v33)
            v34 = CFSTR("V");
          v15 = v34;
          if ((v25 & 1) != 0)
            v35 = CFSTR("@");
          else
            v35 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v35, HIDWORD(v25));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v27 & 1) != 0)
            v36 = CFSTR("@");
          else
            v36 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v36, HIDWORD(v27));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v28 & 1) != 0)
            v38 = CFSTR("@");
          else
            v38 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v38, HIDWORD(v28));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v30 & 1) != 0)
            v40 = CFSTR("@");
          else
            v40 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v40, HIDWORD(v30));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v31 & 1) != 0)
            v42 = CFSTR("@");
          else
            v42 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v42, HIDWORD(v31));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v56 & 1) != 0)
            v44 = CFSTR("@");
          else
            v44 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v44, HIDWORD(v56));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "appendFormat:", CFSTR("%@ %@,%@ %@,%@ %@,%@"), v15, v17, v37, v39, v41, v43, v45);

          goto LABEL_55;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_57;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                objc_opt_isKindOfClass();
              }
            }
            goto LABEL_57;
          }
          v51 = objc_msgSend(v9, "controlPoint");
          v53 = v52;
          if ((v51 & 1) != 0)
            v54 = CFSTR("@");
          else
            v54 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v54, HIDWORD(v51));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ((v53 & 1) != 0)
            v55 = CFSTR("@");
          else
            v55 = &stru_24F3BFFF8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v55, HIDWORD(v53));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "appendFormat:", CFSTR("QB %@,%@"), v15, v17);
          goto LABEL_56;
        }
        v46 = objc_msgSend(v9, "toPoint");
        v12 = v47;
        v48 = objc_msgSend(v9, "startsVertical");
        v49 = CFSTR("QX");
        if (v48)
          v49 = CFSTR("QY");
        v15 = v49;
        if ((v46 & 1) != 0)
          v50 = CFSTR("@");
        else
          v50 = &stru_24F3BFFF8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), v50, HIDWORD(v46));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD17C8];
        if ((v12 & 1) != 0)
          v19 = CFSTR("@");
        else
          v19 = &stru_24F3BFFF8;
      }
    }
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%d"), v19, HIDWORD(v12));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "appendFormat:", CFSTR("%@ %@,%@"), v15, v17, v37);
LABEL_55:

LABEL_56:
    v7 = v57;
    v5 = v58;
    goto LABEL_57;
  }
LABEL_71:
  if ((objc_msgSend(v59, "stroked") & 1) == 0)
    objc_msgSend(v5, "appendString:", CFSTR("NS "));
  if (!objc_msgSend(v59, "fillMode"))
    objc_msgSend(v5, "appendString:", CFSTR("NF "));
  objc_msgSend(v5, "appendString:", CFSTR("E"));

}

@end
