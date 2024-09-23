@implementation NSString(NSString_XMLEscapingExtensions)

- (id)stringByEscapingXMLEntities
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("&quot;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("&#39;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

- (id)stringByUnescapingXMLEntities
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&amp;"),
    CFSTR("&"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&quot;"),
    CFSTR("\"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&#39;"),
    CFSTR("'"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&lt;"),
    CFSTR("<"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&gt;"),
    CFSTR(">"),
    2,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

@end
