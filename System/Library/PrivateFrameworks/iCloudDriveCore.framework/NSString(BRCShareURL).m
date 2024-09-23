@implementation NSString(BRCShareURL)

- (id)brc_mangledNameFromURLFragment:()BRCShareURL
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR(" "), 0, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");

    v5 = (void *)v7;
  }
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR(":"), 0, 0, objc_msgSend(v5, "length"));
  return v5;
}

@end
