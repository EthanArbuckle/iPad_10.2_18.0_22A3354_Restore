@implementation CRLMovieRepAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLMovieRep");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasRepAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLMovieRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)crlaxTogglePlayback
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100039828;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (NSString)crlaxLabel
{
  return -[CRLMovieRepAccessibility crlaxMovieLabel](self, "crlaxMovieLabel");
}

- (NSString)crlaxMovieLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "movieItem"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility _crlaxMovieInfo](self, "_crlaxMovieInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxDurationDescription"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  if (!objc_msgSend(v6, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "movieAssetPayload"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filename"));

    v6 = (void *)v17;
  }
  v18 = __CRLAccessibilityStringForVariables(1, v5, v10, v11, v12, v13, v14, v15, (uint64_t)v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  return (NSString *)v19;
}

- (NSString)crlaxValue
{
  void *v2;
  void *v3;

  if (-[CRLMovieRepAccessibility crlaxIsPlaying](self, "crlaxIsPlaying"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("playing"), 0, 0));

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)crlaxIsPlayable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isPlayable");

  return v3;
}

- (BOOL)crlaxIsPlaying
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (id)crlaxKnobLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Movie"), 0, 0));

  return v3;
}

- (BOOL)crlaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (CRLAVPlayerControllerAccessibility)crlaxPlayerControllerForcingCreationIfNotPreExisting
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playerControllerForcingCreationIfNotPreExisting"));

  v5 = (void *)objc_opt_class(CRLAVPlayerControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLAVPlayerControllerAccessibility *)v8;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "movieItem"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v3, "addObject:", v6);
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v3, "addObject:", v7);
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (CRLMovieItemAccessibility)_crlaxMovieInfo
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "movieItem"));

  v5 = (void *)objc_opt_class(CRLMovieItemAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLMovieItemAccessibility *)v8;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRLMovieRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityHint](&v16, "accessibilityHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Double tap to play."), 0, 0));

  }
  else
  {
    v12 = 0;
  }
  v13 = __CRLAccessibilityStringForVariables(1, v12, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLMovieRepAccessibility;
  if (-[CRLCanvasRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction"))
    return 1;
  else
    return -[CRLMovieRepAccessibility crlaxIsPlayable](self, "crlaxIsPlayable");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v9;
  unsigned __int8 v10;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
  v7 = objc_msgSend(v6, "isCurrentlyInQuickSelectMode");

  if ((v7 & 1) != 0)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
  if (objc_msgSend(v9, "crlaxIsSelected"))
  {
    v10 = -[CRLMovieRepAccessibility crlaxIsPlayable](self, "crlaxIsPlayable");

    if ((v10 & 1) != 0)
    {
      -[CRLMovieRepAccessibility crlaxTogglePlayback](self, "crlaxTogglePlayback");
      return 1;
    }
  }
  else
  {

  }
  v11.receiver = self;
  v11.super_class = (Class)CRLMovieRepAccessibility;
  return -[CRLCanvasRepAccessibility accessibilityActivate](&v11, "accessibilityActivate");
}

@end
