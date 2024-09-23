id CRLAppGroupIdentifier()
{
  if (qword_10006DA18 != -1)
    dispatch_once(&qword_10006DA18, &stru_100061478);
  return (id)qword_10006DA10;
}

void sub_100004A1C(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v1 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "group.com.apple.freeform"));
  v2 = (void *)qword_10006DA10;
  qword_10006DA10 = v1;

  if ((objc_msgSend((id)qword_10006DA10, "hasPrefix:", CFSTR("group.com.apple.")) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061498);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BD58();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_1000614B8);
    v3 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BCBC(v3);
    v13 = qword_10006DA10;
    CRLSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d App group identifier (%@) has unexpected prefix.", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"NSString *CRLAppGroupIdentifier()_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *CRLAppGroupIdentifier()_block_invoke"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBundleUtilities.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 51, 1, "App group identifier (%@) has unexpected prefix.", qword_10006DA10, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBundleUtilities.m", 51, v13);

    CRLCrashBreakpoint();
    abort();
  }
}

void sub_100004BC8(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100004BF8(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100004C28(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100004C5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

void sub_100004FC8(id a1)
{
  void *v1;
  id v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("kern.osversion", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0xACBDD60AuLL);
  sysctlbyname("kern.osversion", v1, &size, 0, 0);
  v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v1);
  v3 = (void *)qword_10006DA20;
  qword_10006DA20 = (uint64_t)v2;

  free(v1);
}

void sub_1000050A4(id a1)
{
  void *v1;
  id v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0x3B240CF6uLL);
  sysctlbyname("hw.model", v1, &size, 0, 0);
  v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v1);
  v3 = (void *)qword_10006DA30;
  qword_10006DA30 = (uint64_t)v2;

  free(v1);
}

void sub_1000054D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000054F0(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v9;
  void *v10;
  unint64_t v11;

  v9 = (void *)a1[4];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "substringToIndex:", 1));
  objc_msgSend(v9, "appendString:", v10);

  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v11 = a1[6];
  if (v11)
    LOBYTE(v11) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= v11;
  *a7 = v11;
}

void sub_100005640(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if ((unint64_t)objc_msgSend(v14, "length") >= 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%@.%@"), 0, 0));

    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", objc_msgSend(v14, "length")));
    objc_msgSend(v11, "appendFormat:", v10, v12, v13);

  }
  *a7 = 1;

}

void sub_1000061F8(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100006228(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000672C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000675C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100006BE8(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("*?+[(){}^$|\\./")));
  objc_storeStrong((id *)&qword_10006DA40, v1);
  if (!qword_10006DA40)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061608);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BFA4();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061628);
    v2 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BDEC(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_escapeForIcuRegex]_block_invoke"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 440, 0, "invalid nil value for '%{public}s'", "icuRegexCharSet");

  }
}

void sub_100006D70(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100006DA0(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

CFStringTokenizerTokenType sub_1000083E4(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  CFStringTokenizerTokenType Token;
  CFStringTokenizerTokenType v5;
  BOOL v6;

  do
  {
    while (1)
    {
      Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      v5 = Token;
      if (Token)
        break;
      if (CFStringTokenizerGetCurrentTokenRange(tokenizer).location == -1)
        return v5;
    }
    if (*(_BYTE *)(a1 + 32))
      v6 = 1;
    else
      v6 = (Token & 0x10) == 0;
  }
  while (!v6);
  return v5;
}

void sub_1000084A0(id a1)
{
  id v1;
  void *v2;
  __int16 v3;

  v3 = -4;
  v1 = objc_msgSend(objc_alloc((Class)NSString), "initWithCharacters:length:", &v3, 1);
  v2 = (void *)qword_10006DA50;
  qword_10006DA50 = (uint64_t)v1;

}

void sub_100008614(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("ـ‑-‐–—")));
  v2 = (void *)qword_10006DA68;
  qword_10006DA68 = v1;

}

void sub_1000086A0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("'\"’‘‚“”„«»‹›」「』『")));
  v2 = (void *)qword_10006DA78;
  qword_10006DA78 = v1;

}

void sub_100008D9C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100008DCC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_1000091FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", a2);
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v6));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

int64_t sub_10000927C(id a1, NSValue *a2, NSValue *a3)
{
  NSValue *v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = -[NSValue rangeValue](a2, "rangeValue");
  v6 = -[NSValue rangeValue](v4, "rangeValue");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

void sub_1000095A4(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  int v4;

  v1 = objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 0, 32));
  v2 = (void *)qword_10006DA80;
  qword_10006DA80 = v1;

  objc_msgSend((id)qword_10006DA80, "addCharactersInString:", CFSTR("\"\\"));
  v4 = 539566120;
  v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithCharacters:length:", &v4, 2);
  objc_msgSend((id)qword_10006DA80, "addCharactersInString:", v3);

}

void sub_1000097BC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_1000097EC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_100009DC4(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLDefaultCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLDefaultCat_log_t;
  CRLDefaultCat_log_t = v2;

}

void sub_10000A230(id a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v4 = 0;
  v1 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("<REDACT .*? REDACT>"), 8, &v4);
  v2 = v4;
  v3 = (void *)qword_10006DA90;
  qword_10006DA90 = (uint64_t)v1;

}

void sub_10000A418(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Cu);
}

uint64_t sub_10000A448()
{
  uint64_t v0;

  return v0;
}

void sub_10000AB80(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLSharingExtensionCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLSharingExtensionCat_log_t;
  CRLSharingExtensionCat_log_t = v2;

}

void sub_10000ABB0(uint64_t a1, void *a2, uint64_t a3)
{
  CRLSEImportableItem *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "p_logItemProviderError:error:", UTTypeURL, a3);
  }
  else
  {
    v5 = objc_alloc_init(CRLSEImportableItem);
    -[CRLSEImportableItem setUrl:](v5, "setUrl:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_10000AC34(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  CRLSEImportableItem *v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v9 = v5;
  if (a3)
  {
    objc_msgSend(v6, "p_logItemProviderError:error:", UTTypePlainText, a3);
  }
  else if ((objc_msgSend(v6, "p_stringIsConsideredEmpty:", v5) & 1) == 0)
  {
    v7 = objc_alloc_init(CRLSEImportableItem);
    v8 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v9);
    -[CRLSEImportableItem setAttributedText:](v7, "setAttributedText:", v8);

    -[CRLSEImportableItem setMediaUTI:](v7, "setMediaUTI:", UTTypePlainText);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_10000AD04(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  uint64_t v36;
  unsigned int v37;
  id v38;
  void *v39;
  CRLSEImportableItem *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "p_logItemProviderError:error:", UTTypePlainText, a3);
    goto LABEL_36;
  }
  if (!objc_msgSend(v5, "length"))
  {
    if (CRLSharingExtensionCat_init_token != -1)
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100061880);
    v13 = CRLSharingExtensionCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C1A0(v13);
    goto LABEL_36;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "suggestedName"));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "suggestedName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "suggestedName"));
      goto LABEL_13;
    }
  }
  else
  {

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultImageFileName"));
LABEL_13:
  v14 = (void *)v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "temporaryDirectory"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URLByAppendingPathComponent:", v14));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathExtension"));
  if (!v21
    || (v22 = (void *)v21,
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathExtension")),
        v24 = objc_msgSend(v23, "length"),
        v23,
        v22,
        !v24))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredTypeIdentifiers"));
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v26)
    {
      v27 = v26;
      v42 = v15;
      v43 = v14;
      v44 = v6;
      v45 = a1;
      v28 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i)));
          if (objc_msgSend(v30, "conformsToType:", UTTypeRAWImage))
          {
            v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "preferredFilenameExtension"));
            if (v31)
            {
              v32 = (void *)v31;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "preferredFilenameExtension"));
              v34 = objc_msgSend(v33, "length");

              if (v34)
              {
                v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "preferredFilenameExtension"));

                v6 = v44;
                a1 = v45;
                v15 = v42;
                v14 = v43;
                goto LABEL_28;
              }
            }
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v27)
          continue;
        break;
      }
      v6 = v44;
      a1 = v45;
      v15 = v42;
      v14 = v43;
    }
    v35 = CFSTR("raw");
LABEL_28:

    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathExtension:", v35));
    v20 = (void *)v36;
  }
  v46 = 0;
  v37 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v46);
  v38 = v46;
  if (v37)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
    objc_msgSend(v15, "createFileAtPath:contents:attributes:", v39, v6, 0);

    v40 = objc_alloc_init(CRLSEImportableItem);
    -[CRLSEImportableItem setUrl:](v40, "setUrl:", v20);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v40);

  }
  else
  {
    if (CRLDefaultCat_init_token != -1)
      dispatch_once(&CRLDefaultCat_init_token, &stru_1000618A0);
    v41 = CRLDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C244(v41, v38);
  }

LABEL_36:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void sub_10000B18C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLSharingExtensionCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLSharingExtensionCat_log_t;
  CRLSharingExtensionCat_log_t = v2;

}

void sub_10000B1BC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLDefaultCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLDefaultCat_log_t;
  CRLDefaultCat_log_t = v2;

}

void sub_10000B1EC(uint64_t a1, void *a2, uint64_t a3)
{
  CRLSEImportableItem *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "p_logItemProviderError:error:", UTTypeData, a3);
  }
  else
  {
    v5 = objc_alloc_init(CRLSEImportableItem);
    -[CRLSEImportableItem setImage:](v5, "setImage:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_10000B270(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CRLSEImportableItem *v25;
  void *v26;
  id v27;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "p_logItemProviderError:error:", UTTypeData, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredTypeIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));

    if (CRLSharingExtensionCat_init_token != -1)
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100061910);
    v8 = CRLSharingExtensionCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C2E0((uint64_t)v7, v8, v9);
    goto LABEL_18;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "suggestedName"));
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "suggestedName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12));
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR(".pdf")));

    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "suggestedName"));
LABEL_11:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "temporaryDirectory"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URLByAppendingPathComponent:", v7));
  v27 = 0;
  LODWORD(v20) = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v27);
  v23 = v27;
  if ((_DWORD)v20)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
    objc_msgSend(v17, "createFileAtPath:contents:attributes:", v24, v5, 0);

    v25 = objc_alloc_init(CRLSEImportableItem);
    -[CRLSEImportableItem setUrl:](v25, "setUrl:", v22);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);

  }
  else
  {
    if (CRLDefaultCat_init_token != -1)
      dispatch_once(&CRLDefaultCat_init_token, &stru_100061930);
    v26 = CRLDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C244(v26, v23);
  }

LABEL_18:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void sub_10000B580(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLSharingExtensionCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLSharingExtensionCat_log_t;
  CRLSharingExtensionCat_log_t = v2;

}

void sub_10000B5B0(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLDefaultCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLDefaultCat_log_t;
  CRLDefaultCat_log_t = v2;

}

void sub_10000B5E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  CRLSEImportableItem *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "p_logItemProviderError:error:", UTTypeData, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredTypeIdentifiers"));
    v7 = (CRLSEImportableItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));

    if (CRLSharingExtensionCat_init_token != -1)
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100061950);
    v8 = CRLSharingExtensionCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C2E0((uint64_t)v7, v8, v9);
  }
  else
  {
    v7 = objc_alloc_init(CRLSEImportableItem);
    -[CRLSEImportableItem setUrl:](v7, "setUrl:", v5);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_10000B6E0(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLSharingExtensionCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLSharingExtensionCat_log_t;
  CRLSharingExtensionCat_log_t = v2;

}

uint64_t sub_10000B710(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_10000B7BC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLSharingExtensionCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLSharingExtensionCat_log_t;
  CRLSharingExtensionCat_log_t = v2;

}

void sub_10000BC40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000BC4C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t sub_10000BC70()
{
  uint64_t v0;

  return objc_opt_class(v0);
}

id sub_10000BC7C()
{
  void *v0;

  return _objc_msgSend(v0, "code");
}

void sub_10000BCC8(id a1)
{
  CRLLogHelper *v1;
  void *v2;

  v1 = objc_alloc_init(CRLLogHelper);
  v2 = (void *)qword_10006DAA0;
  qword_10006DAA0 = (uint64_t)v1;

}

void sub_10000BEB8(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLPerformanceCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLPerformanceCat_log_t;
  CRLPerformanceCat_log_t = v2;

}

void sub_10000BEE4(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLPerformanceCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLPerformanceCat_log_t;
  CRLPerformanceCat_log_t = v2;

}

void sub_10000C430(uint64_t a1)
{
  void (**v2)(void);
  NSObject *v3;
  _QWORD block[4];
  void (**v5)(void);

  v2 = *(void (***)(void))(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C4C0;
      block[3] = &unk_100061A48;
      v5 = v2;
      dispatch_async(v3, block);

    }
    else
    {
      v2[2]();
    }
  }
}

uint64_t sub_10000C4C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000CCB8(id a1)
{
  void *v1;
  id v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  size_t size;

  size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0xF2D9B89FuLL);
  sysctlbyname("hw.machine", v1, &size, 0, 0);
  v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v1);
  free(v1);
  objc_storeStrong((id *)&qword_10006DAB0, v2);
  if (!qword_10006DAB0)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061A88);
    v4 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C4DC(v3, v4);
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061AA8);
    v5 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C41C(v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIDevice(CRLAdditions) crl_platformString]_block_invoke"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIDevice_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 46, 0, "invalid nil value for '%{public}s'", "s_platformString");

  }
}

void sub_10000CE98(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000CEC8(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D3E8(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D418(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D448(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D478(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D610(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D640(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000D814(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", 0));
  v2 = (void *)qword_10006DAD8;
  qword_10006DAD8 = v1;

}

void sub_10000D884(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", 1));
  v2 = (void *)qword_10006DAE0;
  qword_10006DAE0 = v1;

}

void sub_10000D8B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x36u);
}

id sub_10000D968(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "p_crl_uncachedScreenClass");
  qword_10006DAF8 = (uint64_t)result;
  return result;
}

void sub_10000E18C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E1BC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E1EC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E21C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E24C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E27C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E2AC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E2DC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E30C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E33C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000E3AC(id a1)
{
  BOOL v1;

  v1 = (id)+[UIScreen crl_screenClass](UIScreen, "crl_screenClass") == (id)3
    || (id)+[UIScreen crl_screenClass](UIScreen, "crl_screenClass") == (id)5;
  byte_10006DB08 = v1;
}

void sub_10000E438(id a1)
{
  BOOL v1;

  v1 = (id)+[UIScreen crl_screenClass](UIScreen, "crl_screenClass") == (id)1
    || (id)+[UIScreen crl_screenClass](UIScreen, "crl_screenClass") == (id)2;
  byte_10006DB18 = v1;
}

void sub_10000E4C4(id a1)
{
  double v1;
  double v2;
  void *v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "nativeScale");
  v2 = v1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  *(double *)&qword_10006C538 = v2 / v4;

}

void sub_10000E570(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_padUI](UIDevice, "crl_padUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 1080.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB30 = v8;
}

void sub_10000E620(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_padUI](UIDevice, "crl_padUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 1112.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB40 = v8;
}

void sub_10000E6D0(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_padUI](UIDevice, "crl_padUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 1180.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB50 = v8;
}

void sub_10000E780(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_padUI](UIDevice, "crl_padUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 1194.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB60 = v8;
}

void sub_10000E830(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_padUI](UIDevice, "crl_padUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 1366.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB70 = v8;
}

void sub_10000E8E0(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_padUI](UIDevice, "crl_padUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 >= 1366.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB80 = v8;
}

void sub_10000E990(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 568.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DB90 = v8;
}

void sub_10000EA40(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 <= 568.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DBA0 = v8;
}

void sub_10000EAF0(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 667.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DBB0 = v8;
}

void sub_10000EBA0(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 <= 667.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DBC0 = v8;
}

void sub_10000EC50(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 693.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DBD0 = v8;
}

void sub_10000ED00(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 736.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DBE0 = v8;
}

void sub_10000EDB0(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 812.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DBF0 = v8;
}

void sub_10000EE60(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 >= 812.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DC00 = v8;
}

void sub_10000EF10(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 844.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DC10 = v8;
}

void sub_10000EFC0(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 896.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DC20 = v8;
}

void sub_10000F070(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  char v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v3 >= v5)
    v7 = v3;
  else
    v7 = v5;
  if (v7 == 926.0)
    v8 = v6;
  else
    v8 = 0;
  byte_10006DC30 = v8;
}

void sub_10000F310(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000F340(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000F53C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000F56C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000F5D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

intptr_t CRLDynamicBaseAddress()
{
  const section_64 *v0;
  uint64_t addr;
  uint64_t offset;
  intptr_t image_vmaddr_slide;
  uint32_t v4;
  const char *image_name;
  uint32_t bufsize;
  char buf[1024];

  v0 = getsectbyname("__TEXT", "__text");
  addr = v0->addr;
  offset = v0->offset;
  bufsize = 1024;
  if (_NSGetExecutablePath(buf, &bufsize))
  {
    image_vmaddr_slide = -1;
  }
  else if (_dyld_image_count())
  {
    v4 = 0;
    while (1)
    {
      image_name = _dyld_get_image_name(v4);
      if (!strcmp(image_name, buf))
        break;
      if (++v4 >= _dyld_image_count())
        goto LABEL_7;
    }
    image_vmaddr_slide = _dyld_get_image_vmaddr_slide(v4);
  }
  else
  {
LABEL_7:
    image_vmaddr_slide = 0;
  }
  return addr - offset + image_vmaddr_slide;
}

void sub_10000F96C(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a2;
  if (CRLAssertCat_init_token != -1)
    dispatch_once(&CRLAssertCat_init_token, &stru_100062048);
  v6 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    sub_10004CB94(v6);
    if ((a3 & 1) != 0)
      goto LABEL_5;
  }
  else if ((a3 & 1) != 0)
  {
LABEL_5:
    v7 = *(void **)(a1 + 32);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Terminating application due to %@"), v5));
LABEL_9:
    v9 = v8;
    objc_msgSend(v7, "addObject:", v8);

    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(v5, "copy");
    goto LABEL_9;
  }
LABEL_10:

}

void sub_10000FA4C(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000FAFC(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_10000FBC4(id a1)
{
  os_log_t Category;
  void *v2;
  void *v3;

  Category = CRLLogCreateCategory("CRLAssertCat");
  v2 = (void *)objc_claimAutoreleasedReturnValue(Category);
  v3 = CRLAssertCat_log_t;
  CRLAssertCat_log_t = v2;

}

void sub_1000102CC(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", &off_1000644F8));
  v2 = (void *)qword_10006DC50;
  qword_10006DC50 = v1;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)qword_10006DC58;
  qword_10006DC58 = (uint64_t)v3;

  dword_10006DC60 = 0;
}

void sub_1000103A0(id a1)
{
  void *v1;

  v1 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  if (v1)
    v1 = dlsym(v1, "SimulateCrash");
  off_10006DC68 = v1;
}

void CRLSetCrashReporterInfov(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  const char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a2;
  v8 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v3 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "crl_initRedactedWithFormat:arguments:", v2, v7));
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  v6 = 0;
  if (v4)
  {
    asprintf(&v6, "%s", v4);
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }
  if (!v5)
    v5 = "CRLSetCrashReporterInfo: unknown reason";
  __crashreporter_info__ = (uint64_t)v5;

}

void CRLSetCrashReporterInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CRLSetCrashReporterInfov(a1, (uint64_t)&a9);
}

os_log_t CRLLogCreateCategory(char *category)
{
  return os_log_create("com.apple.freeform", category);
}

id sub_100010920(_QWORD *a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_1000109E4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_100010ACC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100010ADC(uint64_t a1)
{

}

void sub_100010AE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100010BD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_100010C94(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

id sub_100010D1C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

void sub_100010DDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "description"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id CRLLogGetNameDictionary()
{
  if (qword_10006DC88[0] != -1)
    dispatch_once(qword_10006DC88, &stru_100062188);
  return (id)qword_10006DC80;
}

void sub_100010E88(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v2 = (void *)qword_10006DC80;
  qword_10006DC80 = v1;

}

id CRLLogEnsureCreated(void *a1, id *a2, dispatch_once_t *a3)
{
  dispatch_once_t v5;
  id v6;
  id NameDictionary;
  void *v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  void *v15;
  id *v16;

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100010F68;
  v14 = &unk_1000621B0;
  v15 = a1;
  v16 = a2;
  v5 = *a3;
  v6 = a1;
  if (v5 != -1)
    dispatch_once(a3, &v11);
  NameDictionary = CRLLogGetNameDictionary();
  v8 = (void *)objc_claimAutoreleasedReturnValue(NameDictionary);
  objc_msgSend(v8, "setObject:forKey:", v6, *a2, v11, v12, v13, v14, v15, v16);

  v9 = *a2;
  return v9;
}

void sub_100010F68(uint64_t a1)
{
  os_log_t v2;

  v2 = os_log_create("com.apple.freeform", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));

  **(_QWORD **)(a1 + 40) = v2;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel()
{
  return &type metadata for CRLSELibraryViewModel;
}

_QWORD *sub_100010FC0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v26 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v26 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v26);
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 3)
    {
      v27 = type metadata accessor for UUID(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(a1, a2, v27);
      v28 = sub_100011254((uint64_t *)&unk_10006D630);
      v29 = *(int *)(v28 + 48);
      v30 = (_QWORD *)((char *)a1 + v29);
      v31 = (_QWORD *)((char *)a2 + v29);
      v32 = v31[1];
      *v30 = *v31;
      v30[1] = v32;
      v33 = *(int *)(v28 + 64);
      v34 = (char *)a1 + v33;
      v35 = (char *)a2 + v33;
      v36 = type metadata accessor for Date(0);
      v37 = *(_QWORD *)(v36 - 8);
      v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
      swift_bridgeObjectRetain(v32);
      if (v38(v35, 1, v36))
      {
        v39 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      v40 = a1;
      v41 = a3;
      v42 = 3;
      goto LABEL_14;
    }
    if (EnumCaseMultiPayload == 2)
    {
      v9 = type metadata accessor for UUID(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      v10 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      v11 = (_QWORD *)((char *)a1 + v10);
      v12 = (_QWORD *)((char *)a2 + v10);
      v13 = v12[1];
      *v11 = *v12;
      v11[1] = v13;
      swift_bridgeObjectRetain(v13);
      v14 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      v15 = v14[12];
      v16 = (_QWORD *)((char *)a1 + v15);
      v17 = (_QWORD *)((char *)a2 + v15);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      *((_BYTE *)a1 + v14[16]) = *((_BYTE *)a2 + v14[16]);
      v19 = v14[20];
      v20 = (char *)a1 + v19;
      v21 = (char *)a2 + v19;
      v22 = type metadata accessor for Date(0);
      v23 = *(_QWORD *)(v22 - 8);
      v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
      swift_bridgeObjectRetain(v18);
      if (v24(v21, 1, v22))
      {
        v25 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      v40 = a1;
      v41 = a3;
      v42 = 2;
LABEL_14:
      swift_storeEnumTagMultiPayload(v40, v41, v42);
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t type metadata accessor for CRLSEBoardIdentifierStorage(uint64_t a1)
{
  return sub_100014114(a1, qword_10006C948, (uint64_t)&nominal type descriptor for CRLSEBoardIdentifierStorage);
}

uint64_t sub_100011254(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100011294(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 3)
  {
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
    v9 = sub_100011254((uint64_t *)&unk_10006D630);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v9 + 48) + 8));
    v7 = *(int *)(v9 + 64);
  }
  else
  {
    if ((_DWORD)result != 2)
      return result;
    v4 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    v5 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v5 + 20) + 8));
    v6 = sub_100011254((uint64_t *)&unk_10006D640);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v6 + 48) + 8));
    v7 = *(int *)(v6 + 80);
  }
  v10 = a1 + v7;
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  return result;
}

_BYTE *sub_1000113B0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 3)
  {
    v24 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a1, a2, v24);
    v25 = sub_100011254((uint64_t *)&unk_10006D630);
    v26 = *(int *)(v25 + 48);
    v27 = &a1[v26];
    v28 = &a2[v26];
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = *(int *)(v25 + 64);
    v31 = &a1[v30];
    v32 = &a2[v30];
    v33 = type metadata accessor for Date(0);
    v34 = *(_QWORD *)(v33 - 8);
    v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
    swift_bridgeObjectRetain(v29);
    if (v35(v32, 1, v33))
    {
      v36 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    v37 = a1;
    v38 = a3;
    v39 = 3;
    goto LABEL_12;
  }
  if (EnumCaseMultiPayload == 2)
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain(v11);
    v12 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
    v13 = v12[12];
    v14 = &a1[v13];
    v15 = &a2[v13];
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    a1[v12[16]] = a2[v12[16]];
    v17 = v12[20];
    v18 = &a1[v17];
    v19 = &a2[v17];
    v20 = type metadata accessor for Date(0);
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain(v16);
    if (v22(v19, 1, v20))
    {
      v23 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    v37 = a1;
    v38 = a3;
    v39 = 2;
LABEL_12:
    swift_storeEnumTagMultiPayload(v37, v38, v39);
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_BYTE *sub_100011608(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;

  if (a1 != a2)
  {
    sub_100013BBC((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 3)
    {
      v24 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a1, a2, v24);
      v25 = sub_100011254((uint64_t *)&unk_10006D630);
      v26 = *(int *)(v25 + 48);
      v27 = &a1[v26];
      v28 = &a2[v26];
      *v27 = *v28;
      v29 = v28[1];
      v27[1] = v29;
      v30 = *(int *)(v25 + 64);
      v31 = &a1[v30];
      v32 = &a2[v30];
      v33 = type metadata accessor for Date(0);
      v34 = *(_QWORD *)(v33 - 8);
      v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
      swift_bridgeObjectRetain(v29);
      if (v35(v32, 1, v33))
      {
        v36 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      }
      v37 = a1;
      v38 = a3;
      v39 = 3;
      goto LABEL_13;
    }
    if (EnumCaseMultiPayload == 2)
    {
      v7 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      v9 = &a1[v8];
      v10 = &a2[v8];
      *v9 = *v10;
      v11 = v10[1];
      v9[1] = v11;
      swift_bridgeObjectRetain(v11);
      v12 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      v13 = v12[12];
      v14 = &a1[v13];
      v15 = &a2[v13];
      *v14 = *v15;
      v16 = v15[1];
      v14[1] = v16;
      a1[v12[16]] = a2[v12[16]];
      v17 = v12[20];
      v18 = &a1[v17];
      v19 = &a2[v17];
      v20 = type metadata accessor for Date(0);
      v21 = *(_QWORD *)(v20 - 8);
      v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
      swift_bridgeObjectRetain(v16);
      if (v22(v19, 1, v20))
      {
        v23 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      v37 = a1;
      v38 = a3;
      v39 = 2;
LABEL_13:
      swift_storeEnumTagMultiPayload(v37, v38, v39);
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t type metadata accessor for CRLSELibraryViewModel.Item(uint64_t a1)
{
  return sub_100014114(a1, (uint64_t *)&unk_10006C820, (uint64_t)&nominal type descriptor for CRLSELibraryViewModel.Item);
}

_BYTE *sub_1000118A4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 3)
  {
    v16 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a1, a2, v16);
    v17 = sub_100011254((uint64_t *)&unk_10006D630);
    *(_OWORD *)&a1[*(int *)(v17 + 48)] = *(_OWORD *)&a2[*(int *)(v17 + 48)];
    v18 = *(int *)(v17 + 64);
    v19 = &a1[v18];
    v20 = &a2[v18];
    v21 = type metadata accessor for Date(0);
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      v23 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    v24 = a1;
    v25 = a3;
    v26 = 3;
    goto LABEL_12;
  }
  if (EnumCaseMultiPayload == 2)
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    *(_OWORD *)&a1[*(int *)(v8 + 20)] = *(_OWORD *)&a2[*(int *)(v8 + 20)];
    v9 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
    *(_OWORD *)&a1[v9[12]] = *(_OWORD *)&a2[v9[12]];
    a1[v9[16]] = a2[v9[16]];
    v10 = v9[20];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = type metadata accessor for Date(0);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    v24 = a1;
    v25 = a3;
    v26 = 2;
LABEL_12:
    swift_storeEnumTagMultiPayload(v24, v25, v26);
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_BYTE *sub_100011AC8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;

  if (a1 != a2)
  {
    sub_100013BBC((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 3)
    {
      v16 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a1, a2, v16);
      v17 = sub_100011254((uint64_t *)&unk_10006D630);
      *(_OWORD *)&a1[*(int *)(v17 + 48)] = *(_OWORD *)&a2[*(int *)(v17 + 48)];
      v18 = *(int *)(v17 + 64);
      v19 = &a1[v18];
      v20 = &a2[v18];
      v21 = type metadata accessor for Date(0);
      v22 = *(_QWORD *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        v23 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
      v24 = a1;
      v25 = a3;
      v26 = 3;
      goto LABEL_13;
    }
    if (EnumCaseMultiPayload == 2)
    {
      v7 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
      *(_OWORD *)&a1[*(int *)(v8 + 20)] = *(_OWORD *)&a2[*(int *)(v8 + 20)];
      v9 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      *(_OWORD *)&a1[v9[12]] = *(_OWORD *)&a2[v9[12]];
      a1[v9[16]] = a2[v9[16]];
      v10 = v9[20];
      v11 = &a1[v10];
      v12 = &a2[v10];
      v13 = type metadata accessor for Date(0);
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        v15 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      v24 = a1;
      v25 = a3;
      v26 = 2;
LABEL_13:
      swift_storeEnumTagMultiPayload(v24, v25, v26);
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100011D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100011D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100011D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

void sub_100011D34(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE v9[32];
  _QWORD v10[4];
  _BYTE v11[32];
  _QWORD v12[4];

  v12[0] = &unk_100051010;
  v12[1] = &unk_100051028;
  v2 = type metadata accessor for CRLSEBoardIdentifierStorage(319);
  if (v3 <= 0x3F)
  {
    v10[0] = *(_QWORD *)(v2 - 8) + 64;
    v10[1] = &unk_100051040;
    v10[2] = &unk_100051058;
    sub_1000141F4(319, (unint64_t *)&unk_10006C830, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
    if (v5 <= 0x3F)
    {
      v6 = *(_QWORD *)(v4 - 8) + 64;
      v10[3] = v6;
      swift_getTupleTypeLayout(v11, 0, 4, v10);
      v12[2] = v11;
      v7 = type metadata accessor for UUID(319);
      if (v8 <= 0x3F)
      {
        swift_getTupleTypeLayout3(v9, *(_QWORD *)(v7 - 8) + 64, &unk_100051040, v6);
        v12[3] = v9;
        swift_initEnumMetadataMultiPayload(a1, 256, 4, v12);
      }
    }
  }
}

uint64_t *sub_100011E44(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v6 = v4;
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain(v11);
  }
  return a1;
}

uint64_t sub_100011EE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20) + 8);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_100011F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t sub_100011F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  *v6 = *v7;
  v8 = v7[1];
  v9 = v6[1];
  v6[1] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t sub_100012008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t sub_100012060(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (uint64_t *)(a2 + v5);
  v9 = *v7;
  v8 = v7[1];
  v10 = v6[1];
  *v6 = v9;
  v6[1] = v8;
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t sub_1000120C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000120D4);
}

uint64_t sub_1000120D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_100012110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001211C);
}

uint64_t sub_10001211C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CRLSEBoardIdentifier(uint64_t a1)
{
  return sub_100014114(a1, qword_10006C8B8, (uint64_t)&nominal type descriptor for CRLSEBoardIdentifier);
}

uint64_t sub_100012170(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for CRLSEBoardIdentifierStorage(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t *sub_1000121D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001226C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
}

uint64_t sub_1000122B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001231C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v10 = v8[1];
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t sub_100012398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1000123F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  v12 = v8[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t sub_100012460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001246C);
}

uint64_t sub_10001246C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000124EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000124F8);
}

uint64_t sub_1000124F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_100012574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013478(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&unk_100051040);
}

uint64_t *sub_100012588(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v7);
    if (EnumCaseMultiPayload == 3)
    {
      v27 = type metadata accessor for UUID(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(a1, a2, v27);
      v28 = sub_100011254((uint64_t *)&unk_10006D630);
      v29 = *(int *)(v28 + 48);
      v30 = (uint64_t *)((char *)a1 + v29);
      v31 = (uint64_t *)((char *)a2 + v29);
      v32 = v31[1];
      *v30 = *v31;
      v30[1] = v32;
      v33 = *(int *)(v28 + 64);
      v34 = (char *)a1 + v33;
      v35 = (char *)a2 + v33;
      v36 = type metadata accessor for Date(0);
      v37 = *(_QWORD *)(v36 - 8);
      v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
      swift_bridgeObjectRetain(v32);
      if (v38(v35, 1, v36))
      {
        v39 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      v40 = a1;
      v41 = v7;
      v42 = 3;
    }
    else
    {
      if (EnumCaseMultiPayload != 2)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
LABEL_15:
        v43 = *(int *)(a3 + 20);
        v44 = *(uint64_t *)((char *)a2 + v43);
        *(uint64_t *)((char *)a1 + v43) = v44;
        swift_bridgeObjectRetain(v44);
        return a1;
      }
      v9 = type metadata accessor for UUID(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      v10 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      v11 = (uint64_t *)((char *)a1 + v10);
      v12 = (uint64_t *)((char *)a2 + v10);
      v13 = v12[1];
      *v11 = *v12;
      v11[1] = v13;
      swift_bridgeObjectRetain(v13);
      v14 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      v15 = v14[12];
      v16 = (uint64_t *)((char *)a1 + v15);
      v17 = (uint64_t *)((char *)a2 + v15);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      *((_BYTE *)a1 + v14[16]) = *((_BYTE *)a2 + v14[16]);
      v19 = v14[20];
      v20 = (char *)a1 + v19;
      v21 = (char *)a2 + v19;
      v22 = type metadata accessor for Date(0);
      v23 = *(_QWORD *)(v22 - 8);
      v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
      swift_bridgeObjectRetain(v18);
      if (v24(v21, 1, v22))
      {
        v25 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      v40 = a1;
      v41 = v7;
      v42 = 2;
    }
    swift_storeEnumTagMultiPayload(v40, v41, v42);
    goto LABEL_15;
  }
  v26 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain(v26);
  return a1;
}

uint64_t sub_100012830(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a1, v4);
  if (EnumCaseMultiPayload == 3)
  {
    v10 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    v11 = sub_100011254((uint64_t *)&unk_10006D630);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v11 + 48) + 8));
    v9 = *(int *)(v11 + 64);
  }
  else
  {
    if (EnumCaseMultiPayload != 2)
      return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20)));
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    v7 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v7 + 20) + 8));
    v8 = sub_100011254((uint64_t *)&unk_10006D640);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v8 + 48) + 8));
    v9 = *(int *)(v8 + 80);
  }
  v12 = a1 + v9;
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20)));
}

_BYTE *sub_100012964(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
  if (EnumCaseMultiPayload == 3)
  {
    v25 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(a1, a2, v25);
    v26 = sub_100011254((uint64_t *)&unk_10006D630);
    v27 = *(int *)(v26 + 48);
    v28 = &a1[v27];
    v29 = &a2[v27];
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = *(int *)(v26 + 64);
    v32 = &a1[v31];
    v33 = &a2[v31];
    v34 = type metadata accessor for Date(0);
    v35 = *(_QWORD *)(v34 - 8);
    v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
    swift_bridgeObjectRetain(v30);
    if (v36(v33, 1, v34))
    {
      v37 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    v38 = a1;
    v39 = v6;
    v40 = 3;
    goto LABEL_12;
  }
  if (EnumCaseMultiPayload == 2)
  {
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain(v12);
    v13 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
    v14 = v13[12];
    v15 = &a1[v14];
    v16 = &a2[v14];
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    a1[v13[16]] = a2[v13[16]];
    v18 = v13[20];
    v19 = &a1[v18];
    v20 = &a2[v18];
    v21 = type metadata accessor for Date(0);
    v22 = *(_QWORD *)(v21 - 8);
    v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_bridgeObjectRetain(v17);
    if (v23(v20, 1, v21))
    {
      v24 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    v38 = a1;
    v39 = v6;
    v40 = 2;
LABEL_12:
    swift_storeEnumTagMultiPayload(v38, v39, v40);
    goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
LABEL_13:
  v41 = *(int *)(a3 + 20);
  v42 = *(_QWORD *)&a2[v41];
  *(_QWORD *)&a1[v41] = v42;
  swift_bridgeObjectRetain(v42);
  return a1;
}

_BYTE *sub_100012BE0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (a1 != a2)
  {
    sub_100013BBC((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
    if (EnumCaseMultiPayload == 3)
    {
      v25 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(a1, a2, v25);
      v26 = sub_100011254((uint64_t *)&unk_10006D630);
      v27 = *(int *)(v26 + 48);
      v28 = &a1[v27];
      v29 = &a2[v27];
      *v28 = *v29;
      v30 = v29[1];
      v28[1] = v30;
      v31 = *(int *)(v26 + 64);
      v32 = &a1[v31];
      v33 = &a2[v31];
      v34 = type metadata accessor for Date(0);
      v35 = *(_QWORD *)(v34 - 8);
      v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
      swift_bridgeObjectRetain(v30);
      if (v36(v33, 1, v34))
      {
        v37 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      }
      v38 = a1;
      v39 = v6;
      v40 = 3;
      goto LABEL_13;
    }
    if (EnumCaseMultiPayload == 2)
    {
      v8 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      v10 = &a1[v9];
      v11 = &a2[v9];
      *v10 = *v11;
      v12 = v11[1];
      v10[1] = v12;
      swift_bridgeObjectRetain(v12);
      v13 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      v14 = v13[12];
      v15 = &a1[v14];
      v16 = &a2[v14];
      *v15 = *v16;
      v17 = v16[1];
      v15[1] = v17;
      a1[v13[16]] = a2[v13[16]];
      v18 = v13[20];
      v19 = &a1[v18];
      v20 = &a2[v18];
      v21 = type metadata accessor for Date(0);
      v22 = *(_QWORD *)(v21 - 8);
      v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
      swift_bridgeObjectRetain(v17);
      if (v23(v20, 1, v21))
      {
        v24 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
      v38 = a1;
      v39 = v6;
      v40 = 2;
LABEL_13:
      swift_storeEnumTagMultiPayload(v38, v39, v40);
      goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
LABEL_14:
  v41 = *(int *)(a3 + 20);
  v42 = *(_QWORD *)&a2[v41];
  v43 = *(_QWORD *)&a1[v41];
  *(_QWORD *)&a1[v41] = v42;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRelease(v43);
  return a1;
}

_BYTE *sub_100012E98(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
  if (EnumCaseMultiPayload == 3)
  {
    v17 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a1, a2, v17);
    v18 = sub_100011254((uint64_t *)&unk_10006D630);
    *(_OWORD *)&a1[*(int *)(v18 + 48)] = *(_OWORD *)&a2[*(int *)(v18 + 48)];
    v19 = *(int *)(v18 + 64);
    v20 = &a1[v19];
    v21 = &a2[v19];
    v22 = type metadata accessor for Date(0);
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    v25 = a1;
    v26 = v6;
    v27 = 3;
    goto LABEL_12;
  }
  if (EnumCaseMultiPayload == 2)
  {
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
    v10 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
    *(_OWORD *)&a1[v10[12]] = *(_OWORD *)&a2[v10[12]];
    a1[v10[16]] = a2[v10[16]];
    v11 = v10[20];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = type metadata accessor for Date(0);
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = sub_100011254((uint64_t *)&unk_10006D130);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    v25 = a1;
    v26 = v6;
    v27 = 2;
LABEL_12:
    swift_storeEnumTagMultiPayload(v25, v26, v27);
    goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
LABEL_13:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

_BYTE *sub_1000130DC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a1 != a2)
  {
    sub_100013BBC((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, v6);
    if (EnumCaseMultiPayload == 3)
    {
      v17 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a1, a2, v17);
      v18 = sub_100011254((uint64_t *)&unk_10006D630);
      *(_OWORD *)&a1[*(int *)(v18 + 48)] = *(_OWORD *)&a2[*(int *)(v18 + 48)];
      v19 = *(int *)(v18 + 64);
      v20 = &a1[v19];
      v21 = &a2[v19];
      v22 = type metadata accessor for Date(0);
      v23 = *(_QWORD *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        v24 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      v25 = a1;
      v26 = v6;
      v27 = 3;
      goto LABEL_13;
    }
    if (EnumCaseMultiPayload == 2)
    {
      v8 = type metadata accessor for UUID(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
      *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
      v10 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      *(_OWORD *)&a1[v10[12]] = *(_OWORD *)&a2[v10[12]];
      a1[v10[16]] = a2[v10[16]];
      v11 = v10[20];
      v12 = &a1[v11];
      v13 = &a2[v11];
      v14 = type metadata accessor for Date(0);
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        v16 = sub_100011254((uint64_t *)&unk_10006D130);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
      v25 = a1;
      v26 = v6;
      v27 = 2;
LABEL_13:
      swift_storeEnumTagMultiPayload(v25, v26, v27);
      goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
LABEL_14:
  v28 = *(int *)(a3 + 20);
  v29 = *(_QWORD *)&a1[v28];
  *(_QWORD *)&a1[v28] = *(_QWORD *)&a2[v28];
  swift_bridgeObjectRelease(v29);
  return a1;
}

uint64_t sub_100013340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001334C);
}

uint64_t sub_10001334C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000133C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000133D4);
}

uint64_t sub_1000133D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for CRLSELibraryViewModeItemNode(uint64_t a1)
{
  return sub_100014114(a1, qword_10006C9D8, (uint64_t)&nominal type descriptor for CRLSELibraryViewModeItemNode);
}

uint64_t sub_100013460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013478(a1, a2, a3, type metadata accessor for CRLSELibraryViewModel.Item, (uint64_t)&value witness table for Builtin.BridgeObject + 64);
}

uint64_t sub_100013478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t result;
  unint64_t v8;
  _QWORD v9[2];

  result = a4(319);
  if (v8 <= 0x3F)
  {
    v9[0] = *(_QWORD *)(result - 8) + 64;
    v9[1] = a5;
    swift_initStructMetadata(a1, 256, 2, v9, a1 + 16);
    return 0;
  }
  return result;
}

__n128 sub_1000134E4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000134F4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100013514(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_10001C1E4(a1, &qword_10006CA10, (uint64_t)&unk_100062470);
}

uint64_t *sub_100013550(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(uint64_t *, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v10);
  }
  else
  {
    v7 = type metadata accessor for CRLSEBoardIdentifier(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = sub_100011254(&qword_10006D7C0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = type metadata accessor for UUID(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v12 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      v13 = (uint64_t *)((char *)a1 + v12);
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      v16 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56);
      swift_bridgeObjectRetain(v15);
      v16(a1, 0, 1, v7);
    }
    v17 = *(int *)(a3 + 20);
    v18 = *(int *)(a3 + 24);
    v19 = (uint64_t *)((char *)a1 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = (char *)a1 + v18;
    v23 = (char *)a2 + v18;
    v24 = type metadata accessor for UUID(0);
    v25 = *(_QWORD *)(v24 - 8);
    v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    swift_bridgeObjectRetain(v21);
    if (v26(v23, 1, v24))
    {
      v27 = sub_100011254((uint64_t *)&unk_10006D7D0);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
  }
  return a1;
}

uint64_t sub_1000136FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v4 = type metadata accessor for CRLSEBoardIdentifier(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4))
  {
    v5 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    v6 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v6 + 20) + 8));
  }
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
  v7 = a1 + *(int *)(a2 + 24);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return result;
}

char *sub_1000137D8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;

  v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_100011254(&qword_10006D7C0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = type metadata accessor for UUID(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    v10 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v14 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain(v13);
    v14(a1, 0, 1, v6);
  }
  v15 = *(int *)(a3 + 20);
  v16 = *(int *)(a3 + 24);
  v17 = &a1[v15];
  v18 = &a2[v15];
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = v19;
  v20 = &a1[v16];
  v21 = &a2[v16];
  v22 = type metadata accessor for UUID(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  swift_bridgeObjectRetain(v19);
  if (v24(v21, 1, v22))
  {
    v25 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *sub_100013958(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = type metadata accessor for UUID(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v12 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      v13 = &a1[v12];
      v14 = &a2[v12];
      *(_QWORD *)v13 = *(_QWORD *)v14;
      v15 = *((_QWORD *)v14 + 1);
      *((_QWORD *)v13 + 1) = v15;
      v16 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
      swift_bridgeObjectRetain(v15);
      v16(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100013BBC((uint64_t)a1, type metadata accessor for CRLSEBoardIdentifier);
LABEL_6:
    v17 = sub_100011254(&qword_10006D7C0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v33 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 24))(a1, a2, v33);
  v34 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v35 = &a1[v34];
  v36 = &a2[v34];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  v37 = *((_QWORD *)v36 + 1);
  v38 = *((_QWORD *)v35 + 1);
  *((_QWORD *)v35 + 1) = v37;
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRelease(v38);
LABEL_7:
  v18 = *(int *)(a3 + 20);
  v19 = &a1[v18];
  v20 = &a2[v18];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v21 = *((_QWORD *)v20 + 1);
  v22 = *((_QWORD *)v19 + 1);
  *((_QWORD *)v19 + 1) = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v22);
  v23 = *(int *)(a3 + 24);
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = type metadata accessor for UUID(0);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v29 = v28(v24, 1, v26);
  v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 24))(v24, v25, v26);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    v31 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  return a1;
}

uint64_t sub_100013BBC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_100013BF8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_100011254(&qword_10006D7C0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = type metadata accessor for UUID(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    v10 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    *(_OWORD *)&a1[*(int *)(v10 + 20)] = *(_OWORD *)&a2[*(int *)(v10 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v11 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = type metadata accessor for UUID(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

char *sub_100013D54(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = type metadata accessor for UUID(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
      v12 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
      *(_OWORD *)&a1[*(int *)(v12 + 20)] = *(_OWORD *)&a2[*(int *)(v12 + 20)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100013BBC((uint64_t)a1, type metadata accessor for CRLSEBoardIdentifier);
LABEL_6:
    v13 = sub_100011254(&qword_10006D7C0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  v30 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(a1, a2, v30);
  v31 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v32 = &a1[v31];
  v33 = &a2[v31];
  v35 = *(_QWORD *)v33;
  v34 = *((_QWORD *)v33 + 1);
  v36 = *((_QWORD *)v32 + 1);
  *(_QWORD *)v32 = v35;
  *((_QWORD *)v32 + 1) = v34;
  swift_bridgeObjectRelease(v36);
LABEL_7:
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v18 = *(_QWORD *)v16;
  v17 = *((_QWORD *)v16 + 1);
  v19 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v15 = v18;
  *((_QWORD *)v15 + 1) = v17;
  swift_bridgeObjectRelease(v19);
  v20 = *(int *)(a3 + 24);
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = type metadata accessor for UUID(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    v28 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_100013F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013F90);
}

uint64_t sub_100013F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_100011254(&qword_10006D7C0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_100011254((uint64_t *)&unk_10006D7D0);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_100014044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014050);
}

uint64_t sub_100014050(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_100011254(&qword_10006D7C0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = sub_100011254((uint64_t *)&unk_10006D7D0);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for CRLSEBoard(uint64_t a1)
{
  return sub_100014114(a1, (uint64_t *)&unk_10006CA70, (uint64_t)&nominal type descriptor for CRLSEBoard);
}

uint64_t sub_100014114(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

void sub_100014148(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  sub_1000141F4(319, &qword_10006CA80, type metadata accessor for CRLSEBoardIdentifier);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = &unk_100051040;
    sub_1000141F4(319, (unint64_t *)&unk_10006CA88, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_1000141F4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_100014250()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E6572646C696863;
  else
    return 1835365481;
}

uint64_t sub_100014284@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001A8C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000142A8()
{
  return 0;
}

void sub_1000142B4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000142C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000192B8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000142E8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000192B8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100014310(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  v3 = v1;
  v5 = sub_100011254(&qword_10006CC08);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100017804(a1, v9);
  v11 = sub_1000192B8();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModeItemNode.CodingKeys, &type metadata for CRLSELibraryViewModeItemNode.CodingKeys, v11, v9, v10);
  v20 = 0;
  v12 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v13 = sub_1000177C4(&qword_10006CC10, type metadata accessor for CRLSELibraryViewModel.Item, (uint64_t)&unk_1000512F4);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v20, v5, v12, v13);
  if (!v2)
  {
    v19 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for CRLSELibraryViewModeItemNode(0) + 20));
    v18 = 1;
    v14 = sub_100011254(&qword_10006CBF8);
    v15 = sub_100019340(&qword_10006CC18, &qword_10006CC20, (uint64_t)&unk_100051134, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v19, &v18, v5, v14, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000144A4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;

  v25 = a2;
  v4 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin();
  v26 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100011254(&qword_10006CBE8);
  v6 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v9 = __chkstk_darwin();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *(int *)(v9 + 20);
  *(_QWORD *)&v11[v28] = _swiftEmptyArrayStorage;
  v12 = a1[3];
  v13 = a1[4];
  sub_100017804(a1, v12);
  v14 = sub_1000192B8();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModeItemNode.CodingKeys, &type metadata for CRLSELibraryViewModeItemNode.CodingKeys, v14, v12, v13);
  if (v2)
  {
    sub_10001786C(a1);
    return swift_bridgeObjectRelease(*(_QWORD *)&v11[v28]);
  }
  else
  {
    v15 = v6;
    v31 = 0;
    v16 = sub_1000177C4((unint64_t *)&unk_10006D7A0, type metadata accessor for CRLSELibraryViewModel.Item, (uint64_t)&unk_10005131C);
    v18 = (uint64_t)v26;
    v17 = v27;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v4, &v31, v27, v4, v16);
    sub_100017A6C(v18, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
    v19 = sub_100011254(&qword_10006CBF8);
    v30 = 1;
    v20 = sub_100019340((unint64_t *)&qword_10006D7B0, &qword_10006CC00, (uint64_t)&unk_10005115C, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v19, &v30, v17, v19, v20);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v17);
    v22 = v28;
    v21 = v29;
    swift_bridgeObjectRelease(*(_QWORD *)&v11[v28]);
    *(_QWORD *)&v11[v22] = v21;
    sub_1000191EC((uint64_t)v11, v25, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_10001786C(a1);
    return sub_100013BBC((uint64_t)v11, type metadata accessor for CRLSELibraryViewModeItemNode);
  }
}

uint64_t sub_100014758(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  char v20;

  v3 = v1;
  v5 = sub_100011254(&qword_10006CBE0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100017804(a1, v9);
  v11 = sub_100019274();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSEBoardIdentifierStorage.CodingKeys, &type metadata for CRLSEBoardIdentifierStorage.CodingKeys, v11, v9, v10);
  v20 = 0;
  v12 = type metadata accessor for UUID(0);
  v13 = sub_1000177C4(&qword_10006CB78, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v20, v5, v12, v13);
  if (!v2)
  {
    v14 = (uint64_t *)(v3 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20));
    v15 = *v14;
    v16 = v14[1];
    v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16, &v19, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000148AC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char v32;
  char v33;

  v27 = a2;
  v30 = type metadata accessor for UUID(0);
  v28 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v31 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100011254(&qword_10006CBD0);
  v5 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v11 = a1[4];
  sub_100017804(a1, v12);
  v13 = sub_100019274();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSEBoardIdentifierStorage.CodingKeys, &type metadata for CRLSEBoardIdentifierStorage.CodingKeys, v13, v12, v11);
  if (v2)
    return sub_10001786C(a1);
  v25 = a1;
  v26 = v5;
  v14 = (uint64_t)v10;
  v15 = v28;
  v33 = 0;
  v16 = sub_1000177C4(&qword_10006CB10, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v17 = v30;
  v18 = v29;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v30, &v33, v29, v30, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v31, v17);
  v32 = 1;
  v19 = KeyedDecodingContainer.decode(_:forKey:)(&v32, v18);
  v21 = v20;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v18);
  v22 = (uint64_t *)(v14 + *(int *)(v8 + 20));
  *v22 = v19;
  v22[1] = v21;
  sub_1000191EC(v14, v27, type metadata accessor for CRLSEBoardIdentifierStorage);
  sub_10001786C(v25);
  return sub_100013BBC(v14, type metadata accessor for CRLSEBoardIdentifierStorage);
}

uint64_t sub_100014B34@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000144A4(a1, a2);
}

uint64_t sub_100014B48(_QWORD *a1)
{
  return sub_100014310(a1);
}

uint64_t sub_100014B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;

  sub_100018C64(a1, a2);
  if ((v6 & 1) != 0)
    return sub_10001861C(*(_QWORD *)(a1 + *(int *)(a3 + 20)), *(_QWORD *)(a2 + *(int *)(a3 + 20)));
  else
    return 0;
}

BOOL sub_100014BB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100014BC8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100014C0C()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100014C34(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100014C74()
{
  _BYTE *v0;

  if (*v0)
    return 0x6D614E72656E776FLL;
  else
    return 0x4955556472616F62;
}

uint64_t sub_100014CB8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001A9A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100014CDC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100019274();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100014D04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100019274();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100014D2C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000148AC(a1, a2);
}

uint64_t sub_100014D40(_QWORD *a1)
{
  return sub_100014758(a1);
}

uint64_t sub_100014D54()
{
  return sub_1000177C4(&qword_10006CAC0, type metadata accessor for CRLSEBoardIdentifier, (uint64_t)&unk_100051214);
}

uint64_t sub_100014D80@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v18 = a2;
  v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  __chkstk_darwin(v4);
  v20 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100011254(&qword_10006CBA8);
  v19 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_100017804(a1, v12);
  v14 = sub_100019230();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSEBoardIdentifier.CodingKeys, &type metadata for CRLSEBoardIdentifier.CodingKeys, v14, v12, v13);
  if (!v2)
  {
    v15 = sub_1000177C4(&qword_10006CBB8, type metadata accessor for CRLSEBoardIdentifierStorage, (uint64_t)&unk_1000511AC);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v4, v16, v6, v4, v15);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
    sub_100017A6C(v20, (uint64_t)v11, type metadata accessor for CRLSEBoardIdentifierStorage);
    sub_100017A6C((uint64_t)v11, v18, type metadata accessor for CRLSEBoardIdentifier);
  }
  return sub_10001786C(a1);
}

uint64_t sub_100014F4C()
{
  return 1;
}

void sub_100014F58()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_100014F80()
{
  return 0x656761726F7473;
}

uint64_t sub_100014F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x656761726F7473 && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease(0xE700000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656761726F7473, 0xE700000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

void sub_10001502C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100015038(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100019230();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100015060(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100019230();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100015088@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014D80(a1, a2);
}

uint64_t sub_10001509C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = v1;
  v4 = sub_100011254(&qword_10006CBC0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100017804(a1, v8);
  v10 = sub_100019230();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSEBoardIdentifier.CodingKeys, &type metadata for CRLSEBoardIdentifier.CodingKeys, v10, v8, v9);
  v11 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  v12 = sub_1000177C4(&qword_10006CBC8, type metadata accessor for CRLSEBoardIdentifierStorage, (uint64_t)&unk_100051184);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v2, v13, v4, v11, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int sub_1000151B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, 0);
  v1 = type metadata accessor for UUID(0);
  v2 = sub_1000177C4((unint64_t *)&unk_10006D830, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v7, v1, v2);
  v3 = (uint64_t *)(v0 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20));
  v4 = *v3;
  v5 = v3[1];
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v7, v4, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_100015250(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = type metadata accessor for UUID(0);
  v4 = sub_1000177C4((unint64_t *)&unk_10006D830, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(a1, v3, v4);
  v5 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20));
  v6 = *v5;
  v7 = v5[1];
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(a1, v6, v7);
  return swift_bridgeObjectRelease(v7);
}

Swift::Int sub_1000152DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, a1);
  v2 = type metadata accessor for UUID(0);
  v3 = sub_1000177C4((unint64_t *)&unk_10006D830, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v8, v2, v3);
  v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20));
  v5 = *v4;
  v6 = v4[1];
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

void sub_100015378()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;

  v1 = type metadata accessor for UUID(0);
  __chkstk_darwin(v1);
  v2 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v2);
  v3 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000191EC(v0, (uint64_t)v5, v6);
  v7 = (char *)sub_100015478 + 4 * byte_100050F70[swift_getEnumCaseMultiPayload(v5, v3)];
  __asm { BR              X10 }
}

void sub_100015478()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

void sub_1000155EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000191EC(v0, (uint64_t)v3, v4);
  v5 = (char *)sub_100015670 + 4 * byte_100050F74[swift_getEnumCaseMultiPayload(v3, v1)];
  __asm { BR              X10 }
}

uint64_t sub_100015670()
{
  return sub_100015734();
}

uint64_t sub_100015734()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  NSString v3;
  NSString v4;
  NSString v5;
  id v6;
  uint64_t v7;

  v0 = type metadata accessor for CRLSEExtensionContextManager(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, v4, v5);

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  return v7;
}

void sub_100015920(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100015950()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  NSString v4;
  NSString v5;
  id v6;
  uint64_t v7;

  v0 = type metadata accessor for CRLSEExtensionContextManager(0);
  v1 = ((uint64_t (*)(uint64_t))swift_getObjCClassFromMetadata)(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v1);
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, v4, v5);

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  return v7;
}

void sub_100015C10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000191EC(v0, (uint64_t)v3, v4);
  v5 = (char *)&loc_100015C84 + *((int *)qword_100015E18 + swift_getEnumCaseMultiPayload(v3, v1));
  __asm { BR              X9 }
}

uint64_t sub_100015C94()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)&loc_100015CBC + *((int *)qword_100015E28 + *v0)))();
}

id sub_100015CCC()
{
  void *v0;
  NSString v1;
  id v2;

  v0 = (void *)objc_opt_self(UIImage);
  v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100054070);
  v2 = objc_msgSend(v0, "systemImageNamed:", v1);

  return v2;
}

id sub_100015E3C(char a1)
{
  return objc_msgSend((id)objc_opt_self(UIColor), *off_100062DA0[a1]);
}

void sub_100015E7C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  _QWORD v23[6];
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;

  v29 = sub_100011254(&qword_10006CB50);
  v23[2] = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v28 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v34 = v4;
  __chkstk_darwin(v3);
  v32 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100011254(&qword_10006CB58);
  v23[1] = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v25 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254((uint64_t *)&unk_10006D130);
  v8 = __chkstk_darwin(v7);
  v30 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v31 = (char *)v23 - v10;
  v24 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v24);
  v26 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100011254(&qword_10006CB60);
  v23[4] = *(_QWORD *)(v12 - 8);
  v23[5] = v12;
  __chkstk_darwin(v12);
  v13 = sub_100011254(&qword_10006CB68);
  v23[3] = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v14 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v14);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_100011254(&qword_10006CB70);
  v35 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[3];
  v19 = a1[4];
  sub_100017804(a1, v20);
  v21 = sub_100017828();
  v37 = v18;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModel.Item.CodingKeys, &type metadata for CRLSELibraryViewModel.Item.CodingKeys, v21, v20, v19);
  sub_1000191EC(v36, (uint64_t)v16, type metadata accessor for CRLSELibraryViewModel.Item);
  v22 = (char *)sub_100016170 + 4 * byte_100050F78[swift_getEnumCaseMultiPayload(v16, v14)];
  __asm { BR              X10 }
}

uint64_t sub_100016170()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *v1;
  *(_BYTE *)(v3 - 92) = 0;
  v5 = sub_10001799C();
  v7 = *(_QWORD *)(v3 - 112);
  v6 = *(_QWORD *)(v3 - 104);
  ((void (*)(ValueMetadata *, uint64_t, uint64_t, ValueMetadata *, unint64_t))KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:))(&type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys, v3 - 92, v6, &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys, v5);
  *(_BYTE *)(v3 - 93) = v4;
  v8 = sub_100017AF4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3 - 93, v9, v2, &type metadata for CRLSELibraryViewModel.Library, v8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 248) + 8))(v0, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 136) + 8))(v7, v6);
}

uint64_t sub_100016750@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v39[10];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  char *v53;

  v45 = a2;
  v40 = sub_100011254(&qword_10006CAD0);
  v42 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v43 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_100011254(&qword_10006CAD8);
  v46 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v50 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100011254(&qword_10006CAE0);
  v39[8] = *(_QWORD *)(v5 - 8);
  v39[9] = v5;
  __chkstk_darwin(v5);
  v44 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254(&qword_10006CAE8);
  v39[6] = *(_QWORD *)(v7 - 8);
  v39[7] = v7;
  __chkstk_darwin(v7);
  v49 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_100011254(&qword_10006CAF0);
  v47 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v10 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v11 = __chkstk_darwin(v48);
  v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)v39 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)v39 - v18;
  v20 = __chkstk_darwin(v17);
  v22 = (char *)v39 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)v39 - v23;
  v25 = a1[3];
  v26 = a1[4];
  v52 = a1;
  sub_100017804(a1, v25);
  v27 = sub_100017828();
  v28 = v53;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModel.Item.CodingKeys, &type metadata for CRLSELibraryViewModel.Item.CodingKeys, v27, v25, v26);
  if (!v28)
  {
    v39[2] = v22;
    v39[3] = v19;
    v39[4] = v24;
    v39[5] = v13;
    v53 = v16;
    v29 = v48;
    v30 = v51;
    v31 = KeyedDecodingContainer.allKeys.getter(v51);
    v32 = v31;
    if (*(_QWORD *)(v31 + 16) == 1)
    {
      v39[1] = v31;
      __asm { BR              X10 }
    }
    v33 = type metadata accessor for DecodingError(0);
    swift_allocError(v33, &protocol witness table for DecodingError, 0, 0);
    v35 = v34;
    sub_100011254(&qword_10006CB00);
    *v35 = v29;
    v36 = KeyedDecodingContainer.codingPath.getter(v30);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v36, 0xD00000000000002BLL, 0x8000000100053FA0, 0);
    v37 = (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, enum case for DecodingError.typeMismatch(_:), v33);
    swift_willThrow(v37);
    swift_bridgeObjectRelease(v32);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v30);
  }
  return sub_10001786C(v52);
}

uint64_t sub_10001726C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000172A8 + 4 * byte_100050F80[*v0]))(0x6564496472616F62, 0xEF7265696669746ELL);
}

uint64_t sub_1000172A8()
{
  return 0x656C746974;
}

uint64_t sub_1000172BC()
{
  return 0x6465726168537369;
}

uint64_t sub_1000172D4()
{
  return 0x746964457473616CLL;
}

uint64_t sub_1000172F0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001AAA4(a1, a2);
  *a3 = result;
  return result;
}

void sub_100017314(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100017320(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000178D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017348(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000178D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_100017370(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100017384()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000173B4 + 4 * byte_100050F84[*v0]))(0x7972617262696CLL, 0xE700000000000000);
}

uint64_t sub_1000173B4()
{
  return 0x7265646C6F66;
}

uint64_t sub_1000173C8()
{
  return 0x6472616F62;
}

uint64_t sub_1000173DC()
{
  return 0x42676E69646E6570;
}

uint64_t sub_1000173FC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001AC84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100017420(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100017828();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017448(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100017828();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100017470()
{
  return 12383;
}

uint64_t sub_100017480(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100017914();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000174A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100017914();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1000174D0()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100017510(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_10001754C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease(0xE200000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(12383, 0xE200000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_1000175C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001799C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000175F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001799C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100017618()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x656C746974;
  if (*v0 != 1)
    v1 = 0x746964457473616CLL;
  if (*v0)
    return v1;
  else
    return 0x696669746E656469;
}

uint64_t sub_100017674@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001AE44(a1, a2);
  *a3 = result;
  return result;
}

void sub_100017698(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000176A4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001788C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000176CC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001788C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000176F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100016750(a1, a2);
}

void sub_100017708(_QWORD *a1)
{
  sub_100015E7C(a1);
}

Swift::Int sub_10001771C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  sub_100015378();
  return Hasher._finalize()();
}

Swift::Int sub_10001775C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  sub_100015378();
  return Hasher._finalize()();
}

uint64_t sub_100017798()
{
  return sub_1000177C4(&qword_10006CAC8, type metadata accessor for CRLSELibraryViewModel.Item, (uint64_t)&unk_10005128C);
}

uint64_t sub_1000177C4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_100017804(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100017828()
{
  unint64_t result;

  result = qword_10006CAF8;
  if (!qword_10006CAF8)
  {
    result = swift_getWitnessTable(&unk_100051EEC, &type metadata for CRLSELibraryViewModel.Item.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CAF8);
  }
  return result;
}

uint64_t sub_10001786C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_10001788C()
{
  unint64_t result;

  result = qword_10006CB08;
  if (!qword_10006CB08)
  {
    result = swift_getWitnessTable(&unk_100051E9C, &type metadata for CRLSELibraryViewModel.Item.PendingBoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CB08);
  }
  return result;
}

unint64_t sub_1000178D0()
{
  unint64_t result;

  result = qword_10006CB20;
  if (!qword_10006CB20)
  {
    result = swift_getWitnessTable(&unk_100051E4C, &type metadata for CRLSELibraryViewModel.Item.BoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CB20);
  }
  return result;
}

unint64_t sub_100017914()
{
  unint64_t result;

  result = qword_10006CB30;
  if (!qword_10006CB30)
  {
    result = swift_getWitnessTable(&unk_100051DFC, &type metadata for CRLSELibraryViewModel.Item.FolderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CB30);
  }
  return result;
}

unint64_t sub_100017958()
{
  unint64_t result;

  result = qword_10006CB38;
  if (!qword_10006CB38)
  {
    result = swift_getWitnessTable(&unk_100051DD4, &type metadata for CRLSELibraryViewModel.Folder);
    atomic_store(result, (unint64_t *)&qword_10006CB38);
  }
  return result;
}

unint64_t sub_10001799C()
{
  unint64_t result;

  result = qword_10006CB40;
  if (!qword_10006CB40)
  {
    result = swift_getWitnessTable(&unk_100051D84, &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CB40);
  }
  return result;
}

unint64_t sub_1000179E0()
{
  unint64_t result;

  result = qword_10006CB48;
  if (!qword_10006CB48)
  {
    result = swift_getWitnessTable(&unk_100051D5C, &type metadata for CRLSELibraryViewModel.Library);
    atomic_store(result, (unint64_t *)&qword_10006CB48);
  }
  return result;
}

uint64_t sub_100017A24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254((uint64_t *)&unk_10006D130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017A6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100017AB0()
{
  unint64_t result;

  result = qword_10006CB90;
  if (!qword_10006CB90)
  {
    result = swift_getWitnessTable(&unk_100051D34, &type metadata for CRLSELibraryViewModel.Folder);
    atomic_store(result, (unint64_t *)&qword_10006CB90);
  }
  return result;
}

unint64_t sub_100017AF4()
{
  unint64_t result;

  result = qword_10006CB98;
  if (!qword_10006CB98)
  {
    result = swift_getWitnessTable(&unk_100051D0C, &type metadata for CRLSELibraryViewModel.Library);
    atomic_store(result, (unint64_t *)&qword_10006CB98);
  }
  return result;
}

uint64_t sub_100017B38(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  char v32;
  char v33;

  v30 = a2;
  v3 = sub_100011254(&qword_10006CE10);
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  __chkstk_darwin(v3);
  v26 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100011254(&qword_10006CE18);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100011254(&qword_10006CE20);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100011254(&qword_10006CE28);
  v29 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v15 = a1[4];
  sub_100017804(a1, v16);
  v17 = sub_10001BD88();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModel.Library.CodingKeys, &type metadata for CRLSELibraryViewModel.Library.CodingKeys, v17, v16, v15);
  if ((_BYTE)v30)
  {
    if (v30 == 1)
    {
      v32 = 1;
      v18 = sub_10001BE10();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys, &v32, v12, &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys, v18);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
    }
    else
    {
      v33 = 2;
      v20 = sub_10001BDCC();
      v21 = v26;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys, &v33, v12, &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys, v20);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v28);
    }
  }
  else
  {
    v31 = 0;
    v19 = sub_10001BE54();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys, &v31, v12, &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys, v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v12);
}

uint64_t sub_100017D9C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6C61636F6CLL;
  if (*v0 != 1)
    v1 = 0x64756F6C4369;
  if (*v0)
    return v1;
  else
    return 0x6C616963657073;
}

uint64_t sub_100017DF0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001AFA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100017E14(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD88();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017E3C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD88();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100017E64()
{
  return 0;
}

uint64_t sub_100017E70(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BDCC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017E98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BDCC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100017EC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BE10();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017EE8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BE10();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100017F10(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BE54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017F38(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BE54();
  return CodingKey.debugDescription.getter(a1, v2);
}

_QWORD *sub_100017F60@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_10001B0E8(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_100017F88(_QWORD *a1)
{
  unsigned __int8 *v1;

  return sub_100017B38(a1, *v1);
}

void sub_100017FA0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v15[11];
  uint64_t v16;
  uint64_t v17;

  v16 = a2;
  v3 = sub_100011254(&qword_10006CDE0);
  v15[9] = *(_QWORD *)(v3 - 8);
  v15[10] = v3;
  __chkstk_darwin(v3);
  v15[8] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100011254(&qword_10006CDE8);
  v15[6] = *(_QWORD *)(v5 - 8);
  v15[7] = v5;
  __chkstk_darwin(v5);
  v15[5] = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254(&qword_10006CDF0);
  v15[3] = *(_QWORD *)(v7 - 8);
  v15[4] = v7;
  __chkstk_darwin(v7);
  v15[2] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100011254(&qword_10006CDF8);
  v15[0] = *(_QWORD *)(v9 - 8);
  v15[1] = v9;
  __chkstk_darwin(v9);
  v10 = sub_100011254(&qword_10006CE00);
  __chkstk_darwin(v10);
  v11 = sub_100011254(&qword_10006CE08);
  v17 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v13 = a1[3];
  v12 = a1[4];
  sub_100017804(a1, v13);
  v14 = sub_10001BBF0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModel.Folder.CodingKeys, &type metadata for CRLSELibraryViewModel.Folder.CodingKeys, v14, v13, v12);
  __asm { BR              X10 }
}

uint64_t sub_100018198()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_BYTE *)(v5 - 69) = 0;
  v6 = sub_10001BD44();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys, v5 - 69, v1, &type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 88) + 8))(v2, v1);
}

uint64_t sub_100018308(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD44();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018330(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD44();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100018358()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10001838C + 4 * byte_100050F8D[*v0]))(0x6472616F426C6C61, 0xE900000000000073);
}

uint64_t sub_10001838C()
{
  return 0x73746E65636572;
}

uint64_t sub_1000183A4()
{
  return 0x657469726F766166;
}

uint64_t sub_1000183B8()
{
  return 0x646572616873;
}

uint64_t sub_1000183CC()
{
  return 0x796C746E65636572;
}

uint64_t sub_1000183F0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001B4C0(a1, a2);
  *a3 = result;
  return result;
}

void sub_100018414(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100018420(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BBF0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018448(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BBF0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100018470(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BCBC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018498(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BCBC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000184C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BC34();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000184E8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BC34();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100018510(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD00();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018538(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD00();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100018560@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_10001858C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BC78();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000185B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BC78();
  return CodingKey.debugDescription.getter(a1, v2);
}

char *sub_1000185DC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  char *result;

  result = sub_10001B710(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

void sub_100018604(_QWORD *a1)
{
  unsigned __int8 *v1;

  sub_100017FA0(a1, *v1);
}

uint64_t sub_10001861C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  BOOL v18;
  uint64_t v20;

  v4 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v10 = (char *)&v20 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
  {
LABEL_14:
    v16 = 0;
    return v16 & 1;
  }
  if (v11 && a1 != a2)
  {
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v13 = *(_QWORD *)(v8 + 72);
    v14 = v11 - 1;
    while (1)
    {
      sub_1000191EC(a1 + v12, (uint64_t)v10, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC(a2 + v12, (uint64_t)v7, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_100018C64((uint64_t)v10, (uint64_t)v7);
      if ((v15 & 1) == 0)
        break;
      v16 = sub_10001861C(*(_QWORD *)&v10[*(int *)(v4 + 20)], *(_QWORD *)&v7[*(int *)(v4 + 20)]);
      sub_100013BBC((uint64_t)v7, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_100013BBC((uint64_t)v10, type metadata accessor for CRLSELibraryViewModeItemNode);
      v18 = v14-- != 0;
      if ((v16 & 1) != 0)
      {
        v12 += v13;
        if (v18)
          continue;
      }
      return v16 & 1;
    }
    sub_100013BBC((uint64_t)v7, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_100013BBC((uint64_t)v10, type metadata accessor for CRLSELibraryViewModeItemNode);
    goto LABEL_14;
  }
  v16 = 1;
  return v16 & 1;
}

uint64_t sub_100018790(uint64_t a1, uint64_t a2)
{
  return sub_1000188D8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10001879C(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100018810(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10001888C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_1000188CC(uint64_t a1, uint64_t a2)
{
  return sub_1000188D8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000188D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100018914(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100018954(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000189C4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100018A4C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100018A90@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100018AB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000177C4(&qword_10006CE30, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100051B8C);
  v3 = sub_1000177C4(&qword_10006CE38, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100051B2C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100018B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v17;
  uint64_t v19;

  v4 = type metadata accessor for CRLSEBoardIdentifier(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v19 - v8;
  v10 = static UUID.== infix(_:_:)(a1, a2);
  sub_1000191EC(a1, (uint64_t)v9, type metadata accessor for CRLSEBoardIdentifier);
  sub_1000191EC(a2, (uint64_t)v7, type metadata accessor for CRLSEBoardIdentifier);
  if ((v10 & 1) != 0)
  {
    v11 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    v12 = *(_QWORD *)&v9[v11];
    v13 = *(_QWORD *)&v9[v11 + 8];
    v14 = &v7[v11];
    v15 = *((_QWORD *)v14 + 1);
    if (v12 == *(_QWORD *)v14 && v13 == v15)
      v17 = 1;
    else
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, *(_QWORD *)v14, v15, 0);
  }
  else
  {
    v17 = 0;
  }
  sub_100013BBC((uint64_t)v7, type metadata accessor for CRLSEBoardIdentifier);
  sub_100013BBC((uint64_t)v9, type metadata accessor for CRLSEBoardIdentifier);
  return v17 & 1;
}

void sub_100018C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  _QWORD v26[8];

  v4 = type metadata accessor for UUID(0);
  v26[6] = *(_QWORD *)(v4 - 8);
  v26[7] = v4;
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v26[1] = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v26[0] = (char *)v26 - v7;
  v8 = type metadata accessor for CRLSEBoardIdentifier(0);
  v9 = __chkstk_darwin(v8);
  v26[5] = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v26[4] = (char *)v26 - v12;
  v13 = __chkstk_darwin(v11);
  v26[3] = (char *)v26 - v14;
  __chkstk_darwin(v13);
  v26[2] = (char *)v26 - v15;
  v16 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v17 = __chkstk_darwin(v16);
  v18 = __chkstk_darwin(v17);
  v19 = __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  v20 = sub_100011254(&qword_10006CBA0);
  v21 = __chkstk_darwin(v20);
  v23 = (char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (uint64_t)&v23[*(int *)(v21 + 48)];
  sub_1000191EC(a1, (uint64_t)v23, type metadata accessor for CRLSELibraryViewModel.Item);
  sub_1000191EC(a2, v24, type metadata accessor for CRLSELibraryViewModel.Item);
  v25 = (char *)sub_100018E9C + 4 * byte_100050F92[swift_getEnumCaseMultiPayload(v23, v16)];
  __asm { BR              X10 }
}

BOOL sub_100018E9C()
{
  uint64_t v0;
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  BOOL v4;

  sub_1000191EC(v0, (uint64_t)v2, type metadata accessor for CRLSELibraryViewModel.Item);
  if (swift_getEnumCaseMultiPayload(v1, v3))
  {
    sub_100019B80(v0, &qword_10006CBA0);
    return 0;
  }
  else
  {
    v4 = *v2 == *v1;
    sub_100013BBC(v0, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  return v4;
}

uint64_t sub_1000191EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100019230()
{
  unint64_t result;

  result = qword_10006CBB0;
  if (!qword_10006CBB0)
  {
    result = swift_getWitnessTable(&unk_100051CBC, &type metadata for CRLSEBoardIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CBB0);
  }
  return result;
}

unint64_t sub_100019274()
{
  unint64_t result;

  result = qword_10006CBD8;
  if (!qword_10006CBD8)
  {
    result = swift_getWitnessTable(&unk_100051C6C, &type metadata for CRLSEBoardIdentifierStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CBD8);
  }
  return result;
}

unint64_t sub_1000192B8()
{
  unint64_t result;

  result = qword_10006CBF0;
  if (!qword_10006CBF0)
  {
    result = swift_getWitnessTable(&unk_100051C1C, &type metadata for CRLSELibraryViewModeItemNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CBF0);
  }
  return result;
}

uint64_t sub_1000192FC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100019340(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v9 = sub_1000192FC(&qword_10006CBF8);
    sub_1000177C4(a2, type metadata accessor for CRLSELibraryViewModeItemNode, a3);
    result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_1000193C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unsigned int (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  _BOOL8 result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char *v63;
  uint64_t v64;
  char v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v78 = type metadata accessor for UUID(0);
  v76 = *(_QWORD *)(v78 - 8);
  __chkstk_darwin(v78);
  v68 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100011254(&qword_10006CC28);
  __chkstk_darwin(v73);
  v77 = (uint64_t)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100011254((uint64_t *)&unk_10006D7D0);
  v7 = __chkstk_darwin(v6);
  v69 = (uint64_t)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v74 = (uint64_t)&v67 - v10;
  __chkstk_darwin(v9);
  v75 = (uint64_t)&v67 - v11;
  v12 = type metadata accessor for CRLSEBoardIdentifier(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v70 = (uint64_t)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v71 = (uint64_t)&v67 - v17;
  __chkstk_darwin(v16);
  v72 = (uint64_t)&v67 - v18;
  v19 = sub_100011254(&qword_10006CC30);
  __chkstk_darwin(v19);
  v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_100011254(&qword_10006D7C0);
  v23 = __chkstk_darwin(v22);
  v25 = (char *)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v23);
  v28 = (char *)&v67 - v27;
  __chkstk_darwin(v26);
  v30 = (char *)&v67 - v29;
  v79 = a1;
  sub_100019B3C(a1, (uint64_t)&v67 - v29, &qword_10006D7C0);
  v80 = a2;
  sub_100019B3C(a2, (uint64_t)v28, &qword_10006D7C0);
  v31 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_100019B3C((uint64_t)v30, (uint64_t)v21, &qword_10006D7C0);
  sub_100019B3C((uint64_t)v28, v31, &qword_10006D7C0);
  v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v32((uint64_t)v21, 1, v12) == 1)
  {
    sub_100019B80((uint64_t)v28, &qword_10006D7C0);
    sub_100019B80((uint64_t)v30, &qword_10006D7C0);
    if (v32(v31, 1, v12) == 1)
      goto LABEL_3;
LABEL_12:
    v50 = &qword_10006CC30;
    v51 = (uint64_t)v21;
    goto LABEL_21;
  }
  sub_100019B3C((uint64_t)v21, (uint64_t)v25, &qword_10006D7C0);
  if (v32(v31, 1, v12) == 1)
  {
    sub_100019B80((uint64_t)v28, &qword_10006D7C0);
    sub_100019B80((uint64_t)v30, &qword_10006D7C0);
    sub_100013BBC((uint64_t)v25, type metadata accessor for CRLSEBoardIdentifier);
    goto LABEL_12;
  }
  v52 = v72;
  sub_100017A6C(v31, v72, type metadata accessor for CRLSEBoardIdentifier);
  v53 = static UUID.== infix(_:_:)(v25, v52);
  v54 = v71;
  sub_1000191EC((uint64_t)v25, v71, type metadata accessor for CRLSEBoardIdentifier);
  v55 = v70;
  sub_1000191EC(v52, v70, type metadata accessor for CRLSEBoardIdentifier);
  if ((v53 & 1) == 0)
  {
    sub_100013BBC(v55, type metadata accessor for CRLSEBoardIdentifier);
    sub_100013BBC(v54, type metadata accessor for CRLSEBoardIdentifier);
    sub_100013BBC(v52, type metadata accessor for CRLSEBoardIdentifier);
    sub_100019B80((uint64_t)v28, &qword_10006D7C0);
    sub_100019B80((uint64_t)v30, &qword_10006D7C0);
    sub_100013BBC((uint64_t)v25, type metadata accessor for CRLSEBoardIdentifier);
    v51 = (uint64_t)v21;
    v50 = &qword_10006D7C0;
    goto LABEL_21;
  }
  v56 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v57 = *(_QWORD *)(v54 + v56);
  v58 = *(_QWORD *)(v54 + v56 + 8);
  v59 = (_QWORD *)(v55 + v56);
  v60 = v59[1];
  if (v57 != *v59 || v58 != v60)
  {
    v62 = _stringCompareWithSmolCheck(_:_:expecting:)(v57, v58, *v59, v60, 0);
    sub_100013BBC(v55, type metadata accessor for CRLSEBoardIdentifier);
    sub_100013BBC(v54, type metadata accessor for CRLSEBoardIdentifier);
    sub_100013BBC(v52, type metadata accessor for CRLSEBoardIdentifier);
    sub_100019B80((uint64_t)v28, &qword_10006D7C0);
    sub_100019B80((uint64_t)v30, &qword_10006D7C0);
    sub_100013BBC((uint64_t)v25, type metadata accessor for CRLSEBoardIdentifier);
    sub_100019B80((uint64_t)v21, &qword_10006D7C0);
    result = 0;
    v33 = v79;
    v34 = v80;
    if ((v62 & 1) == 0)
      return result;
    goto LABEL_4;
  }
  sub_100013BBC(v55, type metadata accessor for CRLSEBoardIdentifier);
  sub_100013BBC(v54, type metadata accessor for CRLSEBoardIdentifier);
  sub_100013BBC(v52, type metadata accessor for CRLSEBoardIdentifier);
  sub_100019B80((uint64_t)v28, &qword_10006D7C0);
  sub_100019B80((uint64_t)v30, &qword_10006D7C0);
  sub_100013BBC((uint64_t)v25, type metadata accessor for CRLSEBoardIdentifier);
LABEL_3:
  sub_100019B80((uint64_t)v21, &qword_10006D7C0);
  v33 = v79;
  v34 = v80;
LABEL_4:
  v35 = type metadata accessor for CRLSEBoard(0);
  v36 = *(int *)(v35 + 20);
  v37 = *(_QWORD *)(v33 + v36);
  v38 = *(_QWORD *)(v33 + v36 + 8);
  v39 = (_QWORD *)(v34 + v36);
  v40 = v39[1];
  if (v37 == *v39 && v38 == v40
    || (v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v38, *v39, v40, 0), result = 0, (v41 & 1) != 0))
  {
    v43 = v75;
    sub_100019B3C(v33 + *(int *)(v35 + 24), v75, (uint64_t *)&unk_10006D7D0);
    v44 = v74;
    sub_100019B3C(v34 + *(int *)(v35 + 24), v74, (uint64_t *)&unk_10006D7D0);
    v45 = v77;
    v46 = v77 + *(int *)(v73 + 48);
    sub_100019B3C(v43, v77, (uint64_t *)&unk_10006D7D0);
    sub_100019B3C(v44, v46, (uint64_t *)&unk_10006D7D0);
    v47 = v76;
    v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48);
    v49 = v78;
    if (v48(v45, 1, v78) == 1)
    {
      sub_100019B80(v44, (uint64_t *)&unk_10006D7D0);
      sub_100019B80(v43, (uint64_t *)&unk_10006D7D0);
      if (v48(v46, 1, v49) == 1)
      {
        sub_100019B80(v45, (uint64_t *)&unk_10006D7D0);
        return 1;
      }
    }
    else
    {
      v61 = v69;
      sub_100019B3C(v45, v69, (uint64_t *)&unk_10006D7D0);
      if (v48(v46, 1, v49) != 1)
      {
        v63 = v68;
        (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v68, v46, v49);
        v64 = sub_1000177C4(&qword_10006CC38, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
        v65 = dispatch thunk of static Equatable.== infix(_:_:)(v61, v63, v49, v64);
        v66 = *(void (**)(char *, uint64_t))(v47 + 8);
        v66(v63, v49);
        sub_100019B80(v44, (uint64_t *)&unk_10006D7D0);
        sub_100019B80(v43, (uint64_t *)&unk_10006D7D0);
        v66((char *)v61, v49);
        sub_100019B80(v45, (uint64_t *)&unk_10006D7D0);
        return (v65 & 1) != 0;
      }
      sub_100019B80(v44, (uint64_t *)&unk_10006D7D0);
      sub_100019B80(v43, (uint64_t *)&unk_10006D7D0);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v61, v49);
    }
    v50 = &qword_10006CC28;
    v51 = v45;
LABEL_21:
    sub_100019B80(v51, v50);
    return 0;
  }
  return result;
}

uint64_t sub_100019B3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100011254(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100019B80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100011254(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100019BBC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100019BEC(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100019BF8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100019C18(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_10001C1E4(a1, &qword_10006CC40, (uint64_t)&unk_1000624F0);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_10001C1E4(a1, &qword_10006CC48, (uint64_t)&unk_100062518);
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_10001C1E4(a1, &qword_10006CC50, (uint64_t)&unk_100062540);
}

_BYTE *initializeBufferWithCopyOfBuffer for CRLSELibraryViewModel.Library(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModeItemNode.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModeItemNode.CodingKeys;
}

uint64_t _s24FreeformSharingExtension28CRLSELibraryViewModeItemNodeV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s24FreeformSharingExtension28CRLSELibraryViewModeItemNodeV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_100019D80 + 4 * byte_100050F9B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100019DB4 + 4 * byte_100050F96[v4]))();
}

uint64_t sub_100019DB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019DBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100019DC4);
  return result;
}

uint64_t sub_100019DD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100019DD8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100019DDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019DE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019DF0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100019DF8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEBoardIdentifierStorage.CodingKeys()
{
  return &type metadata for CRLSEBoardIdentifierStorage.CodingKeys;
}

uint64_t sub_100019E20()
{
  return 0;
}

ValueMetadata *type metadata accessor for CRLSEBoardIdentifier.CodingKeys()
{
  return &type metadata for CRLSEBoardIdentifier.CodingKeys;
}

_BYTE *sub_100019E40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.LibraryCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLSEiOSMainViewController.CollectionViewSection(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s24FreeformSharingExtension20CRLSEBoardIdentifierV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100019EF8 + 4 * byte_100050FA0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100019F18 + 4 * byte_100050FA5[v4]))();
}

_BYTE *sub_100019EF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100019F18(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100019F20(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100019F28(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100019F30(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100019F38(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.FolderCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.FolderCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLSEImportManifest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s24FreeformSharingExtension21CRLSELibraryViewModelV4ItemO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_10001A030 + 4 * byte_100050FAF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10001A064 + 4 * byte_100050FAA[v4]))();
}

uint64_t sub_10001A064(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A06C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001A074);
  return result;
}

uint64_t sub_10001A080(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001A088);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10001A08C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A094(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.BoardCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.BoardCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.PendingBoardCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.PendingBoardCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder()
{
  return &type metadata for CRLSELibraryViewModel.Folder;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library()
{
  return &type metadata for CRLSELibraryViewModel.Library;
}

unint64_t sub_10001A0F4()
{
  unint64_t result;

  result = qword_10006CC58;
  if (!qword_10006CC58)
  {
    result = swift_getWitnessTable(&unk_100051468, &type metadata for CRLSELibraryViewModel.Library);
    atomic_store(result, (unint64_t *)&qword_10006CC58);
  }
  return result;
}

unint64_t sub_10001A13C()
{
  unint64_t result;

  result = qword_10006CC60;
  if (!qword_10006CC60)
  {
    result = swift_getWitnessTable(&unk_1000514D0, &type metadata for CRLSELibraryViewModel.Folder);
    atomic_store(result, (unint64_t *)&qword_10006CC60);
  }
  return result;
}

unint64_t sub_10001A184()
{
  unint64_t result;

  result = qword_10006CC68;
  if (!qword_10006CC68)
  {
    result = swift_getWitnessTable(&unk_100051588, &type metadata for CRLSELibraryViewModel.Item.PendingBoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC68);
  }
  return result;
}

unint64_t sub_10001A1CC()
{
  unint64_t result;

  result = qword_10006CC70;
  if (!qword_10006CC70)
  {
    result = swift_getWitnessTable(&unk_100051640, &type metadata for CRLSELibraryViewModel.Item.BoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC70);
  }
  return result;
}

unint64_t sub_10001A214()
{
  unint64_t result;

  result = qword_10006CC78;
  if (!qword_10006CC78)
  {
    result = swift_getWitnessTable(&unk_1000516F8, &type metadata for CRLSELibraryViewModel.Item.FolderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC78);
  }
  return result;
}

unint64_t sub_10001A25C()
{
  unint64_t result;

  result = qword_10006CC80;
  if (!qword_10006CC80)
  {
    result = swift_getWitnessTable(&unk_1000517B0, &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC80);
  }
  return result;
}

unint64_t sub_10001A2A4()
{
  unint64_t result;

  result = qword_10006CC88;
  if (!qword_10006CC88)
  {
    result = swift_getWitnessTable(&unk_100051868, &type metadata for CRLSELibraryViewModel.Item.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC88);
  }
  return result;
}

unint64_t sub_10001A2EC()
{
  unint64_t result;

  result = qword_10006CC90;
  if (!qword_10006CC90)
  {
    result = swift_getWitnessTable(&unk_100051920, &type metadata for CRLSEBoardIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC90);
  }
  return result;
}

unint64_t sub_10001A334()
{
  unint64_t result;

  result = qword_10006CC98;
  if (!qword_10006CC98)
  {
    result = swift_getWitnessTable(&unk_1000519D8, &type metadata for CRLSEBoardIdentifierStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CC98);
  }
  return result;
}

unint64_t sub_10001A37C()
{
  unint64_t result;

  result = qword_10006CCA0;
  if (!qword_10006CCA0)
  {
    result = swift_getWitnessTable(&unk_100051A90, &type metadata for CRLSELibraryViewModeItemNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCA0);
  }
  return result;
}

uint64_t sub_10001A3C0()
{
  return sub_1000177C4(&qword_10006CCA8, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100051AF0);
}

uint64_t sub_10001A3EC()
{
  return sub_1000177C4(&qword_10006CCB0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100051AC4);
}

uint64_t sub_10001A418()
{
  return sub_1000177C4(&qword_10006CCB8, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100051B60);
}

unint64_t sub_10001A448()
{
  unint64_t result;

  result = qword_10006CCC0;
  if (!qword_10006CCC0)
  {
    result = swift_getWitnessTable(&unk_100051A00, &type metadata for CRLSELibraryViewModeItemNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCC0);
  }
  return result;
}

unint64_t sub_10001A490()
{
  unint64_t result;

  result = qword_10006CCC8;
  if (!qword_10006CCC8)
  {
    result = swift_getWitnessTable(&unk_100051A28, &type metadata for CRLSELibraryViewModeItemNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCC8);
  }
  return result;
}

unint64_t sub_10001A4D8()
{
  unint64_t result;

  result = qword_10006CCD0;
  if (!qword_10006CCD0)
  {
    result = swift_getWitnessTable(&unk_100051948, &type metadata for CRLSEBoardIdentifierStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCD0);
  }
  return result;
}

unint64_t sub_10001A520()
{
  unint64_t result;

  result = qword_10006CCD8;
  if (!qword_10006CCD8)
  {
    result = swift_getWitnessTable(&unk_100051970, &type metadata for CRLSEBoardIdentifierStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCD8);
  }
  return result;
}

unint64_t sub_10001A568()
{
  unint64_t result;

  result = qword_10006CCE0;
  if (!qword_10006CCE0)
  {
    result = swift_getWitnessTable(&unk_100051890, &type metadata for CRLSEBoardIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCE0);
  }
  return result;
}

unint64_t sub_10001A5B0()
{
  unint64_t result;

  result = qword_10006CCE8;
  if (!qword_10006CCE8)
  {
    result = swift_getWitnessTable(&unk_1000518B8, &type metadata for CRLSEBoardIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCE8);
  }
  return result;
}

unint64_t sub_10001A5F8()
{
  unint64_t result;

  result = qword_10006CCF0;
  if (!qword_10006CCF0)
  {
    result = swift_getWitnessTable(&unk_100051720, &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCF0);
  }
  return result;
}

unint64_t sub_10001A640()
{
  unint64_t result;

  result = qword_10006CCF8;
  if (!qword_10006CCF8)
  {
    result = swift_getWitnessTable(&unk_100051748, &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CCF8);
  }
  return result;
}

unint64_t sub_10001A688()
{
  unint64_t result;

  result = qword_10006CD00;
  if (!qword_10006CD00)
  {
    result = swift_getWitnessTable(&unk_100051668, &type metadata for CRLSELibraryViewModel.Item.FolderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD00);
  }
  return result;
}

unint64_t sub_10001A6D0()
{
  unint64_t result;

  result = qword_10006CD08;
  if (!qword_10006CD08)
  {
    result = swift_getWitnessTable(&unk_100051690, &type metadata for CRLSELibraryViewModel.Item.FolderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD08);
  }
  return result;
}

unint64_t sub_10001A718()
{
  unint64_t result;

  result = qword_10006CD10;
  if (!qword_10006CD10)
  {
    result = swift_getWitnessTable(&unk_1000515B0, &type metadata for CRLSELibraryViewModel.Item.BoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD10);
  }
  return result;
}

unint64_t sub_10001A760()
{
  unint64_t result;

  result = qword_10006CD18;
  if (!qword_10006CD18)
  {
    result = swift_getWitnessTable(&unk_1000515D8, &type metadata for CRLSELibraryViewModel.Item.BoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD18);
  }
  return result;
}

unint64_t sub_10001A7A8()
{
  unint64_t result;

  result = qword_10006CD20;
  if (!qword_10006CD20)
  {
    result = swift_getWitnessTable(&unk_1000514F8, &type metadata for CRLSELibraryViewModel.Item.PendingBoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD20);
  }
  return result;
}

unint64_t sub_10001A7F0()
{
  unint64_t result;

  result = qword_10006CD28;
  if (!qword_10006CD28)
  {
    result = swift_getWitnessTable(&unk_100051520, &type metadata for CRLSELibraryViewModel.Item.PendingBoardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD28);
  }
  return result;
}

unint64_t sub_10001A838()
{
  unint64_t result;

  result = qword_10006CD30;
  if (!qword_10006CD30)
  {
    result = swift_getWitnessTable(&unk_1000517D8, &type metadata for CRLSELibraryViewModel.Item.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD30);
  }
  return result;
}

unint64_t sub_10001A880()
{
  unint64_t result;

  result = qword_10006CD38;
  if (!qword_10006CD38)
  {
    result = swift_getWitnessTable(&unk_100051800, &type metadata for CRLSELibraryViewModel.Item.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD38);
  }
  return result;
}

uint64_t sub_10001A8C4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 1835365481 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1835365481, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6E6572646C696863 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease(0xE800000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6572646C696863, 0xE800000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_10001A9A4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x4955556472616F62 && a2 == 0xE900000000000044)
  {
    v5 = 0xE900000000000044;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4955556472616F62, 0xE900000000000044, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6D614E72656E776FLL && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease(0xE900000000000065);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6D614E72656E776FLL, 0xE900000000000065, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_10001AAA4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x6564496472616F62 && a2 == 0xEF7265696669746ELL)
  {
    v5 = 0xEF7265696669746ELL;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6564496472616F62, 0xEF7265696669746ELL, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    v7 = 0xE500000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6465726168537369 && a2 == 0xE800000000000000)
  {
    v8 = 0xE800000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6465726168537369, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x746964457473616CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease(0xEA00000000006465);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746964457473616CLL, 0xEA00000000006465, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_10001AC84(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x7972617262696CLL && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7972617262696CLL, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x7265646C6F66 && a2 == 0xE600000000000000)
  {
    v7 = 0xE600000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7265646C6F66, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6472616F62 && a2 == 0xE500000000000000)
  {
    v8 = 0xE500000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6472616F62, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x42676E69646E6570 && a2 == 0xEC0000006472616FLL)
  {
    swift_bridgeObjectRelease(0xEC0000006472616FLL);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x42676E69646E6570, 0xEC0000006472616FLL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_10001AE44(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v6;
  char v7;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    v4 = 0xEA00000000007265;
LABEL_6:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x696669746E656469, 0xEA00000000007265, a1, a2, 0) & 1) != 0)
  {
    v4 = a2;
    goto LABEL_6;
  }
  if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    v6 = 0xE500000000000000;
LABEL_12:
    swift_bridgeObjectRelease(v6);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v6 = a2;
    goto LABEL_12;
  }
  if (a1 == 0x746964457473616CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease(0xEA00000000006465);
    return 2;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746964457473616CLL, 0xEA00000000006465, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_10001AFA4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x6C616963657073 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C616963657073, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000)
  {
    v7 = 0xE500000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C61636F6CLL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x64756F6C4369 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease(0xE600000000000000);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64756F6C4369, 0xE600000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_10001B0E8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  _QWORD *v40;
  char v41;
  char v42;
  char v43;

  v37 = sub_100011254(&qword_10006CDA0);
  v35 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v39 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_100011254(&qword_10006CDA8);
  v33 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin(v36);
  v38 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100011254(&qword_10006CDB0);
  v4 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254(&qword_10006CDB8);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = a1[3];
  v12 = a1[4];
  sub_100017804(a1, v11);
  v13 = sub_10001BD88();
  v14 = v40;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModel.Library.CodingKeys, &type metadata for CRLSELibraryViewModel.Library.CodingKeys, v13, v11, v12);
  if (v14)
    goto LABEL_7;
  v31 = v4;
  v32 = v8;
  v15 = v39;
  v40 = a1;
  v16 = v10;
  v17 = KeyedDecodingContainer.allKeys.getter(v7);
  v18 = v17;
  v19 = v7;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = v17;
    v24 = type metadata accessor for DecodingError(0);
    swift_allocError(v24, &protocol witness table for DecodingError, 0, 0);
    v10 = v25;
    sub_100011254(&qword_10006CB00);
    *v10 = &type metadata for CRLSELibraryViewModel.Library;
    v26 = KeyedDecodingContainer.codingPath.getter(v19);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v26, 0xD00000000000002BLL, 0x8000000100053FA0, 0);
    v27 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v10, enum case for DecodingError.typeMismatch(_:), v24);
    swift_willThrow(v27);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(_QWORD *, uint64_t))(v32 + 8))(v16, v19);
    a1 = v40;
LABEL_7:
    sub_10001786C(a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v42 = 1;
      v20 = sub_10001BE10();
      v21 = v38;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys, &v42, v7, &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys, v20);
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v36);
    }
    else
    {
      v43 = 2;
      v30 = sub_10001BDCC();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys, &v43, v7, &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys, v30);
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v37);
    }
    swift_bridgeObjectRelease(v18);
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v16, v19);
  }
  else
  {
    v41 = 0;
    v29 = sub_10001BE54();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys, &v41, v7, &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys, v29);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v34);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(_QWORD *, uint64_t))(v32 + 8))(v16, v7);
  }
  sub_10001786C(v40);
  return v10;
}

uint64_t sub_10001B4C0(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;

  if (a1 == 0x6472616F426C6C61 && a2 == 0xE900000000000073)
  {
    v5 = 0xE900000000000073;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6472616F426C6C61, 0xE900000000000073, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x73746E65636572 && a2 == 0xE700000000000000)
  {
    v7 = 0xE700000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73746E65636572, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x657469726F766166 && a2 == 0xE900000000000073)
  {
    v8 = 0xE900000000000073;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x657469726F766166, 0xE900000000000073, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x646572616873 && a2 == 0xE600000000000000)
  {
    v9 = 0xE600000000000000;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x646572616873, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x796C746E65636572 && a2 == 0xEF646574656C6544)
  {
    swift_bridgeObjectRelease(0xEF646574656C6544);
    return 4;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x796C746E65636572, 0xEF646574656C6544, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

char *sub_10001B710(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[11];
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;

  v2 = sub_100011254(&qword_10006CD40);
  v31[9] = *(_QWORD *)(v2 - 8);
  v31[10] = v2;
  __chkstk_darwin(v2);
  v36 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_100011254(&qword_10006CD48);
  v31[6] = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v35 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100011254(&qword_10006CD50);
  v31[7] = *(_QWORD *)(v5 - 8);
  v31[8] = v5;
  __chkstk_darwin(v5);
  v34 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254(&qword_10006CD58);
  v31[4] = *(_QWORD *)(v7 - 8);
  v31[5] = v7;
  __chkstk_darwin(v7);
  v33 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100011254(&qword_10006CD60);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100011254(&qword_10006CD68);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v17 = a1[4];
  v37 = a1;
  sub_100017804(a1, v18);
  v19 = sub_10001BBF0();
  v20 = v38;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSELibraryViewModel.Folder.CodingKeys, &type metadata for CRLSELibraryViewModel.Folder.CodingKeys, v19, v18, v17);
  if (!v20)
  {
    v31[2] = v9;
    v31[3] = v12;
    v31[1] = v10;
    v38 = 0;
    v21 = v14;
    v22 = KeyedDecodingContainer.allKeys.getter(v13);
    v23 = v22;
    v24 = v13;
    if (*(_QWORD *)(v22 + 16) == 1)
      __asm { BR              X9 }
    v25 = type metadata accessor for DecodingError(0);
    swift_allocError(v25, &protocol witness table for DecodingError, 0, 0);
    v27 = v26;
    sub_100011254(&qword_10006CB00);
    *v27 = &type metadata for CRLSELibraryViewModel.Folder;
    v28 = KeyedDecodingContainer.codingPath.getter(v24);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v28, 0xD00000000000002BLL, 0x8000000100053FA0, 0);
    v29 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, enum case for DecodingError.typeMismatch(_:), v25);
    swift_willThrow(v29);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v24);
  }
  sub_10001786C(v37);
  return v16;
}

void sub_10001BA84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v4 - 68) = 1;
  v5 = sub_10001BD00();
  v6 = *(_QWORD *)(v4 - 88);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys, v4 - 68, v3, &type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys, v5);
  if (v6)
  {
    swift_bridgeObjectRelease(v2);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v3);
    JUMPOUT(0x10001BA58);
  }
  JUMPOUT(0x10001BBC4);
}

void sub_10001BAC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v4 - 67) = 2;
  v5 = sub_10001BCBC();
  v6 = *(_QWORD *)(v4 - 88);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys, v4 - 67, v3, &type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys, v5);
  if (!v6)
    JUMPOUT(0x10001BB04);
  swift_bridgeObjectRelease(v2);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v3);
  JUMPOUT(0x10001BA58);
}

void sub_10001BB10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v5 - 66) = 3;
  v6 = sub_10001BC78();
  v7 = *(_QWORD *)(v5 - 88);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys, v5 - 66, v4, &type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys, v6);
  if (!v7)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 176) + 8))(v3, *(_QWORD *)(v5 - 136));
    swift_bridgeObjectRelease(v2);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v4);
    sub_10001786C(*(_QWORD **)(v5 - 96));
    JUMPOUT(0x10001BA5CLL);
  }
  swift_bridgeObjectRelease(v2);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v4);
  JUMPOUT(0x10001BA58);
}

void sub_10001BB5C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v1 - 65) = 4;
  v2 = sub_10001BC34();
  v3 = *(_QWORD *)(v1 - 88);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys, v1 - 65, v0, &type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys, v2);
  if (v3)
    JUMPOUT(0x10001BB94);
  JUMPOUT(0x10001BBC4);
}

unint64_t sub_10001BBF0()
{
  unint64_t result;

  result = qword_10006CD70;
  if (!qword_10006CD70)
  {
    result = swift_getWitnessTable(&unk_1000526F4, &type metadata for CRLSELibraryViewModel.Folder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD70);
  }
  return result;
}

unint64_t sub_10001BC34()
{
  unint64_t result;

  result = qword_10006CD78;
  if (!qword_10006CD78)
  {
    result = swift_getWitnessTable(&unk_1000526A4, &type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD78);
  }
  return result;
}

unint64_t sub_10001BC78()
{
  unint64_t result;

  result = qword_10006CD80;
  if (!qword_10006CD80)
  {
    result = swift_getWitnessTable(&unk_100052654, &type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD80);
  }
  return result;
}

unint64_t sub_10001BCBC()
{
  unint64_t result;

  result = qword_10006CD88;
  if (!qword_10006CD88)
  {
    result = swift_getWitnessTable(&unk_100052604, &type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD88);
  }
  return result;
}

unint64_t sub_10001BD00()
{
  unint64_t result;

  result = qword_10006CD90;
  if (!qword_10006CD90)
  {
    result = swift_getWitnessTable(&unk_1000525B4, &type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD90);
  }
  return result;
}

unint64_t sub_10001BD44()
{
  unint64_t result;

  result = qword_10006CD98;
  if (!qword_10006CD98)
  {
    result = swift_getWitnessTable(&unk_100052564, &type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CD98);
  }
  return result;
}

unint64_t sub_10001BD88()
{
  unint64_t result;

  result = qword_10006CDC0;
  if (!qword_10006CDC0)
  {
    result = swift_getWitnessTable(&unk_100052514, &type metadata for CRLSELibraryViewModel.Library.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CDC0);
  }
  return result;
}

unint64_t sub_10001BDCC()
{
  unint64_t result;

  result = qword_10006CDC8;
  if (!qword_10006CDC8)
  {
    result = swift_getWitnessTable(&unk_1000524C4, &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CDC8);
  }
  return result;
}

unint64_t sub_10001BE10()
{
  unint64_t result;

  result = qword_10006CDD0;
  if (!qword_10006CDD0)
  {
    result = swift_getWitnessTable(&unk_100052474, &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CDD0);
  }
  return result;
}

unint64_t sub_10001BE54()
{
  unint64_t result;

  result = qword_10006CDD8;
  if (!qword_10006CDD8)
  {
    result = swift_getWitnessTable(&unk_100052424, &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CDD8);
  }
  return result;
}

uint64_t _s24FreeformSharingExtension21CRLSELibraryViewModelV7LibraryOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s24FreeformSharingExtension21CRLSELibraryViewModelV7LibraryOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_10001BF74 + 4 * byte_100050FBE[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10001BFA8 + 4 * byte_100050FB9[v4]))();
}

uint64_t sub_10001BFA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001BFB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001BFB8);
  return result;
}

uint64_t sub_10001BFC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001BFCCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001BFD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001BFD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.SpecialCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.LocalCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.ICloudCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLSEManifestItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s24FreeformSharingExtension21CRLSELibraryViewModelV6FolderOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_10001C100 + 4 * byte_100050FC8[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10001C134 + 4 * byte_100050FC3[v4]))();
}

uint64_t sub_10001C134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001C13C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001C144);
  return result;
}

uint64_t sub_10001C150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001C158);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10001C15C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001C164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.RecentsCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.FavoritesCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.SharedCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_10001C1E4(a1, &qword_10006CE40, (uint64_t)&unk_100062D88);
}

void sub_10001C1E4(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

unint64_t sub_10001C22C()
{
  unint64_t result;

  result = qword_10006CE48;
  if (!qword_10006CE48)
  {
    result = swift_getWitnessTable(&unk_100052254, &type metadata for CRLSELibraryViewModel.Folder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE48);
  }
  return result;
}

unint64_t sub_10001C274()
{
  unint64_t result;

  result = qword_10006CE50;
  if (!qword_10006CE50)
  {
    result = swift_getWitnessTable(&unk_1000523FC, &type metadata for CRLSELibraryViewModel.Library.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE50);
  }
  return result;
}

unint64_t sub_10001C2BC()
{
  unint64_t result;

  result = qword_10006CE58;
  if (!qword_10006CE58)
  {
    result = swift_getWitnessTable(&unk_10005231C, &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE58);
  }
  return result;
}

unint64_t sub_10001C304()
{
  unint64_t result;

  result = qword_10006CE60;
  if (!qword_10006CE60)
  {
    result = swift_getWitnessTable(&unk_100052344, &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE60);
  }
  return result;
}

unint64_t sub_10001C34C()
{
  unint64_t result;

  result = qword_10006CE68;
  if (!qword_10006CE68)
  {
    result = swift_getWitnessTable(&unk_1000522CC, &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE68);
  }
  return result;
}

unint64_t sub_10001C394()
{
  unint64_t result;

  result = qword_10006CE70;
  if (!qword_10006CE70)
  {
    result = swift_getWitnessTable(&unk_1000522F4, &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE70);
  }
  return result;
}

unint64_t sub_10001C3DC()
{
  unint64_t result;

  result = qword_10006CE78;
  if (!qword_10006CE78)
  {
    result = swift_getWitnessTable(&unk_10005227C, &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE78);
  }
  return result;
}

unint64_t sub_10001C424()
{
  unint64_t result;

  result = qword_10006CE80;
  if (!qword_10006CE80)
  {
    result = swift_getWitnessTable(&unk_1000522A4, &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE80);
  }
  return result;
}

unint64_t sub_10001C46C()
{
  unint64_t result;

  result = qword_10006CE88;
  if (!qword_10006CE88)
  {
    result = swift_getWitnessTable(&unk_10005236C, &type metadata for CRLSELibraryViewModel.Library.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE88);
  }
  return result;
}

unint64_t sub_10001C4B4()
{
  unint64_t result;

  result = qword_10006CE90;
  if (!qword_10006CE90)
  {
    result = swift_getWitnessTable(&unk_100052394, &type metadata for CRLSELibraryViewModel.Library.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE90);
  }
  return result;
}

unint64_t sub_10001C4FC()
{
  unint64_t result;

  result = qword_10006CE98;
  if (!qword_10006CE98)
  {
    result = swift_getWitnessTable(&unk_100052174, &type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CE98);
  }
  return result;
}

unint64_t sub_10001C544()
{
  unint64_t result;

  result = qword_10006CEA0;
  if (!qword_10006CEA0)
  {
    result = swift_getWitnessTable(&unk_10005219C, &type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEA0);
  }
  return result;
}

unint64_t sub_10001C58C()
{
  unint64_t result;

  result = qword_10006CEA8;
  if (!qword_10006CEA8)
  {
    result = swift_getWitnessTable(&unk_100052124, &type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEA8);
  }
  return result;
}

unint64_t sub_10001C5D4()
{
  unint64_t result;

  result = qword_10006CEB0;
  if (!qword_10006CEB0)
  {
    result = swift_getWitnessTable(&unk_10005214C, &type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEB0);
  }
  return result;
}

unint64_t sub_10001C61C()
{
  unint64_t result;

  result = qword_10006CEB8;
  if (!qword_10006CEB8)
  {
    result = swift_getWitnessTable(&unk_1000520D4, &type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEB8);
  }
  return result;
}

unint64_t sub_10001C664()
{
  unint64_t result;

  result = qword_10006CEC0;
  if (!qword_10006CEC0)
  {
    result = swift_getWitnessTable(&unk_1000520FC, &type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEC0);
  }
  return result;
}

unint64_t sub_10001C6AC()
{
  unint64_t result;

  result = qword_10006CEC8;
  if (!qword_10006CEC8)
  {
    result = swift_getWitnessTable(&unk_100052084, &type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEC8);
  }
  return result;
}

unint64_t sub_10001C6F4()
{
  unint64_t result;

  result = qword_10006CED0;
  if (!qword_10006CED0)
  {
    result = swift_getWitnessTable(&unk_1000520AC, &type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CED0);
  }
  return result;
}

unint64_t sub_10001C73C()
{
  unint64_t result;

  result = qword_10006CED8;
  if (!qword_10006CED8)
  {
    result = swift_getWitnessTable(&unk_100052034, &type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CED8);
  }
  return result;
}

unint64_t sub_10001C784()
{
  unint64_t result;

  result = qword_10006CEE0;
  if (!qword_10006CEE0)
  {
    result = swift_getWitnessTable(&unk_10005205C, &type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEE0);
  }
  return result;
}

unint64_t sub_10001C7CC()
{
  unint64_t result;

  result = qword_10006CEE8;
  if (!qword_10006CEE8)
  {
    result = swift_getWitnessTable(&unk_1000521C4, &type metadata for CRLSELibraryViewModel.Folder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEE8);
  }
  return result;
}

unint64_t sub_10001C814()
{
  unint64_t result;

  result = qword_10006CEF0;
  if (!qword_10006CEF0)
  {
    result = swift_getWitnessTable(&unk_1000521EC, &type metadata for CRLSELibraryViewModel.Folder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006CEF0);
  }
  return result;
}

uint64_t Error.publicDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t DynamicType;
  uint64_t MetatypeMetadata;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  void *object;
  uint64_t v55;
  char *v56;
  char v57;
  uint64_t (*v58)(char *, uint64_t);
  uint64_t v59;
  _QWORD *v60;
  void *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  Swift::String v65;
  Swift::String v66;
  Swift::String v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  Swift::String v71;
  Swift::String v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  __int128 v88;
  _QWORD v89[5];

  v3 = v2;
  v83 = a2;
  v5 = sub_100011254(&qword_10006CEF8);
  __chkstk_darwin(v5);
  v85 = (uint64_t)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Mirror.DisplayStyle(0);
  v81 = *(_QWORD *)(v7 - 8);
  v82 = v7;
  v8 = __chkstk_darwin(v7);
  v80 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v79 = (char *)&v73 - v10;
  v11 = type metadata accessor for Mirror(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v84 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a1 - 8);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v73 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v73 - v22;
  v86 = v3;
  DynamicType = swift_getDynamicType(v3, a1, 0);
  *(_QWORD *)&v88 = DynamicType;
  MetatypeMetadata = swift_getMetatypeMetadata(a1);
  v26 = String.init<A>(reflecting:)(&v88, MetatypeMetadata);
  v28 = v27;
  v29 = sub_10001CE44();
  if (!swift_dynamicCastMetatype(DynamicType, v29))
  {
    v33 = v79;
    v34 = v80;
    v75 = v18;
    v76 = v21;
    v77 = v26;
    v78 = v12;
    v83 = v11;
    v89[1] = a1;
    v35 = (char *)sub_10001CE80(&v88);
    v36 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v36(v35, v86, a1);
    v37 = v84;
    v38 = Mirror.init(reflecting:)(&v88);
    v39 = v85;
    Mirror.displayStyle.getter(v38);
    v40 = v81;
    v41 = v39;
    v42 = v82;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v41, 1, v82) == 1)
    {
      (*(void (**)(char *, uint64_t))(v78 + 8))(v37, v83);
      sub_100019B80(v85, &qword_10006CEF8);
      return v77;
    }
    v55 = a1;
    v74 = v15;
    v56 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(v33, v85, v42);
    (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v34, enum case for Mirror.DisplayStyle.enum(_:), v42);
    v57 = static Mirror.DisplayStyle.== infix(_:_:)(v33, v34);
    v58 = *(uint64_t (**)(char *, uint64_t))(v40 + 8);
    v59 = v58(v34, v42);
    if ((v57 & 1) == 0)
    {
      *(_QWORD *)&v88 = 0;
      *((_QWORD *)&v88 + 1) = 0xE000000000000000;
      v65._countAndFlagsBits = v77;
      v65._object = v28;
      String.append(_:)(v65);
      swift_bridgeObjectRelease(v28);
      v66._countAndFlagsBits = 40;
      v66._object = (void *)0xE100000000000000;
      String.append(_:)(v66);
      _print_unlocked<A, B>(_:_:)(v33, &v88, v42, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      v67._countAndFlagsBits = 41;
      v67._object = (void *)0xE100000000000000;
      String.append(_:)(v67);
      v43 = v88;
      v58(v56, v42);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v84, v83);
      return v43;
    }
    v60 = (_QWORD *)Mirror.children.getter(v59);
    sub_10001CEBC(v60, &v88);
    swift_release(v60);
    if (v89[3])
    {
      v61 = (void *)*((_QWORD *)&v88 + 1);
      v62 = v88;
      sub_10001786C(v89);
      v63 = v76;
      v36(v76, v86, v55);
      v64 = v75;
      if (v61)
      {
LABEL_16:
        (*(void (**)(char *, uint64_t))(v74 + 8))(v63, v55);
        v69 = v83;
        v70 = v78;
        *(_QWORD *)&v88 = v77;
        *((_QWORD *)&v88 + 1) = v28;
        v71._countAndFlagsBits = 46;
        v71._object = (void *)0xE100000000000000;
        String.append(_:)(v71);
        v72._countAndFlagsBits = v62;
        v72._object = v61;
        String.append(_:)(v72);
        swift_bridgeObjectRelease(v61);
        v43 = v88;
        v58(v56, v82);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v84, v69);
        return v43;
      }
    }
    else
    {
      sub_100019B80((uint64_t)&v88, &qword_10006CF08);
      v63 = v76;
      v36(v76, v86, v55);
      v64 = v75;
    }
    v36(v64, (uint64_t)v63, v55);
    v62 = String.init<A>(describing:)(v64, v55);
    v61 = v68;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease(v28);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v23, v86, a1);
  v30 = v83;
  v31 = _getErrorEmbeddedNSError<A>(_:)(v23, a1, v83);
  if (v31)
  {
    v32 = v31;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v23, a1);
  }
  else
  {
    v32 = swift_allocError(a1, v30, 0, 0);
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v44, v23, a1);
  }
  v45 = (void *)_convertErrorToNSError(_:)(v32);
  swift_errorRelease(v32);
  *(_QWORD *)&v88 = 0;
  *((_QWORD *)&v88 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease(*((_QWORD *)&v88 + 1));
  *(_QWORD *)&v88 = 0x20726F727245534ELL;
  *((_QWORD *)&v88 + 1) = 0xEF3D6E69616D6F44;
  v46 = objc_msgSend(v45, "domain");
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v49 = v48;

  v50._countAndFlagsBits = v47;
  v50._object = v49;
  String.append(_:)(v50);
  swift_bridgeObjectRelease(v49);
  v51._countAndFlagsBits = 0x3D65646F4320;
  v51._object = (void *)0xE600000000000000;
  String.append(_:)(v51);
  v87 = objc_msgSend(v45, "code");
  v52._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v52._object;
  String.append(_:)(v52);

  swift_bridgeObjectRelease(object);
  return v88;
}

unint64_t sub_10001CE44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006CF00;
  if (!qword_10006CF00)
  {
    v1 = objc_opt_self(NSError);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10006CF00);
  }
  return result;
}

_QWORD *sub_10001CE80(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_10001CEBC@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  char v11;

  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  ObjectType = swift_getObjectType(v3);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v5);
  v8 = dispatch thunk of _AnyIndexBox._typeID.getter(ObjectType, v4);
  v9 = swift_getObjectType(v5);
  result = dispatch thunk of _AnyIndexBox._typeID.getter(v9, v6);
  if (v8 == result)
  {
    v11 = dispatch thunk of _AnyIndexBox._isEqual(to:)(v5, v6, ObjectType, v4);
    swift_unknownObjectRelease(v5);
    if ((v11 & 1) != 0)
    {
      result = swift_unknownObjectRelease(v3);
      a2[1] = 0u;
      a2[2] = 0u;
      *a2 = 0u;
    }
    else
    {
      dispatch thunk of _AnyCollectionBox.subscript.getter(v3, v4);
      return swift_unknownObjectRelease(v3);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Error.fullDescription.getter(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v3);
  return String.init<A>(reflecting:)(v3, a1);
}

UIFontTextStyle sub_10001D030()
{
  qword_10006CF10 = (uint64_t)UIFontTextStyleSubheadline;
  return UIFontTextStyleSubheadline;
}

id sub_10001D048(uint64_t a1)
{
  return sub_10001D070(a1, (SEL *)&selRef_secondarySystemGroupedBackgroundColor, &qword_10006CF18);
}

id sub_10001D05C(uint64_t a1)
{
  return sub_10001D070(a1, (SEL *)&selRef_systemGroupedBackgroundColor, &qword_10006CF20);
}

id sub_10001D070(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(UIColor), *a2);
  *a3 = result;
  return result;
}

void sub_10001D0B0()
{
  off_10006CF28 = &off_1000621D0;
}

uint64_t sub_10001D0C4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _BOOL8 v11;
  _BYTE v14[24];

  v2 = v1;
  v4 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (uint64_t)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  swift_beginAccess(&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard], v14, 33, 0);
  sub_100026954(a1, v7);
  swift_endAccess(v14);
  v8 = objc_msgSend(v2, "navigationItem");
  v9 = objc_msgSend(v8, "rightBarButtonItem");

  if (v9)
  {
    sub_100019B3C(v7, (uint64_t)v6, &qword_10006D040);
    v10 = type metadata accessor for CRLSEBoard(0);
    v11 = (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v6, 1, v10) != 1;
    sub_100019B80((uint64_t)v6, &qword_10006D040);
    objc_msgSend(v9, "setEnabled:", v11);

  }
  return sub_100019B80(a1, &qword_10006D040);
}

id sub_10001D218()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CRLSEExtensionContextManager(0)), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_10001D288@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id result;
  void *v11;
  id v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t (*v14)(char *, uint64_t, uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _BYTE v20[24];

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v6);
  v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  result = CRLAppGroupIdentifier();
  if (result)
  {
    v11 = result;
    v12 = objc_msgSend(v9, "containerURLForSecurityApplicationGroupIdentifier:", result);

    if (v12)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v12);

      v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
      v13(v8, v5, v2);
      v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v14(v8, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
      {
        v13(a1, v8, v2);
        v15 = a1;
        v16 = 0;
        return (id)v14(v15, v16, 1, v2);
      }
    }
    else
    {
      v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v14(v8, 1, 1, v2);
    }
    sub_100019B80((uint64_t)v8, &qword_10006D050);
    if (qword_10006C648 != -1)
      swift_once(&qword_10006C648, sub_10003EE80);
    swift_beginAccess(&static OS_os_log.crlSharingExtension, v20, 0, 0);
    v17 = (id)static OS_os_log.crlSharingExtension;
    v18 = static os_log_type_t.error.getter();
    sub_100043700((uint64_t)v17, &_mh_execute_header, v18, "Unable to resolve container URL", 31, 2, (uint64_t)_swiftEmptyArrayStorage);

    v15 = a1;
    v16 = 1;
    return (id)v14(v15, v16, 1, v2);
  }
  __break(1u);
  return result;
}

char *sub_10001D4D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  NSString v14;
  NSString v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  _BYTE v32[24];
  _BYTE v33[64];

  v1 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v1);
  v3 = &v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = sub_100011254(&qword_10006D0F8);
  inited = swift_initStackObject(v4, v33);
  *(_OWORD *)(inited + 16) = xmmword_100052750;
  v6 = v0 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard;
  swift_beginAccess(v6, v32, 0, 0);
  sub_100019B3C(v6, (uint64_t)v3, &qword_10006D040);
  v7 = type metadata accessor for CRLSEBoard(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v3, 1, v7))
  {
    sub_100019B80((uint64_t)v3, &qword_10006D040);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v10 = &v3[*(int *)(v7 + 20)];
    v8 = *(_QWORD *)v10;
    v9 = *((_QWORD *)v10 + 1);
    swift_bridgeObjectRetain(v9);
    sub_100019B80((uint64_t)v3, &qword_10006D040);
  }
  *(_QWORD *)(inited + 32) = v8;
  *(_QWORD *)(inited + 40) = v9;
  v11 = type metadata accessor for CRLSEExtensionContextManager(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
  v13 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v14 = String._bridgeToObjectiveC()();
  v15 = String._bridgeToObjectiveC()();
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v13, "localizedStringForKey:value:table:", v14, v15, v16);

  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v20 = v19;

  *(_QWORD *)(inited + 48) = v18;
  *(_QWORD *)(inited + 56) = v20;
  v21 = *(_QWORD *)(inited + 40);
  if (!v21)
  {
    v23 = (char *)_swiftEmptyArrayStorage;
    if (!v20)
      goto LABEL_15;
    goto LABEL_10;
  }
  v22 = *(_QWORD *)(inited + 32);
  swift_bridgeObjectRetain(*(_QWORD *)(inited + 40));
  v23 = sub_100045854(0, 1, 1, (char *)_swiftEmptyArrayStorage);
  v25 = *((_QWORD *)v23 + 2);
  v24 = *((_QWORD *)v23 + 3);
  if (v25 >= v24 >> 1)
    v23 = sub_100045854((char *)(v24 > 1), v25 + 1, 1, v23);
  *((_QWORD *)v23 + 2) = v25 + 1;
  v26 = &v23[16 * v25];
  *((_QWORD *)v26 + 4) = v22;
  *((_QWORD *)v26 + 5) = v21;
  v18 = *(_QWORD *)(inited + 48);
  v20 = *(_QWORD *)(inited + 56);
  if (v20)
  {
LABEL_10:
    swift_bridgeObjectRetain(v20);
    if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
      v23 = sub_100045854(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
    v28 = *((_QWORD *)v23 + 2);
    v27 = *((_QWORD *)v23 + 3);
    if (v28 >= v27 >> 1)
      v23 = sub_100045854((char *)(v27 > 1), v28 + 1, 1, v23);
    *((_QWORD *)v23 + 2) = v28 + 1;
    v29 = &v23[16 * v28];
    *((_QWORD *)v29 + 4) = v18;
    *((_QWORD *)v29 + 5) = v20;
  }
LABEL_15:
  swift_bridgeObjectRelease(inited);
  return v23;
}

void sub_10001D7EC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSString v20;
  id v21;
  uint64_t v22;
  NSString v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  NSString v28;
  NSString v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  NSString v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  id v43;
  id v44;
  NSString v45;
  NSString v46;
  NSString v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSString v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  NSString v81;
  NSString v82;
  NSString v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  NSString v87;
  void *v88;
  id v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  char *v112;
  id v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  const char *v123;
  uint64_t ObjCClassFromMetadata;
  id v125;
  _QWORD v126[2];
  _OWORD v127[2];
  __int128 v128;
  __int128 v129;
  objc_super v130;

  v1 = v0;
  v2 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v2);
  v4 = (char *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for CRLSEiOSMainViewController(0);
  v130.receiver = v1;
  v130.super_class = v9;
  objc_msgSendSuper2(&v130, "loadView");
  v10 = objc_msgSend(v1, "extensionContext");

  if (!v10)
  {
LABEL_6:
    sub_100021290();
    return;
  }
  sub_10001D288(v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100019B80((uint64_t)v4, &qword_10006D050);
    if (qword_10006C648 != -1)
      swift_once(&qword_10006C648, sub_10003EE80);
    swift_beginAccess(&static OS_os_log.crlSharingExtension, &v128, 0, 0);
    v11 = (id)static OS_os_log.crlSharingExtension;
    v12 = static os_log_type_t.error.getter();
    sub_100043700((uint64_t)v11, &_mh_execute_header, v12, "Unable to resolve container URL. Cancelling request.", 52, 2, (uint64_t)_swiftEmptyArrayStorage);

    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v13 = sub_10001D218();
  sub_100032D70((uint64_t)v8);

  v14 = objc_msgSend(v1, "view");
  if (!v14)
  {
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v15 = v14;
  if (qword_10006C558 != -1)
    swift_once(&qword_10006C558, sub_10001D05C);
  v121 = v6;
  objc_msgSend(v15, "setBackgroundColor:", qword_10006CF20);

  v16 = objc_msgSend(v1, "view");
  if (!v16)
    goto LABEL_57;
  v17 = v16;
  objc_msgSend(v16, "setOpaque:", 0);

  objc_msgSend(v1, "setEdgesForExtendedLayout:", 0);
  v18 = objc_msgSend(v1, "navigationItem");
  v125 = (id)objc_opt_self(NSBundle);
  v19 = objc_msgSend(v125, "mainBundle");
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v19, "objectForInfoDictionaryKey:", v20);

  if (v21)
  {
    _bridgeAnyObjectToAny(_:)(v127, v21);
    swift_unknownObjectRelease(v21);
  }
  else
  {
    memset(v127, 0, sizeof(v127));
  }
  sub_100026B7C((uint64_t)v127, (uint64_t)&v128);
  v122 = v8;
  if (*((_QWORD *)&v129 + 1))
  {
    if ((swift_dynamicCast(v126, &v128, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v22 = v126[1];
      v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v22);
      goto LABEL_19;
    }
  }
  else
  {
    sub_100019B80((uint64_t)&v128, &qword_10006D0F0);
  }
  v23 = 0;
LABEL_19:
  objc_msgSend(v18, "setTitle:", v23);

  v24 = objc_msgSend(v1, "navigationItem");
  v25 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v1, "cancel:");
  objc_msgSend(v24, "setLeftBarButtonItem:", v25);

  v26 = type metadata accessor for CRLSEExtensionContextManager(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v26);
  v27 = objc_msgSend(v125, "bundleForClass:");
  v28 = String._bridgeToObjectiveC()();
  v29 = String._bridgeToObjectiveC()();
  v123 = "Recently Deleted";
  v30 = String._bridgeToObjectiveC()();
  v31 = objc_msgSend(v27, "localizedStringForKey:value:table:", v28, v29, v30);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
  v33 = v32;

  v34 = objc_msgSend(v1, "navigationItem");
  *((_QWORD *)&v129 + 1) = v9;
  *(_QWORD *)&v128 = v1;
  v35 = v1;
  v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v33);
  v37 = *((_QWORD *)&v129 + 1);
  if (*((_QWORD *)&v129 + 1))
  {
    v38 = sub_100017804(&v128, *((uint64_t *)&v129 + 1));
    v39 = *(_QWORD *)(v37 - 8);
    __chkstk_darwin(v38);
    v41 = (char *)&v120 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v39 + 16))(v41);
    v42 = _bridgeAnythingToObjectiveC<A>(_:)(v41, v37);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v37);
    sub_10001786C(&v128);
  }
  else
  {
    v42 = 0;
  }
  v43 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v36, 2, v42, "save:");

  swift_unknownObjectRelease(v42);
  objc_msgSend(v34, "setRightBarButtonItem:", v43);

  v44 = objc_msgSend(v125, "bundleForClass:", ObjCClassFromMetadata);
  v45 = String._bridgeToObjectiveC()();
  v46 = String._bridgeToObjectiveC()();
  v47 = String._bridgeToObjectiveC()();
  v48 = objc_msgSend(v44, "localizedStringForKey:value:table:", v45, v46, v47);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
  v50 = v49;

  v51 = objc_msgSend(v35, "navigationItem");
  v128 = 0u;
  v129 = 0u;
  v52 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v50);
  v53 = *((_QWORD *)&v129 + 1);
  if (*((_QWORD *)&v129 + 1))
  {
    v54 = sub_100017804(&v128, *((uint64_t *)&v129 + 1));
    v55 = *(_QWORD *)(v53 - 8);
    __chkstk_darwin(v54);
    v57 = (char *)&v120 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v55 + 16))(v57);
    v58 = _bridgeAnythingToObjectiveC<A>(_:)(v57, v53);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v53);
    sub_10001786C(&v128);
  }
  else
  {
    v58 = 0;
  }
  v59 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v52, 0, v58, 0);

  swift_unknownObjectRelease(v58);
  objc_msgSend(v51, "setBackBarButtonItem:", v59);

  v60 = objc_msgSend(v35, "navigationItem");
  v61 = objc_msgSend(v60, "rightBarButtonItem");

  if (v61)
  {
    objc_msgSend(v61, "setEnabled:", 0);

  }
  v62 = objc_msgSend(objc_allocWithZone((Class)UIScrollView), "init");
  v63 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
  v64 = *(void **)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView];
  *(_QWORD *)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView] = v62;

  v65 = *(void **)&v35[v63];
  if (!v65)
    goto LABEL_58;
  objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v66 = objc_msgSend(v35, "view");
  if (!v66)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  if (!*(_QWORD *)&v35[v63])
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v67 = v66;
  objc_msgSend(v66, "addSubview:");

  v68 = sub_100022378();
  v69 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView;
  v70 = *(void **)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  *(_QWORD *)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView] = v68;

  v71 = *(void **)&v35[v63];
  if (!v71)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (!*(_QWORD *)&v35[v69])
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  objc_msgSend(v71, "addSubview:");
  v72 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v73 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
  v74 = *(void **)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView];
  *(_QWORD *)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView] = v72;

  v75 = *(void **)&v35[v73];
  if (!v75)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v76 = *(void **)&v35[v73];
  if (!v76)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  objc_msgSend(v76, "setAccessibilityContainerType:", 4);
  v77 = *(void **)&v35[v73];
  if (!v77)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  objc_msgSend(v77, "setIsAccessibilityElement:", 0);
  v78 = *(void **)&v35[v73];
  if (!v78)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v79 = v78;
  v80 = objc_msgSend(v125, "bundleForClass:", ObjCClassFromMetadata);
  v81 = String._bridgeToObjectiveC()();
  v82 = String._bridgeToObjectiveC()();
  v83 = String._bridgeToObjectiveC()();
  v84 = objc_msgSend(v80, "localizedStringForKey:value:table:", v81, v82, v83);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
  v86 = v85;

  v87 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v86);
  objc_msgSend(v79, "setAccessibilityLabel:", v87);

  v88 = *(void **)&v35[v63];
  if (!v88)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!*(_QWORD *)&v35[v73])
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  objc_msgSend(v88, "addSubview:");
  v89 = objc_msgSend(objc_allocWithZone((Class)UITextView), "init");
  v90 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent;
  v91 = *(void **)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent];
  *(_QWORD *)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent] = v89;

  v92 = *(void **)&v35[v90];
  if (!v92)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  objc_msgSend(v92, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v93 = *(void **)&v35[v90];
  if (!v93)
  {
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  v94 = qword_10006C550;
  v95 = v93;
  if (v94 != -1)
    swift_once(&qword_10006C550, sub_10001D048);
  objc_msgSend(v95, "setBackgroundColor:", qword_10006CF18);

  v96 = *(void **)&v35[v90];
  if (!v96)
    goto LABEL_71;
  v97 = objc_msgSend(v96, "layer");
  objc_msgSend(v97, "setCornerRadius:", 12.0);

  v98 = *(void **)&v35[v90];
  if (!v98)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  v99 = v98;
  objc_msgSend(v99, "setTextContainerInset:", 16.0, 16.0, 16.0, 16.0);

  v100 = *(void **)&v35[v90];
  if (!v100)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v101 = (void *)objc_opt_self(UIFont);
  v102 = v100;
  v103 = objc_msgSend(v101, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v102, "setFont:", v103);

  v104 = *(void **)&v35[v90];
  if (!v104)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  v105 = (void *)objc_opt_self(UIColor);
  v106 = v104;
  v107 = objc_msgSend(v105, "labelColor");
  objc_msgSend(v106, "setTextColor:", v107);

  v108 = *(void **)&v35[v90];
  if (!v108)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  objc_msgSend(v108, "setScrollEnabled:", 0);
  v109 = *(void **)&v35[v90];
  if (!v109)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  objc_msgSend(v109, "setContentMode:", 0);
  v110 = *(void **)&v35[v90];
  if (!v110)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  objc_msgSend(v110, "setHidden:", 1);
  v111 = *(void **)&v35[v63];
  if (!v111)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v112 = v122;
  if (!*(_QWORD *)&v35[v90])
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  objc_msgSend(v111, "addSubview:");
  v113 = objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  v114 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator;
  v115 = *(void **)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator];
  *(_QWORD *)&v35[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator] = v113;

  v116 = *(void **)&v35[v114];
  if (!v116)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  objc_msgSend(v116, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v117 = *(void **)&v35[v114];
  if (!v117)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  objc_msgSend(v117, "setHidesWhenStopped:", 1);
  v118 = objc_msgSend(v35, "view");
  if (!v118)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (*(_QWORD *)&v35[v114])
  {
    v119 = v118;
    objc_msgSend(v118, "addSubview:");

    (*(void (**)(char *, uint64_t))(v121 + 8))(v112, v5);
    return;
  }
LABEL_83:
  __break(1u);
}

void sub_10001E5C4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int EnumCaseMultiPayload;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  unint64_t v69;
  char *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  unsigned __int8 v76;
  double v77;
  unsigned int v78;
  id v79;
  uint64_t v80;
  void *v81;
  uint64_t (**v82)(char *, uint64_t, uint64_t);
  double v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  unsigned __int8 v88;
  double v89;
  unsigned int v90;
  id v91;
  void *v92;
  char *v93;
  void *v94;
  id v95;
  char *v96;
  uint64_t v97;
  id v98;
  void *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  id v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  id v150;
  id v151;
  char *v152;
  uint64_t v153;
  void *v154;
  char *v155;
  id v156;
  void *v157;
  id v158;
  id v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  id v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  uint64_t v175;
  id v176;
  id v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  id v183;
  void *v184;
  id v185;
  void *v186;
  id v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  void *v192;
  id v193;
  id v194;
  id v195;
  void *v196;
  id v197;
  void *v198;
  id v199;
  id v200;
  id v201;
  uint64_t (**v202)(char *, uint64_t, uint64_t);
  void *v203;
  uint64_t v204;
  void *v205;
  uint64_t (**v206)(char *, uint64_t, uint64_t);
  id v207;
  id v208;
  id v209;
  void *v210;
  id v211;
  id v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  id v218;
  id v219;
  uint64_t v220;
  Class isa;
  id v222;
  char *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;
  id v229;
  uint64_t v230;
  _QWORD *v231;
  uint64_t v232;
  void *v233;
  id v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  char *v247;
  uint64_t v248;
  uint64_t v249;
  char *v250;
  char *v251;
  uint64_t (**v252)(char *, uint64_t, uint64_t);
  char *v253;
  uint64_t v254;
  _QWORD v255[4];
  char v256[24];
  char v257[32];

  v1 = v0;
  v2 = sub_100011254(&qword_10006D100);
  __chkstk_darwin(v2);
  v250 = (char *)&v240 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100011254(&qword_10006D038);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v240 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID(0);
  v248 = *(_QWORD *)(v8 - 8);
  v249 = v8;
  __chkstk_darwin(v8);
  v247 = (char *)&v240 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v246 = type metadata accessor for CRLSEBoardIdentifier(0);
  v245 = *(_QWORD *)(v246 - 8);
  __chkstk_darwin(v246);
  v244 = (uint64_t)&v240 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100011254(&qword_10006D030);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v240 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v240 - v15;
  v17 = sub_100011254(&qword_10006D108);
  v18 = __chkstk_darwin(v17);
  v251 = (char *)&v240 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v254 = (uint64_t)&v240 - v20;
  v21 = sub_100011254(&qword_10006D040);
  v22 = __chkstk_darwin(v21);
  v253 = (char *)&v240 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v25 = (char *)&v240 - v24;
  v26 = (uint64_t)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  swift_beginAccess(&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard], v257, 0, 0);
  sub_100019B3C(v26, (uint64_t)v25, &qword_10006D040);
  v27 = type metadata accessor for CRLSEBoard(0);
  v252 = *(uint64_t (***)(char *, uint64_t, uint64_t))(v27 - 8);
  LODWORD(v26) = v252[6](v25, 1, v27);
  sub_100019B80((uint64_t)v25, &qword_10006D040);
  if ((_DWORD)v26 == 1)
  {
    v242 = v5;
    v243 = v4;
    v28 = sub_10001D218();
    v29 = sub_100037F48();

    v30 = v29 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
    swift_beginAccess(v29 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents, v256, 0, 0);
    sub_100019B3C(v30, (uint64_t)v14, &qword_10006D030);
    v31 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
    v32 = *(_QWORD *)(v31 - 8);
    v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
    if (v33(v14, 1, v31))
    {
      sub_100019B80((uint64_t)v14, &qword_10006D030);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v16, 1, 1, v31);
      swift_release(v29);
    }
    else
    {
      v34 = *(_QWORD *)&v14[*(int *)(v31 + 20)];
      swift_bridgeObjectRetain(v34);
      sub_100019B80((uint64_t)v14, &qword_10006D030);
      if (*(_QWORD *)(v34 + 16))
      {
        sub_1000191EC(v34 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80)), (uint64_t)v16, type metadata accessor for CRLSELibraryViewModeItemNode);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v16, 0, 1, v31);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v16, 1, 1, v31);
      }
      swift_release(v29);
      swift_bridgeObjectRelease(v34);
    }
    v35 = v33(v16, 1, v31);
    v5 = v242;
    if (v35 == 1)
    {
      sub_100019B80((uint64_t)v16, &qword_10006D030);
      v36 = type metadata accessor for CRLSELibraryViewModel.Item(0);
      v37 = v254;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v254, 1, 1, v36);
      v4 = v243;
LABEL_16:
      v62 = (uint64_t)v253;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v252[7])(v253, 1, 1, v27);
      sub_10001D0C4(v62);
      goto LABEL_17;
    }
    v38 = v254;
    sub_1000191EC((uint64_t)v16, v254, type metadata accessor for CRLSELibraryViewModel.Item);
    v39 = (uint64_t)v16;
    v37 = v38;
    sub_100013BBC(v39, type metadata accessor for CRLSELibraryViewModeItemNode);
    v40 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v37, 0, 1, v40);
    v41 = (uint64_t)v251;
    sub_100019B3C(v37, (uint64_t)v251, &qword_10006D108);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v41, v40);
    v4 = v243;
    if (EnumCaseMultiPayload == 3)
    {
      v50 = sub_100011254((uint64_t *)&unk_10006D630);
      v51 = (uint64_t *)(v41 + *(int *)(v50 + 48));
      v53 = *v51;
      v52 = v51[1];
      v241 = v53;
      v240 = v52;
      v244 = v41 + *(int *)(v50 + 64);
      v54 = v247;
      (*(void (**)(char *, uint64_t, uint64_t))(v248 + 32))(v247, v41, v249);
      v55 = (uint64_t)v253;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v245 + 56))(v253, 1, 1, v246);
      v56 = v55 + *(int *)(v27 + 24);
      v57 = v248;
      v58 = v54;
      v59 = v249;
      (*(void (**)(uint64_t, char *, uint64_t))(v248 + 16))(v56, v58, v249);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v57 + 56))(v56, 0, 1, v59);
      v60 = (_QWORD *)(v55 + *(int *)(v27 + 20));
      v61 = v240;
      *v60 = v241;
      v60[1] = v61;
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v252[7])(v55, 0, 1, v27);
      sub_10001D0C4(v55);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v247, v59);
      v49 = v244;
    }
    else
    {
      if (EnumCaseMultiPayload != 2)
      {
        sub_100013BBC(v41, type metadata accessor for CRLSELibraryViewModel.Item);
        goto LABEL_16;
      }
      v43 = sub_100011254((uint64_t *)&unk_10006D640);
      v44 = (uint64_t *)(v41 + *(int *)(v43 + 48));
      v45 = v44[1];
      v241 = *v44;
      v247 = (char *)(v41 + *(int *)(v43 + 80));
      v46 = v244;
      sub_100017A6C(v41, v244, type metadata accessor for CRLSEBoardIdentifier);
      v47 = (uint64_t)v253;
      sub_1000191EC(v46, (uint64_t)v253, type metadata accessor for CRLSEBoardIdentifier);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v245 + 56))(v47, 0, 1, v246);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v248 + 56))(v47 + *(int *)(v27 + 24), 1, 1, v249);
      v48 = (_QWORD *)(v47 + *(int *)(v27 + 20));
      *v48 = v241;
      v48[1] = v45;
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v252[7])(v47, 0, 1, v27);
      sub_10001D0C4(v47);
      sub_100013BBC(v46, type metadata accessor for CRLSEBoardIdentifier);
      v49 = (uint64_t)v247;
    }
    sub_100019B80(v49, (uint64_t *)&unk_10006D130);
LABEL_17:
    sub_100019B80(v37, &qword_10006D108);
  }
  v63 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView;
  v64 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (!v64)
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  v65 = v64;
  v66 = sub_100021688(v65);

  v67 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource;
  v68 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource];
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource] = v66;

  v69 = sub_1000263E4();
  NSDiffableDataSourceSnapshot.init()(&type metadata for CRLSEiOSMainViewController.CollectionViewSection, &type metadata for String, v69, &protocol witness table for String);
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_100062208);
  v70 = sub_10001D4D0();
  LOBYTE(v255[0]) = 0;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(v70, v255, v4);
  swift_bridgeObjectRelease(v70);
  v71 = *(void **)&v1[v67];
  if (v71)
  {
    v72 = v71;
    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)(v7, 0, 0, 0);

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v254 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
  v73 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView];
  if (!v73)
    goto LABEL_75;
  v74 = objc_msgSend(v73, "widthAnchor");
  v75 = objc_msgSend(v1, "traitCollection");
  v76 = objc_msgSend(v75, "crl_isCompactWidth");

  if ((v76 & 1) != 0)
  {
    v77 = 326.0;
  }
  else
  {
    v78 = objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI");
    v77 = 624.0;
    if (v78)
      v77 = 326.0;
  }
  v79 = objc_msgSend(v74, "constraintLessThanOrEqualToConstant:", v77);

  v80 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint;
  v81 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint] = v79;
  v82 = (uint64_t (**)(char *, uint64_t, uint64_t))v79;

  v84 = *(void **)&v1[v80];
  if (v84)
  {
    LODWORD(v83) = 1132068864;
    objc_msgSend(v84, "setPriority:", v83);
  }
  v85 = *(void **)&v1[v254];
  if (!v85)
    goto LABEL_76;
  v86 = objc_msgSend(v85, "heightAnchor");
  v87 = objc_msgSend(v1, "traitCollection");
  v88 = objc_msgSend(v87, "crl_isCompactWidth");

  if ((v88 & 1) != 0)
  {
    v89 = 220.0;
  }
  else
  {
    v90 = objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI");
    v89 = 360.0;
    if (v90)
      v89 = 220.0;
  }
  v91 = objc_msgSend(v86, "constraintEqualToConstant:", v89);

  v92 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint] = v91;
  v93 = (char *)v91;

  v94 = *(void **)&v1[v63];
  if (!v94)
    goto LABEL_77;
  v95 = objc_msgSend(v94, "heightAnchor");
  v96 = sub_10001D4D0();
  v97 = *((_QWORD *)v96 + 2);
  swift_bridgeObjectRelease(v96);
  v98 = objc_msgSend(v95, "constraintEqualToConstant:", ((double)v97 + 1.0) * 48.0);

  v99 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint] = v98;
  v100 = (char *)v98;

  v101 = sub_100011254(&qword_10006D670);
  v102 = swift_allocObject(v101, 200, 7);
  *(_OWORD *)(v102 + 16) = xmmword_100052760;
  v103 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
  v104 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView];
  if (!v104)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v252 = v82;
  v253 = v100;
  v251 = v93;
  v105 = objc_msgSend(v104, "topAnchor");
  v106 = objc_msgSend(v1, "view");
  if (!v106)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v107 = v106;
  v108 = objc_msgSend(v106, "safeAreaLayoutGuide");

  v109 = objc_msgSend(v108, "topAnchor");
  v110 = objc_msgSend(v105, "constraintEqualToAnchor:", v109);

  *(_QWORD *)(v102 + 32) = v110;
  v111 = *(void **)&v1[v103];
  if (!v111)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v112 = objc_msgSend(v111, "leadingAnchor");
  v113 = objc_msgSend(v1, "view");
  if (!v113)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  v114 = v113;
  v115 = objc_msgSend(v113, "safeAreaLayoutGuide");

  v116 = objc_msgSend(v115, "leadingAnchor");
  v117 = objc_msgSend(v112, "constraintEqualToAnchor:", v116);

  *(_QWORD *)(v102 + 40) = v117;
  v118 = *(void **)&v1[v103];
  if (!v118)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  v119 = objc_msgSend(v118, "bottomAnchor");
  v120 = objc_msgSend(v1, "view");
  if (!v120)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  v121 = v120;
  v122 = objc_msgSend(v120, "safeAreaLayoutGuide");

  v123 = objc_msgSend(v122, "bottomAnchor");
  v124 = objc_msgSend(v119, "constraintEqualToAnchor:", v123);

  *(_QWORD *)(v102 + 48) = v124;
  v125 = *(void **)&v1[v103];
  if (!v125)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  v126 = objc_msgSend(v125, "trailingAnchor");
  v127 = objc_msgSend(v1, "view");
  if (!v127)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  v128 = v127;
  v129 = objc_msgSend(v127, "safeAreaLayoutGuide");

  v130 = objc_msgSend(v129, "trailingAnchor");
  v131 = objc_msgSend(v126, "constraintEqualToAnchor:", v130);

  *(_QWORD *)(v102 + 56) = v131;
  v132 = *(void **)&v1[v63];
  if (!v132)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  v133 = objc_msgSend(v132, "topAnchor");
  v134 = *(void **)&v1[v103];
  if (!v134)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  v135 = objc_msgSend(v134, "topAnchor");
  v136 = objc_msgSend(v133, "constraintEqualToAnchor:constant:", v135, 16.0);

  *(_QWORD *)(v102 + 64) = v136;
  v137 = *(void **)&v1[v63];
  if (!v137)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  v138 = objc_msgSend(v137, "leadingAnchor");
  v139 = *(void **)&v1[v103];
  if (!v139)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v140 = objc_msgSend(v139, "leadingAnchor");
  v141 = objc_msgSend(v138, "constraintEqualToAnchor:", v140);

  *(_QWORD *)(v102 + 72) = v141;
  v142 = *(void **)&v1[v63];
  if (!v142)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  v143 = objc_msgSend(v142, "trailingAnchor");
  v144 = *(void **)&v1[v103];
  if (!v144)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  v145 = objc_msgSend(v144, "trailingAnchor");
  v146 = objc_msgSend(v143, "constraintEqualToAnchor:", v145);

  *(_QWORD *)(v102 + 80) = v146;
  v147 = *(void **)&v1[v63];
  if (!v147)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v148 = objc_msgSend(v147, "widthAnchor");
  v149 = *(void **)&v1[v103];
  if (!v149)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  v150 = objc_msgSend(v149, "widthAnchor");
  v151 = objc_msgSend(v148, "constraintEqualToAnchor:", v150);

  v152 = v253;
  *(_QWORD *)(v102 + 88) = v151;
  *(_QWORD *)(v102 + 96) = v152;
  v153 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent;
  v154 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent];
  if (!v154)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  v155 = v152;
  v156 = objc_msgSend(v154, "topAnchor");
  v157 = *(void **)&v1[v63];
  if (!v157)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  v158 = objc_msgSend(v157, "bottomAnchor");
  v159 = objc_msgSend(v156, "constraintEqualToAnchor:constant:", v158, 56.0);

  *(_QWORD *)(v102 + 104) = v159;
  v160 = *(void **)&v1[v153];
  if (!v160)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  v253 = v155;
  v161 = objc_msgSend(v160, "leadingAnchor");
  v162 = *(void **)&v1[v103];
  if (!v162)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  v163 = objc_msgSend(v162, "contentLayoutGuide");
  v164 = objc_msgSend(v163, "leadingAnchor");

  v165 = objc_msgSend(v161, "constraintEqualToAnchor:constant:", v164, 24.0);
  *(_QWORD *)(v102 + 112) = v165;
  v166 = *(void **)&v1[v153];
  if (!v166)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v167 = objc_msgSend(v166, "trailingAnchor");
  v168 = *(void **)&v1[v103];
  if (!v168)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  v169 = objc_msgSend(v168, "contentLayoutGuide");
  v170 = objc_msgSend(v169, "trailingAnchor");

  v171 = objc_msgSend(v167, "constraintEqualToAnchor:constant:", v170, -24.0);
  *(_QWORD *)(v102 + 120) = v171;
  v172 = *(void **)&v1[v153];
  if (!v172)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v173 = objc_msgSend(v172, "bottomAnchor");
  v174 = *(void **)&v1[v103];
  v175 = v254;
  if (!v174)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  v176 = objc_msgSend(v174, "contentLayoutGuide");
  v177 = objc_msgSend(v176, "bottomAnchor");

  v178 = objc_msgSend(v173, "constraintEqualToAnchor:constant:", v177, -24.0);
  *(_QWORD *)(v102 + 128) = v178;
  v179 = *(void **)&v1[v175];
  if (!v179)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  v180 = objc_msgSend(v179, "topAnchor");
  v181 = *(void **)&v1[v63];
  if (!v181)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  v182 = objc_msgSend(v181, "bottomAnchor");
  v183 = objc_msgSend(v180, "constraintEqualToAnchor:constant:", v182, 56.0);

  *(_QWORD *)(v102 + 136) = v183;
  v184 = *(void **)&v1[v175];
  if (!v184)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  v185 = objc_msgSend(v184, "leftAnchor");
  v186 = *(void **)&v1[v103];
  if (!v186)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  v187 = objc_msgSend(v186, "contentLayoutGuide");
  v188 = objc_msgSend(v187, "leftAnchor");

  v189 = objc_msgSend(v185, "constraintEqualToAnchor:", v188);
  *(_QWORD *)(v102 + 144) = v189;
  v190 = *(void **)&v1[v175];
  if (!v190)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  v191 = objc_msgSend(v190, "rightAnchor");
  v192 = *(void **)&v1[v103];
  if (!v192)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  v193 = objc_msgSend(v192, "contentLayoutGuide");
  v194 = objc_msgSend(v193, "rightAnchor");

  v195 = objc_msgSend(v191, "constraintEqualToAnchor:", v194);
  *(_QWORD *)(v102 + 152) = v195;
  v196 = *(void **)&v1[v175];
  if (!v196)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v197 = objc_msgSend(v196, "bottomAnchor");
  v198 = *(void **)&v1[v103];
  if (!v198)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v199 = objc_msgSend(v198, "contentLayoutGuide");
  v200 = objc_msgSend(v199, "bottomAnchor");

  v201 = objc_msgSend(v197, "constraintLessThanOrEqualToAnchor:constant:", v200, -32.0);
  v203 = v251;
  v202 = v252;
  *(_QWORD *)(v102 + 160) = v201;
  *(_QWORD *)(v102 + 168) = v202;
  *(_QWORD *)(v102 + 176) = v203;
  v204 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator;
  v205 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator];
  if (!v205)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v206 = v202;
  v207 = v203;
  v208 = objc_msgSend(v205, "centerXAnchor");
  v209 = objc_msgSend(v1, "view");
  if (!v209)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  v210 = v209;
  v211 = objc_msgSend(v209, "centerXAnchor");

  v212 = objc_msgSend(v208, "constraintEqualToAnchor:", v211);
  *(_QWORD *)(v102 + 184) = v212;
  v213 = *(void **)&v1[v204];
  if (!v213)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  v214 = objc_msgSend(v213, "topAnchor");
  v215 = *(void **)&v1[v63];
  if (!v215)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  v216 = v214;
  v217 = (void *)objc_opt_self(NSLayoutConstraint);
  v218 = objc_msgSend(v215, "bottomAnchor");
  v219 = objc_msgSend(v216, "constraintEqualToAnchor:constant:", v218, 56.0);

  *(_QWORD *)(v102 + 192) = v219;
  v255[0] = v102;
  specialized Array._endMutation()();
  v220 = v255[0];
  sub_10002663C(0, (unint64_t *)&qword_10006D080, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v220);
  objc_msgSend(v217, "activateConstraints:", isa);

  v222 = objc_msgSend(v1, "extensionContext");
  v223 = v253;
  if (!v222)
  {
LABEL_73:
    v233 = (void *)objc_opt_self(NSNotificationCenter);
    v234 = objc_msgSend(v233, "defaultCenter");
    objc_msgSend(v234, "addObserver:selector:name:object:", v1, "keyboardDidShowWithNotification:", UIKeyboardWillChangeFrameNotification, 0);

    v235 = objc_msgSend(v233, "defaultCenter");
    objc_msgSend(v235, "addObserver:selector:name:object:", v1, "keyboardWillHideWithNotification:", UIKeyboardWillHideNotification, 0);

    v236 = sub_100011254(&qword_10006D110);
    v237 = swift_allocObject(v236, 64, 7);
    *(_OWORD *)(v237 + 16) = xmmword_100052750;
    *(_QWORD *)(v237 + 32) = type metadata accessor for UITraitHorizontalSizeClass(0);
    *(_QWORD *)(v237 + 40) = &protocol witness table for UITraitHorizontalSizeClass;
    *(_QWORD *)(v237 + 48) = type metadata accessor for UITraitVerticalSizeClass(0);
    *(_QWORD *)(v237 + 56) = &protocol witness table for UITraitVerticalSizeClass;
    v255[3] = type metadata accessor for CRLSEiOSMainViewController(0);
    v255[0] = v1;
    v238 = v1;
    v239 = UIViewController.registerForTraitChanges(_:target:action:)(v237, v255, "observedTraitsDidChange");
    swift_bridgeObjectRelease(v237);
    swift_unknownObjectRelease(v239);

    sub_10001786C(v255);
    return;
  }
  v224 = v222;
  v225 = *(void **)&v1[v204];
  if (v225)
  {
    objc_msgSend(v225, "startAnimating");
    v226 = type metadata accessor for TaskPriority(0);
    v227 = (uint64_t)v250;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v226 - 8) + 56))(v250, 1, 1, v226);
    type metadata accessor for MainActor(0);
    v228 = v1;
    v229 = v224;
    v230 = static MainActor.shared.getter();
    v231 = (_QWORD *)swift_allocObject(&unk_1000631C0, 48, 7);
    v231[2] = v230;
    v231[3] = &protocol witness table for MainActor;
    v231[4] = v228;
    v231[5] = v229;
    v232 = sub_10001FE74(v227, (uint64_t)&unk_10006D120, (uint64_t)v231);
    swift_release(v232);

    goto LABEL_73;
  }
LABEL_114:
  __break(1u);
}

uint64_t sub_10001FCE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[2] = a4;
  v5[3] = a5;
  v6 = type metadata accessor for MainActor(0);
  v5[4] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v5[5] = v7;
  v5[6] = v8;
  return swift_task_switch(sub_10001FD50, v7, v8);
}

uint64_t sub_10001FD50()
{
  uint64_t *v0;
  uint64_t **v1;

  v0[7] = (uint64_t)sub_10001D218();
  v1 = (uint64_t **)swift_task_alloc(dword_10006D764);
  v0[8] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = (uint64_t *)sub_10001FDAC;
  return sub_100033188(v0[3]);
}

uint64_t sub_10001FDAC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  v4 = *(void **)(*v1 + 56);
  v3 = *(_QWORD *)(*v1 + 64);
  *(_QWORD *)(*v1 + 72) = a1;
  swift_task_dealloc(v3);

  return swift_task_switch(sub_10001FE08, *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_10001FE08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 32));
  v3 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems;
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems) = v1;
  swift_bridgeObjectRelease(v4);
  v5 = *(_QWORD *)(v2 + v3);
  swift_bridgeObjectRetain(v5);
  sub_1000225C0(v6);
  swift_bridgeObjectRelease(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001FE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100019B80(a1, &qword_10006D100);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000631E8, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10006D148, v16);
}

void sub_10001FFF4(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  void *v8;
  uint64_t KeyPath;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  id v20[3];
  objc_super v21;

  v2 = v1;
  v4 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v4);
  v6 = (char *)&v20[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (objc_class *)type metadata accessor for CRLSEiOSMainViewController(0);
  v21.receiver = v2;
  v21.super_class = v7;
  objc_msgSendSuper2(&v21, "viewWillAppear:", a1 & 1);
  v8 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (v8)
  {
    v20[0] = *(id *)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
    KeyPath = swift_getKeyPath(&unk_1000528D0);
    v10 = swift_allocObject(&unk_1000630D0, 24, 7);
    swift_unknownObjectWeakInit(v10 + 16, v2);
    v11 = v8;
    v12 = _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)(KeyPath, 0, sub_1000269EC, v10, &protocol witness table for NSObject);
    swift_release(KeyPath);
    swift_release(v10);

    v13 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation];
    *(_QWORD *)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation] = v12;

    v14 = objc_msgSend(v2, "navigationItem");
    v15 = objc_msgSend(v14, "rightBarButtonItem");

    if (v15)
    {
      v16 = (uint64_t)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
      swift_beginAccess(v16, v20, 0, 0);
      sub_100019B3C(v16, (uint64_t)v6, &qword_10006D040);
      v17 = type metadata accessor for CRLSEBoard(0);
      v18 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v6, 1, v17) != 1;
      sub_100019B80((uint64_t)v6, &qword_10006D040);
      objc_msgSend(v15, "setEnabled:", v18);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000201E8(void **a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  _BYTE v13[24];

  v3 = *a1;
  v4 = a3 + 16;
  swift_beginAccess(a3 + 16, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = *(void **)(Strong
                  + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint);
    if (v7)
    {
      objc_msgSend(v7, "constant");
      v9 = v8;
    }
    else
    {
      v9 = 0.0;
    }
    v10 = objc_msgSend(v3, "collectionViewLayout");
    objc_msgSend(v10, "collectionViewContentSize");
    v12 = v11;

    if (v12 > 0.0 && v12 != v9)
      objc_msgSend(v7, "setConstant:", v12);

  }
}

void sub_10002030C(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v7;

  v2 = v1;
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController(0);
  objc_msgSendSuper2(&v7, "viewWillDisappear:", a1 & 1);
  v4 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation;
  v5 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation];
  if (v5)
  {
    v6 = v5;
    dispatch thunk of NSKeyValueObservation.invalidate()();

    v5 = *(void **)&v2[v4];
  }
  *(_QWORD *)&v2[v4] = 0;

}

void sub_1000203C8()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  id v7;
  id v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController(0);
  objc_msgSendSuper2(&v11, "viewDidLayoutSubviews");
  v1 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (v1)
  {
    v2 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint];
    if (v2)
    {
      v3 = v2;
      v4 = v1;
      objc_msgSend(v3, "constant");
      v6 = v5;
    }
    else
    {
      v7 = v1;
      v6 = 0.0;
    }
    v8 = objc_msgSend(v1, "collectionViewLayout");
    objc_msgSend(v8, "collectionViewContentSize");
    v10 = v9;

    if (v10 <= 0.0 || v10 == v6)
    {

    }
    else
    {
      objc_msgSend(v2, "setConstant:", v10);

      v2 = v1;
    }

  }
  else
  {
    __break(1u);
  }
}

id sub_100020500()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v1, "removeObserver:", v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_10002073C()
{
  return type metadata accessor for CRLSEiOSMainViewController(0);
}

uint64_t type metadata accessor for CRLSEiOSMainViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10006D010;
  if (!qword_10006D010)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CRLSEiOSMainViewController);
  return result;
}

id sub_100020780()
{
  char *v0;
  id v1;
  unsigned __int8 v2;
  double v3;
  double v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id result;

  v1 = objc_msgSend(v0, "traitCollection");
  v2 = objc_msgSend(v1, "crl_isCompactWidth");

  if ((v2 & 1) != 0)
  {
    v3 = 220.0;
    v4 = 326.0;
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI");
    if (v5)
      v4 = 326.0;
    else
      v4 = 624.0;
    if (v5)
      v3 = 220.0;
    else
      v3 = 360.0;
  }
  v6 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint];
  if (v6)
    objc_msgSend(v6, "setConstant:", v4);
  v7 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint];
  if (v7)
    objc_msgSend(v7, "setConstant:", v3);
  v8 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint];
  if (v8)
    objc_msgSend(v8, "setConstant:", v4);
  v9 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint];
  if (v9)
    objc_msgSend(v9, "setConstant:", v3);
  result = *(id *)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (result)
    return objc_msgSend(result, "reloadData");
  __break(1u);
  return result;
}

void sub_100020910()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  unint64_t v5;
  char v6;
  double v7;
  double v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;

  v1 = v0;
  v2 = Notification.userInfo.getter();
  if (!v2)
    return;
  v3 = v2;
  *(double *)&v40 = COERCE_DOUBLE(static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyboardAnimationDurationUserInfoKey));
  v41 = v4;
  AnyHashable.init<A>(_:)(v38, &v40, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v3 + 16) && (v5 = sub_10002585C((uint64_t)v38), (v6 & 1) != 0))
  {
    sub_1000268A8(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v44);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  sub_10002686C((uint64_t)v38);
  if (!*((_QWORD *)&v45 + 1))
    goto LABEL_17;
  if ((swift_dynamicCast(&v40, &v44, (char *)&type metadata for Any + 8, &type metadata for Double, 6) & 1) == 0)
  {
LABEL_19:
    swift_bridgeObjectRelease(v3);
    return;
  }
  v7 = *(double *)&v40;
  *(double *)&v40 = COERCE_DOUBLE(static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyboardAnimationCurveUserInfoKey));
  v41 = v8;
  AnyHashable.init<A>(_:)(v38, &v40, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v3 + 16) && (v9 = sub_10002585C((uint64_t)v38), (v10 & 1) != 0))
  {
    sub_1000268A8(*(_QWORD *)(v3 + 56) + 32 * v9, (uint64_t)&v44);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  sub_10002686C((uint64_t)v38);
  if (!*((_QWORD *)&v45 + 1))
  {
LABEL_17:
    swift_bridgeObjectRelease(v3);
LABEL_18:
    sub_100019B80((uint64_t)&v44, &qword_10006D0F0);
    return;
  }
  if ((swift_dynamicCast(&v40, &v44, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
    goto LABEL_19;
  v11 = v40;
  *(double *)&v40 = COERCE_DOUBLE(static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyboardFrameEndUserInfoKey));
  v41 = v12;
  AnyHashable.init<A>(_:)(v38, &v40, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v3 + 16) && (v13 = sub_10002585C((uint64_t)v38), (v14 & 1) != 0))
  {
    sub_1000268A8(*(_QWORD *)(v3 + 56) + 32 * v13, (uint64_t)&v44);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  swift_bridgeObjectRelease(v3);
  sub_10002686C((uint64_t)v38);
  if (!*((_QWORD *)&v45 + 1))
    goto LABEL_18;
  type metadata accessor for CGRect(0);
  if ((swift_dynamicCast(&v40, &v44, (char *)&type metadata for Any + 8, v15, 6) & 1) != 0)
  {
    v16 = *(double *)&v40;
    v17 = v41;
    v18 = v42;
    v19 = v43;
    v20 = objc_msgSend(v1, "view");
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend(v1, "view");
      if (v22)
      {
        v23 = v22;
        v24 = v11 << 16;
        v25 = objc_msgSend(v22, "window");

        objc_msgSend(v21, "convertRect:fromView:", v25, v16, v17, v18, v19);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v34 = (void *)objc_opt_self(UIView);
        v35 = swift_allocObject(&unk_1000630D0, 24, 7);
        swift_unknownObjectWeakInit(v35 + 16, v1);
        v36 = (_QWORD *)swift_allocObject(&unk_100063170, 56, 7);
        v36[2] = v35;
        v36[3] = v27;
        v36[4] = v29;
        v36[5] = v31;
        v36[6] = v33;
        v38[4] = sub_100026944;
        v39 = v36;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 1107296256;
        v38[2] = sub_100020E0C;
        v38[3] = &unk_100063188;
        v37 = _Block_copy(v38);
        swift_release(v39);
        objc_msgSend(v34, "animateWithDuration:delay:options:animations:completion:", v24, v37, 0, v7, 0.0);
        _Block_release(v37);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_100020CD4(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9;
  uint64_t Strong;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  double Height;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  _BYTE v22[24];
  CGRect v23;

  v9 = a1 + 16;
  swift_beginAccess(a1 + 16, v22, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v9);
  if (Strong)
  {
    v11 = (char *)Strong;
    v12 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
    v13 = *(void **)(Strong + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView);
    if (v13)
    {
      v14 = v13;
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      Height = CGRectGetHeight(v23);
      v16 = objc_msgSend(v11, "view");
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "safeAreaInsets");
        v19 = v18;

        objc_msgSend(v14, "setContentInset:", 0.0, 0.0, Height - v19, 0.0);
        v20 = *(void **)&v11[v12];
        if (v20)
        {
          v21 = v20;
          objc_msgSend(v21, "contentInset");
          objc_msgSend(v21, "setScrollIndicatorInsets:");

          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

uint64_t sub_100020E0C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100020E44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v1 = v0;
  v2 = Notification.userInfo.getter();
  if (v2)
  {
    v3 = v2;
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyboardAnimationDurationUserInfoKey);
    v18 = v4;
    AnyHashable.init<A>(_:)(v15, &v17, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v3 + 16) && (v5 = sub_10002585C((uint64_t)v15), (v6 & 1) != 0))
    {
      sub_1000268A8(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v19);
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    sub_10002686C((uint64_t)v15);
    if (*((_QWORD *)&v20 + 1))
    {
      if ((swift_dynamicCast(&v17, &v19, (char *)&type metadata for Any + 8, &type metadata for Double, 6) & 1) == 0)
      {
        swift_bridgeObjectRelease(v3);
        return;
      }
      v7 = *(double *)&v17;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyboardAnimationCurveUserInfoKey);
      v18 = v8;
      AnyHashable.init<A>(_:)(v15, &v17, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v3 + 16) && (v9 = sub_10002585C((uint64_t)v15), (v10 & 1) != 0))
      {
        sub_1000268A8(*(_QWORD *)(v3 + 56) + 32 * v9, (uint64_t)&v19);
      }
      else
      {
        v19 = 0u;
        v20 = 0u;
      }
      swift_bridgeObjectRelease(v3);
      sub_10002686C((uint64_t)v15);
      if (*((_QWORD *)&v20 + 1))
      {
        if ((swift_dynamicCast(&v17, &v19, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
        {
          v11 = v17 << 16;
          v12 = (void *)objc_opt_self(UIView);
          v13 = swift_allocObject(&unk_1000630D0, 24, 7);
          swift_unknownObjectWeakInit(v13 + 16, v1);
          v15[4] = sub_1000268A0;
          v16 = v13;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 1107296256;
          v15[2] = sub_100020E0C;
          v15[3] = &unk_100063138;
          v14 = _Block_copy(v15);
          swift_release(v16);
          objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", v11, v14, 0, v7, 0.0);
          _Block_release(v14);
        }
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease(v3);
    }
    sub_100019B80((uint64_t)&v19, &qword_10006D0F0);
  }
}

void sub_10002109C(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _BYTE v8[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (char *)Strong;
    v4 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
    v5 = *(void **)(Strong + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView);
    if (v5)
    {
      objc_msgSend(v5, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      v6 = *(void **)&v3[v4];
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v7, "contentInset");
        objc_msgSend(v7, "setScrollIndicatorInsets:");

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_100021158(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v13;

  v7 = type metadata accessor for Notification(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a1;
  a4(v10);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_100021290()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  NSString v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
  v2 = v1;
  v3 = objc_allocWithZone((Class)NSError);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  v9 = objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 3072, 0);

  v5 = objc_msgSend(v0, "extensionContext");
  if (v5)
  {
    v6 = v5;
    v7 = v9;
    v8 = (void *)_convertErrorToNSError(_:)();

    objc_msgSend(v6, "cancelRequestWithError:", v8);
  }

}

void sub_100021374()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSString v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  char *v28;
  Class isa;
  uint64_t v30;
  uint64_t v31;
  char v32[40];
  char v33[24];

  v1 = v0;
  v2 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v2);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CRLSEBoard(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  swift_beginAccess(&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard], v33, 0, 0);
  sub_100019B3C(v9, (uint64_t)v4, &qword_10006D040);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100019B80((uint64_t)v4, &qword_10006D040);
    return;
  }
  sub_100017A6C((uint64_t)v4, (uint64_t)v8, type metadata accessor for CRLSEBoard);
  v10 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent];
  if (!v10)
  {
    __break(1u);
    goto LABEL_13;
  }
  v11 = objc_msgSend(v10, "text");
  if (!v11)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v12 = v11;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = objc_allocWithZone((Class)NSAttributedString);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  v17 = objc_msgSend(v15, "initWithString:", v16);

  v18 = sub_10001D218();
  v19 = *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems];
  v20 = v17;
  swift_bridgeObjectRetain(v19);
  LOBYTE(v17) = sub_100035120(v8, v17, v19);

  swift_bridgeObjectRelease(v19);
  if ((v17 & 1) != 0)
  {
    v21 = objc_msgSend(objc_allocWithZone((Class)NSExtensionItem), "init");
    v22 = sub_100011254(&qword_10006D670);
    inited = swift_initStackObject(v22, v32);
    *(_OWORD *)(inited + 16) = xmmword_100052770;
    *(_QWORD *)(inited + 32) = v21;
    v31 = inited;
    specialized Array._endMutation()();
    v24 = v31;
    v25 = v21;
    v26 = objc_msgSend(v1, "extensionContext");
    if (!v26)
    {
      sub_100013BBC((uint64_t)v8, type metadata accessor for CRLSEBoard);
      swift_bridgeObjectRelease(v24);

      return;
    }
    v27 = v26;
    v28 = sub_1000323F0(v24);
    swift_bridgeObjectRelease(v24);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v28);
    objc_msgSend(v27, "completeRequestReturningItems:completionHandler:", isa, 0);

  }
  else
  {
    sub_100021290();

  }
  sub_100013BBC((uint64_t)v8, type metadata accessor for CRLSEBoard);
}

uint64_t sub_100021688(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51;
  char *v52;

  v2 = v1;
  v51 = a1;
  v3 = sub_100011254(&qword_10006D0C0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = __chkstk_darwin(v3);
  v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v6);
  v44 = (char *)&v43 - v8;
  v9 = __chkstk_darwin(v7);
  v52 = (char *)&v43 - v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v43 - v11;
  v50 = sub_100011254(&qword_10006D0C8);
  v48 = *(_QWORD *)(v50 - 8);
  v13 = *(_QWORD *)(v48 + 64);
  v14 = __chkstk_darwin(v50);
  v49 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v46 = (char *)&v43 - v15;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(UICollectionElementKindSectionHeader);
  v18 = v17;
  v19 = sub_10002663C(0, &qword_10006D0D0, UICollectionViewListCell_ptr);
  UICollectionView.SupplementaryRegistration.init(elementKind:handler:)(v16, v18, sub_1000219EC, 0, v19);
  v20 = v12;
  v45 = v12;
  UICollectionView.CellRegistration.init(handler:)(sub_100021C74, 0, v19, &type metadata for String);
  v21 = v52;
  UICollectionView.CellRegistration.init(handler:)(sub_100021DEC, 0, v19, &type metadata for String);
  v22 = swift_allocObject(&unk_1000630D0, 24, 7);
  swift_unknownObjectWeakInit(v22 + 16, v2);
  v23 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v24 = v44;
  v23(v44, v20, v3);
  v25 = v47;
  v23(v47, v21, v3);
  v26 = *(unsigned __int8 *)(v4 + 80);
  v43 = v4;
  v27 = (v26 + 24) & ~v26;
  v28 = (v5 + v26 + v27) & ~v26;
  v29 = swift_allocObject(&unk_1000630F8, v28 + v5, v26 | 7);
  *(_QWORD *)(v29 + 16) = v22;
  v30 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  v30(v29 + v27, v24, v3);
  v30(v29 + v28, v25, v3);
  v31 = objc_allocWithZone((Class)sub_100011254(&qword_10006D0D8));
  v32 = UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)(v51, sub_100026730, v29);
  v33 = v48;
  v34 = v49;
  v35 = v46;
  v36 = v50;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v49, v46, v50);
  v37 = *(unsigned __int8 *)(v33 + 80);
  v38 = v33;
  v39 = (v37 + 16) & ~v37;
  v40 = swift_allocObject(&unk_100063120, v39 + v13, v37 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v40 + v39, v34, v36);
  dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter(sub_100026804, v40);
  v41 = *(void (**)(char *, uint64_t))(v43 + 8);
  v41(v52, v3);
  v41(v45, v3);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v36);
  return v32;
}

uint64_t sub_1000219EC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void (*v19)(_QWORD *, _QWORD);
  _QWORD *v20;
  UIAccessibilityTraits v21;
  unint64_t v22;
  UIAccessibilityTraits v23;
  _QWORD v26[5];

  v2 = type metadata accessor for UIListContentConfiguration(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v26[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  UICollectionViewListCell.defaultContentConfiguration()(v4);
  v7 = type metadata accessor for CRLSEExtensionContextManager(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v7);
  v9 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v10 = String._bridgeToObjectiveC()();
  v11 = String._bridgeToObjectiveC()();
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v9, "localizedStringForKey:value:table:", v10, v11, v12);

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;

  UIListContentConfiguration.text.setter(v14, v16);
  v17 = (void *)objc_opt_self(UIFont);
  if (qword_10006C548 != -1)
    swift_once(&qword_10006C548, sub_10001D030);
  v18 = objc_msgSend(v17, "preferredFontForTextStyle:", qword_10006CF10);
  v19 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v26);
  UIListContentConfiguration.TextProperties.font.setter(v18);
  v19(v26, 0);
  v26[3] = v2;
  v26[4] = &protocol witness table for UIListContentConfiguration;
  v20 = sub_10001CE80(v26);
  (*(void (**)(_QWORD *, char *, uint64_t))(v3 + 16))(v20, v6, v2);
  UICollectionViewCell.contentConfiguration.setter(v26);
  v21 = UIAccessibilityTraitHeader;
  v22 = (unint64_t)objc_msgSend(a1, "accessibilityTraits");
  if ((v21 & ~v22) != 0)
    v23 = v21;
  else
    v23 = 0;
  objc_msgSend(a1, "setAccessibilityTraits:", v23 | v22);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_100021C74(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *, _QWORD);
  void (*v12)(_QWORD *, _QWORD);
  id v13;
  void (*v14)(_QWORD *, _QWORD);
  _QWORD *v15;
  _QWORD v18[5];

  v4 = type metadata accessor for UIListContentConfiguration(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a3;
  v10 = a3[1];
  UICollectionViewListCell.defaultContentConfiguration()(v6);
  swift_bridgeObjectRetain(v10);
  UIListContentConfiguration.text.setter(v9, v10);
  v11 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v18);
  UIListContentConfiguration.TextProperties.numberOfLines.setter(1);
  v11(v18, 0);
  v12 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v18);
  UIListContentConfiguration.TextProperties.showsExpansionTextWhenTruncated.setter(1);
  v12(v18, 0);
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  v14 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v18);
  UIListContentConfiguration.TextProperties.color.setter(v13);
  v14(v18, 0);
  v18[3] = v4;
  v18[4] = &protocol witness table for UIListContentConfiguration;
  v15 = sub_10001CE80(v18);
  (*(void (**)(_QWORD *, char *, uint64_t))(v5 + 16))(v15, v8, v4);
  UICollectionViewCell.contentConfiguration.setter(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_100021DEC(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void (*v13)(_QWORD *, _QWORD);
  _QWORD *v14;
  UIAccessibilityTraits v15;
  unint64_t v16;
  UIAccessibilityTraits v17;
  _QWORD v20[5];

  v5 = type metadata accessor for UIListContentConfiguration(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a3;
  v11 = a3[1];
  UICollectionViewListCell.defaultContentConfiguration()(v7);
  swift_bridgeObjectRetain(v11);
  UIListContentConfiguration.text.setter(v10, v11);
  v12 = objc_msgSend((id)objc_opt_self(UIColor), "linkColor");
  v13 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v20);
  UIListContentConfiguration.TextProperties.color.setter(v12);
  v13(v20, 0);
  v20[3] = v5;
  v20[4] = &protocol witness table for UIListContentConfiguration;
  v14 = sub_10001CE80(v20);
  (*(void (**)(_QWORD *, char *, uint64_t))(v6 + 16))(v14, v9, v5);
  UICollectionViewCell.contentConfiguration.setter(v20);
  v15 = UIAccessibilityTraitButton;
  v16 = (unint64_t)objc_msgSend(a1, "accessibilityTraits");
  if ((v15 & ~v16) != 0)
    v17 = v15;
  else
    v17 = 0;
  objc_msgSend(a1, "setAccessibilityTraits:", v17 | v16);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

id sub_100021F4C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t Strong;
  void *v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52[24];

  v48 = a6;
  v49 = a1;
  v42 = a5;
  v9 = sub_100011254(&qword_10006D0E0);
  __chkstk_darwin(v9);
  v45 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions(0);
  v46 = *(_QWORD *)(v11 - 8);
  v47 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UICellAccessory.DisplayedState(0);
  v43 = *(_QWORD *)(v14 - 8);
  v44 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for IndexPath(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a3;
  v22 = a3[1];
  a4 += 16;
  swift_beginAccess(a4, v52, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a4);
  if (Strong)
  {
    v24 = (void *)Strong;
    v25 = sub_10001D4D0();
    v26 = *((_QWORD *)v25 + 2);
    swift_bridgeObjectRelease(v25);
    v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, a2, v17);
    if (v26 < 2)
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
    else
    {
      v28 = IndexPath.item.getter(v27);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      if (!v28)
      {
        v50 = v21;
        v51 = v22;
        v29 = sub_10002663C(0, &qword_10006D0D0, UICollectionViewListCell_ptr);
        swift_bridgeObjectRetain(v22);
        v30 = (void *)UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)(v42, a2, &v50, v29, &type metadata for String);
        swift_bridgeObjectRelease(v22);
        v31 = sub_100011254(&qword_10006D0E8);
        v32 = *(_QWORD *)(type metadata accessor for UICellAccessory(0) - 8);
        v33 = swift_allocObject(v31, ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(_QWORD *)(v32 + 72), *(unsigned __int8 *)(v32 + 80) | 7);
        *(_OWORD *)(v33 + 16) = xmmword_100052780;
        v35 = v43;
        v34 = v44;
        (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v16, enum case for UICellAccessory.DisplayedState.always(_:), v44);
        v36 = type metadata accessor for UICellAccessory.LayoutDimension(0);
        v37 = v45;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v45, 1, 1, v36);
        v38 = v30;
        UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2, v37, 0);
        static UICellAccessory.disclosureIndicator(displayed:options:)(v16, v13);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v13, v47);
        (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v34);
        UICollectionViewListCell.accessories.setter(v33);

LABEL_8:
        return v38;
      }
    }
    v50 = v21;
    v51 = v22;
    v39 = sub_10002663C(0, &qword_10006D0D0, UICollectionViewListCell_ptr);
    swift_bridgeObjectRetain(v22);
    v38 = (id)UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)(v48, a2, &v50, v39, &type metadata for String);
    swift_bridgeObjectRelease(v22);
    goto LABEL_8;
  }
  return 0;
}

uint64_t sub_1000222B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v15;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(UICollectionElementKindSectionHeader);
  if (v9 == a2 && v10 == a3)
  {
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v12 = v10;
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, v9, v10, 0);
    swift_bridgeObjectRelease(v12);
    if ((v13 & 1) == 0)
      return 0;
  }
  v15 = sub_10002663C(0, &qword_10006D0D0, UICollectionViewListCell_ptr);
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(a5, a4, v15);
}

id sub_100022378()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id result;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UICollectionLayoutListConfiguration.Appearance(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UICollectionLayoutListConfiguration(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for UICollectionLayoutListConfiguration.Appearance.insetGrouped(_:), v6);
  UICollectionLayoutListConfiguration.init(appearance:)(v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for UICollectionLayoutListConfiguration.HeaderMode.supplementary(_:), v2);
  UICollectionLayoutListConfiguration.headerMode.setter(v5);
  sub_10002663C(0, &qword_10006D0B8, UICollectionViewCompositionalLayout_ptr);
  v14 = (void *)static UICollectionViewCompositionalLayout.list(using:)(v13);
  result = objc_msgSend(v1, "view");
  if (result)
  {
    v16 = result;
    objc_msgSend(result, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = objc_msgSend(objc_allocWithZone((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v14, v18, v20, v22, v24);
    objc_msgSend(v25, "setCollectionViewLayout:", v14);
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v25, "setScrollEnabled:", 0);
    objc_msgSend(v25, "setDelegate:", v1);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000225C0(unint64_t a1)
{
  __objc2_meth *v1;
  __objc2_meth *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSString v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t ObjCClassFromMetadata;
  id v27;
  NSString v28;
  NSString v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v42;
  uint64_t v43;
  uint64_t v44;
  NSString v45;
  void *v46;
  id v47;
  Class isa;
  __objc2_meth *v49;
  id v50;

  v2 = v1;
  v3 = a1;
  v4 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_18:
    if (v3 < 0)
      v17 = v3;
    else
      v17 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v5 = _CocoaArrayWrapper.endIndex.getter(v17);
    if (v5)
      goto LABEL_3;
LABEL_22:
    swift_bridgeObjectRelease(v3);
    goto LABEL_23;
  }
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (!v5)
    goto LABEL_22;
LABEL_3:
  v49 = v2;
  v6 = 4;
  v2 = &stru_10006A000;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, v3);
    else
      v7 = *(id *)(v3 + 8 * v6);
    v8 = v7;
    v9 = v6 - 3;
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    v10 = objc_msgSend(v7, "attributedText");
    if (v10)
      break;
LABEL_4:

    ++v6;
    if (v9 == v5)
    {
      swift_bridgeObjectRelease(v3);
      v2 = v49;
      goto LABEL_23;
    }
  }
  v11 = v10;
  if ((uint64_t)objc_msgSend(v10, "length") <= 0)
  {

    goto LABEL_4;
  }
  v2 = v49;
  v12 = *(char **)((char *)&v49->name
                 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent);
  if (!v12)
    goto LABEL_47;
  v13 = v12;
  swift_bridgeObjectRelease(v3);
  v14 = objc_msgSend(v11, "string");
  if (!v14)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v16 = v15;
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
  }
  objc_msgSend(v13, "setText:", v14);

LABEL_23:
  sub_100022A68(v3);
  v50 = v18;
  if (v4)
  {
    if (v3 < 0)
      v20 = v3;
    else
      v20 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v19 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v3);
    if (v5)
      goto LABEL_30;
LABEL_35:
    while (1)
    {
      v23 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
      v24 = *(char **)((char *)&v2->name
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView);
      if (!v24)
        break;
      objc_msgSend(v24, "setIsAccessibilityElement:", 1);
      v25 = type metadata accessor for CRLSEExtensionContextManager(0);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v25);
      v27 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
      v28 = String._bridgeToObjectiveC()();
      v29 = String._bridgeToObjectiveC()();
      v30 = String._bridgeToObjectiveC()();
      v31 = objc_msgSend(v27, "localizedStringForKey:value:table:", v28, v29, v30);

      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      v34 = v33;

      v35 = sub_10002B654(v3);
      if (v36)
      {
        v37 = *(char **)((char *)&v2->name + v23);
        if (!v37)
          goto LABEL_46;
        v38 = v35;
        v39 = v36;
        v40 = sub_100011254((uint64_t *)&unk_10006D060);
        v41 = swift_allocObject(v40, 72, 7);
        *(_OWORD *)(v41 + 16) = xmmword_100052780;
        *(_QWORD *)(v41 + 56) = &type metadata for String;
        *(_QWORD *)(v41 + 64) = sub_10002646C();
        *(_QWORD *)(v41 + 32) = v38;
        *(_QWORD *)(v41 + 40) = v39;
        v3 = v37;
        static String.localizedStringWithFormat(_:_:)(v32, v34, v41, v42);
        v44 = v43;
        swift_bridgeObjectRelease(v41);
        swift_bridgeObjectRelease(v34);
        v45 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v44);
        objc_msgSend((id)v3, "setAccessibilityLabel:", v45);

        v46 = *(char **)((char *)&v2->name + v23);
        if (v46)
        {
LABEL_39:
          v47 = v46;
          isa = Array._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v47, "setAccessibilityElements:", isa);

LABEL_40:
          sub_100023694(v50);

          return;
        }
      }
      else
      {
        swift_bridgeObjectRelease(v34);
        v46 = *(char **)((char *)&v2->name + v23);
        if (v46)
          goto LABEL_39;
      }
      __break(1u);
LABEL_43:
      swift_bridgeObjectRetain(v3);
      v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v3);
      swift_bridgeObjectRelease(v3);
LABEL_34:
      v22 = sub_10002A2C4();

      if (v22 == 2)
        goto LABEL_40;
    }
  }
  else
  {
    v19 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      goto LABEL_35;
LABEL_30:
    if (v19 > 2)
      goto LABEL_35;
    if ((v3 & 0xC000000000000001) != 0)
      goto LABEL_43;
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v21 = *(id *)(v3 + 32);
      goto LABEL_34;
    }
    __break(1u);
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
}

void sub_100022A68(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
    if (v5 >= 2)
      goto LABEL_3;
    swift_bridgeObjectRetain(a1);
    v2 = (void *)_CocoaArrayWrapper.endIndex.getter(v4);
    if (!v2)
      goto LABEL_9;
  }
  else
  {
    v2 = *(void **)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v2 > 1)
    {
LABEL_3:
      sub_100022D5C(a1);
      return;
    }
    swift_bridgeObjectRetain(a1);
    if (!v2)
      goto LABEL_9;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    goto LABEL_8;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v3 = *(id *)(a1 + 32);
LABEL_8:
    v2 = v3;
LABEL_9:
    swift_bridgeObjectRelease(a1);
    sub_100022B64(v2, 0);

    return;
  }
  __break(1u);
}

uint64_t sub_100022B64(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t result;
  void *v20;
  id v21;
  uint64_t v22;

  v3 = v2;
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return 0;
  v13 = a1;
  v14 = sub_10002A2C4();
  if (!v14)
  {
    v15 = sub_100023AA8(v13, a2 & 1);
    goto LABEL_9;
  }
  if (v14 == 1)
  {
    v15 = sub_100023FDC(v13, a2 & 1);
LABEL_9:
    v18 = v15;

    return (uint64_t)v18;
  }
  v16 = objc_msgSend(v13, "url");
  if (v16)
  {
    v17 = v16;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v16);

    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
    {
      sub_100019B80((uint64_t)v12, &qword_10006D050);
      v15 = sub_100025950(v13);
      goto LABEL_9;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  result = sub_100019B80((uint64_t)v12, &qword_10006D050);
  v20 = *(void **)(v3 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent);
  if (v20)
  {
    v21 = v20;
    objc_msgSend(v21, "setHidden:", 0);

    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_100022D5C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  unint64_t v3;
  __objc2_meth *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  unsigned __int8 v41;
  double v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  double v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  void *v74;
  Class isa;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t j;
  uint64_t v79;
  __int128 v80;
  unint64_t v81;
  uint64_t v82;
  id v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;

  v6 = a1;
  v7 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v34 = a1;
    else
      v34 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v35 = _CocoaArrayWrapper.endIndex.getter(v34);
    swift_bridgeObjectRetain(v6);
    v12 = _CocoaArrayWrapper.endIndex.getter(v34);
    result = swift_bridgeObjectRelease(v6);
    if (v12 < 0)
    {
      __break(1u);
      return result;
    }
    if (v35 >= 3)
      v37 = 3;
    else
      v37 = v35;
    if (v35 >= 0)
      v8 = v37;
    else
      v8 = 3;
    swift_bridgeObjectRetain(v6);
    v20 = (_UNKNOWN **)_CocoaArrayWrapper.endIndex.getter(v34);
    swift_bridgeObjectRelease(v6);
    if ((uint64_t)v20 < v8)
    {
      __break(1u);
      goto LABEL_43;
    }
  }
  else
  {
    if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3)
      v8 = 3;
    else
      v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
  }
  if ((v6 & 0xC000000000000001) != 0 && v8)
  {
    sub_10002663C(0, &qword_10006D088, &off_100060BE8);
    v9 = 0;
    do
    {
      v10 = v9 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v9);
      v9 = v10;
    }
    while (v8 != v10);
  }
  if (v7)
  {
    if (v6 < 0)
      v13 = v6;
    else
      v13 = v6 & 0xFFFFFFFFFFFFFF8;
    v14 = swift_bridgeObjectRetain(v6);
    v15 = _CocoaArrayWrapper.subscript.getter(0, v8, v13, v14);
    v12 = v16;
    v2 = v17;
    v3 = v18;
    v19 = v6;
    v11 = v15;
    swift_bridgeObjectRelease_n(v19, 2);
  }
  else
  {
    v2 = 0;
    v11 = v6 & 0xFFFFFFFFFFFFFF8;
    v12 = v11 + 32;
    v3 = (2 * v8) | 1;
  }
  v20 = &_s10Foundation12CharacterSetV22whitespacesAndNewlinesACvgZ_ptr;
  v4 = &stru_10006A000;
  v5 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setAutoresizesSubviews:", 1);
  v7 = v1;
  v79 = v11;
  v21 = v11;
  v6 = 0;
  sub_100025CBC(v21, v12, v2, v3, v7);
  v8 = v22;

  v86 = v8;
  if (!((unint64_t)v8 >> 62))
  {
    v23 = *(id *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_18;
  }
LABEL_43:
  if (v8 < 0)
    v38 = v8;
  else
    v38 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v23 = (id)_CocoaArrayWrapper.endIndex.getter(v38);
  swift_bridgeObjectRelease(v8);
LABEL_18:
  v24 = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v24 < 2 || (uint64_t)v23 >= v24)
    goto LABEL_23;
  v25 = objc_msgSend(objc_allocWithZone((Class)v20[439]), v4[156].name);
  v26 = objc_msgSend((id)objc_opt_self(UIColor), "systemWhiteColor");
  objc_msgSend(v25, "setBackgroundColor:", v26);

  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (uint64_t)v25;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v28 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v27 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v28 >= v27 >> 1)
    goto LABEL_74;
  while (1)
  {
    v29 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v12);
    specialized Array._endMutation()(v29);

    v8 = v86;
LABEL_23:
    v23 = (id)v7;
    swift_bridgeObjectRetain(v8);
    v7 = (uint64_t)sub_100025F84(v30);
    swift_bridgeObjectRelease(v8);

    if ((unint64_t)v7 >> 62)
    {
LABEL_48:
      if (v7 < 0)
        v39 = v7;
      else
        v39 = v7 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v7);
      v28 = _CocoaArrayWrapper.endIndex.getter(v39);
      if (!v28)
        goto LABEL_52;
    }
    else
    {
      v28 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v7);
      if (!v28)
        goto LABEL_52;
    }
    if (v28 >= 1)
      break;
    __break(1u);
LABEL_74:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
  }
  for (i = 0; i != v28; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0)
      v32 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v7);
    else
      v32 = *(id *)(v7 + 8 * i + 32);
    v33 = v32;
    objc_msgSend(v5, "insertSubview:atIndex:", v32, 0);

  }
LABEL_52:
  swift_bridgeObjectRelease_n(v7, 2);
  v40 = objc_msgSend(v23, "traitCollection");
  v41 = objc_msgSend(v40, "crl_isCompactWidth");

  if ((v41 & 1) != 0)
  {
    v42 = 184.0;
  }
  else if (objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI"))
  {
    v42 = 184.0;
  }
  else
  {
    v42 = 300.0;
  }
  v82 = sub_100011254(&qword_10006D670);
  v43 = swift_allocObject(v82, 48, 7);
  *(_OWORD *)(v43 + 16) = xmmword_100052790;
  v44 = objc_msgSend(v5, "widthAnchor");
  v45 = objc_msgSend(v44, "constraintEqualToConstant:", v42);

  *(_QWORD *)(v43 + 32) = v45;
  v46 = objc_msgSend(v5, "heightAnchor");
  v47 = objc_msgSend(v5, "widthAnchor");
  v48 = objc_msgSend(v46, "constraintEqualToAnchor:", v47);

  *(_QWORD *)(v43 + 40) = v48;
  specialized Array._endMutation()(v49);
  v50 = &v76;
  v51 = (_QWORD *)v43;
  v85 = _swiftEmptyArrayStorage;
  if ((unint64_t)v8 >> 62)
    goto LABEL_67;
  v52 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n(v8, 2);
  for (j = v6; v52; j = v6)
  {
    v76 = v50;
    v77 = v51;
    v83 = v5;
    v53 = v8;
    v81 = v8 & 0xC000000000000001;
    v8 = 4;
    v80 = xmmword_1000527A0;
    while (1)
    {
      v54 = v8 - 4;
      v55 = v81 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, v53) : *(id *)(v53 + 8 * v8);
      v56 = v55;
      v6 = v8 - 3;
      if (__OFADD__(v54, 1))
        break;
      v57 = v42 + (double)v54 * -24.0;
      v58 = swift_allocObject(v82, 56, 7);
      *(_OWORD *)(v58 + 16) = v80;
      v51 = (_QWORD *)v52;
      v59 = objc_msgSend(v56, "widthAnchor", v76);
      v60 = objc_msgSend(v59, "constraintEqualToConstant:", v57);

      *(_QWORD *)(v58 + 32) = v60;
      v61 = objc_msgSend(v56, "heightAnchor");
      v62 = objc_msgSend(v61, "constraintEqualToConstant:", v57);

      *(_QWORD *)(v58 + 40) = v62;
      v63 = objc_msgSend(v56, "centerXAnchor");
      v5 = objc_msgSend(v83, "centerXAnchor");
      v64 = objc_msgSend(v63, "constraintEqualToAnchor:", v5);

      v52 = (uint64_t)v51;
      *(_QWORD *)(v58 + 48) = v64;
      v84 = (_QWORD *)v58;
      specialized Array._endMutation()(v65);
      v50 = v84;

      sub_10004476C((uint64_t)v50);
      ++v8;
      if ((_QWORD *)v6 == v51)
      {
        v8 = v53;
        swift_bridgeObjectRelease(v53);
        v66 = v85;
        v5 = v83;
        v51 = v77;
        goto LABEL_72;
      }
    }
    __break(1u);
LABEL_67:
    if (v8 < 0)
      v67 = v8;
    else
      v67 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v8, 2);
    v52 = _CocoaArrayWrapper.endIndex.getter(v67);
  }
  swift_bridgeObjectRelease(v8);
  v66 = _swiftEmptyArrayStorage;
LABEL_72:
  swift_bridgeObjectRelease(v8);
  v68 = objc_msgSend(v5, "subviews");
  v69 = sub_10002663C(0, &qword_10006D090, UIView_ptr);
  v70 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v68, v69);

  __chkstk_darwin(v71);
  *(&v76 - 2) = v5;
  v72 = sub_10002613C(v70, (uint64_t (*)(unint64_t, id))sub_100026538);
  swift_bridgeObjectRelease(v70);
  swift_bridgeObjectRelease(v86);
  v85 = v51;
  sub_10004476C((uint64_t)v66);
  sub_10004476C((uint64_t)v72);
  v73 = v85;
  v74 = (void *)objc_opt_self(NSLayoutConstraint);
  sub_10002663C(0, (unint64_t *)&qword_10006D080, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v73);
  objc_msgSend(v74, "activateConstraints:", isa);

  swift_unknownObjectRelease(v79);
  return (uint64_t)v5;
}

id sub_1000235F4(uint64_t a1, id a2, void *a3)
{
  double v4;
  id v5;
  id v6;
  id v7;

  v4 = (double)a1 * 8.0;
  v5 = objc_msgSend(a2, "topAnchor");
  v6 = objc_msgSend(a3, "topAnchor");
  v7 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v4);

  return v7;
}

void sub_100023694(void *a1)
{
  char *v1;
  void *v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  double v10;
  unsigned int v11;
  id v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  double v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  Class isa;
  void *v38;
  id v39;
  char *v40;
  id v41;

  v2 = v1;
  v4 = *(void **)((char *)v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator);
  if (!v4)
  {
    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v4, "stopAnimating");
  if (a1)
  {
    v5 = *(void **)((char *)v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView);
    if (v5)
    {
      v40 = (char *)OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
      v6 = a1;
      objc_msgSend(v5, "addSubview:", v6);
      v7 = objc_msgSend(v6, "widthAnchor");
      v8 = objc_msgSend(v2, "traitCollection");
      v9 = objc_msgSend(v8, "crl_isCompactWidth");

      if ((v9 & 1) != 0)
      {
        v10 = 326.0;
      }
      else
      {
        v11 = objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI");
        v10 = 624.0;
        if (v11)
          v10 = 326.0;
      }
      v12 = objc_msgSend(v7, "constraintLessThanOrEqualToConstant:", v10);

      v13 = objc_msgSend(v6, "heightAnchor");
      v14 = objc_msgSend(v2, "traitCollection");
      v15 = objc_msgSend(v14, "crl_isCompactWidth");

      if ((v15 & 1) != 0)
      {
        v16 = 220.0;
      }
      else
      {
        v17 = objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI");
        v16 = 360.0;
        if (v17)
          v16 = 220.0;
      }
      v18 = objc_msgSend(v13, "constraintLessThanOrEqualToConstant:", v16);

      v19 = *(void **)((char *)v2
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint);
      *(_QWORD *)((char *)v2
                + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint) = v12;
      v39 = v12;

      v20 = *(void **)((char *)v2
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint);
      *(_QWORD *)((char *)v2
                + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint) = v18;
      v21 = v18;

      v22 = sub_100011254(&qword_10006D670);
      v23 = swift_allocObject(v22, 64, 7);
      *(_OWORD *)(v23 + 16) = xmmword_1000527B0;
      v24 = objc_msgSend(v6, "topAnchor");
      v25 = *(void **)&v40[(_QWORD)v2];
      if (v25)
      {
        v26 = objc_msgSend(v25, "topAnchor");
        v27 = objc_msgSend(v24, "constraintEqualToAnchor:", v26);

        *(_QWORD *)(v23 + 32) = v27;
        v28 = objc_msgSend(v6, "centerXAnchor");
        v29 = *(void **)&v40[(_QWORD)v2];
        if (v29)
        {
          v30 = v28;
          v31 = (void *)objc_opt_self(NSLayoutConstraint);
          v32 = objc_msgSend(v29, "centerXAnchor");
          v33 = objc_msgSend(v30, "constraintEqualToAnchor:", v32);

          *(_QWORD *)(v23 + 40) = v33;
          *(_QWORD *)(v23 + 48) = v39;
          *(_QWORD *)(v23 + 56) = v21;
          specialized Array._endMutation()(v34);
          v35 = v23;
          sub_10002663C(0, (unint64_t *)&qword_10006D080, NSLayoutConstraint_ptr);
          v36 = v39;
          v41 = v21;
          isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v35);
          objc_msgSend(v31, "activateConstraints:", isa);

          v38 = *(void **)((char *)v2
                         + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent);
          if (v38)
          {
            objc_msgSend(v38, "setHidden:", 1);

            return;
          }
          goto LABEL_21;
        }
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        return;
      }
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

void *sub_100023AA8(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSString v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v33;

  v4 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v33 - v12;
  v14 = objc_msgSend(a1, "url");
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  v15 = v14;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v14);

  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_100019B80((uint64_t)v6, &qword_10006D050);
    goto LABEL_7;
  }
  v17 = ((uint64_t (*)(char *, char *, uint64_t))v16)(v13, v6, v7);
  URL.path.getter(v17);
  v19 = v18;
  v20 = objc_allocWithZone((Class)UIImage);
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  v22 = objc_msgSend(v20, "initWithContentsOfFile:", v21);

  if (v22)
  {
    sub_100023D5C(v22);
    v24 = v23;

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
LABEL_7:
  v25 = objc_msgSend(a1, "image");
  if (v25)
  {
    v26 = v25;
    sub_100023D5C(v25);
    v24 = v27;

  }
  else
  {
    v24 = 0;
  }
LABEL_10:
  v28 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v24);
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if ((a2 & 1) != 0)
      v30 = 2;
    else
      v30 = 1;
    v31 = v29;
    objc_msgSend(v31, "setContentMode:", v30);

  }
  return v29;
}

void sub_100023D5C(void *a1)
{
  void *v1;
  id v3;
  unsigned __int8 v4;
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;

  v3 = objc_msgSend(v1, "traitCollection");
  v4 = objc_msgSend(v3, "crl_isCompactWidth");

  if ((v4 & 1) != 0)
  {
    v5 = 220.0;
    v6 = 326.0;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(UIDevice), "crl_landscapePhoneUI");
    if (v7)
      v6 = 326.0;
    else
      v6 = 624.0;
    if (v7)
      v5 = 220.0;
    else
      v5 = 360.0;
  }
  objc_msgSend(a1, "size");
  if (v6 / v5 >= v8 / v9)
  {
    if (v8 / v9 < v6 / v5)
      v6 = v8 * (v5 / v9);
  }
  else
  {
    v5 = v9 * (v6 / v8);
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", v6, v5);
  v11 = swift_allocObject(&unk_100062FB8, 40, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(double *)(v11 + 24) = v6;
  *(double *)(v11 + 32) = v5;
  v12 = swift_allocObject(&unk_100062FE0, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_1000264D4;
  *(_QWORD *)(v12 + 24) = v11;
  v16[4] = sub_100026500;
  v17 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100023FA8;
  v16[3] = &unk_100062FF8;
  v13 = _Block_copy(v16);
  v14 = v17;
  v15 = a1;
  swift_retain(v12);
  objc_msgSend(v10, "imageWithActions:", v13, swift_release(v14).n128_f64[0]);

  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation(v12, "", 107, 612, 31, 1);
  swift_release(v11);
  swift_release(v12);
  if ((v10 & 1) != 0)
    __break(1u);
}

void sub_100023FA8(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

char *sub_100023FDC(void *a1, int a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  void (*v17)(char *, char *, uint64_t);
  NSURL *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  CMTimeScale timescale;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v26;
  objc_class *v27;
  Class isa;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  char *v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  Class v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t inited;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  char v84[8];
  uint64_t v85;
  char v86[8];
  char v87[8];
  uint64_t v88;
  uint64_t v89;
  char v90[16];
  id v91;
  char v92[112];
  CMTime v93;

  v5 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v5);
  v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v79 - v13;
  v15 = objc_msgSend(a1, "url");
  if (v15)
  {
    v16 = v15;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v15);

    v17 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v17(v7, v12, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v82 = v2;
      LODWORD(v83) = a2;
      v17(v14, v7, v8);
      URL._bridgeToObjectiveC()(v18);
      v20 = v19;
      v21 = objc_msgSend((id)objc_opt_self(AVAsset), "assetWithURL:", v19);

      v22 = objc_msgSend(objc_allocWithZone((Class)AVAssetImageGenerator), "initWithAsset:", v21);
      timescale = kCMTimeZero.timescale;
      flags = kCMTimeZero.flags;
      epoch = kCMTimeZero.epoch;
      v93.value = kCMTimeZero.value;
      v93.timescale = timescale;
      v93.flags = flags;
      v93.epoch = epoch;
      objc_msgSend(v22, "setRequestedTimeToleranceAfter:", &v93);
      v93.value = kCMTimeZero.value;
      v93.timescale = timescale;
      v93.flags = flags;
      v26 = v21;
      v93.epoch = epoch;
      objc_msgSend(v22, "setRequestedTimeToleranceBefore:", &v93);
      objc_msgSend(v22, "setAppliesPreferredTrackTransform:", 1);
      v27 = (objc_class *)objc_msgSend(v21, "commonMetadata");
      isa = v27;
      if (!v27)
      {
        v29 = sub_10002663C(0, &qword_10006D058, AVMetadataItem_ptr);
        v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0, v29);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v30);
      }
      v31 = sub_10002663C(0, &qword_10006D058, AVMetadataItem_ptr);
      v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v31);
      if (objc_msgSend(v26, "crl_containsVideoTracks"))
      {

        CMTimeMake(&v93, 0, 1);
        v91 = 0;
        v33 = objc_msgSend(v22, "copyCGImageAtTime:actualTime:error:", &v93, 0, &v91);
        v34 = v91;
        if (v33)
        {
          v35 = v33;
          v36 = objc_allocWithZone((Class)UIImage);
          v37 = v34;
          v38 = objc_msgSend(v36, "initWithCGImage:", v35);

          if (!v38)
            goto LABEL_30;
LABEL_18:
          v54 = v38;
          swift_bridgeObjectRelease(v32);
          sub_100023D5C(v54);
          v56 = v55;
          v39 = (char *)objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v55);

          objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          if ((v83 & 1) != 0)
            v57 = 2;
          else
            v57 = 1;
          objc_msgSend(v39, "setContentMode:", v57);

          goto LABEL_31;
        }
        v80 = v32;
        v81 = v26;
        v58 = v91;
        v40 = (id)_convertNSErrorToError(_:)(v34);

        swift_willThrow(v59);
        if (qword_10006C648 == -1)
          goto LABEL_23;
        goto LABEL_35;
      }
      v40 = objc_msgSend((id)objc_opt_self(AVMetadataItem), "metadataItemsFromArray:filteredByIdentifier:", isa, AVMetadataCommonIdentifierArtwork);

      v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v40, v31);
      if ((unint64_t)v41 >> 62)
      {
        if (v41 < 0)
          v75 = v41;
        else
          v75 = v41 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v41);
        v76 = _CocoaArrayWrapper.endIndex.getter(v75);
        swift_bridgeObjectRelease(v41);
        if (v76)
        {
LABEL_13:
          if ((v41 & 0xC000000000000001) != 0)
          {
            v42 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v41);
          }
          else
          {
            if (!*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_35:
              swift_once(&qword_10006C648, sub_10003EE80);
LABEL_23:
              swift_beginAccess(&static OS_os_log.crlSharingExtension, &v93, 0, 0);
              v60 = (void *)static OS_os_log.crlSharingExtension;
              v61 = sub_100011254((uint64_t *)&unk_10006D060);
              inited = swift_initStackObject(v61, v92);
              *(_OWORD *)(inited + 16) = xmmword_100052750;
              swift_getErrorValue(v40, v90, v87);
              v82 = v40;
              v63 = v88;
              v64 = v89;
              v83 = v60;
              v65 = Error.publicDescription.getter(v63, v64);
              v67 = v66;
              *(_QWORD *)(inited + 56) = &type metadata for String;
              v68 = sub_10002646C();
              *(_QWORD *)(inited + 64) = v68;
              *(_QWORD *)(inited + 32) = v65;
              *(_QWORD *)(inited + 40) = v67;
              v69 = v82;
              swift_getErrorValue(v82, v86, v84);
              v70 = Error.fullDescription.getter(v85);
              *(_QWORD *)(inited + 96) = &type metadata for String;
              *(_QWORD *)(inited + 104) = v68;
              *(_QWORD *)(inited + 72) = v70;
              *(_QWORD *)(inited + 80) = v71;
              v72 = static os_log_type_t.error.getter();
              v73 = (void *)v83;
              sub_100043700(v83, &_mh_execute_header, v72, "Error creating video thumbnail : %{public}@ <%@>", 48, 2, inited);
              swift_setDeallocating(inited);
              v74 = sub_100011254((uint64_t *)&unk_10006D070);
              swift_arrayDestroy(inited + 32, 2, v74);

              swift_errorRelease(v69);
              v26 = v81;
              v32 = v80;
              goto LABEL_30;
            }
            v42 = *(id *)(v41 + 32);
          }
          v43 = v42;
          swift_bridgeObjectRelease(v41);
          v44 = objc_msgSend(v43, "dataValue");
          if (v44)
          {
            v45 = v44;
            v46 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v44);
            v80 = v32;
            v47 = v46;
            v81 = v26;
            v49 = v48;

            v50 = objc_allocWithZone((Class)UIImage);
            v51 = Data._bridgeToObjectiveC()().super.isa;
            v38 = objc_msgSend(v50, "initWithData:", v51);
            v52 = v47;
            v32 = v80;
            v53 = v49;
            v26 = v81;
            sub_100026428(v52, v53);

            if (v38)
              goto LABEL_18;
          }
          else
          {

          }
LABEL_30:
          (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
          v77 = objc_allocWithZone((Class)type metadata accessor for CRLSEAudioPreviewView(0));
          v39 = sub_100028A2C(v32, v12, 220.0, 220.0);

LABEL_31:
          (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
          return v39;
        }
      }
      else if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_13;
      }
      swift_bridgeObjectRelease(v41);
      goto LABEL_30;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_100019B80((uint64_t)v7, &qword_10006D050);
  return 0;
}

uint64_t sub_1000247C4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  __n128 v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  char v41[8];
  uint64_t v42;
  char v43[8];
  char v44[8];
  uint64_t v45;
  uint64_t v46;
  char v47[8];
  char v48[112];
  _QWORD aBlock[5];
  uint64_t v50;

  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v41[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v10 - 8);
  result = __chkstk_darwin(v10);
  v14 = &v41[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_10006C648 != -1)
      swift_once(&qword_10006C648, sub_10003EE80);
    swift_beginAccess(&static OS_os_log.crlSharingExtension, aBlock, 0, 0);
    v15 = (void *)static OS_os_log.crlSharingExtension;
    v16 = sub_100011254((uint64_t *)&unk_10006D060);
    inited = swift_initStackObject(v16, v48);
    *(_OWORD *)(inited + 16) = xmmword_100052750;
    swift_getErrorValue(a2, v47, v44);
    v18 = v45;
    v19 = v46;
    v20 = v15;
    v21 = Error.publicDescription.getter(v18, v19);
    v23 = v22;
    *(_QWORD *)(inited + 56) = &type metadata for String;
    v24 = sub_10002646C();
    *(_QWORD *)(inited + 64) = v24;
    *(_QWORD *)(inited + 32) = v21;
    *(_QWORD *)(inited + 40) = v23;
    swift_getErrorValue(a2, v43, v41);
    v25 = Error.fullDescription.getter(v42);
    *(_QWORD *)(inited + 96) = &type metadata for String;
    *(_QWORD *)(inited + 104) = v24;
    *(_QWORD *)(inited + 72) = v25;
    *(_QWORD *)(inited + 80) = v26;
    v27 = static os_log_type_t.error.getter();
    sub_100043700((uint64_t)v20, &_mh_execute_header, v27, "Error loading link metadata: %{public}@ <%@>", 44, 2, inited);
    swift_setDeallocating(inited);
    v28 = sub_100011254((uint64_t *)&unk_10006D070);
    swift_arrayDestroy(inited + 32, 2, v28);

    return swift_errorRelease(a2);
  }
  else if (a1)
  {
    sub_10002663C(0, &qword_10006D098, OS_dispatch_queue_ptr);
    v29 = a1;
    v40 = static OS_dispatch_queue.main.getter();
    v30 = swift_allocObject(&unk_100063080, 32, 7);
    *(_QWORD *)(v30 + 16) = a3;
    *(_QWORD *)(v30 + 24) = v29;
    aBlock[4] = sub_100026598;
    v50 = v30;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100020E0C;
    aBlock[3] = &unk_100063098;
    v31 = _Block_copy(aBlock);
    v32 = v50;
    v33 = v29;
    v34 = a3;
    v35 = swift_release(v32);
    static DispatchQoS.unspecified.getter(v35);
    aBlock[0] = _swiftEmptyArrayStorage;
    v36 = sub_1000265A8();
    v37 = sub_100011254(&qword_10006D0A8);
    v38 = sub_1000265F0();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v37, v38, v6, v36);
    v39 = (void *)v40;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v9, v31);
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  return result;
}

void sub_100024B3C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_100024BB0(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _BYTE v20[15];
  char v21;

  v2 = v1;
  v4 = sub_100011254(&qword_10006D038);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v8);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000191EC(a1, (uint64_t)v10, type metadata accessor for CRLSEBoard);
  v11 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_10001D0C4((uint64_t)v10);
  v12 = sub_1000263E4();
  NSDiffableDataSourceSnapshot.init()(&type metadata for CRLSEiOSMainViewController.CollectionViewSection, &type metadata for String, v12, &protocol witness table for String);
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_1000622A8);
  v13 = sub_10001D4D0();
  v21 = 0;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(v13, &v21, v4);
  swift_bridgeObjectRelease(v13);
  v14 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource];
  if (v14)
  {
    v15 = v14;
    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)(v7, 0, 0, 0);

  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  v16 = objc_msgSend(v2, "view");
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, "setNeedsLayout");

    v18 = objc_msgSend(v2, "view");
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "layoutIfNeeded");

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100024DA8(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  Class isa;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44[24];

  v3 = v2;
  v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v41 = (uint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v42 = (uint64_t)&v41 - v10;
  v11 = sub_100011254(&qword_10006D030);
  v12 = __chkstk_darwin(v11);
  v43 = (uint64_t)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v41 - v14;
  v16 = type metadata accessor for IndexPath(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  objc_msgSend(a1, "deselectItemAtIndexPath:animated:", isa, 0);

  v21 = sub_10001D4D0();
  v22 = *((_QWORD *)v21 + 2);
  swift_bridgeObjectRelease(v21);
  v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a2, v16);
  if (v22 < 2)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_7;
  }
  v24 = IndexPath.item.getter(v23);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if (v24)
  {
LABEL_7:
    v29 = type metadata accessor for CRLSEiOSCreateBoardViewController();
    v30 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v29)), "init");
    *(_QWORD *)&v30[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate + 8] = &off_100062F90;
    swift_unknownObjectWeakAssign();
    v31 = objc_msgSend(v3, "navigationController");
    if (v31)
    {
      v32 = v31;
      objc_msgSend(v31, "pushViewController:animated:", v30, 1);

    }
    return;
  }
  v25 = sub_10001D218();
  v26 = sub_100037F48();

  v27 = v26 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  swift_beginAccess(v26 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, v44, 0, 0);
  sub_100019B3C(v27, (uint64_t)v15, &qword_10006D030);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v28(v15, 1, v6))
  {
    sub_100019B80((uint64_t)v15, &qword_10006D030);
LABEL_5:
    swift_release(v26);
    return;
  }
  v33 = *(_QWORD *)&v15[*(int *)(v6 + 20)];
  swift_bridgeObjectRetain(v33);
  sub_100019B80((uint64_t)v15, &qword_10006D030);
  v34 = *(_QWORD *)(v33 + 16);
  swift_bridgeObjectRelease(v33);
  if (!v34)
    goto LABEL_5;
  v35 = v43;
  sub_100044924(v43);
  if (v28((char *)v35, 1, v6) == 1)
  {
    swift_release(v26);
    sub_100019B80(v35, &qword_10006D030);
  }
  else
  {
    v36 = v42;
    sub_100017A6C(v35, v42, type metadata accessor for CRLSELibraryViewModeItemNode);
    v37 = v41;
    sub_1000191EC(v36, v41, type metadata accessor for CRLSELibraryViewModeItemNode);
    v38 = (char *)sub_100031AB4(v37);
    *(_QWORD *)&v38[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate + 8] = &off_100062F80;
    swift_unknownObjectWeakAssign();
    v39 = objc_msgSend(v3, "navigationController");
    if (v39)
    {
      v40 = v39;
      objc_msgSend(v39, "pushViewController:animated:", v38, 1);

      swift_release(v26);
      sub_100013BBC(v36, type metadata accessor for CRLSELibraryViewModeItemNode);
    }
    else
    {
      sub_100013BBC(v36, type metadata accessor for CRLSELibraryViewModeItemNode);
      swift_release(v26);

    }
  }
}

id sub_100025264(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  uint64_t v7;
  NSString v8;
  id v9;
  objc_super v11;

  v6 = &v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  v7 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompact] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompactLandscape] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource] = 0;
  if (a2)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController(0);
  v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v8, a3);

  return v9;
}

id sub_100025458(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  v4 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompact] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompactLandscape] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController(0);
  v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

void sub_1000255D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[18];

  sub_100025674(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[2] = "\b";
    v4[3] = "\b";
    v4[4] = "\b";
    v4[5] = "\b";
    v4[6] = "\b";
    v4[7] = "\b";
    v4[8] = "\b";
    v4[9] = "\b";
    v4[10] = "\b";
    v4[11] = "\b";
    v4[12] = "\b";
    v4[13] = "\b";
    v4[14] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[15] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[16] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[17] = "\b";
    swift_updateClassMetadata2(a1, 256, 18, v4, a1 + 80);
  }
}

void sub_100025674(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10006D020)
  {
    v2 = type metadata accessor for CRLSEBoard(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10006D020);
  }
}

uint64_t storeEnumTagSinglePayload for CRLSEiOSMainViewController.CollectionViewSection(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100025708 + 4 * byte_1000527D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100025728 + 4 * byte_1000527D5[v4]))();
}

_BYTE *sub_100025708(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100025728(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100025730(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100025738(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100025740(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100025748(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEiOSMainViewController.CollectionViewSection()
{
  return &type metadata for CRLSEiOSMainViewController.CollectionViewSection;
}

unint64_t sub_100025768()
{
  unint64_t result;

  result = qword_10006D028;
  if (!qword_10006D028)
  {
    result = swift_getWitnessTable(&unk_100052878, &type metadata for CRLSEiOSMainViewController.CollectionViewSection);
    atomic_store(result, (unint64_t *)&qword_10006D028);
  }
  return result;
}

uint64_t sub_1000257AC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100025810;
  return v6(a1);
}

uint64_t sub_100025810()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_10002585C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10002588C(a1, v4);
}

unint64_t sub_10002588C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1000268E4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10002686C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_100025950(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  NSURL *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSURL *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD aBlock[5];
  uint64_t v30;

  v2 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v2);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)aBlock - v10;
  v12 = objc_msgSend(a1, "url");
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  v13 = v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v12);

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_100019B80((uint64_t)v4, &qword_10006D050);
    return 0;
  }
  v14(v11, v4, v5);
  v15 = objc_allocWithZone((Class)LPLinkView);
  URL._bridgeToObjectiveC()(v16);
  v18 = v17;
  v19 = objc_msgSend(v15, "initWithURL:", v17);

  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "setAutoresizesSubviews:", 1);
  objc_msgSend(v19, "_setPreferredSizeClass:", 3);
  objc_msgSend(v19, "_setDisablePlayback:", 1);
  objc_msgSend(v19, "_setDisableLinkFollowing:", 1);
  objc_msgSend(v19, "_setDisableTapGesture:", 1);
  objc_msgSend(v19, "_setDisableAnimations:", 1);
  objc_msgSend(v19, "_setDisablePlayback:", 1);
  objc_msgSend(v19, "_setDisableAutoPlay:", 1);
  objc_msgSend(v19, "_setDisablePreviewGesture:", 1);
  objc_msgSend(v19, "_setDisableHighlightGesture:", 1);
  objc_msgSend(v19, "_setDisablePlaybackControls:", 1);
  v20 = objc_msgSend(objc_allocWithZone((Class)LPMetadataProvider), "init");
  URL._bridgeToObjectiveC()(v21);
  v23 = v22;
  v24 = swift_allocObject(&unk_100063030, 24, 7);
  *(_QWORD *)(v24 + 16) = v19;
  aBlock[4] = sub_100026564;
  v30 = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100024B3C;
  aBlock[3] = &unk_100063048;
  v25 = _Block_copy(aBlock);
  v26 = v30;
  v27 = v19;
  objc_msgSend(v20, "startFetchingMetadataForURL:completionHandler:", v23, v25, swift_release(v26).n128_f64[0]);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v27;
}

void sub_100025CBC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v33 = a5;
  v9 = type metadata accessor for URL(0);
  v31 = *(_QWORD *)(v9 - 8);
  v32 = v9;
  __chkstk_darwin(v9);
  v30 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = (unint64_t)_swiftEmptyArrayStorage;
  v14 = a4 >> 1;
  if (a4 >> 1 == a3)
    return;
  v29 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent;
  swift_unknownObjectRetain(a1);
  v34 = a1;
  v15 = v30;
  while (a3 < v14)
  {
    v17 = *(id *)(a2 + 8 * a3);
    v18 = sub_10002A2C4();
    if (!v18)
    {
      v19 = sub_100023AA8(v17, 1);
      goto LABEL_13;
    }
    if (v18 == 1)
    {
      v19 = sub_100023FDC(v17, 1);
      goto LABEL_13;
    }
    v20 = objc_msgSend(v17, "url");
    if (v20)
    {
      v21 = v20;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v20);

      v23 = v31;
      v22 = v32;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v13, v15, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v13, 0, 1, v22);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v13, 1, v22) != 1)
      {
        sub_100019B80((uint64_t)v13, &qword_10006D050);
        v19 = sub_100025950(v17);
LABEL_13:
        v24 = v19;

        if (v24)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v26 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v25 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v26 >= v25 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
          v16 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
          specialized Array._endMutation()(v16);
        }
        goto LABEL_4;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v13, 1, 1, v32);
    }
    sub_100019B80((uint64_t)v13, &qword_10006D050);
    v27 = *(void **)(v33 + v29);
    if (!v27)
      goto LABEL_22;
    v28 = v27;
    objc_msgSend(v28, "setHidden:", 0);

LABEL_4:
    if (v14 == ++a3)
    {
      swift_unknownObjectRelease(v34);
      return;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
}

_QWORD *sub_100025F84(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  specialized ContiguousArray.reserveCapacity(_:)(0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v3, a1);
LABEL_7:
        v5 = v4;
        v6 = objc_msgSend(v4, "layer");
        if (qword_10006C560 != -1)
          swift_once(&qword_10006C560, sub_10001D0B0);
        if (v3 >= *((_QWORD *)off_10006CF28 + 2))
          goto LABEL_14;
        objc_msgSend(v6, "setCornerRadius:", *((double *)off_10006CF28 + v3 + 4));

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(objc_msgSend(v5, "setClipsToBounds:", 1));
        v7 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v7);
        v8 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v5);
        specialized ContiguousArray._endMutation()(v8);
        if (v2 == ++v3)
          goto LABEL_19;
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      if (a1 < 0)
        v9 = a1;
      else
        v9 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v2 = _CocoaArrayWrapper.endIndex.getter(v9);
      if (!v2)
        goto LABEL_19;
    }
    v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_19:
  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_10002613C(uint64_t a1, uint64_t (*a2)(unint64_t, id))
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  specialized ContiguousArray.reserveCapacity(_:)(0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_13;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
LABEL_7:
        v6 = v5;
        v7 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_12;
        v8 = a2(v4, v5);

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v9 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
        v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v8);
        specialized ContiguousArray._endMutation()(v10);
        ++v4;
        if (v7 == v3)
          goto LABEL_17;
      }
      if (v4 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_12:
      __break(1u);
LABEL_13:
      if (a1 < 0)
        v11 = a1;
      else
        v11 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v3 = _CocoaArrayWrapper.endIndex.getter(v11);
      if (!v3)
        goto LABEL_17;
    }
    v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_7;
  }
LABEL_17:
  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

void sub_100026290()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  char v11[24];

  v1 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v1);
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = (uint64_t)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  swift_beginAccess(&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard], v11, 0, 0);
  sub_100019B3C(v4, (uint64_t)v3, &qword_10006D040);
  v5 = type metadata accessor for CRLSEBoard(0);
  LODWORD(v4) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5);
  sub_100019B80((uint64_t)v3, &qword_10006D040);
  if ((_DWORD)v4 == 1)
  {
    v6 = type metadata accessor for CRLSEiOSCreateBoardViewController();
    v7 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6)), "init");
    *(_QWORD *)&v7[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate + 8] = &off_100062F90;
    swift_unknownObjectWeakAssign();
    v8 = objc_msgSend(v0, "navigationController");
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "pushViewController:animated:", v7, 1);

    }
  }
  else
  {
    sub_100021374();
  }
}

unint64_t sub_1000263E4()
{
  unint64_t result;

  result = qword_10006D048;
  if (!qword_10006D048)
  {
    result = swift_getWitnessTable(&unk_100052838, &type metadata for CRLSEiOSMainViewController.CollectionViewSection);
    atomic_store(result, (unint64_t *)&qword_10006D048);
  }
  return result;
}

uint64_t sub_100026428(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10002646C()
{
  unint64_t result;

  result = qword_10006D2F0;
  if (!qword_10006D2F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10006D2F0);
  }
  return result;
}

uint64_t sub_1000264B0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

id sub_1000264D4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "drawInRect:", 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_1000264F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026500()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100026520(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100026530(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_100026538(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_1000235F4(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100026540()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026564(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000247C4(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10002656C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_100026598()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "setMetadata:", *(_QWORD *)(v0 + 24));
}

unint64_t sub_1000265A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D0A0;
  if (!qword_10006D0A0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10006D0A0);
  }
  return result;
}

unint64_t sub_1000265F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D0B0;
  if (!qword_10006D0B0)
  {
    v1 = sub_1000192FC(&qword_10006D0A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006D0B0);
  }
  return result;
}

uint64_t sub_10002663C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100026674()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  void (*v10)(uint64_t, uint64_t, __n128);

  v1 = sub_100011254(&qword_10006D0C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = (v5 + v3 + v4) & ~v3;
  v8 = v7 + v5;
  v9 = swift_release(*(_QWORD *)(v0 + 16));
  v10 = *(void (**)(uint64_t, uint64_t, __n128))(v2 + 8);
  v10(v0 + v4, v1, v9);
  ((void (*)(uint64_t, uint64_t))v10)(v0 + v7, v1);
  return swift_deallocObject(v0, v8, v6);
}

id sub_100026730(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  v7 = *(_QWORD *)(sub_100011254(&qword_10006D0C0) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  return sub_100021F4C(a1, a2, a3, *(_QWORD *)(v3 + 16), v3 + ((v8 + 24) & ~v8), v3 + ((*(_QWORD *)(v7 + 64) + v8 + ((v8 + 24) & ~v8)) & ~v8));
}

uint64_t sub_1000267A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100011254(&qword_10006D0C8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100026804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_100011254(&qword_10006D0C8) - 8) + 80);
  return sub_1000222B8(a1, a2, a3, a4, v4 + ((v9 + 16) & ~v9));
}

uint64_t sub_10002686C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

void sub_1000268A0()
{
  uint64_t v0;

  sub_10002109C(v0);
}

uint64_t sub_1000268A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000268E4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100026920()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 56, 7);
}

void sub_100026944()
{
  uint64_t v0;

  sub_100020CD4(*(_QWORD *)(v0 + 16), *(CGFloat *)(v0 + 24), *(CGFloat *)(v0 + 32), *(CGFloat *)(v0 + 40), *(CGFloat *)(v0 + 48));
}

uint64_t sub_100026954(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254(&qword_10006D040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

const char *sub_10002699C()
{
  return "contentSize";
}

id sub_1000269A8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*a1, "contentSize");
  *a2 = v4;
  a2[1] = v5;
  return result;
}

id sub_1000269D8(double *a1, id *a2)
{
  return objc_msgSend(*a2, "setContentSize:", *a1, a1[1]);
}

void sub_1000269EC(void **a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000201E8(a1, a2, v2);
}

uint64_t sub_1000269F4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100026A28(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10006D11C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100026AA0;
  return sub_10001FCE4(a1, v4, v5, v7, v6);
}

uint64_t sub_100026AA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100026AE8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026B0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10006D144);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100026AA0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10006D140 + dword_10006D140))(a1, v4);
}

uint64_t sub_100026B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254(&qword_10006D0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100026CC4()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  objc_msgSendSuper2(&v15, "viewDidLoad");
  v1 = objc_msgSend(v0, "view");
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = v1;
  v3 = (void *)objc_opt_self(UIColor);
  v4 = objc_msgSend(v3, "systemGroupedBackgroundColor");
  objc_msgSend(v2, "setBackgroundColor:", v4);

  v5 = type metadata accessor for CRLSEiOSMainViewController(0);
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v5)), "init");
  v7 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v6);
  v8 = objc_msgSend(v7, "navigationBar");
  v9 = objc_msgSend(v3, "systemBackgroundColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v10 = objc_msgSend(v7, "navigationBar");
  objc_msgSend(v10, "setTranslucent:", 1);

  objc_msgSend(v0, "addChildViewController:", v7);
  v11 = objc_msgSend(v0, "view");
  if (!v11)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v12 = v11;
  v13 = objc_msgSend(v7, "view");
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v12, "addSubview:", v13);

    objc_msgSend(v7, "didMoveToParentViewController:", v0);
    objc_msgSend(v0, "setEdgesForExtendedLayout:", 0);

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_100026F08()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CRLSEiOSViewController()
{
  return objc_opt_self(_TtC24FreeformSharingExtension22CRLSEiOSViewController);
}

void sub_100026F58()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  NSString v9;
  NSString v10;
  NSString v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSString v27;
  NSString v28;
  NSString v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSString v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  Class isa;

  objc_msgSend(v0, "setEdgesForExtendedLayout:", 0);
  v1 = objc_msgSend(v0, "view");
  if (!v1)
  {
    __break(1u);
    goto LABEL_20;
  }
  v2 = v1;
  v71 = (id)objc_opt_self(UIColor);
  v3 = objc_msgSend(v71, "systemGroupedBackgroundColor");
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = objc_msgSend(v0, "navigationItem");
  v5 = type metadata accessor for CRLSEExtensionContextManager(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
  v7 = (void *)objc_opt_self(NSBundle);
  v8 = objc_msgSend(v7, "bundleForClass:", ObjCClassFromMetadata);
  v9 = String._bridgeToObjectiveC()();
  v10 = String._bridgeToObjectiveC()();
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend(v8, "localizedStringForKey:value:table:", v9, v10, v11);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v14 = v13;

  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v4, "setTitle:", v15);

  v16 = objc_msgSend(v0, "navigationItem");
  v17 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v0, "cancel:");
  objc_msgSend(v16, "setLeftBarButtonItem:", v17);

  v18 = objc_msgSend(v0, "navigationItem");
  v19 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v0, "createBoardButtonAction:");
  objc_msgSend(v18, "setRightBarButtonItem:", v19);

  v20 = objc_msgSend(objc_allocWithZone((Class)UITextField), "init");
  v21 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField;
  v22 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField];
  *(_QWORD *)&v0[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField] = v20;

  v23 = *(void **)&v0[v21];
  if (!v23)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = *(void **)&v0[v21];
  if (!v24)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v25 = v24;
  v26 = objc_msgSend(v7, "bundleForClass:", ObjCClassFromMetadata);
  v27 = String._bridgeToObjectiveC()();
  v28 = String._bridgeToObjectiveC()();
  v29 = String._bridgeToObjectiveC()();
  v30 = objc_msgSend(v26, "localizedStringForKey:value:table:", v27, v28, v29);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  v32 = v31;

  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  objc_msgSend(v25, "setPlaceholder:", v33);

  v34 = *(void **)&v0[v21];
  if (!v34)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  objc_msgSend(v34, "setBorderStyle:", 3);
  v35 = *(void **)&v0[v21];
  if (!v35)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  objc_msgSend(v35, "setClearButtonMode:", 1);
  v36 = *(void **)&v0[v21];
  if (!v36)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  objc_msgSend(v36, "setAdjustsFontForContentSizeCategory:", 1);
  v37 = *(void **)&v0[v21];
  if (!v37)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v38 = (void *)objc_opt_self(UIFont);
  v39 = v37;
  v40 = objc_msgSend(v38, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v39, "setFont:", v40);

  v41 = *(void **)&v0[v21];
  if (!v41)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v42 = v41;
  v43 = objc_msgSend(v71, "tertiarySystemBackgroundColor");
  objc_msgSend(v42, "setBackgroundColor:", v43);

  v44 = *(void **)&v0[v21];
  if (!v44)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  objc_msgSend(v44, "setDelegate:", v0);
  v45 = objc_msgSend(v0, "view");
  if (!v45)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (!*(_QWORD *)&v0[v21])
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v46 = v45;
  objc_msgSend(v45, "addSubview:");

  v47 = sub_100011254(&qword_10006D670);
  v48 = swift_allocObject(v47, 56, 7);
  *(_OWORD *)(v48 + 16) = xmmword_1000527A0;
  v49 = *(void **)&v0[v21];
  if (!v49)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v50 = objc_msgSend(v49, "leadingAnchor");
  v51 = objc_msgSend(v0, "view");
  if (!v51)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v52 = v51;
  v53 = objc_msgSend(v51, "safeAreaLayoutGuide");

  v54 = objc_msgSend(v53, "leadingAnchor");
  v55 = objc_msgSend(v50, "constraintEqualToAnchor:constant:", v54, 15.0);

  *(_QWORD *)(v48 + 32) = v55;
  v56 = *(void **)&v0[v21];
  if (!v56)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v57 = objc_msgSend(v56, "trailingAnchor");
  v58 = objc_msgSend(v0, "view");
  if (!v58)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v59 = v58;
  v60 = objc_msgSend(v58, "safeAreaLayoutGuide");

  v61 = objc_msgSend(v60, "trailingAnchor");
  v62 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", v61, -15.0);

  *(_QWORD *)(v48 + 40) = v62;
  v63 = *(void **)&v0[v21];
  if (!v63)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v64 = objc_msgSend(v63, "topAnchor");
  v65 = objc_msgSend(v0, "view");
  if (v65)
  {
    v66 = v65;
    v67 = (void *)objc_opt_self(NSLayoutConstraint);
    v68 = objc_msgSend(v66, "topAnchor");

    v69 = objc_msgSend(v64, "constraintEqualToAnchor:constant:", v68, 32.0);
    *(_QWORD *)(v48 + 48) = v69;
    specialized Array._endMutation()(v70);
    sub_1000287C0();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v48);
    objc_msgSend(v67, "activateConstraints:", isa);

    return;
  }
LABEL_35:
  __break(1u);
}

void sub_10002775C(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  objc_super v15;

  v15.receiver = v1;
  v15.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  objc_msgSendSuper2(&v15, "viewWillAppear:", a1 & 1);
  v3 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField;
  v4 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField];
  if (!v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(v4, "becomeFirstResponder");
  v5 = objc_msgSend(v1, "navigationItem");
  v6 = objc_msgSend(v5, "rightBarButtonItem");

  if (!v6)
    return;
  v7 = *(void **)&v1[v3];
  if (!v7)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v8 = objc_msgSend(v7, "text");
  if (v8)
  {
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v12 = v11;

    v13 = String.count.getter(v10, v12);
    swift_bridgeObjectRelease(v12);
    v14 = v13 > 0;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v6, "setEnabled:", v14);

}

void sub_1000278B4(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  objc_msgSendSuper2(&v10, "viewDidAppear:", a1 & 1);
  v3 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField;
  v4 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField];
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "beginningOfDocument");
    v7 = *(void **)&v1[v3];
    if (v7)
    {
      v8 = objc_msgSend(v7, "endOfDocument");
      v9 = objc_msgSend(v5, "textRangeFromPosition:toPosition:", v6, v8);

      objc_msgSend(v5, "setSelectedTextRange:", v9);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100027BD8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v2 = objc_msgSend(a1, "text");
  v3 = v2;
  if (v2)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v6 = v5;

    v3 = (void *)(v4 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    v6 = 0xE000000000000000;
  }
  v7 = objc_msgSend(v1, "navigationItem");
  v9 = objc_msgSend(v7, "rightBarButtonItem");

  swift_bridgeObjectRelease(v6);
  if (v9)
  {
    v8 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v8 = (uint64_t)v3;
    objc_msgSend(v9, "setEnabled:", v8 != 0);

  }
}

id sub_100027D14(Swift::Int a1, uint64_t a2)
{
  char *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t Strong;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  id result;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  Swift::Int *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[3];
  uint64_t v30;

  v3 = v2;
  v6 = sub_100011254(&qword_10006D040);
  __chkstk_darwin(v6);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CRLSEBoard(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v2[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate]);
  if (Strong)
  {
    v15 = Strong;
    v30 = v10;
    v16 = v2;
    v17 = sub_10001D218();
    v29[1] = a1;
    v29[2] = a2;
    a1 = sub_100038B04(a1, a2);
    a2 = v18;
    swift_unknownObjectRelease(v15);

    v3 = v16;
    v10 = v30;
  }
  else
  {
    *(_QWORD *)&v19 = swift_bridgeObjectRetain(a2).n128_u64[0];
  }
  result = objc_msgSend(v3, "view", v19);
  if (result)
  {
    v21 = result;
    objc_msgSend(result, "endEditing:", 1);

    v22 = type metadata accessor for CRLSEBoardIdentifier(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v12, 1, 1, v22);
    v23 = &v12[*(int *)(v9 + 24)];
    v24 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 1, 1, v24);
    v25 = (Swift::Int *)&v12[*(int *)(v9 + 20)];
    *v25 = a1;
    v25[1] = a2;
    v26 = swift_unknownObjectWeakLoadStrong(v13);
    if (v26)
    {
      v27 = v26;
      sub_100028700((uint64_t)v12, (uint64_t)v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
      sub_10001D0C4((uint64_t)v8);
      sub_100021374();
      swift_unknownObjectRelease(v27);
    }
    v28 = objc_msgSend(v3, "navigationController");

    return (id)sub_100028744((uint64_t)v12);
  }
  else
  {
    __break(1u);
    __break(1u);
  }
  return result;
}

void sub_1000281F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  NSString v13;
  NSString v14;
  NSString v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSString v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;

  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a2);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v9 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);

  v10 = type metadata accessor for CRLSEExtensionContextManager(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v10);
  v12 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v13 = String._bridgeToObjectiveC()();
  v14 = String._bridgeToObjectiveC()();
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, v14, v15);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v18 = v17;

  v19 = swift_allocObject(&unk_100063258, 24, 7);
  *(_QWORD *)(v19 + 16) = v4;
  v20 = v4;
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  v24[4] = sub_1000286BC;
  v25 = v19;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 1107296256;
  v24[2] = sub_100028474;
  v24[3] = &unk_100063270;
  v22 = _Block_copy(v24);
  swift_release(v25);
  v23 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v21, 0, v22);
  _Block_release(v22);

  objc_msgSend(v9, "addAction:", v23);
  objc_msgSend(v20, "presentViewController:animated:completion:", v9, 1, 0);

}

void sub_100028474(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

id sub_100028610()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CRLSEiOSCreateBoardViewController()
{
  return objc_opt_self(_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController);
}

uint64_t sub_100028698()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_1000286BC()
{
  uint64_t v0;
  id result;

  result = *(id *)(*(_QWORD *)(v0 + 16)
                 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField);
  if (result)
    return objc_msgSend(result, "becomeFirstResponder");
  __break(1u);
  return result;
}

uint64_t sub_1000286E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000286F0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000286F8(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100028700(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100028744(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100028780(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100011254(&qword_10006D0F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000287C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D080;
  if (!qword_10006D080)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10006D080);
  }
  return result;
}

uint64_t sub_1000287FC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

void sub_100028820(uint64_t a1)
{
  sub_1000288B8(a1, (SEL *)&selRef_whiteColor, &qword_10006D2F8);
}

void sub_100028834()
{
  id v0;
  id v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.968627451, 1.0);
  v1 = objc_msgSend(v0, "CGColor");

  qword_10006D300 = (uint64_t)v1;
}

void sub_1000288A4(uint64_t a1)
{
  sub_1000288B8(a1, (SEL *)&selRef_blackColor, &qword_10006D308);
}

void sub_1000288B8(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id v4;
  id v5;

  v4 = objc_msgSend((id)objc_opt_self(UIColor), *a2);
  v5 = objc_msgSend(v4, "CGColor");

  *a3 = v5;
}

UIFontTextStyle sub_100028920()
{
  qword_10006D310 = (uint64_t)UIFontTextStyleHeadline;
  return UIFontTextStyleHeadline;
}

UIFontTextStyle sub_100028938()
{
  qword_10006D318 = (uint64_t)UIFontTextStyleSubheadline;
  return UIFontTextStyleSubheadline;
}

double sub_100028950()
{
  double result;

  result = 0.0;
  xmmword_10006D320 = xmmword_100052980;
  return result;
}

void sub_100028968(uint64_t a1)
{
  sub_100028990(a1, (SEL *)&selRef_labelColor, &qword_10006D330);
}

void sub_10002897C(uint64_t a1)
{
  sub_100028990(a1, (SEL *)&selRef_secondaryLabelColor, &qword_10006D338);
}

void sub_100028990(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_self(UIColor), *a2);
  v5 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", 1);
  v6 = objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);

  *a3 = v6;
}

char *sub_100028A2C(uint64_t a1, char *a2, double a3, double a4)
{
  char *v4;
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
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  double *v23;
  objc_class *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  Class isa;
  id v37;
  uint64_t v38;
  uint64_t v39;
  Class v40;
  id v41;
  unsigned int (**v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t inited;
  NSString *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  _QWORD *v52;
  id v53;
  id v54;
  void *v55;
  double v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  unsigned int (**v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  unsigned int (**v91)(uint64_t, uint64_t, uint64_t);
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  id v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  Class v129;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unsigned int (**v135)(uint64_t, uint64_t, uint64_t);
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  id v148;
  void (*v149)(char *, uint64_t);
  uint64_t v150;
  unsigned int (**v151)(uint64_t, uint64_t, uint64_t);
  uint64_t v152;
  char v153[40];
  objc_super v154;

  v9 = sub_100011254((uint64_t *)&unk_10006D800);
  __chkstk_darwin(v9);
  v145 = (uint64_t)&v144 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100011254(&qword_10006D3A0);
  __chkstk_darwin(v11);
  v151 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))((char *)&v144 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for URLResourceValues(0);
  v147 = *(_QWORD *)(v13 - 8);
  v148 = (id)v13;
  __chkstk_darwin(v13);
  v144 = (char *)&v144 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for URL(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v144 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v21 = (char *)&v144 - v20;
  *(_QWORD *)&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_metadata] = a1;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v146 = a2;
  v22(&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url], (uint64_t)a2, v15);
  v23 = (double *)&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_size];
  *v23 = a3;
  v23[1] = a4;
  v24 = (objc_class *)type metadata accessor for CRLSEAudioPreviewView(0);
  v154.receiver = v4;
  v154.super_class = v24;
  swift_bridgeObjectRetain(a1);
  v25 = (char *)objc_msgSendSuper2(&v154, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v26 = &v25[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url];
  v22(v21, (uint64_t)&v25[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url], v15);
  v27 = v25;
  URL.lastPathComponent.getter();
  v29 = v28;
  v149 = *(void (**)(char *, uint64_t))(v16 + 8);
  v150 = v15;
  v149(v21, v15);
  v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v29);
  v31 = objc_msgSend(v30, "stringByDeletingPathExtension");

  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
  v34 = v33;

  v35 = (void *)objc_opt_self(AVAsset);
  sub_10002663C(0, &qword_10006D058, AVMetadataItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v37 = objc_msgSend(v35, "crl_titleWithMetadataArray:", isa);

  if (v37)
  {
    swift_bridgeObjectRelease(v34);
    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
    v34 = v38;

  }
  v39 = *(_QWORD *)&v27[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_metadata];
  swift_bridgeObjectRetain(v39);
  v40 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v39);
  v41 = objc_msgSend(v35, "crl_creatorArtistOrAuthorWithMetadataArray:", v40);

  v42 = v151;
  if (v41)
  {
    v145 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
    v147 = v43;

LABEL_7:
    v52 = &unk_10006D000;
    goto LABEL_8;
  }
  v44 = sub_100011254(&qword_10006D3A8);
  inited = swift_initStackObject(v44, v153);
  *(_OWORD *)(inited + 16) = xmmword_100052780;
  *(_QWORD *)(inited + 32) = NSURLContentTypeKey;
  v46 = NSURLContentTypeKey;
  v47 = sub_100029E98(inited);
  swift_setDeallocating(inited);
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy(inited + 32, 1, v48);
  v49 = v150;
  v22(v19, (uint64_t)v26, v150);
  URL.resourceValues(forKeys:)(v47);
  swift_bridgeObjectRelease(v47);
  v149(v19, v49);
  v50 = v147;
  v51 = v148;
  (*(void (**)(unsigned int (**)(uint64_t, uint64_t, uint64_t), _QWORD, uint64_t, id))(v147 + 56))(v42, 0, 1, v148);
  if ((*(unsigned int (**)(id, uint64_t, id))(v50 + 48))(v42, 1, v51) == 1)
  {
    sub_100019B80((uint64_t)v42, &qword_10006D3A0);
    v145 = 0;
    v147 = 0xE000000000000000;
    goto LABEL_7;
  }
  v131 = v144;
  v132 = (*(uint64_t (**)(char *, id, id))(v50 + 32))(v144, v42, v51);
  v133 = v145;
  URLResourceValues.contentType.getter(v132);
  v134 = type metadata accessor for UTType(0);
  v135 = *(unsigned int (***)(uint64_t, uint64_t, uint64_t))(v134 - 8);
  v52 = (_QWORD *)&unk_10006D000;
  if (v135[6](v133, 1, v134) == 1)
  {
    (*(void (**)(char *, id))(v50 + 8))(v131, v51);
    sub_100019B80(v133, (uint64_t *)&unk_10006D800);
    v145 = 0;
    v136 = 0xE000000000000000;
  }
  else
  {
    v151 = v135;
    v137 = UTType.localizedDescription.getter();
    v138 = v50;
    v139 = v137;
    v141 = v140;
    (*(void (**)(char *, id))(v138 + 8))(v131, v51);
    ((void (*)(uint64_t, uint64_t))v151[1])(v133, v134);
    if (v141)
      v142 = v139;
    else
      v142 = 0;
    v145 = v142;
    v136 = 0xE000000000000000;
    if (v141)
      v136 = v141;
  }
  v147 = v136;
LABEL_8:
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v53 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v54 = objc_msgSend(v27, "layer");
  if (v54)
  {
    v55 = v54;
    objc_msgSend(v54, "setMasksToBounds:", 0);
    if (qword_10006C578 != -1)
      swift_once(&qword_10006C578, sub_1000288A4);
    objc_msgSend(v55, "setShadowColor:", qword_10006D308);
    if (qword_10006C590 != -1)
      swift_once(&qword_10006C590, sub_100028950);
    objc_msgSend(v55, "setShadowOffset:", xmmword_10006D320);
    LODWORD(v56) = 0.25;
    objc_msgSend(v55, "setShadowOpacity:", v56);
    objc_msgSend(v55, "setShadowRadius:", 3.0);

  }
  v57 = objc_msgSend(v53, "layer");
  v58 = sub_100029AA4(v57);

  v59 = v52[107];
  v60 = *(void **)&v27[v59];
  *(_QWORD *)&v27[v59] = v58;

  objc_msgSend(v27, "addSubview:", v53);
  sub_10002A0C4();
  v151 = v61;
  objc_msgSend(v53, "addSubview:");
  if (qword_10006C598 != -1)
    swift_once(&qword_10006C598, sub_100028968);
  v62 = qword_10006D330;
  if (qword_10006C580 != -1)
    swift_once(&qword_10006C580, sub_100028920);
  v63 = sub_10002A1CC(v32, v34, v62, qword_10006D310);
  swift_bridgeObjectRelease(v34);
  objc_msgSend(v53, "addSubview:", v63);
  v64 = sub_100011254(&qword_10006D670);
  v65 = swift_allocObject(v64, 120, 7);
  *(_OWORD *)(v65 + 16) = xmmword_100052990;
  v66 = objc_msgSend(v53, "topAnchor");
  v67 = objc_msgSend(v27, "topAnchor");
  v68 = objc_msgSend(v66, "constraintEqualToAnchor:", v67);

  *(_QWORD *)(v65 + 32) = v68;
  v69 = objc_msgSend(v53, "leadingAnchor");
  v70 = objc_msgSend(v27, "leadingAnchor");
  v71 = objc_msgSend(v69, "constraintEqualToAnchor:", v70);

  *(_QWORD *)(v65 + 40) = v71;
  v72 = objc_msgSend(v53, "trailingAnchor");
  v73 = objc_msgSend(v27, "trailingAnchor");
  v74 = objc_msgSend(v72, "constraintEqualToAnchor:", v73);

  *(_QWORD *)(v65 + 48) = v74;
  v75 = objc_msgSend(v53, "bottomAnchor");
  v76 = objc_msgSend(v27, "bottomAnchor");
  v77 = objc_msgSend(v75, "constraintEqualToAnchor:", v76);

  *(_QWORD *)(v65 + 56) = v77;
  v78 = objc_msgSend(v63, "topAnchor");
  v79 = objc_msgSend(v53, "topAnchor");
  v80 = objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, 16.0);

  *(_QWORD *)(v65 + 64) = v80;
  v81 = objc_msgSend(v63, "leadingAnchor");
  v82 = objc_msgSend(v53, "leadingAnchor");
  v83 = objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, 16.0);

  *(_QWORD *)(v65 + 72) = v83;
  v148 = v63;
  v84 = objc_msgSend(v63, "trailingAnchor");
  v85 = objc_msgSend(v53, "trailingAnchor");
  v86 = objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, -16.0);

  *(_QWORD *)(v65 + 80) = v86;
  v87 = objc_msgSend(v53, "widthAnchor");
  v88 = objc_msgSend(v87, "constraintEqualToConstant:", a3);

  *(_QWORD *)(v65 + 88) = v88;
  v89 = objc_msgSend(v53, "heightAnchor");
  v90 = objc_msgSend(v89, "constraintEqualToConstant:", a4);

  *(_QWORD *)(v65 + 96) = v90;
  v91 = v151;
  v92 = objc_msgSend(v151, "centerXAnchor");
  v93 = objc_msgSend(v53, "centerXAnchor");
  v94 = objc_msgSend(v92, "constraintEqualToAnchor:", v93);

  *(_QWORD *)(v65 + 104) = v94;
  v95 = objc_msgSend(v91, "centerYAnchor");
  v96 = objc_msgSend(v53, "centerYAnchor");
  v97 = objc_msgSend(v95, "constraintEqualToAnchor:constant:", v96, 16.0);

  *(_QWORD *)(v65 + 112) = v97;
  v152 = v65;
  ((void (*)(void))specialized Array._endMutation())();
  v98 = objc_msgSend(v27, "traitCollection");
  v99 = objc_msgSend(v98, "preferredContentSizeCategory");

  LOBYTE(v98) = static UIContentSizeCategory.< infix(_:_:)(v99, UIContentSizeCategoryAccessibilityLarge);
  if ((v98 & 1) == 0)
  {
    swift_bridgeObjectRelease(v147);
    v101 = v148;
    goto LABEL_32;
  }
  if (qword_10006C5A0 != -1)
    swift_once(&qword_10006C5A0, sub_10002897C);
  v100 = qword_10006D338;
  v101 = v148;
  if (qword_10006C588 != -1)
    swift_once(&qword_10006C588, sub_100028938);
  v102 = v147;
  v103 = sub_10002A1CC(v145, v147, v100, qword_10006D318);
  swift_bridgeObjectRelease(v102);
  objc_msgSend(v53, "addSubview:", v103);
  v104 = objc_msgSend(v103, "topAnchor");
  v105 = objc_msgSend(v101, "bottomAnchor");
  v106 = objc_msgSend(v104, "constraintEqualToAnchor:", v105);

  v107 = objc_msgSend(v103, "leadingAnchor");
  v108 = objc_msgSend(v53, "leadingAnchor");
  v109 = objc_msgSend(v107, "constraintEqualToAnchor:constant:", v108, 16.0);

  v110 = objc_msgSend(v103, "trailingAnchor");
  v111 = objc_msgSend(v53, "trailingAnchor");
  v112 = objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, -16.0);

  v113 = v152;
  if (!((unint64_t)v152 >> 62))
  {
    v114 = v152 & 0xFFFFFFFFFFFFF8;
    v115 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFF8) + 0x10);
    v116 = v115 + 3;
    if (!__OFADD__(v115, 3))
      goto LABEL_25;
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v152 < 0)
    v143 = v152;
  else
    v143 = v152 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v152);
  v115 = _CocoaArrayWrapper.endIndex.getter(v143);
  swift_bridgeObjectRelease(v113);
  v116 = v115 + 3;
  if (__OFADD__(v115, 3))
    goto LABEL_46;
LABEL_25:
  v117 = sub_100029DDC(v116, 1);
  specialized Array._endMutation()(v117);
  v106 = v106;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v115 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v114 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v115 >= v114 >> 1)
LABEL_47:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v114 > 1, v115 + 1, 1);
  v118 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v115, v106);
  specialized Array._endMutation()(v118);
  v119 = v109;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v121 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v120 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v121 >= v120 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v120 > 1, v121 + 1, 1);
  v122 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v121, v119);
  specialized Array._endMutation()(v122);
  v123 = v112;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v125 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v124 = *(_QWORD *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v125 >= v124 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v124 > 1, v125 + 1, 1);
  v126 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v125, v123);
  specialized Array._endMutation()(v126);

LABEL_32:
  v127 = (void *)objc_opt_self(NSLayoutConstraint);
  v128 = v152;
  sub_10002663C(0, (unint64_t *)&qword_10006D080, NSLayoutConstraint_ptr);
  v129 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v128);
  objc_msgSend(v127, "activateConstraints:", v129);

  v149(v146, v150);
  return v27;
}

id sub_100029AA4(id a1)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  Class isa;

  v2 = v1;
  if (a1)
  {
    objc_msgSend(a1, "setMasksToBounds:", 1);
    objc_msgSend(a1, "setCornerRadius:", 16.0);
  }
  v4 = objc_msgSend(objc_allocWithZone((Class)CAGradientLayer), "init");
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

  v5 = sub_100011254(&qword_10006D398);
  v6 = swift_allocObject(v5, 96, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100052750;
  if (qword_10006C568 != -1)
    swift_once(&qword_10006C568, sub_100028820);
  v7 = (void *)qword_10006D2F8;
  type metadata accessor for CGColor(0);
  v9 = v8;
  *(_QWORD *)(v6 + 56) = v8;
  *(_QWORD *)(v6 + 32) = v7;
  v10 = qword_10006C570;
  v11 = v7;
  if (v10 != -1)
    swift_once(&qword_10006C570, sub_100028834);
  v12 = (void *)qword_10006D300;
  *(_QWORD *)(v6 + 88) = v9;
  *(_QWORD *)(v6 + 64) = v12;
  v13 = v12;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v4, "setColors:", isa);

  if (a1)
    objc_msgSend(a1, "insertSublayer:atIndex:", v4, 0);
  return v4;
}

id sub_100029C74()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEAudioPreviewView(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100029D08()
{
  return type metadata accessor for CRLSEAudioPreviewView(0);
}

uint64_t type metadata accessor for CRLSEAudioPreviewView(uint64_t a1)
{
  uint64_t result;

  result = qword_10006D388;
  if (!qword_10006D388)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CRLSEAudioPreviewView);
  return result;
}

uint64_t sub_100029D4C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_1000529B8;
    v4[3] = &unk_1000529D0;
    result = swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100029DDC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0)
      v10 = v5;
    else
      v10 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v8 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

void *sub_100029E98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  Swift::Int v12;
  void *result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100011254(&qword_10006D3B0);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v38 = v1;
    v39 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v39 + 8 * v4);
      v7 = *(_QWORD *)(v3 + 40);
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v10 = v9;
      Hasher.init(_seed:)(v40, v7);
      v11 = v6;
      String.hash(into:)(v40, v8, v10);
      v12 = Hasher._finalize()();
      result = (void *)swift_bridgeObjectRelease(v10);
      v14 = -1 << *(_BYTE *)(v3 + 32);
      v15 = v12 & ~v14;
      v16 = v15 >> 6;
      v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
      v18 = 1 << v15;
      if (((1 << v15) & v17) != 0)
      {
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
        v21 = v20;
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        if (v19 == v22 && v21 == v23)
        {
LABEL_3:
          swift_bridgeObjectRelease_n(v21, 2);
LABEL_4:

          goto LABEL_5;
        }
        v25 = v23;
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v22, v23, 0);
        swift_bridgeObjectRelease(v21);
        result = (void *)swift_bridgeObjectRelease(v25);
        if ((v26 & 1) != 0)
          goto LABEL_4;
        v27 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v27;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
          v21 = v29;
          v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
          if (v28 == v30 && v21 == v31)
            goto LABEL_3;
          v33 = v31;
          v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v21, v30, v31, 0);
          swift_bridgeObjectRelease(v21);
          result = (void *)swift_bridgeObjectRelease(v33);
          if ((v34 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v16) = v18 | v17;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15) = v11;
      v35 = *(_QWORD *)(v3 + 16);
      v36 = __OFADD__(v35, 1);
      v37 = v35 + 1;
      if (v36)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v37;
LABEL_5:
      if (++v4 == v38)
        return (void *)v3;
    }
  }
  return &_swiftEmptySetSingleton;
}

void sub_10002A0C4()
{
  id v0;
  void *v1;
  id v2;
  NSString v3;
  id v4;
  id v5;

  v0 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithPointSize:weight:", 4, 80.0);
  v1 = (void *)objc_opt_self(UIImage);
  v2 = v0;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v1, "systemImageNamed:withConfiguration:", v3, v2);

  if (v4)
  {
    v5 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v4);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  else
  {
    __break(1u);
  }
}

id sub_10002A1CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  NSString v8;

  v6 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", a4);
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v6, "setTextColor:", a3);
  objc_msgSend(v6, "setTextAlignment:", 1);
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setText:", v8);

  return v6;
}

uint64_t sub_10002A2C4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  unsigned int v25;
  char **v26;
  uint64_t v27;
  char v28;
  void *v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  char *v31;
  void (*v32)(char *, uint64_t);
  _BOOL4 v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v40;
  int v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  unsigned int (*v45)(char *, uint64_t, uint64_t);

  v1 = v0;
  v2 = type metadata accessor for UTType(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v44 - v7;
  v9 = sub_100011254((uint64_t *)&unk_10006D800);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v44 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v44 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v44 - v19;
  v21 = objc_msgSend(v1, "mediaUTI");
  if (v21)
  {
    v22 = v21;
    static UTType._unconditionallyBridgeFromObjectiveC(_:)();

    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v23(v18, 0, 1, v2);
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v23(v18, 1, 1, v2);
  }
  sub_10002A60C((uint64_t)v18, (uint64_t)v20);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  v25 = v24(v20, 1, v2);
  v45 = v24;
  if (v25)
  {
    sub_100019B80((uint64_t)v20, (uint64_t *)&unk_10006D800);
    v26 = &selRef_centerXAnchor;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v20, v2);
    v27 = sub_100019B80((uint64_t)v20, (uint64_t *)&unk_10006D800);
    static UTType.image.getter(v27);
    v28 = UTType.conforms(to:)(v6);
    v29 = v1;
    v30 = v23;
    v31 = v6;
    v32 = *(void (**)(char *, uint64_t))(v3 + 8);
    v32(v31, v2);
    v32(v8, v2);
    v6 = v31;
    v23 = v30;
    v1 = v29;
    v26 = &selRef_centerXAnchor;
    if ((v28 & 1) != 0)
    {
      v33 = 1;
      goto LABEL_9;
    }
  }
  v34 = objc_msgSend(v1, "image");

  v33 = v34 != 0;
LABEL_9:
  v35 = objc_msgSend(v1, v26[150]);
  if (v35)
  {
    v36 = v35;
    static UTType._unconditionallyBridgeFromObjectiveC(_:)();

    v37 = 0;
  }
  else
  {
    v37 = 1;
  }
  v38 = v45;
  v23(v12, v37, 1, v2);
  sub_10002A60C((uint64_t)v12, (uint64_t)v15);
  if (v38(v15, 1, v2))
  {
    sub_100019B80((uint64_t)v15, (uint64_t *)&unk_10006D800);
    if (v33)
      return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v15, v2);
    v40 = sub_100019B80((uint64_t)v15, (uint64_t *)&unk_10006D800);
    static UTType.audiovisualContent.getter(v40);
    v41 = UTType.conforms(to:)(v6);
    v42 = v6;
    v43 = *(void (**)(char *, uint64_t))(v3 + 8);
    v43(v42, v2);
    v43(v8, v2);
    if (((v33 | v41) & 1) != 0)
      return !v33;
  }
  return 2;
}

uint64_t sub_10002A60C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254((uint64_t *)&unk_10006D800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A654(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;

  v3 = v1;
  v5 = sub_100011254(&qword_10006D540);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100017804(a1, v9);
  v11 = sub_10002D788();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSEImportManifest.CodingKeys, &type metadata for CRLSEImportManifest.CodingKeys, v11, v9, v10);
  v29 = 0;
  v12 = type metadata accessor for UUID(0);
  v13 = sub_1000177C4(&qword_10006CB78, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v3, &v29, v5, v12, v13);
  if (!v2)
  {
    v14 = (int *)type metadata accessor for CRLSEImportManifest(0);
    v15 = (uint64_t *)(v3 + v14[5]);
    v16 = *v15;
    v17 = v15[1];
    v28 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, &v28, v5);
    v18 = (uint64_t *)(v3 + v14[6]);
    v19 = *v18;
    v20 = v18[1];
    v27 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v19, v20, &v27, v5);
    v26 = *(_QWORD *)(v3 + v14[7]);
    v25 = 3;
    v21 = sub_100011254(&qword_10006D528);
    v22 = sub_10002D7CC(&qword_10006D548, &qword_10006D550, (uint64_t)&unk_100052A74, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v26, &v25, v5, v21, v22);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10002A84C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v37 = a2;
  v4 = sub_100011254((uint64_t *)&unk_10006D7D0);
  __chkstk_darwin(v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_100011254(&qword_10006D518);
  v7 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CRLSEImportManifest(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = &v12[*(int *)(v10 + 20)];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v42 = v14;
  v39 = v10;
  v40 = *(int *)(v10 + 28);
  v41 = a1;
  *(_QWORD *)&v12[v40] = _swiftEmptyArrayStorage;
  v16 = a1[3];
  v15 = a1[4];
  sub_100017804(a1, v16);
  v17 = sub_10002D788();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSEImportManifest.CodingKeys, &type metadata for CRLSEImportManifest.CodingKeys, v17, v16, v15);
  if (v2)
  {
    v21 = v40;
    v22 = v42;
    sub_10001786C(v41);
    sub_100019B80((uint64_t)v12, (uint64_t *)&unk_10006D7D0);
    swift_bridgeObjectRelease(*((_QWORD *)v22 + 1));
    return swift_bridgeObjectRelease(*(_QWORD *)&v12[v21]);
  }
  else
  {
    v18 = v7;
    v47 = 0;
    v19 = sub_1000177C4(&qword_10006CB10, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v20 = v38;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v13, &v47, v38, v13, v19);
    sub_10002D894((uint64_t)v6, (uint64_t)v12, (uint64_t *)&unk_10006D7D0);
    v46 = 1;
    v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v46, v20);
    v25 = v24;
    v26 = (uint64_t *)v42;
    swift_bridgeObjectRelease(*((_QWORD *)v42 + 1));
    *v26 = v23;
    v26[1] = v25;
    v45 = 2;
    v27 = KeyedDecodingContainer.decode(_:forKey:)(&v45, v20);
    v28 = (uint64_t *)&v12[*(int *)(v39 + 24)];
    *v28 = v27;
    v28[1] = v29;
    v30 = v20;
    v31 = sub_100011254(&qword_10006D528);
    v44 = 3;
    v32 = sub_10002D7CC(&qword_10006D530, &qword_10006D538, (uint64_t)&unk_100052A9C, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v31, &v44, v30, v31, v32);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v38);
    v33 = v43;
    v34 = v40;
    swift_bridgeObjectRelease(*(_QWORD *)&v12[v40]);
    *(_QWORD *)&v12[v34] = v33;
    sub_1000191EC((uint64_t)v12, v37, type metadata accessor for CRLSEImportManifest);
    sub_10001786C(v41);
    return sub_100013BBC((uint64_t)v12, type metadata accessor for CRLSEImportManifest);
  }
}

uint64_t sub_10002AC00()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10002AC34 + 4 * byte_1000529F0[*v0]))(0x4955556472616F62, 0xE900000000000044);
}

uint64_t sub_10002AC34()
{
  return 0x6D614E72656E776FLL;
}

uint64_t sub_10002AC4C()
{
  return 0x656C746974;
}

uint64_t sub_10002AC60()
{
  return 0x736D657469;
}

uint64_t sub_10002AC74@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10002DC20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002AC98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002D788();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002ACC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002D788();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002ACE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002A84C(a1, a2);
}

uint64_t sub_10002ACFC(_QWORD *a1)
{
  return sub_10002A654(a1);
}

uint64_t sub_10002AD10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v3 = v1;
  v5 = sub_100011254(&qword_10006D580);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100017804(a1, v9);
  v11 = sub_10002D850();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CRLSEManifestItem.CodingKeys, &type metadata for CRLSEManifestItem.CodingKeys, v11, v9, v10);
  v33 = 0;
  v12 = type metadata accessor for UUID(0);
  v13 = sub_1000177C4(&qword_10006CB78, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v33, v5, v12, v13);
  if (!v2)
  {
    v14 = (int *)type metadata accessor for CRLSEManifestItem(0);
    v15 = (uint64_t *)(v3 + v14[5]);
    v16 = *v15;
    v17 = v15[1];
    v32 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, &v32, v5);
    v18 = v3 + v14[6];
    v31 = 2;
    v19 = type metadata accessor for AttributedString(0);
    v20 = sub_1000177C4(&qword_10006D588, (uint64_t (*)(uint64_t))&type metadata accessor for AttributedString, (uint64_t)&protocol conformance descriptor for AttributedString);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v18, &v31, v5, v19, v20);
    v21 = v3 + v14[7];
    v30 = 3;
    v22 = type metadata accessor for URL(0);
    v23 = sub_1000177C4(&qword_10006D590, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v21, &v30, v5, v22, v23);
    v24 = v3 + v14[8];
    v29 = 4;
    v25 = type metadata accessor for UTType(0);
    v26 = sub_1000177C4(&qword_10006D598, (uint64_t (*)(uint64_t))&type metadata accessor for UTType, (uint64_t)&protocol conformance descriptor for UTType);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v24, &v29, v5, v25, v26);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10002AF88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t *v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;

  v51 = a2;
  v3 = sub_100011254((uint64_t *)&unk_10006D800);
  __chkstk_darwin(v3);
  v52 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v5);
  v53 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254(&qword_10006D458);
  __chkstk_darwin(v7);
  v54 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = type metadata accessor for UUID(0);
  v58 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v56 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_100011254(&qword_10006D558);
  v57 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CRLSEManifestItem(0);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v15[*(int *)(v13 + 20)];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v65 = (uint64_t *)v16;
  v17 = (uint64_t)&v15[*(int *)(v13 + 24)];
  v18 = type metadata accessor for AttributedString(0);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v63 = v17;
  v19(v17, 1, 1, v18);
  v20 = (uint64_t)&v15[*(int *)(v12 + 28)];
  v21 = type metadata accessor for URL(0);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v62 = v20;
  v22(v20, 1, 1, v21);
  v23 = (uint64_t)&v15[*(int *)(v12 + 32)];
  v24 = type metadata accessor for UTType(0);
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v61 = v23;
  v25(v23, 1, 1, v24);
  v27 = a1[3];
  v26 = a1[4];
  sub_100017804(a1, v27);
  v28 = sub_10002D850();
  v59 = v11;
  v29 = v64;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CRLSEManifestItem.CodingKeys, &type metadata for CRLSEManifestItem.CodingKeys, v28, v27, v26);
  if (v29)
  {
    sub_10001786C(a1);
    v36 = v62;
    v37 = v63;
    v38 = v61;
    swift_bridgeObjectRelease(v65[1]);
    sub_100019B80(v37, &qword_10006D458);
    sub_100019B80(v36, &qword_10006D050);
    return sub_100019B80(v38, (uint64_t *)&unk_10006D800);
  }
  else
  {
    v30 = v18;
    v49 = v24;
    v50 = v21;
    v31 = (uint64_t)v54;
    v32 = v58;
    v64 = a1;
    v70 = 0;
    v33 = sub_1000177C4(&qword_10006CB10, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v35 = v55;
    v34 = v56;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v55, &v70, v60, v55, v33);
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v15, v34, v35);
    v69 = 1;
    v39 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v69, v60);
    v40 = v65;
    *v65 = v39;
    v40[1] = v41;
    v68 = 2;
    v42 = sub_1000177C4(&qword_10006D568, (uint64_t (*)(uint64_t))&type metadata accessor for AttributedString, (uint64_t)&protocol conformance descriptor for AttributedString);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v30, &v68, v60, v30, v42);
    sub_10002D894(v31, v63, &qword_10006D458);
    v67 = 3;
    v43 = sub_1000177C4(&qword_10006D570, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v44 = (uint64_t)v53;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v50, &v67, v60, v50, v43);
    sub_10002D894(v44, v62, &qword_10006D050);
    v66 = 4;
    v45 = sub_1000177C4(&qword_10006D578, (uint64_t (*)(uint64_t))&type metadata accessor for UTType, (uint64_t)&protocol conformance descriptor for UTType);
    v46 = (uint64_t)v52;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v49, &v66, v60, v49, v45);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v60);
    sub_10002D894(v46, v61, (uint64_t *)&unk_10006D800);
    sub_1000191EC((uint64_t)v15, v51, type metadata accessor for CRLSEManifestItem);
    sub_10001786C(v64);
    return sub_100013BBC((uint64_t)v15, type metadata accessor for CRLSEManifestItem);
  }
}

uint64_t sub_10002B52C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10002B55C + 4 * byte_1000529F4[*v0]))(0x444955556D657469, 0xE800000000000000);
}

uint64_t sub_10002B55C()
{
  return 0x656C746974;
}

uint64_t sub_10002B570()
{
  return 0x7475626972747461;
}

uint64_t sub_10002B594()
{
  return 7107189;
}

uint64_t sub_10002B5A4()
{
  return 0x495455616964656DLL;
}

uint64_t sub_10002B5B8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10002DDD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002B5DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002D850();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002B604(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002D850();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002B62C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002AF88(a1, a2);
}

uint64_t sub_10002B640(_QWORD *a1)
{
  return sub_10002AD10(a1);
}

uint64_t sub_10002B654(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  char *v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  char *v35;
  char *v36;
  char v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  BOOL v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t ObjCClassFromMetadata;
  objc_class *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  NSBundle v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  Swift::String v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __n128 v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  __int128 v97;
  char *v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  void *object;
  uint64_t v109;
  uint64_t v110;

  v2 = type metadata accessor for UTType(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v100 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v91 - v6;
  v8 = sub_100011254((uint64_t *)&unk_10006D800);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (uint64_t)&v91 - v13;
  v15 = __chkstk_darwin(v12);
  v107 = (char *)&v91 - v16;
  result = __chkstk_darwin(v15);
  v106 = (uint64_t)&v91 - v18;
  if ((unint64_t)a1 >> 62)
    goto LABEL_57;
  v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v19)
    return v19;
LABEL_3:
  if (v19 >= 1)
  {
    v20 = 0;
    v102 = a1 & 0xC000000000000001;
    v95 = 0x8000000100054770;
    v96 = (unint64_t)"Recently Deleted";
    v94 = 0x8000000100053FF0;
    v97 = xmmword_100052780;
    v92 = 0x8000000100054700;
    v93 = 0x8000000100054730;
    v98 = (char *)_swiftEmptyArrayStorage;
    v109 = v3;
    v104 = v14;
    v105 = v2;
    v103 = v19;
    v101 = a1;
    while (1)
    {
      if (v20 >= 3)
      {
        __break(1u);
LABEL_57:
        if (a1 < 0)
          v89 = a1;
        else
          v89 = a1 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(a1);
        v19 = _CocoaArrayWrapper.endIndex.getter(v89);
        result = swift_bridgeObjectRelease(a1);
        if (!v19)
          return v19;
        goto LABEL_3;
      }
      v99 = v20;
      LODWORD(object) = *((unsigned __int8 *)&off_100062280 + v20 + 32);
      v110 = (uint64_t)_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(a1);
      v22 = 0;
      do
      {
        if (v102)
          v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v22, a1);
        else
          v23 = *(id *)(a1 + 8 * v22 + 32);
        v24 = v23;
        v25 = objc_msgSend(v23, "mediaUTI");
        if (v25)
        {
          v26 = v25;
          v27 = v107;
          static UTType._unconditionallyBridgeFromObjectiveC(_:)();

          v28 = v27;
          v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
          v29(v28, 0, 1, v2);
        }
        else
        {
          v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
          v28 = v107;
          v29(v107, 1, 1, v2);
        }
        v30 = v11;
        v31 = (uint64_t)v28;
        v32 = v106;
        sub_10002A60C(v31, v106);
        v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
        if (v33(v32, 1, v2))
        {
          sub_100019B80(v32, (uint64_t *)&unk_10006D800);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v32, v2);
          v34 = sub_100019B80(v32, (uint64_t *)&unk_10006D800);
          v35 = v7;
          v36 = v100;
          static UTType.image.getter(v34);
          v37 = UTType.conforms(to:)(v36);
          v38 = *(void (**)(char *, uint64_t))(v3 + 8);
          v39 = v36;
          v7 = v35;
          v38(v39, v2);
          v38(v35, v2);
          if ((v37 & 1) != 0)
          {
            v40 = 1;
            goto LABEL_23;
          }
        }
        v41 = objc_msgSend(v24, "image");

        v40 = v41 != 0;
LABEL_23:
        v42 = objc_msgSend(v24, "mediaUTI");
        v11 = v30;
        if (v42)
        {
          v43 = v42;
          static UTType._unconditionallyBridgeFromObjectiveC(_:)();

          v44 = 0;
        }
        else
        {
          v44 = 1;
        }
        v14 = v104;
        v2 = v105;
        v45 = v103;
        v29(v11, v44, 1, v105);
        sub_10002A60C((uint64_t)v11, v14);
        if (v33(v14, 1, v2))
        {
          v46 = sub_100019B80(v14, (uint64_t *)&unk_10006D800);
          if (v40)
            goto LABEL_9;
        }
        else
        {
          v47 = v109;
          (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v7, v14, v2);
          v48 = sub_100019B80(v14, (uint64_t *)&unk_10006D800);
          v49 = v100;
          static UTType.audiovisualContent.getter(v48);
          v14 = UTType.conforms(to:)(v49);
          v50 = *(void (**)(char *, uint64_t))(v47 + 8);
          v50(v49, v2);
          v46 = ((uint64_t (*)(char *, uint64_t))v50)(v7, v2);
          if (v40)
          {
LABEL_9:
            if ((_DWORD)object)
              goto LABEL_10;
            goto LABEL_34;
          }
          if ((v14 & 1) != 0)
          {
            if ((_DWORD)object != 1)
              goto LABEL_10;
            goto LABEL_34;
          }
        }
        if ((_DWORD)object != 2)
        {
LABEL_10:

          goto LABEL_11;
        }
LABEL_34:
        v14 = (uint64_t)&v110;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v46);
        v51 = *(_QWORD *)(v110 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v51);
        v52 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v24);
        specialized ContiguousArray._endMutation()(v52);
LABEL_11:
        a1 = v101;
        v3 = v109;
        ++v22;
      }
      while (v45 != v22);
      swift_bridgeObjectRelease(v101);
      v53 = v110;
      v54 = v110 < 0 || (v110 & 0x4000000000000000) != 0;
      if (v54)
      {
        v84 = swift_retain(v110);
        v14 = _CocoaArrayWrapper.endIndex.getter(v84);
        swift_release(v53);
        if (!v14)
          goto LABEL_5;
LABEL_40:
        if ((_DWORD)object)
        {
          if ((_DWORD)object == 1)
          {
            v55 = type metadata accessor for CRLSEExtensionContextManager(0);
            ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v55);
            v57 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
            v58 = 0xD000000000000039;
            v90 = v93;
            v59 = v96 | 0x8000000000000000;
            v60 = 0x6964656D20756C25;
            v61 = 0xEF736D6574692061;
            v62 = 0xD000000000000010;
            v63.super.isa = v57;
            v64 = 0x6964656D20756C25;
            v65 = 0xEF736D6574692061;
          }
          else
          {
            v68 = type metadata accessor for CRLSEExtensionContextManager(0);
            v69 = swift_getObjCClassFromMetadata(v68);
            v57 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v69);
            v58 = 0xD00000000000002ALL;
            v90 = v92;
            v59 = v96 | 0x8000000000000000;
            v60 = 0x6B6E696C20756C25;
            v61 = 0xE900000000000073;
            v62 = 0xD000000000000010;
            v63.super.isa = v57;
            v64 = 0x6B6E696C20756C25;
            v65 = 0xE900000000000073;
          }
        }
        else
        {
          v66 = type metadata accessor for CRLSEExtensionContextManager(0);
          v67 = swift_getObjCClassFromMetadata(v66);
          v57 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v67);
          v58 = 0xD00000000000002BLL;
          v90 = v95;
          v60 = 0x67616D6920756C25;
          v61 = 0xEA00000000007365;
          v62 = 0xD000000000000010;
          v59 = v94;
          v63.super.isa = v57;
          v64 = 0x67616D6920756C25;
          v65 = 0xEA00000000007365;
        }
        v70 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v60, *(Swift::String_optional *)&v62, v63, *(Swift::String *)&v64, *(Swift::String *)&v58);
        object = v70._object;

        v71 = sub_100011254((uint64_t *)&unk_10006D060);
        v72 = swift_allocObject(v71, 72, 7);
        *(_OWORD *)(v72 + 16) = v97;
        if (v54)
        {
          swift_bridgeObjectRetain(v53);
          v74 = _CocoaArrayWrapper.endIndex.getter(v73);
          swift_release(v53);
        }
        else
        {
          v74 = *(_QWORD *)(v53 + 16);
        }
        v75 = swift_release(v53);
        *(_QWORD *)(v72 + 56) = &type metadata for Int;
        *(_QWORD *)(v72 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v72 + 32) = v74;
        v76 = object;
        v77 = static String.localizedStringWithFormat(_:_:)(v70._countAndFlagsBits, object, v72, v75);
        v79 = v78;
        swift_bridgeObjectRelease(v76);
        swift_bridgeObjectRelease(v72);
        if ((swift_isUniquelyReferenced_nonNull_native(v98) & 1) == 0)
          v98 = sub_100045854(0, *((_QWORD *)v98 + 2) + 1, 1, v98);
        v21 = v99;
        v81 = *((_QWORD *)v98 + 2);
        v80 = *((_QWORD *)v98 + 3);
        v14 = v81 + 1;
        if (v81 >= v80 >> 1)
        {
          v85 = sub_100045854((char *)(v80 > 1), v81 + 1, 1, v98);
          v21 = v99;
          v98 = v85;
        }
        v82 = v98;
        *((_QWORD *)v98 + 2) = v14;
        v83 = &v82[16 * v81];
        *((_QWORD *)v83 + 4) = v77;
        *((_QWORD *)v83 + 5) = v79;
      }
      else
      {
        if (*(_QWORD *)(v110 + 16))
          goto LABEL_40;
LABEL_5:
        swift_release(v53);
        v21 = v99;
      }
      v20 = v21 + 1;
      if (v20 == 3)
      {
        v86 = v98;
        v110 = (uint64_t)v98;
        v87 = sub_100011254(&qword_10006D3B8);
        v88 = sub_10002BEFC();
        v19 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v87, v88);
        swift_bridgeObjectRelease(v86);
        return v19;
      }
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10002BEFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D6A0;
  if (!qword_10006D6A0)
  {
    v1 = sub_1000192FC(&qword_10006D3B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006D6A0);
  }
  return result;
}

uint64_t *sub_10002BF48(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v10);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = sub_100011254((uint64_t *)&unk_10006D7D0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = a3[6];
    v13 = (uint64_t *)((char *)a1 + v11);
    v14 = (uint64_t *)((char *)a2 + v11);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = (uint64_t *)((char *)a1 + v12);
    v17 = (uint64_t *)((char *)a2 + v12);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[7];
    v20 = *(uint64_t *)((char *)a2 + v19);
    *(uint64_t *)((char *)a1 + v19) = v20;
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v20);
  }
  return a1;
}

uint64_t sub_10002C068(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[6] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7]));
}

char *sub_10002C0F0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = a3[6];
  v11 = &a1[v9];
  v12 = &a2[v9];
  v13 = *((_QWORD *)v12 + 1);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *((_QWORD *)v11 + 1) = v13;
  v14 = &a1[v10];
  v15 = &a2[v10];
  v16 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = v16;
  v17 = a3[7];
  v18 = *(_QWORD *)&a2[v17];
  *(_QWORD *)&a1[v17] = v18;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v18);
  return a1;
}

char *sub_10002C1E4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  v16 = *((_QWORD *)v13 + 1);
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  v17 = a3[6];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v20 = *((_QWORD *)v19 + 1);
  v21 = *((_QWORD *)v18 + 1);
  *((_QWORD *)v18 + 1) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  v22 = a3[7];
  v23 = *(_QWORD *)&a2[v22];
  v24 = *(_QWORD *)&a1[v22];
  *(_QWORD *)&a1[v22] = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v24);
  return a1;
}

char *sub_10002C354(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  return a1;
}

char *sub_10002C424(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_100011254((uint64_t *)&unk_10006D7D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v16 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  v17 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRelease(v17);
  v18 = a3[6];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v22 = *(_QWORD *)v20;
  v21 = *((_QWORD *)v20 + 1);
  v23 = *((_QWORD *)v19 + 1);
  *(_QWORD *)v19 = v22;
  *((_QWORD *)v19 + 1) = v21;
  swift_bridgeObjectRelease(v23);
  v24 = a3[7];
  v25 = *(_QWORD *)&a1[v24];
  *(_QWORD *)&a1[v24] = *(_QWORD *)&a2[v24];
  swift_bridgeObjectRelease(v25);
  return a1;
}

uint64_t sub_10002C56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002C578);
}

uint64_t sub_10002C578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100011254((uint64_t *)&unk_10006D7D0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10002C5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002C608);
}

uint64_t sub_10002C608(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100011254((uint64_t *)&unk_10006D7D0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for CRLSEImportManifest(uint64_t a1)
{
  return sub_100014114(a1, qword_10006D418, (uint64_t)&nominal type descriptor for CRLSEImportManifest);
}

void sub_10002C69C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_1000141F4(319, (unint64_t *)&unk_10006CA88, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100052A28;
    v4[2] = &unk_100052A40;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

uint64_t *sub_10002C734(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t, __n128);
  __n128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v20);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v15 = type metadata accessor for AttributedString(0);
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t, __n128))(v16 + 48);
    v18 = swift_bridgeObjectRetain(v12);
    if (v17(v14, 1, v15, v18))
    {
      v19 = sub_100011254(&qword_10006D458);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    v21 = a3[7];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = type metadata accessor for URL(0);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      v26 = sub_100011254(&qword_10006D050);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    v27 = a3[8];
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    v30 = type metadata accessor for UTType(0);
    v31 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      v32 = sub_100011254((uint64_t *)&unk_10006D800);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
  }
  return a1;
}

uint64_t sub_10002C96C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[5] + 8));
  v5 = a1 + a2[6];
  v6 = type metadata accessor for AttributedString(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + a2[7];
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v11 = a1 + a2[8];
  v12 = type metadata accessor for UTType(0);
  v13 = *(_QWORD *)(v12 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  return result;
}

uint64_t sub_10002CA98(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(const void *, uint64_t, uint64_t, __n128);
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (void *)(a1 + v8);
  v13 = (const void *)(a2 + v8);
  v14 = type metadata accessor for AttributedString(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t, __n128))(v15 + 48);
  v17 = swift_bridgeObjectRetain(v11);
  if (v16(v13, 1, v14, v17))
  {
    v18 = sub_100011254(&qword_10006D458);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v19 = a3[7];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = type metadata accessor for URL(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = sub_100011254(&qword_10006D050);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v25 = a3[8];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = type metadata accessor for UTType(0);
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = sub_100011254((uint64_t *)&unk_10006D800);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v26, v27, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  return a1;
}

uint64_t sub_10002CCA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(void *, uint64_t, uint64_t);
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(void *, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v38;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v10 = v9[1];
  v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = a3[6];
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = type metadata accessor for AttributedString(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_100011254(&qword_10006D458);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  v21 = a3[7];
  v22 = (void *)(a1 + v21);
  v23 = (void *)(a2 + v21);
  v24 = type metadata accessor for URL(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  v27 = v26(v22, 1, v24);
  v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
LABEL_12:
    v29 = sub_100011254(&qword_10006D050);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v22, v23, v24);
LABEL_13:
  v30 = a3[8];
  v31 = (void *)(a1 + v30);
  v32 = (void *)(a2 + v30);
  v33 = type metadata accessor for UTType(0);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v34 + 48);
  v36 = v35(v31, 1, v33);
  v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v34 + 24))(v31, v32, v33);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v34 + 8))(v31, v33);
    goto LABEL_18;
  }
  if (v37)
  {
LABEL_18:
    v38 = sub_100011254((uint64_t *)&unk_10006D800);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v34 + 16))(v31, v32, v33);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  return a1;
}

uint64_t sub_10002CF90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for AttributedString(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100011254(&qword_10006D458);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = type metadata accessor for URL(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = sub_100011254(&qword_10006D050);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v19 = a3[8];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = type metadata accessor for UTType(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = sub_100011254((uint64_t *)&unk_10006D800);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

uint64_t sub_10002D184(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(void *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void *, uint64_t, uint64_t);
  int v37;
  int v38;
  uint64_t v39;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  v12 = v8[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  v13 = a3[6];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = type metadata accessor for AttributedString(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    v21 = sub_100011254(&qword_10006D458);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  v22 = a3[7];
  v23 = (void *)(a1 + v22);
  v24 = (void *)(a2 + v22);
  v25 = type metadata accessor for URL(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 32))(v23, v24, v25);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
LABEL_12:
    v30 = sub_100011254(&qword_10006D050);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 40))(v23, v24, v25);
LABEL_13:
  v31 = a3[8];
  v32 = (void *)(a1 + v31);
  v33 = (void *)(a2 + v31);
  v34 = type metadata accessor for UTType(0);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 48);
  v37 = v36(v32, 1, v34);
  v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 40))(v32, v33, v34);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v35 + 8))(v32, v34);
    goto LABEL_18;
  }
  if (v38)
  {
LABEL_18:
    v39 = sub_100011254((uint64_t *)&unk_10006D800);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 32))(v32, v33, v34);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return a1;
}

uint64_t sub_10002D460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002D46C);
}

uint64_t sub_10002D46C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 2147483646)
  {
    v9 = *(_QWORD *)(a1 + a3[5] + 8);
    if (v9 >= 0xFFFFFFFF)
      LODWORD(v9) = -1;
    v10 = v9 - 1;
    if (v10 < 0)
      v10 = -1;
    return (v10 + 1);
  }
  else
  {
    v11 = sub_100011254(&qword_10006D458);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v13 = v11;
      v14 = a3[6];
    }
    else
    {
      v15 = sub_100011254(&qword_10006D050);
      v12 = *(_QWORD *)(v15 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v13 = v15;
        v14 = a3[7];
      }
      else
      {
        v13 = sub_100011254((uint64_t *)&unk_10006D800);
        v12 = *(_QWORD *)(v13 - 8);
        v14 = a3[8];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1 + v14, a2, v13);
  }
}

uint64_t sub_10002D578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002D584);
}

uint64_t sub_10002D584(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + a4[5] + 8) = a2;
      return result;
    }
    v13 = sub_100011254(&qword_10006D458);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      v16 = sub_100011254(&qword_10006D050);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[7];
      }
      else
      {
        v10 = sub_100011254((uint64_t *)&unk_10006D800);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[8];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for CRLSEManifestItem(uint64_t a1)
{
  return sub_100014114(a1, (uint64_t *)&unk_10006D4B8, (uint64_t)&nominal type descriptor for CRLSEManifestItem);
}

void sub_10002D694(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[5];

  v2 = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v10[0] = *(_QWORD *)(v2 - 8) + 64;
    v10[1] = &unk_100052A28;
    sub_1000141F4(319, &qword_10006D4C8, (uint64_t (*)(uint64_t))&type metadata accessor for AttributedString);
    if (v5 <= 0x3F)
    {
      v10[2] = *(_QWORD *)(v4 - 8) + 64;
      sub_1000141F4(319, (unint64_t *)&qword_10006D4D0, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
      if (v7 <= 0x3F)
      {
        v10[3] = *(_QWORD *)(v6 - 8) + 64;
        sub_1000141F4(319, (unint64_t *)&unk_10006D4D8, (uint64_t (*)(uint64_t))&type metadata accessor for UTType);
        if (v9 <= 0x3F)
        {
          v10[4] = *(_QWORD *)(v8 - 8) + 64;
          swift_initStructMetadata(a1, 256, 5, v10, a1 + 16);
        }
      }
    }
  }
}

unint64_t sub_10002D788()
{
  unint64_t result;

  result = qword_10006D520;
  if (!qword_10006D520)
  {
    result = swift_getWitnessTable(&unk_100052CE0, &type metadata for CRLSEImportManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D520);
  }
  return result;
}

uint64_t sub_10002D7CC(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v9 = sub_1000192FC(&qword_10006D528);
    sub_1000177C4(a2, type metadata accessor for CRLSEManifestItem, a3);
    result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002D850()
{
  unint64_t result;

  result = qword_10006D560;
  if (!qword_10006D560)
  {
    result = swift_getWitnessTable(&unk_100052C90, &type metadata for CRLSEManifestItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D560);
  }
  return result;
}

uint64_t sub_10002D894(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100011254(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t storeEnumTagSinglePayload for CRLSEManifestItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_10002D924 + 4 * byte_1000529FE[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10002D958 + 4 * byte_1000529F9[v4]))();
}

uint64_t sub_10002D958(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002D960(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002D968);
  return result;
}

uint64_t sub_10002D974(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002D97CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10002D980(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002D988(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEManifestItem.CodingKeys()
{
  return &type metadata for CRLSEManifestItem.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for CRLSEImportManifest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_10002D9F0 + 4 * byte_100052A08[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10002DA24 + 4 * byte_100052A03[v4]))();
}

uint64_t sub_10002DA24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002DA2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002DA34);
  return result;
}

uint64_t sub_10002DA40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002DA48);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10002DA4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002DA54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEImportManifest.CodingKeys()
{
  return &type metadata for CRLSEImportManifest.CodingKeys;
}

unint64_t sub_10002DA74()
{
  unint64_t result;

  result = qword_10006D5A0;
  if (!qword_10006D5A0)
  {
    result = swift_getWitnessTable(&unk_100052BB0, &type metadata for CRLSEImportManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D5A0);
  }
  return result;
}

unint64_t sub_10002DABC()
{
  unint64_t result;

  result = qword_10006D5A8;
  if (!qword_10006D5A8)
  {
    result = swift_getWitnessTable(&unk_100052C68, &type metadata for CRLSEManifestItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D5A8);
  }
  return result;
}

unint64_t sub_10002DB04()
{
  unint64_t result;

  result = qword_10006D5B0;
  if (!qword_10006D5B0)
  {
    result = swift_getWitnessTable(&unk_100052BD8, &type metadata for CRLSEManifestItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D5B0);
  }
  return result;
}

unint64_t sub_10002DB4C()
{
  unint64_t result;

  result = qword_10006D5B8;
  if (!qword_10006D5B8)
  {
    result = swift_getWitnessTable(&unk_100052C00, &type metadata for CRLSEManifestItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D5B8);
  }
  return result;
}

unint64_t sub_10002DB94()
{
  unint64_t result;

  result = qword_10006D5C0;
  if (!qword_10006D5C0)
  {
    result = swift_getWitnessTable(&unk_100052B20, &type metadata for CRLSEImportManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D5C0);
  }
  return result;
}

unint64_t sub_10002DBDC()
{
  unint64_t result;

  result = qword_10006D5C8;
  if (!qword_10006D5C8)
  {
    result = swift_getWitnessTable(&unk_100052B48, &type metadata for CRLSEImportManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10006D5C8);
  }
  return result;
}

uint64_t sub_10002DC20(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x4955556472616F62 && a2 == 0xE900000000000044)
  {
    v5 = 0xE900000000000044;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4955556472616F62, 0xE900000000000044, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6D614E72656E776FLL && a2 == 0xE900000000000065)
  {
    v7 = 0xE900000000000065;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D614E72656E776FLL, 0xE900000000000065, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    v8 = 0xE500000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease(0xE500000000000000);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x736D657469, 0xE500000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_10002DDD8(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;

  if (a1 == 0x444955556D657469 && a2 == 0xE800000000000000)
  {
    v5 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x444955556D657469, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    v7 = 0xE500000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x7475626972747461 && a2 == 0xEE00747865546465)
  {
    v8 = 0xEE00747865546465;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7475626972747461, 0xEE00747865546465, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    v9 = 0xE300000000000000;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(7107189, 0xE300000000000000, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x495455616964656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease(0xE800000000000000);
    return 4;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x495455616964656DLL, 0xE800000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

id sub_10002E000()
{
  return sub_10002E020(&OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter, 1);
}

id sub_10002E010()
{
  return sub_10002E020(&OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter, 2);
}

id sub_10002E020(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v7;
  void *v8;
  id v9;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v7 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
    objc_msgSend(v7, "setDateStyle:", a2);
    objc_msgSend(v7, "setTimeStyle:", 1);
    v8 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v7;
    v5 = v7;

    v4 = 0;
  }
  v9 = v4;
  return v5;
}

id sub_10002E0C0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  NSString v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", v5);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_10002E21C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id result;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ObjCClassFromMetadata;
  id v30;
  NSString v31;
  NSString v32;
  NSString v33;
  id v34;
  uint64_t v35;
  NSString v36;
  __objc2_meth *v37;
  char **v38;
  id v39;
  NSString v40;
  id v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  Class isa;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t ObjectType;
  uint64_t v98;
  _QWORD v99[2];
  _OWORD v100[2];
  __int128 v101;
  __int128 v102;

  v1 = v0;
  ObjectType = swift_getObjectType(v0);
  v2 = sub_100011254(&qword_10006D668);
  v95 = *(_QWORD *)(v2 - 8);
  v96 = v2;
  v3 = __chkstk_darwin(v2);
  v92 = v4;
  v93 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v94 = (char *)&v91 - v5;
  v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v91 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v91 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v91 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v91 - v19;
  objc_msgSend(v1, "setEdgesForExtendedLayout:", 0);
  result = objc_msgSend(v1, "view");
  if (!result)
  {
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v22 = result;
  v23 = objc_msgSend((id)objc_opt_self(UIColor), "systemGroupedBackgroundColor");
  objc_msgSend(v22, "setBackgroundColor:", v23);

  v24 = objc_msgSend(v1, "navigationItem");
  v25 = (uint64_t)v1 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject;
  sub_1000191EC((uint64_t)v1 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject, (uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
  sub_1000191EC((uint64_t)v20, (uint64_t)v18, type metadata accessor for CRLSELibraryViewModel.Item);
  v98 = v6;
  if (swift_getEnumCaseMultiPayload(v18, v6) == 1)
  {
    sub_100013BBC((uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000191EC(v25, (uint64_t)v15, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000155EC();
    v27 = v26;
    sub_100013BBC((uint64_t)v15, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  else
  {
    sub_100013BBC((uint64_t)v18, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_100013BBC((uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
    v28 = type metadata accessor for CRLSEExtensionContextManager(0);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v28);
    v30 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
    v31 = String._bridgeToObjectiveC()();
    v32 = String._bridgeToObjectiveC()();
    v33 = String._bridgeToObjectiveC()();
    v34 = objc_msgSend(v30, "localizedStringForKey:value:table:", v31, v32, v33);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
    v27 = v35;

  }
  v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v27);
  objc_msgSend(v24, "setTitle:", v36);

  sub_1000191EC(v25, (uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
  sub_1000191EC((uint64_t)v12, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
  if (swift_getEnumCaseMultiPayload(v9, v98))
  {
    sub_100013BBC((uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_100013BBC((uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
    v37 = &stru_10006A000;
    v38 = &selRef_centerXAnchor;
  }
  else
  {
    sub_100013BBC((uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
    v39 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v40 = String._bridgeToObjectiveC()();
    v41 = objc_msgSend(v39, "objectForInfoDictionaryKey:", v40);

    if (v41)
    {
      _bridgeAnyObjectToAny(_:)(v100, v41);
      swift_unknownObjectRelease(v41);
    }
    else
    {
      memset(v100, 0, sizeof(v100));
    }
    v37 = &stru_10006A000;
    v38 = &selRef_centerXAnchor;
    sub_100031D00((uint64_t)v100, (uint64_t)&v101, &qword_10006D0F0);
    if (*((_QWORD *)&v102 + 1))
    {
      v42 = swift_dynamicCast(v99, &v101, (char *)&type metadata for Any + 8, &type metadata for String, 6);
      if (v42)
        v43 = v99[0];
      else
        v43 = 0;
      if (v42)
        v44 = v99[1];
      else
        v44 = 0;
    }
    else
    {
      sub_100019B80((uint64_t)&v101, &qword_10006D0F0);
      v43 = 0;
      v44 = 0;
    }
    v45 = objc_msgSend(v1, "navigationItem");
    v101 = 0u;
    v102 = 0u;
    v46 = objc_allocWithZone((Class)UIBarButtonItem);
    v47 = sub_100031960(v43, v44, 0, &v101, 0);
    objc_msgSend(v45, "setBackBarButtonItem:", v47);

  }
  v48 = objc_msgSend(v1, v38[54]);
  v49 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v1, "cancel:");
  objc_msgSend(v48, "setRightBarButtonItem:", v49);

  v50 = sub_10002F428();
  objc_msgSend(v50, "setDelegate:", v1);
  result = objc_msgSend(v1, v37[159].types);
  if (!result)
    goto LABEL_26;
  v51 = result;
  objc_msgSend(result, "addSubview:", v50);

  v52 = sub_100011254(&qword_10006D670);
  v53 = swift_allocObject(v52, 64, 7);
  *(_OWORD *)(v53 + 16) = xmmword_1000527B0;
  v54 = objc_msgSend(v50, "topAnchor");
  result = objc_msgSend(v1, v37[159].types);
  if (!result)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v55 = result;
  v56 = objc_msgSend(result, "topAnchor");

  v57 = objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  *(_QWORD *)(v53 + 32) = v57;
  v58 = objc_msgSend(v50, "bottomAnchor");
  result = objc_msgSend(v1, v37[159].types);
  if (!result)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v59 = result;
  v60 = objc_msgSend(result, "bottomAnchor");

  v61 = objc_msgSend(v58, "constraintEqualToAnchor:", v60);
  *(_QWORD *)(v53 + 40) = v61;
  v62 = objc_msgSend(v50, "leadingAnchor");
  result = objc_msgSend(v1, v37[159].types);
  if (!result)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v63 = result;
  v64 = objc_msgSend(result, "leadingAnchor");

  v65 = objc_msgSend(v62, "constraintEqualToAnchor:", v64);
  *(_QWORD *)(v53 + 48) = v65;
  v66 = objc_msgSend(v50, "trailingAnchor");
  result = objc_msgSend(v1, v37[159].types);
  if (result)
  {
    v67 = result;
    v68 = (void *)objc_opt_self(NSLayoutConstraint);
    v69 = objc_msgSend(v67, "trailingAnchor");

    v70 = objc_msgSend(v66, "constraintEqualToAnchor:", v69);
    *(_QWORD *)(v53 + 56) = v70;
    *(_QWORD *)&v101 = v53;
    specialized Array._endMutation()(v71);
    v72 = v101;
    sub_10002663C(0, (unint64_t *)&qword_10006D080, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v72);
    objc_msgSend(v68, "activateConstraints:", isa);

    v74 = swift_allocObject(&unk_100063508, 24, 7);
    *(_QWORD *)(v74 + 16) = v1;
    v75 = sub_10002663C(0, &qword_10006D0D0, UICollectionViewListCell_ptr);
    v76 = v1;
    v77 = v94;
    UICollectionView.CellRegistration.init(handler:)(sub_100031C3C, v74, v75, v98);
    v79 = v95;
    v78 = v96;
    v80 = v93;
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v93, v77, v96);
    v81 = *(unsigned __int8 *)(v79 + 80);
    v82 = (v81 + 16) & ~v81;
    v83 = swift_allocObject(&unk_100063530, v82 + v92, v81 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v83 + v82, v80, v78);
    v84 = objc_allocWithZone((Class)sub_100011254(&qword_10006D678));
    v85 = v50;
    v86 = UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)(v85, sub_100031CA8, v83);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v77, v78);
    v87 = *(void **)&v76[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource];
    *(_QWORD *)&v76[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource] = v86;

    sub_10002ED44(0);
    v88 = sub_100011254(&qword_10006D110);
    v89 = swift_allocObject(v88, 48, 7);
    *(_OWORD *)(v89 + 16) = xmmword_100052780;
    *(_QWORD *)(v89 + 32) = type metadata accessor for UITraitPreferredContentSizeCategory(0);
    *(_QWORD *)(v89 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
    v90 = UIViewController.registerForTraitChanges<A>(_:handler:)(v89, sub_100031A90, 0, ObjectType);

    swift_bridgeObjectRelease(v89);
    return (id)swift_unknownObjectRelease(v90);
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002ED44(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int EnumCaseMultiPayload;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  char *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD *v75;

  v65 = a1;
  v1 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v68 = *(_QWORD *)(v1 - 8);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v69 = (uint64_t)&v62 - v6;
  __chkstk_darwin(v5);
  v73 = (uint64_t *)((char *)&v62 - v7);
  v8 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v74 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v62 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v62 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v62 - v18;
  v20 = sub_100011254(&qword_10006D650);
  v62 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100031B8C();
  v24 = sub_100031BD0();
  NSDiffableDataSourceSnapshot.init()(&type metadata for CRLSEiOSBoardPickerViewController.CollectionViewSection, v8, v23, v24);
  v63 = v22;
  v64 = v20;
  v25 = v8;
  v26 = v67;
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_1000622D0);
  v27 = v26 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject;
  sub_1000191EC(v26 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject, (uint64_t)v19, type metadata accessor for CRLSELibraryViewModel.Item);
  v71 = v19;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v19, v25);
  v29 = *(_QWORD *)(v27 + *(int *)(v1 + 20));
  v72 = v29;
  if (!EnumCaseMultiPayload)
  {
    v66 = v1;
    v70 = v14;
    v37 = _swiftEmptyArrayStorage;
    v75 = _swiftEmptyArrayStorage;
    v38 = *(_QWORD *)(v29 + 16);
    swift_bridgeObjectRetain(v29);
    v71 = (char *)v38;
    if (!v38)
    {
      v48 = _swiftEmptyArrayStorage;
      v40 = v68;
      result = v72;
LABEL_27:
      swift_bridgeObjectRelease(result);
      v49 = v48[2];
      if (v49)
      {
        v75 = _swiftEmptyArrayStorage;
        sub_10003984C(0, v49, 0);
        v50 = *(unsigned __int8 *)(v40 + 80);
        v73 = v48;
        v51 = (uint64_t)v48 + ((v50 + 32) & ~v50);
        v52 = *(_QWORD *)(v40 + 72);
        v53 = (uint64_t)v70;
        do
        {
          sub_1000191EC(v51, (uint64_t)v4, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_1000191EC((uint64_t)v4, v53, type metadata accessor for CRLSELibraryViewModel.Item);
          sub_100013BBC((uint64_t)v4, type metadata accessor for CRLSELibraryViewModeItemNode);
          v31 = v75;
          if ((swift_isUniquelyReferenced_nonNull_native(v75) & 1) == 0)
          {
            sub_10003984C(0, v31[2] + 1, 1);
            v53 = (uint64_t)v70;
            v31 = v75;
          }
          v55 = v31[2];
          v54 = v31[3];
          if (v55 >= v54 >> 1)
          {
            sub_10003984C(v54 > 1, v55 + 1, 1);
            v53 = (uint64_t)v70;
            v31 = v75;
          }
          v31[2] = v55 + 1;
          sub_100017A6C(v53, (uint64_t)v31+ ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80))+ *(_QWORD *)(v74 + 72) * v55, type metadata accessor for CRLSELibraryViewModel.Item);
          v51 += v52;
          --v49;
        }
        while (v49);
        swift_release(v73);
        v26 = v67;
      }
      else
      {
        swift_release(v48);
        v31 = _swiftEmptyArrayStorage;
      }
      goto LABEL_36;
    }
    v39 = 0;
    v40 = v68;
    result = v72;
    while (1)
    {
      if ((unint64_t)v39 >= *(_QWORD *)(result + 16))
      {
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        return result;
      }
      v43 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
      v44 = *(_QWORD *)(v40 + 72);
      v45 = (uint64_t)v73;
      sub_1000191EC(result + v43 + v44 * (_QWORD)v39, (uint64_t)v73, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC(v45, (uint64_t)v17, type metadata accessor for CRLSELibraryViewModel.Item);
      if (swift_getEnumCaseMultiPayload(v17, v25) == 1)
      {
        v42 = (uint64_t)v73;
        if (*v17 != 4 && *(_QWORD *)(*(_QWORD *)((char *)v73 + *(int *)(v66 + 20)) + 16))
        {
          sub_100017A6C((uint64_t)v73, v69, type metadata accessor for CRLSELibraryViewModeItemNode);
          if ((swift_isUniquelyReferenced_nonNull_native(v37) & 1) == 0)
            sub_1000397B4(0, v37[2] + 1, 1);
          v37 = v75;
          v47 = v75[2];
          v46 = v75[3];
          if (v47 >= v46 >> 1)
          {
            sub_1000397B4(v46 > 1, v47 + 1, 1);
            v37 = v75;
          }
          v37[2] = v47 + 1;
          sub_100017A6C(v69, (uint64_t)v37 + v43 + v47 * v44, type metadata accessor for CRLSELibraryViewModeItemNode);
          v40 = v68;
          goto LABEL_15;
        }
      }
      else
      {
        sub_100013BBC((uint64_t)v17, type metadata accessor for CRLSELibraryViewModel.Item);
        v42 = (uint64_t)v73;
      }
      sub_100013BBC(v42, type metadata accessor for CRLSELibraryViewModeItemNode);
LABEL_15:
      ++v39;
      result = v72;
      if (v71 == v39)
      {
        v48 = v75;
        v26 = v67;
        goto LABEL_27;
      }
    }
  }
  v30 = *(_QWORD *)(v29 + 16);
  v31 = _swiftEmptyArrayStorage;
  if (v30)
  {
    v75 = _swiftEmptyArrayStorage;
    v32 = v29;
    swift_bridgeObjectRetain(v29);
    sub_10003984C(0, v30, 0);
    v33 = v32 + ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80));
    v34 = *(_QWORD *)(v68 + 72);
    v31 = v75;
    v73 = (_QWORD *)v34;
    do
    {
      sub_1000191EC(v33, (uint64_t)v4, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC((uint64_t)v4, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100013BBC((uint64_t)v4, type metadata accessor for CRLSELibraryViewModeItemNode);
      if ((swift_isUniquelyReferenced_nonNull_native(v31) & 1) == 0)
      {
        sub_10003984C(0, v31[2] + 1, 1);
        v34 = (uint64_t)v73;
        v31 = v75;
      }
      v36 = v31[2];
      v35 = v31[3];
      if (v36 >= v35 >> 1)
      {
        sub_10003984C(v35 > 1, v36 + 1, 1);
        v34 = (uint64_t)v73;
        v31 = v75;
      }
      v31[2] = v36 + 1;
      sub_100017A6C((uint64_t)v11, (uint64_t)v31+ ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80))+ *(_QWORD *)(v74 + 72) * v36, type metadata accessor for CRLSELibraryViewModel.Item);
      v33 += v34;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease(v72);
    v26 = v67;
  }
  sub_100013BBC((uint64_t)v71, type metadata accessor for CRLSELibraryViewModel.Item);
LABEL_36:
  v56 = v65;
  v58 = v63;
  v57 = v64;
  LOBYTE(v75) = 1;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)(v31, &v75, v64);
  result = swift_bridgeObjectRelease(v31);
  v59 = *(void **)(v26 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource);
  if ((v56 & 1) != 0)
  {
    if (!v59)
      goto LABEL_43;
    v60 = v59;
    dispatch thunk of UICollectionViewDiffableDataSource.applySnapshotUsingReloadData(_:completion:)(v58, 0, 0);
  }
  else
  {
    if (!v59)
      goto LABEL_44;
    v60 = v59;
    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)(v58, 0, 0, 0);
  }
  v61 = v62;

  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v58, v57);
}

id sub_10002F428()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id result;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UICollectionLayoutListConfiguration.Appearance(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UICollectionLayoutListConfiguration(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for UICollectionLayoutListConfiguration.Appearance.insetGrouped(_:), v6);
  UICollectionLayoutListConfiguration.init(appearance:)(v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for UICollectionLayoutListConfiguration.HeaderMode.none(_:), v2);
  UICollectionLayoutListConfiguration.headerMode.setter(v5);
  UICollectionLayoutListConfiguration.showsSeparators.setter(1);
  sub_10002663C(0, &qword_10006D0B8, UICollectionViewCompositionalLayout_ptr);
  v14 = (void *)static UICollectionViewCompositionalLayout.list(using:)(v13);
  result = objc_msgSend(v1, "view");
  if (result)
  {
    v16 = result;
    objc_msgSend(result, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = objc_msgSend(objc_allocWithZone((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v14, v18, v20, v22, v24);
    objc_msgSend(v25, "setCollectionViewLayout:", v14);
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10002F650(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int EnumCaseMultiPayload;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  void (*v50)(_QWORD *, _QWORD);
  void (*v51)(_QWORD *, _QWORD);
  void *v52;
  id v53;
  void (*v54)(_QWORD *, _QWORD);
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  id v59;
  uint64_t v60;
  Class isa;
  void *v62;
  id v63;
  uint64_t v64;
  unsigned int v65;
  int *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  _QWORD v73[2];
  int v74;
  uint64_t v75;
  char *v76;
  id v77;
  id v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  void *v87;
  __int128 v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[3];

  v89 = a4;
  v79 = sub_100011254(&qword_10006D680);
  __chkstk_darwin(v79);
  *(_QWORD *)&v88 = (char *)v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v8 = __chkstk_darwin(v7);
  v76 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v81 = (char *)v73 - v11;
  v12 = __chkstk_darwin(v10);
  v73[1] = (char *)v73 - v13;
  v14 = __chkstk_darwin(v12);
  v80 = (char *)v73 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)v73 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)v73 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)v73 - v22;
  v24 = sub_100011254((uint64_t *)&unk_10006D130);
  __chkstk_darwin(v24);
  v26 = (char *)v73 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for Date(0);
  v28 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v30 = (char *)v73 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for UIListContentConfiguration(0);
  v82 = *(_QWORD *)(v31 - 8);
  v83 = v31;
  v32 = __chkstk_darwin(v31);
  v86 = (char *)v73 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = a1;
  UICollectionViewListCell.defaultContentConfiguration()(v32);
  sub_1000155EC();
  v85 = v34;
  v90 = a3;
  v91 = v35;
  sub_1000191EC(a3, (uint64_t)v23, type metadata accessor for CRLSELibraryViewModel.Item);
  v92 = v7;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v23, v7);
  if (EnumCaseMultiPayload == 3)
  {
    v39 = sub_100011254((uint64_t *)&unk_10006D630);
    swift_bridgeObjectRelease(*(_QWORD *)&v23[*(int *)(v39 + 48) + 8]);
    sub_100031D00((uint64_t)&v23[*(int *)(v39 + 64)], (uint64_t)v26, (uint64_t *)&unk_10006D130);
    v40 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v40 - 8) + 8))(v23, v40);
  }
  else
  {
    if (EnumCaseMultiPayload == 2)
    {
      v37 = sub_100011254((uint64_t *)&unk_10006D640);
      swift_bridgeObjectRelease(*(_QWORD *)&v23[*(int *)(v37 + 48) + 8]);
      sub_100031D00((uint64_t)&v23[*(int *)(v37 + 80)], (uint64_t)v26, (uint64_t *)&unk_10006D130);
      v38 = type metadata accessor for CRLSEBoardIdentifier;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v26, 1, 1, v27);
      v38 = type metadata accessor for CRLSELibraryViewModel.Item;
    }
    sub_100013BBC((uint64_t)v23, v38);
  }
  v41 = v89;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1)
  {
    sub_100019B80((uint64_t)v26, (uint64_t *)&unk_10006D130);
    v75 = 0;
    v84 = 0;
    v42 = 0;
    v43 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v30, v26, v27);
    v42 = sub_1000308CC((uint64_t)v30);
    v43 = v44;
    v75 = v45;
    v84 = v46;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  }
  v47 = objc_msgSend(v41, "traitCollection");
  v48 = objc_msgSend(v47, "preferredContentSizeCategory");

  v74 = static UIContentSizeCategory.< infix(_:_:)(v48, UIContentSizeCategoryAccessibilityMedium);
  v49 = v91;
  swift_bridgeObjectRetain(v91);
  UIListContentConfiguration.text.setter(v85, v49);
  UIListContentConfiguration.secondaryText.setter(v42, v43);
  v50 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v93);
  UIListContentConfiguration.TextProperties.numberOfLines.setter(1);
  v50(v93, 0);
  v51 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v93);
  UIListContentConfiguration.TextProperties.showsExpansionTextWhenTruncated.setter(1);
  v51(v93, 0);
  v52 = (void *)objc_opt_self(UIColor);
  v53 = objc_msgSend(v52, "secondaryLabelColor");
  v54 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v93);
  UIListContentConfiguration.TextProperties.color.setter(v53);
  v54(v93, 0);
  v55 = sub_100011254(&qword_10006D670);
  v56 = swift_allocObject(v55, 48, 7);
  *(_OWORD *)(v56 + 16) = xmmword_100052790;
  *(_QWORD *)(v56 + 32) = objc_msgSend(v52, "whiteColor");
  sub_1000191EC(v90, (uint64_t)v21, type metadata accessor for CRLSELibraryViewModel.Item);
  v57 = swift_getEnumCaseMultiPayload(v21, v92);
  v58 = v87;
  if (v57 == 1)
  {
    v59 = sub_100015E3C(*v21);
  }
  else
  {
    sub_100013BBC((uint64_t)v21, type metadata accessor for CRLSELibraryViewModel.Item);
    v59 = objc_msgSend(v58, "tintColor");
    if (!v59)
    {
      swift_bridgeObjectRelease(v84);
      __break(1u);
      JUMPOUT(0x100030598);
    }
  }
  *(_QWORD *)(v56 + 40) = v59;
  v93[0] = v56;
  specialized Array._endMutation()(v59);
  v60 = v93[0];
  sub_10002663C(0, &qword_10006D688, UIColor_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v60);
  v62 = (void *)objc_opt_self(UIImageSymbolConfiguration);
  v63 = objc_msgSend(v62, "configurationWithPaletteColors:", isa);

  v77 = objc_msgSend(v62, "configurationWithTextStyle:scale:", UIFontTextStyleTitle1, -1);
  v89 = objc_msgSend(v77, "configurationByApplyingConfiguration:", v63);
  v64 = v90;
  sub_1000191EC(v90, (uint64_t)v18, type metadata accessor for CRLSELibraryViewModel.Item);
  v65 = swift_getEnumCaseMultiPayload(v18, v92);
  if (v65 >= 2)
  {
    if (v65 == 2)
    {
      v66 = (int *)sub_100011254((uint64_t *)&unk_10006D640);
      swift_bridgeObjectRelease(*(_QWORD *)&v18[v66[12] + 8]);
      v67 = v18[v66[16]];
      sub_100019B80((uint64_t)&v18[v66[20]], (uint64_t *)&unk_10006D130);
      sub_100013BBC((uint64_t)v18, type metadata accessor for CRLSEBoardIdentifier);
      goto LABEL_18;
    }
    v68 = sub_100011254((uint64_t *)&unk_10006D630);
    swift_bridgeObjectRelease(*(_QWORD *)&v18[*(int *)(v68 + 48) + 8]);
    sub_100019B80((uint64_t)&v18[*(int *)(v68 + 64)], (uint64_t *)&unk_10006D130);
    v69 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v69 - 8) + 8))(v18, v69);
  }
  v67 = 0;
LABEL_18:
  v70 = *(int *)(v79 + 48);
  v71 = v88;
  sub_1000191EC(v64, v88, type metadata accessor for CRLSELibraryViewModel.Item);
  *(_BYTE *)(v71 + v70) = v67;
  v72 = (char *)&loc_10002FD90 + *((int *)qword_100030598 + swift_getEnumCaseMultiPayload(v71, v92));
  v78 = v63;
  __asm { BR              X10 }
}

void *sub_1000305A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v39 = a4;
  v40 = a1;
  v6 = sub_100011254(&qword_10006D0E0);
  __chkstk_darwin(v6);
  v36 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions(0);
  v37 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UICellAccessory.DisplayedState(0);
  v34 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100011254(&qword_10006D108);
  __chkstk_darwin(v18);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000191EC(a3, (uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v20, 0, 1, v14);
  v21 = sub_10002663C(0, &qword_10006D0D0, UICollectionViewListCell_ptr);
  v22 = (void *)UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)(v39, a2, v20, v21, v14);
  sub_100019B80((uint64_t)v20, &qword_10006D108);
  sub_1000191EC(a3, (uint64_t)v17, type metadata accessor for CRLSELibraryViewModel.Item);
  if (swift_getEnumCaseMultiPayload(v17, v14) == 1)
  {
    v23 = sub_100011254(&qword_10006D0E8);
    v24 = type metadata accessor for UICellAccessory(0);
    v25 = swift_allocObject(v23, ((*(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80) | 7);
    *(_OWORD *)(v25 + 16) = xmmword_100052780;
    v27 = v34;
    v26 = v35;
    (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v13, enum case for UICellAccessory.DisplayedState.always(_:), v35);
    v28 = type metadata accessor for UICellAccessory.LayoutDimension(0);
    v29 = v36;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v36, 1, 1, v28);
    v30 = v22;
    UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2, v29, 0);
    static UICellAccessory.disclosureIndicator(displayed:options:)(v13, v10);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v26);
    UICollectionViewListCell.accessories.setter(v25);

  }
  else
  {
    v31 = v22;
    UICollectionViewListCell.accessories.setter(_swiftEmptyArrayStorage);

    sub_100013BBC((uint64_t)v17, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  return v22;
}

uint64_t sub_1000308CC(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  Class isa;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  Class v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  id v40;
  Class v41;
  id v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  id v46;
  Class v47;
  id v48;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;

  v56 = type metadata accessor for Calendar.Component(0);
  v54 = *(_QWORD *)(v56 - 8);
  __chkstk_darwin(v56);
  v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100011254((uint64_t *)&unk_10006D130);
  __chkstk_darwin(v4);
  v55 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Date(0);
  v57 = *(_QWORD *)(v6 - 8);
  v58 = v6;
  v7 = __chkstk_darwin(v6);
  v51 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v52 = (char *)&v50 - v9;
  v10 = type metadata accessor for Calendar(0);
  v11 = *(_QWORD *)(v10 - 8);
  v59 = v10;
  v60 = v11;
  v12 = __chkstk_darwin(v10);
  v61 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.current.getter(v12);
  v14 = sub_10002E000();
  objc_msgSend(v14, "setDoesRelativeDateFormatting:", 1);

  v15 = sub_10002E000();
  isa = Date._bridgeToObjectiveC()().super.isa;
  v17 = objc_msgSend(v15, "stringFromDate:", isa);

  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v20 = v19;

  v21 = sub_10002E000();
  objc_msgSend(v21, "setDoesRelativeDateFormatting:", 0);

  v22 = sub_10002E000();
  v53 = a1;
  v23 = Date._bridgeToObjectiveC()().super.isa;
  v24 = objc_msgSend(v22, "stringFromDate:", v23);

  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v27 = v26;

  if (v18 == v25 && v20 == v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v25, v27, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(v20);
    v28 = v54;
    v29 = v56;
    (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v3, enum case for Calendar.Component.weekOfYear(_:), v56);
    v30 = (uint64_t)v55;
    Calendar.date(byAdding:value:to:wrappingComponents:)(v3, 1, v53, 0);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v3, v29);
    v32 = v57;
    v31 = v58;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v30, 1, v58) == 1)
    {
      sub_100019B80(v30, (uint64_t *)&unk_10006D130);
      v33 = v59;
LABEL_11:
      v46 = sub_10002E010();
      v47 = Date._bridgeToObjectiveC()().super.isa;
      v48 = objc_msgSend(v46, "stringFromDate:", v47);

      static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v33);
      return v25;
    }
    v34 = v30;
    v35 = v52;
    v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 32))(v52, v34, v31);
    v37 = v51;
    static Date.now.getter(v36);
    v38 = Date.compare(_:)(v37);
    v39 = *(void (**)(char *, uint64_t))(v32 + 8);
    v39(v37, v31);
    v33 = v59;
    if (v38 != 1)
    {
      v39(v35, v31);
      goto LABEL_11;
    }
    swift_bridgeObjectRelease(v27);
    v40 = sub_10002E0C0();
    v41 = Date._bridgeToObjectiveC()().super.isa;
    v42 = objc_msgSend(v40, "stringFromDate:", v41);

    v43 = v31;
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
    v44 = v35;
    v20 = v45;

    v39(v44, v43);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v33);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v59);
    swift_bridgeObjectRelease(v27);
  }
  swift_bridgeObjectRetain(v20);
  return v18;
}

uint64_t sub_100030D4C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  Class isa;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  char *v36;
  _QWORD v37[10];
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v39 = type metadata accessor for UUID(0);
  v42 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v37[7] = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for CRLSEBoard(0);
  v5 = __chkstk_darwin(v38);
  v37[4] = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v37[5] = (char *)v37 - v7;
  v8 = type metadata accessor for CRLSEBoardIdentifier(0);
  v37[8] = *(_QWORD *)(v8 - 8);
  v37[9] = v8;
  __chkstk_darwin(v8);
  v41 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v37[2] = *(_QWORD *)(v10 - 8);
  v37[3] = v10;
  v11 = __chkstk_darwin(v10);
  v37[0] = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = sub_100011254(&qword_10006D030);
  __chkstk_darwin(v13);
  v37[1] = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100011254(&qword_10006D108);
  __chkstk_darwin(v15);
  v17 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v37[6] = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v20);
  v40 = (char *)v37 - v23;
  v24 = __chkstk_darwin(v22);
  v25 = __chkstk_darwin(v24);
  v27 = (char *)v37 - v26;
  __chkstk_darwin(v25);
  v29 = (char *)v37 - v28;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v31 = a1;
  v32 = v43;
  objc_msgSend(v31, "deselectItemAtIndexPath:animated:", isa, 0);

  v33 = *(void **)(v32 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource);
  if (!v33)
  {
    __break(1u);
    JUMPOUT(0x100031610);
  }
  v34 = v33;
  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)(a2);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
  {
    sub_100017A6C((uint64_t)v17, (uint64_t)v29, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000191EC((uint64_t)v29, (uint64_t)v27, type metadata accessor for CRLSELibraryViewModel.Item);
    v36 = (char *)&loc_1000310A0 + *((int *)qword_100031610 + swift_getEnumCaseMultiPayload(v27, v18));
    __asm { BR              X10 }
  }
  return sub_100019B80((uint64_t)v17, &qword_10006D108);
}

id sub_100031700()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEiOSBoardPickerViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000317B4()
{
  return type metadata accessor for CRLSEiOSBoardPickerViewController(0);
}

uint64_t type metadata accessor for CRLSEiOSBoardPickerViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10006D618;
  if (!qword_10006D618)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CRLSEiOSBoardPickerViewController);
  return result;
}

uint64_t sub_1000317F8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  result = type metadata accessor for CRLSELibraryViewModeItemNode(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = "\b";
    v4[3] = "\b";
    v4[4] = "\b";
    v4[5] = &unk_100052DB0;
    result = swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CRLSEiOSBoardPickerViewController.CollectionViewSection(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1000318BC + 4 * byte_100052D40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000318DC + 4 * byte_100052D45[v4]))();
}

_BYTE *sub_1000318BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000318DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000318E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000318EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000318F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000318FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEiOSBoardPickerViewController.CollectionViewSection()
{
  return &type metadata for CRLSEiOSBoardPickerViewController.CollectionViewSection;
}

unint64_t sub_10003191C()
{
  unint64_t result;

  result = qword_10006D628;
  if (!qword_10006D628)
  {
    result = swift_getWitnessTable(&unk_100052E28, &type metadata for CRLSEiOSBoardPickerViewController.CollectionViewSection);
    atomic_store(result, (unint64_t *)&qword_10006D628);
  }
  return result;
}

id sub_100031960(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  void *v5;
  void *v6;
  NSString v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v6 = v5;
  if (!a2)
  {
    v11 = 0;
    v12 = a4[3];
    if (v12)
      goto LABEL_3;
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = a4[3];
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v13 = sub_100017804(a4, v12);
  v14 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v16);
  v17 = _bridgeAnythingToObjectiveC<A>(_:)(v16, v12);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
  sub_10001786C(a4);
LABEL_6:
  v18 = objc_msgSend(v6, "initWithTitle:style:target:action:", v11, a3, v17, a5);

  swift_unknownObjectRelease(v17);
  return v18;
}

uint64_t sub_100031A90()
{
  return sub_10002ED44(1);
}

id sub_100031AB4(uint64_t a1)
{
  objc_class *v2;
  char *v3;
  char *v4;
  id v5;
  objc_super v7;

  v2 = (objc_class *)type metadata accessor for CRLSEiOSBoardPickerViewController(0);
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter] = 0;
  v4 = &v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate];
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4, 0);
  sub_1000191EC(a1, (uint64_t)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject], type metadata accessor for CRLSELibraryViewModeItemNode);
  v7.receiver = v3;
  v7.super_class = v2;
  v5 = objc_msgSendSuper2(&v7, "initWithNibName:bundle:", 0, 0);
  sub_100013BBC(a1, type metadata accessor for CRLSELibraryViewModeItemNode);
  return v5;
}

unint64_t sub_100031B8C()
{
  unint64_t result;

  result = qword_10006D658;
  if (!qword_10006D658)
  {
    result = swift_getWitnessTable(&unk_100052DE8, &type metadata for CRLSEiOSBoardPickerViewController.CollectionViewSection);
    atomic_store(result, (unint64_t *)&qword_10006D658);
  }
  return result;
}

unint64_t sub_100031BD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D660;
  if (!qword_10006D660)
  {
    v1 = type metadata accessor for CRLSELibraryViewModel.Item(255);
    result = swift_getWitnessTable(&unk_1000512B4, v1);
    atomic_store(result, (unint64_t *)&qword_10006D660);
  }
  return result;
}

uint64_t sub_100031C18()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100031C3C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_10002F650(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_100031C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100011254(&qword_10006D668);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void *sub_100031CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(sub_100011254(&qword_10006D668) - 8) + 80);
  return sub_1000305A8(a1, a2, a3, v3 + ((v7 + 16) & ~v7));
}

uint64_t sub_100031D00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100011254(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100031D44()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  void *object;
  uint64_t ObjectType;
  unint64_t v20;

  ObjectType = swift_getObjectType(v0);
  v1 = sub_100011254(&qword_10006D7E8);
  String.init<A>(reflecting:)(&ObjectType, v1);
  swift_bridgeObjectRelease(v2);
  ObjectType = (uint64_t)v0;
  v3 = sub_10002663C(0, (unint64_t *)&qword_10006CF00, NSError_ptr);
  v4 = sub_10003B0A0();
  v5 = v0;
  v6 = _getErrorEmbeddedNSError<A>(_:)(&ObjectType, v3, v4);
  if (v6)
  {
    v7 = v6;

  }
  else
  {
    v7 = swift_allocError(v3, v4, 0, 0);
    *v8 = ObjectType;
  }
  v9 = (void *)_convertErrorToNSError(_:)(v7);
  swift_errorRelease(v7);
  ObjectType = 0;
  v20 = 0xE000000000000000;
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease(v20);
  ObjectType = 0x20726F727245534ELL;
  v20 = 0xEF3D6E69616D6F44;
  v10 = objc_msgSend(v9, "domain");
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v13 = v12;

  v14._countAndFlagsBits = v11;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v13);
  v15._countAndFlagsBits = 0x3D65646F4320;
  v15._object = (void *)0xE600000000000000;
  String.append(_:)(v15);
  objc_msgSend(v9, "code");
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v16._object;
  String.append(_:)(v16);

  swift_bridgeObjectRelease(object);
  return ObjectType;
}

char *sub_100031F00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;

  v2 = v1;
  v4 = sub_100011254(&qword_10006D050);
  v5 = __chkstk_darwin(v4);
  v32 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v30 - v7;
  if ((unint64_t)a1 >> 62)
    goto LABEL_21;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v9)
  {
    v30 = v2;
    v36 = a1 & 0xC000000000000001;
    v35 = (char *)_swiftEmptyArrayStorage;
    v10 = 4;
    v31 = a1;
    while (1)
    {
      v2 = v10 - 4;
      if (!v36)
        break;
      v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10 - 4, a1);
      v13 = v10 - 3;
      if (__OFADD__(v2, 1))
        goto LABEL_20;
LABEL_12:
      v14 = v12;
      v15 = objc_msgSend(v14, "url");
      if (v15)
      {
        v16 = v15;
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v15);

        v17 = type metadata accessor for URL(0);
        v18 = *(_QWORD *)(v17 - 8);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v8, 0, 1, v17);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17) != 1)
        {
          v19 = v32;
          v20 = sub_100019B3C((uint64_t)v8, v32, &qword_10006D050);
          v21 = URL.lastPathComponent.getter(v20);
          v33 = v22;
          v34 = v21;
          (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v17);
          sub_100019B80((uint64_t)v8, &qword_10006D050);

          v23 = v35;
          if ((swift_isUniquelyReferenced_nonNull_native(v35) & 1) == 0)
            v23 = sub_100045854(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
          v25 = *((_QWORD *)v23 + 2);
          v24 = *((_QWORD *)v23 + 3);
          if (v25 >= v24 >> 1)
            v23 = sub_100045854((char *)(v24 > 1), v25 + 1, 1, v23);
          *((_QWORD *)v23 + 2) = v25 + 1;
          v35 = v23;
          v26 = &v23[16 * v25];
          v27 = v33;
          *((_QWORD *)v26 + 4) = v34;
          *((_QWORD *)v26 + 5) = v27;
          a1 = v31;
          goto LABEL_6;
        }
      }
      else
      {
        v11 = type metadata accessor for URL(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
      }
      sub_100019B80((uint64_t)v8, &qword_10006D050);

LABEL_6:
      ++v10;
      if (v13 == v9)
      {
        swift_bridgeObjectRelease(a1);
        return v35;
      }
    }
    v12 = *(id *)(a1 + 8 * v10);
    v13 = v10 - 3;
    if (!__OFADD__(v2, 1))
      goto LABEL_12;
LABEL_20:
    __break(1u);
LABEL_21:
    if (a1 < 0)
      v29 = a1;
    else
      v29 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v9 = _CocoaArrayWrapper.endIndex.getter(v29);
  }
  swift_bridgeObjectRelease(a1);
  return (char *)_swiftEmptyArrayStorage;
}

_QWORD *sub_1000321E4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v23 = a1;
    else
      v23 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v23);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = _swiftEmptyArrayStorage;
  if (v2)
  {
    v26 = _swiftEmptyArrayStorage;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v4 = 0;
        do
        {
          v5 = v4 + 1;
          v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
          v24 = v6;
          v7 = sub_10002663C(0, &qword_10006D088, &off_100060BE8);
          v8 = v6;
          v9 = sub_100011254((uint64_t *)&unk_10006D860);
          swift_dynamicCast(&v25, &v24, v7, v9, 7);
          v10 = v25;
          v11 = swift_unknownObjectRelease(v8);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v11);
          v12 = v26[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v12);
          v13 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
          specialized ContiguousArray._endMutation()(v13);
          v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        v14 = (void **)(a1 + 32);
        v15 = sub_10002663C(0, &qword_10006D088, &off_100060BE8);
        do
        {
          v16 = *v14++;
          v24 = v16;
          v17 = v16;
          v18 = sub_100011254((uint64_t *)&unk_10006D860);
          swift_dynamicCast(&v25, &v24, v15, v18, 7);
          v19 = v25;

          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v20);
          v21 = v26[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v21);
          v22 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v19);
          specialized ContiguousArray._endMutation()(v22);
          --v2;
        }
        while (v2);
      }
      return v26;
    }
  }
  return result;
}

char *sub_1000323F0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  char *result;
  uint64_t i;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  _OWORD v16[2];
  _QWORD *v17;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v14 = a1;
    else
      v14 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = _swiftEmptyArrayStorage;
  if (!v2)
    return (char *)v3;
  v17 = _swiftEmptyArrayStorage;
  result = sub_1000397D0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        v6 = sub_10002663C(0, &qword_10006D848, NSExtensionItem_ptr);
        swift_dynamicCast(v16, &v15, v6, (char *)&type metadata for Any + 8, 7);
        v3 = v17;
        if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
        {
          sub_1000397D0(0, v3[2] + 1, 1);
          v3 = v17;
        }
        v8 = v3[2];
        v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_1000397D0((char *)(v7 > 1), v8 + 1, 1);
          v3 = v17;
        }
        v3[2] = v8 + 1;
        sub_10003CC40(v16, &v3[4 * v8 + 4]);
      }
    }
    else
    {
      v9 = (id *)(a1 + 32);
      v10 = sub_10002663C(0, &qword_10006D848, NSExtensionItem_ptr);
      do
      {
        v15 = *v9;
        v11 = v15;
        swift_dynamicCast(v16, &v15, v10, (char *)&type metadata for Any + 8, 7);
        v3 = v17;
        if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
        {
          sub_1000397D0(0, v3[2] + 1, 1);
          v3 = v17;
        }
        v13 = v3[2];
        v12 = v3[3];
        if (v13 >= v12 >> 1)
        {
          sub_1000397D0((char *)(v12 > 1), v13 + 1, 1);
          v3 = v17;
        }
        v3[2] = v13 + 1;
        sub_10003CC40(v16, &v3[4 * v13 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100032650()
{
  id v0;
  NSString v1;
  NSString v2;
  id v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v0, "localizedStringForKey:value:table:", v1, v2, 0);

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  return v4;
}

uint64_t sub_100032750(uint64_t a1, uint64_t a2, char a3)
{
  void *v6;
  id v7;
  NSString v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = (void *)objc_opt_self(NSBundle);
  v7 = objc_msgSend(v6, "mainBundle", swift_bridgeObjectRetain(a2).n128_f64[0]);
  if ((a3 & 1) != 0)
  {
    v18 = String._bridgeToObjectiveC()();
    v19 = String._bridgeToObjectiveC()();
    v20 = objc_msgSend(v7, "localizedStringForKey:value:table:", v18, v19, 0);

    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    v13 = v22;

    v23 = sub_100011254((uint64_t *)&unk_10006D060);
    v15 = swift_allocObject(v23, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_100052780;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_10002646C();
    *(_QWORD *)(v15 + 32) = a1;
    *(_QWORD *)(v15 + 40) = a2;
    v17 = v21;
  }
  else
  {
    v8 = String._bridgeToObjectiveC()();
    v9 = String._bridgeToObjectiveC()();
    v10 = objc_msgSend(v7, "localizedStringForKey:value:table:", v8, v9, 0);

    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    v14 = sub_100011254((uint64_t *)&unk_10006D060);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_100052780;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_10002646C();
    *(_QWORD *)(v15 + 32) = a1;
    *(_QWORD *)(v15 + 40) = a2;
    v17 = v11;
  }
  v24 = static String.localizedStringWithFormat(_:_:)(v17, v13, v15, v16);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v15);
  return v24;
}

id sub_100032C68()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  NSString v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)NSOperationQueue), "init");
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v4, "setQualityOfService:", 17);
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

void sub_100032D70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t inited;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44[72];
  uint64_t v45;
  unint64_t v46;

  v3 = type metadata accessor for URL.DirectoryHint(0);
  v40 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  __chkstk_darwin(v3);
  v39 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v38 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100011254(&qword_10006D050);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v38 - v15;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v43 = a1;
  v17((char *)&v38 - v15, a1, v5);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v18(v16, 0, 1, v5);
  v42 = v1;
  v19 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  swift_beginAccess(v1 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL, &v45, 33, 0);
  sub_10002D894((uint64_t)v16, v19, &qword_10006D050);
  swift_endAccess(&v45);
  sub_100019B3C(v19, (uint64_t)v11, &qword_10006D050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
  {
    sub_100019B80((uint64_t)v11, &qword_10006D050);
    v20 = 1;
  }
  else
  {
    v21 = v38;
    v17(v38, (uint64_t)v11, v5);
    sub_100019B80((uint64_t)v11, &qword_10006D050);
    v45 = 0x74726F706D49;
    v46 = 0xE600000000000000;
    v23 = v39;
    v22 = v40;
    v24 = v41;
    (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v39, enum case for URL.DirectoryHint.inferFromPath(_:), v41);
    v25 = sub_100039770();
    URL.appending<A>(path:directoryHint:)(&v45, v23, &type metadata for String, v25);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
    swift_bridgeObjectRelease(v46);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v21, v5);
    v20 = 0;
  }
  v18(v14, v20, 1, v5);
  v26 = v42;
  v27 = v42 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL;
  swift_beginAccess(v42 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL, &v45, 33, 0);
  sub_10002D894((uint64_t)v14, v27, &qword_10006D050);
  swift_endAccess(&v45);
  sub_100019B3C(v27, (uint64_t)v16, &qword_10006D050);
  v28 = v26 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess(v26 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL, &v45, 33, 0);
  sub_10002D894((uint64_t)v16, v28, &qword_10006D050);
  swift_endAccess(&v45);
  if (qword_10006C648 != -1)
    swift_once(&qword_10006C648, sub_10003EE80);
  swift_beginAccess(&static OS_os_log.crlSharingExtension, &v45, 0, 0);
  v29 = (void *)static OS_os_log.crlSharingExtension;
  v30 = sub_100011254((uint64_t *)&unk_10006D060);
  inited = swift_initStackObject(v30, v44);
  *(_OWORD *)(inited + 16) = xmmword_100052780;
  v32 = v29;
  v33 = URL.relativePath.getter();
  v35 = v34;
  *(_QWORD *)(inited + 56) = &type metadata for String;
  *(_QWORD *)(inited + 64) = sub_10002646C();
  *(_QWORD *)(inited + 32) = v33;
  *(_QWORD *)(inited + 40) = v35;
  v36 = static os_log_type_t.debug.getter();
  sub_100043700((uint64_t)v32, &_mh_execute_header, v36, "Container URL: %@", 17, 2, inited);
  swift_setDeallocating(inited);
  v37 = sub_100011254((uint64_t *)&unk_10006D070);
  swift_arrayDestroy(inited + 32, 1, v37);

}

uint64_t sub_100033188(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[45] = a1;
  v2[46] = v1;
  v3 = sub_100011254(&qword_10006D050);
  v2[47] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v2[48] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[49] = v5;
  v2[50] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UTType(0);
  v2[51] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[52] = v7;
  v2[53] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CharacterSet(0);
  v2[54] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[55] = v9;
  v2[56] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10003325C, 0, 0);
}

uint64_t sub_10003325C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  NSString v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t inited;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSURL *v86;
  void *v87;
  void *v88;
  id v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  Class isa;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;

  v1 = v0 + 152;
  v2 = v0 + 296;
  *(_QWORD *)(v0 + 352) = _swiftEmptyArrayStorage;
  v3 = objc_msgSend(objc_allocWithZone((Class)CRLSEImportItemFactory), "init");
  *(_QWORD *)(v0 + 456) = v3;
  v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v5 = String._bridgeToObjectiveC()();
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v4, "localizedStringForKey:value:table:", v5, v6, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v9 = v8;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  objc_msgSend(v3, "setDefaultImageFileName:", v10);

  if (qword_10006C648 != -1)
    goto LABEL_49;
  while (1)
  {
    v11 = *(void **)(v0 + 360);
    swift_beginAccess(&static OS_os_log.crlSharingExtension, v2, 0, 0);
    v12 = (void *)static OS_os_log.crlSharingExtension;
    v13 = sub_100011254((uint64_t *)&unk_10006D060);
    *(_QWORD *)(v0 + 464) = v13;
    inited = swift_initStackObject(v13, v1);
    *(_OWORD *)(inited + 16) = xmmword_100052780;
    v15 = v12;
    v16 = objc_msgSend(v11, "inputItems");
    v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, (char *)&type metadata for Any + 8);

    v18 = *(_QWORD *)(v17 + 16);
    v19 = swift_bridgeObjectRelease(v17);
    *(_QWORD *)(inited + 56) = &type metadata for Int;
    *(_QWORD *)(inited + 64) = &protocol witness table for Int;
    *(_QWORD *)(inited + 32) = v18;
    v20 = static os_log_type_t.debug.getter(v19);
    sub_100043700((uint64_t)v15, &_mh_execute_header, v20, "Context Items: %d", 17, 2, inited);
    swift_setDeallocating(inited);
    v21 = sub_100011254((uint64_t *)&unk_10006D070);
    *(_QWORD *)(v0 + 472) = v21;
    swift_arrayDestroy(inited + 32, 1, v21);

    v22 = objc_msgSend(v11, "inputItems");
    v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v22, (char *)&type metadata for Any + 8);
    *(_QWORD *)(v0 + 480) = v23;

    v24 = *(_QWORD *)(v23 + 16);
    *(_QWORD *)(v0 + 488) = v24;
    if (!v24)
      break;
    v25 = 0;
    v1 = v0 + 320;
    v2 = v0 + 352;
    while (1)
    {
      *(_QWORD *)(v0 + 496) = v25;
      v26 = *(_QWORD *)(v0 + 480);
      if (v25 >= *(_QWORD *)(v26 + 16))
      {
        __break(1u);
        goto LABEL_48;
      }
      sub_1000268A8(v26 + 32 * v25 + 32, v0 + 264);
      v27 = sub_10002663C(0, &qword_10006D848, NSExtensionItem_ptr);
      if ((swift_dynamicCast(v0 + 344, v0 + 264, (char *)&type metadata for Any + 8, v27, 6) & 1) != 0)
        break;
      v25 = *(_QWORD *)(v0 + 496) + 1;
      if (v25 == *(_QWORD *)(v0 + 488))
      {
        swift_bridgeObjectRelease(*(_QWORD *)(v0 + 480));
        v28 = *(_QWORD **)(v0 + 352);
        goto LABEL_9;
      }
    }
    v37 = *(void **)(v0 + 344);
    *(_QWORD *)(v0 + 504) = v37;
    v38 = objc_msgSend(v37, "attachments");
    if (v38)
    {
      v39 = v38;
      v40 = sub_10002663C(0, (unint64_t *)&unk_10006D850, NSItemProvider_ptr);
      v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v39, v40);

    }
    else
    {
      v41 = (uint64_t)_swiftEmptyArrayStorage;
    }
    v42 = (void *)static OS_os_log.crlSharingExtension;
    v43 = swift_initStackObject(*(_QWORD *)(v0 + 464), v0 + 80);
    *(_OWORD *)(v43 + 16) = xmmword_100052780;
    v44 = (unint64_t)v41 >> 62;
    v104 = v41;
    if ((unint64_t)v41 >> 62)
    {
      if (v41 < 0)
        v98 = v41;
      else
        v98 = v41 & 0xFFFFFFFFFFFFFF8;
      v99 = v42;
      swift_bridgeObjectRetain(v41);
      v100 = v98;
      v2 = v0 + 352;
      v45 = _CocoaArrayWrapper.endIndex.getter(v100);
      v46 = (id)swift_bridgeObjectRelease(v41);
    }
    else
    {
      v45 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
      v46 = v42;
    }
    v47 = *(_QWORD *)(v0 + 472);
    *(_QWORD *)(v43 + 56) = &type metadata for Int;
    *(_QWORD *)(v43 + 64) = &protocol witness table for Int;
    *(_QWORD *)(v43 + 32) = v45;
    v48 = static os_log_type_t.debug.getter(v46);
    sub_100043700((uint64_t)v42, &_mh_execute_header, v48, "Attachment Count: %d", 20, 2, v43);
    swift_setDeallocating(v43);
    swift_arrayDestroy(v43 + 32, 1, v47);

    v49 = objc_msgSend(v37, "attributedContentText");
    if (!v49)
    {
      v63 = 0;
      v64 = v104;
      goto LABEL_43;
    }
    v50 = v49;
    v101 = v45;
    v103 = v2;
    v51 = *(_QWORD *)(v0 + 440);
    v52 = *(_QWORD *)(v0 + 448);
    v53 = *(_QWORD *)(v0 + 432);
    v54 = objc_msgSend(v49, "string");
    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
    v57 = v56;

    *(_QWORD *)(v0 + 320) = v55;
    *(_QWORD *)(v0 + 328) = v57;
    static CharacterSet.whitespacesAndNewlines.getter();
    v58 = sub_100039770();
    v1 = StringProtocol.trimmingCharacters(in:)(v52, &type metadata for String, v58);
    v60 = v59;
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v53);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 328));
    swift_bridgeObjectRelease(v60);
    v61 = HIBYTE(v60) & 0xF;
    if ((v60 & 0x2000000000000000) == 0)
      v61 = v1 & 0xFFFFFFFFFFFFLL;
    if (!v61)
    {
      v63 = 0;
      v64 = v104;
      goto LABEL_42;
    }
    v2 = v104;
    v102 = v50;
    if (v44)
    {
      if (v104 < 0)
        v1 = v104;
      else
        v1 = v104 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v104);
      v62 = _CocoaArrayWrapper.endIndex.getter(v1);
      if (!v62)
        goto LABEL_35;
    }
    else
    {
      v62 = *(_QWORD *)((v104 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v104);
      if (!v62)
      {
LABEL_35:
        swift_bridgeObjectRelease(v2);
        v63 = 0;
        v50 = v102;
LABEL_36:
        v75 = *(_QWORD *)(v0 + 384);
        v76 = *(_QWORD *)(v0 + 392);
        v77 = *(_QWORD *)(v0 + 376);
        v78 = objc_msgSend(objc_allocWithZone((Class)CRLSEImportableItem), "init");
        v79 = objc_msgSend(v50, "string");
        v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
        v82 = v81;

        sub_100034AD8(v80, v82, v77);
        swift_bridgeObjectRelease(v82);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v77, 1, v75) == 1)
        {
          sub_100019B80(*(_QWORD *)(v0 + 376), &qword_10006D050);
          objc_msgSend(v78, "setAttributedText:", v50);
        }
        else
        {
          v84 = *(_QWORD *)(v0 + 392);
          v83 = *(_QWORD *)(v0 + 400);
          v85 = *(_QWORD *)(v0 + 384);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v84 + 32))(v83, *(_QWORD *)(v0 + 376), v85);
          URL._bridgeToObjectiveC()(v86);
          v88 = v87;
          objc_msgSend(v78, "setUrl:", v87);

          (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
        }
        v89 = v78;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v91 = *(_QWORD *)(*(_QWORD *)v103 + 16);
        v90 = *(_QWORD *)(*(_QWORD *)v103 + 24);
        v64 = v104;
        if (v91 >= v90 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v90 > 1, v91 + 1, 1);
        v92 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v91, v89);
        specialized Array._endMutation()(v92);

LABEL_42:
LABEL_43:
        v93 = v0 + 16;
        v94 = *(void **)(v0 + 456);
        sub_10002663C(0, (unint64_t *)&unk_10006D850, NSItemProvider_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        *(_QWORD *)(v0 + 512) = isa;
        swift_bridgeObjectRelease(v64);
        *(_QWORD *)(v0 + 56) = v0 + 336;
        *(_QWORD *)(v0 + 16) = v0;
        *(_QWORD *)(v0 + 24) = sub_100033B60;
        v96 = swift_continuation_init(v0 + 16, 1);
        *(_QWORD *)(v0 + 224) = _NSConcreteStackBlock;
        v97 = (_QWORD *)(v0 + 224);
        v97[1] = 0x40000000;
        v97[2] = sub_100034A30;
        v97[3] = &unk_1000635F8;
        v97[4] = v96;
        objc_msgSend(v94, "createImportItems:skipTextAttachments:completion:", isa, v63, v97);
        return swift_continuation_await(v93);
      }
    }
    v65 = 0;
    while (1)
    {
      v66 = (v104 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v65, v2)
          : *(id *)(v2 + 8 * v65 + 32);
      v67 = v66;
      v68 = v65 + 1;
      if (__OFADD__(v65, 1))
        break;
      v70 = *(_QWORD *)(v0 + 416);
      v69 = *(_QWORD *)(v0 + 424);
      v71 = *(_QWORD *)(v0 + 408);
      v72 = static UTType.text.getter();
      UTType.identifier.getter(v72);
      v74 = v73;
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
      v1 = (uint64_t)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v74);
      LODWORD(v71) = objc_msgSend(v67, "hasItemConformingToTypeIdentifier:", v1);

      if ((_DWORD)v71)
      {
        v64 = v104;
        swift_bridgeObjectRelease(v104);
        v50 = v102;
        if (v101 == 1)
        {
          v63 = 1;
          goto LABEL_36;
        }
        v63 = 0;
        goto LABEL_42;
      }
      ++v65;
      v2 = v104;
      if (v68 == v62)
        goto LABEL_35;
    }
LABEL_48:
    __break(1u);
LABEL_49:
    swift_once(&qword_10006C648, sub_10003EE80);
  }
  swift_bridgeObjectRelease(v23);
  v28 = _swiftEmptyArrayStorage;
LABEL_9:
  v29 = *(_QWORD *)(v0 + 448);
  v30 = *(void **)(v0 + 456);
  v31 = *(_QWORD *)(v0 + 424);
  v32 = *(_QWORD *)(v0 + 400);
  v33 = *(_QWORD *)(v0 + 376);
  sub_10003BF6C((uint64_t)v28);
  v35 = v34;
  swift_bridgeObjectRelease(v28);

  swift_task_dealloc(v29);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v35);
}

uint64_t sub_100033B60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 520) = v1;
  if (v1)
    v2 = sub_100034280;
  else
    v2 = sub_100033BC0;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100033BC0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  void (**v8)(_QWORD, _QWORD);
  char *v9;
  char *inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (**i)(_QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSURL *v62;
  void *v63;
  void *v64;
  id v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  Class isa;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  void (**v75)(_QWORD, _QWORD);
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unsigned int v82;

  v1 = *(void **)(v0 + 504);
  v2 = *(_QWORD *)(v0 + 336);

  v3 = sub_1000321E4(v2);
  swift_bridgeObjectRelease(v2);
  sub_100044640((uint64_t)v3);

  v4 = *(_QWORD *)(v0 + 496) + 1;
  if (v4 == *(_QWORD *)(v0 + 488))
  {
LABEL_6:
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 480));
    v13 = *(_QWORD *)(v0 + 352);
    v14 = *(_QWORD *)(v0 + 448);
    v15 = *(void **)(v0 + 456);
    v16 = *(_QWORD *)(v0 + 424);
    v17 = *(_QWORD *)(v0 + 400);
    v18 = *(_QWORD *)(v0 + 376);
    sub_10003BF6C(v13);
    v20 = v19;
    swift_bridgeObjectRelease(v13);

    swift_task_dealloc(v14);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v20);
  }
  v5 = v0 + 264;
  v6 = v0 + 336;
  v7 = &qword_10006D848;
  v8 = (void (**)(_QWORD, _QWORD))(v0 + 344);
  v9 = (char *)NSExtensionItem_ptr;
  inited = (char *)&type metadata for Any + 8;
  while (1)
  {
    *(_QWORD *)(v0 + 496) = v4;
    v11 = *(_QWORD *)(v0 + 480);
    if (v4 >= *(_QWORD *)(v11 + 16))
    {
      __break(1u);
      goto LABEL_45;
    }
    sub_1000268A8(v11 + 32 * v4 + 32, v0 + 264);
    v12 = sub_10002663C(0, &qword_10006D848, NSExtensionItem_ptr);
    if ((swift_dynamicCast(v0 + 344, v0 + 264, (char *)&type metadata for Any + 8, v12, 6) & 1) != 0)
      break;
    v4 = *(_QWORD *)(v0 + 496) + 1;
    if (v4 == *(_QWORD *)(v0 + 488))
      goto LABEL_6;
  }
  v7 = *(unint64_t **)(v0 + 344);
  *(_QWORD *)(v0 + 504) = v7;
  v22 = objc_msgSend(v7, "attachments");
  if (v22)
  {
    v23 = v22;
    v24 = sub_10002663C(0, (unint64_t *)&unk_10006D850, NSItemProvider_ptr);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

  }
  else
  {
    v5 = (uint64_t)_swiftEmptyArrayStorage;
  }
  v8 = (void (**)(_QWORD, _QWORD))static OS_os_log.crlSharingExtension;
  inited = (char *)swift_initStackObject(*(_QWORD *)(v0 + 464), v0 + 80);
  *((_OWORD *)inited + 1) = xmmword_100052780;
  v9 = inited + 32;
  v81 = (unint64_t)v5 >> 62;
  v77 = v0 + 352;
  if ((unint64_t)v5 >> 62)
    goto LABEL_46;
  v25 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  for (i = v8; ; i = (void (**)(_QWORD, _QWORD))swift_bridgeObjectRelease(v5))
  {
    v79 = v6;
    v27 = *(_QWORD *)(v0 + 472);
    *((_QWORD *)inited + 7) = &type metadata for Int;
    *((_QWORD *)inited + 8) = &protocol witness table for Int;
    *((_QWORD *)inited + 4) = v25;
    v28 = static os_log_type_t.debug.getter(i);
    sub_100043700((uint64_t)v8, &_mh_execute_header, v28, "Attachment Count: %d", 20, 2, (uint64_t)inited);
    swift_setDeallocating(inited);
    swift_arrayDestroy(v9, 1, v27);

    v29 = objc_msgSend(v7, "attributedContentText");
    if (!v29)
    {
      v41 = 0;
      goto LABEL_43;
    }
    v76 = v25;
    v30 = *(_QWORD *)(v0 + 440);
    v8 = *(void (***)(_QWORD, _QWORD))(v0 + 448);
    v31 = *(_QWORD *)(v0 + 432);
    v78 = v29;
    v32 = objc_msgSend(v29, "string");
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    v35 = v34;

    *(_QWORD *)(v0 + 320) = v33;
    *(_QWORD *)(v0 + 328) = v35;
    static CharacterSet.whitespacesAndNewlines.getter();
    v36 = sub_100039770();
    v37 = StringProtocol.trimmingCharacters(in:)(v8, &type metadata for String, v36);
    v39 = v38;
    (*(void (**)(_QWORD, uint64_t))(v30 + 8))(v8, v31);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 328));
    swift_bridgeObjectRelease(v39);
    v40 = HIBYTE(v39) & 0xF;
    if ((v39 & 0x2000000000000000) == 0)
      v40 = v37 & 0xFFFFFFFFFFFFLL;
    if (!v40)
    {
LABEL_41:
      v41 = 0;
      goto LABEL_42;
    }
    if (v81)
      break;
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v5);
    if (!v6)
      goto LABEL_32;
LABEL_24:
    v9 = 0;
    v80 = v5;
    v81 = v5 & 0xC000000000000001;
    while (1)
    {
      v43 = v81
          ? (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v5)
          : (char *)*(id *)(v5 + 8 * (_QWORD)v9 + 32);
      inited = v43;
      v5 = (uint64_t)(v9 + 1);
      if (__OFADD__(v9, 1))
        break;
      v8 = *(void (***)(_QWORD, _QWORD))(v0 + 416);
      v44 = *(_QWORD *)(v0 + 424);
      v45 = *(_QWORD *)(v0 + 408);
      v46 = static UTType.text.getter();
      UTType.identifier.getter(v46);
      v48 = v47;
      v8[1](v44, v45);
      v49 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v48);
      v7 = (unint64_t *)objc_msgSend(inited, "hasItemConformingToTypeIdentifier:", v49);

      if ((_DWORD)v7)
      {
        v5 = v80;
        swift_bridgeObjectRelease(v80);
        if (v76 != 1)
          goto LABEL_41;
        v82 = 1;
        goto LABEL_33;
      }
      ++v9;
      v50 = v5 == v6;
      v5 = v80;
      if (v50)
        goto LABEL_32;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    if (v5 < 0)
      v74 = v5;
    else
      v74 = v5 & 0xFFFFFFFFFFFFFF8;
    v75 = v8;
    swift_bridgeObjectRetain(v5);
    v25 = _CocoaArrayWrapper.endIndex.getter(v74);
  }
  if (v5 < 0)
    v42 = v5;
  else
    v42 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v6 = _CocoaArrayWrapper.endIndex.getter(v42);
  if (v6)
    goto LABEL_24;
LABEL_32:
  swift_bridgeObjectRelease(v5);
  v82 = 0;
LABEL_33:
  v52 = *(_QWORD *)(v0 + 384);
  v51 = *(_QWORD *)(v0 + 392);
  v53 = *(_QWORD *)(v0 + 376);
  v54 = objc_msgSend(objc_allocWithZone((Class)CRLSEImportableItem), "init");
  v55 = objc_msgSend(v78, "string");
  v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
  v58 = v57;

  sub_100034AD8(v56, v58, v53);
  swift_bridgeObjectRelease(v58);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v53, 1, v52) == 1)
  {
    sub_100019B80(*(_QWORD *)(v0 + 376), &qword_10006D050);
    objc_msgSend(v54, "setAttributedText:", v78);
  }
  else
  {
    v59 = *(_QWORD *)(v0 + 392);
    v60 = *(_QWORD *)(v0 + 400);
    v61 = *(_QWORD *)(v0 + 384);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v59 + 32))(v60, *(_QWORD *)(v0 + 376), v61);
    URL._bridgeToObjectiveC()(v62);
    v64 = v63;
    objc_msgSend(v54, "setUrl:", v63);

    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v60, v61);
  }
  v65 = v54;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v67 = *(_QWORD *)(*(_QWORD *)v77 + 16);
  v66 = *(_QWORD *)(*(_QWORD *)v77 + 24);
  v41 = v82;
  if (v67 >= v66 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v66 > 1, v67 + 1, 1);
  v68 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v67, v65);
  specialized Array._endMutation()(v68);

LABEL_42:
LABEL_43:
  v69 = v0 + 16;
  v70 = *(void **)(v0 + 456);
  sub_10002663C(0, (unint64_t *)&unk_10006D850, NSItemProvider_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 512) = isa;
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(v0 + 56) = v79;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_100033B60;
  v72 = swift_continuation_init(v0 + 16, 1);
  *(_QWORD *)(v0 + 224) = _NSConcreteStackBlock;
  v73 = (_QWORD *)(v0 + 224);
  v73[1] = 0x40000000;
  v73[2] = sub_100034A30;
  v73[3] = &unk_1000635F8;
  v73[4] = v72;
  objc_msgSend(v70, "createImportItems:skipTextAttachments:completion:", isa, v41, v73);
  return swift_continuation_await(v69);
}

uint64_t sub_100034280(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t *v9;
  char *v10;
  char *inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *i;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  NSString v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSURL *v63;
  void *v64;
  void *v65;
  id v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  Class isa;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v2 = *(_QWORD *)(v1 + 520);
  v4 = *(void **)(v1 + 504);
  v3 = *(void **)(v1 + 512);
  swift_willThrow(a1);

  swift_errorRelease(v2);
  v5 = *(_QWORD *)(v1 + 496) + 1;
  if (v5 == *(_QWORD *)(v1 + 488))
  {
LABEL_6:
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 480));
    v14 = *(_QWORD *)(v1 + 352);
    v15 = *(_QWORD *)(v1 + 448);
    v16 = *(void **)(v1 + 456);
    v17 = *(_QWORD *)(v1 + 424);
    v18 = *(_QWORD *)(v1 + 400);
    v19 = *(_QWORD *)(v1 + 376);
    sub_10003BF6C(v14);
    v21 = v20;
    swift_bridgeObjectRelease(v14);

    swift_task_dealloc(v15);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    return (*(uint64_t (**)(uint64_t))(v1 + 8))(v21);
  }
  v6 = v1 + 80;
  v7 = v1 + 264;
  v8 = (void *)(v1 + 344);
  v9 = &qword_10006D848;
  v10 = (char *)NSExtensionItem_ptr;
  inited = (char *)&type metadata for Any + 8;
  while (1)
  {
    *(_QWORD *)(v1 + 496) = v5;
    v12 = *(_QWORD *)(v1 + 480);
    if (v5 >= *(_QWORD *)(v12 + 16))
    {
      __break(1u);
      goto LABEL_45;
    }
    sub_1000268A8(v12 + 32 * v5 + 32, v1 + 264);
    v13 = sub_10002663C(0, &qword_10006D848, NSExtensionItem_ptr);
    if ((swift_dynamicCast(v1 + 344, v1 + 264, (char *)&type metadata for Any + 8, v13, 6) & 1) != 0)
      break;
    v5 = *(_QWORD *)(v1 + 496) + 1;
    if (v5 == *(_QWORD *)(v1 + 488))
      goto LABEL_6;
  }
  v8 = *(void **)(v1 + 344);
  *(_QWORD *)(v1 + 504) = v8;
  v23 = objc_msgSend(v8, "attachments");
  if (v23)
  {
    v24 = v23;
    v25 = sub_10002663C(0, (unint64_t *)&unk_10006D850, NSItemProvider_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);

  }
  else
  {
    v7 = (uint64_t)_swiftEmptyArrayStorage;
  }
  v9 = (unint64_t *)static OS_os_log.crlSharingExtension;
  inited = (char *)swift_initStackObject(*(_QWORD *)(v1 + 464), v1 + 80);
  *((_OWORD *)inited + 1) = xmmword_100052780;
  v10 = inited + 32;
  v6 = (unint64_t)v7 >> 62;
  v79 = v1 + 352;
  v80 = v1 + 336;
  if ((unint64_t)v7 >> 62)
    goto LABEL_46;
  v26 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  for (i = v9; ; i = (unint64_t *)swift_bridgeObjectRelease(v7))
  {
    v28 = *(_QWORD *)(v1 + 472);
    *((_QWORD *)inited + 7) = &type metadata for Int;
    *((_QWORD *)inited + 8) = &protocol witness table for Int;
    *((_QWORD *)inited + 4) = v26;
    v29 = static os_log_type_t.debug.getter(i);
    sub_100043700((uint64_t)v9, &_mh_execute_header, v29, "Attachment Count: %d", 20, 2, (uint64_t)inited);
    swift_setDeallocating(inited);
    swift_arrayDestroy(v10, 1, v28);

    v30 = objc_msgSend(v8, "attributedContentText");
    if (!v30)
    {
      v44 = 0;
      goto LABEL_40;
    }
    v31 = v30;
    v77 = v26;
    v81 = v7;
    v32 = *(_QWORD *)(v1 + 440);
    v9 = *(unint64_t **)(v1 + 448);
    v33 = *(_QWORD *)(v1 + 432);
    v34 = objc_msgSend(v30, "string");
    v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
    v37 = v36;

    *(_QWORD *)(v1 + 320) = v35;
    *(_QWORD *)(v1 + 328) = v37;
    static CharacterSet.whitespacesAndNewlines.getter();
    v38 = sub_100039770();
    v39 = StringProtocol.trimmingCharacters(in:)(v9, &type metadata for String, v38);
    v41 = v40;
    (*(void (**)(unint64_t *, uint64_t))(v32 + 8))(v9, v33);
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 328));
    swift_bridgeObjectRelease(v41);
    v42 = HIBYTE(v41) & 0xF;
    if ((v41 & 0x2000000000000000) == 0)
      v42 = v39 & 0xFFFFFFFFFFFFLL;
    if (!v42)
    {
      v44 = 0;
      v7 = v81;
      goto LABEL_39;
    }
    v43 = v81;
    v78 = v31;
    if (v6)
      break;
    v8 = *(void **)((v81 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v81);
    if (!v8)
      goto LABEL_32;
LABEL_25:
    v10 = 0;
    while (1)
    {
      v46 = (v81 & 0xC000000000000001) != 0
          ? (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v43)
          : (char *)*(id *)(v43 + 8 * (_QWORD)v10 + 32);
      inited = v46;
      v7 = (uint64_t)(v10 + 1);
      if (__OFADD__(v10, 1))
        break;
      v9 = *(unint64_t **)(v1 + 416);
      v47 = *(_QWORD *)(v1 + 424);
      v48 = *(_QWORD *)(v1 + 408);
      v49 = static UTType.text.getter();
      UTType.identifier.getter(v49);
      v6 = v50;
      ((void (*)(uint64_t, uint64_t))v9[1])(v47, v48);
      v51 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v6);
      LODWORD(v48) = objc_msgSend(inited, "hasItemConformingToTypeIdentifier:", v51);

      if ((_DWORD)v48)
      {
        v7 = v81;
        swift_bridgeObjectRelease(v81);
        v31 = v78;
        if (v77 == 1)
        {
          v44 = 1;
          goto LABEL_33;
        }
        v44 = 0;
        goto LABEL_39;
      }
      ++v10;
      v43 = v81;
      if ((void *)v7 == v8)
        goto LABEL_32;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    if (v7 < 0)
      v75 = v7;
    else
      v75 = v7 & 0xFFFFFFFFFFFFFF8;
    v76 = v9;
    swift_bridgeObjectRetain(v7);
    v26 = _CocoaArrayWrapper.endIndex.getter(v75);
  }
  if (v81 < 0)
    v45 = v81;
  else
    v45 = v81 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v81);
  v8 = (void *)_CocoaArrayWrapper.endIndex.getter(v45);
  if (v8)
    goto LABEL_25;
LABEL_32:
  swift_bridgeObjectRelease(v43);
  v44 = 0;
  v31 = v78;
LABEL_33:
  v52 = *(_QWORD *)(v1 + 384);
  v53 = *(_QWORD *)(v1 + 392);
  v54 = *(_QWORD *)(v1 + 376);
  v55 = objc_msgSend(objc_allocWithZone((Class)CRLSEImportableItem), "init");
  v56 = objc_msgSend(v31, "string");
  v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
  v59 = v58;

  sub_100034AD8(v57, v59, v54);
  swift_bridgeObjectRelease(v59);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v54, 1, v52) == 1)
  {
    sub_100019B80(*(_QWORD *)(v1 + 376), &qword_10006D050);
    objc_msgSend(v55, "setAttributedText:", v31);
  }
  else
  {
    v61 = *(_QWORD *)(v1 + 392);
    v60 = *(_QWORD *)(v1 + 400);
    v62 = *(_QWORD *)(v1 + 384);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v61 + 32))(v60, *(_QWORD *)(v1 + 376), v62);
    URL._bridgeToObjectiveC()(v63);
    v65 = v64;
    objc_msgSend(v55, "setUrl:", v64);

    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
  }
  v66 = v55;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v68 = *(_QWORD *)(*(_QWORD *)v79 + 16);
  v67 = *(_QWORD *)(*(_QWORD *)v79 + 24);
  v7 = v81;
  if (v68 >= v67 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v67 > 1, v68 + 1, 1);
  v69 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v68, v66);
  specialized Array._endMutation()(v69);

LABEL_39:
LABEL_40:
  v70 = v1 + 16;
  v71 = *(void **)(v1 + 456);
  sub_10002663C(0, (unint64_t *)&unk_10006D850, NSItemProvider_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v1 + 512) = isa;
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(v1 + 56) = v80;
  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = sub_100033B60;
  v73 = swift_continuation_init(v1 + 16, 1);
  *(_QWORD *)(v1 + 224) = _NSConcreteStackBlock;
  v74 = (_QWORD *)(v1 + 224);
  v74[1] = 0x40000000;
  v74[2] = sub_100034A30;
  v74[3] = &unk_1000635F8;
  v74[4] = v73;
  objc_msgSend(v71, "createImportItems:skipTextAttachments:completion:", isa, v44, v74);
  return swift_continuation_await(v70);
}

id sub_100034938(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  if ((unint64_t)a1 >> 62)
    goto LABEL_12;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; v2 = _CocoaArrayWrapper.endIndex.getter(v8))
  {
    v3 = 4;
    while (1)
    {
      v4 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v3 - 4, a1)
         : *(id *)(a1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      v7 = objc_msgSend(v4, "isPDF");

      if ((v7 & 1) == 0)
      {
        ++v3;
        if (v6 != v2)
          continue;
      }
      goto LABEL_17;
    }
    __break(1u);
LABEL_12:
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
  v7 = 0;
LABEL_17:
  swift_bridgeObjectRelease(a1);
  return v7;
}

uint64_t sub_100034A30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_100011254((uint64_t *)&unk_10006D2E0);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    v11 = sub_10002663C(0, &qword_10006D088, &off_100060BE8);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100034AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char v25;
  __n128 v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __n128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, char *, uint64_t);
  void (*v43)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;

  v6 = sub_100011254(&qword_10006D840);
  __chkstk_darwin(v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:encodingInvalidCharacters:)(a1, a2, 0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_100019B80((uint64_t)v11, &qword_10006D050);
LABEL_20:
    v41 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a3, v41, 1, v12);
  }
  v16 = *(uint64_t (**)(char *, char *, uint64_t))(v13 + 32);
  v17 = v16(v15, v11, v12);
  if ((URL.isFileURL.getter(v17) & 1) != 0
    || (((void (*)(void))URL.scheme.getter)(), v19 = v18, v20 = swift_bridgeObjectRelease(v18), !v19))
  {
LABEL_19:
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_20;
  }
  v21 = URL.absoluteString.getter(v20);
  if (v21 == a1 && v22 == a2)
  {
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v24 = v22;
    v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v22, a1, a2, 0);
    swift_bridgeObjectRelease(v24);
    if ((v25 & 1) == 0)
      goto LABEL_19;
  }
  v42 = (void (*)(uint64_t, char *, uint64_t))v16;
  v46 = *(_QWORD *)"http";
  v47 = 0xE400000000000000;
  v26 = swift_bridgeObjectRetain(0xE400000000000000);
  result = URL.scheme.getter(v26);
  if (v28)
  {
    v44 = result;
    v45 = v28;
    v29 = type metadata accessor for Locale(0);
    v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
    v43(v8, 1, 1, v29);
    v30 = sub_100039770();
    v31 = StringProtocol.compare<A>(_:options:range:locale:)(&v44, 1, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v30, v30);
    sub_100019B80((uint64_t)v8, &qword_10006D840);
    v32 = v45;
    swift_bridgeObjectRelease(0xE400000000000000);
    swift_bridgeObjectRelease(v32);
    if (!v31)
      goto LABEL_22;
    v46 = *(_QWORD *)"https";
    v47 = 0xE500000000000000;
    v33 = swift_bridgeObjectRetain(0xE500000000000000);
    result = URL.scheme.getter(v33);
    if (v34)
    {
      v44 = result;
      v45 = v34;
      v43(v8, 1, 1, v29);
      v35 = StringProtocol.compare<A>(_:options:range:locale:)(&v44, 1, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v30, v30);
      sub_100019B80((uint64_t)v8, &qword_10006D840);
      v36 = v45;
      swift_bridgeObjectRelease(0xE500000000000000);
      swift_bridgeObjectRelease(v36);
      if (!v35)
        goto LABEL_22;
      strcpy((char *)&v46, "message");
      v47 = 0xE700000000000000;
      v37 = swift_bridgeObjectRetain(0xE700000000000000);
      result = URL.scheme.getter(v37);
      if (v38)
      {
        v44 = result;
        v45 = v38;
        v43(v8, 1, 1, v29);
        v39 = StringProtocol.compare<A>(_:options:range:locale:)(&v44, 1, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v30, v30);
        sub_100019B80((uint64_t)v8, &qword_10006D840);
        v40 = v45;
        swift_bridgeObjectRelease(0xE700000000000000);
        swift_bridgeObjectRelease(v40);
        if (v39)
        {
          swift_arrayDestroy("http", 3, &type metadata for String);
          goto LABEL_19;
        }
LABEL_22:
        swift_arrayDestroy("http", 3, &type metadata for String);
        v42(a3, v15, v12);
        v41 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a3, v41, 1, v12);
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100034F04(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_100034FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  unint64_t v10;
  void (*v11)(char *, uint64_t);
  _QWORD v13[2];
  _QWORD v14[2];

  v13[1] = a2;
  v2 = type metadata accessor for URL.DirectoryHint(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = UUID.uuidString.getter(v4);
  v14[1] = v7;
  v8 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v9(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
  v10 = sub_100039770();
  URL.appending<A>(path:directoryHint:)(v14, v6, &type metadata for String, v10);
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  swift_bridgeObjectRelease(v14[1]);
  strcpy((char *)v14, "Manifest.plist");
  HIBYTE(v14[1]) = -18;
  v9(v6, v8, v2);
  URL.appending<A>(component:directoryHint:)(v14, v6, &type metadata for String, v10);
  v11(v6, v2);
  return swift_bridgeObjectRelease(v14[1]);
}

uint64_t sub_100035120(char *a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  int v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  void (*v70)(char *, char *, uint64_t);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  int *v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  _QWORD *v104;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v106;
  unint64_t v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  id v122;
  double v123;
  id v124;
  uint64_t isEscapingClosureAtFileLocation;
  __n128 v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t inited;
  id v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(char *, uint64_t, __n128);
  uint64_t v144;
  uint64_t v145;
  char *v146;
  _QWORD *v148;
  __n128 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(char *, char *, uint64_t);
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  void (*v161)(char *, uint64_t);
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  char *v169;
  char *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  id v184;
  char *v185;
  char *v186;
  char *v187;
  id v188;
  unsigned __int8 v189;
  char v190[8];
  NSURL v191;
  id aBlock[5];
  uint64_t v193;
  char v194[8];

  v4 = v3;
  v177 = a3;
  v174 = a2;
  v183 = a1;
  v181 = type metadata accessor for CRLSEBoard(0);
  v175 = *(_QWORD *)(v181 - 8);
  __chkstk_darwin(v181);
  v176 = v5;
  v171 = (char *)&v152 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = type metadata accessor for CRLSEManifestItem(0);
  v159 = *(_QWORD *)(v158 - 8);
  v6 = __chkstk_darwin(v158);
  v166 = (uint64_t)&v152 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v167 = (uint64_t)&v152 - v8;
  v9 = sub_100011254(&qword_10006D7C0);
  __chkstk_darwin(v9);
  v169 = (char *)&v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = type metadata accessor for CRLSEBoardIdentifier(0);
  v172 = *(_QWORD *)(v173 - 8);
  __chkstk_darwin(v173);
  v164 = (uint64_t)&v152 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100011254(&qword_10006D7C8);
  __chkstk_darwin(v12);
  v157 = (uint64_t *)((char *)&v152 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_100011254((uint64_t *)&unk_10006D7D0);
  v15 = __chkstk_darwin(v14);
  v160 = (char *)&v152 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)&v152 - v17;
  v178 = type metadata accessor for CRLSEImportManifest(0);
  v156 = *(_QWORD *)(v178 - 8);
  v19 = __chkstk_darwin(v178);
  v155 = (uint64_t)&v152 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v182 = (uint64_t)&v152 - v21;
  v22 = type metadata accessor for UUID(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v152 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v24);
  v170 = (char *)&v152 - v28;
  __chkstk_darwin(v27);
  v185 = (char *)&v152 - v29;
  v30 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v30);
  v32 = (char *)&v152 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = type metadata accessor for URL(0);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = __chkstk_darwin(v33);
  v163 = (char *)&v152 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __chkstk_darwin(v35);
  v180 = (uint64_t)&v152 - v38;
  v39 = __chkstk_darwin(v37);
  v179 = (uint64_t)&v152 - v40;
  v41 = __chkstk_darwin(v39);
  v187 = (char *)&v152 - v42;
  v43 = __chkstk_darwin(v41);
  v186 = (char *)&v152 - v44;
  __chkstk_darwin(v43);
  v46 = (char *)&v152 - v45;
  v189 = 0;
  v184 = v4;
  v47 = (uint64_t)v4 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL;
  swift_beginAccess(v47, v194, 0, 0);
  sub_100019B3C(v47, (uint64_t)v32, &qword_10006D050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33) != 1)
  {
    v52 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
    v52(v46, v32, v33);
    sub_100019B3C((uint64_t)&v183[*(int *)(v181 + 24)], (uint64_t)v18, (uint64_t *)&unk_10006D7D0);
    v53 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v18, 1, v22);
    v54 = v22;
    v162 = v22;
    v165 = v34;
    v168 = v46;
    if (v53 == 1)
    {
      v55 = sub_100019B80((uint64_t)v18, (uint64_t *)&unk_10006D7D0);
      UUID.init()(v55);
      v56 = v185;
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v185, v26, v22);
      v154 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
      v154(v26, v56, v22);
      v57 = v179;
      v58 = v180;
      sub_100034FC8(v179, v180);
      v161 = *(void (**)(char *, uint64_t))(v23 + 8);
      v161(v26, v22);
      v52(v186, (char *)v57, v33);
      v52(v187, (char *)v58, v33);
      v59 = v182;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v182, 1, 1, v22);
      v60 = (uint64_t)v183;
      v61 = &v183[*(int *)(v181 + 20)];
      v63 = *(_QWORD *)v61;
      v62 = *((_QWORD *)v61 + 1);
      v64 = (int *)v178;
      v65 = (_QWORD *)(v59 + *(int *)(v178 + 20));
      *v65 = 0;
      v65[1] = 0;
      v66 = (_QWORD *)(v59 + v64[6]);
      *v66 = v63;
      v66[1] = v62;
      *(_QWORD *)(v59 + v64[7]) = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(v62);
      v67 = (uint64_t)v171;
      v68 = (uint64_t)v169;
    }
    else
    {
      v69 = v170;
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v170, v18, v22);
      v70 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
      v71 = v185;
      v70(v185, v69, v54);
      v154 = v70;
      v70(v26, v71, v54);
      v72 = v179;
      v73 = v180;
      sub_100034FC8(v179, v180);
      v153 = v23;
      v161 = *(void (**)(char *, uint64_t))(v23 + 8);
      v161(v26, v54);
      v52(v186, (char *)v72, v33);
      v74 = v187;
      v52(v187, (char *)v73, v33);
      v75 = type metadata accessor for PropertyListDecoder(0);
      swift_allocObject(v75, *(unsigned int *)(v75 + 48), *(unsigned __int16 *)(v75 + 52));
      v76 = PropertyListDecoder.init()();
      v77 = v163;
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v163, v74, v33);
      v78 = Data.init(contentsOf:options:)(v77, 0);
      v80 = v79;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v77, v33);
      v81 = sub_1000177C4(&qword_10006D7E0, type metadata accessor for CRLSEImportManifest, (uint64_t)&unk_100052AEC);
      v64 = (int *)v178;
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v157, v178, v78, v80, v178, v81);
      sub_100026428(v78, v80);
      v148 = v157;
      (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v156 + 56))(v157, 0, 1, v64);
      v149 = swift_release(v76);
      v54 = v162;
      ((void (*)(char *, uint64_t, __n128))v161)(v170, v162, v149);
      v150 = (uint64_t)v148;
      v151 = v155;
      sub_100017A6C(v150, v155, type metadata accessor for CRLSEImportManifest);
      v59 = v182;
      sub_100017A6C(v151, v182, type metadata accessor for CRLSEImportManifest);
      v67 = (uint64_t)v171;
      v60 = (uint64_t)v183;
      v68 = (uint64_t)v169;
      v23 = v153;
    }
    sub_100019B3C(v60, v68, &qword_10006D7C0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v172 + 48))(v68, 1, v173) == 1)
    {
      sub_100019B80(v68, &qword_10006D7C0);
    }
    else
    {
      v82 = v68;
      v83 = v60;
      v84 = v164;
      sub_100017A6C(v82, v164, type metadata accessor for CRLSEBoardIdentifier);
      sub_100019B80(v59, (uint64_t *)&unk_10006D7D0);
      v154((char *)v59, (char *)v84, v54);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v59, 0, 1, v54);
      v85 = (uint64_t *)(v84 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20));
      v87 = *v85;
      v86 = v85[1];
      swift_bridgeObjectRetain(v86);
      v88 = v84;
      v60 = v83;
      sub_100013BBC(v88, type metadata accessor for CRLSEBoardIdentifier);
      v89 = (_QWORD *)(v59 + v64[5]);
      v90 = v89[1];
      *v89 = v87;
      v89[1] = v86;
      swift_bridgeObjectRelease(v90);
    }
    if (v174)
    {
      v91 = v174;
      v92 = (uint64_t)objc_msgSend(v91, "length");
      if (v92 < 1)
      {

      }
      else
      {
        v93 = v60;
        v94 = v64;
        v95 = v167;
        UUID.init()(v92);
        v96 = (int *)v158;
        v97 = v95 + *(int *)(v158 + 24);
        v98 = v91;
        AttributedString.init(_:)();
        v99 = type metadata accessor for AttributedString(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v97, 0, 1, v99);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v165 + 56))(v95 + v96[7], 1, 1, v33);
        v100 = v95 + v96[8];
        v101 = type metadata accessor for UTType(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 56))(v100, 1, 1, v101);
        v102 = (_QWORD *)(v95 + v96[5]);
        *v102 = 0;
        v102[1] = 0;
        sub_1000191EC(v95, v166, type metadata accessor for CRLSEManifestItem);
        v103 = v94[7];
        v104 = *(_QWORD **)(v59 + v103);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v104);
        *(_QWORD *)(v59 + v103) = v104;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v104 = (_QWORD *)sub_100045954(0, v104[2] + 1, 1, v104);
          *(_QWORD *)(v59 + v103) = v104;
        }
        v107 = v104[2];
        v106 = v104[3];
        if (v107 >= v106 >> 1)
        {
          v104 = (_QWORD *)sub_100045954(v106 > 1, v107 + 1, 1, v104);
          *(_QWORD *)(v59 + v103) = v104;
        }
        v104[2] = v107 + 1;
        sub_100017A6C(v166, (uint64_t)v104+ ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80))+ *(_QWORD *)(v159 + 72) * v107, type metadata accessor for CRLSEManifestItem);

        sub_100013BBC(v167, type metadata accessor for CRLSEManifestItem);
        v60 = v93;
      }
    }
    v181 = v33;
    v108 = objc_allocWithZone((Class)NSFileCoordinator);
    v109 = v184;
    v183 = (char *)objc_msgSend(v108, "initWithFilePresenter:", v184);
    URL._bridgeToObjectiveC()(&v191);
    v111 = v110;
    sub_1000191EC(v60, v67, type metadata accessor for CRLSEBoard);
    v112 = *(unsigned __int8 *)(v175 + 80);
    v113 = (v112 + 56) & ~v112;
    v114 = (v176 + v113 + 7) & 0xFFFFFFFFFFFFFFF8;
    v115 = v67;
    v116 = (v114 + 15) & 0xFFFFFFFFFFFFFFF8;
    v117 = (_QWORD *)swift_allocObject(&unk_100063590, v116 + 8, v112 | 7);
    v118 = v177;
    v117[2] = v186;
    v117[3] = v118;
    v117[4] = v109;
    v117[5] = v59;
    v117[6] = v187;
    sub_100017A6C(v115, (uint64_t)v117 + v113, type metadata accessor for CRLSEBoard);
    *(_QWORD *)((char *)v117 + v114) = v185;
    *(_QWORD *)((char *)v117 + v116) = &v189;
    v119 = swift_allocObject(&unk_1000635B8, 32, 7);
    *(_QWORD *)(v119 + 16) = sub_10003B000;
    *(_QWORD *)(v119 + 24) = v117;
    aBlock[4] = sub_100026500;
    v193 = v119;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_100037EB4;
    aBlock[3] = &unk_1000635D0;
    v120 = _Block_copy(aBlock);
    v121 = v193;
    swift_bridgeObjectRetain(v118);
    v122 = v109;
    swift_retain(v119);
    *(_QWORD *)&v123 = swift_release(v121).n128_u64[0];
    aBlock[0] = 0;
    objc_msgSend(v183, "coordinateWritingItemAtURL:options:error:byAccessor:", v111, 0, aBlock, v120, v123);
    _Block_release(v120);

    v124 = aBlock[0];
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v119, "", 98, 202, 102, 1);
    v126 = swift_release(v119);
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      if (!v124)
      {
        v143 = *(void (**)(char *, uint64_t, __n128))(v165 + 8);
        v144 = v181;
        v143(v168, v181, v126);

        v51 = v189;
        v146 = v187;
        v145 = v182;
        goto LABEL_24;
      }
      v184 = v122;
      v127 = qword_10006C648;
      isEscapingClosureAtFileLocation = (uint64_t)v124;
      if (v127 == -1)
      {
LABEL_22:
        swift_beginAccess(&static OS_os_log.crlSharingExtension, aBlock, 0, 0);
        v128 = (void *)static OS_os_log.crlSharingExtension;
        v129 = sub_100011254((uint64_t *)&unk_10006D060);
        inited = swift_initStackObject(v129, v190);
        *(_OWORD *)(inited + 16) = xmmword_100052750;
        v131 = (id)isEscapingClosureAtFileLocation;
        v132 = v128;
        v133 = sub_100031D44();
        v135 = v134;

        *(_QWORD *)(inited + 56) = &type metadata for String;
        v136 = sub_10002646C();
        *(_QWORD *)(inited + 64) = v136;
        *(_QWORD *)(inited + 32) = v133;
        *(_QWORD *)(inited + 40) = v135;
        v188 = v131;
        v137 = sub_10002663C(0, (unint64_t *)&qword_10006CF00, NSError_ptr);
        v138 = v131;
        v139 = String.init<A>(reflecting:)(&v188, v137);
        *(_QWORD *)(inited + 96) = &type metadata for String;
        *(_QWORD *)(inited + 104) = v136;
        *(_QWORD *)(inited + 72) = v139;
        *(_QWORD *)(inited + 80) = v140;
        v141 = static os_log_type_t.error.getter();
        sub_100043700((uint64_t)v132, &_mh_execute_header, v141, "Failed to write sharing extension data due to file coordination error : %{public}@ <%@>", 87, 2, inited);

        swift_setDeallocating(inited);
        v142 = sub_100011254((uint64_t *)&unk_10006D070);
        swift_arrayDestroy(inited + 32, 2, v142);

        v143 = *(void (**)(char *, uint64_t, __n128))(v165 + 8);
        v144 = v181;
        ((void (*)(char *, uint64_t))v143)(v168, v181);
        v51 = 0;
        v189 = 0;
        v145 = v182;
        v146 = v187;
        v122 = v184;
LABEL_24:

        sub_100013BBC(v145, type metadata accessor for CRLSEImportManifest);
        ((void (*)(char *, uint64_t))v143)(v146, v144);
        ((void (*)(char *, uint64_t))v143)(v186, v144);
        v161(v185, v162);
        objc_msgSend((id)objc_opt_self(NSFileCoordinator), "removeFilePresenter:", v122);
        swift_release(v117);
        return v51;
      }
    }
    swift_once(&qword_10006C648, sub_10003EE80);
    goto LABEL_22;
  }
  sub_100019B80((uint64_t)v32, &qword_10006D050);
  if (qword_10006C648 != -1)
    swift_once(&qword_10006C648, sub_10003EE80);
  swift_beginAccess(&static OS_os_log.crlSharingExtension, aBlock, 0, 0);
  v48 = (id)static OS_os_log.crlSharingExtension;
  v49 = static os_log_type_t.error.getter();
  sub_100043700((uint64_t)v48, &_mh_execute_header, v49, "Unable to resolve import directory URL", 38, 2, (uint64_t)_swiftEmptyArrayStorage);

  v50 = (void *)objc_opt_self(NSFileCoordinator);
  objc_msgSend(v50, "removeFilePresenter:", v184);
  return 0;
}

void sub_1000363D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  id v58;
  void (*v59)(char *, uint64_t, uint64_t);
  NSURL *v60;
  void *v61;
  void *v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  int *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v84;
  id v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  id v95;
  uint64_t v96;
  id v97;
  void *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  id v115;
  id v116;
  NSURL *v117;
  void *v118;
  void *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  id v123;
  NSURL *v124;
  void *v125;
  void *v126;
  NSURL *v127;
  void *v128;
  void *v129;
  unsigned int v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  void (*v136)(char *, uint64_t);
  uint64_t v137;
  UIImage *v138;
  UIImage *v139;
  CGImage *v140;
  CGImage *v141;
  CGImageAlphaInfo AlphaInfo;
  NSData *v143;
  NSData *v144;
  NSData *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  CGImage *v149;
  CGImage *v150;
  CGImageAlphaInfo v151;
  unsigned int v152;
  uint64_t v153;
  char *v154;
  id v155;
  NSString v156;
  NSString v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  unint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  id v177;
  NSURL *v178;
  void *v179;
  void *v180;
  char *v181;
  char *v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  char *v190;
  char *v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  char v200;
  unint64_t v201;
  unint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  char *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  uint64_t inited;
  uint64_t v216;
  uint64_t v217;
  id v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  _QWORD *v231;
  char *v232;
  uint64_t v233;
  uint64_t v234;
  char *v235;
  char *v236;
  uint64_t v237;
  _QWORD *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  unint64_t v246;
  void (*v247)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v248;
  uint64_t v249;
  uint64_t v250;
  unsigned int (*v251)(uint64_t, uint64_t, uint64_t);
  uint64_t *v252;
  uint64_t v253;
  char *v254;
  uint64_t v255;
  char *v256;
  uint64_t v257;
  void (*v258)(char *, uint64_t);
  char *v259;
  uint64_t v260;
  char *v261;
  uint64_t v262;
  void (*v263)(char *, uint64_t);
  char *v264;
  uint64_t v265;
  char *v266;
  uint64_t v267;
  void (*v268)(char *, _QWORD, uint64_t);
  char *v269;
  uint64_t v270;
  unint64_t v271;
  void (*v272)(char *, uint64_t);
  char *v273;
  char *v274;
  void (*v275)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  char *v279;
  uint64_t v280;
  uint64_t v281;
  char *v282;
  char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  char *v292;
  uint64_t v293;
  __int128 v294;
  uint64_t v295;
  char *v296;
  char *v297;
  uint64_t v298;
  char *v299;
  char *v300;
  char *v301;
  char *v302;
  uint64_t v303;
  uint64_t v304;
  void (*v305)(char *, uint64_t, uint64_t);
  char *v306;
  uint64_t v307;
  unint64_t v308;
  void (*v309)(char *, uint64_t);
  uint64_t v310;
  char *v311;
  char *v312;
  char *v313;
  char *v314;
  uint64_t v315;
  uint64_t v316;
  id v317;
  uint64_t v318;
  uint64_t v319;
  unint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  char *v328;
  void (*v329)(uint64_t, uint64_t, uint64_t, uint64_t);
  char v330[8];
  uint64_t v331;
  char v332[8];
  char v333[8];
  uint64_t v334;
  uint64_t v335;
  char v336[8];
  char v337[8];
  char v338[8];
  char *v339;
  unint64_t v340;

  v285 = a8;
  v291 = a7;
  v293 = a6;
  v316 = a5;
  v289 = a4;
  v11 = type metadata accessor for URL.DirectoryHint(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v278 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v287 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v287);
  v288 = (char *)&v278 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100011254(&qword_10006D108);
  __chkstk_darwin(v16);
  v286 = (uint64_t)&v278 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100011254(&qword_10006D7C0);
  __chkstk_darwin(v18);
  v290 = (uint64_t)&v278 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v327 = type metadata accessor for UTType(0);
  v318 = *(_QWORD *)(v327 - 8);
  __chkstk_darwin(v327);
  v301 = (char *)&v278 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100011254((uint64_t *)&unk_10006D800);
  __chkstk_darwin(v21);
  v313 = (char *)&v278 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100011254(&qword_10006D050);
  v24 = __chkstk_darwin(v23);
  v284 = (uint64_t)&v278 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v24);
  v28 = (char *)&v278 - v27;
  v29 = __chkstk_darwin(v26);
  v314 = (char *)&v278 - v30;
  __chkstk_darwin(v29);
  v312 = (char *)&v278 - v31;
  v32 = sub_100011254(&qword_10006D458);
  __chkstk_darwin(v32);
  v306 = (char *)&v278 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v319 = type metadata accessor for CRLSEManifestItem(0);
  v310 = *(_QWORD *)(v319 - 8);
  v34 = __chkstk_darwin(v319);
  v323 = (uint64_t)&v278 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __chkstk_darwin(v34);
  v324 = (uint64_t)&v278 - v37;
  __chkstk_darwin(v36);
  v328 = (char *)&v278 - v38;
  v315 = type metadata accessor for CRLSEImportManifest(0);
  __chkstk_darwin(v315);
  v295 = (uint64_t)&v278 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for URL(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = __chkstk_darwin(v40);
  v283 = (char *)&v278 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __chkstk_darwin(v42);
  v292 = (char *)&v278 - v45;
  v46 = __chkstk_darwin(v44);
  v299 = (char *)&v278 - v47;
  v48 = __chkstk_darwin(v46);
  v300 = (char *)&v278 - v49;
  v50 = __chkstk_darwin(v48);
  v296 = (char *)&v278 - v51;
  v52 = __chkstk_darwin(v50);
  v297 = (char *)&v278 - v53;
  v54 = __chkstk_darwin(v52);
  v302 = (char *)&v278 - v55;
  __chkstk_darwin(v54);
  v57 = (char *)&v278 - v56;
  v317 = (id)objc_opt_self(NSFileManager);
  v58 = objc_msgSend(v317, "defaultManager");
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
  v303 = a2;
  v305 = v59;
  v59(v57, a2, v40);
  URL._bridgeToObjectiveC()(v60);
  v62 = v61;
  v63 = *(void (**)(char *, uint64_t))(v41 + 8);
  v311 = v57;
  v309 = v63;
  v63(v57, v40);
  v339 = 0;
  LODWORD(v57) = objc_msgSend(v58, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v62, 1, 0, &v339);

  v64 = v339;
  if (!(_DWORD)v57)
  {
    v203 = v64;
    v204 = ((uint64_t (*)(void))_convertNSErrorToError(_:))();

    swift_willThrow(v205);
    goto LABEL_66;
  }
  v65 = a3;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v277 = a3;
    else
      v277 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v66 = _CocoaArrayWrapper.endIndex.getter(v277);
  }
  else
  {
    v66 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a3);
  }
  v282 = v28;
  v279 = v14;
  v280 = v12;
  v281 = v11;
  v326 = v40;
  v321 = v41;
  if (!v66)
  {
    v304 = 0;
LABEL_63:
    swift_bridgeObjectRelease(v65);
    v206 = type metadata accessor for PropertyListEncoder(0);
    swift_allocObject(v206, *(unsigned int *)(v206 + 48), *(unsigned __int16 *)(v206 + 52));
    v70 = (void *)PropertyListEncoder.init()();
    dispatch thunk of PropertyListEncoder.outputFormat.setter(100);
    v207 = v295;
    sub_1000191EC(v316, v295, type metadata accessor for CRLSEImportManifest);
    v208 = sub_1000177C4(&qword_10006D810, type metadata accessor for CRLSEImportManifest, (uint64_t)&unk_100052AC4);
    v209 = v304;
    v40 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v207, v315, v208);
    v65 = v210;
    v204 = v209;
    sub_100013BBC(v207, type metadata accessor for CRLSEImportManifest);
    if (v209)
    {
      swift_release(v70);
      goto LABEL_66;
    }
    v211 = v292;
    v212 = v326;
    v305(v292, v293, v326);
    Data.write(to:options:)(v211, 0, v40, v65);
    v309(v211, v212);
    v228 = v291;
    v229 = v290;
    sub_100019B3C(v291, v290, &qword_10006D7C0);
    v230 = type metadata accessor for CRLSEBoardIdentifier(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v230 - 8) + 48))(v229, 1, v230) == 1)
    {
      sub_100019B80(v229, &qword_10006D7C0);
      v231 = sub_10003864C();
      v232 = (char *)sub_10003CAA4((uint64_t)v231);
      swift_bridgeObjectRelease(v231);
      v233 = sub_100011254((uint64_t *)&unk_10006D630);
      v234 = (uint64_t)v288;
      v235 = &v288[*(int *)(v233 + 48)];
      v236 = &v288[*(int *)(v233 + 64)];
      v237 = type metadata accessor for UUID(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v237 - 8) + 16))(v234, v285, v237);
      v238 = (_QWORD *)(v228 + *(int *)(type metadata accessor for CRLSEBoard(0) + 20));
      v239 = v238[1];
      *(_QWORD *)v235 = *v238;
      *((_QWORD *)v235 + 1) = v239;
      v240 = swift_bridgeObjectRetain(v239);
      Date.init()(v240);
      v241 = type metadata accessor for Date(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v241 - 8) + 56))(v236, 0, 1, v241);
      swift_storeEnumTagMultiPayload(v234, v287, 3);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v232);
      v339 = v232;
      v243 = v286;
      sub_100039A64(v234, isUniquelyReferenced_nonNull_native, v286);
      v244 = v339;
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_100019B80(v243, &qword_10006D108);
      v339 = v244;
      v245 = sub_100011254(&qword_10006D818);
      v246 = sub_10003CBC4();
      v247 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))dispatch thunk of PropertyListEncoder.encode<A>(_:)(&v339, v245, v246);
      v28 = v248;
      swift_bridgeObjectRelease(v244);
      v329 = v247;
      v304 = 0;
      v249 = v289 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
      swift_beginAccess(v289 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL, v337, 0, 0);
      v250 = v284;
      sub_100019B3C(v249, v284, &qword_10006D050);
      v251 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48);
      v68 = v326;
      if (v251(v250, 1, v326))
      {
        sub_100019B80(v250, &qword_10006D050);
        v67 = (uint64_t)v282;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v282, 1, 1, v68);
      }
      else
      {
        v266 = v311;
        v305(v311, v250, v68);
        sub_100019B80(v250, &qword_10006D050);
        v339 = (char *)0xD000000000000013;
        v340 = 0x8000000100054B20;
        v267 = v280;
        v268 = *(void (**)(char *, _QWORD, uint64_t))(v280 + 104);
        v328 = v28;
        v269 = v279;
        v270 = v281;
        v268(v279, enum case for URL.DirectoryHint.inferFromPath(_:), v281);
        v271 = sub_100039770();
        v67 = (uint64_t)v282;
        URL.appending<A>(path:directoryHint:)(&v339, v269, &type metadata for String, v271);
        v272 = *(void (**)(char *, uint64_t))(v267 + 8);
        v273 = v269;
        v28 = v328;
        v71 = v321;
        v272(v273, v270);
        swift_bridgeObjectRelease(v340);
        v309(v266, v68);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v71 + 56))(v67, 0, 1, v68);
        if (v251(v67, 1, v68) != 1)
          goto LABEL_85;
      }
      sub_100026428((uint64_t)v329, (unint64_t)v28);
      sub_100026428(v40, v65);
      swift_release(v70);
      v252 = &qword_10006D050;
      v253 = v67;
    }
    else
    {
      sub_100026428(v40, v65);
      swift_release(v70);
      v252 = &qword_10006D7C0;
      v253 = v229;
    }
    sub_100019B80(v253, v252);
    goto LABEL_83;
  }
  v67 = v66;
  v304 = 0;
  v320 = a3 & 0xC000000000000001;
  v68 = 4;
  v294 = xmmword_100052780;
  v308 = v65;
  v307 = v66;
  while (1)
  {
    v69 = v320
        ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v68 - 4, v65)
        : *(id *)(v65 + 8 * v68);
    v70 = v69;
    v71 = v68 - 3;
    if (__OFADD__(v68 - 4, 1))
      break;
    v72 = objc_msgSend(v69, "attributedText");
    if (!v72 || (v73 = v72, v74 = objc_msgSend(v72, "length"), v73, (uint64_t)v74 <= 0))
    {
      v322 = v68 - 3;
      v325 = v70;
      v75 = v324;
      UUID.init()();
      v76 = (int *)v319;
      v77 = v40;
      v78 = v75 + *(int *)(v319 + 24);
      v79 = type metadata accessor for AttributedString(0);
      v80 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 56);
      v80(v78, 1, 1, v79);
      v81 = v75 + v76[7];
      v329 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56);
      v329(v81, 1, 1, v77);
      v82 = v75 + v76[8];
      v83 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v318 + 56);
      v83(v82, 1, 1, v327);
      v84 = (_QWORD *)(v75 + v76[5]);
      v85 = v325;
      *v84 = 0;
      v84[1] = 0;
      if (objc_msgSend(v85, "attributedText"))
      {
        v86 = (uint64_t)v306;
        AttributedString.init(_:)();
        v80(v86, 0, 1, v79);
        sub_10002D894(v86, v78, &qword_10006D458);
      }
      v87 = objc_msgSend(v85, "url");
      if (v87)
      {
        v88 = v87;
        v89 = (uint64_t)v312;
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v87);

        v90 = 0;
        v91 = v326;
        v28 = v313;
      }
      else
      {
        v90 = 1;
        v91 = v326;
        v28 = v313;
        v89 = (uint64_t)v312;
      }
      v92 = 1;
      v329(v89, v90, 1, v91);
      sub_10002D894(v89, v81, &qword_10006D050);
      v93 = objc_msgSend(v85, "mediaUTI");
      if (v93)
      {
        v94 = v93;
        static UTType._unconditionallyBridgeFromObjectiveC(_:)();

        v92 = 0;
      }
      v95 = v317;
      v83((uint64_t)v28, v92, 1, v327);
      sub_10002D894((uint64_t)v28, v82, (uint64_t *)&unk_10006D800);
      v96 = (uint64_t)v328;
      sub_100017A6C(v324, (uint64_t)v328, type metadata accessor for CRLSEManifestItem);
      v97 = objc_msgSend(v85, "url");
      if (v97)
      {
        v98 = v97;
        v99 = v311;
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v97);

        v100 = v321;
        v28 = *(char **)(v321 + 32);
        v101 = (uint64_t)v314;
        ((void (*)(char *, char *, uint64_t))v28)(v314, v99, v91);
        v329(v101, 0, 1, v91);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v101, 1, v91) != 1)
        {
          v102 = v302;
          v103 = ((uint64_t (*)(char *, uint64_t, uint64_t))v28)(v302, v101, v91);
          if ((URL.isFileURL.getter(v103) & 1) != 0)
          {
            v104 = v91;
            v105 = URL.lastPathComponent.getter();
            v107 = v106;
            v108 = v311;
            v109 = ((uint64_t (*)(char *, uint64_t, uint64_t))v305)(v311, v303, v104);
            v110 = UUID.uuidString.getter(v109);
            v112 = v111;
            v113 = v297;
            URL.appendingPathComponent(_:)(v110);
            swift_bridgeObjectRelease(v112);
            v114 = v108;
            v115 = v317;
            v309(v114, v104);
            v116 = objc_msgSend(v115, "defaultManager");
            URL._bridgeToObjectiveC()(v117);
            v119 = v118;
            v339 = 0;
            LODWORD(v104) = objc_msgSend(v116, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v118, 1, 0, &v339);

            v120 = v339;
            if (!(_DWORD)v104)
            {
              v259 = v120;
              swift_bridgeObjectRelease(v107);
              swift_bridgeObjectRelease(v308);
              v204 = _convertNSErrorToError(_:)(v259);

              swift_willThrow(v260);
              v261 = v113;
              v262 = v326;
              v263 = v309;
              v309(v261, v326);
LABEL_78:
              v263(v102, v262);
              goto LABEL_79;
            }
            v121 = v105;
            v122 = v296;
            URL.appendingPathComponent(_:)(v121);
            swift_bridgeObjectRelease(v107);
            v123 = objc_msgSend(v115, "defaultManager");
            URL._bridgeToObjectiveC()(v124);
            v126 = v125;
            URL._bridgeToObjectiveC()(v127);
            v129 = v128;
            v339 = 0;
            v130 = objc_msgSend(v123, "copyItemAtURL:toURL:error:", v126, v128, &v339);

            v131 = v339;
            v132 = v113;
            if (!v130)
            {
              v264 = v339;
              swift_bridgeObjectRelease(v308);
              v204 = _convertNSErrorToError(_:)(v131);

              swift_willThrow(v265);
              v262 = v326;
              v263 = v309;
              v309(v122, v326);
              v263(v132, v262);
              goto LABEL_78;
            }
            v133 = v339;
            v134 = v113;
            v135 = v122;
            v40 = v326;
            v136 = v309;
            v309(v134, v326);
            v136(v102, v40);
            v96 = (uint64_t)v328;
            v137 = (uint64_t)&v328[*(int *)(v319 + 28)];
            sub_100019B80(v137, &qword_10006D050);
            ((void (*)(uint64_t, char *, uint64_t))v28)(v137, v135, v40);
            v329(v137, 0, 1, v40);
            v85 = v325;
            goto LABEL_56;
          }
          v309(v102, v91);
          v85 = v325;
LABEL_29:
          v138 = (UIImage *)objc_msgSend(v85, "image");
          if (v138)
          {
            v139 = v138;
            v140 = -[UIImage CGImage](v138, "CGImage");
            if (v140)
            {
              v141 = v140;
              AlphaInfo = CGImageGetAlphaInfo(v140);
              if (AlphaInfo <= kCGImageAlphaNoneSkipFirst && ((1 << AlphaInfo) & 0x61) != 0)
                v143 = UIImageJPEGRepresentation(v139, 0.8);
              else
                v143 = UIImagePNGRepresentation(v139);
              v144 = v143;
              v145 = v144;
              if (v144)
              {
                v146 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v144);
                v148 = v147;

                v149 = -[UIImage CGImage](v139, "CGImage");
                v325 = v148;
                v298 = v146;
                if (v149)
                {
                  v150 = v149;
                  v151 = CGImageGetAlphaInfo(v149);
                  v152 = (v151 > kCGImageAlphaNoneSkipFirst) | (0x1Eu >> v151);

                }
                else
                {
                  LOBYTE(v152) = 0;
                }
                v153 = sub_100011254((uint64_t *)&unk_10006D690);
                v154 = (char *)swift_allocObject(v153, 48, 7);
                *((_OWORD *)v154 + 1) = v294;
                v155 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
                v156 = String._bridgeToObjectiveC()();
                v157 = String._bridgeToObjectiveC()();
                v158 = objc_msgSend(v155, "localizedStringForKey:value:table:", v156, v157, 0);

                v159 = static String._unconditionallyBridgeFromObjectiveC(_:)(v158);
                v161 = v160;

                *((_QWORD *)v154 + 4) = v159;
                *((_QWORD *)v154 + 5) = v161;
                v162 = v301;
                if ((v152 & 1) != 0)
                  v163 = static UTType.png.getter();
                else
                  v163 = static UTType.jpeg.getter();
                v164 = UTType.preferredFilenameExtension.getter(v163);
                v166 = v165;
                (*(void (**)(char *, uint64_t))(v318 + 8))(v162, v327);
                if (v166)
                  v167 = v164;
                else
                  v167 = 6778480;
                if (!v166)
                  v166 = 0xE300000000000000;
                v169 = *((_QWORD *)v154 + 2);
                v168 = *((_QWORD *)v154 + 3);
                if (v169 >= v168 >> 1)
                  v154 = sub_100045854((char *)(v168 > 1), v169 + 1, 1, v154);
                *((_QWORD *)v154 + 2) = v169 + 1;
                v170 = &v154[16 * v169];
                *((_QWORD *)v170 + 4) = v167;
                *((_QWORD *)v170 + 5) = v166;
                v28 = v311;
                v171 = v326;
                v172 = ((uint64_t (*)(char *, uint64_t, uint64_t))v305)(v311, v303, v326);
                v173 = UUID.uuidString.getter(v172);
                v175 = v174;
                v176 = v300;
                URL.appendingPathComponent(_:)(v173);
                swift_bridgeObjectRelease(v175);
                v309(v28, v171);
                v177 = objc_msgSend(v95, "defaultManager");
                URL._bridgeToObjectiveC()(v178);
                v180 = v179;
                v339 = 0;
                LODWORD(v171) = objc_msgSend(v177, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v179, 1, 0, &v339);

                v181 = v339;
                if (!(_DWORD)v171)
                {
                  v254 = v339;
                  swift_bridgeObjectRelease(v308);
                  swift_bridgeObjectRelease(v154);
                  v204 = _convertNSErrorToError(_:)(v181);

                  swift_willThrow(v255);
                  sub_100026428(v298, (unint64_t)v325);
                  v309(v176, v326);
LABEL_79:
                  sub_100013BBC((uint64_t)v328, type metadata accessor for CRLSEManifestItem);
                  goto LABEL_66;
                }
                v339 = v154;
                v182 = v181;
                v183 = sub_100011254(&qword_10006D3B8);
                v184 = sub_10002BEFC();
                v185 = BidirectionalCollection<>.joined(separator:)(46, 0xE100000000000000, v183, v184);
                v187 = v186;
                swift_bridgeObjectRelease(v154);
                v188 = v299;
                URL.appendingPathComponent(_:)(v185);
                v189 = v187;
                v190 = v188;
                swift_bridgeObjectRelease(v189);
                v191 = v188;
                v192 = v298;
                v193 = (unint64_t)v325;
                v194 = v304;
                Data.write(to:options:)(v191, 1, v298, v325);
                v304 = v194;
                if (v194)
                {

                  sub_100026428(v192, v193);
                  v256 = v190;
                  v257 = v326;
                  v258 = v309;
                  v309(v256, v326);
                  v258(v176, v257);
                  swift_bridgeObjectRelease(v308);
                  sub_100013BBC((uint64_t)v328, type metadata accessor for CRLSEManifestItem);
                  v204 = v304;
                  goto LABEL_66;
                }
                v195 = v326;
                v309(v176, v326);
                sub_100026428(v192, v193);

                v40 = v195;
                v96 = (uint64_t)v328;
                v196 = (uint64_t)&v328[*(int *)(v319 + 28)];
                sub_100019B80(v196, &qword_10006D050);
                (*(void (**)(uint64_t, char *, uint64_t))(v321 + 32))(v196, v190, v40);
                v329(v196, 0, 1, v40);
                goto LABEL_56;
              }

            }
            else
            {

            }
          }
          v40 = v326;
LABEL_56:
          sub_1000191EC(v96, v323, type metadata accessor for CRLSEManifestItem);
          v197 = *(int *)(v315 + 28);
          v198 = v316;
          v199 = *(_QWORD **)(v316 + v197);
          v200 = swift_isUniquelyReferenced_nonNull_native(v199);
          *(_QWORD *)(v198 + v197) = v199;
          if ((v200 & 1) == 0)
          {
            v199 = (_QWORD *)sub_100045954(0, v199[2] + 1, 1, v199);
            *(_QWORD *)(v316 + v197) = v199;
          }
          v41 = v321;
          v202 = v199[2];
          v201 = v199[3];
          if (v202 >= v201 >> 1)
          {
            v199 = (_QWORD *)sub_100045954(v201 > 1, v202 + 1, 1, v199);
            *(_QWORD *)(v316 + v197) = v199;
          }
          v67 = v307;
          v199[2] = v202 + 1;
          sub_100017A6C(v323, (uint64_t)v199+ ((*(unsigned __int8 *)(v310 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v310 + 80))+ *(_QWORD *)(v310 + 72) * v202, type metadata accessor for CRLSEManifestItem);

          sub_100013BBC((uint64_t)v328, type metadata accessor for CRLSEManifestItem);
          v65 = v308;
          v71 = v322;
          goto LABEL_7;
        }
      }
      else
      {
        v101 = (uint64_t)v314;
        v329((uint64_t)v314, 1, 1, v91);
      }
      sub_100019B80(v101, &qword_10006D050);
      goto LABEL_29;
    }

LABEL_7:
    ++v68;
    if (v71 == v67)
      goto LABEL_63;
  }
  __break(1u);
LABEL_85:
  v274 = v283;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v283, v67, v68);
  v275 = v329;
  v276 = v304;
  Data.write(to:options:)(v274, 0, v329, v28);
  if (!v276)
  {
    v309(v274, v68);
    sub_100026428((uint64_t)v275, (unint64_t)v28);
    sub_100026428(v40, v65);
    swift_release(v70);
LABEL_83:
    v227 = 1;
    goto LABEL_69;
  }
  v309(v274, v68);
  sub_100026428((uint64_t)v275, (unint64_t)v28);
  sub_100026428(v40, v65);
  swift_release(v70);
  v204 = v276;
LABEL_66:
  if (qword_10006C648 != -1)
    swift_once(&qword_10006C648, sub_10003EE80);
  swift_beginAccess(&static OS_os_log.crlSharingExtension, &v339, 0, 0);
  v213 = (void *)static OS_os_log.crlSharingExtension;
  v214 = sub_100011254((uint64_t *)&unk_10006D060);
  inited = swift_initStackObject(v214, v338);
  *(_OWORD *)(inited + 16) = xmmword_100052750;
  swift_getErrorValue(v204, v336, v333);
  v216 = v334;
  v217 = v335;
  v218 = v213;
  v219 = Error.publicDescription.getter(v216, v217);
  v221 = v220;
  *(_QWORD *)(inited + 56) = &type metadata for String;
  v222 = sub_10002646C();
  *(_QWORD *)(inited + 64) = v222;
  *(_QWORD *)(inited + 32) = v219;
  *(_QWORD *)(inited + 40) = v221;
  swift_getErrorValue(v204, v332, v330);
  v223 = Error.fullDescription.getter(v331);
  *(_QWORD *)(inited + 96) = &type metadata for String;
  *(_QWORD *)(inited + 104) = v222;
  *(_QWORD *)(inited + 72) = v223;
  *(_QWORD *)(inited + 80) = v224;
  v225 = static os_log_type_t.error.getter();
  sub_100043700((uint64_t)v218, &_mh_execute_header, v225, "Failed to write sharing extension data with error: %{public}@ <%@>", 66, 2, inited);
  swift_errorRelease(v204);
  swift_setDeallocating(inited);
  v226 = sub_100011254((uint64_t *)&unk_10006D070);
  swift_arrayDestroy(inited + 32, 2, v226);

  v227 = 0;
LABEL_69:
  *a9 = v227;
}

uint64_t sub_100037EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *);
  uint64_t v10;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *))(a1 + 32);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v8(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100037F48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;

  v1 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v5 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100011254(&qword_10006D030);
  __chkstk_darwin(v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10003864C();
  v12 = v11;
  v13 = v11[2];
  if (v13)
  {
    v24 = v10;
    v25 = v0;
    v28 = _swiftEmptyArrayStorage;
    sub_1000397B4(0, v13, 0);
    v14 = *(unsigned __int8 *)(v2 + 80);
    v23 = v12;
    v15 = (uint64_t)v12 + ((v14 + 32) & ~v14);
    v16 = *(_QWORD *)(v2 + 72);
    v17 = v28;
    v26 = v16;
    do
    {
      sub_1000191EC(v15, (uint64_t)v4, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_1000191EC((uint64_t)v4, (uint64_t)v7, type metadata accessor for CRLSELibraryViewModel.Item);
      *(_QWORD *)&v7[*(int *)(v27 + 20)] = _swiftEmptyArrayStorage;
      sub_100013BBC((uint64_t)v4, type metadata accessor for CRLSELibraryViewModel.Item);
      if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
      {
        sub_1000397B4(0, v17[2] + 1, 1);
        v16 = v26;
        v17 = v28;
      }
      v19 = v17[2];
      v18 = v17[3];
      if (v19 >= v18 >> 1)
      {
        sub_1000397B4(v18 > 1, v19 + 1, 1);
        v16 = v26;
        v17 = v28;
      }
      v17[2] = v19 + 1;
      sub_100017A6C((uint64_t)v7, (uint64_t)v17+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v19, type metadata accessor for CRLSELibraryViewModeItemNode);
      v15 += v16;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease(v23);
    v10 = v24;
  }
  else
  {
    swift_bridgeObjectRelease(v11);
    v17 = _swiftEmptyArrayStorage;
  }
  sub_1000381C0((uint64_t)v10);
  v20 = type metadata accessor for CRLSELibrary(0);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  v21 = sub_10004B570((uint64_t)v10, (uint64_t)v17);
  swift_bridgeObjectRelease(v17);
  return v21;
}

uint64_t sub_1000381C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  _BYTE v36[24];

  v34 = a1;
  v2 = type metadata accessor for URL.DirectoryHint(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v33 - v14;
  v16 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  swift_beginAccess(v16, v36, 0, 0);
  sub_100019B3C(v16, (uint64_t)v8, &qword_10006D050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100019B80((uint64_t)v8, &qword_10006D050);
    v25 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v34, 1, 1, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    v17 = type metadata accessor for PropertyListDecoder(0);
    swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
    v18 = PropertyListDecoder.init()();
    strcpy((char *)v35, "Snapshot.plist");
    HIBYTE(v35[1]) = -18;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
    v19 = sub_100039770();
    URL.appending<A>(path:directoryHint:)(v35, v5, &type metadata for String, v19);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease(v35[1]);
    v20 = Data.init(contentsOf:options:)(v13, 0);
    v22 = v21;
    v23 = sub_100011254(&qword_10006CBF8);
    v24 = sub_10003AE14();
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v35, v23, v20, v22, v23, v24);
    v33 = v35[0];
    v27 = *(_QWORD *)(v35[0] + 16);
    v28 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
    v29 = *(_QWORD *)(v28 - 8);
    if (v27)
    {
      v30 = v34;
      sub_1000191EC(v33 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80)), v34, type metadata accessor for CRLSELibraryViewModeItemNode);
      v31 = 0;
    }
    else
    {
      v31 = 1;
      v30 = v34;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v30, v31, 1, v28);
    sub_100026428(v20, v22);
    swift_release(v18);
    swift_bridgeObjectRelease(v33);
    v32 = *(void (**)(char *, uint64_t))(v10 + 8);
    v32(v13, v9);
    return ((uint64_t (*)(char *, uint64_t))v32)(v15, v9);
  }
}

_QWORD *sub_10003864C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *object;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(_BYTE *, uint64_t);
  unint64_t v29;
  void (*v30)(_BYTE *, uint64_t);
  _BYTE v31[72];
  unint64_t v32;
  unint64_t v33;
  _BYTE v34[24];

  v1 = type metadata accessor for URL.DirectoryHint(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = &v31[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v5);
  v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  v14 = &v31[-v13];
  v15 = v0 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  swift_beginAccess(v15, v34, 0, 0);
  sub_100019B3C(v15, (uint64_t)v7, &qword_10006D050);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100019B80((uint64_t)v7, &qword_10006D050);
    return _swiftEmptyArrayStorage;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v14, v7, v8);
  v32 = 0xD000000000000013;
  v33 = 0x8000000100054B20;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for URL.DirectoryHint.inferFromPath(_:), v1);
  v16 = sub_100039770();
  URL.appending<A>(path:directoryHint:)(&v32, v4, &type metadata for String, v16);
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease(v33);
  v17 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  object = URL.path(percentEncoded:)(0)._object;
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  LODWORD(object) = objc_msgSend(v17, "fileExistsAtPath:", v19);

  if (!(_DWORD)object)
  {
    v27 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
    v27(v12, v8);
    v27(v14, v8);
    return _swiftEmptyArrayStorage;
  }
  v20 = type metadata accessor for PropertyListDecoder(0);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  v21 = PropertyListDecoder.init()();
  v22 = Data.init(contentsOf:options:)(v12, 0);
  v24 = v23;
  v25 = sub_100011254(&qword_10006D790);
  v26 = sub_10003AD98();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(&v32, v25, v22, v24, v25, v26);
  swift_release(v21);
  sub_100026428(v22, v24);
  v29 = v32;
  v30 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v30(v12, v8);
  v30(v14, v8);
  return (_QWORD *)v29;
}

uint64_t sub_100038ACC(uint64_t a1, uint64_t a2)
{
  return sub_10003AE90(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_100038AE8()
{
  return sub_100032650();
}

uint64_t sub_100038AF4()
{
  uint64_t v0;

  return sub_100032750(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

Swift::Int sub_100038B04(Swift::Int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSString v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  __n128 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  Swift::Int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD *v70;

  v67 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v67);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v7 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100011254(&qword_10006D030);
  v11 = __chkstk_darwin(v10);
  v62 = (uint64_t)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v63 = (uint64_t)&v58 - v13;
  v14 = type metadata accessor for CharacterSet(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    v42 = sub_10003972C();
    v43 = swift_allocError(&type metadata for CRLSEExtensionContextManager.Error, v42, 0, 0);
    *(_OWORD *)v44 = xmmword_100052E50;
LABEL_12:
    *(_BYTE *)(v44 + 16) = 0;
    swift_willThrow(v43);
    return a1;
  }
  v60 = v7;
  v65 = v9;
  v66 = v6;
  v58 = v2;
  swift_bridgeObjectRetain(a2);
  v59 = a1;
  v61 = a2;
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v18, "crl_stringByFixingBrokenSurrogatePairs");

  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v22 = v21;

  v68 = v20;
  v69 = v22;
  static CharacterSet.whitespacesAndNewlines.getter();
  v23 = sub_100039770();
  a1 = StringProtocol.trimmingCharacters(in:)(v17, &type metadata for String, v23);
  v25 = v24;
  v26 = *(void (**)(char *, uint64_t))(v15 + 8);
  v26(v17, v14);
  swift_bridgeObjectRelease(v69);
  while (1)
  {
    v68 = a1;
    v69 = v25;
    v27 = swift_bridgeObjectRetain(v25);
    static CharacterSet.newlines.getter(v27);
    v28 = StringProtocol.rangeOfCharacter(from:options:range:)(v17, 0, 0, 0, 1, &type metadata for String, v23);
    v30 = v29;
    v32 = v31;
    v26(v17, v14);
    swift_bridgeObjectRelease(v69);
    if ((v32 & 1) != 0)
      break;
    a1 = sub_100039178(v28, v30, 0x20uLL, 0xE100000000000000, a1, v25);
    v34 = v33;
    swift_bridgeObjectRelease(v25);
    v25 = v34;
  }
  v35 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v35 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v35)
  {
    swift_bridgeObjectRelease(v25);
    v45 = sub_10003972C();
    v43 = swift_allocError(&type metadata for CRLSEExtensionContextManager.Error, v45, 0, 0);
    v46 = v61;
    *(_QWORD *)v44 = v59;
    *(_QWORD *)(v44 + 8) = v46;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease(v61);
  v36 = sub_100037F48();
  v37 = v36 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  swift_beginAccess(v36 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, &v68, 0, 0);
  v38 = v63;
  sub_100019B3C(v37, v63, &qword_10006D030);
  swift_release(v36);
  v39 = v62;
  sub_100019B3C(v38, v62, &qword_10006D030);
  v40 = v60;
  v41 = v64;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v39, 1, v64) == 1)
  {
    sub_100019B80(v39, &qword_10006D030);
  }
  else
  {
    v47 = *(_QWORD *)(v39 + *(int *)(v41 + 20));
    swift_bridgeObjectRetain(v47);
    sub_100013BBC(v39, type metadata accessor for CRLSELibraryViewModeItemNode);
    v48 = *(_QWORD *)(v47 + 16);
    if (v48)
    {
      v70 = _swiftEmptyArrayStorage;
      sub_1000397EC(0, v48, 0);
      v49 = *(unsigned __int8 *)(v40 + 80);
      v62 = v47;
      v64 = *(_QWORD *)(v40 + 72);
      v50 = (uint64_t)v65;
      sub_1000191EC(v47 + ((v49 + 32) & ~v49), (uint64_t)v65, type metadata accessor for CRLSELibraryViewModeItemNode);
      v51 = (uint64_t)v66;
      sub_1000191EC(v50, (uint64_t)v66, type metadata accessor for CRLSELibraryViewModel.Item);
      v52 = (char *)&loc_100038F58 + *((int *)qword_100039168 + swift_getEnumCaseMultiPayload(v51, v67));
      __asm { BR              X9 }
    }
    swift_bridgeObjectRelease(v47);
  }
  v53 = sub_100034F04(a1, v25, _swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  if ((v53 & 1) != 0)
  {
    v54 = sub_10003972C();
    v55 = swift_allocError(&type metadata for CRLSEExtensionContextManager.Error, v54, 0, 0);
    *(_QWORD *)v56 = a1;
    *(_QWORD *)(v56 + 8) = v25;
    *(_BYTE *)(v56 + 16) = 1;
    swift_willThrow(v55);
  }
  sub_100019B80(v38, &qword_10006D030);
  return a1;
}

Swift::Int sub_100039178(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  Swift::Int result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  Swift::Int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  Swift::Int v47;
  unint64_t v48;
  Swift::Int v49;
  Swift::Int v50;
  uint64_t v51;
  Swift::Int v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v59 = 0;
  v60 = 0xE000000000000000;
  v55 = a5;
  v56 = a6;
  v12 = swift_bridgeObjectRetain(a6);
  Substring.init<A>(_:)(&v55, &type metadata for String, &protocol witness table for String, v12);
  v14 = v13;
  swift_bridgeObjectRelease(v13);
  if ((v14 & 0x1000000000000000) != 0)
    goto LABEL_25;
  v55 = a3;
  v56 = a4;
  v15 = swift_bridgeObjectRetain(a4);
  Substring.init<A>(_:)(&v55, &type metadata for String, &protocol witness table for String, v15);
  v17 = v16;
  result = swift_bridgeObjectRelease(v16);
  if ((v17 & 0x1000000000000000) != 0)
    goto LABEL_25;
  v19 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0)
    LOBYTE(v19) = 1;
  v20 = 4 << v19;
  v21 = a1;
  if ((a1 & 0xC) == 4 << v19)
  {
    result = sub_10003AD20(a1, a5, a6);
    v21 = result;
  }
  v53 = a1;
  v54 = a3;
  v22 = a2;
  v23 = a5 & 0x800000000000000;
  if ((a6 & 0x1000000000000000) != 0)
  {
    v25 = a6 & 0x2000000000000000;
    v27 = a5 & 0xFFFFFFFFFFFFLL;
    v26 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) != 0)
      v45 = HIBYTE(a6) & 0xF;
    else
      v45 = a5 & 0xFFFFFFFFFFFFLL;
    if (v45 < v21 >> 16)
      goto LABEL_43;
    result = String.UTF8View._foreignDistance(from:to:)(15);
    v24 = result;
    if (v23)
      v28 = 7;
    else
      v28 = 11;
  }
  else
  {
    v24 = v21 >> 16;
    v25 = a6 & 0x2000000000000000;
    v26 = HIBYTE(a6) & 0xF;
    v27 = a5 & 0xFFFFFFFFFFFFLL;
    v28 = 7;
  }
  if (!v25)
    v26 = v27;
  v29 = 4 << (v23 >> 59);
  v30 = v28 | (v26 << 16);
  a2 = v22;
  if ((a6 & 0x1000000000000000) == 0)
    v29 = 8;
  v31 = v22;
  if ((v22 & 0xC) == v29)
  {
    v46 = v22;
    v47 = v24;
    result = sub_10003AD20(v46, a5, a6);
    v24 = v47;
    v31 = result;
  }
  if ((v28 & 0xC) == v20)
  {
    v48 = v28 | (v26 << 16);
    v49 = v24;
    result = sub_10003AD20(v48, a5, a6);
    v24 = v49;
    v30 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_17:
      v32 = (v30 >> 16) - (v31 >> 16);
      if ((a4 & 0x1000000000000000) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_17;
  }
  if (v26 < v31 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v26 >= v30 >> 16)
  {
    v50 = v24;
    v51 = String.UTF8View._foreignDistance(from:to:)(v31);
    v24 = v50;
    v32 = v51;
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_18:
      a3 = v54;
      if ((a4 & 0x2000000000000000) != 0)
      {
        result = HIBYTE(a4) & 0xF;
        v33 = v24 + result;
        if (!__OFADD__(v24, result))
          goto LABEL_23;
      }
      else
      {
        result = v54 & 0xFFFFFFFFFFFFLL;
        v33 = v24 + (v54 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v24, v54 & 0xFFFFFFFFFFFFLL))
          goto LABEL_23;
      }
      goto LABEL_39;
    }
LABEL_37:
    a3 = v54;
    v52 = v24;
    result = String.UTF8View._foreignCount()();
    v33 = v52 + result;
    if (!__OFADD__(v52, result))
    {
LABEL_23:
      result = v33 + v32;
      if (!__OFADD__(v33, v32))
      {
        String.reserveCapacity(_:)(result);
        a1 = v53;
LABEL_25:
        v34 = String.subscript.getter(15, a1, a5, a6);
        v36 = v35;
        v55 = v34;
        v56 = v37;
        v57 = v38;
        v58 = v35;
        v39 = sub_100039808();
        String.append<A>(contentsOf:)(&v55, &type metadata for Substring, v39);
        swift_bridgeObjectRelease(v36);
        v55 = a3;
        v56 = a4;
        String.append<A>(contentsOf:)(&v55, &type metadata for String, &protocol witness table for String);
        v40 = sub_10003ACD4(a2, a5, a6);
        v42 = v41;
        v55 = v40;
        v56 = v43;
        v57 = v44;
        v58 = v41;
        String.append<A>(contentsOf:)(&v55, &type metadata for Substring, v39);
        swift_bridgeObjectRelease(v42);
        return v59;
      }
      goto LABEL_40;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

id sub_10003957C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEExtensionContextManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10003961C()
{
  return type metadata accessor for CRLSEExtensionContextManager(0);
}

uint64_t type metadata accessor for CRLSEExtensionContextManager(uint64_t a1)
{
  uint64_t result;

  result = qword_10006D750;
  if (!qword_10006D750)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CRLSEExtensionContextManager);
  return result;
}

void sub_100039660(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_1000396D8(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    v4[3] = "\b";
    swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
  }
}

void sub_1000396D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10006D4D0)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10006D4D0);
  }
}

unint64_t sub_10003972C()
{
  unint64_t result;

  result = qword_10006D768;
  if (!qword_10006D768)
  {
    result = swift_getWitnessTable(&unk_100052F20, &type metadata for CRLSEExtensionContextManager.Error);
    atomic_store(result, (unint64_t *)&qword_10006D768);
  }
  return result;
}

unint64_t sub_100039770()
{
  unint64_t result;

  result = qword_10006D770;
  if (!qword_10006D770)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10006D770);
  }
  return result;
}

size_t sub_1000397B4(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_100045ADC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

char *sub_1000397D0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100045AF0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1000397EC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100045BF4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t sub_100039808()
{
  unint64_t result;

  result = qword_10006D780;
  if (!qword_10006D780)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_10006D780);
  }
  return result;
}

size_t sub_10003984C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_100045CF4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100039868(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[9];

  v3 = v2;
  v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v2 + 40));
  swift_bridgeObjectRetain(v10);
  sub_100015378();
  v11 = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v22 = v2;
    v23 = a1;
    v14 = ~v12;
    v15 = *(_QWORD *)(v7 + 72);
    while (1)
    {
      sub_1000191EC(*(_QWORD *)(v10 + 48) + v15 * v13, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100018C64((uint64_t)v9, a2);
      v17 = v16;
      sub_100013BBC((uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
      if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease(v10);
        v3 = v22;
        a1 = v23;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease(v10);
    sub_100013BBC(a2, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000191EC(*(_QWORD *)(*v22 + 48) + v15 * v13, v23, type metadata accessor for CRLSELibraryViewModel.Item);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v10);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    sub_1000191EC(a2, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
    v24[0] = *v3;
    *v3 = 0x8000000000000000;
    sub_10003AAF8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    v19 = *v3;
    *v3 = v24[0];
    swift_bridgeObjectRelease(v19);
    sub_100017A6C(a2, a1, type metadata accessor for CRLSELibraryViewModel.Item);
    return 1;
  }
}

uint64_t sub_100039A64@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[9];

  v44 = a3;
  v43 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v6 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = v3;
  v9 = *v3;
  Hasher.init(_seed:)(v48, *(_QWORD *)(*v3 + 40));
  sub_100015378();
  v10 = Hasher._finalize()();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  v12 = v10 & ~v11;
  v13 = *(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12;
  v46 = v6;
  if ((v13 & 1) != 0)
  {
    v14 = ~v11;
    v15 = *(_QWORD *)(v6 + 72);
    do
    {
      sub_1000191EC(*(_QWORD *)(v9 + 48) + v15 * v12, (uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100018C64((uint64_t)v8, a1);
      v17 = v16;
      sub_100013BBC((uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      if ((v17 & 1) != 0)
        break;
      v12 = (v12 + 1) & v14;
    }
    while (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  else
  {
    v17 = 0;
  }
  v18 = v45;
  v19 = *(_QWORD *)(*v45 + 16);
  v20 = (v17 & 1) == 0;
  v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v22 = *(_QWORD *)(*v45 + 24);
  if (v22 >= v21 && (a2 & 1) != 0)
  {
    if ((v17 & 1) != 0)
    {
LABEL_11:
      v23 = *(_QWORD *)(v46 + 72) * v12;
LABEL_27:
      v41 = *v18;
      v40 = v44;
      sub_100017A6C(*(_QWORD *)(v41 + 48) + v23, v44, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100017A6C(a1, *(_QWORD *)(v41 + 48) + v23, type metadata accessor for CRLSELibraryViewModel.Item);
      v39 = 0;
      v35 = v46;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v40, v39, 1, v43);
    }
    goto LABEL_16;
  }
  if ((a2 & 1) != 0)
  {
    sub_100039DA4(v21);
  }
  else
  {
    if (v22 >= v21)
    {
      sub_10003A36C();
      if ((v17 & 1) != 0)
        goto LABEL_11;
LABEL_16:
      v24 = v12 >> 6;
      v25 = 1 << v12;
      goto LABEL_24;
    }
    sub_10003A58C(v21);
  }
  v26 = *v18;
  Hasher.init(_seed:)(v48, *(_QWORD *)(*v18 + 40));
  sub_100015378();
  v27 = Hasher._finalize()();
  v28 = -1 << *(_BYTE *)(v26 + 32);
  v12 = v27 & ~v28;
  v47 = v26;
  v29 = v26 + 56;
  v24 = v12 >> 6;
  v25 = 1 << v12;
  if (((1 << v12) & *(_QWORD *)(v29 + 8 * (v12 >> 6))) != 0)
  {
    v30 = ~v28;
    v31 = *(_QWORD *)(v46 + 72);
    while (1)
    {
      v23 = v31 * v12;
      sub_1000191EC(*(_QWORD *)(v47 + 48) + v31 * v12, (uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100018C64((uint64_t)v8, a1);
      v33 = v32;
      sub_100013BBC((uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      if ((v33 & 1) != 0)
        break;
      v12 = (v12 + 1) & v30;
      v24 = v12 >> 6;
      v25 = 1 << v12;
      if ((*(_QWORD *)(v29 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
      {
        v18 = v45;
        goto LABEL_23;
      }
    }
    v18 = v45;
    if ((v17 & 1) != 0)
      goto LABEL_27;
  }
  else
  {
LABEL_23:
    if ((v17 & 1) == 0)
    {
LABEL_24:
      v34 = *v18;
      *(_QWORD *)(v34 + 8 * v24 + 56) |= v25;
      v35 = v46;
      sub_100017A6C(a1, *(_QWORD *)(v34 + 48) + *(_QWORD *)(v46 + 72) * v12, type metadata accessor for CRLSELibraryViewModel.Item);
      v36 = *(_QWORD *)(v34 + 16);
      v37 = __OFADD__(v36, 1);
      v38 = v36 + 1;
      if (!v37)
      {
        *(_QWORD *)(v34 + 16) = v38;
        v39 = 1;
        v40 = v44;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v40, v39, 1, v43);
      }
      goto LABEL_30;
    }
  }
LABEL_31:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v43);
  __break(1u);
  return result;
}

void sub_100039DA4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD v33[10];

  v2 = v1;
  v28 = type metadata accessor for UUID(0);
  v27[3] = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v27[2] = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v5);
  v27[1] = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v29 = (uint64_t)v27 - v12;
  v13 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100011254(&qword_10006D828);
  v14 = static _SetStorage.resize(original:capacity:move:)(v13, a1, 1);
  v32 = v13;
  if (!*(_QWORD *)(v13 + 16))
  {
    v26 = v32;
    goto LABEL_28;
  }
  v27[0] = v2;
  v15 = 1 << *(_BYTE *)(v32 + 32);
  v16 = *(_QWORD *)(v32 + 56);
  v31 = (_QWORD *)(v32 + 56);
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v27[4] = v11 + 8;
  v30 = (unint64_t)(v15 + 63) >> 6;
  swift_retain(v32);
  v27[5] = v8;
  v27[6] = v7;
  v19 = v29;
  if (v18)
  {
    v20 = __clz(__rbit64(v18));
    goto LABEL_22;
  }
  if (v30 > 1)
  {
    v21 = v31[1];
    v22 = 1;
    if (v21)
      goto LABEL_21;
    v22 = 2;
    if (v30 > 2)
    {
      v21 = v31[2];
      if (v21)
        goto LABEL_21;
      v22 = 3;
      if (v30 > 3)
      {
        v21 = v31[3];
        if (!v21)
        {
          v23 = 4;
          if (v30 > 4)
          {
            v21 = v31[4];
            if (v21)
            {
              v22 = 4;
              goto LABEL_21;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
              {
                __break(1u);
                JUMPOUT(0x10003A35CLL);
              }
              if (v22 >= v30)
                break;
              v21 = v31[v22];
              ++v23;
              if (v21)
                goto LABEL_21;
            }
          }
          goto LABEL_23;
        }
LABEL_21:
        v20 = __clz(__rbit64(v21)) + (v22 << 6);
LABEL_22:
        sub_100017A6C(*(_QWORD *)(v32 + 48) + *(_QWORD *)(v8 + 72) * v20, v29, type metadata accessor for CRLSELibraryViewModel.Item);
        Hasher.init(_seed:)(v33, *(_QWORD *)(v14 + 40));
        sub_1000191EC(v19, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
        v24 = (char *)&loc_10003A0C0 + dword_10003A35C[swift_getEnumCaseMultiPayload(v11, v7)];
        __asm { BR              X9 }
      }
    }
  }
LABEL_23:
  swift_release(v32);
  v2 = (uint64_t *)v27[0];
  v25 = 1 << *(_BYTE *)(v32 + 32);
  if (v25 > 63)
    bzero(v31, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v31 = -1 << v25;
  v26 = v32;
  *(_QWORD *)(v32 + 16) = 0;
LABEL_28:
  swift_release(v26);
  *v2 = v14;
}

void sub_10003A36C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011254(&qword_10006D828);
  v6 = *v0;
  v7 = static _SetStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    swift_release(v6);
LABEL_30:
    *v1 = v8;
    return;
  }
  v25 = v1;
  v9 = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)v9 >= v6 + 56 + 8 * v11)
    memmove(v9, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_1000191EC(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_100017A6C((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    swift_release(v6);
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
}

void sub_10003A58C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[7];
  uint64_t v25;
  _QWORD *v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[10];

  v2 = v1;
  v25 = type metadata accessor for UUID(0);
  v24[3] = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v24[2] = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v5);
  v24[1] = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v28 = *(_QWORD *)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v29 = (uint64_t)v24 - v11;
  v12 = *v1;
  if (*(_QWORD *)(*v1 + 24) > a1)
    a1 = *(_QWORD *)(*v1 + 24);
  sub_100011254(&qword_10006D828);
  v13 = static _SetStorage.resize(original:capacity:move:)(v12, a1, 0);
  if (!*(_QWORD *)(v12 + 16))
  {
    swift_release(v12);
    goto LABEL_25;
  }
  v24[0] = v1;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = *(_QWORD *)(v12 + 56);
  v26 = (_QWORD *)(v12 + 56);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v24[4] = v10 + 8;
  v27 = (unint64_t)(v14 + 63) >> 6;
  swift_retain(v12);
  v24[5] = v12;
  v24[6] = v7;
  if (v17)
  {
    v18 = __clz(__rbit64(v17));
    goto LABEL_22;
  }
  if (v27 > 1)
  {
    v19 = v26[1];
    v20 = 1;
    if (v19)
      goto LABEL_21;
    v20 = 2;
    if (v27 > 2)
    {
      v19 = v26[2];
      if (v19)
        goto LABEL_21;
      v20 = 3;
      if (v27 > 3)
      {
        v19 = v26[3];
        if (!v19)
        {
          v21 = 4;
          if (v27 > 4)
          {
            v19 = v26[4];
            if (v19)
            {
              v20 = 4;
              goto LABEL_21;
            }
            while (1)
            {
              v20 = v21 + 1;
              if (__OFADD__(v21, 1))
              {
                __break(1u);
                JUMPOUT(0x10003AAE8);
              }
              if (v20 >= v27)
                break;
              v19 = v26[v20];
              ++v21;
              if (v19)
                goto LABEL_21;
            }
          }
          goto LABEL_23;
        }
LABEL_21:
        v18 = __clz(__rbit64(v19)) + (v20 << 6);
LABEL_22:
        v22 = v29;
        sub_1000191EC(*(_QWORD *)(v12 + 48) + *(_QWORD *)(v28 + 72) * v18, v29, type metadata accessor for CRLSELibraryViewModel.Item);
        Hasher.init(_seed:)(v30, *(_QWORD *)(v13 + 40));
        sub_1000191EC(v22, (uint64_t)v10, type metadata accessor for CRLSELibraryViewModel.Item);
        v23 = (char *)&loc_10003A89C + *((int *)qword_10003AAE8 + swift_getEnumCaseMultiPayload(v10, v7));
        __asm { BR              X9 }
      }
    }
  }
LABEL_23:
  swift_release_n(v12, 2);
  v2 = (uint64_t *)v24[0];
LABEL_25:
  *v2 = v13;
}

uint64_t sub_10003AAF8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[9];

  v4 = v3;
  v8 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(*v4 + 16);
  v13 = *(_QWORD *)(*v4 + 24);
  v29 = v9;
  if (v13 > v12 && (a3 & 1) != 0)
    goto LABEL_12;
  v14 = v12 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100039DA4(v14);
  }
  else
  {
    if (v13 > v12)
    {
      sub_10003A36C();
      goto LABEL_12;
    }
    sub_10003A58C(v14);
  }
  v15 = *v4;
  Hasher.init(_seed:)(v30, *(_QWORD *)(*v4 + 40));
  sub_100015378();
  v16 = Hasher._finalize()();
  v17 = -1 << *(_BYTE *)(v15 + 32);
  a2 = v16 & ~v17;
  if (((*(_QWORD *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v28 = v8;
    v18 = ~v17;
    v19 = *(_QWORD *)(v9 + 72);
    do
    {
      sub_1000191EC(*(_QWORD *)(v15 + 48) + v19 * a2, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100018C64((uint64_t)v11, a1);
      v21 = v20;
      sub_100013BBC((uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
      if ((v21 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v18;
    }
    while (((*(_QWORD *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v22 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_100017A6C(a1, *(_QWORD *)(v22 + 48) + *(_QWORD *)(v29 + 72) * a2, type metadata accessor for CRLSELibraryViewModel.Item);
  v24 = *(_QWORD *)(v22 + 16);
  v25 = __OFADD__(v24, 1);
  v26 = v24 + 1;
  if (!v25)
  {
    *(_QWORD *)(v22 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v28);
  __break(1u);
  return result;
}

unint64_t sub_10003ACD4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return String.subscript.getter();
  __break(1u);
  return result;
}

uint64_t sub_10003AD20(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

unint64_t sub_10003AD98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D798;
  if (!qword_10006D798)
  {
    v1 = sub_1000192FC(&qword_10006D790);
    sub_1000177C4((unint64_t *)&unk_10006D7A0, type metadata accessor for CRLSELibraryViewModel.Item, (uint64_t)&unk_10005131C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006D798);
  }
  return result;
}

unint64_t sub_10003AE14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D7B0;
  if (!qword_10006D7B0)
  {
    v1 = sub_1000192FC(&qword_10006CBF8);
    sub_1000177C4(&qword_10006CC00, type metadata accessor for CRLSELibraryViewModeItemNode, (uint64_t)&unk_10005115C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006D7B0);
  }
  return result;
}

uint64_t sub_10003AE90(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) == 0)
      return 0;
  }
  else if ((a6 & 1) != 0)
  {
    return 0;
  }
  if (a1 == a4 && a2 == a5)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0);
}

uint64_t sub_10003AED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = type metadata accessor for CRLSEBoard(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  v6 = v0 + v4;
  v7 = type metadata accessor for CRLSEBoardIdentifier(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v0 + v4, 1, v7))
  {
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
    v9 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease(*(_QWORD *)(v6 + *(int *)(v9 + 20) + 8));
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v6 + *(int *)(v1 + 20) + 8));
  v10 = v6 + *(int *)(v1 + 24);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  return swift_deallocObject(v0, ((((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

void sub_10003B000(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(type metadata accessor for CRLSEBoard(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000363D4(a1, v1[2], v1[3], v1[4], v1[5], v1[6], (uint64_t)v1 + v4, *(uint64_t *)((char *)v1 + v5), *(char **)((char *)v1 + ((v5 + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10003B078()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003B088(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003B098(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10003B0A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D7F0;
  if (!qword_10006D7F0)
  {
    v1 = sub_10002663C(255, (unint64_t *)&qword_10006CF00, NSError_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSError, v1);
    atomic_store(result, (unint64_t *)&qword_10006D7F0);
  }
  return result;
}

_QWORD *sub_10003B0F8(unint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t i;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v34;

  v2 = a1;
  v34 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
    goto LABEL_40;
  for (i = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = _CocoaArrayWrapper.endIndex.getter(v27))
  {
    v28 = v2;
    v4 = 0;
    v31 = v2 & 0xFFFFFFFFFFFFFF8;
    v32 = v2 & 0xC000000000000001;
    v29 = i;
    v30 = v2 + 32;
    while (1)
    {
      if (v32)
      {
        v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v28);
      }
      else
      {
        if (v4 >= *(_QWORD *)(v31 + 16))
          goto LABEL_37;
        v8 = *(id *)(v30 + 8 * v4);
      }
      v9 = v8;
      if (__OFADD__(v4++, 1))
        goto LABEL_38;
      v11 = *a2;
      if ((unint64_t)*a2 >> 62)
      {
        if (v11 < 0)
          v25 = *a2;
        else
          v25 = v11 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain_n(*a2, 2);
        v12 = _CocoaArrayWrapper.endIndex.getter(v25);
        if (!v12)
          goto LABEL_4;
      }
      else
      {
        v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n(*a2, 2);
        if (!v12)
          goto LABEL_4;
      }
      if ((v11 & 0xC000000000000001) != 0)
        v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v11);
      else
        v13 = *(id *)(v11 + 32);
      v14 = v13;
      v2 = sub_10002663C(0, &qword_10006D088, &off_100060BE8);
      v15 = static NSObject.== infix(_:_:)(v14, v9);

      if ((v15 & 1) != 0)
      {
LABEL_15:

        swift_bridgeObjectRelease_n(v11, 2);
        goto LABEL_5;
      }
      if (v12 != 1)
        break;
LABEL_4:
      v5 = swift_bridgeObjectRelease_n(v11, 2);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v5);
      v6 = v34[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
      v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v9);
      v2 = (uint64_t)&v34;
      specialized ContiguousArray._endMutation()(v7);
LABEL_5:
      if (v4 == v29)
        return v34;
    }
    if ((v11 & 0xC000000000000001) != 0)
    {
      v16 = 1;
      while (1)
      {
        v17 = specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v11);
        v18 = v16 + 1;
        if (__OFADD__(v16, 1))
          break;
        v19 = v17;
        v20 = static NSObject.== infix(_:_:)(v17, v9);
        swift_unknownObjectRelease(v19);
        if ((v20 & 1) != 0)
          goto LABEL_15;
        ++v16;
        if (v18 == v12)
          goto LABEL_4;
      }
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v21 = 5;
    while (1)
    {
      v22 = v21 - 3;
      if (__OFADD__(v21 - 4, 1))
        break;
      v23 = *(id *)(v11 + 8 * v21);
      v24 = static NSObject.== infix(_:_:)(v23, v9);

      if ((v24 & 1) != 0)
        goto LABEL_15;
      ++v21;
      if (v22 == v12)
        goto LABEL_4;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    if (v2 < 0)
      v27 = v2;
    else
      v27 = v2 & 0xFFFFFFFFFFFFFF8;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10003B398(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __n128 v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  unint64_t v49;

  v3 = v2;
  v45 = a2;
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v43 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100011254(&qword_10006D050);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v46 = (uint64_t)&v36 - v12;
  if ((unint64_t)a1 >> 62)
  {
LABEL_28:
    if (a1 < 0)
      v33 = a1;
    else
      v33 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v34 = _CocoaArrayWrapper.endIndex.getter(v33);
    swift_bridgeObjectRelease(a1);
    v47 = v34;
    if (v34)
      goto LABEL_3;
    return 0;
  }
  v47 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v47)
    return 0;
LABEL_3:
  v13 = 0;
  v49 = a1 & 0xC000000000000001;
  v44 = a1 + 32;
  v38 = v3;
  v39 = (uint64_t *)(v45 + 40);
  v3 = v47;
  v37 = a1;
  v41 = v6;
  v42 = v5;
  v40 = v11;
  while (1)
  {
    if (v49)
      v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, a1);
    else
      v14 = *(id *)(v44 + 8 * v13);
    v15 = v14;
    if (!objc_msgSend(v14, "isHTTP"))
    {

      v19 = __OFADD__(v13++, 1);
      if (v19)
        goto LABEL_27;
      goto LABEL_24;
    }
    v16 = objc_msgSend(v15, "url");
    if (v16)
    {
      v17 = v16;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v16);

      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, v18, 1, v5);
    v20 = v46;
    sub_100031D00((uint64_t)v11, v46, &qword_10006D050);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v20, 1, v5))
    {
      sub_100019B80(v20, &qword_10006D050);

      goto LABEL_23;
    }
    v21 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v43, v20, v5);
    v22 = sub_100019B80(v20, &qword_10006D050);
    v23 = URL.lastPathComponent.getter(v22);
    v24 = v6;
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v5);
    v27 = v45;
    v28 = *(_QWORD *)(v45 + 16);
    if (v28)
      break;

    swift_bridgeObjectRelease(v26);
LABEL_22:
    v6 = v41;
    v5 = v42;
    v11 = v40;
LABEL_23:
    v3 = v47;
    v19 = __OFADD__(v13++, 1);
    if (v19)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
LABEL_24:
    if (v13 == v3)
      return 0;
  }
  v29 = sub_100039770();
  v30 = swift_bridgeObjectRetain(v27);
  v31 = v39;
  while (1)
  {
    v32 = *v31;
    v48[2] = *(v31 - 1);
    v48[3] = v32;
    v48[0] = v23;
    v48[1] = v26;
    if (!StringProtocol.caseInsensitiveCompare<A>(_:)(v48, &type metadata for String, &type metadata for String, v29, v29, v30))break;
    v31 += 2;
    if (!--v28)
    {

      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v45);
      a1 = v37;
      goto LABEL_22;
    }
  }

  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v45);
  return v13;
}

unint64_t sub_10003B6F8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  unint64_t v22;
  uint64_t *v23;
  char **v24;
  uint64_t v25;
  char *v26;
  id v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __n128 v44;
  char *v45;
  uint64_t v46;
  id v47;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v49;
  uint64_t v50;
  int v51;
  void *v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;

  v68 = type metadata accessor for URL(0);
  v72 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100011254(&qword_10006D050);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v62 - v11;
  v13 = a1;
  v14 = *a1;
  swift_bridgeObjectRetain(*a1);
  v15 = (uint64_t *)a2;
  v17 = sub_10003B398(v16, a2);
  v19 = v18;
  swift_bridgeObjectRelease(v14);
  if (!v2)
  {
    v20 = v13;
    v21 = (id)v68;
    v66 = v12;
    v67 = v10;
    v69 = v6;
    v64 = 0;
    if ((v19 & 1) != 0)
    {
      v57 = *v20;
      if ((unint64_t)*v20 >> 62)
      {
        if (v57 < 0)
          v61 = *v20;
        else
          v61 = v57 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v57);
        v17 = _CocoaArrayWrapper.endIndex.getter(v61);
        swift_bridgeObjectRelease(v57);
      }
      else
      {
        return *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
    }
    else
    {
      v22 = v17 + 1;
      if (__OFADD__(v17, 1))
        goto LABEL_74;
      v23 = v15;
      v15 = v20;
      v19 = *v20;
      v10 = v69;
      v6 = (char *)v23;
      if ((unint64_t)*v20 >> 62)
      {
LABEL_75:
        if (v19 < 0)
          v59 = v19;
        else
          v59 = v19 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v19);
        v60 = _CocoaArrayWrapper.endIndex.getter(v59);
        swift_bridgeObjectRelease(v19);
        if (v22 != v60)
          goto LABEL_6;
      }
      else if (v22 != *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_6:
        v65 = v6;
        v62 = v15;
        v63 = v6 + 40;
        v24 = &selRef_centerXAnchor;
        while (1)
        {
          v25 = *v15;
          if ((*v15 & 0xC000000000000001) != 0)
          {
            v26 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v22, v25);
          }
          else
          {
            if ((v22 & 0x8000000000000000) != 0)
            {
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
LABEL_67:
              __break(1u);
LABEL_68:
              __break(1u);
LABEL_69:
              __break(1u);
LABEL_70:
              __break(1u);
LABEL_71:
              __break(1u);
LABEL_72:
              __break(1u);
LABEL_73:
              __break(1u);
LABEL_74:
              __break(1u);
              goto LABEL_75;
            }
            if (v22 >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_65;
            v26 = (char *)*(id *)(v25 + 8 * v22 + 32);
          }
          v6 = v26;
          if (!objc_msgSend(v26, v24[174], v62))
            break;
          v27 = objc_msgSend(v6, "url");
          if (v27)
          {
            v28 = v27;
            v29 = v67;
            static URL._unconditionallyBridgeFromObjectiveC(_:)(v27);

            v30 = (uint64_t)v29;
            v31 = 0;
          }
          else
          {
            v31 = 1;
            v30 = (uint64_t)v67;
          }
          v32 = v72;
          v33 = v21;
          (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v72 + 56))(v30, v31, 1, v21);
          v34 = v30;
          v35 = (uint64_t)v66;
          v19 = (uint64_t)&qword_10006D050;
          sub_100031D00(v34, (uint64_t)v66, &qword_10006D050);
          if ((*(unsigned int (**)(uint64_t, uint64_t, id))(v32 + 48))(v35, 1, v33))
          {
            sub_100019B80(v35, &qword_10006D050);

            v21 = v33;
          }
          else
          {
            (*(void (**)(char *, uint64_t, id))(v32 + 16))(v10, v35, v33);
            v36 = sub_100019B80(v35, &qword_10006D050);
            v37 = URL.lastPathComponent.getter(v36);
            v38 = v33;
            v39 = v37;
            v41 = v40;
            (*(void (**)(char *, id))(v32 + 8))(v10, v38);
            v19 = (uint64_t)v65;
            v42 = *((_QWORD *)v65 + 2);
            if (v42)
            {
              v43 = sub_100039770();
              v44 = swift_bridgeObjectRetain(v19);
              v45 = v63;
              while (1)
              {
                v46 = *(_QWORD *)v45;
                v71[0] = *((_QWORD *)v45 - 1);
                v71[1] = v46;
                v70[0] = v39;
                v70[1] = v41;
                v19 = (uint64_t)v71;
                if (!StringProtocol.caseInsensitiveCompare<A>(_:)(v70, &type metadata for String, &type metadata for String, v43, v43, v44))break;
                v45 += 16;
                if (!--v42)
                {

                  swift_bridgeObjectRelease(v41);
                  swift_bridgeObjectRelease(v65);
                  v15 = v62;
                  goto LABEL_25;
                }
              }

              swift_bridgeObjectRelease(v41);
              swift_bridgeObjectRelease(v65);
              v15 = v62;
              v21 = (id)v68;
              v10 = v69;
              v24 = &selRef_centerXAnchor;
              v54 = __OFADD__(v22++, 1);
              if (v54)
                goto LABEL_66;
              goto LABEL_47;
            }

            swift_bridgeObjectRelease(v41);
LABEL_25:
            v21 = (id)v68;
            v10 = v69;
          }
          v24 = &selRef_centerXAnchor;
          if (v17 != v22)
            goto LABEL_27;
LABEL_45:
          v54 = __OFADD__(v17++, 1);
          if (v54)
            goto LABEL_67;
          v54 = __OFADD__(v22++, 1);
          if (v54)
            goto LABEL_66;
LABEL_47:
          v19 = *v15;
          if ((unint64_t)*v15 >> 62)
          {
            if (v19 < 0)
              v56 = *v15;
            else
              v56 = v19 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(*v15);
            v55 = _CocoaArrayWrapper.endIndex.getter(v56);
            swift_bridgeObjectRelease(v19);
          }
          else
          {
            v55 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          if (v22 == v55)
            return v17;
        }

        if (v17 == v22)
          goto LABEL_45;
LABEL_27:
        v19 = *v15;
        if ((*v15 & 0xC000000000000001) != 0)
        {
          v47 = v21;
          v6 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, *v15);
          v19 = *v15;
          if ((*v15 & 0xC000000000000001) == 0)
          {
LABEL_31:
            if ((v22 & 0x8000000000000000) != 0)
              goto LABEL_70;
            if (v22 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_71;
            v21 = *(id *)(v19 + 8 * v22 + 32);
            goto LABEL_34;
          }
        }
        else
        {
          if ((v17 & 0x8000000000000000) != 0)
            goto LABEL_68;
          if (v17 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_69;
          v47 = v21;
          v6 = (char *)*(id *)(v19 + 8 * v17 + 32);
          if ((v19 & 0xC000000000000001) == 0)
            goto LABEL_31;
        }
        v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v22, v19);
        v19 = *v15;
LABEL_34:
        isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v19);
        *v15 = v19;
        if (!isUniquelyReferenced_nonNull_bridgeObject || v19 < 0 || (v19 & 0x4000000000000000) != 0)
        {
          v19 = sub_10004B504(v19);
          *v15 = v19;
        }
        v49 = *(void **)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20);
        *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20) = v21;

        specialized Array._endMutation()(v50);
        v19 = *v15;
        v51 = swift_isUniquelyReferenced_nonNull_bridgeObject(*v15);
        *v15 = v19;
        if (!v51 || v19 < 0 || (v19 & 0x4000000000000000) != 0)
        {
          v19 = sub_10004B504(v19);
          *v15 = v19;
        }
        v10 = v69;
        if ((v22 & 0x8000000000000000) != 0)
          goto LABEL_72;
        if (v22 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_73;
        v52 = *(void **)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v22 + 0x20);
        *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v22 + 0x20) = v6;

        v19 = (uint64_t)v15;
        specialized Array._endMutation()(v53);
        v21 = v47;
        goto LABEL_45;
      }
    }
  }
  return v17;
}

void *sub_10003BCB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!((unint64_t)*v3 >> 62))
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v7 >= a2)
        goto LABEL_4;
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  if (v5 < 0)
    v25 = v5;
  else
    v25 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v7 = _CocoaArrayWrapper.endIndex.getter(v25);
  swift_bridgeObjectRelease(v5);
  if (v7 < v2)
    goto LABEL_33;
LABEL_4:
  v5 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v5))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v7 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = v8 - v5;
    if (!__OFADD__(v8, v6))
      goto LABEL_8;
LABEL_41:
    __break(1u);
LABEL_42:
    if (v7 < 0)
      v27 = v7;
    else
      v27 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v12 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v7);
    v7 = *v3;
    goto LABEL_15;
  }
LABEL_36:
  if (v7 < 0)
    v26 = v7;
  else
    v26 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease(v7);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
    goto LABEL_41;
LABEL_8:
  v7 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v3);
  *v3 = v7;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v11 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v8 = 1;
  }
  if ((unint64_t)v7 >> 62)
    goto LABEL_42;
  v12 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9)
    v12 = v9;
  swift_bridgeObjectRetain(v7);
  v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v8, v12, 1, v7);
  v14 = *v3;
  *v3 = v13;
  swift_bridgeObjectRelease(v14);
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = v11 + 32;
  v16 = (char *)(v11 + 32 + 8 * v4);
  v17 = sub_10002663C(0, &qword_10006D088, &off_100060BE8);
  result = (void *)swift_arrayDestroy(v16, v5, v17);
  if (!v6)
    return (void *)specialized Array._endMutation()(result);
  v19 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    v21 = v20 - v2;
    if (!__OFSUB__(v20, v2))
      goto LABEL_21;
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v19 < 0)
    v28 = *v3;
  else
    v28 = v19 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v3);
  v29 = _CocoaArrayWrapper.endIndex.getter(v28);
  result = (void *)swift_bridgeObjectRelease(v19);
  v21 = v29 - v2;
  if (__OFSUB__(v29, v2))
    goto LABEL_51;
LABEL_21:
  v22 = (char *)(v15 + 8 * v2);
  if (v4 != v2 || v16 >= &v22[8 * v21])
    result = memmove(v16, v22, 8 * v21);
  v2 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
LABEL_52:
    if (v2 < 0)
      v30 = v2;
    else
      v30 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v31 = _CocoaArrayWrapper.endIndex.getter(v30);
    result = (void *)swift_bridgeObjectRelease(v2);
    v24 = v31 + v6;
    if (!__OFADD__(v31, v6))
      goto LABEL_26;
    goto LABEL_57;
  }
  v23 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  v24 = v23 + v6;
  if (!__OFADD__(v23, v6))
  {
LABEL_26:
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v24;
    return (void *)specialized Array._endMutation()(result);
  }
LABEL_57:
  __break(1u);
  return result;
}

void sub_10003BF6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  unint64_t v32;
  id v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  char *v38;
  uint64_t v39;
  _QWORD *v40;
  void (*v41)(char *, char *, _QWORD *);
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t, _QWORD *);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  char v49;
  uint64_t v50;
  uint64_t j;
  id v52;
  id v53;
  id v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  id v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  _QWORD *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned __int8 v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t *v81;
  _QWORD *v82;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  char *v101;
  int64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  unsigned int (*v111)(uint64_t, uint64_t, _QWORD *);
  char *v112;
  void (*v113)(char *, uint64_t, uint64_t, _QWORD *);
  int64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  _QWORD *v119;
  uint64_t v120;
  int64_t v121;
  unint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  unint64_t v125;

  v2 = sub_100011254(&qword_10006D050);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v108 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v108 - v7;
  v9 = __chkstk_darwin(v6);
  v112 = (char *)&v108 - v10;
  __chkstk_darwin(v9);
  v117 = (char *)&v108 - v11;
  v12 = (_QWORD *)type metadata accessor for URL(0);
  v120 = *(v12 - 1);
  v13 = __chkstk_darwin(v12);
  v108 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v116 = (char *)&v108 - v16;
  __chkstk_darwin(v15);
  v118 = (char *)&v108 - v17;
  v125 = (unint64_t)_swiftEmptyArrayStorage;
  v18 = *(_QWORD *)(a1 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain(a1);
    for (i = 0; i != v18; ++i)
    {
      v21 = *(void **)(a1 + 8 * i + 32);
      if (v21)
      {
        v22 = v21;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v24 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v23 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v24 >= v23 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
        v20 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v22);
        specialized Array._endMutation()(v20);
      }
    }
    swift_bridgeObjectRelease(a1);
    v25 = v125;
  }
  else
  {
    v25 = (unint64_t)_swiftEmptyArrayStorage;
  }
  v109 = v8;
  v110 = v5;
  v125 = (unint64_t)_swiftEmptyArrayStorage;
  v26 = v25;
  if (v25 >> 62)
    goto LABEL_85;
  v27 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v25);
  v119 = v12;
  if (!v27)
    goto LABEL_89;
  do
  {
    v28 = 0;
    v121 = v26;
    v122 = v26 & 0xC000000000000001;
    v114 = v26 + 32;
    v115 = v26 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if (v122)
      {
        v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v26);
      }
      else
      {
        if (v28 >= *(_QWORD *)(v115 + 16))
          goto LABEL_82;
        v29 = *(id *)(v114 + 8 * v28);
      }
      v30 = v29;
      if (__OFADD__(v28++, 1))
      {
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
        goto LABEL_83;
      }
      v32 = v125;
      if (v125 >> 62)
      {
        if ((v125 & 0x8000000000000000) != 0)
          v73 = v125;
        else
          v73 = v125 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain_n(v125, 2);
        v12 = (_QWORD *)_CocoaArrayWrapper.endIndex.getter(v73);
        if (!v12)
          goto LABEL_26;
      }
      else
      {
        v12 = *(_QWORD **)((v125 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n(v125, 2);
        if (!v12)
          goto LABEL_26;
      }
      if ((v32 & 0xC000000000000001) != 0)
        v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v32);
      else
        v33 = *(id *)(v32 + 32);
      v34 = v33;
      sub_10002663C(0, &qword_10006D088, &off_100060BE8);
      v35 = static NSObject.== infix(_:_:)(v34, v30);

      if ((v35 & 1) != 0)
        goto LABEL_23;
      if (v12 == (_QWORD *)1)
        goto LABEL_26;
      if ((v32 & 0xC000000000000001) == 0)
        break;
      v45 = specialized _ArrayBuffer._getElementSlowPath(_:)(1, v32);
      v26 = static NSObject.== infix(_:_:)(v45, v30);
      swift_unknownObjectRelease(v45);
      if ((v26 & 1) != 0)
      {
LABEL_23:
        swift_bridgeObjectRelease_n(v32, 2);
LABEL_24:

LABEL_32:
        v26 = v121;
        if (v28 == v27)
          goto LABEL_89;
      }
      else
      {
        if (v12 != (_QWORD *)2)
        {
          v46 = 2;
          do
          {
            v47 = specialized _ArrayBuffer._getElementSlowPath(_:)(v46, v32);
            v48 = (_QWORD *)(v46 + 1);
            if (__OFADD__(v46, 1))
              goto LABEL_81;
            v26 = v47;
            v49 = static NSObject.== infix(_:_:)(v47, v30);
            swift_unknownObjectRelease(v26);
            if ((v49 & 1) != 0)
              goto LABEL_23;
            ++v46;
          }
          while (v48 != v12);
        }
LABEL_26:
        swift_bridgeObjectRelease_n(v32, 2);
        v36 = objc_msgSend(v30, "url");
        v26 = (int64_t)v118;
        if (!v36)
        {
          v42 = (uint64_t)v117;
          (*(void (**)(char *, uint64_t, uint64_t, _QWORD *))(v120 + 56))(v117, 1, 1, v119);
LABEL_31:

          sub_100019B80(v42, &qword_10006D050);
          goto LABEL_32;
        }
        v37 = v36;
        v38 = v116;
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v36);

        v40 = v119;
        v39 = v120;
        v41 = *(void (**)(char *, char *, _QWORD *))(v120 + 32);
        v42 = (uint64_t)v117;
        v41(v117, v38, v119);
        v43 = *(void (**)(char *, uint64_t, uint64_t, _QWORD *))(v39 + 56);
        v43((char *)v42, 0, 1, v40);
        v12 = *(_QWORD **)(v39 + 48);
        if (((unsigned int (*)(uint64_t, uint64_t, _QWORD *))v12)(v42, 1, v40) == 1)
          goto LABEL_31;
        v44 = ((uint64_t (*)(int64_t, uint64_t, _QWORD *))v41)(v26, v42, v40);
        if ((URL.isFileURL.getter(v44) & 1) != 0)
        {
          (*(void (**)(int64_t, _QWORD *))(v39 + 8))(v26, v40);
          goto LABEL_24;
        }
        v111 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *))v12;
        v113 = v43;
        v50 = sub_10002663C(0, (unint64_t *)&unk_10006D870, NSObject_ptr);
        if (v27 < 1)
          goto LABEL_84;
        v12 = (_QWORD *)v50;
        v26 = v121;
        swift_bridgeObjectRetain(v121);
        for (j = 0; j != v27; ++j)
        {
          if (v122)
            v52 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(j, v26);
          else
            v52 = *(id *)(v26 + 8 * j + 32);
          v53 = v52;
          if ((static NSObject.== infix(_:_:)(v52, v30) & 1) != 0)
          {

            continue;
          }
          v54 = objc_msgSend(v53, "image");

          if (v54
            || (v55 = objc_msgSend(v53, "attributedText"), v55, v55))
          {
            v53 = v53;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            v57 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10);
            v56 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x18);
            if (v57 >= v56 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v56 > 1, v57 + 1, 1);
            v58 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v57, v53);
            specialized Array._endMutation()(v58);
            goto LABEL_55;
          }
          v59 = objc_msgSend(v53, "url");
          if (!v59)
          {
            v62 = (uint64_t)v112;
            v113(v112, 1, 1, v40);
LABEL_61:

            sub_100019B80(v62, &qword_10006D050);
            v26 = v121;
            continue;
          }
          v60 = v59;
          v61 = v116;
          static URL._unconditionallyBridgeFromObjectiveC(_:)(v59);

          v62 = (uint64_t)v112;
          v41(v112, v61, v40);
          v113((char *)v62, 0, 1, v40);
          if (v111(v62, 1, v40) == 1)
            goto LABEL_61;
          v63 = v108;
          v64 = ((uint64_t (*)(char *, uint64_t, _QWORD *))v41)(v108, v62, v40);
          if ((URL.isFileURL.getter(v64) & 1) != 0)
          {
            (*(void (**)(char *, _QWORD *))(v120 + 8))(v63, v40);
LABEL_55:

            v26 = v121;
            continue;
          }
          v65 = v53;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v67 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v66 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v67 >= v66 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v66 > 1, v67 + 1, 1);
          v68 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v67, v65);
          specialized Array._endMutation()(v68);

          (*(void (**)(char *, _QWORD *))(v120 + 8))(v108, v40);
          v26 = v121;
        }
        swift_bridgeObjectRelease(v26);

        (*(void (**)(char *, _QWORD *))(v120 + 8))(v118, v40);
        if (v28 == v27)
          goto LABEL_89;
      }
    }
    v69 = *(id *)(v32 + 40);
    v26 = static NSObject.== infix(_:_:)(v69, v30);

    if ((v26 & 1) != 0)
      goto LABEL_23;
    if (v12 == (_QWORD *)2)
      goto LABEL_26;
    v70 = 6;
    while (1)
    {
      v71 = (_QWORD *)(v70 - 3);
      if (__OFADD__(v70 - 4, 1))
        break;
      v72 = *(id *)(v32 + 8 * v70);
      v26 = static NSObject.== infix(_:_:)(v72, v30);

      if ((v26 & 1) != 0)
        goto LABEL_23;
      ++v70;
      if (v71 == v12)
        goto LABEL_26;
    }
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    if (v26 < 0)
      v74 = v26;
    else
      v74 = v26 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v26);
    v27 = _CocoaArrayWrapper.endIndex.getter(v74);
    v119 = v12;
  }
  while (v27);
LABEL_89:
  swift_bridgeObjectRelease(v26);
  v75 = (uint64_t)sub_10003B0F8(v26, (uint64_t *)&v125);
  swift_bridgeObjectRelease(v26);
  v124 = v75;
  if ((unint64_t)v75 >> 62)
  {
    if (v75 < 0)
      v105 = v75;
    else
      v105 = v75 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v75);
    v106 = _CocoaArrayWrapper.endIndex.getter(v105);
    swift_bridgeObjectRelease(v75);
    if (v106 < 2)
      goto LABEL_120;
LABEL_91:
    swift_bridgeObjectRetain(v75);
    v77 = sub_100034938(v76);
    swift_bridgeObjectRelease(v75);
    if ((v77 & 1) == 0)
      goto LABEL_120;
    v123 = _swiftEmptyArrayStorage;
    if ((unint64_t)v75 >> 62)
    {
      if (v75 < 0)
        v100 = v75;
      else
        v100 = v75 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v75);
      v78 = _CocoaArrayWrapper.endIndex.getter(v100);
      if (v78)
        goto LABEL_94;
    }
    else
    {
      v78 = *(_QWORD *)((v75 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v75);
      if (v78)
      {
LABEL_94:
        v118 = 0;
        if (v78 < 1)
          goto LABEL_131;
        v79 = 0;
        v80 = v75 & 0xC000000000000001;
        v81 = &qword_10006D050;
        v121 = v78;
        v122 = v75 & 0xC000000000000001;
        v82 = v119;
        v83 = v120;
        do
        {
          if (v80)
            v84 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v79, v75);
          else
            v84 = *(id *)(v75 + 8 * v79 + 32);
          v85 = v84;
          if (objc_msgSend(v84, "isPDF"))
          {
            v86 = v81;
            v87 = objc_msgSend(v85, "url");
            if (v87)
            {
              v88 = v87;
              v89 = (uint64_t)v110;
              static URL._unconditionallyBridgeFromObjectiveC(_:)(v87);

              v90 = 0;
            }
            else
            {
              v90 = 1;
              v89 = (uint64_t)v110;
            }
            (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v83 + 56))(v89, v90, 1, v82);
            v91 = v89;
            v92 = (uint64_t)v109;
            v81 = v86;
            sub_100031D00(v91, (uint64_t)v109, v86);
            if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v83 + 48))(v92, 1, v82))
            {
              sub_100019B80(v92, v86);

              v80 = v122;
            }
            else
            {
              v93 = v116;
              (*(void (**)(char *, uint64_t, _QWORD *))(v83 + 16))(v116, v92, v82);
              v94 = sub_100019B80(v92, v86);
              v95 = URL.isFileURL.getter(v94);
              v96 = (*(uint64_t (**)(char *, _QWORD *))(v83 + 8))(v93, v82);
              if ((v95 & 1) != 0)
              {
                specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v96);
                v97 = v123[2];
                specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v97);
                v98 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v97, v85);
                specialized ContiguousArray._endMutation()(v98);
              }
              else
              {

              }
              v81 = v86;
              v78 = v121;
              v80 = v122;
            }
          }
          else
          {

          }
          ++v79;
        }
        while (v78 != v79);
        swift_bridgeObjectRelease(v75);
        v99 = v123;
LABEL_117:
        v101 = sub_100031F00((uint64_t)v99);
        swift_release(v99);
        swift_bridgeObjectRetain(v101);
        v102 = sub_10003B6F8((uint64_t *)&v124, (uint64_t)v101);
        swift_bridgeObjectRelease(v101);
        v103 = v124;
        if (v124 >> 62)
        {
          if ((v124 & 0x8000000000000000) != 0)
            v107 = v124;
          else
            v107 = v124 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v124);
          v104 = _CocoaArrayWrapper.endIndex.getter(v107);
          swift_bridgeObjectRelease(v103);
          if (v104 >= v102)
            goto LABEL_119;
        }
        else
        {
          v104 = *(_QWORD *)((v124 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v104 >= v102)
          {
LABEL_119:
            sub_10003BCB8(v102, v104);
            swift_bridgeObjectRelease(v101);
            goto LABEL_120;
          }
        }
        __break(1u);
LABEL_131:
        __break(1u);
        return;
      }
    }
    swift_bridgeObjectRelease(v75);
    v99 = _swiftEmptyArrayStorage;
    goto LABEL_117;
  }
  if (*(uint64_t *)((v75 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2)
    goto LABEL_91;
LABEL_120:
  swift_bridgeObjectRelease(v125);
}

uint64_t sub_10003CAA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  v11 = sub_1000177C4((unint64_t *)&qword_10006D660, v10, (uint64_t)&unk_1000512B4);
  result = Set.init(minimumCapacity:)(v9, v2, v11);
  v16 = result;
  if (v9)
  {
    v13 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v14 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_1000191EC(v13, (uint64_t)v6, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100039868((uint64_t)v8, (uint64_t)v6);
      sub_100013BBC((uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      v13 += v14;
      --v9;
    }
    while (v9);
    return v16;
  }
  return result;
}

unint64_t sub_10003CBC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006D820;
  if (!qword_10006D820)
  {
    v1 = sub_1000192FC(&qword_10006D818);
    sub_1000177C4(&qword_10006CC10, type metadata accessor for CRLSELibraryViewModel.Item, (uint64_t)&unk_1000512F4);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Set<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10006D820);
  }
  return result;
}

_OWORD *sub_10003CC40(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10003CC54(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain(a2);
}

uint64_t destroy for CRLSEExtensionContextManager.Error(uint64_t *a1)
{
  return sub_1000286F8(*a1, a1[1]);
}

uint64_t _s24FreeformSharingExtension28CRLSEExtensionContextManagerC5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10003CC54(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CRLSEExtensionContextManager.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10003CC54(*(_QWORD *)a2, v4);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1000286F8(v6, v7);
  return a1;
}

__n128 initializeWithTake for CRLSEExtensionContextManager.Error(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CRLSEExtensionContextManager.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1000286F8(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for CRLSEExtensionContextManager.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CRLSEExtensionContextManager.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10003CDEC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10003CDF4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEExtensionContextManager.Error()
{
  return &type metadata for CRLSEExtensionContextManager.Error;
}

uint64_t *OS_os_log.crlSharingExtension.unsafeMutableAddressor()
{
  if (qword_10006C648 != -1)
    swift_once(&qword_10006C648, sub_10003EE80);
  return &static OS_os_log.crlSharingExtension;
}

void sub_10003CE54()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLDefaultCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLDefaultCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLDefaultCat_log_t, &CRLDefaultCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlDefault = (uint64_t)v1;
}

uint64_t *OS_os_log.crlDefault.unsafeMutableAddressor()
{
  if (qword_10006C5A8 != -1)
    swift_once(&qword_10006C5A8, sub_10003CE54);
  return &static OS_os_log.crlDefault;
}

id static OS_os_log.crlDefault.getter()
{
  return sub_1000435C0(&qword_10006C5A8, (id *)&static OS_os_log.crlDefault);
}

void static OS_os_log.crlDefault.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5A8, (void **)&static OS_os_log.crlDefault, (uint64_t)sub_10003CE54);
}

uint64_t (*static OS_os_log.crlDefault.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5A8 != -1)
    swift_once(&qword_10006C5A8, sub_10003CE54);
  swift_beginAccess(&static OS_os_log.crlDefault, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003CFF4()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAssertCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAssertCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssertCat_log_t, &CRLAssertCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlAssert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssert.unsafeMutableAddressor()
{
  if (qword_10006C5B0 != -1)
    swift_once(&qword_10006C5B0, sub_10003CFF4);
  return &static OS_os_log.crlAssert;
}

id static OS_os_log.crlAssert.getter()
{
  return sub_1000435C0(&qword_10006C5B0, (id *)&static OS_os_log.crlAssert);
}

void static OS_os_log.crlAssert.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5B0, (void **)&static OS_os_log.crlAssert, (uint64_t)sub_10003CFF4);
}

uint64_t (*static OS_os_log.crlAssert.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5B0 != -1)
    swift_once(&qword_10006C5B0, sub_10003CFF4);
  swift_beginAccess(&static OS_os_log.crlAssert, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003D190()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLErrorCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLErrorCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLErrorCat_log_t, &CRLErrorCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlError = (uint64_t)v1;
}

uint64_t *OS_os_log.crlError.unsafeMutableAddressor()
{
  if (qword_10006C5B8 != -1)
    swift_once(&qword_10006C5B8, sub_10003D190);
  return &static OS_os_log.crlError;
}

id static OS_os_log.crlError.getter()
{
  return sub_1000435C0(&qword_10006C5B8, (id *)&static OS_os_log.crlError);
}

void static OS_os_log.crlError.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5B8, (void **)&static OS_os_log.crlError, (uint64_t)sub_10003D190);
}

uint64_t (*static OS_os_log.crlError.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5B8 != -1)
    swift_once(&qword_10006C5B8, sub_10003D190);
  swift_beginAccess(&static OS_os_log.crlError, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003D32C()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLWarningCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLWarningCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLWarningCat_log_t, &CRLWarningCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlWarning = (uint64_t)v1;
}

uint64_t *OS_os_log.crlWarning.unsafeMutableAddressor()
{
  if (qword_10006C5C0 != -1)
    swift_once(&qword_10006C5C0, sub_10003D32C);
  return &static OS_os_log.crlWarning;
}

id static OS_os_log.crlWarning.getter()
{
  return sub_1000435C0(&qword_10006C5C0, (id *)&static OS_os_log.crlWarning);
}

void static OS_os_log.crlWarning.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5C0, (void **)&static OS_os_log.crlWarning, (uint64_t)sub_10003D32C);
}

uint64_t (*static OS_os_log.crlWarning.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5C0 != -1)
    swift_once(&qword_10006C5C0, sub_10003D32C);
  swift_beginAccess(&static OS_os_log.crlWarning, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003D4CC()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAlertCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAlertCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAlertCat_log_t, &CRLAlertCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlAlert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAlert.unsafeMutableAddressor()
{
  if (qword_10006C5C8 != -1)
    swift_once(&qword_10006C5C8, sub_10003D4CC);
  return &static OS_os_log.crlAlert;
}

id static OS_os_log.crlAlert.getter()
{
  return sub_1000435C0(&qword_10006C5C8, (id *)&static OS_os_log.crlAlert);
}

void static OS_os_log.crlAlert.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5C8, (void **)&static OS_os_log.crlAlert, (uint64_t)sub_10003D4CC);
}

uint64_t (*static OS_os_log.crlAlert.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5C8 != -1)
    swift_once(&qword_10006C5C8, sub_10003D4CC);
  swift_beginAccess(&static OS_os_log.crlAlert, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003D668()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLPerformanceCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLPerformanceCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLPerformanceCat_log_t, &CRLPerformanceCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlPerformance = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPerformance.unsafeMutableAddressor()
{
  if (qword_10006C5D0 != -1)
    swift_once(&qword_10006C5D0, sub_10003D668);
  return &static OS_os_log.crlPerformance;
}

id static OS_os_log.crlPerformance.getter()
{
  return sub_1000435C0(&qword_10006C5D0, (id *)&static OS_os_log.crlPerformance);
}

void static OS_os_log.crlPerformance.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5D0, (void **)&static OS_os_log.crlPerformance, (uint64_t)sub_10003D668);
}

uint64_t (*static OS_os_log.crlPerformance.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5D0 != -1)
    swift_once(&qword_10006C5D0, sub_10003D668);
  swift_beginAccess(&static OS_os_log.crlPerformance, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003D800()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLStatusHUDCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLStatusHUDCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLStatusHUDCat_log_t, &CRLStatusHUDCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlStatusHUD = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStatusHUD.unsafeMutableAddressor()
{
  if (qword_10006C5D8 != -1)
    swift_once(&qword_10006C5D8, sub_10003D800);
  return &static OS_os_log.crlStatusHUD;
}

id static OS_os_log.crlStatusHUD.getter()
{
  return sub_1000435C0(&qword_10006C5D8, (id *)&static OS_os_log.crlStatusHUD);
}

void static OS_os_log.crlStatusHUD.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5D8, (void **)&static OS_os_log.crlStatusHUD, (uint64_t)sub_10003D800);
}

uint64_t (*static OS_os_log.crlStatusHUD.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5D8 != -1)
    swift_once(&qword_10006C5D8, sub_10003D800);
  swift_beginAccess(&static OS_os_log.crlStatusHUD, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003D9A0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLTextInputCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLTextInputCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLTextInputCat_log_t, &CRLTextInputCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlTextInput = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTextInput.unsafeMutableAddressor()
{
  if (qword_10006C5E0 != -1)
    swift_once(&qword_10006C5E0, sub_10003D9A0);
  return &static OS_os_log.crlTextInput;
}

id static OS_os_log.crlTextInput.getter()
{
  return sub_1000435C0(&qword_10006C5E0, (id *)&static OS_os_log.crlTextInput);
}

void static OS_os_log.crlTextInput.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5E0, (void **)&static OS_os_log.crlTextInput, (uint64_t)sub_10003D9A0);
}

uint64_t (*static OS_os_log.crlTextInput.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5E0 != -1)
    swift_once(&qword_10006C5E0, sub_10003D9A0);
  swift_beginAccess(&static OS_os_log.crlTextInput, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003DB40()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLTraceableResourceCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLTraceableResourceCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLTraceableResourceCat_log_t, &CRLTraceableResourceCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlTraceableResource = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTraceableResource.unsafeMutableAddressor()
{
  if (qword_10006C5E8 != -1)
    swift_once(&qword_10006C5E8, sub_10003DB40);
  return &static OS_os_log.crlTraceableResource;
}

id static OS_os_log.crlTraceableResource.getter()
{
  return sub_1000435C0(&qword_10006C5E8, (id *)&static OS_os_log.crlTraceableResource);
}

void static OS_os_log.crlTraceableResource.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5E8, (void **)&static OS_os_log.crlTraceableResource, (uint64_t)sub_10003DB40);
}

uint64_t (*static OS_os_log.crlTraceableResource.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5E8 != -1)
    swift_once(&qword_10006C5E8, sub_10003DB40);
  swift_beginAccess(&static OS_os_log.crlTraceableResource, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003DCD8()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLStorageHierachyCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLStorageHierachyCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLStorageHierachyCat_log_t, &CRLStorageHierachyCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlStorageHierachy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStorageHierachy.unsafeMutableAddressor()
{
  if (qword_10006C5F0 != -1)
    swift_once(&qword_10006C5F0, sub_10003DCD8);
  return &static OS_os_log.crlStorageHierachy;
}

id static OS_os_log.crlStorageHierachy.getter()
{
  return sub_1000435C0(&qword_10006C5F0, (id *)&static OS_os_log.crlStorageHierachy);
}

void static OS_os_log.crlStorageHierachy.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5F0, (void **)&static OS_os_log.crlStorageHierachy, (uint64_t)sub_10003DCD8);
}

uint64_t (*static OS_os_log.crlStorageHierachy.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5F0 != -1)
    swift_once(&qword_10006C5F0, sub_10003DCD8);
  swift_beginAccess(&static OS_os_log.crlStorageHierachy, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003DE70()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSerializableObjectCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSerializableObjectCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSerializableObjectCat_log_t, &CRLSerializableObjectCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlSerializableObject = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSerializableObject.unsafeMutableAddressor()
{
  if (qword_10006C5F8 != -1)
    swift_once(&qword_10006C5F8, sub_10003DE70);
  return &static OS_os_log.crlSerializableObject;
}

id static OS_os_log.crlSerializableObject.getter()
{
  return sub_1000435C0(&qword_10006C5F8, (id *)&static OS_os_log.crlSerializableObject);
}

void static OS_os_log.crlSerializableObject.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C5F8, (void **)&static OS_os_log.crlSerializableObject, (uint64_t)sub_10003DE70);
}

uint64_t (*static OS_os_log.crlSerializableObject.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C5F8 != -1)
    swift_once(&qword_10006C5F8, sub_10003DE70);
  swift_beginAccess(&static OS_os_log.crlSerializableObject, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E008()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCollaborationParticipantCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCollaborationParticipantCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaborationParticipantCat_log_t, &CRLCollaborationParticipantCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlCollaborationParticipant = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaborationParticipant.unsafeMutableAddressor()
{
  if (qword_10006C600 != -1)
    swift_once(&qword_10006C600, sub_10003E008);
  return &static OS_os_log.crlCollaborationParticipant;
}

id static OS_os_log.crlCollaborationParticipant.getter()
{
  return sub_1000435C0(&qword_10006C600, (id *)&static OS_os_log.crlCollaborationParticipant);
}

void static OS_os_log.crlCollaborationParticipant.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C600, (void **)&static OS_os_log.crlCollaborationParticipant, (uint64_t)sub_10003E008);
}

uint64_t (*static OS_os_log.crlCollaborationParticipant.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C600 != -1)
    swift_once(&qword_10006C600, sub_10003E008);
  swift_beginAccess(&static OS_os_log.crlCollaborationParticipant, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E1A0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSpotlightCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSpotlightCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSpotlightCat_log_t, &CRLSpotlightCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlSpotlight = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSpotlight.unsafeMutableAddressor()
{
  if (qword_10006C608 != -1)
    swift_once(&qword_10006C608, sub_10003E1A0);
  return &static OS_os_log.crlSpotlight;
}

id static OS_os_log.crlSpotlight.getter()
{
  return sub_1000435C0(&qword_10006C608, (id *)&static OS_os_log.crlSpotlight);
}

void static OS_os_log.crlSpotlight.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C608, (void **)&static OS_os_log.crlSpotlight, (uint64_t)sub_10003E1A0);
}

uint64_t (*static OS_os_log.crlSpotlight.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C608 != -1)
    swift_once(&qword_10006C608, sub_10003E1A0);
  swift_beginAccess(&static OS_os_log.crlSpotlight, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E340()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLNetworkReachabilityCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLNetworkReachabilityCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLNetworkReachabilityCat_log_t, &CRLNetworkReachabilityCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlNetworkReachability = (uint64_t)v1;
}

uint64_t *OS_os_log.crlNetworkReachability.unsafeMutableAddressor()
{
  if (qword_10006C610 != -1)
    swift_once(&qword_10006C610, sub_10003E340);
  return &static OS_os_log.crlNetworkReachability;
}

id static OS_os_log.crlNetworkReachability.getter()
{
  return sub_1000435C0(&qword_10006C610, (id *)&static OS_os_log.crlNetworkReachability);
}

void static OS_os_log.crlNetworkReachability.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C610, (void **)&static OS_os_log.crlNetworkReachability, (uint64_t)sub_10003E340);
}

uint64_t (*static OS_os_log.crlNetworkReachability.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C610 != -1)
    swift_once(&qword_10006C610, sub_10003E340);
  swift_beginAccess(&static OS_os_log.crlNetworkReachability, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E4D8()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAssetDownloadManagerCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAssetDownloadManagerCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetDownloadManagerCat_log_t, &CRLAssetDownloadManagerCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlAssetDownloadManager = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssetDownloadManager.unsafeMutableAddressor()
{
  if (qword_10006C618 != -1)
    swift_once(&qword_10006C618, sub_10003E4D8);
  return &static OS_os_log.crlAssetDownloadManager;
}

id static OS_os_log.crlAssetDownloadManager.getter()
{
  return sub_1000435C0(&qword_10006C618, (id *)&static OS_os_log.crlAssetDownloadManager);
}

void static OS_os_log.crlAssetDownloadManager.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C618, (void **)&static OS_os_log.crlAssetDownloadManager, (uint64_t)sub_10003E4D8);
}

uint64_t (*static OS_os_log.crlAssetDownloadManager.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C618 != -1)
    swift_once(&qword_10006C618, sub_10003E4D8);
  swift_beginAccess(&static OS_os_log.crlAssetDownloadManager, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E670()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAnalyticsCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAnalyticsCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnalyticsCat_log_t, &CRLAnalyticsCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnalytics.unsafeMutableAddressor()
{
  if (qword_10006C620 != -1)
    swift_once(&qword_10006C620, sub_10003E670);
  return &static OS_os_log.crlAnalytics;
}

id static OS_os_log.crlAnalytics.getter()
{
  return sub_1000435C0(&qword_10006C620, (id *)&static OS_os_log.crlAnalytics);
}

void static OS_os_log.crlAnalytics.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C620, (void **)&static OS_os_log.crlAnalytics, (uint64_t)sub_10003E670);
}

uint64_t (*static OS_os_log.crlAnalytics.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C620 != -1)
    swift_once(&qword_10006C620, sub_10003E670);
  swift_beginAccess(&static OS_os_log.crlAnalytics, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E810()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLKeyboardCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLKeyboardCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardCat_log_t, &CRLKeyboardCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlKeyboard = (uint64_t)v1;
}

uint64_t *OS_os_log.crlKeyboard.unsafeMutableAddressor()
{
  if (qword_10006C628 != -1)
    swift_once(&qword_10006C628, sub_10003E810);
  return &static OS_os_log.crlKeyboard;
}

id static OS_os_log.crlKeyboard.getter()
{
  return sub_1000435C0(&qword_10006C628, (id *)&static OS_os_log.crlKeyboard);
}

void static OS_os_log.crlKeyboard.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C628, (void **)&static OS_os_log.crlKeyboard, (uint64_t)sub_10003E810);
}

uint64_t (*static OS_os_log.crlKeyboard.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C628 != -1)
    swift_once(&qword_10006C628, sub_10003E810);
  swift_beginAccess(&static OS_os_log.crlKeyboard, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003E9B0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLFolderUICat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLFolderUICat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLFolderUICat_log_t, &CRLFolderUICat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlFolderUI = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFolderUI.unsafeMutableAddressor()
{
  if (qword_10006C630 != -1)
    swift_once(&qword_10006C630, sub_10003E9B0);
  return &static OS_os_log.crlFolderUI;
}

id static OS_os_log.crlFolderUI.getter()
{
  return sub_1000435C0(&qword_10006C630, (id *)&static OS_os_log.crlFolderUI);
}

void static OS_os_log.crlFolderUI.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C630, (void **)&static OS_os_log.crlFolderUI, (uint64_t)sub_10003E9B0);
}

uint64_t (*static OS_os_log.crlFolderUI.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C630 != -1)
    swift_once(&qword_10006C630, sub_10003E9B0);
  swift_beginAccess(&static OS_os_log.crlFolderUI, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003EB50()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLBoardLibraryCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLBoardLibraryCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardLibraryCat_log_t, &CRLBoardLibraryCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlBoardLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardLibrary.unsafeMutableAddressor()
{
  if (qword_10006C638 != -1)
    swift_once(&qword_10006C638, sub_10003EB50);
  return &static OS_os_log.crlBoardLibrary;
}

id static OS_os_log.crlBoardLibrary.getter()
{
  return sub_1000435C0(&qword_10006C638, (id *)&static OS_os_log.crlBoardLibrary);
}

void static OS_os_log.crlBoardLibrary.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C638, (void **)&static OS_os_log.crlBoardLibrary, (uint64_t)sub_10003EB50);
}

uint64_t (*static OS_os_log.crlBoardLibrary.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C638 != -1)
    swift_once(&qword_10006C638, sub_10003EB50);
  swift_beginAccess(&static OS_os_log.crlBoardLibrary, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003ECE8()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLBoardPreviewImageCacheCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLBoardPreviewImageCacheCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardPreviewImageCacheCat_log_t, &CRLBoardPreviewImageCacheCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlBoardPreviewImageCache = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardPreviewImageCache.unsafeMutableAddressor()
{
  if (qword_10006C640 != -1)
    swift_once(&qword_10006C640, sub_10003ECE8);
  return &static OS_os_log.crlBoardPreviewImageCache;
}

id static OS_os_log.crlBoardPreviewImageCache.getter()
{
  return sub_1000435C0(&qword_10006C640, (id *)&static OS_os_log.crlBoardPreviewImageCache);
}

void static OS_os_log.crlBoardPreviewImageCache.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C640, (void **)&static OS_os_log.crlBoardPreviewImageCache, (uint64_t)sub_10003ECE8);
}

uint64_t (*static OS_os_log.crlBoardPreviewImageCache.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C640 != -1)
    swift_once(&qword_10006C640, sub_10003ECE8);
  swift_beginAccess(&static OS_os_log.crlBoardPreviewImageCache, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003EE80()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSharingExtensionCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSharingExtensionCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSharingExtensionCat_log_t, &CRLSharingExtensionCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlSharingExtension = (uint64_t)v1;
}

id static OS_os_log.crlSharingExtension.getter()
{
  return sub_1000435C0(&qword_10006C648, (id *)&static OS_os_log.crlSharingExtension);
}

void static OS_os_log.crlSharingExtension.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C648, (void **)&static OS_os_log.crlSharingExtension, (uint64_t)sub_10003EE80);
}

uint64_t (*static OS_os_log.crlSharingExtension.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C648 != -1)
    swift_once(&qword_10006C648, sub_10003EE80);
  swift_beginAccess(&static OS_os_log.crlSharingExtension, a1, 33, 0);
  return j__swift_endAccess;
}

void sub_10003EFDC()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLStencilLibraryCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLStencilLibraryCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLStencilLibraryCat_log_t, &CRLStencilLibraryCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlStencilLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStencilLibrary.unsafeMutableAddressor()
{
  if (qword_10006C650 != -1)
    swift_once(&qword_10006C650, sub_10003EFDC);
  return &static OS_os_log.crlStencilLibrary;
}

id static OS_os_log.crlStencilLibrary.getter()
{
  return sub_1000435C0(&qword_10006C650, (id *)&static OS_os_log.crlStencilLibrary);
}

void static OS_os_log.crlStencilLibrary.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C650, (void **)&static OS_os_log.crlStencilLibrary, (uint64_t)sub_10003EFDC);
}

uint64_t (*static OS_os_log.crlStencilLibrary.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C650 != -1)
    swift_once(&qword_10006C650, sub_10003EFDC);
  swift_beginAccess(&static OS_os_log.crlStencilLibrary, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003F174()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCarmelRealTimeMessageTransferCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCarmelRealTimeMessageTransferCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeMessageTransferCat_log_t, &CRLCarmelRealTimeMessageTransferCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlRealTimeMessageTransfer = (uint64_t)v1;
}

uint64_t *OS_os_log.crlRealTimeMessageTransfer.unsafeMutableAddressor()
{
  if (qword_10006C658 != -1)
    swift_once(&qword_10006C658, sub_10003F174);
  return &static OS_os_log.crlRealTimeMessageTransfer;
}

id static OS_os_log.crlRealTimeMessageTransfer.getter()
{
  return sub_1000435C0(&qword_10006C658, (id *)&static OS_os_log.crlRealTimeMessageTransfer);
}

void static OS_os_log.crlRealTimeMessageTransfer.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C658, (void **)&static OS_os_log.crlRealTimeMessageTransfer, (uint64_t)sub_10003F174);
}

uint64_t (*static OS_os_log.crlRealTimeMessageTransfer.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C658 != -1)
    swift_once(&qword_10006C658, sub_10003F174);
  swift_beginAccess(&static OS_os_log.crlRealTimeMessageTransfer, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003F30C()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLZoneRefetchCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLZoneRefetchCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLZoneRefetchCat_log_t, &CRLZoneRefetchCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlZoneRefetch = (uint64_t)v1;
}

uint64_t *OS_os_log.crlZoneRefetch.unsafeMutableAddressor()
{
  if (qword_10006C660 != -1)
    swift_once(&qword_10006C660, sub_10003F30C);
  return &static OS_os_log.crlZoneRefetch;
}

id static OS_os_log.crlZoneRefetch.getter()
{
  return sub_1000435C0(&qword_10006C660, (id *)&static OS_os_log.crlZoneRefetch);
}

void static OS_os_log.crlZoneRefetch.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C660, (void **)&static OS_os_log.crlZoneRefetch, (uint64_t)sub_10003F30C);
}

uint64_t (*static OS_os_log.crlZoneRefetch.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C660 != -1)
    swift_once(&qword_10006C660, sub_10003F30C);
  swift_beginAccess(&static OS_os_log.crlZoneRefetch, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003F4A4()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSendACopyCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSendACopyCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSendACopyCat_log_t, &CRLSendACopyCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlSendACopy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSendACopy.unsafeMutableAddressor()
{
  if (qword_10006C668 != -1)
    swift_once(&qword_10006C668, sub_10003F4A4);
  return &static OS_os_log.crlSendACopy;
}

id static OS_os_log.crlSendACopy.getter()
{
  return sub_1000435C0(&qword_10006C668, (id *)&static OS_os_log.crlSendACopy);
}

void static OS_os_log.crlSendACopy.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C668, (void **)&static OS_os_log.crlSendACopy, (uint64_t)sub_10003F4A4);
}

uint64_t (*static OS_os_log.crlSendACopy.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C668 != -1)
    swift_once(&qword_10006C668, sub_10003F4A4);
  swift_beginAccess(&static OS_os_log.crlSendACopy, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003F644()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCloudKitEnvironmentCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCloudKitEnvironmentCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudKitEnvironmentCat_log_t, &CRLCloudKitEnvironmentCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlCloudKitEnvironment = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudKitEnvironment.unsafeMutableAddressor()
{
  if (qword_10006C670 != -1)
    swift_once(&qword_10006C670, sub_10003F644);
  return &static OS_os_log.crlCloudKitEnvironment;
}

id static OS_os_log.crlCloudKitEnvironment.getter()
{
  return sub_1000435C0(&qword_10006C670, (id *)&static OS_os_log.crlCloudKitEnvironment);
}

void static OS_os_log.crlCloudKitEnvironment.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C670, (void **)&static OS_os_log.crlCloudKitEnvironment, (uint64_t)sub_10003F644);
}

uint64_t (*static OS_os_log.crlCloudKitEnvironment.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C670 != -1)
    swift_once(&qword_10006C670, sub_10003F644);
  swift_beginAccess(&static OS_os_log.crlCloudKitEnvironment, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003F7DC()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSidebarCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSidebarCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSidebarCat_log_t, &CRLSidebarCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlSidebar = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSidebar.unsafeMutableAddressor()
{
  if (qword_10006C678 != -1)
    swift_once(&qword_10006C678, sub_10003F7DC);
  return &static OS_os_log.crlSidebar;
}

id static OS_os_log.crlSidebar.getter()
{
  return sub_1000435C0(&qword_10006C678, (id *)&static OS_os_log.crlSidebar);
}

void static OS_os_log.crlSidebar.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C678, (void **)&static OS_os_log.crlSidebar, (uint64_t)sub_10003F7DC);
}

uint64_t (*static OS_os_log.crlSidebar.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C678 != -1)
    swift_once(&qword_10006C678, sub_10003F7DC);
  swift_beginAccess(&static OS_os_log.crlSidebar, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003F97C()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLInsertMediaCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLInsertMediaCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLInsertMediaCat_log_t, &CRLInsertMediaCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlInsertMedia = (uint64_t)v1;
}

uint64_t *OS_os_log.crlInsertMedia.unsafeMutableAddressor()
{
  if (qword_10006C680 != -1)
    swift_once(&qword_10006C680, sub_10003F97C);
  return &static OS_os_log.crlInsertMedia;
}

id static OS_os_log.crlInsertMedia.getter()
{
  return sub_1000435C0(&qword_10006C680, (id *)&static OS_os_log.crlInsertMedia);
}

void static OS_os_log.crlInsertMedia.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C680, (void **)&static OS_os_log.crlInsertMedia, (uint64_t)sub_10003F97C);
}

uint64_t (*static OS_os_log.crlInsertMedia.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C680 != -1)
    swift_once(&qword_10006C680, sub_10003F97C);
  swift_beginAccess(&static OS_os_log.crlInsertMedia, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003FB14()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCollaboratorCursorCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCollaboratorCursorCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaboratorCursorCat_log_t, &CRLCollaboratorCursorCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlCollaboratorCursor = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaboratorCursor.unsafeMutableAddressor()
{
  if (qword_10006C688 != -1)
    swift_once(&qword_10006C688, sub_10003FB14);
  return &static OS_os_log.crlCollaboratorCursor;
}

id static OS_os_log.crlCollaboratorCursor.getter()
{
  return sub_1000435C0(&qword_10006C688, (id *)&static OS_os_log.crlCollaboratorCursor);
}

void static OS_os_log.crlCollaboratorCursor.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C688, (void **)&static OS_os_log.crlCollaboratorCursor, (uint64_t)sub_10003FB14);
}

uint64_t (*static OS_os_log.crlCollaboratorCursor.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C688 != -1)
    swift_once(&qword_10006C688, sub_10003FB14);
  swift_beginAccess(&static OS_os_log.crlCollaboratorCursor, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003FCAC()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLStateRestorationCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLStateRestorationCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLStateRestorationCat_log_t, &CRLStateRestorationCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlStateRestoration = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStateRestoration.unsafeMutableAddressor()
{
  if (qword_10006C690 != -1)
    swift_once(&qword_10006C690, sub_10003FCAC);
  return &static OS_os_log.crlStateRestoration;
}

id static OS_os_log.crlStateRestoration.getter()
{
  return sub_1000435C0(&qword_10006C690, (id *)&static OS_os_log.crlStateRestoration);
}

void static OS_os_log.crlStateRestoration.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C690, (void **)&static OS_os_log.crlStateRestoration, (uint64_t)sub_10003FCAC);
}

uint64_t (*static OS_os_log.crlStateRestoration.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C690 != -1)
    swift_once(&qword_10006C690, sub_10003FCAC);
  swift_beginAccess(&static OS_os_log.crlStateRestoration, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003FE44()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLFollowCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLFollowCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLFollowCat_log_t, &CRLFollowCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlFollow = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFollow.unsafeMutableAddressor()
{
  if (qword_10006C698 != -1)
    swift_once(&qword_10006C698, sub_10003FE44);
  return &static OS_os_log.crlFollow;
}

id static OS_os_log.crlFollow.getter()
{
  return sub_1000435C0(&qword_10006C698, (id *)&static OS_os_log.crlFollow);
}

void static OS_os_log.crlFollow.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C698, (void **)&static OS_os_log.crlFollow, (uint64_t)sub_10003FE44);
}

uint64_t (*static OS_os_log.crlFollow.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C698 != -1)
    swift_once(&qword_10006C698, sub_10003FE44);
  swift_beginAccess(&static OS_os_log.crlFollow, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10003FFE0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLJoinLeaveCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLJoinLeaveCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLJoinLeaveCat_log_t, &CRLJoinLeaveCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlJoinLeave = (uint64_t)v1;
}

uint64_t *OS_os_log.crlJoinLeave.unsafeMutableAddressor()
{
  if (qword_10006C6A0 != -1)
    swift_once(&qword_10006C6A0, sub_10003FFE0);
  return &static OS_os_log.crlJoinLeave;
}

id static OS_os_log.crlJoinLeave.getter()
{
  return sub_1000435C0(&qword_10006C6A0, (id *)&static OS_os_log.crlJoinLeave);
}

void static OS_os_log.crlJoinLeave.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6A0, (void **)&static OS_os_log.crlJoinLeave, (uint64_t)sub_10003FFE0);
}

uint64_t (*static OS_os_log.crlJoinLeave.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6A0 != -1)
    swift_once(&qword_10006C6A0, sub_10003FFE0);
  swift_beginAccess(&static OS_os_log.crlJoinLeave, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040180()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLPencilHoverCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLPencilHoverCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLPencilHoverCat_log_t, &CRLPencilHoverCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlPencilHover = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPencilHover.unsafeMutableAddressor()
{
  if (qword_10006C6A8 != -1)
    swift_once(&qword_10006C6A8, sub_100040180);
  return &static OS_os_log.crlPencilHover;
}

id static OS_os_log.crlPencilHover.getter()
{
  return sub_1000435C0(&qword_10006C6A8, (id *)&static OS_os_log.crlPencilHover);
}

void static OS_os_log.crlPencilHover.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6A8, (void **)&static OS_os_log.crlPencilHover, (uint64_t)sub_100040180);
}

uint64_t (*static OS_os_log.crlPencilHover.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6A8 != -1)
    swift_once(&qword_10006C6A8, sub_100040180);
  swift_beginAccess(&static OS_os_log.crlPencilHover, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040318()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLScenesCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLScenesCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLScenesCat_log_t, &CRLScenesCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlScenes = (uint64_t)v1;
}

uint64_t *OS_os_log.crlScenes.unsafeMutableAddressor()
{
  if (qword_10006C6B0 != -1)
    swift_once(&qword_10006C6B0, sub_100040318);
  return &static OS_os_log.crlScenes;
}

id static OS_os_log.crlScenes.getter()
{
  return sub_1000435C0(&qword_10006C6B0, (id *)&static OS_os_log.crlScenes);
}

void static OS_os_log.crlScenes.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6B0, (void **)&static OS_os_log.crlScenes, (uint64_t)sub_100040318);
}

uint64_t (*static OS_os_log.crlScenes.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6B0 != -1)
    swift_once(&qword_10006C6B0, sub_100040318);
  swift_beginAccess(&static OS_os_log.crlScenes, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000404B8()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLThreeDimensionalObjectsCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLThreeDimensionalObjectsCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLThreeDimensionalObjectsCat_log_t, &CRLThreeDimensionalObjectsCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlThreeDimensionalObjects = (uint64_t)v1;
}

uint64_t *OS_os_log.crlThreeDimensionalObjects.unsafeMutableAddressor()
{
  if (qword_10006C6B8 != -1)
    swift_once(&qword_10006C6B8, sub_1000404B8);
  return &static OS_os_log.crlThreeDimensionalObjects;
}

id static OS_os_log.crlThreeDimensionalObjects.getter()
{
  return sub_1000435C0(&qword_10006C6B8, (id *)&static OS_os_log.crlThreeDimensionalObjects);
}

void static OS_os_log.crlThreeDimensionalObjects.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6B8, (void **)&static OS_os_log.crlThreeDimensionalObjects, (uint64_t)sub_1000404B8);
}

uint64_t (*static OS_os_log.crlThreeDimensionalObjects.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6B8 != -1)
    swift_once(&qword_10006C6B8, sub_1000404B8);
  swift_beginAccess(&static OS_os_log.crlThreeDimensionalObjects, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040650()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLChangeShapeCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLChangeShapeCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLChangeShapeCat_log_t, &CRLChangeShapeCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlChangeShape = (uint64_t)v1;
}

uint64_t *OS_os_log.crlChangeShape.unsafeMutableAddressor()
{
  if (qword_10006C6C0 != -1)
    swift_once(&qword_10006C6C0, sub_100040650);
  return &static OS_os_log.crlChangeShape;
}

id static OS_os_log.crlChangeShape.getter()
{
  return sub_1000435C0(&qword_10006C6C0, (id *)&static OS_os_log.crlChangeShape);
}

void static OS_os_log.crlChangeShape.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6C0, (void **)&static OS_os_log.crlChangeShape, (uint64_t)sub_100040650);
}

uint64_t (*static OS_os_log.crlChangeShape.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6C0 != -1)
    swift_once(&qword_10006C6C0, sub_100040650);
  swift_beginAccess(&static OS_os_log.crlChangeShape, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000407E8()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCloudQuotaMessagingCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCloudQuotaMessagingCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudQuotaMessagingCat_log_t, &CRLCloudQuotaMessagingCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlCloudQuotaMessaging = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudQuotaMessaging.unsafeMutableAddressor()
{
  if (qword_10006C6C8 != -1)
    swift_once(&qword_10006C6C8, sub_1000407E8);
  return &static OS_os_log.crlCloudQuotaMessaging;
}

id static OS_os_log.crlCloudQuotaMessaging.getter()
{
  return sub_1000435C0(&qword_10006C6C8, (id *)&static OS_os_log.crlCloudQuotaMessaging);
}

void static OS_os_log.crlCloudQuotaMessaging.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6C8, (void **)&static OS_os_log.crlCloudQuotaMessaging, (uint64_t)sub_1000407E8);
}

uint64_t (*static OS_os_log.crlCloudQuotaMessaging.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6C8 != -1)
    swift_once(&qword_10006C6C8, sub_1000407E8);
  swift_beginAccess(&static OS_os_log.crlCloudQuotaMessaging, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040980()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRL3DBreakthroughCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRL3DBreakthroughCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRL3DBreakthroughCat_log_t, &CRL3DBreakthroughCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crl3DBreakthrough = (uint64_t)v1;
}

uint64_t *OS_os_log.crl3DBreakthrough.unsafeMutableAddressor()
{
  if (qword_10006C6D0 != -1)
    swift_once(&qword_10006C6D0, sub_100040980);
  return &static OS_os_log.crl3DBreakthrough;
}

id static OS_os_log.crl3DBreakthrough.getter()
{
  return sub_1000435C0(&qword_10006C6D0, (id *)&static OS_os_log.crl3DBreakthrough);
}

void static OS_os_log.crl3DBreakthrough.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6D0, (void **)&static OS_os_log.crl3DBreakthrough, (uint64_t)sub_100040980);
}

uint64_t (*static OS_os_log.crl3DBreakthrough.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6D0 != -1)
    swift_once(&qword_10006C6D0, sub_100040980);
  swift_beginAccess(&static OS_os_log.crl3DBreakthrough, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040B18()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLLayerAnimationCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLLayerAnimationCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLLayerAnimationCat_log_t, &CRLLayerAnimationCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlLayerAnimation = (uint64_t)v1;
}

uint64_t *OS_os_log.crlLayerAnimation.unsafeMutableAddressor()
{
  if (qword_10006C6D8 != -1)
    swift_once(&qword_10006C6D8, sub_100040B18);
  return &static OS_os_log.crlLayerAnimation;
}

id static OS_os_log.crlLayerAnimation.getter()
{
  return sub_1000435C0(&qword_10006C6D8, (id *)&static OS_os_log.crlLayerAnimation);
}

void static OS_os_log.crlLayerAnimation.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6D8, (void **)&static OS_os_log.crlLayerAnimation, (uint64_t)sub_100040B18);
}

uint64_t (*static OS_os_log.crlLayerAnimation.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6D8 != -1)
    swift_once(&qword_10006C6D8, sub_100040B18);
  swift_beginAccess(&static OS_os_log.crlLayerAnimation, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040CB0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAnimationImplCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAnimationImplCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnimationImplCat_log_t, &CRLAnimationImplCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlAnimationImpl = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnimationImpl.unsafeMutableAddressor()
{
  if (qword_10006C6E0 != -1)
    swift_once(&qword_10006C6E0, sub_100040CB0);
  return &static OS_os_log.crlAnimationImpl;
}

id static OS_os_log.crlAnimationImpl.getter()
{
  return sub_1000435C0(&qword_10006C6E0, (id *)&static OS_os_log.crlAnimationImpl);
}

void static OS_os_log.crlAnimationImpl.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6E0, (void **)&static OS_os_log.crlAnimationImpl, (uint64_t)sub_100040CB0);
}

uint64_t (*static OS_os_log.crlAnimationImpl.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6E0 != -1)
    swift_once(&qword_10006C6E0, sub_100040CB0);
  swift_beginAccess(&static OS_os_log.crlAnimationImpl, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040E48()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLMiniFormatterCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLMiniFormatterCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLMiniFormatterCat_log_t, &CRLMiniFormatterCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.crlMiniFormatter = (uint64_t)v1;
}

uint64_t *OS_os_log.crlMiniFormatter.unsafeMutableAddressor()
{
  if (qword_10006C6E8 != -1)
    swift_once(&qword_10006C6E8, sub_100040E48);
  return &static OS_os_log.crlMiniFormatter;
}

id static OS_os_log.crlMiniFormatter.getter()
{
  return sub_1000435C0(&qword_10006C6E8, (id *)&static OS_os_log.crlMiniFormatter);
}

void static OS_os_log.crlMiniFormatter.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6E8, (void **)&static OS_os_log.crlMiniFormatter, (uint64_t)sub_100040E48);
}

uint64_t (*static OS_os_log.crlMiniFormatter.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6E8 != -1)
    swift_once(&qword_10006C6E8, sub_100040E48);
  swift_beginAccess(&static OS_os_log.crlMiniFormatter, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100040FE0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSceneManagementCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSceneManagementCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSceneManagementCat_log_t, &CRLSceneManagementCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.sceneManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.sceneManagement.unsafeMutableAddressor()
{
  if (qword_10006C6F0 != -1)
    swift_once(&qword_10006C6F0, sub_100040FE0);
  return &static OS_os_log.sceneManagement;
}

id static OS_os_log.sceneManagement.getter()
{
  return sub_1000435C0(&qword_10006C6F0, (id *)&static OS_os_log.sceneManagement);
}

void static OS_os_log.sceneManagement.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6F0, (void **)&static OS_os_log.sceneManagement, (uint64_t)sub_100040FE0);
}

uint64_t (*static OS_os_log.sceneManagement.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6F0 != -1)
    swift_once(&qword_10006C6F0, sub_100040FE0);
  swift_beginAccess(&static OS_os_log.sceneManagement, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100041180()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCompositionCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCompositionCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCompositionCat_log_t, &CRLCompositionCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.composition = (uint64_t)v1;
}

uint64_t *OS_os_log.composition.unsafeMutableAddressor()
{
  if (qword_10006C6F8 != -1)
    swift_once(&qword_10006C6F8, sub_100041180);
  return &static OS_os_log.composition;
}

id static OS_os_log.composition.getter()
{
  return sub_1000435C0(&qword_10006C6F8, (id *)&static OS_os_log.composition);
}

void static OS_os_log.composition.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C6F8, (void **)&static OS_os_log.composition, (uint64_t)sub_100041180);
}

uint64_t (*static OS_os_log.composition.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C6F8 != -1)
    swift_once(&qword_10006C6F8, sub_100041180);
  swift_beginAccess(&static OS_os_log.composition, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10004131C()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLViewControllerCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLViewControllerCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLViewControllerCat_log_t, &CRLViewControllerCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.CRLViewController = (uint64_t)v1;
}

uint64_t *OS_os_log.CRLViewController.unsafeMutableAddressor()
{
  if (qword_10006C700 != -1)
    swift_once(&qword_10006C700, sub_10004131C);
  return &static OS_os_log.CRLViewController;
}

id static OS_os_log.CRLViewController.getter()
{
  return sub_1000435C0(&qword_10006C700, (id *)&static OS_os_log.CRLViewController);
}

void static OS_os_log.CRLViewController.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C700, (void **)&static OS_os_log.CRLViewController, (uint64_t)sub_10004131C);
}

uint64_t (*static OS_os_log.CRLViewController.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C700 != -1)
    swift_once(&qword_10006C700, sub_10004131C);
  swift_beginAccess(&static OS_os_log.CRLViewController, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000414B4()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAppIntentsCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAppIntentsCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppIntentsCat_log_t, &CRLAppIntentsCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.appIntents = (uint64_t)v1;
}

uint64_t *OS_os_log.appIntents.unsafeMutableAddressor()
{
  if (qword_10006C708 != -1)
    swift_once(&qword_10006C708, sub_1000414B4);
  return &static OS_os_log.appIntents;
}

id static OS_os_log.appIntents.getter()
{
  return sub_1000435C0(&qword_10006C708, (id *)&static OS_os_log.appIntents);
}

void static OS_os_log.appIntents.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C708, (void **)&static OS_os_log.appIntents, (uint64_t)sub_1000414B4);
}

uint64_t (*static OS_os_log.appIntents.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C708 != -1)
    swift_once(&qword_10006C708, sub_1000414B4);
  swift_beginAccess(&static OS_os_log.appIntents, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10004164C()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAppStateCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAppStateCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppStateCat_log_t, &CRLAppStateCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.appState = (uint64_t)v1;
}

uint64_t *OS_os_log.appState.unsafeMutableAddressor()
{
  if (qword_10006C710 != -1)
    swift_once(&qword_10006C710, sub_10004164C);
  return &static OS_os_log.appState;
}

id static OS_os_log.appState.getter()
{
  return sub_1000435C0(&qword_10006C710, (id *)&static OS_os_log.appState);
}

void static OS_os_log.appState.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C710, (void **)&static OS_os_log.appState, (uint64_t)sub_10004164C);
}

uint64_t (*static OS_os_log.appState.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C710 != -1)
    swift_once(&qword_10006C710, sub_10004164C);
  swift_beginAccess(&static OS_os_log.appState, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000417E0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLInteractionCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLInteractionCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLInteractionCat_log_t, &CRLInteractionCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.interaction = (uint64_t)v1;
}

uint64_t *OS_os_log.interaction.unsafeMutableAddressor()
{
  if (qword_10006C718 != -1)
    swift_once(&qword_10006C718, sub_1000417E0);
  return &static OS_os_log.interaction;
}

id static OS_os_log.interaction.getter()
{
  return sub_1000435C0(&qword_10006C718, (id *)&static OS_os_log.interaction);
}

void static OS_os_log.interaction.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C718, (void **)&static OS_os_log.interaction, (uint64_t)sub_1000417E0);
}

uint64_t (*static OS_os_log.interaction.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C718 != -1)
    swift_once(&qword_10006C718, sub_1000417E0);
  swift_beginAccess(&static OS_os_log.interaction, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10004197C()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLContentStateCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLContentStateCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLContentStateCat_log_t, &CRLContentStateCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.contentState = (uint64_t)v1;
}

uint64_t *OS_os_log.contentState.unsafeMutableAddressor()
{
  if (qword_10006C720 != -1)
    swift_once(&qword_10006C720, sub_10004197C);
  return &static OS_os_log.contentState;
}

id static OS_os_log.contentState.getter()
{
  return sub_1000435C0(&qword_10006C720, (id *)&static OS_os_log.contentState);
}

void static OS_os_log.contentState.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C720, (void **)&static OS_os_log.contentState, (uint64_t)sub_10004197C);
}

uint64_t (*static OS_os_log.contentState.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C720 != -1)
    swift_once(&qword_10006C720, sub_10004197C);
  swift_beginAccess(&static OS_os_log.contentState, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100041B18()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLBoardDataStoreCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLBoardDataStoreCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardDataStoreCat_log_t, &CRLBoardDataStoreCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.boardStore = (uint64_t)v1;
}

uint64_t *OS_os_log.boardStore.unsafeMutableAddressor()
{
  if (qword_10006C728 != -1)
    swift_once(&qword_10006C728, sub_100041B18);
  return &static OS_os_log.boardStore;
}

id static OS_os_log.boardStore.getter()
{
  return sub_1000435C0(&qword_10006C728, (id *)&static OS_os_log.boardStore);
}

void static OS_os_log.boardStore.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C728, (void **)&static OS_os_log.boardStore, (uint64_t)sub_100041B18);
}

uint64_t (*static OS_os_log.boardStore.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C728 != -1)
    swift_once(&qword_10006C728, sub_100041B18);
  swift_beginAccess(&static OS_os_log.boardStore, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100041CB0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLFileProviderStoreCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLFileProviderStoreCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLFileProviderStoreCat_log_t, &CRLFileProviderStoreCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.fileProviderStore = (uint64_t)v1;
}

uint64_t *OS_os_log.fileProviderStore.unsafeMutableAddressor()
{
  if (qword_10006C730 != -1)
    swift_once(&qword_10006C730, sub_100041CB0);
  return &static OS_os_log.fileProviderStore;
}

id static OS_os_log.fileProviderStore.getter()
{
  return sub_1000435C0(&qword_10006C730, (id *)&static OS_os_log.fileProviderStore);
}

void static OS_os_log.fileProviderStore.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C730, (void **)&static OS_os_log.fileProviderStore, (uint64_t)sub_100041CB0);
}

uint64_t (*static OS_os_log.fileProviderStore.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C730 != -1)
    swift_once(&qword_10006C730, sub_100041CB0);
  swift_beginAccess(&static OS_os_log.fileProviderStore, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100041E48()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLPersistenceCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLPersistenceCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLPersistenceCat_log_t, &CRLPersistenceCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.persistence = (uint64_t)v1;
}

uint64_t *OS_os_log.persistence.unsafeMutableAddressor()
{
  if (qword_10006C738 != -1)
    swift_once(&qword_10006C738, sub_100041E48);
  return &static OS_os_log.persistence;
}

id static OS_os_log.persistence.getter()
{
  return sub_1000435C0(&qword_10006C738, (id *)&static OS_os_log.persistence);
}

void static OS_os_log.persistence.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C738, (void **)&static OS_os_log.persistence, (uint64_t)sub_100041E48);
}

uint64_t (*static OS_os_log.persistence.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C738 != -1)
    swift_once(&qword_10006C738, sub_100041E48);
  swift_beginAccess(&static OS_os_log.persistence, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100041FE4()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLDataSyncCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLDataSyncCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataSyncCat_log_t, &CRLDataSyncCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.dataSync = (uint64_t)v1;
}

uint64_t *OS_os_log.dataSync.unsafeMutableAddressor()
{
  if (qword_10006C740 != -1)
    swift_once(&qword_10006C740, sub_100041FE4);
  return &static OS_os_log.dataSync;
}

id static OS_os_log.dataSync.getter()
{
  return sub_1000435C0(&qword_10006C740, (id *)&static OS_os_log.dataSync);
}

void static OS_os_log.dataSync.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C740, (void **)&static OS_os_log.dataSync, (uint64_t)sub_100041FE4);
}

uint64_t (*static OS_os_log.dataSync.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C740 != -1)
    swift_once(&qword_10006C740, sub_100041FE4);
  swift_beginAccess(&static OS_os_log.dataSync, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042178()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCommandControllerCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCommandControllerCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCommandControllerCat_log_t, &CRLCommandControllerCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.commandController = (uint64_t)v1;
}

uint64_t *OS_os_log.commandController.unsafeMutableAddressor()
{
  if (qword_10006C748 != -1)
    swift_once(&qword_10006C748, sub_100042178);
  return &static OS_os_log.commandController;
}

id static OS_os_log.commandController.getter()
{
  return sub_1000435C0(&qword_10006C748, (id *)&static OS_os_log.commandController);
}

void static OS_os_log.commandController.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C748, (void **)&static OS_os_log.commandController, (uint64_t)sub_100042178);
}

uint64_t (*static OS_os_log.commandController.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C748 != -1)
    swift_once(&qword_10006C748, sub_100042178);
  swift_beginAccess(&static OS_os_log.commandController, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042310()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSuspendResumeCollaborationCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSuspendResumeCollaborationCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSuspendResumeCollaborationCat_log_t, &CRLSuspendResumeCollaborationCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.suspendResumeCollaboration = (uint64_t)v1;
}

uint64_t *OS_os_log.suspendResumeCollaboration.unsafeMutableAddressor()
{
  if (qword_10006C750 != -1)
    swift_once(&qword_10006C750, sub_100042310);
  return &static OS_os_log.suspendResumeCollaboration;
}

id static OS_os_log.suspendResumeCollaboration.getter()
{
  return sub_1000435C0(&qword_10006C750, (id *)&static OS_os_log.suspendResumeCollaboration);
}

void static OS_os_log.suspendResumeCollaboration.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C750, (void **)&static OS_os_log.suspendResumeCollaboration, (uint64_t)sub_100042310);
}

uint64_t (*static OS_os_log.suspendResumeCollaboration.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C750 != -1)
    swift_once(&qword_10006C750, sub_100042310);
  swift_beginAccess(&static OS_os_log.suspendResumeCollaboration, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000424A8()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLCarmelRealTimeSyncCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLCarmelRealTimeSyncCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeSyncCat_log_t, &CRLCarmelRealTimeSyncCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.realTimeSync = (uint64_t)v1;
}

uint64_t *OS_os_log.realTimeSync.unsafeMutableAddressor()
{
  if (qword_10006C758 != -1)
    swift_once(&qword_10006C758, sub_1000424A8);
  return &static OS_os_log.realTimeSync;
}

id static OS_os_log.realTimeSync.getter()
{
  return sub_1000435C0(&qword_10006C758, (id *)&static OS_os_log.realTimeSync);
}

void static OS_os_log.realTimeSync.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C758, (void **)&static OS_os_log.realTimeSync, (uint64_t)sub_1000424A8);
}

uint64_t (*static OS_os_log.realTimeSync.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C758 != -1)
    swift_once(&qword_10006C758, sub_1000424A8);
  swift_beginAccess(&static OS_os_log.realTimeSync, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042640()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLKeyboardInputCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLKeyboardInputCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardInputCat_log_t, &CRLKeyboardInputCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.keyboardInput = (uint64_t)v1;
}

uint64_t *OS_os_log.keyboardInput.unsafeMutableAddressor()
{
  if (qword_10006C760 != -1)
    swift_once(&qword_10006C760, sub_100042640);
  return &static OS_os_log.keyboardInput;
}

id static OS_os_log.keyboardInput.getter()
{
  return sub_1000435C0(&qword_10006C760, (id *)&static OS_os_log.keyboardInput);
}

void static OS_os_log.keyboardInput.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C760, (void **)&static OS_os_log.keyboardInput, (uint64_t)sub_100042640);
}

uint64_t (*static OS_os_log.keyboardInput.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C760 != -1)
    swift_once(&qword_10006C760, sub_100042640);
  swift_beginAccess(&static OS_os_log.keyboardInput, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000427E0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLTargetGestureCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLTargetGestureCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLTargetGestureCat_log_t, &CRLTargetGestureCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.target_gesture = (uint64_t)v1;
}

uint64_t *OS_os_log.target_gesture.unsafeMutableAddressor()
{
  if (qword_10006C768 != -1)
    swift_once(&qword_10006C768, sub_1000427E0);
  return &static OS_os_log.target_gesture;
}

id static OS_os_log.target_gesture.getter()
{
  return sub_1000435C0(&qword_10006C768, (id *)&static OS_os_log.target_gesture);
}

void static OS_os_log.target_gesture.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C768, (void **)&static OS_os_log.target_gesture, (uint64_t)sub_1000427E0);
}

uint64_t (*static OS_os_log.target_gesture.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C768 != -1)
    swift_once(&qword_10006C768, sub_1000427E0);
  swift_beginAccess(&static OS_os_log.target_gesture, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042980()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLDataStoreUpgradeCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLDataStoreUpgradeCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataStoreUpgradeCat_log_t, &CRLDataStoreUpgradeCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.upgrade = (uint64_t)v1;
}

uint64_t *OS_os_log.upgrade.unsafeMutableAddressor()
{
  if (qword_10006C770 != -1)
    swift_once(&qword_10006C770, sub_100042980);
  return &static OS_os_log.upgrade;
}

id static OS_os_log.upgrade.getter()
{
  return sub_1000435C0(&qword_10006C770, (id *)&static OS_os_log.upgrade);
}

void static OS_os_log.upgrade.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C770, (void **)&static OS_os_log.upgrade, (uint64_t)sub_100042980);
}

uint64_t (*static OS_os_log.upgrade.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C770 != -1)
    swift_once(&qword_10006C770, sub_100042980);
  swift_beginAccess(&static OS_os_log.upgrade, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042B18()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLPasteboardCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLPasteboardCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLPasteboardCat_log_t, &CRLPasteboardCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.pasteboard = (uint64_t)v1;
}

uint64_t *OS_os_log.pasteboard.unsafeMutableAddressor()
{
  if (qword_10006C778 != -1)
    swift_once(&qword_10006C778, sub_100042B18);
  return &static OS_os_log.pasteboard;
}

id static OS_os_log.pasteboard.getter()
{
  return sub_1000435C0(&qword_10006C778, (id *)&static OS_os_log.pasteboard);
}

void static OS_os_log.pasteboard.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C778, (void **)&static OS_os_log.pasteboard, (uint64_t)sub_100042B18);
}

uint64_t (*static OS_os_log.pasteboard.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C778 != -1)
    swift_once(&qword_10006C778, sub_100042B18);
  swift_beginAccess(&static OS_os_log.pasteboard, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042CB0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLBoardItemDataSizeCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLBoardItemDataSizeCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemDataSizeCat_log_t, &CRLBoardItemDataSizeCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.boardItemDataSize = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemDataSize.unsafeMutableAddressor()
{
  if (qword_10006C780 != -1)
    swift_once(&qword_10006C780, sub_100042CB0);
  return &static OS_os_log.boardItemDataSize;
}

id static OS_os_log.boardItemDataSize.getter()
{
  return sub_1000435C0(&qword_10006C780, (id *)&static OS_os_log.boardItemDataSize);
}

void static OS_os_log.boardItemDataSize.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C780, (void **)&static OS_os_log.boardItemDataSize, (uint64_t)sub_100042CB0);
}

uint64_t (*static OS_os_log.boardItemDataSize.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C780 != -1)
    swift_once(&qword_10006C780, sub_100042CB0);
  swift_beginAccess(&static OS_os_log.boardItemDataSize, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042E48()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLBoardItemLifecycleCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLBoardItemLifecycleCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemLifecycleCat_log_t, &CRLBoardItemLifecycleCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.boardItemLifecycle = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemLifecycle.unsafeMutableAddressor()
{
  if (qword_10006C788 != -1)
    swift_once(&qword_10006C788, sub_100042E48);
  return &static OS_os_log.boardItemLifecycle;
}

id static OS_os_log.boardItemLifecycle.getter()
{
  return sub_1000435C0(&qword_10006C788, (id *)&static OS_os_log.boardItemLifecycle);
}

void static OS_os_log.boardItemLifecycle.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C788, (void **)&static OS_os_log.boardItemLifecycle, (uint64_t)sub_100042E48);
}

uint64_t (*static OS_os_log.boardItemLifecycle.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C788 != -1)
    swift_once(&qword_10006C788, sub_100042E48);
  swift_beginAccess(&static OS_os_log.boardItemLifecycle, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100042FE0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLAssetManagementCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLAssetManagementCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetManagementCat_log_t, &CRLAssetManagementCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.assetManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.assetManagement.unsafeMutableAddressor()
{
  if (qword_10006C790 != -1)
    swift_once(&qword_10006C790, sub_100042FE0);
  return &static OS_os_log.assetManagement;
}

id static OS_os_log.assetManagement.getter()
{
  return sub_1000435C0(&qword_10006C790, (id *)&static OS_os_log.assetManagement);
}

void static OS_os_log.assetManagement.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C790, (void **)&static OS_os_log.assetManagement, (uint64_t)sub_100042FE0);
}

uint64_t (*static OS_os_log.assetManagement.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C790 != -1)
    swift_once(&qword_10006C790, sub_100042FE0);
  swift_beginAccess(&static OS_os_log.assetManagement, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100043180()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLShareStateCat_log_t, v3, 33, 0);
  swift_beginAccess(&CRLShareStateCat_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLShareStateCat_log_t, &CRLShareStateCat_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.shareState = (uint64_t)v1;
}

uint64_t *OS_os_log.shareState.unsafeMutableAddressor()
{
  if (qword_10006C798 != -1)
    swift_once(&qword_10006C798, sub_100043180);
  return &static OS_os_log.shareState;
}

id static OS_os_log.shareState.getter()
{
  return sub_1000435C0(&qword_10006C798, (id *)&static OS_os_log.shareState);
}

void static OS_os_log.shareState.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C798, (void **)&static OS_os_log.shareState, (uint64_t)sub_100043180);
}

uint64_t (*static OS_os_log.shareState.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C798 != -1)
    swift_once(&qword_10006C798, sub_100043180);
  swift_beginAccess(&static OS_os_log.shareState, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_100043318()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLDrawingDataDetectors_log_t, v3, 33, 0);
  swift_beginAccess(&CRLDrawingDataDetectors_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLDrawingDataDetectors_log_t, &CRLDrawingDataDetectors_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.DrawingDataDetectors = (uint64_t)v1;
}

uint64_t *OS_os_log.DrawingDataDetectors.unsafeMutableAddressor()
{
  if (qword_10006C7A0 != -1)
    swift_once(&qword_10006C7A0, sub_100043318);
  return &static OS_os_log.DrawingDataDetectors;
}

id static OS_os_log.DrawingDataDetectors.getter()
{
  return sub_1000435C0(&qword_10006C7A0, (id *)&static OS_os_log.DrawingDataDetectors);
}

void static OS_os_log.DrawingDataDetectors.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C7A0, (void **)&static OS_os_log.DrawingDataDetectors, (uint64_t)sub_100043318);
}

uint64_t (*static OS_os_log.DrawingDataDetectors.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C7A0 != -1)
    swift_once(&qword_10006C7A0, sub_100043318);
  swift_beginAccess(&static OS_os_log.DrawingDataDetectors, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_1000434B0()
{
  NSString v0;
  id v1;
  _BYTE v2[24];
  _BYTE v3[24];

  swift_beginAccess(&CRLSideStore_log_t, v3, 33, 0);
  swift_beginAccess(&CRLSideStore_init_token, v2, 33, 0);
  v0 = String._bridgeToObjectiveC()();
  v1 = CRLLogEnsureCreated(v0, (id *)&CRLSideStore_log_t, &CRLSideStore_init_token);
  swift_endAccess(v2);
  swift_endAccess(v3);

  static OS_os_log.sideStore = (uint64_t)v1;
}

uint64_t *OS_os_log.sideStore.unsafeMutableAddressor()
{
  if (qword_10006C7A8 != -1)
    swift_once(&qword_10006C7A8, sub_1000434B0);
  return &static OS_os_log.sideStore;
}

id static OS_os_log.sideStore.getter()
{
  return sub_1000435C0(&qword_10006C7A8, (id *)&static OS_os_log.sideStore);
}

id sub_1000435C0(_QWORD *a1, id *a2)
{
  _BYTE v4[24];

  if (*a1 != -1)
    swift_once();
  swift_beginAccess(a2, v4, 0, 0);
  return *a2;
}

void static OS_os_log.sideStore.setter(void *a1)
{
  sub_100043630(a1, &qword_10006C7A8, (void **)&static OS_os_log.sideStore, (uint64_t)sub_1000434B0);
}

void sub_100043630(void *a1, _QWORD *a2, void **a3, uint64_t a4)
{
  void *v6;
  _BYTE v7[24];

  if (*a2 != -1)
    swift_once(a2, a4);
  swift_beginAccess(a3, v7, 1, 0);
  v6 = *a3;
  *a3 = a1;

}

uint64_t (*static OS_os_log.sideStore.modify(uint64_t a1))(_QWORD)
{
  if (qword_10006C7A8 != -1)
    swift_once(&qword_10006C7A8, sub_1000434B0);
  swift_beginAccess(&static OS_os_log.sideStore, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100043700(uint64_t a1, const mach_header_64 *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const mach_header_64 *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  switch(*(_QWORD *)(a7 + 16))
  {
    case 0:
      v14 = a4;
      v15 = a5;
      v16 = a6;
      v17 = a2;
      goto LABEL_4;
    case 1:
      v19 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v19, 72, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052780;
      v21 = v20 + 32;
      v22 = a7 + 32;
      goto LABEL_25;
    case 2:
      v23 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v23, 112, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052750;
      sub_1000444E8(a7 + 32, v20 + 32);
      v21 = v20 + 72;
      v22 = a7 + 72;
      goto LABEL_25;
    case 3:
      v24 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v24, 152, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053070;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      v21 = v20 + 112;
      v22 = a7 + 112;
      goto LABEL_25;
    case 4:
      v25 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v25, 192, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053060;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      v21 = v20 + 152;
      v22 = a7 + 152;
      goto LABEL_25;
    case 5:
      v26 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v26, 232, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053050;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      v21 = v20 + 192;
      v22 = a7 + 192;
      goto LABEL_25;
    case 6:
      v27 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v27, 272, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053040;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      v21 = v20 + 232;
      v22 = a7 + 232;
      goto LABEL_25;
    case 7:
      v28 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v28, 312, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053030;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      v21 = v20 + 272;
      v22 = a7 + 272;
      goto LABEL_25;
    case 8:
      v29 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v29, 352, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053020;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      v21 = v20 + 312;
      v22 = a7 + 312;
      goto LABEL_25;
    case 9:
      v30 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v30, 392, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053010;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      v21 = v20 + 352;
      v22 = a7 + 352;
      goto LABEL_25;
    case 0xALL:
      v31 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v31, 432, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100053000;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      v21 = v20 + 392;
      v22 = a7 + 392;
      goto LABEL_25;
    case 0xBLL:
      v32 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v32, 472, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052FF0;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      v21 = v20 + 432;
      v22 = a7 + 432;
      goto LABEL_25;
    case 0xCLL:
      v33 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v33, 512, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052FE0;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      v21 = v20 + 472;
      v22 = a7 + 472;
      goto LABEL_25;
    case 0xDLL:
      v34 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v34, 552, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052FD0;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      v21 = v20 + 512;
      v22 = a7 + 512;
      goto LABEL_25;
    case 0xELL:
      v35 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v35, 592, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052FC0;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      v21 = v20 + 552;
      v22 = a7 + 552;
      goto LABEL_25;
    case 0xFLL:
      v36 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v36, 632, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052FB0;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      sub_1000444E8(a7 + 552, v20 + 552);
      v21 = v20 + 592;
      v22 = a7 + 592;
      goto LABEL_25;
    case 0x10:
      v37 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v37, 672, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052FA0;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      sub_1000444E8(a7 + 552, v20 + 552);
      sub_1000444E8(a7 + 592, v20 + 592);
      v21 = v20 + 632;
      v22 = a7 + 632;
      goto LABEL_25;
    case 0x11:
      v38 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v38, 712, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052F90;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      sub_1000444E8(a7 + 552, v20 + 552);
      sub_1000444E8(a7 + 592, v20 + 592);
      sub_1000444E8(a7 + 632, v20 + 632);
      v21 = v20 + 672;
      v22 = a7 + 672;
      goto LABEL_25;
    case 0x12:
      v39 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v39, 752, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052F80;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      sub_1000444E8(a7 + 552, v20 + 552);
      sub_1000444E8(a7 + 592, v20 + 592);
      sub_1000444E8(a7 + 632, v20 + 632);
      sub_1000444E8(a7 + 672, v20 + 672);
      v21 = v20 + 712;
      v22 = a7 + 712;
      goto LABEL_25;
    case 0x13:
      v40 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v40, 792, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052F70;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      sub_1000444E8(a7 + 552, v20 + 552);
      sub_1000444E8(a7 + 592, v20 + 592);
      sub_1000444E8(a7 + 632, v20 + 632);
      sub_1000444E8(a7 + 672, v20 + 672);
      sub_1000444E8(a7 + 712, v20 + 712);
      v21 = v20 + 752;
      v22 = a7 + 752;
      goto LABEL_25;
    case 0x14:
      v41 = sub_100011254((uint64_t *)&unk_10006D060);
      v20 = swift_allocObject(v41, 832, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100052F60;
      sub_1000444E8(a7 + 32, v20 + 32);
      sub_1000444E8(a7 + 72, v20 + 72);
      sub_1000444E8(a7 + 112, v20 + 112);
      sub_1000444E8(a7 + 152, v20 + 152);
      sub_1000444E8(a7 + 192, v20 + 192);
      sub_1000444E8(a7 + 232, v20 + 232);
      sub_1000444E8(a7 + 272, v20 + 272);
      sub_1000444E8(a7 + 312, v20 + 312);
      sub_1000444E8(a7 + 352, v20 + 352);
      sub_1000444E8(a7 + 392, v20 + 392);
      sub_1000444E8(a7 + 432, v20 + 432);
      sub_1000444E8(a7 + 472, v20 + 472);
      sub_1000444E8(a7 + 512, v20 + 512);
      sub_1000444E8(a7 + 552, v20 + 552);
      sub_1000444E8(a7 + 592, v20 + 592);
      sub_1000444E8(a7 + 632, v20 + 632);
      sub_1000444E8(a7 + 672, v20 + 672);
      sub_1000444E8(a7 + 712, v20 + 712);
      sub_1000444E8(a7 + 752, v20 + 752);
      v21 = v20 + 792;
      v22 = a7 + 792;
LABEL_25:
      sub_1000444E8(v22, v21);
      os_log(_:dso:log:type:_:)(a4, a5, a6, a2, a1, a3, v20);
      result = swift_bridgeObjectRelease(v20);
      break;
    default:
      v14 = ">>ERROR: TOO MANY os_log() ARGUMENTS. MAXIMUM IS 20. See CRLLogHelper.swift<<";
      v17 = &_mh_execute_header;
      v15 = 77;
      v16 = 2;
LABEL_4:
      result = os_log(_:dso:log:type:_:)(v14, v15, v16, v17, a1, a3, _swiftEmptyArrayStorage);
      break;
  }
  return result;
}

uint64_t sub_1000444E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100044530(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;

  v2 = *(_QWORD *)(result + 16);
  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  result = sub_100045968(result, v14, 1, v3, &qword_10006D9D0, type metadata accessor for CRLSELibraryViewModeItemNode);
  v3 = (_QWORD *)result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = v3[2];
  v8 = (v3[3] >> 1) - v7;
  result = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  if (v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v9 = *(_QWORD *)(result - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  result = swift_arrayInitWithCopy((char *)v3 + v10 + *(_QWORD *)(v9 + 72) * v7, v6 + v10, v2, result);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100044640(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native(*v1);
  v7 = result;
  *v1 = v3;
  if ((_DWORD)result)
  {
    v8 = *(_QWORD *)(v3 + 24) >> 1;
    if (v8 >= v5)
    {
      if (*(_QWORD *)(v6 + 16))
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  if (v4 <= v5)
    v4 += v2;
  swift_bridgeObjectRetain(v3);
  v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v7, v4, 1, v3);
  result = swift_bridgeObjectRelease(*v1);
  *v1 = v3;
  v8 = *(_QWORD *)(v3 + 24) >> 1;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_12:
    if (!v2)
      goto LABEL_13;
    goto LABEL_15;
  }
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  if (v8 - v9 < v2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = v3 + 8 * v9 + 32;
  v11 = sub_100011254((uint64_t *)&unk_10006D860);
  result = swift_arrayInitWithCopy(v10, v6 + 32, v2, v11);
  if (!v2)
  {
LABEL_13:
    v15 = swift_bridgeObjectRelease(v6);
    return specialized Array._endMutation()(v15);
  }
  v12 = *(_QWORD *)(*v1 + 16);
  v13 = __OFADD__(v12, v2);
  v14 = v12 + v2;
  if (!v13)
  {
    *(_QWORD *)(*v1 + 16) = v14;
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_10004476C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10004B248(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_100044924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int (*v57)(char *, uint64_t, uint64_t);
  char v58[24];
  char v59[24];
  char v60[32];

  v52 = a1;
  v2 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v56 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v55 = (uint64_t)&v46 - v6;
  v7 = sub_100011254(&qword_10006D030);
  v50 = *(_QWORD *)(v7 - 8);
  v51 = v7;
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v46 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v46 - v14;
  v16 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v46 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v46 - v23;
  v53 = v1;
  v25 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  swift_beginAccess(v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode, v60, 0, 0);
  sub_10004580C(v25, (uint64_t)v15);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v26(v15, 1, v2))
  {
    sub_100019B80((uint64_t)v15, &qword_10006D030);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v52, 1, 1, v2);
  }
  else
  {
    v57 = v26;
    v54 = v3;
    sub_1000191EC((uint64_t)v15, (uint64_t)v22, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_100019B80((uint64_t)v15, &qword_10006D030);
    sub_100017A6C((uint64_t)v22, (uint64_t)v24, type metadata accessor for CRLSELibraryViewModel.Item);
    v48 = v24;
    v49 = v19;
    sub_1000191EC((uint64_t)v24, (uint64_t)v19, type metadata accessor for CRLSELibraryViewModel.Item);
    v28 = sub_100011254(&qword_10006D9E0);
    v29 = *(_QWORD *)(v50 + 72);
    v30 = *(unsigned __int8 *)(v50 + 80);
    v31 = (v30 + 32) & ~v30;
    v32 = swift_allocObject(v28, v31 + 4 * v29, v30 | 7);
    *(_OWORD *)(v32 + 16) = xmmword_100053060;
    v50 = v32;
    v33 = v32 + v31;
    v34 = v53;
    v35 = v53 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
    swift_beginAccess(v53 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, v59, 0, 0);
    sub_10004580C(v35, v33);
    v36 = v34 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
    swift_beginAccess(v34 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents, v58, 0, 0);
    sub_10004580C(v36, v33 + v29);
    sub_100044E68(v33 + 2 * v29);
    sub_1000450F8(v33 + 3 * v29);
    v37 = _swiftEmptyArrayStorage;
    v38 = 4;
    v47 = v33;
    v39 = v33;
    v53 = v2;
    v40 = v56;
    do
    {
      sub_10004580C(v39, (uint64_t)v13);
      sub_100031D00((uint64_t)v13, (uint64_t)v10, &qword_10006D030);
      if (v57(v10, 1, v2) == 1)
      {
        sub_100019B80((uint64_t)v10, &qword_10006D030);
      }
      else
      {
        v41 = v55;
        sub_100017A6C((uint64_t)v10, v55, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_100017A6C(v41, v40, type metadata accessor for CRLSELibraryViewModeItemNode);
        if ((swift_isUniquelyReferenced_nonNull_native(v37) & 1) == 0)
          v37 = (_QWORD *)sub_100045968(0, v37[2] + 1, 1, v37, &qword_10006D9D0, type metadata accessor for CRLSELibraryViewModeItemNode);
        v43 = v37[2];
        v42 = v37[3];
        if (v43 >= v42 >> 1)
          v37 = (_QWORD *)sub_100045968(v42 > 1, v43 + 1, 1, v37, &qword_10006D9D0, type metadata accessor for CRLSELibraryViewModeItemNode);
        v37[2] = v43 + 1;
        v40 = v56;
        sub_100017A6C(v56, (uint64_t)v37+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(_QWORD *)(v54 + 72) * v43, type metadata accessor for CRLSELibraryViewModeItemNode);
        v2 = v53;
      }
      v39 += v29;
      --v38;
    }
    while (v38);
    v44 = v50;
    swift_setDeallocating(v50);
    swift_arrayDestroy(v47, *(_QWORD *)(v44 + 16), v51);
    swift_deallocClassInstance(v44, 32, 7);
    sub_100013BBC((uint64_t)v48, type metadata accessor for CRLSELibraryViewModel.Item);
    v45 = v52;
    sub_100017A6C((uint64_t)v49, v52, type metadata accessor for CRLSELibraryViewModel.Item);
    *(_QWORD *)(v45 + *(int *)(v2 + 20)) = v37;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v45, 0, 1, v2);
  }
}

void *sub_100044DE0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, a1, 33, 0);
  return &j_j__swift_endAccess;
}

void *sub_100044E24(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_100044E68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[24];

  v3 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100011254(&qword_10006D030);
  __chkstk_darwin(v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  swift_beginAccess(v13, v25, 0, 0);
  sub_10004580C(v13, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    sub_100019B80((uint64_t)v12, &qword_10006D030);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  else
  {
    v15 = *(_QWORD *)&v12[*(int *)(v6 + 20)];
    swift_bridgeObjectRetain(v15);
    sub_100019B80((uint64_t)v12, &qword_10006D030);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v23 = v15;
      v24 = a1;
      v17 = v15 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      v18 = *(_QWORD *)(v7 + 72);
      swift_bridgeObjectRetain(v15);
      do
      {
        sub_1000191EC(v17, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_1000191EC((uint64_t)v9, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        if (swift_getEnumCaseMultiPayload(v5, v3) == 1)
        {
          if (*v5 == 3)
          {
            v19 = v23;
            swift_bridgeObjectRelease(v23);
            v20 = v24;
            sub_100017A6C((uint64_t)v9, v24, type metadata accessor for CRLSELibraryViewModeItemNode);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v6);
            v21 = v19;
            return swift_bridgeObjectRelease(v21);
          }
        }
        else
        {
          sub_100013BBC((uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        }
        sub_100013BBC((uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        v17 += v18;
        --v16;
      }
      while (v16);
      v15 = v23;
      swift_bridgeObjectRelease(v23);
      a1 = v24;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    v21 = v15;
    return swift_bridgeObjectRelease(v21);
  }
}

uint64_t sub_1000450F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[24];

  v3 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100011254(&qword_10006D030);
  __chkstk_darwin(v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  swift_beginAccess(v13, v25, 0, 0);
  sub_10004580C(v13, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    sub_100019B80((uint64_t)v12, &qword_10006D030);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  else
  {
    v15 = *(_QWORD *)&v12[*(int *)(v6 + 20)];
    swift_bridgeObjectRetain(v15);
    sub_100019B80((uint64_t)v12, &qword_10006D030);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v23 = v15;
      v24 = a1;
      v17 = v15 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      v18 = *(_QWORD *)(v7 + 72);
      swift_bridgeObjectRetain(v15);
      do
      {
        sub_1000191EC(v17, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_1000191EC((uint64_t)v9, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        if (swift_getEnumCaseMultiPayload(v5, v3) == 1)
        {
          if (*v5 == 2)
          {
            v19 = v23;
            swift_bridgeObjectRelease(v23);
            v20 = v24;
            sub_100017A6C((uint64_t)v9, v24, type metadata accessor for CRLSELibraryViewModeItemNode);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v6);
            v21 = v19;
            return swift_bridgeObjectRelease(v21);
          }
        }
        else
        {
          sub_100013BBC((uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        }
        sub_100013BBC((uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        v17 += v18;
        --v16;
      }
      while (v16);
      v15 = v23;
      swift_bridgeObjectRelease(v23);
      a1 = v24;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    v21 = v15;
    return swift_bridgeObjectRelease(v21);
  }
}

uint64_t sub_100045388(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  _QWORD *v13;
  void *v14;
  char *v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  unsigned int v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  char v32[24];
  _QWORD *v33;
  _BYTE v34[40];
  char v35[24];
  _QWORD *v36;

  v2 = v1;
  v4 = sub_100011254(&qword_10006D030);
  v5 = __chkstk_darwin(v4);
  v7 = &v32[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v5);
  v9 = &v32[-v8 - 8];
  v10 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  swift_beginAccess(v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, v35, 0, 0);
  sub_10004580C(v10, (uint64_t)v9);
  v11 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48);
  if (v12(v9, 1, v11))
  {
    v13 = _swiftEmptyArrayStorage;
  }
  else
  {
    v13 = *(_QWORD **)&v9[*(int *)(v11 + 20)];
    swift_bridgeObjectRetain(v13);
  }
  sub_100019B80((uint64_t)v9, &qword_10006D030);
  v36 = v13;
  swift_bridgeObjectRetain(a1);
  sub_100044530(a1);
  sub_100045608(&v36, sub_1000476A0);
  v14 = sub_100044DE0((uint64_t)v34);
  v16 = v15;
  if (!v12(v15, 1, v11))
  {
    v17 = v36;
    v18 = *(int *)(v11 + 20);
    v19 = *(_QWORD *)&v16[v18];
    *(_QWORD *)&v16[v18] = v36;
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRelease(v19);
  }
  ((void (*)(_BYTE *, _QWORD))v14)(v34, 0);
  v20 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
  swift_beginAccess(v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents, v32, 0, 0);
  sub_10004580C(v20, (uint64_t)v7);
  if (v12(v7, 1, v11))
  {
    v21 = _swiftEmptyArrayStorage;
  }
  else
  {
    v21 = *(_QWORD **)&v7[*(int *)(v11 + 20)];
    swift_bridgeObjectRetain(v21);
  }
  sub_100019B80((uint64_t)v7, &qword_10006D030);
  v33 = v21;
  v22 = swift_bridgeObjectRetain(a1);
  sub_100044530(v22);
  sub_100045608(&v33, sub_100045E7C);
  swift_bridgeObjectRelease(v36);
  v23 = sub_100044E24((uint64_t)v34);
  v25 = v24;
  v26 = v12(v24, 1, v11);
  v27 = v33;
  if (!v26)
  {
    v28 = *(int *)(v11 + 20);
    v29 = *(_QWORD **)&v25[v28];
    *(_QWORD *)&v25[v28] = v33;
    v27 = v29;
  }
  swift_bridgeObjectRelease(v27);
  return ((uint64_t (*)(_BYTE *, _QWORD))v23)(v34, 0);
}

uint64_t sub_100045608(_QWORD *a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v4 = *(_QWORD *)(type metadata accessor for CRLSELibraryViewModeItemNode(0) - 8);
  v5 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v5 = (_QWORD *)sub_10004B4D0(v5);
  v6 = v5[2];
  v8[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  result = a2(v8);
  *a1 = v5;
  return result;
}

uint64_t sub_100045698()
{
  uint64_t v0;

  sub_100019B80(v0 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode, &qword_10006D030);
  sub_100019B80(v0 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, &qword_10006D030);
  sub_100019B80(v0 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents, &qword_10006D030);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100045704()
{
  return type metadata accessor for CRLSELibrary(0);
}

uint64_t type metadata accessor for CRLSELibrary(uint64_t a1)
{
  uint64_t result;

  result = qword_10006D8B0;
  if (!qword_10006D8B0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CRLSELibrary);
  return result;
}

void sub_100045748(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_1000457B8(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

void sub_1000457B8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10006D8C0)
  {
    v2 = type metadata accessor for CRLSELibraryViewModeItemNode(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10006D8C0);
  }
}

uint64_t sub_10004580C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254(&qword_10006D030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_100045854(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100011254((uint64_t *)&unk_10006D690);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

size_t sub_100045954(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100045968(a1, a2, a3, a4, &qword_10006D9E8, type metadata accessor for CRLSEManifestItem);
}

size_t sub_100045968(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100011254(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  result = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v17 == 0x8000000000000000 && v15 == -1)
    goto LABEL_29;
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(result - v17) / v15);
LABEL_19:
  v20 = a6(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = (char *)v18 + v22;
  v24 = (char *)a4 + v22;
  if ((v8 & 1) != 0)
  {
    if (v18 < a4 || v23 >= &v24[*(_QWORD *)(v21 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v23, v24, v11, v20);
    }
    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v23, v24, v11, v20);
  }
  swift_bridgeObjectRelease(a4);
  return (size_t)v18;
}

size_t sub_100045ADC(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100045D08(a1, a2, a3, a4, &qword_10006D9D0, type metadata accessor for CRLSELibraryViewModeItemNode);
}

char *sub_100045AF0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100011254(&qword_10006D398);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, (char *)&type metadata for Any + 8);
  }
  swift_release(a4);
  return v11;
}

char *sub_100045BF4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100011254((uint64_t *)&unk_10006D690);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

size_t sub_100045CF4(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100045D08(a1, a2, a3, a4, &qword_10006D9F0, type metadata accessor for CRLSELibraryViewModel.Item);
}

size_t sub_100045D08(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100011254(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  result = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v17 == 0x8000000000000000 && v15 == -1)
    goto LABEL_29;
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(result - v17) / v15);
LABEL_19:
  v20 = a6(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = (char *)v18 + v22;
  v24 = (char *)a4 + v22;
  if ((v8 & 1) != 0)
  {
    if (v18 < a4 || v23 >= &v24[*(_QWORD *)(v21 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v23, v24, v11, v20);
    }
    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v23, v24, v11, v20);
  }
  swift_release(a4);
  return (size_t)v18;
}

uint64_t sub_100045E7C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  Swift::Int v57;
  uint64_t result;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  Swift::Int v63;
  char *v64;
  unint64_t v65;
  Swift::Int v66;
  uint64_t v67;
  uint64_t v68;
  Swift::Int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int EnumCaseMultiPayload;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int (*v89)(uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t, uint64_t);
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t);
  uint64_t v109;
  char *v110;
  char *v111;
  void (*v112)(char *, uint64_t);
  char *v113;
  Swift::Int v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  void (*v130)(char *, uint64_t, uint64_t);
  uint64_t v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t (*v142)(uint64_t);
  uint64_t v143;
  char *v144;
  char *v145;
  void (*v146)(char *, uint64_t);
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  Swift::Int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  Swift::Int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t (*v172)(uint64_t);
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unsigned int (*v178)(uint64_t, uint64_t, uint64_t);
  uint64_t v179;
  void (*v180)(char *, uint64_t, uint64_t);
  uint64_t v181;
  int v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t (*v188)(uint64_t);
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  char *v196;
  uint64_t v197;
  void (*v198)(char *, uint64_t);
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  unint64_t v203;
  _QWORD *v204;
  char *v205;
  char *v206;
  unint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  char v211;
  _QWORD *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  BOOL v218;
  unint64_t v219;
  uint64_t *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  BOOL v228;
  uint64_t v229;
  char v230;
  uint64_t *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  BOOL v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  unint64_t v246;
  uint64_t *v247;
  uint64_t v248;
  _QWORD *v249;
  uint64_t v250;
  unint64_t v251;
  uint64_t v252;
  unint64_t v253;
  uint64_t v254;
  uint64_t v255;
  char *v256;
  char *v257;
  unint64_t v258;
  _QWORD *v259;
  _QWORD *v260;
  uint64_t v261;
  char *v262;
  uint64_t v263;
  _QWORD *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  char *v276;
  uint64_t v277;
  char *v278;
  char *v279;
  uint64_t v280;
  uint64_t v281;
  char *v282;
  uint64_t v283;
  uint64_t v284;
  Swift::Int v285;
  char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  char *v293;
  char *v294;
  char *v295;
  uint64_t v296;
  Swift::Int v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  Swift::Int v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t *v308;
  uint64_t v309;
  uint64_t v310;

  v2 = v1;
  v307 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v4 = __chkstk_darwin(v307);
  v302 = (uint64_t)&v261 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v304 = (uint64_t)&v261 - v7;
  v8 = __chkstk_darwin(v6);
  v284 = (uint64_t)&v261 - v9;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v261 - v11;
  v13 = __chkstk_darwin(v10);
  v269 = (uint64_t)&v261 - v14;
  __chkstk_darwin(v13);
  v274 = (uint64_t)&v261 - v15;
  v16 = sub_100011254((uint64_t *)&unk_10006D130);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v261 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v261 - v21;
  v23 = __chkstk_darwin(v20);
  v277 = (uint64_t)&v261 - v24;
  v25 = __chkstk_darwin(v23);
  v283 = (uint64_t)&v261 - v26;
  v27 = __chkstk_darwin(v25);
  v266 = (uint64_t)&v261 - v28;
  __chkstk_darwin(v27);
  v267 = (uint64_t)&v261 - v29;
  v309 = type metadata accessor for Date(0);
  v298 = *(_QWORD *)(v309 - 8);
  v30 = __chkstk_darwin(v309);
  v293 = (char *)&v261 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v301 = (char *)&v261 - v33;
  v34 = __chkstk_darwin(v32);
  v272 = (char *)&v261 - v35;
  v36 = __chkstk_darwin(v34);
  v282 = (char *)&v261 - v37;
  v38 = __chkstk_darwin(v36);
  v40 = (char *)&v261 - v39;
  __chkstk_darwin(v38);
  v268 = (char *)&v261 - v41;
  v290 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v288 = *(_QWORD *)(v290 - 8);
  v42 = __chkstk_darwin(v290);
  v281 = (uint64_t)&v261 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __chkstk_darwin(v42);
  v299 = (uint64_t)&v261 - v45;
  v46 = __chkstk_darwin(v44);
  v310 = (uint64_t)&v261 - v47;
  v48 = __chkstk_darwin(v46);
  v303 = (uint64_t)&v261 - v49;
  v50 = __chkstk_darwin(v48);
  v289 = (uint64_t)&v261 - v51;
  v52 = __chkstk_darwin(v50);
  v287 = (uint64_t)&v261 - v53;
  v54 = __chkstk_darwin(v52);
  v273 = (uint64_t)&v261 - v55;
  __chkstk_darwin(v54);
  v271 = (uint64_t)&v261 - v56;
  v308 = a1;
  v57 = a1[1];
  result = _minimumMergeRunLength(_:)(v57);
  if (result >= v57)
  {
    if (v57 < 0)
      goto LABEL_197;
    if (v57)
      return sub_100048E5C(0, v57, 1, v308);
    return result;
  }
  if (v57 >= 0)
    v59 = v57;
  else
    v59 = v57 + 1;
  if (v57 < -1)
    goto LABEL_196;
  v265 = result;
  v262 = v40;
  v294 = v19;
  if (v57 > 1)
  {
    v60 = v59 >> 1;
    result = static Array._allocateBufferUninitialized(minimumCapacity:)(v59 >> 1, v290);
    *(_QWORD *)(result + 16) = v60;
    v61 = (*(unsigned __int8 *)(v288 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v288 + 80);
    v264 = (_QWORD *)result;
    v62 = (char *)(result + v61);
LABEL_12:
    v63 = 0;
    v263 = v274 + 8;
    v261 = v269 + 8;
    v278 = v12 + 8;
    v270 = v284 + 8;
    v291 = v302 + 8;
    v292 = v304 + 8;
    v64 = (char *)_swiftEmptyArrayStorage;
    v279 = v12;
    v286 = v62;
    v295 = v22;
    while (1)
    {
      v66 = v63 + 1;
      v276 = v64;
      v285 = v63;
      if (v63 + 1 >= v57)
      {
        v81 = v63 + 1;
        goto LABEL_111;
      }
      v305 = v57;
      v67 = *v308;
      v68 = *(_QWORD *)(v288 + 72);
      v69 = v63;
      v70 = v271;
      sub_1000191EC(*v308 + v68 * v66, v271, type metadata accessor for CRLSELibraryViewModeItemNode);
      v280 = v67;
      v306 = v68;
      sub_1000191EC(v67 + v68 * v69, v273, type metadata accessor for CRLSELibraryViewModeItemNode);
      v71 = v70;
      v72 = v274;
      sub_1000191EC(v71, v274, type metadata accessor for CRLSELibraryViewModel.Item);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v72, v307);
      if (EnumCaseMultiPayload == 3)
      {
        v82 = sub_100011254((uint64_t *)&unk_10006D630);
        swift_bridgeObjectRelease(*(_QWORD *)(v263 + *(int *)(v82 + 48)));
        v83 = v274;
        v84 = v274 + *(int *)(v82 + 64);
        v85 = v267;
        sub_100031D00(v84, v267, (uint64_t *)&unk_10006D130);
        v86 = type metadata accessor for UUID(0);
        v87 = v83;
        v79 = v85;
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 8))(v87, v86);
      }
      else
      {
        if (EnumCaseMultiPayload == 2)
        {
          v74 = sub_100011254((uint64_t *)&unk_10006D640);
          swift_bridgeObjectRelease(*(_QWORD *)(v263 + *(int *)(v74 + 48)));
          v75 = v274;
          v76 = v274 + *(int *)(v74 + 80);
          v77 = v267;
          sub_100031D00(v76, v267, (uint64_t *)&unk_10006D130);
          v78 = v75;
          v79 = v77;
          v80 = type metadata accessor for CRLSEBoardIdentifier;
        }
        else
        {
          v79 = v267;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v298 + 56))(v267, 1, 1, v309);
          v78 = v274;
          v80 = type metadata accessor for CRLSELibraryViewModel.Item;
        }
        sub_100013BBC(v78, v80);
      }
      v88 = v298;
      v89 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v298 + 48);
      v90 = v309;
      if (v89(v79, 1, v309) == 1)
      {
        v91 = v79;
LABEL_33:
        sub_100019B80(v91, (uint64_t *)&unk_10006D130);
        LODWORD(v300) = 0;
        goto LABEL_35;
      }
      v92 = v79;
      v93 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 32);
      v93(v268, v92, v90);
      v94 = v269;
      sub_1000191EC(v273, v269, type metadata accessor for CRLSELibraryViewModel.Item);
      v95 = swift_getEnumCaseMultiPayload(v94, v307);
      if (v95 == 2)
      {
        v103 = sub_100011254((uint64_t *)&unk_10006D640);
        swift_bridgeObjectRelease(*(_QWORD *)(v261 + *(int *)(v103 + 48)));
        v104 = *(int *)(v103 + 80);
        v105 = v269;
        v106 = v266;
        sub_100031D00(v269 + v104, v266, (uint64_t *)&unk_10006D130);
        v107 = v105;
        v102 = v106;
        v108 = type metadata accessor for CRLSEBoardIdentifier;
      }
      else
      {
        if (v95 == 3)
        {
          v96 = sub_100011254((uint64_t *)&unk_10006D630);
          swift_bridgeObjectRelease(*(_QWORD *)(v261 + *(int *)(v96 + 48)));
          v97 = *(int *)(v96 + 64);
          v98 = v269;
          v99 = v266;
          sub_100031D00(v269 + v97, v266, (uint64_t *)&unk_10006D130);
          v100 = type metadata accessor for UUID(0);
          v101 = v98;
          v102 = v99;
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 8))(v101, v100);
          goto LABEL_31;
        }
        v102 = v266;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v298 + 56))(v266, 1, 1, v309);
        v107 = v269;
        v108 = type metadata accessor for CRLSELibraryViewModel.Item;
      }
      sub_100013BBC(v107, v108);
LABEL_31:
      v109 = v309;
      if (v89(v102, 1, v309) == 1)
      {
        (*(void (**)(char *, uint64_t))(v298 + 8))(v268, v109);
        v91 = v102;
        goto LABEL_33;
      }
      v110 = v262;
      v93(v262, v102, v109);
      v111 = v268;
      LODWORD(v300) = Date.compare(_:)(v110) == 1;
      v112 = *(void (**)(char *, uint64_t))(v298 + 8);
      v113 = v110;
      v64 = v276;
      v112(v113, v109);
      v112(v111, v109);
LABEL_35:
      sub_100013BBC(v273, type metadata accessor for CRLSELibraryViewModeItemNode);
      result = sub_100013BBC(v271, type metadata accessor for CRLSELibraryViewModeItemNode);
      v81 = v285 + 2;
      v114 = v305;
      if (v285 + 2 < v305)
      {
        v297 = v306 * v66;
        v115 = v280;
        v296 = v306 * v81;
        while (1)
        {
          v116 = v287;
          sub_1000191EC(v115 + v296, v287, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_1000191EC(v115 + v297, v289, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_1000191EC(v116, (uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
          v117 = swift_getEnumCaseMultiPayload(v12, v307);
          v118 = v81;
          v119 = v2;
          if (v117 == 3)
          {
            v125 = sub_100011254((uint64_t *)&unk_10006D630);
            swift_bridgeObjectRelease(*(_QWORD *)&v278[*(int *)(v125 + 48)]);
            v126 = (uint64_t)&v12[*(int *)(v125 + 64)];
            v122 = v283;
            sub_100031D00(v126, v283, (uint64_t *)&unk_10006D130);
            v127 = type metadata accessor for UUID(0);
            (*(void (**)(char *, uint64_t))(*(_QWORD *)(v127 - 8) + 8))(v12, v127);
          }
          else
          {
            if (v117 == 2)
            {
              v120 = sub_100011254((uint64_t *)&unk_10006D640);
              swift_bridgeObjectRelease(*(_QWORD *)&v278[*(int *)(v120 + 48)]);
              v121 = (uint64_t)&v12[*(int *)(v120 + 80)];
              v122 = v283;
              sub_100031D00(v121, v283, (uint64_t *)&unk_10006D130);
              v123 = (uint64_t)v12;
              v124 = type metadata accessor for CRLSEBoardIdentifier;
            }
            else
            {
              v122 = v283;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v298 + 56))(v283, 1, 1, v309);
              v123 = (uint64_t)v12;
              v124 = type metadata accessor for CRLSELibraryViewModel.Item;
            }
            sub_100013BBC(v123, v124);
          }
          v128 = v309;
          if (v89(v122, 1, v309) == 1)
          {
            sub_100019B80(v122, (uint64_t *)&unk_10006D130);
            v129 = 0;
            goto LABEL_55;
          }
          v130 = *(void (**)(char *, uint64_t, uint64_t))(v298 + 32);
          v130(v282, v122, v128);
          v131 = v284;
          sub_1000191EC(v289, v284, type metadata accessor for CRLSELibraryViewModel.Item);
          v132 = swift_getEnumCaseMultiPayload(v131, v307);
          if (v132 == 2)
            break;
          if (v132 != 3)
          {
            v136 = v277;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v298 + 56))(v277, 1, 1, v309);
            v141 = v284;
            v142 = type metadata accessor for CRLSELibraryViewModel.Item;
            goto LABEL_50;
          }
          v133 = sub_100011254((uint64_t *)&unk_10006D630);
          swift_bridgeObjectRelease(*(_QWORD *)(v270 + *(int *)(v133 + 48)));
          v134 = v284;
          v135 = v284 + *(int *)(v133 + 64);
          v136 = v277;
          sub_100031D00(v135, v277, (uint64_t *)&unk_10006D130);
          v137 = type metadata accessor for UUID(0);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v137 - 8) + 8))(v134, v137);
LABEL_51:
          v143 = v309;
          if (v89(v136, 1, v309) == 1)
          {
            (*(void (**)(char *, uint64_t))(v298 + 8))(v282, v143);
            sub_100019B80(v136, (uint64_t *)&unk_10006D130);
            v129 = 0;
          }
          else
          {
            v144 = v272;
            v130(v272, v136, v143);
            v145 = v282;
            v129 = Date.compare(_:)(v144) == 1;
            v146 = *(void (**)(char *, uint64_t))(v298 + 8);
            v146(v144, v143);
            v147 = v145;
            v64 = v276;
            v146(v147, v143);
          }
          v12 = v279;
LABEL_55:
          sub_100013BBC(v289, type metadata accessor for CRLSELibraryViewModeItemNode);
          result = sub_100013BBC(v287, type metadata accessor for CRLSELibraryViewModeItemNode);
          v2 = v119;
          if ((_DWORD)v300 != v129)
          {
            v81 = v118;
            v114 = v305;
            goto LABEL_60;
          }
          v81 = v118 + 1;
          v114 = v305;
          v115 += v306;
          if (v305 == v81)
          {
            v81 = v305;
            goto LABEL_60;
          }
        }
        v138 = sub_100011254((uint64_t *)&unk_10006D640);
        swift_bridgeObjectRelease(*(_QWORD *)(v270 + *(int *)(v138 + 48)));
        v139 = v284;
        v140 = v284 + *(int *)(v138 + 80);
        v136 = v277;
        sub_100031D00(v140, v277, (uint64_t *)&unk_10006D130);
        v141 = v139;
        v142 = type metadata accessor for CRLSEBoardIdentifier;
LABEL_50:
        sub_100013BBC(v141, v142);
        goto LABEL_51;
      }
LABEL_60:
      v148 = (uint64_t)v295;
      if (!(_DWORD)v300)
      {
        v63 = v285;
LABEL_74:
        if (v81 >= v114)
          goto LABEL_111;
        goto LABEL_75;
      }
      v63 = v285;
      if (v81 < v285)
        goto LABEL_198;
      if (v285 >= v81)
        goto LABEL_74;
      v149 = 0;
      v150 = v306 * (v81 - 1);
      v151 = v81 * v306;
      v152 = v285;
      v153 = v285 * v306;
      do
      {
        if (v152 != v81 + v149 - 1)
        {
          v156 = v280;
          if (!v280)
            goto LABEL_203;
          v157 = v280 + v153;
          v300 = v280 + v150;
          sub_100017A6C(v280 + v153, v281, type metadata accessor for CRLSELibraryViewModeItemNode);
          if (v153 < v150 || v157 >= v156 + v151)
          {
            v154 = v156 + v153;
            v155 = v300;
            swift_arrayInitWithTakeFrontToBack(v154, v300, 1, v290);
          }
          else
          {
            v155 = v300;
            if (v153 != v150)
              swift_arrayInitWithTakeBackToFront(v157, v300);
          }
          result = sub_100017A6C(v281, v155, type metadata accessor for CRLSELibraryViewModeItemNode);
        }
        ++v152;
        --v149;
        v150 -= v306;
        v151 -= v306;
        v153 += v306;
      }
      while (v152 < v81 + v149);
      v148 = (uint64_t)v295;
      v64 = v276;
      v63 = v285;
      v114 = v305;
      if (v81 >= v305)
        goto LABEL_111;
LABEL_75:
      if (__OFSUB__(v81, v63))
        goto LABEL_195;
      if (v81 - v63 < v265)
      {
        if (__OFADD__(v63, v265))
          goto LABEL_199;
        if (v63 + v265 >= v114)
          v158 = v114;
        else
          v158 = v63 + v265;
        if (v158 < v63)
        {
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
          return result;
        }
        if (v81 != v158)
        {
          v275 = v2;
          v159 = *(_QWORD *)(v288 + 72);
          v306 = v159 * (v81 - 1);
          v296 = v159;
          v297 = v81;
          v305 = v81 * v159;
          v160 = v298;
          v280 = v158;
          do
          {
            v162 = 0;
            v163 = v63;
            while (1)
            {
              v164 = *v308;
              v300 = v305 + v162;
              v165 = v303;
              sub_1000191EC(v305 + v162 + v164, v303, type metadata accessor for CRLSELibraryViewModeItemNode);
              sub_1000191EC(v306 + v162 + v164, v310, type metadata accessor for CRLSELibraryViewModeItemNode);
              v166 = v304;
              sub_1000191EC(v165, v304, type metadata accessor for CRLSELibraryViewModel.Item);
              v167 = swift_getEnumCaseMultiPayload(v166, v307);
              if (v167 == 3)
              {
                v173 = sub_100011254((uint64_t *)&unk_10006D630);
                swift_bridgeObjectRelease(*(_QWORD *)(v292 + *(int *)(v173 + 48)));
                v174 = *(int *)(v173 + 64);
                v175 = v304;
                sub_100031D00(v304 + v174, v148, (uint64_t *)&unk_10006D130);
                v176 = type metadata accessor for UUID(0);
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v176 - 8) + 8))(v175, v176);
              }
              else
              {
                if (v167 == 2)
                {
                  v168 = sub_100011254((uint64_t *)&unk_10006D640);
                  swift_bridgeObjectRelease(*(_QWORD *)(v292 + *(int *)(v168 + 48)));
                  v169 = *(int *)(v168 + 80);
                  v170 = v304;
                  sub_100031D00(v304 + v169, v148, (uint64_t *)&unk_10006D130);
                  v171 = v170;
                  v172 = type metadata accessor for CRLSEBoardIdentifier;
                }
                else
                {
                  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v160 + 56))(v148, 1, 1, v309);
                  v171 = v304;
                  v172 = type metadata accessor for CRLSELibraryViewModel.Item;
                }
                sub_100013BBC(v171, v172);
              }
              v177 = v160;
              v178 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v160 + 48);
              v179 = v309;
              if (v178(v148, 1, v309) == 1)
              {
                v161 = v148;
                v160 = v177;
                goto LABEL_85;
              }
              v180 = *(void (**)(char *, uint64_t, uint64_t))(v177 + 32);
              v180(v301, v148, v179);
              v181 = v302;
              sub_1000191EC(v310, v302, type metadata accessor for CRLSELibraryViewModel.Item);
              v182 = swift_getEnumCaseMultiPayload(v181, v307);
              if (v182 == 3)
              {
                v189 = sub_100011254((uint64_t *)&unk_10006D630);
                swift_bridgeObjectRelease(*(_QWORD *)(v291 + *(int *)(v189 + 48)));
                v190 = *(int *)(v189 + 64);
                v191 = v302;
                v192 = (uint64_t)v294;
                sub_100031D00(v302 + v190, (uint64_t)v294, (uint64_t *)&unk_10006D130);
                v193 = type metadata accessor for UUID(0);
                v194 = v191;
                v186 = v192;
                v179 = v309;
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v193 - 8) + 8))(v194, v193);
              }
              else
              {
                if (v182 == 2)
                {
                  v183 = sub_100011254((uint64_t *)&unk_10006D640);
                  swift_bridgeObjectRelease(*(_QWORD *)(v291 + *(int *)(v183 + 48)));
                  v184 = v302;
                  v185 = v302 + *(int *)(v183 + 80);
                  v186 = (uint64_t)v294;
                  sub_100031D00(v185, (uint64_t)v294, (uint64_t *)&unk_10006D130);
                  v187 = v184;
                  v179 = v309;
                  v188 = type metadata accessor for CRLSEBoardIdentifier;
                }
                else
                {
                  v186 = (uint64_t)v294;
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v298 + 56))(v294, 1, 1, v179);
                  v187 = v302;
                  v188 = type metadata accessor for CRLSELibraryViewModel.Item;
                }
                sub_100013BBC(v187, v188);
              }
              if (v178(v186, 1, v179) == 1)
                break;
              v195 = v293;
              v180(v293, v186, v179);
              v196 = v301;
              v197 = Date.compare(_:)(v195);
              v160 = v298;
              v198 = *(void (**)(char *, uint64_t))(v298 + 8);
              v198(v195, v179);
              v198(v196, v179);
              sub_100013BBC(v310, type metadata accessor for CRLSELibraryViewModeItemNode);
              result = sub_100013BBC(v303, type metadata accessor for CRLSELibraryViewModeItemNode);
              v148 = (uint64_t)v295;
              if (v197 != 1)
                goto LABEL_86;
              v199 = *v308;
              if (!*v308)
                goto LABEL_201;
              v200 = v199 + v305 + v162;
              v201 = v199 + v306 + v162;
              sub_100017A6C(v200, v299, type metadata accessor for CRLSELibraryViewModeItemNode);
              swift_arrayInitWithTakeFrontToBack(v200, v201, 1, v290);
              result = sub_100017A6C(v299, v201, type metadata accessor for CRLSELibraryViewModeItemNode);
              v162 -= v296;
              if (v297 == ++v163)
                goto LABEL_86;
            }
            v160 = v298;
            (*(void (**)(char *, uint64_t))(v298 + 8))(v301, v179);
            v161 = v186;
            v148 = (uint64_t)v295;
LABEL_85:
            sub_100019B80(v161, (uint64_t *)&unk_10006D130);
            sub_100013BBC(v310, type metadata accessor for CRLSELibraryViewModeItemNode);
            result = sub_100013BBC(v303, type metadata accessor for CRLSELibraryViewModeItemNode);
LABEL_86:
            v306 += v296;
            v305 += v296;
            ++v297;
            v63 = v285;
          }
          while (v297 != v280);
          v81 = v280;
          v2 = v275;
          v64 = v276;
        }
      }
LABEL_111:
      if (v81 < v63)
        goto LABEL_190;
      result = swift_isUniquelyReferenced_nonNull_native(v64);
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10004B08C(0, *((_QWORD *)v64 + 2) + 1, 1, v64);
        v64 = (char *)result;
      }
      v203 = *((_QWORD *)v64 + 2);
      v202 = *((_QWORD *)v64 + 3);
      v65 = v203 + 1;
      if (v203 >= v202 >> 1)
      {
        result = (uint64_t)sub_10004B08C((char *)(v202 > 1), v203 + 1, 1, v64);
        v64 = (char *)result;
      }
      *((_QWORD *)v64 + 2) = v65;
      v204 = v64 + 32;
      v205 = &v64[16 * v203 + 32];
      *(_QWORD *)v205 = v285;
      *((_QWORD *)v205 + 1) = v81;
      v297 = v81;
      v206 = v64;
      if (v203)
      {
        while (1)
        {
          v207 = v65 - 1;
          if (v65 >= 4)
          {
            v212 = &v204[2 * v65];
            v213 = *(v212 - 8);
            v214 = *(v212 - 7);
            v218 = __OFSUB__(v214, v213);
            v215 = v214 - v213;
            if (v218)
              goto LABEL_179;
            v217 = *(v212 - 6);
            v216 = *(v212 - 5);
            v218 = __OFSUB__(v216, v217);
            v210 = v216 - v217;
            v211 = v218;
            if (v218)
              goto LABEL_180;
            v219 = v65 - 2;
            v220 = &v204[2 * v65 - 4];
            v222 = *v220;
            v221 = v220[1];
            v218 = __OFSUB__(v221, v222);
            v223 = v221 - v222;
            if (v218)
              goto LABEL_181;
            v218 = __OFADD__(v210, v223);
            v224 = v210 + v223;
            if (v218)
              goto LABEL_185;
            if (v224 >= v215)
            {
              v242 = &v204[2 * v207];
              v244 = *v242;
              v243 = v242[1];
              v218 = __OFSUB__(v243, v244);
              v245 = v243 - v244;
              if (v218)
                goto LABEL_189;
              v235 = v210 < v245;
              goto LABEL_148;
            }
          }
          else
          {
            if (v65 != 3)
            {
              v236 = *((_QWORD *)v64 + 4);
              v237 = *((_QWORD *)v64 + 5);
              v218 = __OFSUB__(v237, v236);
              v229 = v237 - v236;
              v230 = v218;
              goto LABEL_142;
            }
            v209 = *((_QWORD *)v64 + 4);
            v208 = *((_QWORD *)v64 + 5);
            v218 = __OFSUB__(v208, v209);
            v210 = v208 - v209;
            v211 = v218;
          }
          if ((v211 & 1) != 0)
            goto LABEL_182;
          v219 = v65 - 2;
          v225 = &v204[2 * v65 - 4];
          v227 = *v225;
          v226 = v225[1];
          v228 = __OFSUB__(v226, v227);
          v229 = v226 - v227;
          v230 = v228;
          if (v228)
            goto LABEL_183;
          v231 = &v204[2 * v207];
          v233 = *v231;
          v232 = v231[1];
          v218 = __OFSUB__(v232, v233);
          v234 = v232 - v233;
          if (v218)
            goto LABEL_186;
          if (__OFADD__(v229, v234))
            goto LABEL_188;
          if (v229 + v234 >= v210)
          {
            v235 = v210 < v234;
LABEL_148:
            if (v235)
              v207 = v219;
            goto LABEL_150;
          }
LABEL_142:
          if ((v230 & 1) != 0)
            goto LABEL_184;
          v238 = &v204[2 * v207];
          v240 = *v238;
          v239 = v238[1];
          v218 = __OFSUB__(v239, v240);
          v241 = v239 - v240;
          if (v218)
            goto LABEL_187;
          if (v241 < v229)
            goto LABEL_14;
LABEL_150:
          v246 = v207 - 1;
          if (v207 - 1 >= v65)
          {
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
LABEL_181:
            __break(1u);
LABEL_182:
            __break(1u);
LABEL_183:
            __break(1u);
LABEL_184:
            __break(1u);
LABEL_185:
            __break(1u);
LABEL_186:
            __break(1u);
LABEL_187:
            __break(1u);
LABEL_188:
            __break(1u);
LABEL_189:
            __break(1u);
LABEL_190:
            __break(1u);
LABEL_191:
            __break(1u);
LABEL_192:
            __break(1u);
LABEL_193:
            __break(1u);
LABEL_194:
            __break(1u);
LABEL_195:
            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            __break(1u);
LABEL_199:
            __break(1u);
            goto LABEL_200;
          }
          if (!*v308)
            goto LABEL_202;
          v247 = &v204[2 * v246];
          v248 = *v247;
          v249 = &v204[2 * v207];
          v250 = v249[1];
          result = sub_1000499C4(*v308 + *(_QWORD *)(v288 + 72) * *v247, *v308 + *(_QWORD *)(v288 + 72) * *v249, *v308 + *(_QWORD *)(v288 + 72) * v250, (unint64_t)v286);
          if (v2)
          {
LABEL_170:
            v259 = v264;
            swift_bridgeObjectRelease(v206);
            v259[2] = 0;
            v260 = v259;
            return swift_bridgeObjectRelease(v260);
          }
          if (v250 < v248)
            goto LABEL_176;
          if (v207 > *((_QWORD *)v206 + 2))
            goto LABEL_177;
          *v247 = v248;
          v204[2 * v246 + 1] = v250;
          v251 = *((_QWORD *)v206 + 2);
          if (v207 >= v251)
            goto LABEL_178;
          v64 = v206;
          v65 = v251 - 1;
          result = (uint64_t)memmove(&v204[2 * v207], v249 + 2, 16 * (v251 - 1 - v207));
          *((_QWORD *)v206 + 2) = v251 - 1;
          if (v251 <= 2)
            goto LABEL_14;
        }
      }
      v65 = 1;
LABEL_14:
      v57 = v308[1];
      v63 = v297;
      v12 = v279;
      if (v297 >= v57)
      {
        v62 = v286;
        if (v65 < 2)
          goto LABEL_172;
LABEL_159:
        v252 = *v308;
        while (1)
        {
          v253 = v65 - 2;
          if (v65 < 2)
            goto LABEL_191;
          if (!v252)
            goto LABEL_204;
          v254 = *(_QWORD *)&v206[16 * v253 + 32];
          v255 = *(_QWORD *)&v206[16 * v65 + 24];
          v256 = v62;
          result = sub_1000499C4(v252 + *(_QWORD *)(v288 + 72) * v254, v252 + *(_QWORD *)(v288 + 72) * *(_QWORD *)&v206[16 * v65 + 16], v252 + *(_QWORD *)(v288 + 72) * v255, (unint64_t)v62);
          if (v2)
            goto LABEL_170;
          if (v255 < v254)
            goto LABEL_192;
          result = swift_isUniquelyReferenced_nonNull_native(v206);
          v275 = 0;
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_10004B234((uint64_t)v206);
            v206 = (char *)result;
          }
          if (v253 >= *((_QWORD *)v206 + 2))
            goto LABEL_193;
          v257 = &v206[16 * v253 + 32];
          *(_QWORD *)v257 = v254;
          *((_QWORD *)v257 + 1) = v255;
          v258 = *((_QWORD *)v206 + 2);
          if (v65 > v258)
            goto LABEL_194;
          result = (uint64_t)memmove(&v206[16 * v65 + 16], &v206[16 * v65 + 32], 16 * (v258 - v65));
          *((_QWORD *)v206 + 2) = v258 - 1;
          v65 = v258 - 1;
          v2 = v275;
          v62 = v256;
          if (v258 <= 2)
            goto LABEL_172;
        }
      }
    }
  }
  v62 = (char *)_swiftEmptyArrayStorage
      + ((*(unsigned __int8 *)(v288 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v288 + 80));
  v264 = _swiftEmptyArrayStorage;
  if (v57 == 1)
    goto LABEL_12;
  v65 = _swiftEmptyArrayStorage[2];
  v206 = (char *)_swiftEmptyArrayStorage;
  if (v65 >= 2)
    goto LABEL_159;
LABEL_172:
  swift_bridgeObjectRelease(v206);
  v260 = v264;
  v264[2] = 0;
  return swift_bridgeObjectRelease(v260);
}

Swift::Int sub_1000476A0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v30;
  Swift::Int result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  Swift::Int v37;
  char *v38;
  unint64_t v39;
  Swift::Int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  Swift::Int v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  char v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  uint64_t v109;
  _QWORD v110[4];
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  Swift::Int v115;
  unint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  unint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  Swift::Int v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char *v134;

  v2 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v3 = __chkstk_darwin(v2);
  v131 = (char *)v110 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v130 = (char *)v110 - v6;
  v7 = __chkstk_darwin(v5);
  v118 = (char *)v110 - v8;
  v9 = __chkstk_darwin(v7);
  v117 = (char *)v110 - v10;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)v110 - v12;
  __chkstk_darwin(v11);
  v111 = (uint64_t)v110 - v14;
  v126 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v121 = *(_QWORD *)(v126 - 8);
  v15 = __chkstk_darwin(v126);
  v114 = (char *)v110 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v129 = (char *)v110 - v18;
  v19 = __chkstk_darwin(v17);
  v134 = (char *)v110 - v20;
  v21 = __chkstk_darwin(v19);
  v132 = (char *)v110 - v22;
  v23 = __chkstk_darwin(v21);
  v122 = (char *)v110 - v24;
  v25 = __chkstk_darwin(v23);
  v119 = (char *)v110 - v26;
  v27 = __chkstk_darwin(v25);
  v113 = (uint64_t)v110 - v28;
  __chkstk_darwin(v27);
  v112 = (uint64_t)v110 - v29;
  v30 = a1[1];
  result = _minimumMergeRunLength(_:)(v30);
  if (result < v30)
  {
    if (v30 >= 0)
      v32 = v30;
    else
      v32 = v30 + 1;
    if (v30 < -1)
      goto LABEL_101;
    v110[2] = v13;
    v110[1] = result;
    if (v30 <= 1)
    {
      v36 = _swiftEmptyArrayStorage;
      v120 = (unint64_t)_swiftEmptyArrayStorage
           + ((*(unsigned __int8 *)(v121 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80));
      if (v30 != 1)
      {
        v39 = _swiftEmptyArrayStorage[2];
        v38 = (char *)_swiftEmptyArrayStorage;
LABEL_68:
        v110[0] = v36;
        if (v39 >= 2)
        {
          v102 = *a1;
          v103 = v123;
          do
          {
            v104 = v39 - 2;
            if (v39 < 2)
              goto LABEL_97;
            if (!v102)
            {
              __break(1u);
              JUMPOUT(0x100048DFCLL);
            }
            v105 = *(_QWORD *)&v38[16 * v104 + 32];
            v106 = *(_QWORD *)&v38[16 * v39 + 24];
            sub_10004A6E0(v102 + *(_QWORD *)(v121 + 72) * v105, v102 + *(_QWORD *)(v121 + 72) * *(_QWORD *)&v38[16 * v39 + 16], v102 + *(_QWORD *)(v121 + 72) * v106, v120);
            if (v103)
              break;
            if (v106 < v105)
              goto LABEL_98;
            if ((swift_isUniquelyReferenced_nonNull_native(v38) & 1) == 0)
              v38 = sub_10004B234((uint64_t)v38);
            if (v104 >= *((_QWORD *)v38 + 2))
              goto LABEL_99;
            v107 = &v38[16 * v104 + 32];
            *(_QWORD *)v107 = v105;
            *((_QWORD *)v107 + 1) = v106;
            v108 = *((_QWORD *)v38 + 2);
            if (v39 > v108)
              goto LABEL_100;
            memmove(&v38[16 * v39 + 16], &v38[16 * v39 + 32], 16 * (v108 - v39));
            *((_QWORD *)v38 + 2) = v108 - 1;
            v39 = v108 - 1;
          }
          while (v108 > 2);
        }
LABEL_79:
        swift_bridgeObjectRelease(v38);
        v109 = v110[0];
        *(_QWORD *)(v110[0] + 16) = 0;
        return swift_bridgeObjectRelease(v109);
      }
      v110[0] = _swiftEmptyArrayStorage;
    }
    else
    {
      v33 = v32 >> 1;
      v34 = static Array._allocateBufferUninitialized(minimumCapacity:)(v32 >> 1, v126);
      *(_QWORD *)(v34 + 16) = v33;
      v35 = *(unsigned __int8 *)(v121 + 80);
      v110[0] = v34;
      v120 = v34 + ((v35 + 32) & ~v35);
    }
    v37 = 0;
    v38 = (char *)_swiftEmptyArrayStorage;
    v124 = "Recently Deleted";
    v116 = 0x8000000100053FF0;
    v125 = a1;
    v127 = v2;
    do
    {
      v40 = v37 + 1;
      v115 = v37;
      if (v37 + 1 < v30)
      {
        v41 = v2;
        v42 = *a1;
        v43 = *(_QWORD *)(v121 + 72);
        v128 = v37 + 1;
        v44 = v42 + v43 * v40;
        v45 = v112;
        sub_1000191EC(v44, v112, type metadata accessor for CRLSELibraryViewModeItemNode);
        v133 = v43;
        sub_1000191EC(v42 + v43 * v37, v113, type metadata accessor for CRLSELibraryViewModeItemNode);
        v46 = v45;
        v47 = v111;
        sub_1000191EC(v46, v111, type metadata accessor for CRLSELibraryViewModel.Item);
        v48 = (char *)&loc_100047A88 + dword_100048DFC[swift_getEnumCaseMultiPayload(v47, v41)];
        __asm { BR              X9 }
      }
      if (v40 < v37)
        goto LABEL_96;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v38);
      v128 = v37 + 1;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v38 = sub_10004B08C(0, *((_QWORD *)v38 + 2) + 1, 1, v38);
      v51 = *((_QWORD *)v38 + 2);
      v50 = *((_QWORD *)v38 + 3);
      v39 = v51 + 1;
      if (v51 >= v50 >> 1)
        v38 = sub_10004B08C((char *)(v50 > 1), v51 + 1, 1, v38);
      *((_QWORD *)v38 + 2) = v39;
      v52 = v38 + 32;
      v53 = &v38[16 * v51 + 32];
      v54 = v128;
      *(_QWORD *)v53 = v37;
      *((_QWORD *)v53 + 1) = v54;
      if (v51)
      {
        while (1)
        {
          v55 = v39 - 1;
          if (v39 >= 4)
          {
            v60 = &v52[16 * v39];
            v61 = *((_QWORD *)v60 - 8);
            v62 = *((_QWORD *)v60 - 7);
            v66 = __OFSUB__(v62, v61);
            v63 = v62 - v61;
            if (v66)
              goto LABEL_85;
            v65 = *((_QWORD *)v60 - 6);
            v64 = *((_QWORD *)v60 - 5);
            v66 = __OFSUB__(v64, v65);
            v58 = v64 - v65;
            v59 = v66;
            if (v66)
              goto LABEL_86;
            v67 = v39 - 2;
            v68 = &v52[16 * v39 - 32];
            v70 = *(_QWORD *)v68;
            v69 = *((_QWORD *)v68 + 1);
            v66 = __OFSUB__(v69, v70);
            v71 = v69 - v70;
            if (v66)
              goto LABEL_87;
            v66 = __OFADD__(v58, v71);
            v72 = v58 + v71;
            if (v66)
              goto LABEL_89;
            if (v72 >= v63)
            {
              v90 = &v52[16 * v55];
              v92 = *(_QWORD *)v90;
              v91 = *((_QWORD *)v90 + 1);
              v66 = __OFSUB__(v91, v92);
              v93 = v91 - v92;
              if (v66)
                goto LABEL_95;
              v83 = v58 < v93;
              goto LABEL_55;
            }
          }
          else
          {
            if (v39 != 3)
            {
              v84 = *((_QWORD *)v38 + 4);
              v85 = *((_QWORD *)v38 + 5);
              v66 = __OFSUB__(v85, v84);
              v77 = v85 - v84;
              v78 = v66;
              goto LABEL_49;
            }
            v57 = *((_QWORD *)v38 + 4);
            v56 = *((_QWORD *)v38 + 5);
            v66 = __OFSUB__(v56, v57);
            v58 = v56 - v57;
            v59 = v66;
          }
          if ((v59 & 1) != 0)
            goto LABEL_88;
          v67 = v39 - 2;
          v73 = &v52[16 * v39 - 32];
          v75 = *(_QWORD *)v73;
          v74 = *((_QWORD *)v73 + 1);
          v76 = __OFSUB__(v74, v75);
          v77 = v74 - v75;
          v78 = v76;
          if (v76)
            goto LABEL_90;
          v79 = &v52[16 * v55];
          v81 = *(_QWORD *)v79;
          v80 = *((_QWORD *)v79 + 1);
          v66 = __OFSUB__(v80, v81);
          v82 = v80 - v81;
          if (v66)
            goto LABEL_92;
          if (__OFADD__(v77, v82))
            goto LABEL_94;
          if (v77 + v82 >= v58)
          {
            v83 = v58 < v82;
LABEL_55:
            if (v83)
              v55 = v67;
            goto LABEL_57;
          }
LABEL_49:
          if ((v78 & 1) != 0)
            goto LABEL_91;
          v86 = &v52[16 * v55];
          v88 = *(_QWORD *)v86;
          v87 = *((_QWORD *)v86 + 1);
          v66 = __OFSUB__(v87, v88);
          v89 = v87 - v88;
          if (v66)
            goto LABEL_93;
          if (v89 < v77)
            goto LABEL_15;
LABEL_57:
          v94 = v55 - 1;
          if (v55 - 1 >= v39)
          {
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
LABEL_84:
            __break(1u);
LABEL_85:
            __break(1u);
LABEL_86:
            __break(1u);
LABEL_87:
            __break(1u);
LABEL_88:
            __break(1u);
LABEL_89:
            __break(1u);
LABEL_90:
            __break(1u);
LABEL_91:
            __break(1u);
LABEL_92:
            __break(1u);
LABEL_93:
            __break(1u);
LABEL_94:
            __break(1u);
LABEL_95:
            __break(1u);
LABEL_96:
            __break(1u);
LABEL_97:
            __break(1u);
LABEL_98:
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
            __break(1u);
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
            __break(1u);
            __break(1u);
            JUMPOUT(0x100048DE8);
          }
          if (!*a1)
          {
            __break(1u);
            JUMPOUT(0x100048DF4);
          }
          v95 = v38;
          v96 = &v52[16 * v94];
          v97 = *(_QWORD *)v96;
          v98 = &v52[16 * v55];
          v99 = *((_QWORD *)v98 + 1);
          v100 = v123;
          sub_10004A6E0(*a1 + *(_QWORD *)(v121 + 72) * *(_QWORD *)v96, *a1 + *(_QWORD *)(v121 + 72) * *(_QWORD *)v98, *a1 + *(_QWORD *)(v121 + 72) * v99, v120);
          v123 = v100;
          if (v100)
          {
            v38 = v95;
            goto LABEL_79;
          }
          if (v99 < v97)
            goto LABEL_82;
          if (v55 > *((_QWORD *)v95 + 2))
            goto LABEL_83;
          *(_QWORD *)v96 = v97;
          *(_QWORD *)&v52[16 * v94 + 8] = v99;
          v101 = *((_QWORD *)v95 + 2);
          if (v55 >= v101)
            goto LABEL_84;
          v38 = v95;
          v39 = v101 - 1;
          memmove(&v52[16 * v55], v98 + 16, 16 * (v101 - 1 - v55));
          *((_QWORD *)v95 + 2) = v101 - 1;
          v83 = v101 > 2;
          v2 = v127;
          if (!v83)
            goto LABEL_15;
        }
      }
      v39 = 1;
LABEL_15:
      v30 = a1[1];
      v37 = v128;
    }
    while (v128 < v30);
    v36 = (_QWORD *)v110[0];
    goto LABEL_68;
  }
  if (v30 < 0)
    goto LABEL_102;
  if (v30)
    return sub_1000494E4(0, v30, 1, a1);
  return result;
}

uint64_t sub_100048E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int EnumCaseMultiPayload;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int (*v43)(char *, uint64_t, uint64_t);
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v85 = a4;
  v73 = a1;
  v89 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v6 = __chkstk_darwin(v89);
  v88 = (uint64_t)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v90 = (uint64_t)&v71 - v8;
  v9 = sub_100011254((uint64_t *)&unk_10006D130);
  v10 = __chkstk_darwin(v9);
  v79 = (uint64_t)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v71 - v12;
  v14 = type metadata accessor for Date(0);
  v91 = *(_QWORD *)(v14 - 8);
  v15 = __chkstk_darwin(v14);
  v77 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v87 = (char *)&v71 - v17;
  v74 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v18 = __chkstk_darwin(v74);
  v82 = (uint64_t)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v71 - v21;
  result = __chkstk_darwin(v20);
  v81 = a3;
  v72 = a2;
  if (a3 != a2)
  {
    v26 = (char *)&v71 - v25;
    v27 = *(_QWORD *)(v24 + 72);
    v75 = v88 + 8;
    v76 = v90 + 8;
    v28 = v27 * (v81 - 1);
    v80 = v27;
    v29 = v27 * v81;
    v78 = v13;
    while (2)
    {
      v92 = 0;
      v86 = v73;
      while (1)
      {
        v31 = *v85;
        v32 = v92;
        v84 = v29 + v92;
        sub_1000191EC(v29 + v92 + v31, (uint64_t)v26, type metadata accessor for CRLSELibraryViewModeItemNode);
        v83 = v28 + v32;
        sub_1000191EC(v28 + v32 + v31, (uint64_t)v22, type metadata accessor for CRLSELibraryViewModeItemNode);
        v33 = v90;
        sub_1000191EC((uint64_t)v26, v90, type metadata accessor for CRLSELibraryViewModel.Item);
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v33, v89);
        if (EnumCaseMultiPayload == 3)
        {
          v40 = sub_100011254((uint64_t *)&unk_10006D630);
          swift_bridgeObjectRelease(*(_QWORD *)(v76 + *(int *)(v40 + 48)));
          v41 = v90;
          sub_100031D00(v90 + *(int *)(v40 + 64), (uint64_t)v13, (uint64_t *)&unk_10006D130);
          v42 = type metadata accessor for UUID(0);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 8))(v41, v42);
          v35 = v91;
        }
        else
        {
          v35 = v91;
          if (EnumCaseMultiPayload == 2)
          {
            v36 = sub_100011254((uint64_t *)&unk_10006D640);
            swift_bridgeObjectRelease(*(_QWORD *)(v76 + *(int *)(v36 + 48)));
            v37 = v90;
            sub_100031D00(v90 + *(int *)(v36 + 80), (uint64_t)v13, (uint64_t *)&unk_10006D130);
            v38 = v37;
            v39 = type metadata accessor for CRLSEBoardIdentifier;
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v13, 1, 1, v14);
            v38 = v90;
            v39 = type metadata accessor for CRLSELibraryViewModel.Item;
          }
          sub_100013BBC(v38, v39);
        }
        v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
        if (v43(v13, 1, v14) == 1)
          break;
        v44 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
        v44(v87, v13, v14);
        v45 = v88;
        sub_1000191EC((uint64_t)v22, v88, type metadata accessor for CRLSELibraryViewModel.Item);
        v46 = swift_getEnumCaseMultiPayload(v45, v89);
        if (v46 == 3)
        {
          v53 = sub_100011254((uint64_t *)&unk_10006D630);
          swift_bridgeObjectRelease(*(_QWORD *)(v75 + *(int *)(v53 + 48)));
          v54 = *(int *)(v53 + 64);
          v55 = v88;
          v56 = v79;
          sub_100031D00(v88 + v54, v79, (uint64_t *)&unk_10006D130);
          v57 = type metadata accessor for UUID(0);
          v58 = v55;
          v50 = v56;
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 8))(v58, v57);
        }
        else
        {
          if (v46 == 2)
          {
            v47 = sub_100011254((uint64_t *)&unk_10006D640);
            swift_bridgeObjectRelease(*(_QWORD *)(v75 + *(int *)(v47 + 48)));
            v48 = v88;
            v49 = v88 + *(int *)(v47 + 80);
            v50 = v79;
            sub_100031D00(v49, v79, (uint64_t *)&unk_10006D130);
            v51 = v48;
            v52 = type metadata accessor for CRLSEBoardIdentifier;
          }
          else
          {
            v50 = v79;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v91 + 56))(v79, 1, 1, v14);
            v51 = v88;
            v52 = type metadata accessor for CRLSELibraryViewModel.Item;
          }
          sub_100013BBC(v51, v52);
        }
        if (v43((char *)v50, 1, v14) == 1)
        {
          (*(void (**)(char *, uint64_t))(v91 + 8))(v87, v14);
          v30 = v50;
          v13 = v78;
          goto LABEL_5;
        }
        v59 = v77;
        v44(v77, (char *)v50, v14);
        v60 = v29;
        v61 = v28;
        v62 = v26;
        v63 = v22;
        v64 = v87;
        v65 = Date.compare(_:)(v59);
        v66 = *(void (**)(char *, uint64_t))(v91 + 8);
        v66(v59, v14);
        v67 = v64;
        v22 = v63;
        v26 = v62;
        v28 = v61;
        v29 = v60;
        v66(v67, v14);
        sub_100013BBC((uint64_t)v22, type metadata accessor for CRLSELibraryViewModeItemNode);
        result = sub_100013BBC((uint64_t)v26, type metadata accessor for CRLSELibraryViewModeItemNode);
        v13 = v78;
        if (v65 != 1)
          goto LABEL_6;
        v68 = *v85;
        if (!*v85)
        {
          __break(1u);
          return result;
        }
        v69 = v68 + v60 + v92;
        v70 = v68 + v28 + v92;
        sub_100017A6C(v69, v82, type metadata accessor for CRLSELibraryViewModeItemNode);
        swift_arrayInitWithTakeFrontToBack(v69, v70, 1, v74);
        result = sub_100017A6C(v82, v70, type metadata accessor for CRLSELibraryViewModeItemNode);
        v92 -= v80;
        if (v81 == ++v86)
          goto LABEL_6;
      }
      v30 = (uint64_t)v13;
LABEL_5:
      sub_100019B80(v30, (uint64_t *)&unk_10006D130);
      sub_100013BBC((uint64_t)v22, type metadata accessor for CRLSELibraryViewModeItemNode);
      result = sub_100013BBC((uint64_t)v26, type metadata accessor for CRLSELibraryViewModeItemNode);
LABEL_6:
      v28 += v80;
      v29 += v80;
      if (++v81 == v72)
        return result;
      continue;
    }
  }
  return result;
}

uint64_t sub_1000494E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD v23[4];
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v31 = a4;
  v23[3] = a1;
  v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v7 = __chkstk_darwin(v6);
  v32 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)v23 - v9;
  v24 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v11 = __chkstk_darwin(v24);
  v29 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v34 = (uint64_t)v23 - v14;
  result = __chkstk_darwin(v13);
  v33 = (uint64_t)v23 - v17;
  v28 = a3;
  v23[2] = a2;
  if (a3 != a2)
  {
    v18 = *(_QWORD *)(v16 + 72);
    v19 = v18 * (v28 - 1);
    v26 = v18;
    v25 = v10;
    v27 = v18 * v28;
    v20 = *v31;
    v30 = v18 * v28;
    v21 = v33;
    sub_1000191EC(v18 * v28 + v20, v33, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_1000191EC(v19 + v20, v34, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_1000191EC(v21, (uint64_t)v10, type metadata accessor for CRLSELibraryViewModel.Item);
    v22 = (char *)&loc_100049728 + dword_1000499A4[swift_getEnumCaseMultiPayload(v10, v6)];
    __asm { BR              X9 }
  }
  return result;
}

uint64_t sub_100049738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int EnumCaseMultiPayload;

  *(_QWORD *)(v1 - 96) = sub_100015734();
  *(_QWORD *)(v1 - 88) = v2;
  v3 = *(_QWORD *)(v1 - 128);
  sub_1000191EC(*(_QWORD *)(v1 - 72), v3, type metadata accessor for CRLSELibraryViewModel.Item);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v3, v0);
  return ((uint64_t (*)(void))((char *)&loc_10004981C + dword_1000499B4[EnumCaseMultiPayload]))();
}

void sub_10004982C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_100015734();
  v5 = v4;
  *(_QWORD *)(v2 - 112) = v3;
  *(_QWORD *)(v2 - 104) = v4;
  v6 = sub_100039770();
  v7 = StringProtocol.localizedCaseInsensitiveCompare<A>(_:)(v2 - 112, &type metadata for String, &type metadata for String, v6, v6);
  swift_bridgeObjectRelease(v0);
  swift_bridgeObjectRelease(v5);
  sub_100013BBC(*(_QWORD *)(v2 - 72), type metadata accessor for CRLSELibraryViewModeItemNode);
  sub_100013BBC(*(_QWORD *)(v2 - 120), type metadata accessor for CRLSELibraryViewModeItemNode);
  if (v7 == -1)
  {
    v8 = **(_QWORD **)(v2 - 136);
    if (v8)
    {
      sub_100017A6C(v8 + *(_QWORD *)(v2 - 168) + v1, *(_QWORD *)(v2 - 152), type metadata accessor for CRLSELibraryViewModeItemNode);
      JUMPOUT(0x10004967CLL);
    }
    __break(1u);
    JUMPOUT(0x1000499A4);
  }
  JUMPOUT(0x100049648);
}

uint64_t sub_1000499C4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v47)(uint64_t);
  uint64_t (*v48)(uint64_t);
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int EnumCaseMultiPayload;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(char *, uint64_t, uint64_t);
  int v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  void (*v66)(_QWORD, _QWORD);
  int v67;
  uint64_t v68;
  void (*v69)(_QWORD, _QWORD);
  uint64_t v70;
  uint64_t v71;
  void (*v72)(_QWORD, _QWORD);
  uint64_t (*v73)(uint64_t);
  uint64_t v74;
  uint64_t v75;
  void (*v76)(_QWORD, _QWORD);
  uint64_t v77;
  uint64_t v78;
  void (*v79)(_QWORD, _QWORD);
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  void (*v87)(char *, uint64_t, uint64_t);
  uint64_t (*v88)(uint64_t);
  uint64_t (*v89)(uint64_t);
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  char *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned int (*v114)(uint64_t, uint64_t, uint64_t);
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t);
  _BOOL4 v130;
  uint64_t v131;
  char *v132;
  void (*v133)(char *, uint64_t);
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;

  v156 = a3;
  v155 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v7 = __chkstk_darwin(v155);
  v146 = (uint64_t)&v137 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v152 = (uint64_t)&v137 - v10;
  v11 = __chkstk_darwin(v9);
  v145 = (char *)&v137 - v12;
  __chkstk_darwin(v11);
  v151 = (uint64_t)&v137 - v13;
  v14 = sub_100011254((uint64_t *)&unk_10006D130);
  v15 = __chkstk_darwin(v14);
  v141 = (uint64_t)&v137 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v144 = (uint64_t)&v137 - v18;
  v19 = __chkstk_darwin(v17);
  v140 = (uint64_t)&v137 - v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v137 - v21;
  v157 = type metadata accessor for Date(0);
  v154 = *(_QWORD *)(v157 - 8);
  v23 = __chkstk_darwin(v157);
  v139 = (char *)&v137 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v147 = (char *)&v137 - v26;
  v27 = __chkstk_darwin(v25);
  v138 = (char *)&v137 - v28;
  __chkstk_darwin(v27);
  v143 = (char *)&v137 - v29;
  v149 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v30 = __chkstk_darwin(v149);
  v153 = (unint64_t)&v137 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v34 = (char *)&v137 - v33;
  v35 = __chkstk_darwin(v32);
  v142 = (uint64_t)&v137 - v36;
  result = __chkstk_darwin(v35);
  v150 = (unint64_t)&v137 - v38;
  v148 = *(_QWORD *)(v39 + 72);
  if (!v148)
  {
    __break(1u);
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  if (a2 - a1 == 0x8000000000000000 && v148 == -1)
    goto LABEL_93;
  v40 = v156 - a2;
  if (v156 - a2 != 0x8000000000000000 || v148 != -1)
  {
    v41 = (uint64_t)(a2 - a1) / v148;
    v160 = a1;
    v159 = a4;
    v42 = v40 / v148;
    if (v41 < v40 / v148)
    {
      v43 = v41 * v148;
      if (a4 < a1 || a1 + v43 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a1, v41, v149);
        v44 = v142;
      }
      else
      {
        v44 = v142;
        if (a4 != a1)
          swift_arrayInitWithTakeBackToFront(a4, a1);
      }
      v153 = a4 + v43;
      v158 = a4 + v43;
      if (v43 >= 1 && a2 < v156)
      {
        v152 = v151 + 8;
        v147 = v145 + 8;
        v47 = type metadata accessor for CRLSELibraryViewModeItemNode;
        v48 = type metadata accessor for CRLSELibraryViewModel.Item;
        while (1)
        {
          v49 = v150;
          sub_1000191EC(a2, v150, v47);
          sub_1000191EC(a4, v44, v47);
          v50 = v49;
          v51 = v151;
          sub_1000191EC(v50, v151, v48);
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v51, v155);
          if (EnumCaseMultiPayload == 3)
          {
            v58 = sub_100011254((uint64_t *)&unk_10006D630);
            swift_bridgeObjectRelease(*(_QWORD *)(v152 + *(int *)(v58 + 48)));
            v59 = v151;
            sub_100031D00(v151 + *(int *)(v58 + 64), (uint64_t)v22, (uint64_t *)&unk_10006D130);
            v60 = type metadata accessor for UUID(0);
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 8))(v59, v60);
            v53 = v154;
          }
          else
          {
            v53 = v154;
            if (EnumCaseMultiPayload == 2)
            {
              v54 = sub_100011254((uint64_t *)&unk_10006D640);
              swift_bridgeObjectRelease(*(_QWORD *)(v152 + *(int *)(v54 + 48)));
              v55 = v151;
              sub_100031D00(v151 + *(int *)(v54 + 80), (uint64_t)v22, (uint64_t *)&unk_10006D130);
              v56 = v55;
              v44 = v142;
              v57 = type metadata accessor for CRLSEBoardIdentifier;
            }
            else
            {
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v154 + 56))(v22, 1, 1, v157);
              v56 = v151;
              v57 = v48;
            }
            sub_100013BBC(v56, v57);
          }
          v61 = v53;
          v62 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
          v63 = v62(v22, 1, v157);
          v64 = (uint64_t)v22;
          if (v63 == 1)
            goto LABEL_36;
          v65 = *(void (**)(char *, char *, uint64_t))(v61 + 32);
          v65(v143, v22, v157);
          v66 = (void (*)(_QWORD, _QWORD))v145;
          sub_1000191EC(v44, (uint64_t)v145, v48);
          v67 = swift_getEnumCaseMultiPayload(v66, v155);
          if (v67 == 3)
          {
            v74 = sub_100011254((uint64_t *)&unk_10006D630);
            swift_bridgeObjectRelease(*(_QWORD *)&v147[*(int *)(v74 + 48)]);
            v75 = *(int *)(v74 + 64);
            v76 = (void (*)(_QWORD, _QWORD))v145;
            v77 = v140;
            sub_100031D00((uint64_t)&v145[v75], v140, (uint64_t *)&unk_10006D130);
            v78 = type metadata accessor for UUID(0);
            v79 = v76;
            v71 = v77;
            (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v78 - 8) + 8))(v79, v78);
          }
          else
          {
            if (v67 == 2)
            {
              v68 = sub_100011254((uint64_t *)&unk_10006D640);
              swift_bridgeObjectRelease(*(_QWORD *)&v147[*(int *)(v68 + 48)]);
              v69 = (void (*)(_QWORD, _QWORD))v145;
              v70 = (uint64_t)&v145[*(int *)(v68 + 80)];
              v71 = v140;
              sub_100031D00(v70, v140, (uint64_t *)&unk_10006D130);
              v72 = v69;
              v73 = type metadata accessor for CRLSEBoardIdentifier;
            }
            else
            {
              v71 = v140;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v154 + 56))(v140, 1, 1, v157);
              v72 = (void (*)(_QWORD, _QWORD))v145;
              v73 = v48;
            }
            sub_100013BBC((uint64_t)v72, v73);
          }
          if (v62((char *)v71, 1, v157) == 1)
            break;
          v84 = v22;
          v85 = v143;
          v86 = v138;
          v87 = (void (*)(char *, uint64_t, uint64_t))v65;
          v88 = v48;
          v89 = v47;
          v90 = v157;
          v87(v138, v71, v157);
          v91 = Date.compare(_:)(v86);
          v92 = *(void (**)(char *, uint64_t))(v154 + 8);
          v93 = v86;
          v22 = v84;
          v92(v93, v90);
          v94 = v90;
          v47 = v89;
          v48 = v88;
          v92(v85, v94);
          v44 = v142;
          sub_100013BBC(v142, v47);
          sub_100013BBC(v150, v47);
          if (v91 != 1)
            goto LABEL_37;
          v80 = v160;
          v81 = v148;
          v83 = a2 + v148;
          if (v160 < a2 || v160 >= v83)
          {
            swift_arrayInitWithTakeFrontToBack(v160, a2, 1, v149);
          }
          else if (v160 == a2)
          {
            v80 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v160, a2);
          }
LABEL_43:
          v160 = v80 + v81;
          a4 = v159;
          if (v159 < v153)
          {
            a2 = v83;
            if (v83 < v156)
              continue;
          }
          goto LABEL_91;
        }
        (*(void (**)(char *, uint64_t))(v154 + 8))(v143, v157);
        v64 = v71;
        v44 = v142;
LABEL_36:
        sub_100019B80(v64, (uint64_t *)&unk_10006D130);
        sub_100013BBC(v44, v47);
        sub_100013BBC(v150, v47);
LABEL_37:
        v80 = v160;
        v81 = v148;
        v82 = v159 + v148;
        if (v160 < v159 || v160 >= v82)
        {
          swift_arrayInitWithTakeFrontToBack(v160, v159, 1, v149);
        }
        else if (v160 != v159)
        {
          swift_arrayInitWithTakeBackToFront(v160, v159);
        }
        v159 = v82;
        v83 = a2;
        goto LABEL_43;
      }
      goto LABEL_91;
    }
    v45 = v42 * v148;
    if (a4 < a2 || a2 + v45 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a2, v42, v149);
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront(a4, a2);
    }
    v95 = a4 + v45;
    v158 = a4 + v45;
    v160 = a2;
    v150 = a1;
    if (v45 < 1 || a1 >= a2)
    {
LABEL_91:
      sub_10004B184(&v160, &v159, (uint64_t *)&v158);
      return 1;
    }
    v97 = -v148;
    v142 = v146 + 8;
    v143 = (char *)(v152 + 8);
    v148 = (uint64_t)v34;
    v151 = v97;
    while (1)
    {
      sub_1000191EC(v95 + v97, (uint64_t)v34, type metadata accessor for CRLSELibraryViewModeItemNode);
      v98 = a2 + v97;
      sub_1000191EC(a2 + v97, v153, type metadata accessor for CRLSELibraryViewModeItemNode);
      v99 = v152;
      sub_1000191EC((uint64_t)v34, v152, type metadata accessor for CRLSELibraryViewModel.Item);
      v100 = swift_getEnumCaseMultiPayload(v99, v155);
      if (v100 == 3)
      {
        v108 = sub_100011254((uint64_t *)&unk_10006D630);
        swift_bridgeObjectRelease(*(_QWORD *)&v143[*(int *)(v108 + 48)]);
        v109 = v152;
        v110 = v152 + *(int *)(v108 + 64);
        v111 = v144;
        sub_100031D00(v110, v144, (uint64_t *)&unk_10006D130);
        v112 = type metadata accessor for UUID(0);
        v113 = v109;
        v106 = v111;
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 8))(v113, v112);
        v107 = v154;
      }
      else if (v100 == 2)
      {
        v101 = sub_100011254((uint64_t *)&unk_10006D640);
        swift_bridgeObjectRelease(*(_QWORD *)&v143[*(int *)(v101 + 48)]);
        v102 = v152;
        v103 = v152 + *(int *)(v101 + 80);
        v104 = v144;
        sub_100031D00(v103, v144, (uint64_t *)&unk_10006D130);
        v105 = v102;
        v106 = v104;
        sub_100013BBC(v105, type metadata accessor for CRLSEBoardIdentifier);
        v107 = v154;
      }
      else
      {
        v107 = v154;
        v106 = v144;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v154 + 56))(v144, 1, 1, v157);
        sub_100013BBC(v152, type metadata accessor for CRLSELibraryViewModel.Item);
      }
      v114 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v107 + 48);
      if (v114(v106, 1, v157) == 1)
      {
        v115 = a2;
        v116 = v106;
        goto LABEL_74;
      }
      v117 = v157;
      v145 = *(char **)(v107 + 32);
      ((void (*)(char *, uint64_t))v145)(v147, v106);
      v118 = v146;
      sub_1000191EC(v153, v146, type metadata accessor for CRLSELibraryViewModel.Item);
      v119 = swift_getEnumCaseMultiPayload(v118, v155);
      if (v119 == 2)
        break;
      if (v119 != 3)
      {
        v123 = v141;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v107 + 56))(v141, 1, 1, v117);
        v128 = v146;
        v129 = type metadata accessor for CRLSELibraryViewModel.Item;
        goto LABEL_71;
      }
      v120 = sub_100011254((uint64_t *)&unk_10006D630);
      swift_bridgeObjectRelease(*(_QWORD *)(v142 + *(int *)(v120 + 48)));
      v121 = *(int *)(v120 + 64);
      v107 = v154;
      v122 = v146;
      v123 = v141;
      sub_100031D00(v146 + v121, v141, (uint64_t *)&unk_10006D130);
      v124 = type metadata accessor for UUID(0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v124 - 8) + 8))(v122, v124);
LABEL_72:
      v115 = a2;
      if (v114(v123, 1, v117) != 1)
      {
        v131 = v157;
        v132 = v139;
        ((void (*)(char *, uint64_t, uint64_t))v145)(v139, v123, v157);
        v130 = Date.compare(_:)(v132) == 1;
        v133 = *(void (**)(char *, uint64_t))(v107 + 8);
        v133(v132, v131);
        v133(v147, v131);
        v34 = (char *)v148;
        goto LABEL_76;
      }
      (*(void (**)(char *, uint64_t))(v107 + 8))(v147, v157);
      v116 = v123;
LABEL_74:
      sub_100019B80(v116, (uint64_t *)&unk_10006D130);
      v130 = 0;
      v34 = (char *)v148;
LABEL_76:
      v97 = v151;
      v134 = v156 + v151;
      sub_100013BBC(v153, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_100013BBC((uint64_t)v34, type metadata accessor for CRLSELibraryViewModeItemNode);
      if (v130)
      {
        if (v156 < v115 || v134 >= v115)
        {
          swift_arrayInitWithTakeFrontToBack(v134, v98, 1, v149);
          v97 = v151;
        }
        else
        {
          v97 = v151;
          if (v156 != v115)
            swift_arrayInitWithTakeBackToFront(v134, v98);
        }
        v160 += v97;
      }
      else
      {
        v135 = v158;
        v136 = v158 + v97;
        v158 += v97;
        if (v156 < v135 || v134 >= v135)
        {
          swift_arrayInitWithTakeFrontToBack(v134, v136, 1, v149);
        }
        else if (v156 != v135)
        {
          swift_arrayInitWithTakeBackToFront(v134, v136);
        }
        v98 = v115;
      }
      v95 = v158;
      if (v158 > a4)
      {
        a2 = v98;
        v156 = v134;
        if (v98 > v150)
          continue;
      }
      goto LABEL_91;
    }
    v125 = sub_100011254((uint64_t *)&unk_10006D640);
    swift_bridgeObjectRelease(*(_QWORD *)(v142 + *(int *)(v125 + 48)));
    v126 = *(int *)(v125 + 80);
    v107 = v154;
    v127 = v146;
    v123 = v141;
    sub_100031D00(v146 + v126, v141, (uint64_t *)&unk_10006D130);
    v128 = v127;
    v129 = type metadata accessor for CRLSEBoardIdentifier;
LABEL_71:
    sub_100013BBC(v128, v129);
    goto LABEL_72;
  }
LABEL_94:
  __break(1u);
  return result;
}

uint64_t sub_10004A6E0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;

  v49 = a3;
  v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v45 = (uint64_t)&v41 - v12;
  v13 = __chkstk_darwin(v11);
  __chkstk_darwin(v13);
  v15 = (char *)&v41 - v14;
  v43 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v16 = __chkstk_darwin(v43);
  v48 = (uint64_t)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v46 = (uint64_t)&v41 - v19;
  v20 = __chkstk_darwin(v18);
  v47 = (unint64_t)&v41 - v21;
  __chkstk_darwin(v20);
  v23 = (char *)&v41 - v22;
  v42 = *(_QWORD *)(v24 + 72);
  if (!v42)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (a2 - a1 == 0x8000000000000000 && v42 == -1)
    goto LABEL_29;
  v25 = v49 - a2;
  if (v49 - a2 == 0x8000000000000000 && v42 == -1)
  {
LABEL_30:
    __break(1u);
    JUMPOUT(0x10004B04CLL);
  }
  v26 = (uint64_t)(a2 - a1) / v42;
  v52 = a1;
  v51 = a4;
  v27 = v25 / v42;
  v44 = v7;
  if (v26 >= v25 / v42)
  {
    v29 = v27 * v42;
    if (a4 < a2 || a2 + v29 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a2, v27, v43);
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront(a4, a2);
    }
    v32 = a4 + v29;
    v50 = a4 + v29;
    v52 = a2;
    v47 = a1;
    if (v29 >= 1 && a1 < a2)
    {
      v34 = v42;
      v35 = -v42;
      v42 = (uint64_t)v10;
      v36 = v46;
      sub_1000191EC(v32 - v34, v46, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC(a2 + v35, v48, type metadata accessor for CRLSELibraryViewModeItemNode);
      v37 = v36;
      v38 = v45;
      sub_1000191EC(v37, v45, type metadata accessor for CRLSELibraryViewModel.Item);
      v39 = (char *)&loc_10004AD20 + dword_10004B04C[swift_getEnumCaseMultiPayload(v38, v44)];
      __asm { BR              X9 }
    }
  }
  else
  {
    v28 = v26 * v42;
    if (a4 < a1 || a1 + v28 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1, v26, v43);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }
    v48 = a4 + v28;
    v50 = a4 + v28;
    if (v28 >= 1 && a2 < v49)
    {
      sub_1000191EC(a2, (uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC(a4, v47, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC((uint64_t)v23, (uint64_t)v15, type metadata accessor for CRLSELibraryViewModel.Item);
      v31 = (char *)&loc_10004A998 + dword_10004B06C[swift_getEnumCaseMultiPayload(v15, v44)];
      __asm { BR              X9 }
    }
  }
  sub_10004B184(&v52, &v51, (uint64_t *)&v50);
  return 1;
}

char *sub_10004B08C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100011254(&qword_10006D9D8);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_10004B184(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v9;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_13;
  v9 = (uint64_t)(v5 - v4) / v7;
  if (v3 < v4 || v3 >= v4 + v9 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v9, result);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  return result;
}

char *sub_10004B234(uint64_t a1)
{
  return sub_10004B08C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10004B248(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  void (*v17[4])(id *);

  v5 = result;
  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    result = swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      if (a3 < 0)
        v10 = a3;
      else
        v10 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a3);
      v11 = _CocoaArrayWrapper.endIndex.getter(v10);
      result = swift_bridgeObjectRelease(a3);
      if (v11 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10004BC70();
          swift_bridgeObjectRetain(a3);
          for (i = 0; i != v7; ++i)
          {
            sub_100011254(&qword_10006D9F8);
            v13 = sub_10004B3DC(v17, i, a3);
            v15 = *v14;
            ((void (*)(void (**)(id *), _QWORD))v13)(v17, 0);
            *(_QWORD *)(v5 + 8 * i) = v15;
          }
          swift_bridgeObjectRelease(a3);
          return a3;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8 <= a2)
      {
        v9 = sub_1000287C0();
        swift_arrayInitWithCopy(v5, (a3 & 0xFFFFFFFFFFFFFF8) + 32, v8, v9);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_10004B3DC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10004B45C(v6, a2, a3);
  return sub_10004B430;
}

void sub_10004B430(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10004B45C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_10004B4C8;
  }
  __break(1u);
  return result;
}

void sub_10004B4C8(id *a1)
{

}

size_t sub_10004B4D0(_QWORD *a1)
{
  return sub_100045968(0, a1[2], 0, a1, &qword_10006D9D0, type metadata accessor for CRLSELibraryViewModeItemNode);
}

uint64_t sub_10004B504(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_10004B570(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(void);
  unsigned int (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(void);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(void);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[32];

  v70 = a2;
  v72 = a1;
  v73 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  v3 = __chkstk_darwin(v73);
  v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v58 - v6;
  v8 = sub_100011254(&qword_10006D030);
  v9 = __chkstk_darwin(v8);
  v68 = (uint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v66 = (uint64_t)&v58 - v12;
  __chkstk_darwin(v11);
  v67 = (uint64_t)&v58 - v13;
  v14 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v62 = (uint64_t)&v58 - v20;
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v58 - v22;
  __chkstk_darwin(v21);
  v60 = (uint64_t)&v58 - v24;
  v25 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  v26 = *(void (**)(void))(v15 + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode, 1, 1, v14);
  v27 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, 1, 1, v14);
  v69 = v2;
  v61 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
  v26();
  swift_beginAccess(v25, v74, 33, 0);
  sub_10004BBE0(v72, v25);
  swift_endAccess(v74);
  v64 = v15;
  v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  if (v71(v25, 1, v14))
  {
    v28 = v70;
    v29 = v67;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v67, 1, 1, v14);
    v30 = v26;
    v31 = v71;
LABEL_14:
    sub_100019B80(v29, &qword_10006D030);
    goto LABEL_15;
  }
  v59 = v27;
  v65 = v26;
  v32 = *(int *)(v14 + 20);
  v33 = *(_QWORD *)(v25 + v32);
  v34 = *(_QWORD *)(v33 + 16);
  if (v34)
  {
    v58 = v25;
    v63 = v14;
    v35 = v33 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
    v36 = *(_QWORD *)(v64 + 72);
    v37 = v33;
    swift_bridgeObjectRetain(v33);
    do
    {
      sub_1000191EC(v35, (uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_1000191EC((uint64_t)v23, (uint64_t)v7, type metadata accessor for CRLSELibraryViewModel.Item);
      if (swift_getEnumCaseMultiPayload(v7, v73) == 1)
      {
        if (!*v7)
        {
          v29 = v67;
          sub_100017A6C((uint64_t)v23, v67, type metadata accessor for CRLSELibraryViewModeItemNode);
          v28 = v70;
          v31 = v71;
          v14 = v63;
          v30 = v65;
          v25 = v58;
          ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v65)(v29, 0, 1, v63);
          goto LABEL_13;
        }
      }
      else
      {
        sub_100013BBC((uint64_t)v7, type metadata accessor for CRLSELibraryViewModel.Item);
      }
      sub_100013BBC((uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
      v35 += v36;
      --v34;
    }
    while (v34);
    v28 = v70;
    v31 = v71;
    v14 = v63;
    v30 = v65;
    v25 = v58;
  }
  else
  {
    v37 = *(_QWORD *)(v25 + v32);
    swift_bridgeObjectRetain(v33);
    v28 = v70;
    v31 = v71;
    v30 = v65;
  }
  v29 = v67;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v30)(v67, 1, 1, v14);
LABEL_13:
  swift_bridgeObjectRelease(v37);
  if (v31(v29, 1, v14) == 1)
    goto LABEL_14;
  v48 = v29;
  v49 = v60;
  sub_100017A6C(v48, v60, type metadata accessor for CRLSELibraryViewModeItemNode);
  v50 = v49;
  v51 = v66;
  sub_100017A6C(v50, v66, type metadata accessor for CRLSELibraryViewModeItemNode);
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v30)(v51, 0, 1, v14);
  v52 = v59;
  swift_beginAccess(v59, v74, 33, 0);
  sub_10004BC28(v51, v52);
  swift_endAccess(v74);
LABEL_15:
  if (v31(v25, 1, v14))
  {
    v38 = v68;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v30)(v68, 1, 1, v14);
    v39 = v72;
    v40 = v69;
  }
  else
  {
    v65 = v30;
    v41 = v66;
    v63 = v14;
    v42 = *(_QWORD *)(v25 + *(int *)(v14 + 20));
    v43 = *(_QWORD *)(v42 + 16);
    if (v43)
    {
      v44 = v42 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
      v45 = *(_QWORD *)(v64 + 72);
      swift_bridgeObjectRetain(v42);
      do
      {
        sub_1000191EC(v44, (uint64_t)v18, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_1000191EC((uint64_t)v18, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        if (swift_getEnumCaseMultiPayload(v5, v73) == 1)
        {
          if (*v5 == 1)
          {
            v38 = v68;
            sub_100017A6C((uint64_t)v18, v68, type metadata accessor for CRLSELibraryViewModeItemNode);
            v46 = 0;
            v40 = v69;
            v28 = v70;
            v39 = v72;
            v47 = v65;
            goto LABEL_27;
          }
        }
        else
        {
          sub_100013BBC((uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        }
        sub_100013BBC((uint64_t)v18, type metadata accessor for CRLSELibraryViewModeItemNode);
        v44 += v45;
        --v43;
      }
      while (v43);
      v46 = 1;
      v40 = v69;
      v28 = v70;
      v39 = v72;
      v38 = v68;
      v47 = v65;
    }
    else
    {
      swift_bridgeObjectRetain(v42);
      v46 = 1;
      v38 = v68;
      v40 = v69;
      v47 = v65;
      v39 = v72;
    }
LABEL_27:
    v53 = v63;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v47)(v38, v46, 1, v63);
    swift_bridgeObjectRelease(v42);
    if (v71(v38, 1, v53) != 1)
    {
      v55 = v38;
      v56 = v62;
      sub_100017A6C(v55, v62, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_100017A6C(v56, v41, type metadata accessor for CRLSELibraryViewModeItemNode);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v47)(v41, 0, 1, v53);
      v57 = v61;
      swift_beginAccess(v61, v74, 33, 0);
      sub_10004BC28(v41, v57);
      swift_endAccess(v74);
      goto LABEL_29;
    }
  }
  sub_100019B80(v38, &qword_10006D030);
LABEL_29:
  sub_100045388(v28);
  sub_100019B80(v39, &qword_10006D030);
  return v40;
}

uint64_t sub_10004BBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254(&qword_10006D030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004BC28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100011254(&qword_10006D030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10004BC70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10006DA00;
  if (!qword_10006DA00)
  {
    v1 = sub_1000192FC(&qword_10006D9F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006DA00);
  }
  return result;
}

void sub_10004BCBC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
  sub_100004C44();
  sub_100004C28((void *)&_mh_execute_header, v3, v4, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v5, v6, v7, v8, v9);

  sub_100004C3C();
}

void sub_10004BD58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C80();
  sub_100004C6C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d App group identifier (%@) has unexpected prefix.", v2, v3, v4, v5, v6);
  sub_100004C3C();
}

void sub_10004BDEC(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = objc_msgSend((id)sub_10000A448(), "packedBacktraceString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004C44();
  sub_100004C28((void *)&_mh_execute_header, v5, v6, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v7, v8, v9, v10, v11);

  sub_10000A408();
}

void sub_10004BE7C()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[30];
  int v4;
  __int16 v5;
  const char *v6;

  sub_10000A424();
  sub_10000A454();
  sub_10000A438();
  v4 = 268;
  v5 = v0;
  v6 = "directoryPath";
  sub_10000A418((void *)&_mh_execute_header, v1, v2, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v3);
  sub_100004C3C();
}

void sub_10004BF10()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[30];
  int v4;
  __int16 v5;
  const char *v6;

  sub_10000A424();
  sub_10000A454();
  sub_10000A438();
  v4 = 342;
  v5 = v0;
  v6 = "charSet";
  sub_10000A418((void *)&_mh_execute_header, v1, v2, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v3);
  sub_100004C3C();
}

void sub_10004BFA4()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[30];
  int v4;
  __int16 v5;
  const char *v6;

  sub_10000A424();
  sub_10000A454();
  sub_10000A438();
  v4 = 440;
  v5 = v0;
  v6 = "icuRegexCharSet";
  sub_10000A418((void *)&_mh_execute_header, v1, v2, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v3);
  sub_100004C3C();
}

void sub_10004C038(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  v4[0] = 67110146;
  v4[1] = a2;
  v5 = 2082;
  sub_10000A454();
  v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
  v7 = 1024;
  v8 = 1331;
  v9 = 2112;
  v10 = v2;
  sub_10000A418((void *)&_mh_execute_header, v3, (uint64_t)v3, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to make a string out of data with UTI %@", (uint8_t *)v4);
  sub_100004C3C();
}

void sub_10004C0E0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to use AddressBook API. Localization format may be incorrect.", v1, 2u);
}

void sub_10004C120(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "registeredTypeIdentifiers"));
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Content Identifiers: %@", a1, 0xCu);

}

void sub_10004C1A0(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRAWImage, "identifier"));
  v4 = 138543362;
  v5 = v2;
  sub_10000BC40((void *)&_mh_execute_header, v1, v3, "Unable to load shared content of type %{public}@. Provided item is nil", (uint8_t *)&v4);

}

void sub_10004C244(void *a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = a1;
  v6 = (objc_class *)sub_10000BC70();
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "domain"));
  sub_10000BC7C();
  sub_10000BC10();
  sub_10000BC4C((void *)&_mh_execute_header, v9, v10, "Error copying shared item: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v11, v12, v13, v14, v15);

  sub_10000BC60();
}

void sub_10004C2E0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000BC40((void *)&_mh_execute_header, a2, a3, "Unable to resolve extension item to a supported type: %@", (uint8_t *)&v3);
}

void sub_10004C34C(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription"));
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to load shared content of type %{public}@ with error %{public}@", (uint8_t *)&v8, 0x16u);

}

void sub_10004C41C(void *a1, int a2)
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
  v5[0] = 67109378;
  v5[1] = a2;
  v6 = 2114;
  v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)v5, 0x12u);

}

void sub_10004C4DC(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;

  v2[0] = 67110146;
  v2[1] = a1;
  v3 = 2082;
  v4 = "+[UIDevice(CRLAdditions) crl_platformString]_block_invoke";
  v5 = 2082;
  v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIDevice_CRLAdditions.m";
  v7 = 1024;
  v8 = 46;
  v9 = 2082;
  v10 = "s_platformString";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)v2, 0x2Cu);
}

void sub_10004C594(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
  sub_100004C44();
  sub_100004C28((void *)&_mh_execute_header, v3, v4, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v5, v6, v7, v8, v9);

  sub_10000A408();
}

void sub_10004C628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D8E4();
  sub_10000D8C4();
  sub_10000A438();
  sub_10000D8D4();
  sub_10000D8B4((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected inequality between %{public}s and %{public}s", v2, v3, v4, v5, v6);
  sub_100004C3C();
}

void sub_10004C6C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D8E4();
  sub_10000D8C4();
  sub_10000A438();
  sub_10000D8D4();
  sub_10000D8B4((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected inequality between %{public}s and %{public}s", v2, v3, v4, v5, v6);
  sub_100004C3C();
}

void sub_10004C758()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D8E4();
  sub_10000D8C4();
  sub_10000A438();
  sub_10000D8D4();
  sub_10000D8B4((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected inequality between %{public}s and %{public}s", v2, v3, v4, v5, v6);
  sub_100004C3C();
}

void sub_10004C7F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000A454();
  sub_10000F5C0();
  sub_10000F5AC();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUILarge.", v2, v3, v4, v5, 2u);
  sub_100004C3C();
}

void sub_10004C874()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000A454();
  sub_10000F5C0();
  sub_10000F5AC();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegular.", v2, v3, v4, v5, 2u);
  sub_100004C3C();
}

void sub_10004C8F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000A454();
  sub_10000F5C0();
  sub_10000F5AC();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularPlus.", v2, v3, v4, v5, 2u);
  sub_100004C3C();
}

void sub_10004C97C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000A454();
  sub_10000F5C0();
  sub_10000F5AC();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularZoom.", v2, v3, v4, v5, 2u);
  sub_100004C3C();
}

void sub_10004CA00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000A454();
  sub_10000F5C0();
  sub_10000F5AC();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUISmall.", v2, v3, v4, v5, 2u);
  sub_100004C3C();
}

void sub_10004CA84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000F5E0();
  sub_10000F5D0((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No one should look at the screen scale before the application has finished launching, because the value isn't ready yet and may change! To debug, break in UIScreen.crl_screenScale and re-launch the app.", v2, v3, v4, v5, 2u);
}

void sub_10004CB0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F59C();
  sub_10000F5E0();
  sub_10000F5D0((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unsupported screen scale.", v2, v3, v4, v5, 2u);
}

void sub_10004CB94(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Ignored previous assertion failure ***", v1, 2u);
}

void sub_10004CBD4(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert Assertion backtrace: >>%{public}@<<", (uint8_t *)&v3, 0xCu);

  sub_100010748();
}

void sub_10004CC74(void *a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  intptr_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = a1;
  v4 = 134218242;
  v5 = CRLDynamicBaseAddress();
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert Assertion backtrace. Load address 0x%0llx, Backtrace:\n%{public}@", (uint8_t *)&v4, 0x16u);

  sub_100010748();
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__atomicIncrementAssertCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_atomicIncrementAssertCount");
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCharactersInString:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callStackReturnAddresses");
}

id objc_msgSend_canBeConvertedToEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBeConvertedToEncoding:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_characterSetWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithRange:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_crl_appendJSONStringToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_appendJSONStringToString:");
}

id objc_msgSend_crl_compressWithAlgorithm_operation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_compressWithAlgorithm:operation:");
}

id objc_msgSend_crl_countInstancesOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_countInstancesOfString:options:");
}

id objc_msgSend_crl_creatorArtistOrAuthorWithMetadataArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_creatorArtistOrAuthorWithMetadataArray:");
}

id objc_msgSend_crl_filenameTruncatedToCharacterLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_filenameTruncatedToCharacterLimit:");
}

id objc_msgSend_crl_firstTrackWithMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_firstTrackWithMediaType:");
}

id objc_msgSend_crl_initRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_initRedactedWithFormat:arguments:");
}

id objc_msgSend_crl_initUnRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_initUnRedactedWithFormat:arguments:");
}

id objc_msgSend_crl_isCJKString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_isCJKString");
}

id objc_msgSend_crl_padUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_padUI");
}

id objc_msgSend_crl_parseBaseTitleWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_outNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_parseBaseTitleWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:outNumber:");
}

id objc_msgSend_crl_phoneUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_phoneUI");
}

id objc_msgSend_crl_phoneUI667H(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_phoneUI667H");
}

id objc_msgSend_crl_phoneUI667HOrSmaller(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_phoneUI667HOrSmaller");
}

id objc_msgSend_crl_platformString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_platformString");
}

id objc_msgSend_crl_playableKeysWithKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_playableKeysWithKeys:");
}

id objc_msgSend_crl_regexForTitleParsingWithLocalizedCopyString_isFirstCopyFormatString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:");
}

id objc_msgSend_crl_screenClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_screenClass");
}

id objc_msgSend_crl_screenScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_screenScale");
}

id objc_msgSend_crl_stringByApplyingSubstitutions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByApplyingSubstitutions:");
}

id objc_msgSend_crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_numberFormatter_uniquenessTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:numberFormatter:uniquenessTest:");
}

id objc_msgSend_crl_stringByRemovingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByRemovingCharactersInSet:");
}

id objc_msgSend_crl_stringByReplacingInstancesOfCharactersInSet_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByReplacingInstancesOfCharactersInSet:withString:");
}

id objc_msgSend_crl_stringWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithFormat:arguments:");
}

id objc_msgSend_crl_stringWithNormalizedHyphens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithNormalizedHyphens");
}

id objc_msgSend_crl_stringWithNormalizedQuotationMarks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithNormalizedQuotationMarks");
}

id objc_msgSend_crl_stringWithPathRelativeTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithPathRelativeTo:");
}

id objc_msgSend_crl_titleWithMetadataArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_titleWithMetadataArray:");
}

id objc_msgSend_crl_tolerantStringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_tolerantStringByAppendingPathExtension:");
}

id objc_msgSend_crl_uncommentedAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_uncommentedAddress");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTraitCollection");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultImageFileName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultImageFileName");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "escapedPatternForString:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyName");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatDescriptions");
}

id objc_msgSend_getCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCharacters:");
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCharacters:range:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "givenName");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:description:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_format_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:format:args:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCharacters:length:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPattern:options:error:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAtEnd");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isQAFatalAssertionsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isQAFatalAssertionsEnabled");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastThrottleCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastThrottleCheck");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:");
}

id objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromPersonNameComponents:style:options:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataItemsFromArray_filteredByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataItemsFromArray:filteredByIdentifier:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "model");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nativeScale");
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "naturalSize");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectWithItemProviderData_typeIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithItemProviderData:typeIdentifier:error:");
}

id objc_msgSend_p_crl_uncachedScreenClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_crl_uncachedScreenClass");
}

id objc_msgSend_p_logItemProviderError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_logItemProviderError:error:");
}

id objc_msgSend_p_makeEmptyStringCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_makeEmptyStringCharacterSet");
}

id objc_msgSend_p_performBlockIgnoringAssertions_onlyFatal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:");
}

id objc_msgSend_p_stringIsConsideredEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_stringIsConsideredEmpty:");
}

id objc_msgSend_packedBacktraceString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packedBacktraceString");
}

id objc_msgSend_packedBacktraceStringWithReturnAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packedBacktraceStringWithReturnAddresses:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFilenameExtension");
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredTransform");
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "punctuationCharacterSet");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:");
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
}

id objc_msgSend_rangeOfComposedCharacterSequencesForRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:range:");
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeValue");
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredTypeIdentifiers");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_resourceValuesForKeys_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceValuesForKeys:error:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scanCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanCharactersFromSet:intoString:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanLocation");
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setCaseSensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaseSensitive:");
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCharactersToBeSkipped:");
}

id objc_msgSend_setCurrentTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTraitCollection:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLastThrottleCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastThrottleCheck:");
}

id objc_msgSend_setMediaUTI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaUTI:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setThrottleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThrottleCount:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_simulateCrashWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateCrashWithMessage:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCharacters:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strongToStrongObjectsMapTable");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_suggestedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedName");
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemName");
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemVersion");
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryDirectory");
}

id objc_msgSend_throttleCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "throttleCount");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_tracksWithMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tracksWithMediaCharacteristic:");
}

id objc_msgSend_tracksWithMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tracksWithMediaType:");
}

id objc_msgSend_traitCollectionWithUserInterfaceLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithUserInterfaceLevel:");
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithIdentifier:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithRange:");
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalSizeClass");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceCharacterSet");
}
