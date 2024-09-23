@implementation CRLCanvasMovieKnobAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLMovieKnob");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasKnobAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLCanvasMovieKnobAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLMovieRepAccessibility)crlaxParentRepForKnob
{
  CRLCanvasRepAccessibility *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasMovieKnobAccessibility;
  v2 = -[CRLCanvasKnobAccessibility crlaxParentRepForKnob](&v10, "crlaxParentRepForKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_opt_class(CRLMovieRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v11)
    abort();
  v8 = (void *)v7;

  return (CRLMovieRepAccessibility *)v8;
}

- (id)crlaxLabel
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLCanvasMovieKnobAccessibility crlaxIsPlaying](self, "crlaxIsPlaying");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Pause movie");
  else
    v5 = CFSTR("Play movie");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (id)crlaxUserInputLabels
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v9;

  v2 = -[CRLCanvasMovieKnobAccessibility crlaxIsPlaying](self, "crlaxIsPlaying");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Pause");
  else
    v5 = CFSTR("Play");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (id)crlaxValue
{
  return 0;
}

- (BOOL)crlaxIsPlaying
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasMovieKnobAccessibility crlaxParentRepForKnob](self, "crlaxParentRepForKnob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));
  v4 = objc_msgSend(v3, "isPlaying");

  return v4;
}

@end
