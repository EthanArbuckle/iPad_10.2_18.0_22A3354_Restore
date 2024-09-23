@implementation NSString(VSSpeechService)

- (void)vs_textifyEmojiWithLanguage:()VSSpeechService
{
  id v4;
  id v5;
  id v6;
  void (*v7)(id, uint64_t, id, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v5 = a1;
  v6 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v7 = (void (*)(id, uint64_t, id, _QWORD))getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr;
  v16 = getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr;
  if (!getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getTTSSpeechTransformTextWithLanguageSymbolLoc_block_invoke;
    v12[3] = &unk_1EA8AFF40;
    v12[4] = &v13;
    __getTTSSpeechTransformTextWithLanguageSymbolLoc_block_invoke(v12);
    v7 = (void (*)(id, uint64_t, id, _QWORD))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v7)
  {
    v7(v5, 3, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_TTSSpeechTransformTextWithLanguage(NSString *__strong, TTSSpeechTransformOptions, NSString * _Nullable __strong, NSMutableArray * _Nullable __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSString+VSSpeechService.m"), 18, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (id)vs_substituteAudioWithLocalPath
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;

  v2 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("\x1B\\audio="), 0, 0, v2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4;
    v8 = v5;
    v9 = 0;
    while (1)
    {
      v10 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("\\"), 0, v7 + v8, v9 + v2 - (v7 + v8));
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_2;
      v11 = v10;
      v12 = v10 - v7;
      objc_msgSend(v3, "substringWithRange:", v7 + v8, v10 - v7 - v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("\"))
        && objc_msgSend(v13, "hasSuffix:", CFSTR("\"))
        && (unint64_t)objc_msgSend(v13, "length") >= 2)
      {
        objc_msgSend(v13, "substringWithRange:", 1, objc_msgSend(v13, "length") - 2);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("/")))
        break;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertString:atIndex:", CFSTR("/System/Library/PrivateFrameworks/VoiceServices.framework/TTSResources/Tones/"), 0);
      if ((objc_msgSend(v13, "hasSuffix:", CFSTR(".wav")) & 1) == 0)
        objc_msgSend(v15, "appendString:", CFSTR(".wav"));
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("AssistantEtiquette.wav"));

      if ((v17 & 1) == 0)
      {
        v23 = v3;

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\x1B\\audio=\"%@\"\\"), v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "replaceCharactersInRange:withString:", v7, v12 + 1, v18);

      v19 = objc_msgSend(v15, "length");
      v9 = v19 - objc_msgSend(v13, "length") + v11;

      v20 = objc_msgSend(v3, "length");
      v2 = v20 - v9;
      v7 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("\x1B\\audio="), 0, v9, v20 - v9);
      v8 = v21;
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_2;
    }
    v22 = v3;
LABEL_17:

    goto LABEL_18;
  }
LABEL_2:
  v6 = v3;
LABEL_18:

  return v3;
}

- (id)vs_insertContextInfo:()VSSpeechService
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "vs_markerStringForContext:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)vs_measurePauses
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\x1B\\\\pause=['\"]?([0-9]+)['\"]?\\\\"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v38 = v2;
  objc_msgSend(v2, "matchesInString:options:range:", a1, 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") && v3 != 1)
  {
    v5 = objc_msgSend(a1, "characterAtIndex:", v3 - 1);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "characterIsMember:", v5))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "characterIsMember:", v5);

      if (!v8)
        goto LABEL_7;
    }
    --v3;
  }
LABEL_7:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "rangeAtIndex:", 1);
        objc_msgSend(a1, "substringWithRange:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "integerValue");
        if (v18 <= 10)
          v19 = 10;
        else
          v19 = v18;
        v20 = objc_msgSend(v14, "rangeAtIndex:", 0);
        if ((v20 + v21 >= v3 || v20 == 0) && v19 > 0x64)
          v24 = 100;
        else
          v24 = v19;
        v11 += v24;

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("<break time=['\"]([0-9]+)ms['\"]\\s*/>"), 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "rangeAtIndex:", 1);
        objc_msgSend(a1, "substringWithRange:", v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "integerValue");
        if (v35 <= 10)
          v36 = 10;
        else
          v36 = v35;
        v11 += v36;

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v29);
  }

  return (double)v11 * 0.001;
}

- (uint64_t)vs_countPhoneticSyllables
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\x1B\\\\toi=lhp\\\\([^\x1B]*)"), 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "rangeAtIndex:", 1);
        objc_msgSend(a1, "substringWithRange:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(MEMORY[0x1E0CB3940], "_vs_countPhoneticSyllables_lhp:", v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(?:%@|%@)"), CFSTR("'(?:[^'\\\\]|\\\\.)*'"), CFSTR("\"(?:[^\"\\\\]|\\\\.)*\"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\w+=%@"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<phoneme\\s+(%@)\\s+(%@)\\s*/>"), v28, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    v31 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      v32 = v13;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
        v17 = &stru_1EA8B0C98;
        if ((unint64_t)objc_msgSend(v16, "numberOfRanges") >= 2)
        {
          v18 = 0;
          v19 = 1;
          do
          {
            v20 = objc_msgSend(v16, "rangeAtIndex:", v19);
            objc_msgSend(a1, "substringWithRange:", v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "hasPrefix:", CFSTR("alphabet=")))
            {
              v18 = objc_msgSend(v22, "containsString:", CFSTR("lhp"));
            }
            else if (objc_msgSend(v22, "hasPrefix:", CFSTR("ph=")))
            {
              objc_msgSend(v22, "substringWithRange:", 4, objc_msgSend(v22, "length") - 5);
              v23 = objc_claimAutoreleasedReturnValue();

              v17 = (__CFString *)v23;
            }

            ++v19;
          }
          while (v19 < objc_msgSend(v16, "numberOfRanges"));
          if ((v18 & 1) != 0)
          {
            v24 = objc_msgSend(MEMORY[0x1E0CB3940], "_vs_countPhoneticSyllables_lhp:", v17);
            v14 = v31;
            v13 = v32;
            goto LABEL_26;
          }
          v14 = v31;
          v13 = v32;
        }
        v24 = objc_msgSend(MEMORY[0x1E0CB3940], "_vs_countPhoneticSyllables_xsampa:", v17);
LABEL_26:
        v5 += v24;

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v13);
  }

  return v5;
}

- (id)vs_removePhonetics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\x1B\\\\toi=\\w+\\\\.*?\x1B\\\\toi=orth\\\\"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1EA8B0C98);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\x1B\\\\toi=\\w+\\\\.*"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1EA8B0C98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("<phoneme.*?/>"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_1EA8B0C98);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vs_removeSpeechTags
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\x1B\\\\\\w+=.+?\\\\"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1EA8B0C98);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("</?.*?>"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1EA8B0C98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)vs_hasCJKCharacter
{
  unint64_t v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = 0;
  do
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "vs_isCJKCharacter:", objc_msgSend(a1, "characterAtIndex:", v2));
    if ((_DWORD)v3)
      break;
    ++v2;
  }
  while (v2 < objc_msgSend(a1, "length"));
  return v3;
}

- (id)vs_convertToSSML
{
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("<speak>")))
  {
    v2 = a1;
    return v2;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<speak>"));
  objc_msgSend(v3, "addObject:", CFSTR("speak"));
  if (objc_msgSend(a1, "length"))
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("\x1B"), 0, v4, objc_msgSend(a1, "length") - v4);
      v6 = v5;
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        v6 = objc_msgSend(a1, "length");
      objc_msgSend(a1, "substringWithRange:", v4, v6 - v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v7);

      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(a1, "substringWithRange:", v5, objc_msgSend(a1, "length") - v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hasPrefix:", CFSTR("\x1B\\toi=lhp\\")))
      {
        objc_msgSend(v2, "appendString:", CFSTR("<phoneme alphabet=\"lhp\" ph=\"));
        v6 += objc_msgSend(CFSTR("\x1B\\toi=lhp\\"), "length");
        objc_msgSend(v3, "addObject:", CFSTR("phoneme"));
      }
      else if (objc_msgSend(v8, "hasPrefix:", CFSTR("\x1B\\toi=orth\\")))
      {
        objc_msgSend(v3, "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("phoneme"));

        if (!v10)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = CFSTR("unbalanced phoneme tag");
LABEL_23:
          objc_msgSend(v13, "raise:format:", CFSTR("SSML error"), v14);
          goto LABEL_25;
        }
        objc_msgSend(v2, "appendString:", CFSTR("\"></phoneme>"));
        v6 += objc_msgSend(CFSTR("\x1B\\toi=orth\\"), "length");
        objc_msgSend(v3, "removeLastObject");
      }
      else
      {
        if (!objc_msgSend(v8, "hasPrefix:", CFSTR("\x1B\\tn=normal\\")))
        {
          if (objc_msgSend(v8, "hasPrefix:", CFSTR("\x1B\\tn=")))
          {
            objc_msgSend(v3, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("say-as"));

            if (v16)
            {
              objc_msgSend(v2, "appendString:", CFSTR("</say-as>"));
              objc_msgSend(v3, "removeLastObject");
            }
            v17 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("\\"), 0, objc_msgSend(CFSTR("\x1B\\tn="), "length"), objc_msgSend(v8, "length") - objc_msgSend(CFSTR("\x1B\\tn="), "length"));
            if (v17 == 0x7FFFFFFFFFFFFFFFLL)
            {
              NSLog(CFSTR("Error in tn override tag, ignore"));
            }
            else
            {
              v19 = v18;
              objc_msgSend(v8, "substringWithRange:", objc_msgSend(CFSTR("\x1B\\tn="), "length"), v17 - objc_msgSend(CFSTR("\x1B\\tn="), "length"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "appendFormat:", CFSTR("<say-as interpret-as=\"%@\">"), v20);
              v21 = objc_msgSend(CFSTR("\x1B\\tn="), "length");
              v6 += v19 + v21 + objc_msgSend(v20, "length");
              objc_msgSend(v3, "addObject:", CFSTR("say-as"));

            }
          }
          goto LABEL_25;
        }
        objc_msgSend(v3, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("say-as"));

        if (!v12)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = CFSTR("unbalanced say-as tag");
          goto LABEL_23;
        }
        objc_msgSend(v2, "appendString:", CFSTR("</say-as>"));
        objc_msgSend(v3, "removeLastObject");
        v6 += objc_msgSend(CFSTR("\x1B\\tn=normal\\"), "length");
      }
LABEL_25:

      v4 = v6;
    }
    while (v6 < objc_msgSend(a1, "length"));
  }
  while (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("phoneme"));

    if (v23)
    {
      objc_msgSend(v2, "appendString:", CFSTR("\"></phoneme>"));
    }
    else
    {
      objc_msgSend(v3, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("</%@>"), v24);

    }
    objc_msgSend(v3, "removeLastObject");
  }

  return v2;
}

+ (__CFString)vs_markerStringForContext:()VSSpeechService
{
  id v3;
  void *v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("\x1B\\mrk=%@=%@\\"), v11, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendString:](v5, "appendString:", v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v4 = v16;
  }
  else
  {
    v5 = &stru_1EA8B0C98;
  }

  return v5;
}

+ (uint64_t)_vs_countPhoneticSyllables_lhp:()VSSpeechService
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = objc_msgSend(v3, "characterAtIndex:", v6);
      if (v8 == 95 || v8 == 46)
        ++v7;
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (uint64_t)_vs_countPhoneticSyllables_xsampa:()VSSpeechService
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = objc_msgSend(v3, "characterAtIndex:", v6);
      if (v8 == 46 || v8 == 35)
        ++v7;
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (uint64_t)vs_isCJKCharacter:()VSSpeechService
{
  if (vs_isCJKCharacter__onceToken != -1)
    dispatch_once(&vs_isCJKCharacter__onceToken, &__block_literal_global_819);
  return objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "characterIsMember:", a3);
}

@end
