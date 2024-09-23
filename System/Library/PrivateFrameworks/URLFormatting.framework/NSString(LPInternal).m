@implementation NSString(LPInternal)

- (BOOL)_lp_hasCaseInsensitiveSubstring:()LPInternal startingAt:
{
  id v6;
  _BOOL8 v7;

  v6 = a3;
  if (v6)
    v7 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 9, a4, objc_msgSend(a1, "length") - a4) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 0;

  return v7;
}

+ (void)_lp_reverseEnumerateComponents:()LPInternal usingBlock:
{
  id v5;
  void (**v6)(id, void *, uint64_t, char *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = v5;
  objc_msgSend(v5, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v7);
      v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if (v10)
      {
        objc_msgSend(v10, "insertString:atIndex:", CFSTR("."), 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "insertString:atIndex:", v13, 0);
      v6[2](v6, v10, v9 + v12, &v19);
      if (v19)
        break;
      if (v8 == ++v12)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        v9 += v12;
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }

}

- (id)_lp_highLevelDomainFromComponents:()LPInternal indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __131__NSString_LPInternal___lp_highLevelDomainFromComponents_indexOfFirstHighLevelDomainComponent_indexOfFirstTopLevelDomainComponent___block_invoke;
  v14[3] = &unk_24C0A2440;
  v14[6] = a4;
  v14[7] = v9;
  v14[8] = a5;
  v14[4] = &v15;
  v14[5] = &v21;
  objc_msgSend(v10, "_lp_reverseEnumerateComponents:usingBlock:", v8, v14);
  if (*((_BYTE *)v22 + 24))
  {
    v11 = objc_msgSend((id)v16[5], "length");
    if (v11 != objc_msgSend(a1, "length"))
      a1 = (void *)v16[5];
    v12 = a1;
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (uint64_t)_lp_lengthOfDeepSubdomainsFromComponents:()LPInternal
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  unint64_t v12;

  v4 = a3;
  v12 = 0;
  objc_msgSend(a1, "_lp_highLevelDomainFromComponents:indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:", v4, &v12, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v5 && v12 >= 2)
  {
    v7 = 0;
    v6 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 += objc_msgSend(v9, "length") + 1;

      v7 = v8;
    }
    while (v12 - 1 > v8++);
  }

  return v6;
}

- (id)_lp_simplifiedUserVisibleURLStringWithSimplifications:()LPInternal forDisplayOnly:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v53;
  id v54;

  v5 = a1;
  v6 = (id)objc_msgSend(v5, "copy");
  v8 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("://"), 2);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  v10 = v7;
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "invertedSet");
    hostAndPortRangeFromUserTypedString(NSString *)::nonSchemeCharacters = objc_claimAutoreleasedReturnValue();

  }
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", hostAndPortRangeFromUserTypedString(NSString *)::nonSchemeCharacters, 2, 0, v8) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    v16 = 0;
  }
  else
  {
    v11 = objc_msgSend(v6, "length");
    {
      v12 = hostAndPortRangeFromUserTypedString(NSString *)::hostTerminators;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/?#"));
      v12 = objc_claimAutoreleasedReturnValue();
      hostAndPortRangeFromUserTypedString(NSString *)::hostTerminators = v12;
    }
    v9 = v8 + v10;
    v13 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v12, 2, v8 + v10, v11 - (v8 + v10));
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      v11 = v13;
    v14 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("@"), 6, v8 + v10, v11 - v9);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      v9 = v14 + v15;
    v16 = v11 - v9;
  }

  v17 = objc_msgSend(v6, "_lp_hasCaseInsensitivePrefix:", CFSTR("http://"));
  v19 = objc_msgSend(v6, "_lp_hasCaseInsensitivePrefix:", CFSTR("https://"));
  v20 = v17 | v19;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v20 & (a3 >> 5)) == 1)
    {
      v21 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR(":"), 4, v9, v16);
      v22 = v21;
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = v9 + v16 - v21;
        if (objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("]"), 0, v21, v23) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v22, v9 + v16 - v22, &stru_24C0A25C8);
          v24 = objc_claimAutoreleasedReturnValue();

          v16 -= v23;
          v6 = (id)v24;
        }
      }
    }
    if ((v20 & (a3 >> 4)) == 1)
    {
      objc_msgSend(v6, "substringToIndex:", v16 + v9);
      v25 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v25;
    }
    if ((a3 & 0x400) != 0)
    {
      v18 = objc_msgSend(v6, "rangeOfString:", CFSTR("#"));
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "substringToIndex:", v18);
        v26 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v26;
      }
    }
    if ((a3 & 4) != 0)
    {
      v54 = v5;
      v27 = objc_msgSend(v6, "rangeOfString:", CFSTR("#"));
      if (v27 == objc_msgSend(v6, "length") - 1)
      {
        objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
        v28 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v28;
      }
      v6 = v6;
      v29 = objc_msgSend(v6, "rangeOfString:", CFSTR("#"));
      v30 = v6;
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "substringToIndex:", v29);
        v31 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v31;
      }
      if (objc_msgSend(v30, "hasSuffix:", CFSTR("?")))
      {
        objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v30, "length") - 1, 1, &stru_24C0A25C8);
        v32 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v32;
      }
      objc_msgSend(v6, "substringFromIndex:", v16 + v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v33, "hasPrefix:", CFSTR("/#")) & 1) != 0
        || (objc_msgSend(v33, "hasPrefix:", CFSTR("/?")) & 1) != 0
        || objc_msgSend(v33, "isEqualToString:", CFSTR("/")))
      {
        objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v16 + v9, 1, &stru_24C0A25C8);
        v34 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v34;
      }

      v5 = v54;
    }
  }
  if ((a3 & v17) == 1)
  {
    if (((v9 != 0x7FFFFFFFFFFFFFFFLL) & (a3 >> 7) & v20) != 0)
      v35 = v9;
    else
      v35 = 7;
  }
  else
  {
    v40 = 8;
    if (!v19)
      v40 = 0;
    v41 = (4 * a3) & v40;
    v42 = v19 ^ 1;
    if ((a3 & 2) == 0)
      v42 = 1;
    v43 = (v9 != 0x7FFFFFFFFFFFFFFFLL) & (a3 >> 7) & v20;
    if (v43)
      v35 = v9;
    else
      v35 = v41;
    if (v43 == 1 && v42)
    {
      v44 = objc_msgSend(v6, "rangeOfString:", CFSTR("://"));
      v18 = v44 + v45;
      if (v9 == v44 + v45)
      {
        v35 = 0;
      }
      else
      {
        objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v18, v9 - (v44 + v45), &stru_24C0A25C8);
        v48 = objc_claimAutoreleasedReturnValue();

        v35 = 0;
        v6 = (id)v48;
      }
    }
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v36 = 0;
  else
    v36 = v20;
  if ((a3 & 0x348) != 0 && v36)
  {
    objc_msgSend(v6, "substringWithRange:", v9, v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "componentsSeparatedByString:", CFSTR("."));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 0x100) != 0)
    {
      v39 = objc_msgSend(v37, "_lp_lengthOfDeepSubdomainsFromComponents:", v38);
      if ((a3 & 8) == 0)
        goto LABEL_61;
    }
    else
    {
      v39 = 0;
      if ((a3 & 8) == 0)
        goto LABEL_61;
    }
    if (objc_msgSend(v37, "_lp_hasCaseInsensitiveSubstring:startingAt:", CFSTR("www."), v39))
    {
      v39 += 4;
LABEL_67:
      if (v39)
      {
        objc_msgSend(v37, "_lp_highLevelDomainFromHost");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v37, "isEqualToString:", v46);

        if ((v47 & 1) == 0)
        {
          if (v35 && v9 == v35)
          {
            v35 = v39 + v9;
          }
          else
          {
            objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v9, v39, &stru_24C0A25C8);
            v49 = objc_claimAutoreleasedReturnValue();

            v6 = (id)v49;
          }
        }
      }

      goto LABEL_75;
    }
LABEL_61:
    if ((a3 & 0x40) != 0
      && objc_msgSend(v37, "_lp_hasCaseInsensitiveSubstring:startingAt:", CFSTR("m."), v39))
    {
      v39 += 2;
    }
    else if ((a3 & 0x200) != 0
           && objc_msgSend(v37, "_lp_hasCaseInsensitiveSubstring:startingAt:", CFSTR("mobile."), v39))
    {
      v39 += 7;
    }
    goto LABEL_67;
  }
LABEL_75:
  if (v35)
  {
    objc_msgSend(v6, "substringFromIndex:", v35);
    v50 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v50;
  }
  if (a4)
  {
    objc_msgSend(v6, "_lp_stringForcingLeftToRightDirection", v18);
    v51 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v51;
  }

  return v6;
}

@end
