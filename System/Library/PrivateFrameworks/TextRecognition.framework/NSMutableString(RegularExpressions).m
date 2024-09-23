@implementation NSMutableString(RegularExpressions)

- (id)applyRegex:()RegularExpressions withReplacementTemplate:
{
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  void *v25;
  void *v27;
  id obj;
  id v29;
  uint64_t v30;
  void (**v31)(id, void *);
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v31 = a4;
  v27 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "length"));
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v8);

      ++v7;
    }
    while (objc_msgSend(v6, "length") > v7);
  }
  objc_msgSend(v29, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v32)
  {
    v9 = 0;
    v30 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v31[2](v31, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v34 = i;
          v13 = objc_msgSend(v11, "range");
          v15 = v14;
          v38 = v11;
          v33 = v12;
          objc_msgSend(v29, "replacementStringForResult:inString:offset:template:", v11, v6, v9, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v9;
          v17 = v13 + v9;
          if (v15 != objc_msgSend(v16, "length") && objc_msgSend(v16, "length") | v15)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v36 = v15;
            while (1)
            {
              if (objc_msgSend(v16, "length") > v19 && v18 + v17 < (unint64_t)objc_msgSend(v6, "length"))
              {
                v37 = v20;
                v23 = objc_msgSend(v16, "characterAtIndex:", v19);
                v24 = v23 == objc_msgSend(v6, "characterAtIndex:", v18 + v17);
                v15 = v36;
                v20 = v37;
                if (v24)
                  goto LABEL_20;
              }
              if (objc_msgSend(v16, "length") - v19 <= v15 - v18)
                break;
              objc_msgSend(v39, "objectAtIndexedSubscript:", objc_msgSend(v38, "range") + v18);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "insertObject:atIndex:", v25, v18 + v17 + v20);

LABEL_21:
              ++v21;
LABEL_22:
              v19 = v21;
              v18 = v22;
              if (objc_msgSend(v16, "length") <= (unint64_t)v21 && v15 <= v22)
                goto LABEL_24;
            }
            if (objc_msgSend(v16, "length") - v19 < v15 - v18)
            {
              objc_msgSend(v39, "removeObjectAtIndex:", v18 + v17 + v20--);
              ++v22;
              goto LABEL_22;
            }
LABEL_20:
            ++v22;
            goto LABEL_21;
          }
LABEL_24:
          objc_msgSend(v6, "replaceCharactersInRange:withString:", v17, v15, v16);
          v9 = v35 - v15 + objc_msgSend(v16, "length");

          v12 = v33;
          i = v34;
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v32);
  }
  objc_msgSend(v27, "replaceCharactersInRange:withString:", 0, objc_msgSend(v27, "length"), v6);

  return v39;
}

@end
