@implementation WFWebPageToFilterText

- (id)rawPlainText
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", kWFWebPageToFilterText_Signature);
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n%@\n"), kWFWebPageToFilterText_AdWord, WFWebPageToTrainingText_Category1);
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_pageTitle, kWFWebPageToFilterText_Title, 15));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_tags, kWFWebPageToFilterText_Tags, 5));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagDescription, kWFWebPageToFilterText_Description, 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagKeywords, kWFWebPageToFilterText_Keywords, 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_imageAltsText, kWFWebPageToFilterText_ImageAlts));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_linkTitlesText, kWFWebPageToFilterText_LinkTitles));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageContent, kWFWebPageToFilterText_PageContent));
  return v3;
}

- (BOOL)isWorthAnalyzingWithEvidence:(int *)a3 message:(id *)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *v12;
  BOOL result;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  v7 = -[WFWebPageDecorator pageContent](self, "pageContent");
  v8 = objc_msgSend(v7, "length");
  if (v8 <= 0x3B
    && !objc_msgSend(-[WFWebPageDecorator images](self, "images"), "count")
    && (unint64_t)objc_msgSend(-[WFWebPageDecorator scriptBlocks](self, "scriptBlocks"), "count") <= 3
    && (unint64_t)objc_msgSend(-[WFWebPageDecorator metaTagKeywords](self, "metaTagKeywords"), "length") <= 4
    && (unint64_t)objc_msgSend(-[WFWebPageDecorator metaTagDescription](self, "metaTagDescription"), "length") <= 4)
  {
    v9 = (void *)objc_msgSend(v7, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v16 = objc_msgSend(v7, "length");
      v17 = 2048;
      v18 = objc_msgSend(-[WFWebPageDecorator scriptBlocks](self, "scriptBlocks"), "count");
      _os_log_impl(&dword_20CD6C000, v10, OS_LOG_TYPE_INFO, "Page not worth analyzing [pageContent length]:%lu [[self images] count]==0 [[self scriptBlocks] count]:%lu", buf, 0x16u);
    }
    if ((unint64_t)objc_msgSend(v9, "length") <= 0xF)
    {
      result = 0;
      *a3 = 5;
      v12 = CFSTR("too little content found");
      goto LABEL_20;
    }
  }
  if (!-[WFWebPageDecorator hasFrameset](self, "hasFrameset"))
  {
    if (!-[WFWebPageDecorator hasShortRefresh](self, "hasShortRefresh"))
      return 1;
    if (v8 <= 0x7F)
    {
      *a3 = 7;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("it has a short refresh (length:%lu)"), v8);
      goto LABEL_15;
    }
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("it has a short refresh, but there is a lot of content! (length:%lu)"), v8);
LABEL_19:
    v12 = (__CFString *)v14;
    result = 1;
    goto LABEL_20;
  }
  if (v8 > 0x7F)
  {
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("it has a frameset, but there is a lot of content! (length:%lu)"), v8);
    goto LABEL_19;
  }
  *a3 = 6;
  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("it has a frameset (length:%lu)"), v8);
LABEL_15:
  v12 = (__CFString *)v11;
  result = 0;
LABEL_20:
  *a4 = v12;
  return result;
}

- (BOOL)selfRestricted
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(-[WFWebPageDecorator metaTagsLabeled](self, "metaTagsLabeled"), "objectForKey:", CFSTR("rating"));
  if (v3 && !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("RTA-5042-1996-1400-1577-RTA")))
    return 1;
  v4 = -[WFWebPageDecorator metaTagsUnlabeled](self, "metaTagsUnlabeled");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_msgSend(v9, "rangeOfString:options:", CFSTR("SS~~"), 1);
      if (v10)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_5;
        return 0;
      }
    }
    if (v9)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v9);
      v12 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = 0;
      v15 = 0;
      while ((objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("SS~~"), 0) & 1) != 0
           || objc_msgSend(v11, "scanString:intoString:", CFSTR("SS~~"), 0))
      {
        objc_msgSend(v11, "scanString:intoString:", CFSTR("SS~~"), 0);
        if (!objc_msgSend(v11, "scanUpToString:intoString:", CFSTR(" "), &v16)
          || !objc_msgSend(v11, "scanInt:", &v15))
        {
          break;
        }
        v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
        objc_msgSend(v12, "setObject:forKey:", v13, v16);
      }
      if ((int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("000")), "intValue") > 4
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("001")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("002")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("003")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("004")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("005")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("007")), "intValue") > 4
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("008")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("009")), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("00A")), "intValue") > 5)
      {
        return 1;
      }
    }
  }
  return 0;
}

- (id)URLFuzzyWithWordLength:(int)a3
{
  uint64_t v3;
  NSString *v4;
  unint64_t v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v4 = -[WFWebPageDecorator URLString](self, "URLString");
  v5 = -[NSString length](v4, "length");
  if (v5 < (int)v3 + 7)
    return &stru_24C583DA8;
  if (v5 >= 0x1B)
    v7 = 20;
  else
    v7 = v5 - 7;
  return -[NSString WF_fuzzyStringWithWordLength:](-[NSString substringWithRange:](v4, "substringWithRange:", 7, v7), "WF_fuzzyStringWithWordLength:", v3);
}

- (id)URLFuzzyForFilter
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_opt_new();
  v4 = 3;
  do
  {
    objc_msgSend(v3, "appendString:", -[WFWebPageToFilterText URLFuzzyWithWordLength:](self, "URLFuzzyWithWordLength:", v4));
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 7);
  return v3;
}

@end
