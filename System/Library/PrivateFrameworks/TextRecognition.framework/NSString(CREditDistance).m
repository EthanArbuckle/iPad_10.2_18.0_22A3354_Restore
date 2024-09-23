@implementation NSString(CREditDistance)

- (uint64_t)editDistanceFromString:()CREditDistance
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "editDistance:string:threshold:", a1, a3, 0x7FFFFFFFLL);
}

+ (uint64_t)editDistance:()CREditDistance string:
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "editDistance:string:threshold:", a3, a4, 0x7FFFFFFFLL);
}

- (uint64_t)editDistanceFromString:()CREditDistance threshold:
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "editDistance:string:threshold:", a1, a3, a4);
}

- (uint64_t)editDistanceFromStringIgnoringSpaces:()CREditDistance threshold:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "editDistance:string:threshold:", v8, v9, a4);
  return v10;
}

+ (uint64_t)editDistance:()CREditDistance string:threshold:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;

  v37 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = v6;
  v8 = objc_msgSend(v6, "length");
  v9 = objc_msgSend(v7, "length");
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      if ((objc_msgSend(v38, "isEqualToString:", v7) & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v11 = objc_msgSend(v7, "length");
        v36 = (uint64_t)&v36;
        MEMORY[0x1E0C80A78](v11);
        v13 = (char *)&v36 - v12;
        v14 = objc_msgSend(v7, "length");
        MEMORY[0x1E0C80A78](v14);
        v16 = (uint64_t *)((char *)&v36 - v15);
        bzero(v13, (8 * objc_msgSend(v7, "length")) | 1);
        bzero(v16, (8 * objc_msgSend(v7, "length")) | 1);
        if (objc_msgSend(v7, "length") != -1)
        {
          v17 = 0;
          do
          {
            *(_QWORD *)&v13[8 * v17] = v17;
            ++v17;
          }
          while (v17 < objc_msgSend(v7, "length") + 1);
        }
        v18 = v38;
        v19 = objc_msgSend(v38, "length");
        MEMORY[0x1E0C80A78](v19);
        v21 = (char *)&v36 - v20;
        v22 = objc_msgSend(v7, "length");
        MEMORY[0x1E0C80A78](v22);
        v24 = (char *)&v36 - v23;
        objc_msgSend(v18, "getCharacters:range:", v21, 0, objc_msgSend(v18, "length"));
        objc_msgSend(v7, "getCharacters:range:", v24, 0, objc_msgSend(v7, "length"));
        v25 = 0;
        v10 = 0x7FFFFFFFLL;
        while (1)
        {
          v26 = (char *)v16;
          if (v25 >= objc_msgSend(v38, "length"))
            break;
          *v16 = v25 + 1;
          if (objc_msgSend(v7, "length"))
          {
            v27 = 0;
            v28 = 0x7FFFFFFFLL;
            do
            {
              v29 = *(unsigned __int16 *)&v24[2 * v27];
              v30 = &v16[v27];
              v31 = *v30 + 1;
              v32 = *(_QWORD *)&v13[8 * v27];
              v33 = *(_QWORD *)&v13[8 * v27 + 8];
              if (v31 >= v33 + 1)
                v31 = v33 + 1;
              ++v27;
              if (*(unsigned __int16 *)&v21[2 * v25] == v29)
                v34 = v32;
              else
                v34 = v32 + 1;
              if (v31 < v34)
                v34 = v31;
              if (v28 >= v34)
                v28 = v34;
              v30[1] = v34;
            }
            while (v27 < objc_msgSend(v7, "length"));
          }
          else
          {
            v28 = 0x7FFFFFFFLL;
          }
          ++v25;
          v16 = v13;
          v13 = v26;
          if (v28 > v37)
            goto LABEL_28;
        }
        v10 = *(_QWORD *)&v13[8 * objc_msgSend(v7, "length")];
      }
    }
    else
    {
      v10 = objc_msgSend(v38, "length");
    }
  }
LABEL_28:

  return v10;
}

@end
