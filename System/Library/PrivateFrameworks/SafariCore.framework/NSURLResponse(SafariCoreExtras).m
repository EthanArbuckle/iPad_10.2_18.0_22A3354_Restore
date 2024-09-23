@implementation NSURLResponse(SafariCoreExtras)

- (uint64_t)safari_hasAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "allHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", CFSTR("Content-Disposition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(";"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_stringByTrimmingWhitespace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", CFSTR("attachment"));
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_statusCodeGroup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v2 = objc_msgSend(a1, "statusCode");
  v3 = 5;
  if ((unint64_t)(v2 - 500) >= 0x64)
    v3 = 0;
  if ((unint64_t)(v2 - 400) >= 0x64)
    v4 = v3;
  else
    v4 = 4;
  if ((unint64_t)(v2 - 300) >= 0x64)
    v5 = v4;
  else
    v5 = 3;
  if ((unint64_t)(v2 - 200) >= 0x64)
    v6 = v5;
  else
    v6 = 2;
  if ((unint64_t)(v2 - 100) >= 0x64)
    return v6;
  else
    return 1;
}

- (id)safari_decodeJSONData:()SafariCoreExtras expectingRootClass:error:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a1, "safari_statusCodeGroup") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (!a4 || (objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
LABEL_16:

          goto LABEL_17;
        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB2FE0], 14, CFSTR("Root object is not the expected type."));
          v10 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      v10 = 0;
      goto LABEL_16;
    }
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2FE0];
      v13 = CFSTR("Received non-successful HTTP status code.");
      goto LABEL_11;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_17;
  }
  if (!a5)
    goto LABEL_12;
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2FE0];
  v13 = CFSTR("Response is not an HTTP response.");
LABEL_11:
  objc_msgSend(v11, "safari_errorWithDomain:code:privacyPreservingDescription:", v12, 14, v13);
  v10 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v10;
}

@end
