@implementation CRFormContentTypeUtilities

+ (id)stringFromContentType:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getFormContentTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "Invalid text content type: %lu", (uint8_t *)&v11, 0xCu);
    }

    v5 = v4;
    v6 = 0;
  }
  else
  {
    v5 = v4;
    v6 = a3;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("string"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)shortStringFromContentType:(unint64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "stringFromContentType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("CRFormContentType"), &stru_1E98DC948);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)contentTypeIsAutoFillable:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  getFormContentTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    CROSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_FAULT, "Invalid text content type: %lu", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autoFillable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  return v7;
}

+ (unint64_t)contentTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  if (qword_1ED0B4660 != -1)
    dispatch_once(&qword_1ED0B4660, &__block_literal_global_22);
  objc_msgSend((id)_MergedGlobals_22, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (v5 = (void *)_MergedGlobals_22,
        objc_msgSend(CFSTR("CRFormContentType"), "stringByAppendingString:", v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v6),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v4))
  {
    v7 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __52__CRFormContentTypeUtilities_contentTypeFromString___block_invoke()
{
  void *v0;
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)objc_opt_new();
  getFormContentTypes();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v1 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("string"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, v4);

      ++v1;
    }
    while (v1 < objc_msgSend(v6, "count"));
  }
  v5 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = (uint64_t)v0;

}

+ (BOOL)shouldAssignTextContentTypeForField:(id)a3 updateExternalFields:(BOOL)a4 allowOverride:(BOOL)a5 allowAllDetectionSources:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v9, "fieldSource");
  v11 = v10 == 1 || v6;
  if (v6 && v10 != 1)
    v11 = objc_msgSend(v9, "fieldSource") == 2 || objc_msgSend(v9, "fieldSource") == 3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v8 || (objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_30;
    if (a5)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (!a5)
  {
    if (objc_msgSend(v9, "textContentType"))
      LOBYTE(v11) = 0;
    if (v11 || !v8)
      goto LABEL_31;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_30;
LABEL_23:
    if (objc_msgSend(v9, "textContentType"))
      goto LABEL_30;
    goto LABEL_24;
  }
  if (!v11 && v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_30;
LABEL_24:
    if (objc_msgSend(v9, "fieldType") == 1)
    {
      if (objc_msgSend(v9, "fieldSource") == 4 || objc_msgSend(v9, "fieldSource") == 5)
      {
        LOBYTE(v11) = 1;
        goto LABEL_31;
      }
      if (objc_msgSend(v9, "fieldSource") == 7)
      {
        objc_msgSend(v9, "fieldValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v12, "length") != 0;

        goto LABEL_31;
      }
    }
LABEL_30:
    LOBYTE(v11) = 0;
  }
LABEL_31:

  return v11;
}

+ (BOOL)contentTypeIsStartOfAutofillContext:(unint64_t)a3 previousType:(unint64_t)a4 nextType:(unint64_t)a5
{
  return a3 < 2
      || +[CRFormContentTypeUtilities contentTypeIsComponentType:previousType:nextType:](CRFormContentTypeUtilities, "contentTypeIsComponentType:previousType:nextType:");
}

+ (BOOL)contentTypeIsComponentType:(unint64_t)a3 previousType:(unint64_t)a4 nextType:(unint64_t)a5
{
  return +[CRFormContentTypeUtilities contentTypeIsAddressComponent:](CRFormContentTypeUtilities, "contentTypeIsAddressComponent:")&& !+[CRFormContentTypeUtilities contentTypeIsAddressComponent:](CRFormContentTypeUtilities, "contentTypeIsAddressComponent:", a4)&& !+[CRFormContentTypeUtilities contentTypeIsAddressComponent:](CRFormContentTypeUtilities, "contentTypeIsAddressComponent:", a5)|| +[CRFormContentTypeUtilities contentTypeIsTelephoneComponent:](CRFormContentTypeUtilities, "contentTypeIsTelephoneComponent:", a3)&& !+[CRFormContentTypeUtilities contentTypeIsTelephoneComponent:](CRFormContentTypeUtilities, "contentTypeIsTelephoneComponent:", a4)&& !+[CRFormContentTypeUtilities contentTypeIsTelephoneComponent:](
            CRFormContentTypeUtilities,
            "contentTypeIsTelephoneComponent:",
            a5)
      || +[CRFormContentTypeUtilities contentTypeIsCreditCardComponent:](CRFormContentTypeUtilities, "contentTypeIsCreditCardComponent:", a3)&& !+[CRFormContentTypeUtilities contentTypeIsCreditCardComponent:](CRFormContentTypeUtilities, "contentTypeIsCreditCardComponent:", a4)&& !+[CRFormContentTypeUtilities contentTypeIsCreditCardComponent:](CRFormContentTypeUtilities, "contentTypeIsCreditCardComponent:", a5);
}

+ (BOOL)contentTypeIsAddressComponent:(unint64_t)a3
{
  return (a3 < 0x15) & (0x1BE000u >> a3);
}

+ (BOOL)contentTypeIsTelephoneComponent:(unint64_t)a3
{
  return (a3 < 0x32) & (0x3A80000000000uLL >> a3);
}

+ (BOOL)contentTypeIsCreditCardComponent:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 0x20
      || (a3 & 0xFFFFFFFFFFFFFFFCLL) == 24
      || a3 == 28
      || (a3 & 0xFFFFFFFFFFFFFFFELL) == 30
      || a3 == 29;
}

+ (BOOL)contentTypeIsBirthdayComponent:(unint64_t)a3
{
  return a3 - 37 < 4;
}

+ (BOOL)contentTypeIsDateComponent:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 52;
}

@end
