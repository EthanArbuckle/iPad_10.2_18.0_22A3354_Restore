@implementation SXOEmbedResponse

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("authorName")) & 1) != 0)
  {
    v4 = CFSTR("author_name");
LABEL_17:

    goto LABEL_18;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("authorURL")) & 1) != 0)
  {
    v4 = CFSTR("author_url");
    goto LABEL_17;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("providerName")) & 1) != 0)
  {
    v4 = CFSTR("provider_name");
    goto LABEL_17;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("providerURL")) & 1) != 0)
  {
    v4 = CFSTR("provider_url");
    goto LABEL_17;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("cacheAge")) & 1) != 0)
  {
    v4 = CFSTR("cache_age");
    goto LABEL_17;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("thumbnailURL")) & 1) != 0)
  {
    v4 = CFSTR("thumbnail_url");
    goto LABEL_17;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("thumbnailWidth")) & 1) != 0)
  {
    v4 = CFSTR("thumbnail_width");
    goto LABEL_17;
  }
  v4 = v3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("thumbnailHeight")))
  {
    v4 = CFSTR("thumbnail_height");
    goto LABEL_17;
  }
LABEL_18:

  return v4;
}

- (double)cacheAgeWithValue:(id)a3 withType:(int)a4
{
  double result;

  if (a4 != 2)
    return 978307200.0;
  objc_msgSend(a3, "doubleValue");
  return result;
}

- (CGSize)thumbnailSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SXOEmbedResponse thumbnailWidth](self, "thumbnailWidth");
  v4 = v3;
  -[SXOEmbedResponse thumbnailHeight](self, "thumbnailHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

@end
