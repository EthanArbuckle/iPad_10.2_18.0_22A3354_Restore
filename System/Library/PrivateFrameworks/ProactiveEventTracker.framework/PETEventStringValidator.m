@implementation PETEventStringValidator

+ (id)sanitizedString:(id)a3
{
  __CFString *v3;
  size_t v4;
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  UniChar v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  id v22;
  __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CFStringRef theString;
  const UniChar *v34;
  const char *v35;
  uint64_t v36;
  int64_t v37;
  int64_t v38;
  int64_t v39;
  CFRange v40;

  v3 = (__CFString *)a3;
  v4 = -[__CFString length](v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL);
    if (v6)
    {
      v7 = v6;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      theString = v3;
      v36 = 0;
      v37 = v5;
      CharactersPtr = CFStringGetCharactersPtr(v3);
      CStringPtr = 0;
      v34 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v38 = 0;
      v39 = 0;
      v13 = 64;
      v35 = CStringPtr;
      do
      {
        if ((unint64_t)v12 >= 4)
          v14 = 4;
        else
          v14 = v12;
        if (v12 < 0 || (v15 = v37, v37 <= v12))
        {
          v17 = 95;
        }
        else
        {
          if (v34)
          {
            v16 = v34[v12 + v36];
          }
          else if (v35)
          {
            v16 = v35[v36 + v12];
          }
          else
          {
            if (v39 <= v12 || v11 > v12)
            {
              v18 = v14 + v10;
              v19 = v13 - v14;
              v20 = v12 - v14;
              v21 = v20 + 64;
              if (v20 + 64 >= v37)
                v21 = v37;
              v38 = v20;
              v39 = v21;
              if (v37 >= v19)
                v15 = v19;
              v40.length = v15 + v18;
              v40.location = v20 + v36;
              CFStringGetCharacters(theString, v40, (UniChar *)&v25);
              v11 = v38;
            }
            v16 = *((_WORD *)&v25 + v12 - v11);
          }
          v17 = 95;
          switch(v16)
          {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
              v17 = v16;
              break;
            default:
              break;
          }
        }
        v7[v12++] = v17;
        --v10;
        ++v13;
      }
      while (v5 != v12);
      if (*v7 == 95)
        *v7 = 120;
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = (__CFString *)objc_msgSend(v22, "initWithBytes:length:encoding:", v7, v5, 1, v25, v26, v27, v28, v29, v30, v31, v32);
      free(v7);
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = v3;
  }

  return v23;
}

+ (id)sanitizedSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "sanitizedString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (BOOL)stringIsValid:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  unint64_t v5;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UniChar v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v23[8];
  CFStringRef theString;
  const UniChar *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFRange v31;

  v3 = (__CFString *)a3;
  v4 = -[__CFString length](v3, "length");
  if (v4)
  {
    v5 = v4;
    memset(v23, 0, sizeof(v23));
    theString = v3;
    v27 = 0;
    v28 = v4;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    v25 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v29 = 0;
    v30 = 0;
    v11 = 64;
    v26 = CStringPtr;
    v12 = MEMORY[0x1E0C80978];
    while (1)
    {
      v13 = (unint64_t)v10 >= 4 ? 4 : v10;
      if (v10 < 0)
        break;
      v14 = v28;
      if (v28 <= v10)
        break;
      if (v25)
      {
        v15 = v25[v10 + v27];
      }
      else if (v26)
      {
        v15 = v26[v27 + v10];
      }
      else
      {
        if (v30 <= v10 || (v17 = v29, v29 > v10))
        {
          v18 = v13 + v8;
          v19 = v11 - v13;
          v20 = v10 - v13;
          v21 = v20 + 64;
          if (v20 + 64 >= v28)
            v21 = v28;
          v29 = v20;
          v30 = v21;
          if (v28 >= v19)
            v14 = v19;
          v31.length = v14 + v18;
          v31.location = v20 + v27;
          CFStringGetCharacters(theString, v31, (UniChar *)v23);
          v17 = v29;
        }
        v15 = *((_WORD *)v23 + v10 - v17);
      }
      v16 = v15;
      if (v15 <= 0x7Fu)
        goto LABEL_13;
      if (__maskrune(v15, 0x500uLL))
        goto LABEL_29;
LABEL_14:
      if (!v10 || v15 != 95)
        goto LABEL_32;
LABEL_29:
      v9 = ++v10 >= v5;
      --v8;
      ++v11;
      if (v5 == v10)
        goto LABEL_32;
    }
    v16 = 0;
    v15 = 0;
LABEL_13:
    if ((*(_DWORD *)(v12 + 4 * v16 + 60) & 0x500) != 0)
      goto LABEL_29;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_32:

  return v9;
}

+ (BOOL)dictionaryContainsValidStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a1, "stringIsValid:", v9, (_QWORD)v13))
          goto LABEL_14;
        objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a1, "stringIsValid:", v10))
        {

LABEL_14:
          v11 = 0;
          goto LABEL_15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_15:

  return v11;
}

+ (BOOL)setContainsValidStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(a1, "stringIsValid:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

+ (id)sanitizedDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "sanitizedString:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "sanitizedString:", v12);
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
        }
        if (v11)
          v15 = v12 == 0;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

@end
