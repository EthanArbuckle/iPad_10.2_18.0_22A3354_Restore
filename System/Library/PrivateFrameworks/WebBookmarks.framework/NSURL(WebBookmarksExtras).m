@implementation NSURL(WebBookmarksExtras)

- (uint64_t)_webBookmarks_isHTTPFamilyURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "_webBookmarks_hasCaseInsensitivePrefix:", CFSTR("http:")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "_webBookmarks_hasCaseInsensitivePrefix:", CFSTR("https:"));

  return v2;
}

@end
