@implementation PHAsset

- (NSString)crlaxLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset crlaxMediaSubtypeName](self, "crlaxMediaSubtypeName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset crlaxMediaTypeName](self, "crlaxMediaTypeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v3, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset crlaxFriendlyFilename](self, "crlaxFriendlyFilename"));
  v13 = __CRLAccessibilityStringForVariables(1, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return (NSString *)v14;
}

- (NSString)crlaxFriendlyFilename
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char v11;

  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("filename")));
  v4 = (objc_class *)objc_opt_class(NSString, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v11)
    abort();
  v7 = (void *)v6;

  v8 = CRLAccessibilityFriendlyFilename(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSString *)v9;
}

- (int64_t)crlaxMediaType
{
  return (int64_t)-[PHAsset crlaxUnsignedIntegerValueForKey:](self, "crlaxUnsignedIntegerValueForKey:", CFSTR("mediaType"));
}

- (unint64_t)crlaxMediaSubtype
{
  return (unint64_t)-[PHAsset crlaxUnsignedIntegerValueForKey:](self, "crlaxUnsignedIntegerValueForKey:", CFSTR("mediaSubtypes"));
}

- (NSString)crlaxMediaTypeName
{
  unint64_t v2;
  id v3;
  void *v4;

  v2 = -[PHAsset crlaxMediaType](self, "crlaxMediaType");
  if (v2 > 3)
  {
    v4 = 0;
  }
  else
  {
    v3 = CRLAccessibilityLocalizedString(off_10122D388[v2]);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  return (NSString *)v4;
}

- (NSString)crlaxMediaSubtypeName
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = -[PHAsset crlaxMediaSubtype](self, "crlaxMediaSubtype");
  if ((v4 & 2) != 0)
  {
    v5 = CRLAccessibilityLocalizedString(CFSTR("photos.asset.media.subtype.hdr"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v3, "appendString:", v6);

  }
  if ((v4 & 1) != 0)
  {
    v7 = CFSTR("photos.asset.media.subtype.panorama");
    goto LABEL_7;
  }
  if ((v4 & 0x40000) != 0)
  {
    v7 = CFSTR("photos.asset.media.subtype.timelapse");
LABEL_7:
    v8 = CRLAccessibilityLocalizedString(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v3, "appendString:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));

  return (NSString *)v10;
}

@end
