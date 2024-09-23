@implementation NSAttributedString(NSAttributedStringUIFoundationAdditions)

- (CFIndex)lineBreakByHyphenatingBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFLocale *v12;
  const __CFString *v13;
  CFIndex result;
  CFRange v15;

  v9 = objc_msgSend(a1, "length");
  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v9 <= a3 ? v9 - 1 : a3;
  v11 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", NSLanguageAttributeName, v10, 0);
  if (!v11 || (v12 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v11)) == 0)
  {
    if (lineBreakByHyphenatingBeforeIndex_withinRange__onceToken != -1)
      dispatch_once(&lineBreakByHyphenatingBeforeIndex_withinRange__onceToken, &__block_literal_global_62);
    v12 = (const __CFLocale *)lineBreakByHyphenatingBeforeIndex_withinRange__defaultLocale;
    if (!lineBreakByHyphenatingBeforeIndex_withinRange__defaultLocale)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = (const __CFString *)objc_msgSend(a1, "string");
  v15.location = a4;
  v15.length = a5;
  result = CFStringGetHyphenationLocationBeforeIndex(v13, a3, v15, 0, v12, 0);
  if (result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (unint64_t)nextWordFromIndex:()NSAttributedStringUIFoundationAdditions forward:
{
  __CFString *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v19;
  __int16 v21;
  int IsMemberOf;
  UniChar *v23;
  void *v24;
  unint64_t v25;
  int v26;
  int v27;
  CFIndex v29;
  CFIndex v30;
  unint64_t v31;
  UniChar v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  UniChar *v39;
  UniChar *v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  _BOOL4 v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  CFStringRef theString;
  UniChar buffer[256];
  uint64_t v54;
  CFRange v55;
  CFRange v56;
  CFRange v57;
  CFRange v58;
  CFRange v59;
  CFRange v60;
  CFRange v61;
  CFRange v62;
  CFRange v63;
  CFRange v64;
  CFRange v65;
  CFRange v66;
  CFRange v67;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)objc_msgSend(a1, "string");
  v8 = objc_msgSend(a1, "length");
  if (!v8)
    return 0;
  v9 = v8;
  if (a3)
    v10 = v8 == a3;
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", NSLanguageAttributeName, a3 - v11, 0);
  v13 = v12;
  theString = v7;
  if (a4)
  {
    if (v9 <= a3 + 1)
      return v9;
    if (v9 - a3 >= 0x100)
      v14 = 256;
    else
      v14 = v9 - a3;
    v55.location = a3;
    v55.length = v14;
    CFStringGetCharacters(v7, v55, buffer);
    v15 = a3;
    v50 = (void *)v13;
    while (1)
    {
      v16 = v15 - a3;
      v17 = buffer[v15 - a3] & 0xFC00;
      if (v17 == 56320)
      {
        if ((uint64_t)a3 > 0 || v16)
          -[__CFString characterAtIndex:](v7, "characterAtIndex:", v15 - 1);
      }
      else if (v17 == 55296 && v15 + 1 < v9)
      {
        ++v16;
        -[__CFString characterAtIndex:](v7, "characterAtIndex:");
      }
      if (CFUniCharIsMemberOf())
      {
        do
        {
          if (++v16 >= v14)
          {
            a3 += v14;
            if (v9 <= a3)
              return v9;
            if (v9 - a3 >= 0x100)
              v14 = 256;
            else
              v14 = v9 - a3;
            v56.location = a3;
            v56.length = v14;
            CFStringGetCharacters(v7, v56, buffer);
            v16 = 0;
          }
          if ((buffer[v16] & 0xFC00) == 0xD800)
          {
            if (v16 + a3 + 2 >= v9)
              return v9;
            if ((-[__CFString characterAtIndex:](v7, "characterAtIndex:", v16 + a3 + 1) & 0xFC00) == 0xDC00)
              ++v16;
          }
        }
        while ((CFUniCharIsMemberOf() & 1) != 0);
      }
      v15 = v16 + a3;
      if (a3 + v14 >= v9)
      {
        v48 = 0;
        v23 = buffer;
        v24 = v50;
      }
      else
      {
        if (v15 + 256 < v9)
        {
          while (1)
          {
            v19 = v16 + 1;
            if (v16 + 1 < v14)
            {
              do
              {
                if ((buffer[v19] & 0xFC00) != 0xD800 || a3 + 1 + v19 >= v9)
                {
                  v16 = v19;
                }
                else
                {
                  v21 = -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:");
                  if ((v21 & 0xFC00) == 0xDC00)
                    v16 += 2;
                  else
                    v16 = v19;
                }
                IsMemberOf = CFUniCharIsMemberOf();
                if ((IsMemberOf & 1) != 0)
                  break;
                v19 = v16 + 1;
              }
              while (v16 + 1 < v14);
              v7 = (__CFString *)theString;
              if (IsMemberOf)
                break;
            }
            a3 += v14;
            if (v9 == a3)
            {
              v14 = v9 - v15;
              goto LABEL_58;
            }
            if (v9 - a3 >= 0x100)
              v14 = 256;
            else
              v14 = v9 - a3;
            v57.location = a3;
            v57.length = v14;
            CFStringGetCharacters(v7, v57, buffer);
            v16 = 0;
          }
          v14 = a3 - v15 + v16;
LABEL_58:
          a3 = v15;
        }
        v48 = v14 > 256;
        v24 = v50;
        if (v14 < 257)
          v23 = buffer;
        else
          v23 = (UniChar *)NSZoneMalloc(0, 2 * v14);
        v58.location = a3;
        v58.length = v14;
        CFStringGetCharacters(v7, v58, v23);
      }
      v25 = _NSCopyBreakIterator(v24, (uint64_t)v23, v14, 1u);
      if (!v25)
        goto LABEL_79;
      v26 = ubrk_following();
      _NSDisposeBreakIterator(v25, v24, 1u);
      if (v26 == -1)
        goto LABEL_78;
      v15 = a3 + v26;
      if (v9 == v15)
        return v9;
      v27 = v23[v26 - 1];
      if (v15 >= 2 && (v27 & 0xFC00) == 0xDC00)
      {
        if (v26 < 2)
          -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:", v15 - 2);
      }
      else if (v27 == 95)
      {
        goto LABEL_78;
      }
      if (CFUniCharIsMemberOf())
      {
        if (v9 - v15 >= 0x100)
          v14 = 256;
        else
          v14 = v9 - v15;
        v7 = (__CFString *)theString;
        v59.location = v15;
        v59.length = v14;
        CFStringGetCharacters(theString, v59, buffer);
        LOBYTE(v25) = 1;
        a3 = v15;
        goto LABEL_79;
      }
LABEL_78:
      LOBYTE(v25) = 0;
      v7 = (__CFString *)theString;
LABEL_79:
      if (v48)
        NSZoneFree(0, v23);
      if ((v25 & 1) == 0)
        return v15;
    }
  }
  if (a3 < 2)
    return 0;
  v51 = (void *)v12;
  if (a3 >= 0x100)
    v29 = 256;
  else
    v29 = a3;
  v30 = a3 - v29;
  v60.location = a3 - v29;
  v60.length = v29;
  CFStringGetCharacters(v7, v60, buffer);
  while (1)
  {
    v31 = a3 + ~v30;
    v32 = buffer[v31];
    if ((v32 & 0xFC00) == 0xD800)
    {
      if (!v30 && v31 < 2)
        return 0;
      v32 = -[__CFString characterAtIndex:](v7, "characterAtIndex:", --v31);
    }
    if ((v32 & 0xFC00) == 0xDC00 && (buffer[v31 - 1] & 0xFC00) == 0xD800)
    {
      if (!((v31 - 1) | v30))
        return 0;
      --v31;
    }
    if (CFUniCharIsMemberOf())
    {
      while (1)
      {
        while (1)
        {
          if (v31)
          {
            v33 = v31;
          }
          else
          {
            if (v30 < 2)
              return 0;
            v29 = v30 >= 256 ? 256 : v30;
            v30 -= v29;
            v61.location = v30;
            v61.length = v29;
            CFStringGetCharacters(v7, v61, buffer);
            v33 = v29;
          }
          v31 = v33 - 1;
          v34 = buffer[v33 - 1];
          if ((v34 & 0xFC00) == 0xDC00)
            break;
LABEL_112:
          if ((CFUniCharIsMemberOf() & 1) == 0)
          {
            v31 -= (v34 & 0xFFFF0000) != 0;
            goto LABEL_122;
          }
        }
        if (v33 != 1)
        {
          v35 = v33 - 2;
          v36 = buffer[v35];
          if ((v36 & 0xFC00) == 0xD800)
          {
            if (!(v35 | v30))
              return 0;
            v34 = v34 - 56613888 + (v36 << 10);
            v31 = v35;
          }
          goto LABEL_112;
        }
        if (v30 < 2)
          return 0;
        if ((unint64_t)v30 < 0x100)
          v29 = v30 + 1;
        else
          v29 = 256;
        if ((unint64_t)v30 >= 0x100)
          v30 -= 255;
        else
          v30 = 0;
        v62.location = v30;
        v62.length = v29;
        CFStringGetCharacters(v7, v62, buffer);
        v31 = v29;
      }
    }
LABEL_122:
    a3 = v31 + v30;
    if (v30 < 1)
    {
      v49 = 0;
      v39 = buffer;
      goto LABEL_153;
    }
    if (a3 + 2 > v9)
      v37 = 1;
    else
      v37 = 2;
    v29 = v37 + a3;
    if (v37 + a3 >= 0x101)
    {
      if (!v31)
        goto LABEL_139;
      while (1)
      {
        if ((buffer[v31 - 1] & 0xFC00) == 0xDC00)
        {
          if (v31 == 1)
          {
            ++v30;
            goto LABEL_139;
          }
          if ((buffer[v31 - 2] & 0xFC00) == 0xD800)
            v31 -= 2;
          else
            --v31;
        }
        else
        {
          --v31;
        }
        v38 = CFUniCharIsMemberOf();
        if ((v38 & 1) != 0 || !v31)
        {
          if (v38)
          {
            v30 += v31 + 1;
LABEL_149:
            v29 = a3 - v30 + v37;
            v49 = v29 > 256;
            if (v29 < 257)
              v39 = buffer;
            else
              v39 = (UniChar *)NSZoneMalloc(0, 2 * v29);
            v65.location = v30;
            v65.length = a3 - v30 + v37;
            CFStringGetCharacters(v7, v65, v39);
            goto LABEL_153;
          }
LABEL_139:
          if (v30 < 1)
            goto LABEL_149;
          if (v30 >= 256)
            v31 = 256;
          else
            v31 = v30;
          v30 -= v31;
          v63.location = v30;
          v63.length = v31;
          CFStringGetCharacters(v7, v63, buffer);
        }
      }
    }
    if ((v31 & 0x8000000000000000) == 0)
    {
      v40 = &buffer[v31];
      do
      {
        v40[v30] = *v40;
        --v40;
      }
      while (v40 >= buffer);
    }
    v39 = buffer;
    v64.location = 0;
    v64.length = v30;
    CFStringGetCharacters(v7, v64, buffer);
    v49 = 0;
    v30 = 0;
LABEL_153:
    v41 = _NSCopyBreakIterator(v51, (uint64_t)v39, v29, 1u);
    if (!v41)
      break;
    v42 = v41;
    v43 = ubrk_preceding();
    _NSDisposeBreakIterator(v42, v51, 1u);
    if (v43 == -1)
      break;
    a3 = v30 + v43;
    if (!a3)
      break;
    v44 = v39[v43];
    if ((v44 & 0xFC00) == 0xDC00)
    {
      --a3;
      goto LABEL_178;
    }
    if ((v44 & 0xFC00) == 0xD800)
    {
      if (a3 + 1 >= v9)
        goto LABEL_178;
      v45 = v39[v43 + 1];
      v10 = (v45 & 0xFC00) == 56320;
      v46 = (v44 << 10) - 56613888 + v45;
      if (v10)
        v44 = v46;
    }
    if ((CFUniCharIsMemberOf() & 1) == 0)
    {
      if (v44 == 95 || !CFUniCharIsMemberOf())
      {
        if (!CFUniCharIsMemberOf())
          break;
        v47 = a3 - 1 >= v30 ? v39[v43 - 1] : -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:");
        if (v47 != 46)
          break;
        goto LABEL_178;
      }
      if (v44 == 46 && a3 + 1 < v9)
      {
        if ((-[__CFString characterAtIndex:]((id)theString, "characterAtIndex:") & 0xFC00) == 0xD800 && a3 + 2 < v9)
          -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:");
        if ((CFUniCharIsMemberOf() & 1) != 0)
          break;
      }
    }
LABEL_178:
    if (v43)
    {
      v7 = (__CFString *)theString;
      if (v49)
      {
        if (a3 >= 0x100)
          v29 = 256;
        else
          v29 = a3;
        if (a3 >= 0x100)
          v30 = a3 - 256;
        else
          v30 = 0;
        v66.location = v30;
        v66.length = v29;
        CFStringGetCharacters(theString, v66, buffer);
        goto LABEL_191;
      }
    }
    else
    {
      if (v30 >= 256)
        v29 = 256;
      else
        v29 = v30;
      v30 -= v29;
      v7 = (__CFString *)theString;
      v67.location = v30;
      v67.length = v29;
      CFStringGetCharacters(theString, v67, buffer);
      if (v49)
LABEL_191:
        NSZoneFree(0, v39);
    }
  }
  if (v49)
    NSZoneFree(0, v39);
  return a3;
}

- (uint64_t)_lineBreakBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:lineBreakStrategy:
{
  const __CFString *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *CStringPtr;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  int64_t v19;
  int64_t v20;
  CFIndex v21;
  UniChar v22;
  int64_t v23;
  BOOL v24;
  int64_t v25;
  UniChar *v27;
  UniChar *v28;
  CFIndex v29;
  UniChar *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  CFRange v36;
  const char *v37;
  UniChar *v38;
  UniChar v39;
  uint64_t v40;
  UniChar *v41;
  uint64_t v42;
  CFIndex v43;
  uint64_t v44;
  CFRange v45;
  const char *v46;
  uint64_t v47;
  UniChar *v48;
  UniChar v49;
  CFRange v51;
  const char *v52;
  UniChar v53;
  unint64_t v54;
  UniChar buffer[8];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v65;
  CFIndex v66;
  CFIndex v67;
  int64_t v68;
  CFIndex length;
  CFRange v70;
  CFRange v71;

  v7 = (const __CFString *)objc_msgSend(a1, "string");
  v8 = objc_msgSend(a1, "length");
  if (!v8)
    return 0;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 < a3)
  {
    v10 = v8;
    if (v8 >= a4)
    {
      if (v8 >= a3)
        v11 = a3;
      else
        v11 = v8;
      theString = v7;
      v66 = a4;
      v67 = v8 - a4;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      if (CharactersPtr)
        CStringPtr = 0;
      else
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      v13 = 0;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      *(_OWORD *)buffer = 0u;
      v56 = 0u;
      v14 = v11 - a4;
      v68 = 0;
      length = 0;
      v15 = v11 - a4;
      v65 = CStringPtr;
      do
      {
        v16 = v15;
        if (v15 < 0 || (v17 = v67, v67 <= v15))
        {
          v18 = 0;
        }
        else if (CharactersPtr)
        {
          v18 = CharactersPtr[v66 + v15];
        }
        else if (v65)
        {
          v18 = v65[v66 + v15];
        }
        else
        {
          if (length <= v15 || v13 > v15)
          {
            v19 = v15 - 4;
            if ((unint64_t)v15 < 4)
              v19 = 0;
            if (v19 + 64 < v67)
              v17 = v19 + 64;
            v68 = v19;
            length = v17;
            v70.location = v66 + v19;
            v70.length = v17 - v19;
            CFStringGetCharacters(theString, v70, buffer);
            v13 = v68;
          }
          v18 = buffer[v16 - v13];
        }
        v15 = v16 + 1;
      }
      while (v18 == 32 || (unsigned __int16)((unsigned __int16)(v18 - 3712) >> 7) > 0x1FEu);
      if (v16 <= v67)
      {
        if (CharactersPtr)
        {
          v27 = 0;
          v14 = 0;
          v28 = (UniChar *)&CharactersPtr[v66];
          goto LABEL_72;
        }
        if (v16 <= 64)
        {
          if (v16 > length || v13 >= 1)
          {
            if (v67 >= 64)
              v36.length = 64;
            else
              v36.length = v67;
            v68 = 0;
            length = v36.length;
            v36.location = v66;
            if (v65)
            {
              if (v36.length)
              {
                v37 = &v65[v66];
                v38 = buffer;
                do
                {
                  v39 = *v37++;
                  *v38++ = v39;
                  --v36.length;
                }
                while (v36.length);
              }
            }
            else
            {
              CFStringGetCharacters(theString, v36, buffer);
            }
          }
          v27 = 0;
          v14 = 0;
          v28 = &buffer[-v68];
          goto LABEL_72;
        }
      }
      v54 = v11;
      if (v14 < 1)
      {
LABEL_60:
        v14 = 0;
        goto LABEL_65;
      }
      while (1)
      {
        v20 = v14--;
        v21 = v67;
        if (v67 >= v20)
        {
          if (CharactersPtr)
          {
            v22 = CharactersPtr[v66 + v14];
          }
          else if (v65)
          {
            v22 = v65[v66 + v14];
          }
          else
          {
            v23 = v68;
            v24 = length >= v20 && v68 < v20;
            if (!v24)
            {
              v25 = v20 - 5;
              if ((unint64_t)v20 < 5)
                v25 = 0;
              if (v25 + 64 < v67)
                v21 = v25 + 64;
              v68 = v25;
              length = v21;
              v71.location = v66 + v25;
              v71.length = v21 - v25;
              CFStringGetCharacters(theString, v71, buffer);
              v23 = v68;
            }
            v22 = buffer[v14 - v23];
          }
          if (v22 > 0x84u)
          {
            if (v22 - 8232 < 2 || v22 == 133)
              goto LABEL_63;
          }
          else if (v22 == 13)
          {
            if ((unint64_t)objc_msgSend(0, "length") < 2
              || objc_msgSend(0, "characterAtIndex:", 1) != 10)
            {
              goto LABEL_63;
            }
          }
          else if (v22 == 10 || v22 == 12)
          {
LABEL_63:
            v16 -= v14;
            if (v16 == 1)
              return v14 + a4;
LABEL_65:
            v29 = v16 + v14;
            if (v16 + v14 <= v67)
            {
              if (CharactersPtr)
              {
                v27 = 0;
                v28 = (UniChar *)&CharactersPtr[v66 + v14];
                goto LABEL_71;
              }
              if (v16 > 64)
                goto LABEL_66;
              v24 = v29 <= length;
              v11 = v54;
              if (!v24 || v14 < v68)
              {
                v44 = v14 + 64;
                if (v14 + 64 >= v67)
                  v44 = v67;
                v68 = v14;
                length = v44;
                v45.location = v66 + v14;
                v45.length = v44 - v14;
                if (v65)
                {
                  if (v45.length)
                  {
                    v46 = &v65[v45.location];
                    v47 = v14 - v44;
                    v48 = buffer;
                    do
                    {
                      v49 = *v46++;
                      *v48++ = v49;
                    }
                    while (!__CFADD__(v47++, 1));
                  }
                }
                else
                {
                  CFStringGetCharacters(theString, v45, buffer);
                }
              }
              v27 = 0;
              v28 = &buffer[v14 - v68];
            }
            else
            {
LABEL_66:
              v30 = (UniChar *)NSZoneMalloc((NSZone *)objc_msgSend(a1, "zone", v54), 2 * v16);
              v28 = v30;
              if (CharactersPtr)
              {
                memmove(v30, &CharactersPtr[v66 + v14], 2 * v16);
              }
              else
              {
                if (v14 < v68 || length <= v14)
                {
                  v41 = v30;
                  v42 = v14;
                  v43 = v16;
                  if (v29 > v68)
                  {
                    v41 = v30;
                    v42 = v14;
                    v43 = v16;
                    if (v29 < length)
                    {
                      v43 = v68 - v14;
                      memmove(&v30[v68 - v14], buffer, 2 * (v29 - v68));
                      v41 = v28;
                      v42 = v14;
                    }
                  }
                }
                else
                {
                  if (v16 >= length - v14)
                    v40 = length - v14;
                  else
                    v40 = v16;
                  memmove(v30, &buffer[v14 - v68], 2 * v40);
                  v41 = &v28[v40];
                  v42 = v40 + v14;
                  v43 = v16 - v40;
                }
                if (v43 >= 1)
                {
                  v51.location = v66 + v42;
                  if (v65)
                  {
                    v52 = &v65[v51.location];
                    do
                    {
                      v53 = *v52++;
                      *v41++ = v53;
                      --v43;
                    }
                    while (v43);
                  }
                  else
                  {
                    v51.length = v43;
                    CFStringGetCharacters(theString, v51, v41);
                  }
                }
              }
              v27 = v28;
LABEL_71:
              v11 = v54;
            }
LABEL_72:
            v31 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", NSLanguageAttributeName, v11 - (v10 <= a3), 0);
            v32 = _NSCopyBreakIterator(v31, (uint64_t)v28, v16, 0);
            if (!v32 || (v33 = v32, v34 = ubrk_preceding(), _NSDisposeBreakIterator(v33, v31, 0), v34 == -1))
            {
              v9 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v27)
                return v9;
            }
            else
            {
              v9 = v14 + a4 + v34;
              if (!v27)
                return v9;
            }
            NSZoneFree((NSZone *)objc_msgSend(a1, "zone", v54), v27);
            return v9;
          }
        }
        if ((unint64_t)v20 <= 1)
          goto LABEL_60;
      }
    }
  }
  return v9;
}

- (uint64_t)_isStringDrawingTextStorage
{
  return 0;
}

- (uint64_t)containsAttachmentsInRange:()NSAttributedStringUIFoundationAdditions
{
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (containsAttachmentsInRange__onceToken != -1)
    dispatch_once(&containsAttachmentsInRange__onceToken, &__block_literal_global_66);
  if (containsAttachmentsInRange__checksImageGlyphs)
    return objc_msgSend(a1, "prefersRTFDInRange:", a3, a4);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__NSAttributedString_NSAttributedStringUIFoundationAdditions__containsAttachmentsInRange___block_invoke_2;
  v9[3] = &unk_1E2604428;
  v9[4] = &v10;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), a3, a4, 0, v9);
  v8 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v8;
}

- (uint64_t)rangeOfTextList:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v28;
  BOOL v29;
  unint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v7 = (void *)objc_msgSend(a1, "string");
  if (objc_msgSend(v7, "length") <= a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v44 = 0;
  v45 = 0;
  objc_msgSend(v7, "getParagraphStart:end:contentsEnd:forRange:", &v44, 0, 0, a4, 1);
  v8 = v44 >= a4 ? a4 : v44;
  v9 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v8, &v44);
  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v9;
  v11 = (void *)objc_msgSend(v9, "textLists");
  v12 = objc_msgSend(v11, "indexOfObjectIdenticalTo:", a3);
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
    v14 = v12 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = 1;
  if (!v14)
  {
    v16 = v12;
    v41 = v10;
    v13 = v44;
    v17 = v45 + v44;
    v42 = objc_msgSend(a1, "length");
    v39 = v7;
    v40 = v17;
    if (v13)
    {
      v18 = v41;
      v19 = v41;
      do
      {
        v20 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v13 - 1, &v44, v39);
        v21 = v20;
        if (v20 == v19)
        {
          v28 = 1;
        }
        else if (v20
               && (v22 = (void *)objc_msgSend(v20, "textLists")) != 0
               && (v23 = v22, objc_msgSend(v22, "count") > v16))
        {
          v24 = 1;
          do
          {
            v25 = objc_msgSend(v11, "objectAtIndex:", v24 - 1);
            v26 = objc_msgSend(v23, "objectAtIndex:", v24 - 1);
          }
          while (v25 == v26 && v24++ <= v16);
          v28 = v25 == v26;
          v18 = v41;
        }
        else
        {
          v28 = 0;
        }
        if (v28)
        {
          v19 = v21;
          v13 = v44;
        }
        if (v13)
          v29 = !v28;
        else
          v29 = 1;
      }
      while (!v29);
    }
    else
    {
      v18 = v41;
    }
    for (i = v40; i < v42; i = v45 + v44)
    {
      v31 = v18;
      v32 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), i, &v44);
      v18 = v32;
      if (v32 != v31)
      {
        if (!v32)
          break;
        v33 = (void *)objc_msgSend(v32, "textLists");
        if (!v33)
          break;
        v34 = v33;
        if (objc_msgSend(v33, "count") <= v16)
          break;
        v35 = 1;
        do
        {
          v36 = objc_msgSend(v11, "objectAtIndex:", v35 - 1, v39);
          v37 = objc_msgSend(v34, "objectAtIndex:", v35 - 1);
        }
        while (v36 == v37 && v35++ <= v16);
        if (v36 != v37)
          break;
      }
    }
    if (i > v13)
    {
      v43 = 0;
      objc_msgSend(v39, "getParagraphStart:end:contentsEnd:forRange:", 0, &v43, 0, i - 1, 1);
    }
  }
  return v13;
}

+ (uint64_t)_isAttributedStringAgent
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__NSAttributedString_NSAttributedStringUIFoundationAdditions___isAttributedStringAgent__block_invoke;
  block[3] = &unk_1E2602FF0;
  block[4] = a1;
  if (_isAttributedStringAgent_onceToken != -1)
    dispatch_once(&_isAttributedStringAgent_onceToken, block);
  return _isAttributedStringAgent_isInAgent;
}

+ (uint64_t)allowedSecureCodingClasses
{
  if (allowedSecureCodingClasses_onceToken != -1)
    dispatch_once(&allowedSecureCodingClasses_onceToken, &__block_literal_global_9);
  return allowedSecureCodingClasses_allowedClasses;
}

- (uint64_t)defaultLanguage
{
  return 0;
}

- (uint64_t)doubleClickAtIndex:()NSAttributedStringUIFoundationAdditions
{
  return objc_msgSend(a1, "doubleClickAtIndex:inRange:", a3, 0, objc_msgSend(a1, "length"));
}

- (unint64_t)doubleClickAtIndex:()NSAttributedStringUIFoundationAdditions inRange:
{
  __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  _BOOL4 v15;
  int v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  const UniChar *CharactersPtr;
  int v30;
  UniChar *v31;
  uint64_t v32;
  unint64_t i;
  unsigned int v34;
  int v36;
  uint64_t v37;
  unint64_t v38;
  CFIndex v39;
  CFIndex v40;
  UniChar *v41;
  unsigned int v42;
  int v43;
  BOOL v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  CFIndex v49;
  UniChar *v50;
  UniChar *v51;
  UniChar *v52;
  unsigned int v53;
  int v54;
  BOOL v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  CFIndex v64;
  unint64_t v65;
  int v66;
  void *v67;
  UniChar buffer[256];
  uint64_t v69;
  CFRange v70;
  CFRange v71;
  CFRange v72;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)objc_msgSend(a1, "string");
  v10 = objc_msgSend(a1, "length");
  if (!v10)
    return 0;
  v11 = v10;
  v12 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", a3);
  v13 = v12;
  if (v12 > 132)
  {
    if ((v12 - 8232) >= 2 && v12 != 133)
      goto LABEL_16;
LABEL_12:
    if (a3 && v12 == 10 && -[__CFString characterAtIndex:](v9, "characterAtIndex:", a3 - 1) == 13)
      --a3;
    return a3;
  }
  if (v12 == 10 || v12 == 12)
    goto LABEL_12;
  if (v12 == 13)
  {
    if (a3 + 1 >= -[__CFString length](v9, "length")
      || -[__CFString characterAtIndex:](v9, "characterAtIndex:", a3 + 1) != 10)
    {
      if (a3 + 1 < v11)
        -[__CFString characterAtIndex:](v9, "characterAtIndex:", a3 + 1);
      return a3;
    }
    v14 = 0;
    v15 = a3 != 0;
    v13 = 13;
    goto LABEL_28;
  }
LABEL_16:
  if ((v12 & 0xFC00) == 0xD800 && a3 + 1 < v11)
  {
    v16 = -[__CFString characterAtIndex:](v9, "characterAtIndex:");
    v14 = (v16 & 0xFC00) == 56320;
    if ((v16 & 0xFC00) == 0xDC00)
      v13 = v16 + (v13 << 10) - 56613888;
  }
  else
  {
    v14 = 0;
  }
  v15 = a3 != 0;
  if (a3)
  {
    if ((v13 & 0xFC00) == 0xDC00)
    {
      v18 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", a3 - 1);
      v15 = 1;
      if ((v18 & 0xFC00) == 0xD800)
        v13 = (v18 << 10) + (unsigned __int16)v13 - 56613888;
    }
  }
LABEL_28:
  if (CFUniCharIsMemberOf())
  {
    v19 = a3 - (((v13 & 0xFFFF0000) != 0) & ~v14);
    do
    {
      if (!v19)
      {
        v26 = 0;
        goto LABEL_45;
      }
      v20 = v19--;
      v21 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", v19);
      v22 = v21;
      if (v19)
      {
        if ((v21 & 0xFC00) == 0xDC00)
        {
          v23 = v20 - 2;
          v24 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", v23);
          if ((v24 & 0xFC00) == 0xD800)
          {
            v19 = v23;
            v22 = v22 - 56613888 + (v24 << 10);
          }
        }
      }
    }
    while ((CFUniCharIsMemberOf() & 1) != 0);
    v25 = 1;
    if (HIWORD(v22))
      v25 = 2;
    v26 = v25 + v19;
LABEL_45:
    v32 = 1;
    if (v14)
      v32 = 2;
    for (i = v32 + a3; i < v11; i += v37)
    {
      v34 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", i);
      if ((v34 & 0xFC00) == 0xD800 && i + 1 < v11)
      {
        v36 = -[__CFString characterAtIndex:](v9, "characterAtIndex:");
        if ((v36 & 0xFC00) != 0xDC00)
          return v26;
        v34 = (v34 << 10) - 56613888 + v36;
      }
      if (!CFUniCharIsMemberOf())
        break;
      v37 = HIWORD(v34) ? 2 : 1;
    }
    return v26;
  }
  v27 = v11 == a3 && v15;
  v28 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", NSLanguageAttributeName, a3 - v27, 0);
  CharactersPtr = CFStringGetCharactersPtr(v9);
  if (CharactersPtr)
  {
    v30 = 0;
    v31 = (UniChar *)&CharactersPtr[a4];
    goto LABEL_121;
  }
  if (a5 < 0x100)
    goto LABEL_119;
  v38 = a4 + a5;
  v66 = v14;
  v67 = v28;
  v65 = a4 + a5;
  if (a3 > a4)
  {
    if (a3 - a4 >= 0x100)
      v39 = 256;
    else
      v39 = a3 - a4;
    v40 = a3 - v39;
    while (1)
    {
      v70.location = v40;
      v70.length = v39;
      CFStringGetCharacters(v9, v70, buffer);
      if (v39)
        break;
LABEL_82:
      if (v40 - a4 >= 0x100)
        v39 = 256;
      else
        v39 = v40 - a4;
      v40 -= v39;
      if (!v39)
      {
        v28 = v67;
        v38 = a4 + a5;
        goto LABEL_90;
      }
    }
    v41 = &buffer[v39 - 1];
    while (1)
    {
      v42 = *v41;
      if ((v42 & 0xFC00) == 0xDC00)
      {
        if (buffer >= v41)
        {
          if (v40 != a4)
            ++v40;
LABEL_81:
          v14 = v66;
          goto LABEL_82;
        }
        v43 = *(v41 - 1);
        v44 = (v43 & 0xFC00) == 55296;
        v45 = v42 - 56613888 + (v43 << 10);
        if (v44)
          --v41;
        if (v44)
          v42 = v45;
      }
      if (CFUniCharIsMemberOf())
        break;
      if (buffer > --v41)
        goto LABEL_81;
    }
    v46 = 1;
    if (HIWORD(v42))
      v46 = 2;
    a4 = v40 + v41 - buffer + v46;
    v38 = v65;
    a5 = v65 - a4;
    v14 = v66;
    v28 = v67;
  }
LABEL_90:
  v47 = 1;
  if (v14)
    v47 = 2;
  v48 = v47 + a3;
  if (v47 + a3 >= v38)
    goto LABEL_117;
  while (2)
  {
    if (v38 - v48 >= 0x100)
      v49 = 256;
    else
      v49 = v38 - v48;
    v50 = buffer;
    v71.location = v48;
    v71.length = v49;
    CFStringGetCharacters(v9, v71, buffer);
    v64 = v49;
    v51 = &buffer[v49];
    while (1)
    {
      if (v50 >= v51)
      {
        v57 = v64;
        v38 = v65;
        goto LABEL_111;
      }
      v52 = v50 + 1;
      v53 = *v50;
      if ((v53 & 0xFC00) == 0xD800)
        break;
      ++v50;
LABEL_107:
      if (CFUniCharIsMemberOf())
      {
        v58 = 0x7FFFFFFFFFFFFFFFLL;
        if (HIWORD(v53))
          v58 = 0x7FFFFFFFFFFFFFFELL;
        a5 = v48 - a4 + &v50[v58] - buffer;
        goto LABEL_116;
      }
    }
    if (v52 < v51)
    {
      v54 = *v52;
      v55 = (v54 & 0xFC00) == 56320;
      v56 = (v53 << 10) - 56613888 + v54;
      if (v55)
        v50 += 2;
      else
        ++v50;
      if (v55)
        v53 = v56;
      goto LABEL_107;
    }
    v38 = v65;
    v57 = (__PAIR128__(v64, v64 + v48) - v65) >> 64;
LABEL_111:
    v48 += v57;
    if (v48 < v38)
      continue;
    break;
  }
LABEL_116:
  v28 = v67;
LABEL_117:
  if (a5 >= 0x100)
  {
    v31 = (UniChar *)NSZoneMalloc((NSZone *)objc_msgSend(a1, "zone"), 2 * a5);
    v30 = 1;
    goto LABEL_120;
  }
LABEL_119:
  v30 = 0;
  v31 = buffer;
LABEL_120:
  v72.location = a4;
  v72.length = a5;
  CFStringGetCharacters(v9, v72, v31);
LABEL_121:
  if (a5 == 1)
  {
    v59 = a4;
    goto LABEL_137;
  }
  v67 = v28;
  if (a3 <= a4)
  {
    v60 = 0;
    goto LABEL_130;
  }
  v60 = _NSCopyBreakIterator(v28, (uint64_t)v31, a5, 1u);
  if (!v60)
  {
LABEL_130:
    v63 = 0;
    goto LABEL_131;
  }
  v61 = ubrk_preceding();
  if (v61 == -1)
    v62 = 0;
  else
    v62 = v61;
  v63 = v62;
LABEL_131:
  v59 = v63 + a4;
  if (a5 - v63 < 2)
  {
    if (v60)
LABEL_136:
      _NSDisposeBreakIterator(v60, v67, 1u);
  }
  else if (v60 || (v60 = _NSCopyBreakIterator(v67, (uint64_t)v31, a5, 1u)) != 0)
  {
    ubrk_following();
    goto LABEL_136;
  }
LABEL_137:
  if (v30)
    NSZoneFree((NSZone *)objc_msgSend(a1, "zone"), v31);
  return v59;
}

- (uint64_t)lineBreakBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:
{
  return objc_msgSend(a1, "_lineBreakBeforeIndex:withinRange:lineBreakStrategy:", a3, a4, a5, 0xFFFFLL);
}

- (uint64_t)containsAttachments
{
  return objc_msgSend(a1, "containsAttachmentsInRange:", 0, objc_msgSend(a1, "length"));
}

+ (uint64_t)_documentTypeForFileType:()NSAttributedStringUIFoundationAdditions
{
  if (NSAttributedStringFileTypeToDocumentTypeDictionary_onceToken != -1)
    dispatch_once(&NSAttributedStringFileTypeToDocumentTypeDictionary_onceToken, &__block_literal_global_193);
  return objc_msgSend((id)NSAttributedStringFileTypeToDocumentTypeDictionary___fileTypeToDocTypeDict, "objectForKey:", a3);
}

- (const)stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:()NSAttributedStringUIFoundationAdditions
{
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int16 v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  BOOL v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  __CFString *v47;
  void *v48;
  __int16 v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v7 = (__CFString *)objc_msgSend(a1, "string");
  v48 = a1;
  v8 = objc_msgSend(a1, "length");
  v9 = _NSAttachmentCharacterSet();
  v10 = a3 + a4;
  v52 = a3 + a4;
  if (!a4)
    return &stru_1E260C7D0;
  v42 = v8;
  v43 = a4;
  v44 = v9;
  v11 = 0;
  v53 = 0;
  v54 = 0;
  v46 = a3;
  v47 = v7;
  if (a3 < v10)
  {
    v12 = 0;
    v45 = a3 + a4;
    while (1)
    {
      v50 = 0;
      v51 = 0;
      v13 = (void *)objc_msgSend(v48, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a3, 0);
      if (v13)
        v14 = objc_msgSend(v13, "baseWritingDirection");
      else
        v14 = -1;
      v49 = 0;
      -[__CFString getParagraphStart:end:contentsEnd:forRange:](v7, "getParagraphStart:end:contentsEnd:forRange:", &v51, &v52, &v50, a3, 0);
      v15 = v51;
      if (v51 < a3)
      {
        v51 = a3;
        v15 = a3;
      }
      if (v50 <= a3)
        v16 = a3;
      else
        v16 = v50;
      if (v16 >= v10)
        v17 = v10;
      else
        v17 = v16;
      if (v50 < a3 || v16 > v10)
        v50 = v17;
      if (v52 > v10)
        v52 = v10;
      if (v14 != -1 && v17 > v15)
      {
        v18 = _NSStringImputedBaseWritingDirectionAtIndex(v7, v15, v15, v17 - v15);
        if (v18 != -1 && v18 != v14)
        {
          if (v14 == 1)
            v20 = 8207;
          else
            v20 = 8206;
          v49 = v20;
          if (!v12)
            v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[__CFString substringWithRange:](v7, "substringWithRange:", v46, v51 - v46));
          objc_msgSend(v12, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v49, 1));
        }
      }
      v21 = v50;
      v22 = v51;
      if (v51 < v50)
        break;
      if (v12)
      {
        v49 = 8236;
LABEL_67:
        if (v52 > v21)
          objc_msgSend(v12, "appendString:", -[__CFString substringWithRange:](v7, "substringWithRange:"));
        v11 = v12;
        goto LABEL_71;
      }
      v11 = 0;
LABEL_71:
      a3 = v52;
      v12 = v11;
      v10 = v45;
      if (v52 >= v45)
        goto LABEL_72;
    }
    v23 = 0;
    v24 = 0;
    do
    {
      while (1)
      {
        v25 = (void *)objc_msgSend(v48, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSWritingDirection"), v22, &v53, v22, v21 - v22);
        v26 = objc_msgSend(v25, "count");
        v27 = v26;
        v28 = 0;
        if (v24 >= v26)
          v29 = v26;
        else
          v29 = v24;
        if (v29)
        {
          while (objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", v28), "isEqual:", objc_msgSend(v23, "objectAtIndex:", v28)))
          {
            if (v29 == ++v28)
            {
              v28 = v29;
              break;
            }
          }
          v7 = v47;
        }
        if (v24 | v27)
          v30 = v12 == 0;
        else
          v30 = 0;
        if (v30)
          v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[__CFString substringWithRange:](v7, "substringWithRange:", v46, v22 - v46));
        v49 = 8236;
        v31 = v24 > v28;
        v32 = v24 - v28;
        if (v31)
        {
          do
          {
            objc_msgSend(v12, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v49, 1));
            --v32;
          }
          while (v32);
        }
        if (v28 < v27)
        {
          do
          {
            v49 = 8234;
            v33 = objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", v28), "unsignedIntegerValue");
            if ((v33 & 1) != 0)
              ++v49;
            if ((v33 & 2) != 0)
              v49 += 3;
            objc_msgSend(v12, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v49, 1));
            ++v28;
          }
          while (v27 != v28);
        }
        if (v12)
          break;
        v11 = 0;
        v22 += v54;
        v21 = v50;
        v23 = v25;
        v24 = v27;
        if (v22 >= v50)
          goto LABEL_71;
      }
      objc_msgSend(v12, "appendString:", -[__CFString substringWithRange:](v7, "substringWithRange:", v53, v54));
      v22 += v54;
      v21 = v50;
      v23 = v25;
      v24 = v27;
    }
    while (v22 < v50);
    v49 = 8236;
    if (v27)
    {
      do
      {
        objc_msgSend(v12, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v49, 1));
        --v27;
      }
      while (v27);
      v21 = v50;
    }
    goto LABEL_67;
  }
LABEL_72:
  if (-[__CFString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v44, 0, v46, v43) == 0x7FFFFFFFFFFFFFFFLL|| !v34)
  {
    if (!v11)
    {
      if (v46 || v43 != v42)
        return (const __CFString *)-[__CFString substringWithRange:](v47, "substringWithRange:", v46, v43);
      else
        return v47;
    }
  }
  else
  {
    if (!v11)
    {
      v35 = (void *)MEMORY[0x1E0CB37A0];
      if (v46 || v43 != v42)
        v36 = -[__CFString substringWithRange:](v47, "substringWithRange:", v46, v43);
      else
        v36 = (uint64_t)v47;
      v11 = (void *)objc_msgSend(v35, "stringWithString:", v36);
    }
    v37 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v44);
    if (v37 != 0x7FFFFFFFFFFFFFFFLL && v38)
    {
      v39 = v37;
      do
      {
        objc_msgSend(v11, "replaceCharactersInRange:withString:", v39, v38, &stru_1E260C7D0);
        v40 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v44);
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v39 = v40;
      }
      while (v38);
    }
  }
  return (const __CFString *)v11;
}

- (id)dataFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:error:
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  CFStringEncoding v15;
  void *v16;
  NSHTMLWriter **v17;
  NSHTMLWriter *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSHTMLWriter *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSHTMLWriter *v31;
  id v32;

  v32 = 0;
  v11 = objc_msgSend(a5, "objectForKey:", CFSTR("DocumentType"));
  if (a3 || (v12 = a1, a4 != objc_msgSend(a1, "length")))
    v12 = (void *)objc_msgSend(a1, "attributedSubstringFromRange:", a3, a4);
  v31 = 0;
  if (!v11)
  {
    v13 = objc_msgSend(a5, "objectForKey:", CFSTR("UTI"));
    if (v13)
      v11 = objc_msgSend(MEMORY[0x1E0CB3498], "_documentTypeForFileType:", v13);
    else
      v11 = 0;
  }
  if (!objc_msgSend(CFSTR("NSPlainText"), "isEqual:", v11))
  {
    if (objc_msgSend(CFSTR("NSRTF"), "isEqual:", v11))
    {
      v18 = (NSHTMLWriter *)-[NSRTFWriter initWithAttributedString:]([NSRTFWriter alloc], v12);
      if (v18)
      {
        v24 = v18;
        if (a5)
          -[NSRTFWriter setDocumentAttributes:]((uint64_t)v18, a5);
        v25 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("TextScaling"));
        v26 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("SourceTextScaling"));
        if (v26 && v25)
        {
          -[NSRTFWriter _setTextScalingConversionSource:]((uint64_t)v24, objc_msgSend(v26, "integerValue"));
          -[NSRTFWriter _setTextScalingConversionTarget:]((uint64_t)v24, objc_msgSend(v25, "integerValue"));
        }
        v27 = (id)-[NSRTFWriter RTF]((uint64_t)v24);
        goto LABEL_48;
      }
LABEL_50:
      v19 = 0;
      goto LABEL_51;
    }
    if (objc_msgSend(CFSTR("NSRTFD"), "isEqual:", v11))
    {
      v18 = (NSHTMLWriter *)-[NSRTFWriter initWithAttributedString:]([NSRTFWriter alloc], v12);
      if (!v18)
        goto LABEL_50;
      v24 = v18;
      if (a5)
        -[NSRTFWriter setDocumentAttributes:]((uint64_t)v18, a5);
      v28 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("TextScaling"));
      v29 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("SourceTextScaling"));
      if (v29 && v28)
      {
        -[NSRTFWriter _setTextScalingConversionSource:]((uint64_t)v24, objc_msgSend(v29, "integerValue"));
        -[NSRTFWriter _setTextScalingConversionTarget:]((uint64_t)v24, objc_msgSend(v28, "integerValue"));
      }
      v27 = (id)-[NSRTFWriter RTFD]((uint64_t)v24);
    }
    else if (objc_msgSend(CFSTR("NSHTML"), "isEqual:", v11))
    {
      v18 = -[NSHTMLWriter initWithAttributedString:]([NSHTMLWriter alloc], "initWithAttributedString:", v12);
      if (!v18)
        goto LABEL_50;
      v24 = v18;
      if (a5)
        -[NSHTMLWriter setDocumentAttributes:](v18, "setDocumentAttributes:", a5);
      v27 = -[NSHTMLWriter HTMLData](v24, "HTMLData");
    }
    else
    {
      if (!objc_msgSend(CFSTR("NSWebArchive"), "isEqual:", v11))
      {
        if (!a6)
          return 0;
        v18 = (NSHTMLWriter *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 66062, 0);
        v19 = 0;
        v31 = v18;
        goto LABEL_52;
      }
      v18 = -[NSHTMLWriter initWithAttributedString:]([NSHTMLWriter alloc], "initWithAttributedString:", v12);
      if (!v18)
        goto LABEL_50;
      v24 = v18;
      if (a5)
        -[NSHTMLWriter setDocumentAttributes:](v18, "setDocumentAttributes:", a5);
      v27 = -[NSHTMLWriter webArchiveData](v24, "webArchiveData");
    }
LABEL_48:
    v19 = v27;
    v32 = v19;

    v18 = 0;
    if (!a6)
      return v19;
    goto LABEL_52;
  }
  v14 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("CharacterEncoding")), "unsignedIntegerValue");
  if (!v14)
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
  v15 = CFStringConvertNSStringEncodingToEncoding(v14);
  if (v15 != 1586 && (v15 & 0xFFF) != 0x100
    || (v16 = (void *)objc_msgSend(a1, "stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:", a3, a4)) == 0)
  {
    v16 = (void *)objc_msgSend(v12, "string");
  }
  if (a6)
    v17 = &v31;
  else
    v17 = 0;
  objc_msgSend(v16, "getExternalRepresentation:extendedAttributes:forWritingToURLOrPath:usingEncoding:error:", &v32, 0, 0, v14, v17);
  v18 = v31;
  v19 = v32;
  if (!a6 || v32 || v31)
  {
LABEL_51:
    if (!a6)
      return v19;
    goto LABEL_52;
  }
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = *MEMORY[0x1E0CB28A8];
  v22 = (void *)MEMORY[0x1E0C99D80];
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v18 = (NSHTMLWriter *)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 517, objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1E0CB31F0], 0));
  v31 = v18;
  v19 = v32;
LABEL_52:
  if (!v19)
  {
    if (v18)
    {
      v19 = 0;
    }
    else
    {
      v18 = (NSHTMLWriter *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
      v19 = v32;
    }
    *a6 = v18;
  }
  return v19;
}

- (_QWORD)fileWrapperFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:error:
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  CFStringEncoding v15;
  void *v16;
  uint64_t *v17;
  _QWORD *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSHTMLWriter *v26;
  NSHTMLWriter *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  NSHTMLWriter *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v11 = objc_msgSend(a5, "objectForKey:", CFSTR("DocumentType"));
  if (a3 || (v12 = a1, a4 != objc_msgSend(a1, "length")))
    v12 = (void *)objc_msgSend(a1, "attributedSubstringFromRange:", a3, a4);
  v37 = 0;
  if (!v11)
  {
    v13 = objc_msgSend(a5, "objectForKey:", CFSTR("UTI"));
    if (v13)
      v11 = objc_msgSend(MEMORY[0x1E0CB3498], "_documentTypeForFileType:", v13);
    else
      v11 = 0;
  }
  if (objc_msgSend(CFSTR("NSPlainText"), "isEqual:", v11))
  {
    v35 = 0;
    v36 = 0;
    v14 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("CharacterEncoding")), "unsignedIntegerValue");
    if (!v14)
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    v15 = CFStringConvertNSStringEncodingToEncoding(v14);
    if (v15 != 1586 && (v15 & 0xFFF) != 0x100
      || (v16 = (void *)objc_msgSend(a1, "stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:", a3, a4)) == 0)
    {
      v16 = (void *)objc_msgSend(v12, "string");
    }
    if (a6)
      v17 = &v37;
    else
      v17 = 0;
    v18 = 0;
    if (objc_msgSend(v16, "getExternalRepresentation:extendedAttributes:forWritingToURLOrPath:usingEncoding:error:", &v36, &v35, 0, v14, v17))
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3650]);
      v20 = (id)objc_msgSend(v19, "initRegularFileWithContents:", v36);
      v18 = v20;
      if (v35)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v20, "fileAttributes"));
        objc_msgSend(v21, "setObject:forKey:", v35, *MEMORY[0x1E0CB2A40]);
        objc_msgSend(v18, "setFileAttributes:", v21);
      }
    }
    if (a6 && !v18 && !v37)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB28A8];
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v37 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 517, objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, *MEMORY[0x1E0CB31F0], 0));
    }
    goto LABEL_45;
  }
  if (objc_msgSend(CFSTR("NSRTFD"), "isEqual:", v11))
  {
    v26 = (NSHTMLWriter *)-[NSRTFWriter initWithAttributedString:]([NSRTFWriter alloc], v12);
    if (v26)
    {
      v27 = v26;
      if (a5)
        -[NSRTFWriter setDocumentAttributes:]((uint64_t)v26, a5);
      v28 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("TextScaling"));
      v29 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("SourceTextScaling"));
      if (v29 && v28)
      {
        -[NSRTFWriter _setTextScalingConversionSource:]((uint64_t)v27, objc_msgSend(v29, "integerValue"));
        -[NSRTFWriter _setTextScalingConversionTarget:]((uint64_t)v27, objc_msgSend(v28, "integerValue"));
      }
      v30 = -[NSRTFWriter RTFDFileWrapper](v27);
LABEL_38:
      v18 = v30;

      goto LABEL_45;
    }
    goto LABEL_39;
  }
  if (objc_msgSend(CFSTR("NSHTML"), "isEqual:", v11))
  {
    v31 = -[NSHTMLWriter initWithAttributedString:]([NSHTMLWriter alloc], "initWithAttributedString:", v12);
    if (v31)
    {
      v27 = v31;
      if (a5)
        -[NSHTMLWriter setDocumentAttributes:](v31, "setDocumentAttributes:", a5);
      v30 = -[NSHTMLWriter HTMLFileWrapper](v27, "HTMLFileWrapper");
      goto LABEL_38;
    }
LABEL_39:
    v18 = 0;
    goto LABEL_45;
  }
  if (a6)
    v32 = &v37;
  else
    v32 = 0;
  v18 = (_QWORD *)objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, a5, v32);
  if (v18)
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", v18);
LABEL_45:
  if (a6 && !v18)
  {
    v33 = v37;
    if (!v37)
      v33 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
    *a6 = v33;
  }
  return v18;
}

- (uint64_t)RTFFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("NSRTF"), CFSTR("DocumentType"));
  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)RTFDFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("NSRTFD"), CFSTR("DocumentType"));
  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)RTFDFileWrapperFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("NSRTFD"), CFSTR("DocumentType"));
  return objc_msgSend(a1, "fileWrapperFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)docFormatFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return 0;
}

- (uint64_t)_htmlDocumentFragmentString:()NSAttributedStringUIFoundationAdditions documentAttributes:subresources:
{
  void *v10;
  NSHTMLWriter *v11;
  NSHTMLWriter *v12;
  uint64_t v13;

  v10 = a1;
  if (a3 || a4 != objc_msgSend(a1, "length"))
    v10 = (void *)objc_msgSend(v10, "attributedSubstringFromRange:", a3, a4);
  v11 = -[NSHTMLWriter initWithAttributedString:]([NSHTMLWriter alloc], "initWithAttributedString:", v10);
  if (!v11)
    return 0;
  v12 = v11;
  if (a5)
    -[NSHTMLWriter setDocumentAttributes:](v11, "setDocumentAttributes:", a5);
  v13 = -[NSHTMLWriter documentFragmentString](v12, "documentFragmentString");
  if (a6)
    *a6 = -[NSHTMLWriter subresources](v12, "subresources");

  return v13;
}

- (uint64_t)_documentFromRange:()NSAttributedStringUIFoundationAdditions document:documentAttributes:subresources:
{
  void *v12;
  NSHTMLWriter *v13;
  NSHTMLWriter *v14;
  uint64_t v15;

  v12 = a1;
  if (a3 || a4 != objc_msgSend(a1, "length"))
    v12 = (void *)objc_msgSend(v12, "attributedSubstringFromRange:", a3, a4);
  v13 = -[NSHTMLWriter initWithAttributedString:]([NSHTMLWriter alloc], "initWithAttributedString:", v12);
  if (!v13)
    return 0;
  v14 = v13;
  if (a6)
    -[NSHTMLWriter setDocumentAttributes:](v13, "setDocumentAttributes:", a6);
  v15 = -[NSHTMLWriter documentFragmentForDocument:](v14, "documentFragmentForDocument:", a5);
  if (a7)
    *a7 = -[NSHTMLWriter subresources](v14, "subresources");

  return v15;
}

- (id)initWithData:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)NSAttributedString_0;
  v10 = objc_msgSendSuper2(&v17, sel_init);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (void *)objc_msgSend(v10, "init");
    else
      v11 = 0;
    v12 = _NSReadAttributedStringFromURLOrData(v11, 0, a3, a4, a5, a6);
    v13 = (void *)v12;
    if (!v12)
      goto LABEL_9;
    if ((id)v12 != v10)
    {
      v14 = objc_opt_class();
      if (v14 != objc_opt_class())
      {
        v15 = objc_msgSend(v10, "initWithAttributedString:", v13);
        v10 = v13;
        v13 = (void *)v15;
      }
LABEL_9:

      return v13;
    }
  }
  return v10;
}

- (void)_initWithRTFSelector:()NSAttributedStringUIFoundationAdditions argument:documentAttributes:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  objc_super v19;

  v19.receiver = a1;
  v19.super_class = (Class)NSAttributedString_0;
  v8 = objc_msgSendSuper2(&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = -[NSRTFReader performSelector:withObject:](+[NSRTFReader allocWithZone:](NSRTFReader, "allocWithZone:", objc_msgSend(v8, "zone")), "performSelector:withObject:", a3, a4);
    if (v10)
    {
      v11 = (void *)v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "init");
        objc_msgSend(v11, "setMutableAttributedString:", v9);
      }
      v12 = objc_msgSend(v11, "attributedString");
      if (v12)
      {
        v13 = (void *)v12;
        if ((void *)v12 != v9)
        {
          v14 = objc_opt_class();
          if (v14 == objc_opt_class())
          {

            v15 = v13;
          }
          else
          {
            v15 = (id)objc_msgSend(v9, "initWithAttributedString:", v13);
          }
          v9 = v15;
        }
        if (a5)
        {
          v16 = (void *)objc_msgSend(v11, "documentAttributes");
          if (v16)
            v17 = (id)objc_msgSend(v16, "mutableCopy");
          else
            v17 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          *a5 = v17;
        }
        goto LABEL_18;
      }

    }
    v11 = v9;
    v9 = 0;
LABEL_18:

  }
  return v9;
}

- (uint64_t)initWithRTF:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return objc_msgSend(a1, "initWithData:options:documentAttributes:error:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("NSRTF"), CFSTR("DocumentType"), 0), a4, 0);
}

- (uint64_t)initWithRTFD:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return objc_msgSend(a1, "initWithData:options:documentAttributes:error:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("NSRTFD"), CFSTR("DocumentType"), 0), a4, 0);
}

- (uint64_t)initWithRTFDFileWrapper:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return objc_msgSend(a1, "_initWithRTFSelector:argument:documentAttributes:", sel_initWithRTFDFileWrapper_, a3, a4);
}

- (uint64_t)initWithDocFormat:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return 0;
}

- (id)initWithURL:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = a1;
  v19.super_class = (Class)NSAttributedString_0;
  v10 = objc_msgSendSuper2(&v19, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
    v12 = v11;
    if (a3 && !objc_msgSend(v11, "objectForKey:", CFSTR("BaseURL")))
      objc_msgSend(v12, "setObject:forKey:", a3, CFSTR("BaseURL"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = (void *)objc_msgSend(v10, "init");
    else
      v13 = 0;
    v14 = _NSReadAttributedStringFromURLOrData(v13, a3, 0, v12, a5, a6);
    v15 = (void *)v14;
    if (!v14)
      goto LABEL_12;
    if ((id)v14 != v10)
    {
      v16 = objc_opt_class();
      if (v16 != objc_opt_class())
      {
        v17 = objc_msgSend(v10, "initWithAttributedString:", v15);
        v10 = v15;
        v15 = (void *)v17;
      }
LABEL_12:

      return v15;
    }
  }
  return v10;
}

- (uint64_t)_initWithURLFunnel:()NSAttributedStringUIFoundationAdditions options:documentAttributes:
{
  return objc_msgSend(a1, "initWithURL:options:documentAttributes:error:", a3, a4, a5, 0);
}

- (uint64_t)initWithURL:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return objc_msgSend(a1, "initWithURL:options:documentAttributes:error:", a3, 0, a4, 0);
}

- (uint64_t)initWithPath:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return objc_msgSend(a1, "initWithURL:options:documentAttributes:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:"), 0, a4, 0);
}

- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions options:documentAttributes:
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("NSHTML"), CFSTR("DocumentType"));
  return objc_msgSend(a1, "initWithData:options:documentAttributes:error:", a3, v8, a5, 0);
}

- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return objc_msgSend(a1, "initWithHTML:options:documentAttributes:", a3, 0, a4);
}

- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions baseURL:documentAttributes:
{
  if (a4)
    a4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, CFSTR("BaseURL"), 0);
  return objc_msgSend(a1, "initWithHTML:options:documentAttributes:", a3, a4, a5);
}

+ (_NSAttributedStringAsyncReadReply)readFromURL:()NSAttributedStringUIFoundationAdditions options:completionHandler:
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromURL_options_completionHandler___block_invoke;
  v6[3] = &unk_1E2604450;
  v6[4] = a1;
  v6[5] = a5;
  return _NSReadAttributedStringFromURLOrDataAsync(a3, 0, a4, (uint64_t)v6);
}

+ (_NSAttributedStringAsyncReadReply)readFromData:()NSAttributedStringUIFoundationAdditions options:completionHandler:
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromData_options_completionHandler___block_invoke;
  v6[3] = &unk_1E2604450;
  v6[4] = a1;
  v6[5] = a5;
  return _NSReadAttributedStringFromURLOrDataAsync(0, a3, a4, (uint64_t)v6);
}

- (id)_initWithHTMLData:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:
{
  id v10;
  uint64_t v11;
  id v13;
  objc_super v14;

  v14.receiver = a1;
  v14.super_class = (Class)NSAttributedString_0;
  v10 = objc_msgSendSuper2(&v14, sel_init);
  if (v10)
  {
    v13 = 0;
    if (_NSReadAttributedStringFromHTMLData(a3, a4, 0, &v13, a5, a6))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (id)objc_msgSend(v10, "init");
        objc_msgSend(v10, "setAttributedString:", v13);
      }
      else
      {
        v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {

          return v13;
        }
        v10 = (id)objc_msgSend(v10, "initWithAttributedString:", v13);
      }

    }
    else
    {

      return 0;
    }
  }
  return v10;
}

+ (uint64_t)fontStyleAttributeNames
{
  _QWORD v1[20];

  v1[19] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("NSFont");
  v1[1] = CFSTR("NSColor");
  v1[2] = CFSTR("NSUnderline");
  v1[3] = CFSTR("NSSuperScript");
  v1[4] = CFSTR("NSBackgroundColor");
  v1[5] = CFSTR("NSLigature");
  v1[6] = CFSTR("NSBaselineOffset");
  v1[7] = CFSTR("NSKern");
  v1[8] = CFSTR("NSStrokeWidth");
  v1[9] = CFSTR("NSStrokeColor");
  v1[10] = CFSTR("NSUnderlineColor");
  v1[11] = CFSTR("NSStrikethrough");
  v1[12] = CFSTR("NSStrikethroughColor");
  v1[13] = CFSTR("NSShadow");
  v1[14] = CFSTR("NSObliqueness");
  v1[15] = CFSTR("NSExpansion");
  v1[16] = NSTypographyFeatureAttributeName;
  v1[17] = CFSTR("NSTextHighlightStyle");
  v1[18] = CFSTR("NSTextHighlightColorScheme");
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 19);
}

- (id)fontAttributesInRange:()NSAttributedStringUIFoundationAdditions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a1, "attributesAtIndex:effectiveRange:", a3, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "fontStyleAttributeNames", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v3, "objectForKey:", v10);
        if (v11)
        {
          v12 = v11;
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (v7)
    return v7;
  else
    return (id)MEMORY[0x1E0C9AA70];
}

- (id)rulerAttributesInRange:()NSAttributedStringUIFoundationAdditions
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_msgSend(a1, "attributesAtIndex:effectiveRange:", a3, 0), "objectForKey:", CFSTR("NSParagraphStyle"));
  if (v3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, CFSTR("NSParagraphStyle"), 0);
  else
    return +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary");
}

- (uint64_t)rangeOfTextBlock:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v23;
  BOOL v24;
  unint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = a1;
  v38 = 0;
  v39 = 0;
  v6 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, &v38);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "textBlocks");
  v9 = objc_msgSend(v8, "indexOfObjectIdenticalTo:", a3);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
    v11 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = v9;
    v10 = v38;
    v13 = v39 + v38;
    v36 = v5;
    v37 = objc_msgSend(v5, "length");
    v35 = v13;
    if (v10)
    {
      v14 = v7;
      do
      {
        v15 = (void *)objc_msgSend(v5, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v10 - 1, &v38, v35);
        v16 = v15;
        if (v15 == v14)
        {
          v23 = 1;
        }
        else if (v15
               && (v17 = (void *)objc_msgSend(v15, "textBlocks")) != 0
               && (v18 = v17, objc_msgSend(v17, "count") > v12))
        {
          v19 = 1;
          do
          {
            v20 = objc_msgSend(v8, "objectAtIndex:", v19 - 1);
            v21 = objc_msgSend(v18, "objectAtIndex:", v19 - 1);
          }
          while (v20 == v21 && v19++ <= v12);
          v23 = v20 == v21;
          v5 = v36;
        }
        else
        {
          v23 = 0;
        }
        if (v23)
        {
          v14 = v16;
          v10 = v38;
        }
        if (v10)
          v24 = !v23;
        else
          v24 = 1;
      }
      while (!v24);
    }
    for (i = v35; i < v37; i = v39 + v38)
    {
      v26 = v7;
      v27 = (void *)objc_msgSend(v5, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), i, &v38);
      v7 = v27;
      if (v27 != v26)
      {
        if (!v27)
          break;
        v28 = (void *)objc_msgSend(v27, "textBlocks");
        if (!v28)
          break;
        v29 = v28;
        if (objc_msgSend(v28, "count") <= v12)
          break;
        v30 = 1;
        do
        {
          v31 = objc_msgSend(v8, "objectAtIndex:", v30 - 1, v35);
          v32 = objc_msgSend(v29, "objectAtIndex:", v30 - 1);
        }
        while (v31 == v32 && v30++ <= v12);
        v5 = v36;
        if (v31 != v32)
          break;
      }
    }
  }
  return v10;
}

- (uint64_t)rangeOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v25;
  void *v26;
  BOOL v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v38;
  void *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v5 = a1;
  v46 = 0;
  v47 = 0;
  v6 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, &v46);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "textBlocks");
  v9 = objc_msgSend(v8, "count");
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    v11 = v9;
    v12 = 1;
    do
    {
      v13 = v12 - 1;
      v14 = (void *)objc_msgSend(v8, "objectAtIndex:", v12 - 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v14, "table") != a3)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v12 >= v11)
        break;
      ++v12;
    }
    while (v13 == 0x7FFFFFFFFFFFFFFFLL);
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 && v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v44 = a3;
      v10 = v46;
      v15 = v47 + v46;
      v45 = objc_msgSend(v5, "length");
      v42 = v7;
      if (v10)
      {
        v16 = v7;
        v43 = v5;
        do
        {
          v17 = (void *)objc_msgSend(v5, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v10 - 1, &v46);
          v18 = v17;
          if (v17 == v16)
          {
            v25 = 1;
          }
          else
          {
            if (!v17)
              goto LABEL_31;
            v19 = (void *)objc_msgSend(v17, "textBlocks");
            if (!v19)
              goto LABEL_31;
            v20 = v19;
            if (objc_msgSend(v19, "count") <= v13)
              goto LABEL_31;
            if (v13)
            {
              v21 = 1;
              do
              {
                v22 = objc_msgSend(v8, "objectAtIndex:", v21 - 1);
                v23 = objc_msgSend(v20, "objectAtIndex:", v21 - 1);
              }
              while (v22 == v23 && v21++ < v13);
              v25 = v22 == v23;
              v5 = v43;
            }
            else
            {
              v25 = 1;
            }
            v26 = (void *)objc_msgSend(v20, "objectAtIndex:", v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v26, "table") != v44)
LABEL_31:
              v25 = 0;
          }
          if (v25)
          {
            v16 = v18;
            v10 = v46;
          }
          if (v10)
            v27 = !v25;
          else
            v27 = 1;
        }
        while (!v27);
      }
      v28 = v15;
      if (v15 < v45)
      {
        v29 = v42;
        do
        {
          v30 = v29;
          v31 = (void *)objc_msgSend(v5, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v28, &v46);
          v29 = v31;
          if (v31 != v30)
          {
            if (!v31)
              break;
            v32 = (void *)objc_msgSend(v31, "textBlocks");
            if (!v32)
              break;
            v33 = v32;
            if (objc_msgSend(v32, "count") <= v13)
              break;
            if (v13)
            {
              v34 = 1;
              do
              {
                v35 = objc_msgSend(v8, "objectAtIndex:", v34 - 1);
                v36 = objc_msgSend(v33, "objectAtIndex:", v34 - 1);
              }
              while (v35 == v36 && v34++ < v13);
              v38 = v35 == v36;
            }
            else
            {
              v38 = 1;
            }
            v39 = (void *)objc_msgSend(v33, "objectAtIndex:", v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            v40 = objc_msgSend(v39, "table");
            if (!v38 || v40 != v44)
              break;
          }
          v28 = v47 + v46;
        }
        while (v47 + v46 < v45);
      }
    }
  }
  return v10;
}

- (uint64_t)_atStartOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *v7;
  BOOL v8;
  uint64_t result;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v24;
  _QWORD v25[2];

  v25[0] = 0;
  v25[1] = 0;
  v7 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, v25);
  if (v7)
    v8 = v25[0] == a4;
  else
    v8 = 0;
  if (!v8)
    return 0;
  v10 = v7;
  v11 = (void *)objc_msgSend(v7, "textBlocks");
  result = objc_msgSend(v11, "count");
  if (result)
  {
    v12 = result;
    v13 = 1;
    do
    {
      v14 = v13 - 1;
      v15 = (void *)objc_msgSend(v11, "objectAtIndex:", v13 - 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v15, "table") != a3)
          v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v13 >= v12)
        break;
      ++v13;
    }
    while (v14 == 0x7FFFFFFFFFFFFFFFLL);
    result = 0;
    if (v11)
    {
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v25[0])
        {
          v16 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v25[0] - 1, v25);
          if (v16 == v10)
          {
            v22 = 1;
            return !v22;
          }
          if (v16)
          {
            v17 = (void *)objc_msgSend(v16, "textBlocks");
            if (v17)
            {
              v18 = v17;
              if (objc_msgSend(v17, "count") > v14)
              {
                if (v14)
                {
                  v19 = 1;
                  do
                  {
                    v20 = objc_msgSend(v11, "objectAtIndex:", v19 - 1);
                    v21 = objc_msgSend(v18, "objectAtIndex:", v19 - 1);
                    v22 = v20 == v21;
                  }
                  while (v20 == v21 && v19++ < v14);
                }
                else
                {
                  v22 = 1;
                }
                v24 = (void *)objc_msgSend(v18, "objectAtIndex:", v14);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v24, "table") == a3)
                  return !v22;
              }
            }
          }
        }
        v22 = 0;
        return !v22;
      }
    }
  }
  return result;
}

- (void)_atEndOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *result;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  result = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, &v24);
  if (result)
  {
    if (a4 + 1 != v25 + v24)
      return 0;
    v8 = result;
    v9 = (void *)objc_msgSend(result, "textBlocks");
    result = (void *)objc_msgSend(v9, "count");
    if (result)
    {
      v10 = (unint64_t)result;
      v11 = 1;
      do
      {
        v12 = v11 - 1;
        v13 = (void *)objc_msgSend(v9, "objectAtIndex:", v11 - 1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v13, "table") != a3)
            v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v11 >= v10)
          break;
        ++v11;
      }
      while (v12 == 0x7FFFFFFFFFFFFFFFLL);
      result = 0;
      if (v9)
      {
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v25 + v24;
          if (v14 < objc_msgSend(a1, "length"))
          {
            v15 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v14, &v24);
            if (v15 == v8)
            {
              v21 = 1;
              return (void *)!v21;
            }
            if (v15)
            {
              v16 = (void *)objc_msgSend(v15, "textBlocks");
              if (v16)
              {
                v17 = v16;
                if (objc_msgSend(v16, "count") > v12)
                {
                  if (v12)
                  {
                    v18 = 1;
                    do
                    {
                      v19 = objc_msgSend(v9, "objectAtIndex:", v18 - 1);
                      v20 = objc_msgSend(v17, "objectAtIndex:", v18 - 1);
                      v21 = v19 == v20;
                    }
                    while (v19 == v20 && v18++ < v12);
                  }
                  else
                  {
                    v21 = 1;
                  }
                  v23 = (void *)objc_msgSend(v17, "objectAtIndex:", v12);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v23, "table") == a3)
                    return (void *)!v21;
                }
              }
            }
          }
          v21 = 0;
          return (void *)!v21;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_rangeOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:completeRow:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v32;
  _BOOL4 v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;

  v48 = 0;
  v49 = 0;
  v7 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:");
  v8 = objc_msgSend(a3, "numberOfColumns");
  if (!v7)
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v37 = 1;
    if (!a5)
      return v12;
    goto LABEL_52;
  }
  v9 = v8;
  v10 = (void *)objc_msgSend(v7, "textBlocks");
  v11 = objc_msgSend(v10, "count");
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
  {
    v13 = v11;
    v44 = v7;
    v46 = 0;
    v40 = v9;
    v14 = 0;
    v15 = 1;
    v16 = 1;
    do
    {
      v17 = v15 - 1;
      v18 = (void *)objc_msgSend(v10, "objectAtIndex:", v15 - 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (void *)objc_msgSend(v18, "table") == a3)
      {
        v46 = objc_msgSend(v18, "startingRow");
        v14 = objc_msgSend(v18, "columnSpan");
        if (objc_msgSend(v18, "rowSpan") > 1)
          v16 = 0;
      }
      else
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v15 >= v13)
        break;
      ++v15;
    }
    while (v17 == 0x7FFFFFFFFFFFFFFFLL);
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10 && v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = v14;
      v12 = v48;
      v43 = v49 + v48;
      v42 = objc_msgSend(a1, "length");
      objc_msgSend(v10, "objectAtIndex:", v17);
      v41 = a5;
      v19 = objc_msgSend(v10, "objectAtIndex:", v17);
      v20 = v43;
      if (v43 < v42)
      {
        v21 = (void *)v19;
        v22 = a5;
        v23 = v39;
        v24 = v44;
        while (1)
        {
          v25 = v24;
          v24 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v20, &v48);
          if (v24 != v25)
            break;
          v34 = v42;
LABEL_42:
          v20 = v49 + v48;
          if (v49 + v48 >= v34)
            goto LABEL_48;
        }
        if (!v24)
          goto LABEL_48;
        v45 = v24;
        v26 = (void *)objc_msgSend(v24, "textBlocks");
        if (!v26)
          goto LABEL_48;
        v27 = v26;
        if (objc_msgSend(v26, "count") <= v17)
          goto LABEL_48;
        if (v17)
        {
          v28 = 1;
          do
          {
            v29 = objc_msgSend(v10, "objectAtIndex:", v28 - 1);
            v30 = objc_msgSend(v27, "objectAtIndex:", v28 - 1);
          }
          while (v29 == v30 && v28++ < v17);
          v32 = v29 == v30;
          v33 = v29 == v30;
          v22 = v41;
          if (!v32)
            goto LABEL_40;
        }
        else
        {
          v33 = 1;
        }
        v35 = objc_msgSend(v27, "objectAtIndex:", v17);
        if ((void *)v35 != v21)
        {
          v36 = (void *)v35;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (void *)objc_msgSend(v36, "table") != a3
            || objc_msgSend(v36, "startingRow") != v46)
          {
            goto LABEL_48;
          }
          v23 += objc_msgSend(v36, "columnSpan");
          if (objc_msgSend(v36, "rowSpan") > 1)
            v16 = 0;
          goto LABEL_41;
        }
LABEL_40:
        v36 = v21;
LABEL_41:
        v34 = v42;
        v21 = v36;
        v24 = v45;
        if (!v33)
          goto LABEL_48;
        goto LABEL_42;
      }
      v22 = a5;
      v23 = v39;
LABEL_48:
      if (v23 != v40)
        v16 = 0;
      a5 = v22;
    }
  }
  else
  {
    v16 = 1;
  }
  v37 = v16;
  if (a5)
LABEL_52:
    *a5 = v37;
  return v12;
}

- (uint64_t)_rangeOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:
{
  return objc_msgSend(a1, "_rangeOfTextTableRow:atIndex:completeRow:", a3, a4, 0);
}

- (uint64_t)_atStartOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *v7;
  BOOL v8;
  uint64_t result;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[0] = 0;
  v27[1] = 0;
  v7 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, v27);
  if (v7)
    v8 = v27[0] == a4;
  else
    v8 = 0;
  if (!v8)
    return 0;
  v10 = v7;
  v11 = (void *)objc_msgSend(v7, "textBlocks");
  result = objc_msgSend(v11, "count");
  if (result)
  {
    v12 = result;
    v25 = a1;
    v26 = 0;
    v13 = 1;
    do
    {
      v14 = v13 - 1;
      v15 = (void *)objc_msgSend(v11, "objectAtIndex:", v13 - 1, v25);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "table") == a3)
        v26 = objc_msgSend(v15, "startingRow");
      else
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      if (v13 >= v12)
        break;
      ++v13;
    }
    while (v14 == 0x7FFFFFFFFFFFFFFFLL);
    result = 0;
    if (v11)
    {
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v27[0])
        {
          v16 = (void *)objc_msgSend(v25, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v27[0] - 1, v27);
          if (v16 == v10)
          {
            v22 = 1;
            return !v22;
          }
          if (v16)
          {
            v17 = (void *)objc_msgSend(v16, "textBlocks");
            if (v17)
            {
              v18 = v17;
              if (objc_msgSend(v17, "count") > v14)
              {
                if (v14)
                {
                  v19 = 1;
                  do
                  {
                    v20 = objc_msgSend(v11, "objectAtIndex:", v19 - 1);
                    v21 = objc_msgSend(v18, "objectAtIndex:", v19 - 1);
                    v22 = v20 == v21;
                  }
                  while (v20 == v21 && v19++ < v14);
                }
                else
                {
                  v22 = 1;
                }
                v24 = (void *)objc_msgSend(v18, "objectAtIndex:", v14);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && objc_msgSend(v24, "table") == a3
                  && objc_msgSend(v24, "startingRow") == v26)
                {
                  return !v22;
                }
              }
            }
          }
        }
        v22 = 0;
        return !v22;
      }
    }
  }
  return result;
}

- (void)_atEndOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:
{
  void *result;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v26 = 0;
  v27 = 0;
  result = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, &v26);
  if (result)
  {
    if (a4 + 1 != v27 + v26)
      return 0;
    v8 = result;
    v9 = (void *)objc_msgSend(result, "textBlocks");
    result = (void *)objc_msgSend(v9, "count");
    if (result)
    {
      v10 = (unint64_t)result;
      v24 = CFSTR("NSParagraphStyle");
      v25 = 0;
      v11 = 1;
      do
      {
        v12 = v11 - 1;
        v13 = (void *)objc_msgSend(v9, "objectAtIndex:", v11 - 1, v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "table") == a3)
          v25 = objc_msgSend(v13, "startingRow");
        else
          v12 = 0x7FFFFFFFFFFFFFFFLL;
        if (v11 >= v10)
          break;
        ++v11;
      }
      while (v12 == 0x7FFFFFFFFFFFFFFFLL);
      result = 0;
      if (v9)
      {
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v27 + v26;
          if (v14 < objc_msgSend(a1, "length"))
          {
            v15 = (void *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v24, v14, &v26);
            if (v15 == v8)
            {
              v21 = 1;
              return (void *)!v21;
            }
            if (v15)
            {
              v16 = (void *)objc_msgSend(v15, "textBlocks");
              if (v16)
              {
                v17 = v16;
                if (objc_msgSend(v16, "count") > v12)
                {
                  if (v12)
                  {
                    v18 = 1;
                    do
                    {
                      v19 = objc_msgSend(v9, "objectAtIndex:", v18 - 1);
                      v20 = objc_msgSend(v17, "objectAtIndex:", v18 - 1);
                      v21 = v19 == v20;
                    }
                    while (v19 == v20 && v18++ < v12);
                  }
                  else
                  {
                    v21 = 1;
                  }
                  v23 = (void *)objc_msgSend(v17, "objectAtIndex:", v12);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && objc_msgSend(v23, "table") == a3
                    && objc_msgSend(v23, "startingRow") == v25)
                  {
                    return (void *)!v21;
                  }
                }
              }
            }
          }
          v21 = 0;
          return (void *)!v21;
        }
      }
    }
  }
  return result;
}

- (char)itemNumberInTextList:()NSAttributedStringUIFoundationAdditions atIndex:
{
  uint64_t v7;
  char *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v23;
  BOOL v24;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v35 = 0;
  v36 = 0;
  v7 = objc_msgSend(a1, "string");
  v8 = (char *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a4, &v35);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "textLists");
    v11 = objc_msgSend(v10, "indexOfObjectIdenticalTo:", a3);
    if (v10)
      v12 = v11 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = 1;
    if (v12)
      return 0;
    v13 = v11;
    v32 = (void *)v7;
    v34 = a4;
    v14 = v35;
    v33 = objc_msgSend(a1, "length");
    if (v14)
    {
      do
      {
        v15 = (char *)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v14 - 1, &v35);
        v16 = v15;
        if (v15 == v9)
        {
          v23 = 1;
        }
        else if (v15
               && (v17 = (void *)objc_msgSend(v15, "textLists")) != 0
               && (v18 = v17, objc_msgSend(v17, "count") > v13))
        {
          v19 = 1;
          do
          {
            v20 = objc_msgSend(v10, "objectAtIndex:", v19 - 1);
            v21 = objc_msgSend(v18, "objectAtIndex:", v19 - 1);
          }
          while (v20 == v21 && v19++ <= v13);
          v23 = v20 == v21;
        }
        else
        {
          v23 = 0;
        }
        if (v23)
        {
          v9 = v16;
          v14 = v35;
        }
        if (v14)
          v24 = !v23;
        else
          v24 = 1;
      }
      while (!v24);
    }
    if (v14 > a4 || v14 >= v33)
    {
      return 0;
    }
    else
    {
      v9 = 0;
      v26 = v13 + 1;
      do
      {
        v27 = objc_msgSend(v32, "paragraphRangeForRange:", v14, 0);
        v29 = v28;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v14, &v35), "textLists"), "count") == v26)
        {
          v14 = v27 + v29;
          ++v9;
        }
        else
        {
          v14 = v36 + v35;
        }
      }
      while (v14 <= v34 && v14 < v33);
    }
  }
  return v9;
}

- (uint64_t)prefersRTFDInRange:()NSAttributedStringUIFoundationAdditions
{
  void *v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a4)
    return 0;
  v12 = 0;
  v13 = 0;
  v7 = (void *)objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", a3, &v12, a3, a4);
  if (!objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSAttachment")))
  {
    v9 = a3 + a4;
    while (!objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider")))
    {
      v10 = v13 + v12;
      v11 = v9 - (v13 + v12);
      if (v9 <= v13 + v12)
        return 0;
      v12 = 0;
      v13 = 0;
      v7 = (void *)objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", v10, &v12, v10, v11);
      if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSAttachment")))
        return 1;
    }
  }
  return 1;
}

@end
