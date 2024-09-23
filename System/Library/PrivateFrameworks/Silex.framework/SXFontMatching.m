@implementation SXFontMatching

+ (id)matchFontFaceForAttributes:(id)a3 fromFamily:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  SXFontAttributes *v21;
  void *v22;
  void *v23;
  SXFontAttributes *v24;
  _QWORD v26[5];
  _QWORD v27[5];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  v8 = objc_msgSend(v5, "width");
  objc_msgSend(v6, "fontFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "bestWidthForIntendedWidth:forFonts:", v8, v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "fontFaces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke;
    v27[3] = &__block_descriptor_40_e39_B24__0___SXFontFace__8__NSDictionary_16l;
    v27[4] = v10;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filteredSetUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend((id)objc_opt_class(), "bestStyleForIntendedStyle:forFonts:", objc_msgSend(v5, "style"), v15);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      v17 = v16;
      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke_2;
      v26[3] = &__block_descriptor_40_e39_B24__0___SXFontFace__8__NSDictionary_16l;
      v26[4] = v16;
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "filteredSetUsingPredicate:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend((id)objc_opt_class(), "bestWeightForIntendedWeight:forFonts:", objc_msgSend(v5, "weight"), v19);
      v21 = [SXFontAttributes alloc];
      objc_msgSend(v6, "familyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "grade");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SXFontAttributes initWithFamilyName:weight:width:style:grade:](v21, "initWithFamilyName:weight:width:style:grade:", v22, v20, v10, v17, v23);

      objc_msgSend((id)objc_opt_class(), "fontFaceWithAttributes:fromFamily:", v24, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
    }

  }
  return v11;
}

BOOL __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "fontAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "width") == *(_QWORD *)(a1 + 32);

  return v4;
}

BOOL __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "fontAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style") == *(_QWORD *)(a1 + 32);

  return v4;
}

+ (int64_t)bestWidthForIntendedWidth:(int64_t)a3 forFonts:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "fontAttributes", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "width");

        if (v14 == a3)
        {

          v16 = a3;
          goto LABEL_14;
        }
        objc_msgSend(v12, "fontAttributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addIndex:", objc_msgSend(v15, "width"));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 > 7)
    {
      v16 = objc_msgSend(v6, "indexGreaterThanIndex:", a3);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = objc_msgSend(v6, "indexLessThanIndex:", a3);
        goto LABEL_17;
      }
    }
    else
    {
      v16 = objc_msgSend(v6, "indexLessThanIndex:", a3);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = objc_msgSend(v6, "indexGreaterThanIndex:", a3);
LABEL_17:
        v16 = v17;
      }
    }
  }
LABEL_14:

  return v16;
}

+ (int64_t)bestStyleForIntendedStyle:(int64_t)a3 forFonts:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    v11 = *(_QWORD *)v26;
    obj = v5;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      objc_msgSend(v13, "fontAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "style");

      if (v15 == a3)
      {
        v5 = obj;

        goto LABEL_40;
      }
      if (v8)
      {
        v8 = 1;
        if (!v9)
          goto LABEL_9;
      }
      else
      {
        objc_msgSend(v13, "fontAttributes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v18, "style") == 1;

        if (!v9)
        {
LABEL_9:
          objc_msgSend(v13, "fontAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v16, "style") == 2;

          if (v10)
            goto LABEL_13;
          goto LABEL_10;
        }
      }
      v9 = 1;
      if (v10)
      {
LABEL_13:
        v10 = 1;
        goto LABEL_14;
      }
LABEL_10:
      objc_msgSend(v13, "fontAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "style") == 0;

LABEL_14:
      if (v7 == ++v12)
      {
        v5 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
LABEL_19:

  v19 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10)
    v20 = 0;
  else
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
    v20 = 1;
  if (v10)
    v21 = 0;
  else
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
    v21 = 2;
  v22 = 2;
  if (!v9)
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
    v22 = 1;
  if (!a3)
    v19 = v22;
  if (a3 == 1)
    v19 = v21;
  if (a3 == 2)
    a3 = v20;
  else
    a3 = v19;
LABEL_40:

  return a3;
}

+ (int64_t)bestWeightForIntendedWeight:(int64_t)a3 forFonts:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {
LABEL_9:

    if (a3 == 400)
    {
      v16 = 500;
      if ((objc_msgSend(v6, "containsIndex:", 500) & 1) != 0)
        goto LABEL_23;
    }
    else
    {
      if (a3 == 500)
      {
        v16 = 400;
        if ((objc_msgSend(v6, "containsIndex:", 400) & 1) != 0)
          goto LABEL_23;
        goto LABEL_14;
      }
      if (a3 > 400)
      {
LABEL_14:
        v16 = objc_msgSend(v6, "indexGreaterThanIndex:", a3, (_QWORD)v19);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_23;
        v17 = objc_msgSend(v6, "indexLessThanIndex:", a3);
LABEL_22:
        v16 = v17;
        goto LABEL_23;
      }
    }
    v16 = objc_msgSend(v6, "indexLessThanIndex:", a3, (_QWORD)v19);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_23;
    v17 = objc_msgSend(v6, "indexGreaterThanIndex:", a3);
    goto LABEL_22;
  }
  v9 = v8;
  v10 = *(_QWORD *)v20;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
    objc_msgSend(v12, "fontAttributes", (_QWORD)v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "weight");

    if (v14 == a3)
      break;
    objc_msgSend(v12, "fontAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addIndex:", objc_msgSend(v15, "weight"));

    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        goto LABEL_3;
      goto LABEL_9;
    }
  }

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  v16 = a3;
LABEL_23:

  return v16;
}

+ (int64_t)bolderWeightForWeight:(int64_t)a3
{
  int64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 > 499)
  {
    if (a3 > 699)
    {
      if (a3 != 700 && a3 != 800 && a3 != 900)
        return result;
      return 900;
    }
    if (a3 != 500)
    {
      if (a3 != 600)
        return result;
      return 900;
    }
    return 700;
  }
  if (a3 > 299)
  {
    if (a3 != 300)
    {
      if (a3 != 400)
        return result;
      return 700;
    }
    return 400;
  }
  if (a3 == 100 || a3 == 200)
    return 400;
  return result;
}

+ (int64_t)lighterWeightForWeight:(int64_t)a3
{
  int64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 <= 499)
  {
    if (a3 > 299)
    {
      if (a3 != 300 && a3 != 400)
        return result;
    }
    else if (a3 != 100 && a3 != 200)
    {
      return result;
    }
    return 100;
  }
  if (a3 <= 699)
  {
    if (a3 != 500)
    {
      if (a3 != 600)
        return result;
      return 400;
    }
    return 100;
  }
  if (a3 == 700)
    return 400;
  if (a3 == 800 || a3 == 900)
    return 700;
  return result;
}

+ (id)fontFaceWithAttributes:(id)a3 fromFamily:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a4, "fontFaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    v22 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "fontAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "weight");
        if (v12 != objc_msgSend(v5, "weight"))
          goto LABEL_12;
        objc_msgSend(v10, "fontAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "style");
        if (v14 != objc_msgSend(v5, "style"))
        {

LABEL_12:
          continue;
        }
        objc_msgSend(v10, "fontAttributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "width");
        v17 = v7;
        v18 = v8;
        v19 = objc_msgSend(v5, "width");

        v20 = v16 == v19;
        v8 = v18;
        v7 = v17;
        v6 = v22;
        if (v20)
        {
          v7 = v10;
          goto LABEL_15;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }
LABEL_15:

  return v7;
}

@end
