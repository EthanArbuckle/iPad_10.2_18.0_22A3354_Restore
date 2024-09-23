@implementation CRLMovieItemAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLMovieItem");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLBoardItemAccessibility, a2);
}

- (BOOL)crlaxIsAudioOnly
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieItemAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isAudioOnly");

  return v3;
}

- (double)crlaxDuration
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieItemAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v3, "endTime");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieItemAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v6, "startTime");
  v8 = v5 - v7;

  return v8;
}

- (NSString)crlaxDurationDescription
{
  double v2;

  -[CRLMovieItemAccessibility crlaxDuration](self, "crlaxDuration");
  return (NSString *)CRLAccessibilityStringForTimeInterval(1, v2);
}

- (id)crlaxTypeDescription
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLMovieItemAccessibility crlaxIsAudioOnly](self, "crlaxIsAudioOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Audio");
  else
    v5 = CFSTR("Movie");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

@end
