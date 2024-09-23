@implementation WFJavascriptStripper

+ (id)getStringsFromLine:(id)a3 withTokenCharacter:(id)a4
{
  void *v6;
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

  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(a3, "length");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = v7;
    do
    {
      v11 = objc_msgSend(a3, "rangeOfString:options:range:", a4, 0, v9, v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v13 = v11;
      v14 = v11 + v12;
      v15 = objc_msgSend(a3, "rangeOfString:options:range:", a4, 0, v11 + v12, v8 - (v11 + v12));
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v17 = v15;
      v18 = v16;
      objc_msgSend(v6, "appendFormat:", CFSTR("%@,"), objc_msgSend(a3, "substringWithRange:", v14, v15 - (v16 + v13)));
      v9 = v17 + v18;
      v10 = v8 - (v17 + v18);
    }
    while (v8 != v17 + v18);
  }
  return v6;
}

+ (id)javascriptStripLine:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a1, "getStringsFromLine:withTokenCharacter:", a3, CFSTR("\"));
  v6 = objc_msgSend(a1, "getStringsFromLine:withTokenCharacter:", a3, CFSTR("'"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, v6);
}

+ (id)getJavascriptLines:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "componentsSeparatedByString:", CFSTR("\n")));
  }
  return v4;
}

+ (id)stripJavascript:(id)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(a1, "getJavascriptLines:", +[WFPostprocessor lightweightStripHTMLTags:](WFPostprocessor, "lightweightStripHTMLTags:", a3));
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_msgSend(a1, "javascriptStripLine:", objc_msgSend(v6, "objectAtIndex:", v7));
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v5, "appendString:", v8);
        objc_msgSend(v5, "appendString:", CFSTR("\n"));
      }
      ++v7;
    }
    while (objc_msgSend(v6, "count") > v7);
  }
  return v5;
}

@end
