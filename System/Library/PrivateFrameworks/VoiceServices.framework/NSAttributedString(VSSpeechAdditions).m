@implementation NSAttributedString(VSSpeechAdditions)

+ (id)attributedStringWithFormatAndAttributes:()VSSpeechAdditions
{
  __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  UniChar v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  const void *v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  int64_t v31;
  UniChar v32;
  int64_t v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  int64_t v40;
  const void *v42;
  int64_t v43;
  VSFormatArgument *v44;
  CFIndex Count;
  CFIndex v46;
  uint64_t v47;
  _QWORD *Value;
  _QWORD *v49;
  id *v50;
  id *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  const void *v61;
  int64_t v62;
  uint64_t v63;
  int64_t v64;
  __CFString *v65;
  uint64_t v66;
  __CFDictionary *theDict;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  UniChar buffer[8];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CFStringRef theString;
  const UniChar *v81;
  const char *v82;
  uint64_t v83;
  int64_t v84;
  int64_t v85;
  int64_t v86;
  id *v87;
  _BYTE v88[128];
  uint64_t v89;
  CFRange v90;
  CFRange v91;

  v9 = a3;
  v89 = *MEMORY[0x1E0C80C00];
  v87 = 0;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  *(_OWORD *)buffer = 0u;
  v73 = 0u;
  v10 = -[__CFString length](a3, "length");
  v11 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = (id *)&a9;
  theString = v9;
  v83 = 0;
  v84 = v10;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v81 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  v85 = 0;
  v86 = 0;
  v82 = CStringPtr;
  v15 = v10 - 1;
  if (v10 >= 1)
  {
    v16 = 0;
    v63 = 0;
    v17 = 0;
    v66 = v10 - 1;
    while (1)
    {
      v18 = v16 + 1;
      if (v16 < 0)
        goto LABEL_53;
      v19 = v84;
      if (v84 <= v16)
        goto LABEL_53;
      if (v81)
      {
        v20 = v81[v83 + v16];
      }
      else if (v82)
      {
        v20 = v82[v83 + v16];
      }
      else
      {
        if (v86 <= v16 || (v21 = v85, v85 > v16))
        {
          v22 = v16 - 4;
          if ((unint64_t)v16 < 4)
            v22 = 0;
          if (v22 + 64 < v84)
            v19 = v22 + 64;
          v85 = v22;
          v86 = v19;
          v90.location = v83 + v22;
          v90.length = v19 - v22;
          CFStringGetCharacters(theString, v90, buffer);
          v15 = v66;
          v21 = v85;
        }
        v20 = buffer[v16 - v21];
      }
      if (v20 != 37)
        goto LABEL_53;
      v23 = v16 - v17;
      if (v16 > v17)
      {
        objc_msgSend(v12, "addObject:", -[__CFString substringWithRange:](v9, "substringWithRange:", v17, v23));
        v15 = v66;
      }
      if (v18 >= v10)
      {
LABEL_53:
        v40 = v17;
        goto LABEL_54;
      }
      v64 = v10;
      v65 = v9;
      v24 = 0;
      v25 = 0;
      v26 = ~v16;
      v27 = v16 + 65;
      v28 = v16 + 1;
      while (1)
      {
        v29 = v16 + 1;
        if ((unint64_t)v18 >= 4)
          v30 = 4;
        else
          v30 = v18;
        if (v29 < 0)
          goto LABEL_51;
        v31 = v84;
        if (v84 <= v29)
          goto LABEL_51;
        if (v81)
        {
          v32 = v81[v16 + 1 + v83];
        }
        else if (v82)
        {
          v32 = v82[v83 + 1 + v16];
        }
        else
        {
          if (v86 <= v29 || (v33 = v85, v85 > v29))
          {
            v34 = v30 + v26;
            v35 = v27 - v30;
            v36 = v16 - v30;
            v37 = v36 + 1;
            v38 = v36 + 65;
            if (v38 >= v84)
              v38 = v84;
            v85 = v37;
            v86 = v38;
            if (v84 >= v35)
              v31 = v35;
            v61 = v24;
            v62 = v28;
            v91.length = v31 + v34;
            v39 = v25;
            v91.location = v37 + v83;
            CFStringGetCharacters(theString, v91, buffer);
            v25 = v39;
            v24 = v61;
            v28 = v62;
            v15 = v66;
            v33 = v85;
          }
          v32 = buffer[v16 + 1 - v33];
        }
        v40 = v16 + 2;
        if (v32 == 37 && v29 == v28)
        {
          objc_msgSend(v12, "addObject:", CFSTR("%"), v23);
          v15 = v66;
          v18 = v16 + 2;
          v9 = v65;
          goto LABEL_57;
        }
        if ((unsigned __int16)(v32 - 48) <= 9u)
        {
          v25 = 10 * v25 + v32 - 48;
          goto LABEL_51;
        }
        if (v32 == 36)
        {
          v24 = (const void *)v25;
          v28 = v16 + 2;
          goto LABEL_51;
        }
        if (v32 == 64)
          break;
LABEL_51:
        --v26;
        ++v27;
        ++v18;
        ++v16;
        if (v15 == v29)
        {
          v40 = v17;
          v18 = v64;
          v9 = v65;
          goto LABEL_62;
        }
      }
      if (v24)
        v42 = v24;
      else
        v42 = (const void *)(v63 + 1);
      v43 = v28;
      v44 = objc_alloc_init(VSFormatArgument);
      v9 = v65;
      v44->formatSpecifier = (NSString *)(id)-[__CFString substringWithRange:](v65, "substringWithRange:", v43, v40 - v43);
      CFDictionarySetValue(theDict, v42, v44);
      objc_msgSend(v12, "addObject:", v44);

      v15 = v66;
      ++v63;
      v18 = v16 + 2;
LABEL_57:
      v10 = v64;
LABEL_54:
      v16 = v18;
      v17 = v40;
      if (v18 >= v10)
      {
LABEL_62:
        if (v18 > v40)
          objc_msgSend(v12, "addObject:", -[__CFString substringWithRange:](v9, "substringWithRange:", v40, v18 - v40));
        break;
      }
    }
  }
  Count = CFDictionaryGetCount(theDict);
  if (Count >= 1)
  {
    v46 = Count;
    v47 = 0;
    do
    {
      Value = CFDictionaryGetValue(theDict, (const void *)++v47);
      if (Value)
      {
        v49 = Value;
        v50 = v87++;
        Value[3] = *v50;
        v51 = v87++;
        v49[2] = *v51;
      }
    }
    while (v46 != v47);
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v52 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v88, 16, v61, v62);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v69 != v54)
          objc_enumerationMutation(v12);
        v56 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v57 = v11;
          v58 = v56;
          v59 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v59 = *(_QWORD *)(v56 + 16);
          v58 = *(_QWORD *)(v56 + 24);
          v57 = v11;
        }
        objc_msgSend(v57, "appendString:withAttributes:", v58, v59);
      }
      v53 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
    }
    while (v53);
  }
  CFRelease(theDict);

  return v11;
}

@end
