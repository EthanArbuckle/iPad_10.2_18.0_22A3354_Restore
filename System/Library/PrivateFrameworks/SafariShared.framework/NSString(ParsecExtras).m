@implementation NSString(ParsecExtras)

- (id)safari_normalizedParsecInputString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  char v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int16 v26;
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("‘’‚‛"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v2;
  v28[0] = CFSTR("'");
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("“”„‟"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v28[1] = CFSTR("\");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addCharactersInRange:", 0x2000, 12);
  objc_msgSend(v6, "addCharactersInString:", CFSTR("  ᠎  　﻿"));
  objc_msgSend(a1, "precomposedStringWithCanonicalMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "length");
  if (v10)
  {
    LOBYTE(v11) = 0;
    for (i = 0; i != v10; ++i)
    {
      v13 = v11;
      v26 = 0;
      v14 = objc_msgSend(v8, "characterAtIndex:", i);
      v26 = v14;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v11 = objc_msgSend(v6, "characterIsMember:", v14);
      if (v11)
      {
        if ((v13 & 1) == 0)
        {
          if (objc_msgSend(v9, "length"))
            objc_msgSend(v9, "appendString:", CFSTR(" "));
          *((_BYTE *)v23 + 24) = 1;
        }
      }
      else if (!*((_BYTE *)v23 + 24))
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __60__NSString_ParsecExtras__safari_normalizedParsecInputString__block_invoke;
        v18[3] = &unk_1E4B3D9F0;
        v21 = v26;
        v15 = v9;
        v19 = v15;
        v20 = &v22;
        objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v18);
        if (!*((_BYTE *)v23 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v26, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appendString:", v16);

        }
      }
      _Block_object_dispose(&v22, 8);
    }
  }

  return v9;
}

@end
