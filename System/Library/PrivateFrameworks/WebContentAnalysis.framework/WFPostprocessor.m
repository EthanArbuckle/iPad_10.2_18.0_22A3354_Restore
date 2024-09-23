@implementation WFPostprocessor

+ (_NSRange)rangeOfFirstHTMLTag:(id)a3 searchRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v7 = objc_msgSend(a3, "length");
  v8 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("<"), 0, location, length);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v8;
    v12 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR(">"), 0, v8 + v9, v7 - (v8 + v9));
    v14 = v12 - v11;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v14 = 0;
    v9 = v14 + v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v11;
  }
  v15 = v10;
  result.length = v9;
  result.location = v15;
  return result;
}

+ (id)postprocessPlainTextWebPage:(id)a3
{
  id v3;

  v3 = +[WFPostprocessor normalizeStrippedHTML:](WFPostprocessor, "normalizeStrippedHTML:", +[WFPostprocessor lightweightStripHTMLTags:](WFPostprocessor, "lightweightStripHTMLTags:", a3));
  return (id)objc_msgSend((id)objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet")), "componentsJoinedByString:", &stru_24C583DA8);
}

+ (id)lightweightStripHTMLTagsForLine:(id)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(a3, "length");
  if (v6 >= 2)
  {
    v7 = v6;
    v8 = 0;
    v9 = v6;
    while (1)
    {
      v10 = objc_msgSend(a1, "rangeOfFirstHTMLTag:searchRange:", a3, v8, v9);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v12 = v10;
      v13 = v11;
      objc_msgSend(v5, "appendString:", objc_msgSend(a3, "substringWithRange:", v8, v10 - v8));
      objc_msgSend(v5, "appendString:", CFSTR(" "));
      v8 = v12 + v13;
      v9 = v7 - (v12 + v13);
      if (v9 <= 1)
        return v5;
    }
    objc_msgSend(v5, "appendString:", objc_msgSend(a3, "substringWithRange:", v8, v9));
  }
  return v5;
}

+ (id)lightweightStripHTMLTags:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "appendString:", objc_msgSend(a1, "lightweightStripHTMLTagsForLine:", objc_msgSend(v6, "objectAtIndex:", i)));
      objc_msgSend(v5, "appendString:", CFSTR("\n"));
    }
  }
  return v5;
}

+ (id)normalizeStrippedHTML:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "WF_stringByReplacingString:withString:", CFSTR("_"), CFSTR(" ")), "WF_stringByReplacingString:withString:", CFSTR("-"), CFSTR(" ")), "WF_stringByReplacingString:withString:", CFSTR("<"), CFSTR(" ")), "WF_stringByReplacingString:withString:", CFSTR(">"), CFSTR(" "));
}

+ (id)adultWebSiteTagging:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "WF_stringByReplacingString:withString:", CFSTR("2257"), CFSTR("TwoTwoFiveSeven (2257)")), "WF_stringByReplacingString:withString:", CFSTR("U.S.C"), CFSTR("UnitedStatesCode(U S C)")), "WF_stringByReplacingString:withString:", CFSTR("USC"), CFSTR("UnitedStatesCode (U S C)")), "WF_stringByReplacingString:withString:", CFSTR("18"), CFSTR("OneEight"));
}

@end
