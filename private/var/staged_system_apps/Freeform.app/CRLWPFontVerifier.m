@implementation CRLWPFontVerifier

+ (id)sharedInstance
{
  if (qword_101414D20 != -1)
    dispatch_once(&qword_101414D20, &stru_101233FE8);
  return (id)qword_101414D18;
}

+ (NSString)missingFontName
{
  return (NSString *)CFSTR("Helvetica");
}

- (BOOL)isFontWithPostscriptNameInstalled:(id)a3
{
  __CFString *v3;
  void *v4;
  unsigned __int8 v5;
  unsigned int v6;
  CTFontOptions v7;
  const __CTFont *v8;
  const __CTFont *v9;
  __CFString *v10;
  void *v11;

  v3 = (__CFString *)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontVerifier missingFontName](CRLWPFontVerifier, "missingFontName"));
  v5 = -[__CFString containsString:](v3, "containsString:", v4);

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    if (+[CRLWPFont isSystemFontName:](CRLWPFont, "isSystemFontName:", v3))
      v7 = 1025;
    else
      v7 = 1;
    v8 = CTFontCreateWithNameAndOptions(v3, 0.0, 0, v7);
    if (v8)
    {
      v9 = v8;
      v10 = (__CFString *)CTFontCopyPostScriptName(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontVerifier missingFontName](CRLWPFontVerifier, "missingFontName"));
      v6 = -[__CFString isEqualToString:](v10, "isEqualToString:", v11) ^ 1;

      CFRelease(v9);
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (BOOL)isCloudKitDownloadableFontName:(id)a3
{
  return objc_msgSend(&off_1012CAB70, "containsObject:", a3);
}

- (BOOL)isCoreTextDownloadableFontName:(id)a3
{
  id v3;
  const __CFDictionary *v4;
  const __CTFontDescriptor *v5;
  CFArrayRef MatchingFontDescriptors;
  CFArrayRef v7;
  BOOL v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v10[0] = kCTFontNameAttribute;
  v10[1] = kCTFontDownloadableAttribute;
  v11[0] = a3;
  v11[1] = &__kCFBooleanTrue;
  v3 = a3;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  v5 = CTFontDescriptorCreateWithAttributes(v4);
  MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v5, 0);
  v7 = MatchingFontDescriptors;
  if (MatchingFontDescriptors)
    v8 = -[__CFArray count](MatchingFontDescriptors, "count") != 0;
  else
    v8 = 0;
  CFRelease(v5);

  return v8;
}

- (BOOL)isDownloadableFontName:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[CRLWPFontVerifier isCloudKitDownloadableFontName:](self, "isCloudKitDownloadableFontName:", v4))
    v5 = 1;
  else
    v5 = -[CRLWPFontVerifier isCoreTextDownloadableFontName:](self, "isCoreTextDownloadableFontName:", v4);

  return v5;
}

@end
