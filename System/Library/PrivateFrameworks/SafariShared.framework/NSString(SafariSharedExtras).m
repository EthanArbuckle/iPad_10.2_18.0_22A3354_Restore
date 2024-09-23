@implementation NSString(SafariSharedExtras)

- (id)safari_md5Hash
{
  id v1;
  void *v2;
  unsigned __int8 md[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend((id)objc_opt_class(), "safari_stringAsHexWithBuffer:length:", md, 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)safari_stringByAddingSoftBreaksBeforePeriods
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("​."));
}

+ (__CFString)safari_stringWithJSValue:()SafariSharedExtras context:nullStringPolicy:
{
  __CFString *v7;
  OpaqueJSString *v8;

  if (a5 && (a5 != 1 && (a5 != 2 || JSValueIsUndefined(ctx, value)) || JSValueIsNull(ctx, value)))
  {
    v7 = 0;
  }
  else
  {
    v8 = JSValueToStringCopy(ctx, value, 0);
    v7 = (__CFString *)JSStringCopyCFString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
    if (v8)
      JSStringRelease(v8);
  }
  return v7;
}

+ (uint64_t)safari_stringWithJSValue:()SafariSharedExtras context:
{
  return objc_msgSend(a1, "safari_stringWithJSValue:context:nullStringPolicy:", a3, a4, 0);
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
  v7 = __Block_byref_object_copy__27;
  v8 = __Block_byref_object_dispose__27;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__NSString_SafariSharedExtras__safari_bestURLForUserTypedString__block_invoke;
  v3[3] = &unk_1E4B3D188;
  v3[4] = &v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "safari_enumeratePossibleURLsForUserTypedString:withBlock:", a1, v3);
  objc_msgSend((id)v5[5], "safari_canonicalURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (id)safari_bestLanguageTag
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3730]);
  v28[0] = *MEMORY[0x1E0CB2CF8];
  v3 = v28[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithTagSchemes:options:", v4, 0x20000000);

  objc_msgSend(a1, "safari_stringByTrimmingWhitespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  objc_msgSend(v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke;
  v26[3] = &unk_1E4B2C1C0;
  v11 = v7;
  v27 = v11;
  objc_msgSend(v5, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v9, v3, 14, v26);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__27;
  v24 = __Block_byref_object_dispose__27;
  v25 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke_2;
  v15[3] = &unk_1E4B3D1B0;
  v12 = v11;
  v16 = v12;
  v17 = v19;
  v18 = &v20;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (__CFString)safari_bestKnownLanguageTag
{
  __CFString *v1;
  __CFString *v2;

  objc_msgSend(a1, "safari_bestLanguageTag");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("und")))
  {

    v2 = CFSTR("en");
  }
  return v2;
}

- (__CFString)safari_bestURLStringForUserTypedString
{
  void *v1;
  uint64_t v2;
  __CFString *v3;

  objc_msgSend(a1, "safari_bestURLForUserTypedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_originalDataAsString");
  v2 = objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (__CFString *)v2;
  else
    v3 = &stru_1E4B40D18;
  return v3;
}

- (id)safari_userVisibleURL
{
  id v3;
  WTF *v4;
  NSURL *v5;
  WTF *v6;

  if (WTF::isUserVisibleURL((WTF *)a1, a2))
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", a1);
    v4 = (WTF *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v4)
    {
      WTF::userVisibleString(v4, v5);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)safari_looksLikeAbsoluteURLString
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "safari_stringByTrimmingWhitespace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_rangeOfURLScheme") != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

- (__CFString)safari_stringByFoldingWideCharactersAndNormalizing
{
  __CFString *v1;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringFold(v1, 0x100uLL, 0);
  CFStringNormalize(v1, kCFStringNormalizationFormC);
  return v1;
}

- (id)safari_stringByReplacingMarkupCharactersWithHTMLEntities
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("&quot;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("&#x27;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("&#x2F;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

- (id)safari_stringByReplacingLastOccurrenceOfWhitespaceWithANonBreakingSpace
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v2, 4);
  v5 = v4;

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v3, v5, CFSTR("&nbsp;"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)safari_stringEncodedAsURLQueryParameter
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJLKMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.!~*'()"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%20"), CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)safari_stringDecodedFromURLQueryParameter
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_stringByRemovingDirectionalPrefix
{
  id v2;

  if ((objc_msgSend(a1, "safari_hasDirectionalPrefix") & 1) != 0)
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

- (uint64_t)safari_hasDirectionalPrefix
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 8206);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hasPrefix:", v2);

  return v3;
}

+ (id)safari_stringWithUTF8Bytes:()SafariSharedExtras length:
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
}

- (id)safari_stringBySubstitutingAmpersandAndAngleBracketsForHTMLEntities
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v3 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&lt;"),
         CFSTR("<"),
         0,
         0,
         objc_msgSend(v2, "length"));
  v4 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&gt;"),
         CFSTR(">"),
         0,
         0,
         objc_msgSend(v2, "length"));
  if (v4
     + v3
     + objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&amp;"),
                       CFSTR("&"),
                       0,
                       0,
                       objc_msgSend(v2, "length")))
  {
    v5 = v2;
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (id)safari_stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v3 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
         0,
         0,
         objc_msgSend(v2, "length"));
  v4 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
         0,
         0,
         objc_msgSend(v2, "length"));
  if (v4
     + v3
     + objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
         0,
         0,
         objc_msgSend(v2, "length")))
  {
    v5 = v2;
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (uint64_t)safari_isRightToLeft
{
  const void *v0;
  uint64_t IsRightToLeft;

  v0 = (const void *)CTLineCreateWithString();
  IsRightToLeft = CTLineIsRightToLeft();
  CFRelease(v0);
  return IsRightToLeft;
}

- (uint64_t)safari_isJavaScriptURLString
{
  return objc_msgSend(a1, "safari_hasCaseInsensitivePrefix:", CFSTR("javascript:"));
}

- (id)safari_scriptIfJavaScriptURLString
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "safari_isJavaScriptURLString"))
  {
    objc_msgSend(a1, "substringFromIndex:", 11);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByRemovingPercentEncoding");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)safari_enumerateSubdomainRangesInHostUsingBlock:()SafariSharedExtras
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v12 = 0;
  v5 = objc_msgSend(a1, "length");
  v6 = 0;
  v7 = v5;
  while (1)
  {
    v8 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("."), 0, v6, v7);
    v10 = v9;
    if (!v9)
      break;
    v11 = v8;
    v4[2](v4, v6, v8 - v6, &v12);
    v6 = v11 + v10;
    v7 = v5 - (v11 + v10);
    if (v12)
      goto LABEL_6;
  }
  v4[2](v4, v6, v7, &v12);
LABEL_6:

}

- (id)safari_canonicalURLForFrequentlyVisitedSites
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "safari_canonicalURLStringForFrequentlyVisitedSites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_URLWithDataAsString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)safari_isVisualDuplicateOfURLString:()SafariSharedExtras
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "lowercaseString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    canonicalize(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    canonicalize(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)safari_stringByBase64EncodingData:()SafariSharedExtras
{
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_sha256Hash
{
  id v1;
  void *v2;
  unsigned __int8 md[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend((id)objc_opt_class(), "safari_stringAsHexWithBuffer:length:", md, 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (__CFString)safari_urlHashesOfComponents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  if (-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::onceToken != -1)
    dispatch_once(&-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::onceToken, &__block_literal_global_73);
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2((uint64_t)v4, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    objc_msgSend(v2, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2((uint64_t)v6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

    objc_msgSend(v2, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2((uint64_t)v8, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E4B40D18;
  }

  return v10;
}

- (uint64_t)safari_isPDFMIMEType
{
  if ((objc_msgSend(a1, "safari_isCaseInsensitiveEqualToString:", CFSTR("application/pdf")) & 1) != 0
    || (objc_msgSend(a1, "safari_isCaseInsensitiveEqualToString:", CFSTR("application/postscript")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "safari_isCaseInsensitiveEqualToString:", CFSTR("text/pdf"));
  }
}

- (id)safari_lastPathComponentWithoutZipExtension
{
  void *v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("zip"));

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v1, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", &stru_1E4B40D18))
      v7 = v1;
    else
      v7 = v5;
    v8 = v7;

  }
  else
  {
    v8 = v1;
  }

  return v8;
}

- (id)safari_ensurePathExtension:()SafariSharedExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "compare:options:", v4, 1))
    {
      v7 = a1;
    }
    else
    {
      objc_msgSend(a1, "stringByAppendingPathExtension:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

- (id)safari_containedURLs
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)safari_looksLikeObscuredPassword
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3500], "safari_obscuredPasswordCharacterSets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(a1, "stringByTrimmingCharactersInSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v5));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length") == 0;

        if (v7)
        {
          v8 = 1;
          goto LABEL_12;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)safari_stringByRemovingParenthesizedDomain
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(a1, "hasSuffix:", CFSTR(")")) & 1) == 0)
    return a1;
  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("("), 4);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return a1;
  objc_msgSend(a1, "substringToIndex:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_userVisibleTitleIgnoringFullURLString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length")
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "scheme"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_rangeOfURLScheme
{
  uint64_t v2;
  BOOL v3;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR(":"));
  if (v2)
    v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 1;
  if (v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = v2;
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invertedSet");
    -[NSString(SafariSharedExtras) safari_rangeOfURLScheme]::inverseSchemeCharacterSet = objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", -[NSString(SafariSharedExtras) safari_rangeOfURLScheme]::inverseSchemeCharacterSet, 0, 0, v5) != 0x7FFFFFFFFFFFFFFFLL)return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 0;
}

- (uint64_t)safari_belongsToCookieDomain:()SafariSharedExtras
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(a1, "length") && objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR(".")))
    {
      objc_msgSend(v4, "substringFromIndex:", 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v7 = v5;
    objc_msgSend(v5, "safari_highLevelDomainFromHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;

      v7 = v10;
    }

    v6 = objc_msgSend(a1, "safari_isHostOrSubdomainOfHost:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)safari_detailStringWithURLString:()SafariSharedExtras prompt:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  v8 = v5;
  if (v7 && (v9 = objc_msgSend(v5, "length"), v8 = v6, v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ · %@"), v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

+ (id)safari_detailStringWithTitleString:()SafariSharedExtras prompt:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  v8 = v5;
  if (v7 && (v9 = objc_msgSend(v5, "length"), v8 = v6, v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (id)safari_stringByRedactingStrings:()SafariSharedExtras withReplacement:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v13 = objc_msgSend(a1, "length");
        v14 = 0;
        do
        {
          v16 = objc_msgSend(a1, "rangeOfString:options:range:", v12, 385, v14, v13);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          v17 = v15;
          objc_msgSend(v7, "addIndexesInRange:", v16, v15);
          v18 = objc_msgSend(a1, "length");
          v14 = v16 + v17;
          v13 = v18 - (v16 + v17);
        }
        while (v18 != v16 + v17);
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_msgSend(a1, "mutableCopy");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__NSString_SafariSharedExtras__safari_stringByRedactingStrings_withReplacement___block_invoke;
  v25[3] = &unk_1E4B3D238;
  v20 = v19;
  v26 = v20;
  v21 = v24;
  v27 = v21;
  objc_msgSend(v7, "enumerateRangesWithOptions:usingBlock:", 2, v25);
  v22 = (void *)objc_msgSend(v20, "copy");

  return v22;
}

@end
