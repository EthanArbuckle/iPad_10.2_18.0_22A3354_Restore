@implementation SSQueryUnderstandingUtilities

+ (id)queryUnderstandingParseWithQueryUnderstanding:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D8C5F0]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPQUIntentIds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7)
    {
      if (v7 != 1)
        goto LABEL_7;
      v8 = 2;
    }
    else
    {
      v8 = 1;
    }
    objc_msgSend(v4, "setQueryIntentType:", v8);
  }
LABEL_7:
  v18 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgIds"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intValue");
          switch(v16)
          {
            case 0:
              objc_msgSend(v4, "setHasUnspecifiedTokens:", 1);
              break;
            case 1:
              objc_msgSend(v4, "setHasMediaTypeTokens:", 1);
              break;
            case 2:
              objc_msgSend(v4, "setHasPersonTokens:", 1);
              break;
            case 3:
              objc_msgSend(v4, "setHasPersonSenderTokens:", 1);
              break;
            case 4:
            case 6:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
              break;
            case 5:
              objc_msgSend(v4, "setHasNounTokens:", 1);
              break;
            case 7:
              objc_msgSend(v4, "setHasVisualQualityTokens:", 1);
              break;
            case 8:
              objc_msgSend(v4, "setHasTimeTokens:", 1);
              break;
            case 9:
              objc_msgSend(v4, "setHasEventTokens:", 1);
              break;
            case 10:
              objc_msgSend(v4, "setHasLocationTokens:", 1);
              break;
            case 11:
              objc_msgSend(v4, "setHasGenericLocationTokens:", 1);
              break;
            case 12:
              objc_msgSend(v4, "setHasSourceAppTokens:", 1);
              break;
            case 21:
              objc_msgSend(v4, "setHasFavoritedTokens:", 1);
              break;
            default:
              if (v16 == 50)
                objc_msgSend(v4, "setHasSortCriteriaTokens:", 1);
              break;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v4;
}

+ (int)spotlightQueryIntent:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  int v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = +[SSQueryIntent intentStrength:](SSQueryIntent, "intentStrength:", objc_msgSend(v3, "intentType"));
    if (v5 >= 5)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
