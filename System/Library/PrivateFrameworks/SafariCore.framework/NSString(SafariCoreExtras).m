@implementation NSString(SafariCoreExtras)

- (id)safari_stringByNormalizingVersionString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), &stru_1E64A2498);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_userVisibleSafariBundleVersionFromFullVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_userVisibleSafariBundleVersionFromFullVersion
{
  void *v2;
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3);

  if (v4 < 4)
    goto LABEL_2;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4 - 3;
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(a1, "length") >= 4)
  {
    v6 = objc_msgSend(a1, "length") - 3;
LABEL_7:
    objc_msgSend(a1, "substringFromIndex:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    return v5;
  }
LABEL_2:
  v5 = a1;
  return v5;
}

+ (id)safari_stringAsHexWithBuffer:()SafariCoreExtras length:
{
  uint64_t v4;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  int v10;

  v4 = a4;
  v6 = 2 * a4;
  v7 = (char *)malloc_type_malloc((2 * a4) | 1, 0x3F6F056BuLL);
  v8 = v7;
  if (v4)
  {
    v9 = v7;
    do
    {
      v10 = *a3++;
      snprintf(v9, 3uLL, "%02hhX", v10);
      v9 += 2;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v8, v6, 4, 1);
}

- (BOOL)safari_hasCaseInsensitivePrefix:()SafariCoreExtras
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "rangeOfString:options:", v4, 9) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 0;

  return v5;
}

- (BOOL)safari_isCaseInsensitiveEqualToString:()SafariCoreExtras
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "compare:options:", v4, 3) == 0;
  else
    v5 = 0;

  return v5;
}

- (__CFString)safari_monogramString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safari_stringByRemovingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capitalizedStringWithLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_stringByRemovingExcessWhitespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_msgSend(v6, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E64A2498;
  }

  return v9;
}

- (id)safari_stringByRemovingCharactersInSet:()SafariCoreExtras
{
  objc_msgSend(a1, "safari_stringByReplacingCharactersInSet:withString:", a3, &stru_1E64A2498);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_stringByReplacingCharactersInSet:()SafariCoreExtras withString:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (v6 && (v9 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v6, 0), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = v8;
    v10 = (void *)objc_msgSend(a1, "mutableCopy");
    v12 = objc_msgSend(v10, "length");
    v13 = objc_msgSend(v7, "length");
    do
    {
      if (v13)
      {
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v9, v11, v7);
        v12 = v12 - v11 + v13;
        v9 += v13;
      }
      else
      {
        objc_msgSend(v10, "deleteCharactersInRange:", v9, v11);
        v12 -= v11;
      }
      v9 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v6, 0, v9, v12 - v9);
      v11 = v14;
    }
    while (v9 != 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    v10 = (void *)objc_msgSend(a1, "copy");
  }

  return v10;
}

- (id)safari_stringByRemovingExcessWhitespace
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSString_SafariCoreExtras__safari_stringByRemovingExcessWhitespace__block_invoke;
  v8[3] = &unk_1E649BEC0;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (__CFString)safari_stringByTrimmingWhitespace
{
  __CFString *v1;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTrimWhitespace(v1);
  return v1;
}

- (id)safari_effectiveTopLevelDomainForHost
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t TopLevelDomain;
  void *v5;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  TopLevelDomain = _CFHostGetTopLevelDomain();
  if (TopLevelDomain)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", TopLevelDomain, v2 + v3 - TopLevelDomain, 4);
  else
    v5 = 0;

  return v5;
}

- (__CFString)safari_stringByRemovingTopLevelDomainFromHost
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t i;
  void *v6;
  __CFString *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "safari_hostDomainsEnumerator");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    v4 = &stru_1E64A2498;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v1, "kind", (_QWORD)v9) == 3)
        {
          objc_msgSend(v1, "clearAccumulatedDomains");
        }
        else
        {
          v7 = v6;

          v4 = v7;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v2);
  }
  else
  {
    v4 = &stru_1E64A2498;
  }

  return v4;
}

- (BOOL)safari_containsInteriorWhitespace
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "safari_stringByTrimmingWhitespace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)safari_filenameByFixingIllegalCharacters
{
  void *v1;
  void *v2;
  __int16 v4;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", v2, &stru_1E64A2498, 0, 0, objc_msgSend(v1, "length"));

  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("-"), 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("-"), 0, 0, objc_msgSend(v1, "length"));
  while (objc_msgSend(v1, "hasPrefix:", CFSTR(".")))
    objc_msgSend(v1, "deleteCharactersInRange:", 0, 1);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\u202E"), CFSTR("-"), 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

- (id)_safari_stringByTruncatingToFilenameLength:()SafariCoreExtras preservePathExtension:
{
  unint64_t v5;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _OWORD v24[16];
  char v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  memset(v24, 0, sizeof(v24));
  v7 = objc_msgSend(a1, "getFileSystemRepresentation:maxLength:", v24, a3);
  v8 = a1;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(v8, "stringByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "length");
      if (v11 == objc_msgSend(v9, "length"))
      {
        v12 = &stru_1E64A2498;
      }
      else
      {
        objc_msgSend(v9, "substringFromIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("…"), "stringByAppendingString:", v13);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if ((-[__CFString getFileSystemRepresentation:maxLength:](v12, "getFileSystemRepresentation:maxLength:", v24, v5 >> 1) & 1) == 0)
        {
          objc_msgSend(v9, "_safari_stringByTruncatingToFilenameLength:preservePathExtension:", v5, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

          return v9;
        }
        v5 -= strnlen((const char *)v24, v5 >> 1);
      }
      v9 = v10;
    }
    else
    {
      v12 = &stru_1E64A2498;
    }
    if (!-[__CFString length](v12, "length"))
    {

      v12 = CFSTR("…");
      objc_msgSend(CFSTR("…"), "getFileSystemRepresentation:maxLength:", v24, 20);
      v5 -= strnlen((const char *)v24, 0x14uLL);
    }
    v14 = objc_msgSend(v9, "length");
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", (v14 + v15) >> 1);
        v19 = v18;
        objc_msgSend(v9, "substringToIndex:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "getFileSystemRepresentation:maxLength:", v24, v5))
        {
          v16 = v17;
          v15 = v17 + v19;
        }
        else
        {
          v14 = v17;
        }

      }
      while (v15 < v14);
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v9, "substringToIndex:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", v12);
    v22 = objc_claimAutoreleasedReturnValue();

    v10 = v9;
    v9 = (void *)v22;
    goto LABEL_20;
  }
  return v9;
}

- (uint64_t)safari_stringByTruncatingToMaximumFilenameLengthPreservingExtension
{
  return objc_msgSend(a1, "_safari_stringByTruncatingToFilenameLength:preservePathExtension:", 255, 1);
}

- (id)safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LOBYTE(v9) = 0;
  if (objc_msgSend(v4, "length", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         v9,
         v10)
    && (objc_msgSend(v4, "getFileSystemRepresentation:maxLength:", &v8, 255) & 1) == 0)
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(a1, "_safari_stringByTruncatingToFilenameLength:preservePathExtension:", 255 - strnlen((const char *)&v8, 0xFFuLL), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)safari_highLevelDomainFromHost
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v1 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "safari_hostDomainsEnumerator");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v4)
        objc_enumerationMutation(v2);
      v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v5);
      if ((objc_msgSend(v2, "isSpeculative", (_QWORD)v11) & 1) != 0)
        break;
      v7 = objc_msgSend(v2, "kind");
      v8 = v7 + 1;
      if ((unint64_t)(v7 + 1) <= 7)
      {
        if (((1 << v8) & 0xC9) != 0)
          break;
        if (((1 << v8) & 6) != 0)
          goto LABEL_16;
        if (v7 == 4)
        {
          v1 = v6;
LABEL_16:
          v9 = v1;
          goto LABEL_17;
        }
      }
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v9 = 0;
        if (v3)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)safari_base64DecodedData
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", a1, 0);
}

+ (id)safari_stringAsHexWithData:()SafariCoreExtras
{
  id v4;
  void *v5;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(a1, "safari_stringAsHexWithBuffer:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)safari_simplifiedUserVisibleURLStringWithSimplifications:()SafariCoreExtras forDisplayOnly:simplifiedStringOffset:
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t location;
  NSUInteger v27;
  NSUInteger length;
  NSUInteger v29;
  NSRange v30;
  NSRange v31;
  NSUInteger v32;
  void *v33;
  void *v34;
  NSUInteger v35;
  id v36;
  id v37;
  void *v38;
  int v39;
  const __CFString *v40;
  char v41;
  __CFString *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char v47;
  void *v48;
  void *v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  unint64_t v59;
  NSRange v60;

  v7 = (void *)objc_msgSend(a1, "copy");
  v8 = objc_msgSend(v7, "safari_hasCaseInsensitivePrefix:", CFSTR("blob:")) ^ 1;
  if ((a3 & 0x80) == 0)
    LOBYTE(v8) = 1;
  if ((v8 & 1) == 0)
  {
    objc_msgSend(v7, "substringFromIndex:", 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v10, "password");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v59 = 0;
        objc_msgSend(v9, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3 & 0xFFFFFFFFFFFFFF7FLL, a4, &v59);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (a5)
          *a5 = v59 + 5;
        v36 = v54;
        goto LABEL_24;
      }
    }
    location = objc_msgSend(v10, "rangeOfUser");
    length = v27;
    v30.location = objc_msgSend(v10, "rangeOfPassword");
    if (v30.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30.length = v29;
      v60.location = location;
      v60.length = length;
      v31 = NSUnionRange(v60, v30);
      location = v31.location;
      length = v31.length;
    }
    v32 = length + 1;
    objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", location, length + 1, &stru_1E64A2498);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0;
    objc_msgSend(v33, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3 & 0xFFFFFFFFFFFFFF7FLL, a4, &v59);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      if (v59 >= location)
        v35 = v32;
      else
        v35 = 0;
      v59 += v35 + 5;
      *a5 = v59;
    }
    v36 = v34;
LABEL_24:
    v37 = v36;

    goto LABEL_69;
  }
  v12 = objc_msgSend(MEMORY[0x1E0C99E98], "safari_hostAndPortRangeFromUserTypedString:", v7);
  v14 = v13;
  v15 = objc_msgSend(v7, "safari_hasCaseInsensitivePrefix:", CFSTR("http://"));
  v16 = objc_msgSend(v7, "safari_hasCaseInsensitivePrefix:", CFSTR("https://"));
  v17 = v16;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v15 | v16;
    if ((a3 & 0x20) != 0)
    {
      if (v18)
      {
        v19 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(":"), 4, v12, v14);
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = a1;
          v21 = v12 + v14 - v19;
          if (objc_msgSend(v20, "rangeOfString:options:range:", CFSTR("]"), 0, v19, v21) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v19, v12 + v14 - v19, &stru_1E64A2498);
            v22 = objc_claimAutoreleasedReturnValue();

            v14 -= v21;
            v7 = (void *)v22;
          }
        }
      }
    }
    if ((v18 & (a3 >> 4)) == 1)
    {
      v23 = v14 + v12;
    }
    else
    {
      if ((a3 & 4) == 0)
        goto LABEL_27;
      v23 = v14 + v12;
      objc_msgSend(v7, "substringFromIndex:", v14 + v12);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("/"));

      if (!v39)
        goto LABEL_27;
    }
    objc_msgSend(v7, "substringToIndex:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v24;
  }
LABEL_27:
  if ((v17 & (a3 >> 1)) != 0)
    v40 = CFSTR("https://");
  else
    v40 = 0;
  if ((a3 & v15 & 1) != 0)
    v41 = 0;
  else
    v41 = v17 & (a3 >> 1) ^ 1;
  if ((a3 & v15 & 1) != 0)
    v42 = CFSTR("http://");
  else
    v42 = (__CFString *)v40;
  if ((a3 & 0x148) == 0)
    goto LABEL_39;
  if ((v15 & 1) == 0)
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v47 = 0;
    else
      v47 = v17;
    if ((v47 & 1) != 0)
      goto LABEL_46;
LABEL_39:
    if (v42)
      goto LABEL_40;
    goto LABEL_65;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_39;
LABEL_46:
  objc_msgSend(v7, "substringWithRange:", v12, v14);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if ((a3 & 8) != 0 && (objc_msgSend(v48, "safari_hasCaseInsensitivePrefix:", CFSTR("www.")) & 1) != 0)
  {
    v50 = CFSTR("www.");
  }
  else if ((a3 & 0x40) != 0 && (objc_msgSend(v49, "safari_hasCaseInsensitivePrefix:", CFSTR("m.")) & 1) != 0)
  {
    v50 = CFSTR("m.");
  }
  else
  {
    if ((a3 & 0x100) == 0 || !objc_msgSend(v49, "safari_hasCaseInsensitivePrefix:", CFSTR("mobile.")))
      goto LABEL_64;
    v50 = CFSTR("mobile.");
  }
  objc_msgSend(v49, "safari_highLevelDomainFromHost");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v49, "isEqualToString:", v52);

  if ((v53 & 1) == 0)
  {
    if ((v41 & 1) != 0 || v12 != -[__CFString length](v42, "length"))
    {
      objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v12, -[__CFString length](v50, "length"), &stru_1E64A2498);
      v55 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v55;
    }
    else
    {
      -[__CFString stringByAppendingString:](v42, "stringByAppendingString:", v50);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_64:

  if (v42)
  {
LABEL_40:
    v43 = -[__CFString length](v42, "length");
    if (a4)
    {
      v44 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "substringFromIndex:", v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", CFSTR("%C%@"), 8206, v45);
      v46 = objc_claimAutoreleasedReturnValue();

      --v43;
      v7 = (void *)v46;
    }
    else
    {
      objc_msgSend(v7, "substringFromIndex:", v43);
      v51 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v51;
    }
    goto LABEL_66;
  }
LABEL_65:
  v43 = 0;
LABEL_66:
  if (a5)
    *a5 = v43;
  v37 = v7;

LABEL_69:
  return v37;
}

- (uint64_t)safari_simplifiedUserVisibleURLString
{
  return objc_msgSend(a1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 1, 0);
}

- (id)safari_simplifiedSiteNameForCredentialLookup
{
  void *v1;
  void *v2;

  objc_msgSend(CFSTR("https://"), "stringByAppendingString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_separateResourceForkPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") && (objc_msgSend(v2, "isEqualToString:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(a1, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("._"), "stringByAppendingString:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)safari_hasPrefix:()SafariCoreExtras
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "hasPrefix:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)safari_substringFromPrefix:()SafariCoreExtras
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(a1, "hasPrefix:", v4))
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)safari_caseAndDiacriticInsensitiveStandardRangeOfString:()SafariCoreExtras additionalOptions:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v7 = objc_msgSend(a1, "rangeOfString:options:", v6, a4 | 0x181);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (uint64_t)safari_isHostOrSubdomainOfHost:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "hasSuffix:", v6);

  }
  return v5;
}

- (BOOL)safari_isCaseAndDiacriticInsensitiveEqualToString:()SafariCoreExtras
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "compare:options:", v4, 131) == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)safari_hasCaseInsensitiveSuffix:()SafariCoreExtras
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "rangeOfString:options:", v4, 13) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)safari_hasLocalizedCaseInsensitivePrefix:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_hasLocalizedPrefix:withOptions:", a3, 1);
}

- (uint64_t)safari_hasLocalizedCaseAndDiacriticInsensitivePrefix:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_hasLocalizedPrefix:withOptions:", a3, 129);
}

- (BOOL)_safari_hasLocalizedPrefix:()SafariCoreExtras withOptions:
{
  id v6;
  void *v7;
  unint64_t v8;
  _BOOL8 v9;
  void *v10;

  v6 = a3;
  v7 = v6;
  if (v6 && (v8 = objc_msgSend(v6, "length"), v8 <= objc_msgSend(a1, "length")))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "compare:options:range:locale:", v7, a4, 0, v8, v10) == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)safari_anyComponentSeparatedByString:()SafariCoreExtras hasLocalizedCaseInsensitivePrefix:
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_msgSend(a1, "length");
    v9 = 0;
    while (v8 >= objc_msgSend(v7, "length"))
    {
      v10 = objc_msgSend(v7, "length");
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(a1, "compare:options:range:locale:", v7, 1, v9, v10, v11);

      if (!v12)
      {
        v15 = 1;
        goto LABEL_9;
      }
      v14 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 0, v9, v8);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v9 = v14 + v13;
      v8 = objc_msgSend(a1, "length") - (v14 + v13);
    }
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (BOOL)safari_localizedCaseAndDiacriticInsensitiveContainsString:()SafariCoreExtras
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 385) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)safari_isSubpathOfPath:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  v4 = a3;
  if ((objc_msgSend(a1, "hasPrefix:", v4) & 1) != 0)
  {
    v5 = objc_msgSend(a1, "length");
    v6 = objc_msgSend(v4, "length");
    v7 = v5 - v6;
    v8 = !v7
      || (objc_msgSend(v4, "hasSuffix:", CFSTR("/")) & 1) != 0
      || objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("/"), 8, v6, v7) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)safari_containsPeriodOrHomoglyphForPeriod
{
  if (-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::once != -1)
    dispatch_once(&-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::once, &__block_literal_global_6);
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", -[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod) != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)safari_firstLocationOfPeriodOrHomoglyphForPeriod
{
  if (-[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::once != -1)
    dispatch_once(&-[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::once, &__block_literal_global_40);
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", -[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod);
}

- (uint64_t)safari_stringByReplacingHomoglyphForSpaceWithSpace
{
  if (-[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::once != -1)
    dispatch_once(&-[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::once, &__block_literal_global_41_0);
  return objc_msgSend(a1, "safari_stringByReplacingCharactersInSet:withString:", -[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::homoglyphsForSpace, CFSTR(" "));
}

- (id)safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.0"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __105__NSString_SafariCoreExtras__safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString__block_invoke;
    v5[3] = &unk_1E649BE98;
    v5[4] = &v6;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  }
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)safari_isVersionStringGreaterThanVersionString:()SafariCoreExtras
{
  return objc_msgSend(a1, "compare:options:", a3, 64) == 1;
}

- (BOOL)safari_isVersionStringGreaterThanOrEqualToVersionString:()SafariCoreExtras
{
  return objc_msgSend(a1, "compare:options:", a3, 64) != -1;
}

- (BOOL)safari_isVersionStringBetweenVersionString:()SafariCoreExtras andVersionString:
{
  id v6;
  id v7;
  _BOOL8 v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "compare:options:", v6, 64) != -1 && objc_msgSend(a1, "compare:options:", v7, 64) == -1;

  return v8;
}

- (uint64_t)safari_containsAllCharactersInString:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(a1, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isSupersetOfSet:", v6);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)safari_setOfAllSubstringsWithMinimumLength:()SafariCoreExtras
{
  unint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = objc_msgSend(a1, "length");
  v6 = 0;
  if (v5)
  {
    v7 = v5;
    if (v5 >= a3)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      do
      {
        v8 = 0;
        do
        {
          objc_msgSend(a1, "substringWithRange:", v8, a3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v9);

          ++v8;
        }
        while (v8 <= v7 - a3);
        ++a3;
      }
      while (a3 <= v7);
    }
  }
  return v6;
}

- (__CFString)safari_stringByRepeatingWithCount:()SafariCoreExtras joinedByString:
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  if (a3)
  {
    if (a3 == 1)
    {
      v7 = a1;
    }
    else
    {
      v8 = objc_msgSend(a1, "length");
      v9 = objc_msgSend(v6, "length");
      objc_msgSend(v6, "stringByAppendingString:", a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:", v8 * a3 + v9 * (a3 - 1), v10, 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = &stru_1E64A2498;
  }

  return v7;
}

- (BOOL)safari_looksLikeEmailAddress
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a1, "length");
  if (v2 < 6)
    return 0;
  v4 = v2;
  v6 = objc_msgSend(a1, "rangeOfString:", CFSTR("@"));
  result = 0;
  if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("."), 4, v6 + v5, v4 - (v6 + v5));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 + v7 + 2 > v4)
      return 0;
    return v7 != v6 + 1;
  }
  return result;
}

- (__CFString)safari_stringByRedactingBookmarkDAVServerID
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(v2, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v8 = a1;
      goto LABEL_7;
    }
  }
  objc_msgSend(v2, "setUser:", 0);
  objc_msgSend(v2, "setPassword:", 0);
  objc_msgSend(v2, "string");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Nil redacted server ID");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

LABEL_7:
  return v8;
}

- (uint64_t)safari_countOfString:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  LODWORD(v5) = 0;
  v6 = 0;
  v7 = objc_msgSend(a1, "length");
  v8 = v7;
  do
  {
    v9 = objc_msgSend(a1, "rangeOfString:options:range:", v4, 2, v6, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v5;
    }
    else
    {
      v8 = v7 - (v9 + v10);
      v5 = (v5 + 1);
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v6 = v9 + v10;
  }
  while (v9 + v10 < v7);

  return v5;
}

- (id)safari_domainFromHost
{
  id v2;
  int v3;
  unint64_t v4;
  uint64_t v5;

  v2 = (id)objc_msgSend(a1, "length");
  if (v2)
  {
    if (!objc_msgSend(a1, "_web_looksLikeIPAddress"))
    {
      v3 = objc_msgSend(a1, "_web_hasCountryCodeTLD");
      v4 = objc_msgSend(a1, "safari_countOfString:", CFSTR("."));
      if (v3)
      {
        if (v4 > 2)
        {
          v5 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("."), 4, 0, objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 4));
LABEL_9:
          objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("."), 4, 0, v5) + 1);
          v2 = (id)objc_claimAutoreleasedReturnValue();
          return v2;
        }
      }
      else if (v4 > 1)
      {
        v5 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 4);
        goto LABEL_9;
      }
    }
    v2 = a1;
  }
  return v2;
}

- (uint64_t)safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  if (!objc_msgSend(a1, "length") || !objc_msgSend(v4, "length"))
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v5, 8);

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:", v7, 8);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    v9 = 1;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v10, 8);

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:", v12, 8);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11 == 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
LABEL_13:
    v9 = objc_msgSend(a1, "localizedCaseInsensitiveCompare:", v4);
    goto LABEL_14;
  }
LABEL_5:
  v9 = -1;
LABEL_14:

  return v9;
}

- (id)safari_stringByRemovingWwwDotPrefix
{
  id v2;

  if ((objc_msgSend(a1, "safari_hasCaseInsensitivePrefix:", CFSTR("www.")) & 1) != 0)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(CFSTR("www."), "length"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)safari_stringByRemovingWwwAndWildcardDotPrefixes
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "hasPrefix:", CFSTR("*.")) & 1) != 0)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(CFSTR("*."), "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_stringByRemovingWwwDotPrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "safari_stringByRemovingWwwDotPrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), &stru_1E64A2498, 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), &stru_1E64A2498, 0, 0, objc_msgSend(v4, "length"));
  if (objc_msgSend(v4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 60)
  {
    objc_msgSend(v4, "deleteCharactersInRange:", 0, 1);
    v5 = objc_msgSend(CFSTR("URL:"), "length");
    v6 = objc_msgSend(v4, "length");
    if (v6 >= objc_msgSend(CFSTR("URL:"), "length")
      && !objc_msgSend(v4, "compare:options:range:", CFSTR("URL:"), 1, 0, v5))
    {
      objc_msgSend(v4, "deleteCharactersInRange:", 0, v5);
    }
    v7 = objc_msgSend(v4, "length");
    if (v7)
    {
      v8 = v7 - 1;
      if (objc_msgSend(v4, "characterAtIndex:", v7 - 1) == 62)
        objc_msgSend(v4, "deleteCharactersInRange:", v8, 1);
    }
  }

  return v4;
}

- (id)safari_possibleTopLevelDomainCorrectionForUserTypedString
{
  unsigned int v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  {
    -[NSString(SafariCoreExtras) safari_possibleTopLevelDomainCorrectionForUserTypedString]::suffixTypoCorrectionsMap = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR(".cmo"), CFSTR(".com"), CFSTR("c.om"), CFSTR(".com"), CFSTR(".xom"), CFSTR(".net"), CFSTR(".ent"), CFSTR(".net"), CFSTR(".nte"), CFSTR(".org"), CFSTR(".ogr"), CFSTR(".org"), CFSTR(".rog"), CFSTR(".info"), CFSTR(".ifno"), CFSTR(".info"), CFSTR(".ifnp"), 0);
  }
  v2 = objc_msgSend(a1, "hasSuffix:", CFSTR("."));
  v3 = objc_msgSend(a1, "length");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (id)-[NSString(SafariCoreExtras) safari_possibleTopLevelDomainCorrectionForUserTypedString]::suffixTypoCorrectionsMap;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v3 - v2;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(a1, "rangeOfString:options:range:", v9, 13, 0, v6);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v10;
          objc_msgSend((id)-[NSString(SafariCoreExtras) safari_possibleTopLevelDomainCorrectionForUserTypedString]::suffixTypoCorrectionsMap, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v11, v13, v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)safari_suggestedFilenameFromTitleString
{
  id v2;

  if ((unint64_t)objc_msgSend(a1, "length") > 0x64)
  {
    objc_msgSend(a1, "substringToIndex:", 100);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (uint64_t)safari_looksLikeWillRedirectToURLStringAfterAuthentication:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:", a3, 0);
}

- (uint64_t)safari_looksLikeWillRedirectToHostAfterAuthentication:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:", 0, a3);
}

- (uint64_t)_safari_looksLikeWillRedirectToURLStringAfterAuthentication:()SafariCoreExtras orHostAfterLogin:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  _QWORD v38[4];
  id v39;
  id v40;
  BOOL v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::onceToken != -1)
    dispatch_once(&-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::onceToken, &__block_literal_global_91);
  v35 = v7;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(&unk_1E64D10D0, "containsObject:", v10) & 1) == 0)
  {
    v12 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern;
    v33 = v10;
    objc_msgSend(a1, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v12, "numberOfMatchesInString:options:range:", v13, 0, 0, objc_msgSend(a1, "length")) != 0;

    objc_msgSend(v6, "lowercaseString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_highLevelDomainFromHost");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "safari_highLevelDomainFromHost");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v16))
    {
      objc_msgSend(v8, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "length")
        && objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length"))|| objc_msgSend(v18, "length")&& objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
      {
        goto LABEL_13;
      }
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v16, &stru_1E64A2498);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length")
        && objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length")))
      {

LABEL_13:
        v11 = 1;
LABEL_26:

        v6 = v34;
        v10 = v33;
        goto LABEL_27;
      }

    }
    v31 = v16;
    objc_msgSend(v8, "pathComponents");
    v30 = a1;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "lowercaseString", v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v46 = &v45;
          v47 = 0x2020000000;
          v48 = 0;
          v24 = -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern;
          v25 = objc_msgSend(v23, "length");
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_2;
          v42[3] = &unk_1E649BF08;
          v26 = v23;
          v43 = v26;
          v44 = &v45;
          objc_msgSend((id)v24, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v25, v42);
          LOBYTE(v24) = *((_BYTE *)v46 + 24) == 0;

          _Block_object_dispose(&v45, 8);
          if ((v24 & 1) == 0)
          {
            v11 = 1;
            v27 = obj;
            goto LABEL_25;
          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v20)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "percentEncodedQueryItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_3;
    v38[3] = &unk_1E649BF30;
    v41 = v32;
    v39 = v34;
    v40 = v15;
    v11 = objc_msgSend(v28, "safari_containsObjectPassingTest:", v38);

LABEL_25:
    v16 = v31;
    goto LABEL_26;
  }
  v11 = 1;
LABEL_27:

  return v11;
}

- (uint64_t)safari_numberOfComposedCharacters
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NSString_SafariCoreExtras__safari_numberOfComposedCharacters__block_invoke;
  v5[3] = &unk_1E649BF58;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)safari_bundleIdentifierFromApplicationIdentifier:()SafariCoreExtras
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)safari_teamIdentifierFromApplicationIdentifier:()SafariCoreExtras
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)safari_highLevelDomainForPasswordManager
{
  id v2;

  objc_msgSend(a1, "safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = a1;
  return v2;
}

- (id)safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "safari_hostDomainsEnumerator");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = objc_msgSend(v2, "kind", (_QWORD)v11);
        v8 = v7;
        if (v7 <= 4 && ((1 << v7) & 0x13) != 0)
          v1 = v6;
        if (v8 <= 4 && ((1 << v8) & 0x13) != 0)
        {
          v9 = v1;
          goto LABEL_16;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (id)safari_bestURLForUserTypedString
{
  void *v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__NSString_SafariCoreExtras__safari_bestURLForUserTypedString__block_invoke;
  v3[3] = &unk_1E649BF80;
  v3[4] = &v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "safari_enumeratePossibleURLsForUserTypedString:withBlock:", a1, v3);
  objc_msgSend((id)v5[5], "safari_canonicalURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)safari_isPrefixOfWwwDot
{
  return objc_msgSend(CFSTR("www."), "safari_hasCaseInsensitivePrefix:", a1);
}

- (BOOL)safari_allowsLooserMatchingInSearch
{
  unint64_t v2;
  unsigned int v3;
  _BOOL8 v5;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = 0;
  do
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", v2);
    v5 = v3 > 0x24F && v3 - 880 < 0xFFFFFF90;
    if (v5)
      break;
    ++v2;
  }
  while (v2 < objc_msgSend(a1, "length"));
  return v5;
}

- (uint64_t)safari_urlStringForCompletionDeduplication
{
  return objc_msgSend(a1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 335, 0, 0);
}

- (uint64_t)safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain
{
  return objc_msgSend(a1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
}

- (uint64_t)safari_containsCJKCharacters
{
  if ((objc_msgSend(a1, "_containsIdeographicCharacters") & 1) != 0
    || (objc_msgSend(a1, "_containsHiraganaKatakanaOrBopomofo") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "_containsKorean");
  }
}

- (uint64_t)safari_indexOfFirstAppearanceOfCharacter:()SafariCoreExtras
{
  uint64_t v5;

  if (!objc_msgSend(a1, "length"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  while (objc_msgSend(a1, "characterAtIndex:", v5) != a3)
  {
    if (++v5 >= (unint64_t)objc_msgSend(a1, "length"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (id)safari_stringByRemovingWrappingSingleQuotes
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "length");
  if (objc_msgSend(a1, "characterAtIndex:", 0) == 39
    && objc_msgSend(a1, "characterAtIndex:", v2 - 1) == 39)
  {
    objc_msgSend(a1, "substringWithRange:", 1, v2 - 2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (id)safari_stringByRemovingWrappingParenthesis
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "length");
  if (objc_msgSend(a1, "characterAtIndex:", 0) == 40
    && objc_msgSend(a1, "characterAtIndex:", v2 - 1) == 41)
  {
    objc_msgSend(a1, "substringWithRange:", 1, v2 - 2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (id)safari_stringByDeletingStartingSlash
{
  id v2;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("/")))
  {
    objc_msgSend(a1, "substringFromIndex:", 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)safari_stringByDeletingTrailingSlash
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)safari_stringByDeletingAllPathExtensions
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  v2 = 0;
  do
  {
    v3 = v2;
    v2 = v1;

    objc_msgSend(v2, "stringByDeletingPathExtension");
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  while (!objc_msgSend(v1, "isEqualToString:", v2));

  return v1;
}

- (id)safari_fixedStringByExpandingTildeInPathToUserHomeDirectory
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "stringByExpandingTildeInPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")) && (objc_msgSend(v2, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("/"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (uint64_t)safari_isPathExtensionAllowedForAnalytics
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v5;

  {
    v1 = (void *)-[NSString(SafariCoreExtras) safari_isPathExtensionAllowedForAnalytics]::allowedMIMETypes;
  }
  else
  {
    v5 = a1;
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E64D10E8);
    a1 = v5;
    -[NSString(SafariCoreExtras) safari_isPathExtensionAllowedForAnalytics]::allowedMIMETypes = (uint64_t)v1;
  }
  objc_msgSend(a1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "containsObject:", v2);

  return v3;
}

@end
