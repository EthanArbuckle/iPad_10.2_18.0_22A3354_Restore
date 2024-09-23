BOOL _WebFilterIsActive()
{
  NSString *v0;
  NSObject *v1;
  WFUserSettings *v2;
  WFUserSettings *v3;
  _BOOL8 v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = NSUserName();
  if ((objc_msgSend(&unk_24C589990, "containsObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier")) & 1) != 0)
  {
    v1 = __WFDefaultLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_20CD6C000, v1, OS_LOG_TYPE_INFO, "_WebFilterIsActive is bypassing filter", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    v2 = -[WFUserSettings initWithUserName:]([WFUserSettings alloc], "initWithUserName:", v0);
    if (v2)
    {
      v3 = v2;
      v4 = -[WFUserSettings restrictionType](v2, "restrictionType") > 0;

      goto LABEL_7;
    }
  }
  v4 = 0;
LABEL_7:
  v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_20CD6C000, v5, OS_LOG_TYPE_INFO, "_WebFilterIsActive returning: %@", (uint8_t *)&v8, 0xCu);
  }
  return v4;
}

uint64_t __WFDefaultLog()
{
  if (__WFDefaultLog_onceToken != -1)
    dispatch_once(&__WFDefaultLog_onceToken, &__block_literal_global);
  return __WFDefaultLog_log;
}

uint64_t WFDebugLevel()
{
  return gWebFilterDebugLevel;
}

uint64_t WFSetDebugLevel(uint64_t result)
{
  gWebFilterDebugLevel = result;
  return result;
}

uint64_t IndexOfBody(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a1)
  {
    v2 = objc_msgSend(a1, "length");
    v3 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("<body"), 1);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return -1;
    }
    else
    {
      v13 = v3;
      v14 = __WFDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        IndexOfBody_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
      v21 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(">"), 1, v13, v2 - v13);
      return v21 + v22;
    }
  }
  else
  {
    v5 = __WFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      IndexOfBody_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
}

uint64_t DebugHeader(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", CFSTR("/Library/Application Support/Apple/ParentalControls/ContentFiltering/debugpageheader.html"), 4, 0), "WF_stringByReplacingString:withString:", CFSTR("DEBUG_MESSAGE"), objc_msgSend(a4, "WF_stringByReplacingString:withString:", CFSTR(" "), CFSTR("&nbsp;")));
  if (a2)
  {
    v9 = objc_msgSend(a2, "WF_stringByReplacingString:withString:", CFSTR("\n"), CFSTR("<br>\n"));
    if (v9)
      v10 = (const __CFString *)v9;
    else
      v10 = CFSTR("**** Error: strippedPageInHTML is nil <br>");
    v8 = (void *)objc_msgSend(v8, "WF_stringByReplacingString:withString:", CFSTR("STRIPPED_PAGE"), v10);
  }
  if (a3)
  {
    v11 = objc_msgSend((id)objc_msgSend(a3, "WF_stringByReplacingString:withString:", CFSTR(" "), CFSTR("&nbsp;")),
            "WF_stringByReplacingString:withString:",
            CFSTR("\n"),
            CFSTR("<br>\n"));
    if (v11)
      v12 = (const __CFString *)v11;
    else
      v12 = CFSTR("**** Error: wordDumpInHTML is nil <br>");
    v8 = (void *)objc_msgSend(v8, "WF_stringByReplacingString:withString:", CFSTR("WORD_DUMP"), v12);
  }
  if (a5)
    v13 = CFSTR("red");
  else
    v13 = CFSTR("green");
  if (a5)
    v14 = CFSTR("Restricted");
  else
    v14 = CFSTR("Allowed");
  return objc_msgSend((id)objc_msgSend(v8, "WF_stringByReplacingString:withString:", CFSTR("FILTER_FLAG_COLOR"), v13), "WF_stringByReplacingString:withString:", CFSTR("FILTER_MESSAGE"), v14);
}

uint64_t InjectPage(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)a1;
  v7 = DebugHeader(a1, a3, a4, a5, a6);
  if (v6)
  {
    v8 = v7;
    v9 = IndexOfBody(v6);
    if ((v9 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      v11 = objc_msgSend(v6, "substringToIndex:", v9);
      v12 = objc_msgSend(v6, "substringFromIndex:", v10);
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v11, v8, v12);
    }
    v22 = __WFDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      InjectPage_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    v14 = __WFDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      InjectPage_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  return (uint64_t)v6;
}

uint64_t ComposeDebugPageSimple(void *a1, uint64_t a2, void *a3)
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 4);
  v7 = +[WFWebPageDecorator webPageWithString:URLString:](WFWebPageToFilterText, "webPageWithString:URLString:", v6, a2);

  v8 = (void *)objc_msgSend(v7, "pageContent");
  return objc_msgSend((id)ComposeDebugPage(a1, a2, v8, (void *)objc_msgSend(+[WFLSMMap mapFromFilePath:](WFLSMMap, "mapFromFilePath:", +[WFJudge defaultLSMMapPath](WFJudge, "defaultLSMMapPath")), "wordDump:", v8), a3, 1), "dataUsingEncoding:", 4);
}

uint64_t ComposeDebugPage(void *a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xmlCharEncoding v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  int v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = __WFDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v36 = 138412290;
    v37 = a2;
    _os_log_impl(&dword_20CD6C000, v12, OS_LOG_TYPE_INFO, "Composing debug page for:%@", (uint8_t *)&v36, 0xCu);
  }
  v13 = __WFDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    ComposeDebugPage_cold_1((uint64_t)a1, v13, v14, v15, v16, v17, v18, v19);
  v20 = xmlDetectCharEncoding((const unsigned __int8 *)objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"));
  v21 = 4;
  v22 = 8;
  v23 = 3;
  v24 = 1;
  v25 = v20 != XML_CHAR_ENCODING_ASCII;
  if (v20 != XML_CHAR_ENCODING_ASCII)
    v24 = 4;
  if (v20 == XML_CHAR_ENCODING_EUC_JP)
    v25 = 0;
  else
    v23 = v24;
  v26 = v20 != XML_CHAR_ENCODING_SHIFT_JIS && v25;
  if (v20 != XML_CHAR_ENCODING_SHIFT_JIS)
    v22 = v23;
  v27 = v20 != XML_CHAR_ENCODING_8859_2;
  if (v20 == XML_CHAR_ENCODING_8859_2)
    v21 = 9;
  if (v20 == XML_CHAR_ENCODING_8859_1)
  {
    v27 = 0;
    v21 = 5;
  }
  if (v20 <= XML_CHAR_ENCODING_2022_JP)
    v28 = v27;
  else
    v28 = v26;
  if (v20 <= XML_CHAR_ENCODING_2022_JP)
    v29 = v21;
  else
    v29 = v22;
  v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, v29);
  v31 = (void *)v30;
  if (v28 && !v30)
  {
    v32 = __WFDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_20CD6C000, v32, OS_LOG_TYPE_INFO, "NSUTF8StringEncoding encoding doesn't seem to work, trying with NSISOLatin1StringEncoding", (uint8_t *)&v36, 2u);
    }
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 5);
  }
  v33 = v31;
  if (a6 && WFDebugLevel() == 2)
    v31 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "WF_stringByReplacingString:withString:", CFSTR("src"), CFSTR("OFF")), "WF_stringByReplacingString:withString:", CFSTR("SRC"), CFSTR("OFF")), "WF_stringByReplacingString:withString:", CFSTR("background-image"), CFSTR("OFF"));
  return InjectPage((uint64_t)v31, v34, a3, a4, a5, a6);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

unint64_t _NSHTMLEncoding(char *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  CFIndex v12;
  uint64_t v13;
  unint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  CFStringEncoding v17;

  v4 = 0;
  v5 = 8;
  if (a2 > 8)
    v5 = a2;
  v6 = v5 - 8;
  v7 = -1;
  v8 = a1;
  do
  {
    if (!v6)
      return 0;
    v9 = v4 + 8;
    ++v4;
    if (!strncasecmp(v8, "charset=", 8uLL))
      v7 = v9;
    --v6;
    ++v8;
  }
  while (v7 < 0);
  if (v7 + 1 >= a2)
    return 0;
  v10 = 0;
  v11 = &a1[v7];
  v12 = -1;
  v13 = v7;
  do
  {
    if (!v10 && *v11 == 34)
    {
      ++v13;
      if ((v12 & 0x8000000000000000) == 0)
        break;
      goto LABEL_17;
    }
    if (v11[v10] == 34)
      v12 = v7 + v10 - v13;
    if ((v12 & 0x8000000000000000) == 0)
      break;
LABEL_17:
    v14 = v7 + v10++ + 2;
  }
  while (v14 < a2);
  if (v12 >= 1)
  {
    v15 = CFStringCreateWithBytes(0, (const UInt8 *)&a1[v13], v12, 0x201u, 0);
    if (v15)
    {
      v16 = v15;
      v17 = CFStringConvertIANACharSetNameToEncoding(v15);
      CFRelease(v16);
      if (v17 != -1)
        return CFStringConvertEncodingToNSStringEncoding(v17);
    }
  }
  return 0;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t _WFEvaluateVerdict(void *a1, uint64_t *a2)
{
  void *v4;
  uint64_t v5;

  if (a2)
  {
    v4 = (void *)objc_msgSend(a1, "LSMEvaluationResult");
    if (v4)
      v5 = objc_msgSend(v4, "debugDescription");
    else
      v5 = objc_msgSend(a1, "message");
    *a2 = v5;
  }
  return objc_msgSend(a1, "restricted");
}

uint64_t WFIsWebPageExplicit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)objc_msgSend(+[WFJudge defaultJudge](WFJudge, "defaultJudge"), "pronounceOnPageContent:pageURL:debugPage:pageTitle:", a1, a2, 0, a3);
  v6 = v5;
  if (a4)
  {
    v7 = (void *)objc_msgSend(v5, "LSMEvaluationResult");
    if (v7)
      v8 = objc_msgSend(v7, "debugDescription");
    else
      v8 = objc_msgSend(v6, "message");
    *a4 = v8;
  }
  return objc_msgSend(v6, "restricted");
}

uint64_t WFIsWebPageToRestrictForUser(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  NSObject *v38;
  unsigned __int8 v39;

  v9 = +[WFWhitelistUserPreferences defaultWhitelistForUser:](WFWhitelistUserPreferences, "defaultWhitelistForUser:", a1);
  if (!v9)
  {
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      WFIsWebPageToRestrictForUser_cold_4(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  v18 = +[WFJudge defaultJudge](WFJudge, "defaultJudge");
  if (!v18 && (v19 = __WFDefaultLog(), os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)))
  {
    WFIsWebPageToRestrictForUser_cold_3(v19, v20, v21, v22, v23, v24, v25, v26);
    if (a2)
      goto LABEL_9;
  }
  else if (a2)
  {
    goto LABEL_9;
  }
  v27 = __WFDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    WFIsWebPageToRestrictForUser_cold_2(v27);
LABEL_9:
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("https")))
  {
    if (objc_msgSend(v9, "alwaysAllowHTTPS"))
    {
      return objc_msgSend(v9, "alwaysAllowHTTPS") ^ 1;
    }
    else
    {
      v39 = 1;
      v33 = (void *)objc_msgSend(v9, "pronounceOnPageURLString:shouldFilter:", a3, &v39);
      v34 = v33;
      if (a5)
      {
        v35 = (void *)objc_msgSend(v33, "LSMEvaluationResult");
        if (v35)
          v36 = objc_msgSend(v35, "debugDescription");
        else
          v36 = objc_msgSend(v34, "message");
        *a5 = v36;
      }
      v37 = objc_msgSend(v34, "restricted");
      v38 = __WFDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        WFIsWebPageToRestrictForUser_cold_1(&v39, v37, v38);
      if (v39)
        return 1;
      else
        return v37;
    }
  }
  else
  {
    v29 = (void *)objc_msgSend(v18, "pronounceOnPageContent:pageURL:whitelistUserPreferences:debugPage:pageTitle:", a2, a3, v9, 0, a4);
    v30 = v29;
    if (a5)
    {
      v31 = (void *)objc_msgSend(v29, "LSMEvaluationResult");
      if (v31)
        v32 = objc_msgSend(v31, "debugDescription");
      else
        v32 = objc_msgSend(v30, "message");
      *a5 = v32;
    }
    return objc_msgSend(v30, "restricted");
  }
}

uint64_t WFIsURLExplicit(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  void *v8;
  uint64_t result;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v8 = (void *)objc_msgSend((id)objc_msgSend(a1, "scheme"), "lowercaseString");
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("https")) & 1) != 0
    || (result = objc_msgSend(v8, "isEqualToString:", CFSTR("http")), (_DWORD)result))
  {
    v10 = +[WFJudge defaultJudge](WFJudge, "defaultJudge");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a2, 4);
    v12 = (void *)objc_msgSend(v10, "pronounceOnPageContent:pageURL:debugPage:pageTitle:", v11, objc_msgSend(a1, "absoluteString"), 0, a3);

    if (a4)
    {
      v13 = (void *)objc_msgSend(v12, "LSMEvaluationResult");
      if (v13)
        v14 = objc_msgSend(v13, "debugDescription");
      else
        v14 = objc_msgSend(v12, "message");
      *a4 = v14;
    }
    return objc_msgSend(v12, "restricted");
  }
  return result;
}

uint64_t WFIsURLToRestrictForUser(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  void *v10;
  uint64_t result;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v10 = (void *)objc_msgSend((id)objc_msgSend(a2, "scheme"), "lowercaseString");
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("https")) & 1) != 0
    || (result = objc_msgSend(v10, "isEqualToString:", CFSTR("http")), (_DWORD)result))
  {
    v12 = +[WFWhitelistUserPreferences defaultWhitelistForUser:](WFWhitelistUserPreferences, "defaultWhitelistForUser:", a1);
    v13 = +[WFJudge defaultJudge](WFJudge, "defaultJudge");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a3, 4);
    v15 = (void *)objc_msgSend(v13, "pronounceOnPageContent:pageURL:whitelistUserPreferences:debugPage:pageTitle:", v14, objc_msgSend(a2, "absoluteString"), v12, 0, a4);

    if (a5)
    {
      v16 = (void *)objc_msgSend(v15, "LSMEvaluationResult");
      if (v16)
        v17 = objc_msgSend(v16, "debugDescription");
      else
        v17 = objc_msgSend(v15, "message");
      *a5 = v17;
    }
    return objc_msgSend(v15, "restricted");
  }
  return result;
}

uint64_t PreferredLanguageForUserName(uint64_t result)
{
  const __CFString *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  if (!result)
    return result;
  v1 = (const __CFString *)result;
  v2 = __WFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    PreferredLanguageForUserName_cold_8((uint64_t)v1, v2, v3);
  v4 = (id)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x24BDBD568], v1, (CFStringRef)*MEMORY[0x24BDBD570]);
  if (!objc_msgSend(v4, "count"))
  {
    v9 = __WFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      PreferredLanguageForUserName_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WebContentAnalysis.framework"));
  if (!v5)
  {
    v17 = __WFDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      PreferredLanguageForUserName_cold_4(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  v6 = (void *)objc_msgSend(v5, "localizations");
  if (!objc_msgSend(v6, "count"))
  {
    v25 = __WFDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      PreferredLanguageForUserName_cold_5(v25, v26, v27, v28, v29, v30, v31, v32);
    return 0;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v6, v4);
  if (!objc_msgSend(v7, "count"))
  {
    v33 = __WFDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      PreferredLanguageForUserName_cold_6(v33, v34, v35, v36, v37, v38, v39, v40);
    return 0;
  }
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    PreferredLanguageForUserName_cold_7(objc_msgSend(v7, "objectAtIndex:", 0), (uint64_t)v41, v8);
  return objc_msgSend(v7, "objectAtIndex:", 0);
}

void sub_20CD757BC(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      PreferredLanguageForUserName_cold_3((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    objc_end_catch();
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PreferredLanguageForUserName_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
    JUMPOUT(0x20CD75788);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t NS64BaseStringFromString(void *a1)
{
  return objc_msgSend((id)objc_msgSend(a1, "dataUsingEncoding:", 4), "base64EncodedStringWithOptions:", 0);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void IndexOfBody_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CD6C000, a1, a3, "**** Error Trying to find Body tag into a null page", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void IndexOfBody_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CD6C000, a2, a3, "IndexOfBody found body at index:%lu", a5, a6, a7, a8, 0);
}

void InjectPage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CD6C000, a1, a3, "**** Error Trying to inject code into a null page", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void InjectPage_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CD6C000, a1, a3, "Body can't be found, no injection can be made", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ComposeDebugPage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CD6C000, a2, a3, "GuessEncodingForData:%p", a5, a6, a7, a8, 0);
}

void WFIsWebPageToRestrictForUser_cold_1(unsigned __int8 *a1, char a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_20CD6C000, log, OS_LOG_TYPE_DEBUG, "WFIsWebPageToRestrictForUser: https should filter: %d, isRestricted: %d", (uint8_t *)v4, 0xEu);
}

void WFIsWebPageToRestrictForUser_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20CD6C000, log, OS_LOG_TYPE_DEBUG, "WFIsWebPageToRestrictForUser: webpageContent is nil", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void WFIsWebPageToRestrictForUser_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CD6C000, a1, a3, "WFGetPageEvaluation: judge is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void WFIsWebPageToRestrictForUser_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CD6C000, a1, a3, "WFGetPageEvaluation: whitelist is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void PreferredLanguageForUserName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "%{public}s ----- no languagePrefs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void PreferredLanguageForUserName_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "%{public}s ----- returning nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void PreferredLanguageForUserName_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a2, a3, "*** Caught exception: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void PreferredLanguageForUserName_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "%{public}s ----- no framework bundle", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void PreferredLanguageForUserName_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "%{public}s ----- no availableLocs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void PreferredLanguageForUserName_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "%{public}s ----- no preferred locs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void PreferredLanguageForUserName_cold_7(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446466;
  *(_QWORD *)(a2 + 4) = "NSString *PreferredLanguageForUserName(NSString *)";
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, a3, (uint64_t)a3, "%{public}s ----- got preferred loc: %@", (uint8_t *)a2);
}

void PreferredLanguageForUserName_cold_8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "NSString *PreferredLanguageForUserName(NSString *)";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, a2, a3, "%{public}s ----- getting language for: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4_0();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC4E8](*(_QWORD *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC4F0](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x24BDBC4F8](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x24BDBC500](encoding);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC978](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC980](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

LSMMapRef LSMMapCreateFromURL(CFAllocatorRef alloc, CFURLRef file, CFOptionFlags flags)
{
  return (LSMMapRef)MEMORY[0x24BE5EEF0](alloc, file, flags);
}

CFIndex LSMMapGetCategoryCount(LSMMapRef mapref)
{
  return MEMORY[0x24BE5EEF8](mapref);
}

CFDictionaryRef LSMMapGetProperties(LSMMapRef mapref)
{
  return (CFDictionaryRef)MEMORY[0x24BE5EF00](mapref);
}

OSStatus LSMMapWriteToStream(LSMMapRef mapref, LSMTextRef textref, CFWriteStreamRef stream, CFOptionFlags options)
{
  return MEMORY[0x24BE5EF08](mapref, textref, stream, options);
}

LSMResultRef LSMResultCreate(CFAllocatorRef alloc, LSMMapRef mapref, LSMTextRef textref, CFIndex numResults, CFOptionFlags flags)
{
  return (LSMResultRef)MEMORY[0x24BE5EF10](alloc, mapref, textref, numResults, flags);
}

LSMCategory LSMResultGetCategory(LSMResultRef result, CFIndex n)
{
  return MEMORY[0x24BE5EF18](result, n);
}

CFIndex LSMResultGetCount(LSMResultRef result)
{
  return MEMORY[0x24BE5EF20](result);
}

float LSMResultGetScore(LSMResultRef result, CFIndex n)
{
  float v2;

  MEMORY[0x24BE5EF28](result, n);
  return v2;
}

OSStatus LSMTextAddWords(LSMTextRef textref, CFStringRef words, CFLocaleRef locale, CFOptionFlags flags)
{
  return MEMORY[0x24BE5EF30](textref, words, locale, flags);
}

LSMTextRef LSMTextCreate(CFAllocatorRef alloc, LSMMapRef mapref)
{
  return (LSMTextRef)MEMORY[0x24BE5EF38](alloc, mapref);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fnmatch(const char *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDAE408](a1, a2, *(_QWORD *)&a3);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

htmlDocPtr htmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (htmlDocPtr)MEMORY[0x24BEDE5B0](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

xmlCharEncoding xmlDetectCharEncoding(const unsigned __int8 *in, int len)
{
  return MEMORY[0x24BEDE6F0](in, *(_QWORD *)&len);
}

