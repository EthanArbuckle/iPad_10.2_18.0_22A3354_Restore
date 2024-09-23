@implementation CRLAudioRepAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLAudioRep");
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
  v5 = (void *)objc_opt_class(CRLAudioRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "movieItem"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility _crlaxMovieInfo](self, "_crlaxMovieInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxDurationDescription"));

  if (!objc_msgSend(v6, "length"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "movieAssetPayload"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filename"));

    v6 = (void *)v18;
  }
  v19 = __CRLAccessibilityStringForVariables(1, v5, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return (NSString *)v20;
}

- (NSString)crlaxValue
{
  void *v2;
  void *v3;

  if (-[CRLAudioRepAccessibility crlaxIsPlaying](self, "crlaxIsPlaying"))
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playerControllerForcingCreationIfNotPreExisting"));

  v5 = (void *)objc_opt_class(CRLAVPlayerControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLAVPlayerControllerAccessibility *)v8;
}

- (BOOL)crlaxCanPlay
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isPlayable");

  return v3;
}

- (BOOL)crlaxIsPlaying
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (void)crlaxTogglePlayback
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "i_togglePlayback");

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
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

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRepAccessibility;
  return UIAccessibilityTraitStartsMediaSession | -[CRLCanvasRepAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (id)accessibilityHint
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLAudioRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityHint](&v12, "accessibilityHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!-[CRLAudioRepAccessibility _isInQuickSelectMode](self, "_isInQuickSelectMode")
    && -[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v6 = objc_msgSend(v5, "i_playButtonFitsInFrame");

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Double tap to show full-screen preview");
      goto LABEL_9;
    }
    if (-[CRLAudioRepAccessibility crlaxIsPlaying](self, "crlaxIsPlaying"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Double tap to pause audio.");
LABEL_9:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, 0, 0));

      v4 = (void *)v10;
      return v4;
    }
    if (-[CRLAudioRepAccessibility crlaxCanPlay](self, "crlaxCanPlay"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Double tap to play audio.");
      goto LABEL_9;
    }
  }
  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLAudioRepAccessibility;
  if (-[CRLCanvasRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction"))
    return 1;
  else
    return -[CRLAudioRepAccessibility crlaxCanPlay](self, "crlaxCanPlay");
}

- (BOOL)accessibilityActivate
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v8;

  if (!-[CRLAudioRepAccessibility _isInQuickSelectMode](self, "_isInQuickSelectMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRepAccessibility;
    if (!-[CRLCanvasRepAccessibility accessibilityActivate](&v8, "accessibilityActivate"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
      v5 = objc_msgSend(v4, "i_playButtonFitsInFrame");

      if ((v5 & 1) != 0)
      {
        v3 = -[CRLAudioRepAccessibility crlaxCanPlay](self, "crlaxCanPlay");
        if (!v3)
          return v3;
        -[CRLAudioRepAccessibility crlaxTogglePlayback](self, "crlaxTogglePlayback");
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
        objc_msgSend(v6, "enterPreviewMode");

      }
    }
    LOBYTE(v3) = 1;
    return v3;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (CGPoint)_accessibilityVisiblePoint
{
  CGFloat v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSString *v55;
  void *v56;
  NSString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSString *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  unsigned int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSString *v82;
  void *v83;
  NSString *v84;
  void *v85;
  double x;
  double v87;
  NSString *v88;
  NSString *v89;
  NSObject *v90;
  NSString *v91;
  NSString *v92;
  NSString *v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  CGFloat log;
  double loga;
  unsigned int logb;
  NSObject *logc;
  NSObject *logd;
  CGPoint point;
  double pointa;
  double v111;
  double v112;
  CGAffineTransform v113;
  _BYTE v114[54];
  CGPoint result;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  -[CRLCanvasRepAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
  point.x = v3;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
  if ((objc_msgSend(v14, "isInGroup") & 1) != 0 || v12 == 0.0)
  {
LABEL_43:

    goto LABEL_44;
  }

  if (v10 != 0.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxInspectorGeometry"));
    v14 = v15;
    if (v15)
    {
      log = v5;
      b = CGAffineTransformIdentity.b;
      c = CGAffineTransformIdentity.c;
      d = CGAffineTransformIdentity.d;
      tx = CGAffineTransformIdentity.tx;
      ty = CGAffineTransformIdentity.ty;
      objc_msgSend(v15, "crlaxAngleInRadians");
      v98 = b;
      v113.a = CGAffineTransformIdentity.a;
      v113.b = b;
      v96 = d;
      v97 = c;
      v113.c = c;
      v113.d = d;
      v94 = ty;
      v95 = tx;
      v113.tx = tx;
      v113.ty = ty;
      CGAffineTransformRotate((CGAffineTransform *)v114, &v113, -v21);
      v22 = *(double *)v114;
      v23 = *(double *)&v114[8];
      v24 = *(double *)&v114[16];
      v25 = *(double *)&v114[24];
      v27 = *(double *)&v114[32];
      v26 = *(double *)&v114[40];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
      v29 = v28;
      if (v28)
      {
        v30 = v26 + v12 * 0.25 * v25 + v23 * (v10 * 0.5);
        v31 = v27 + v12 * 0.25 * v24 + v22 * (v10 * 0.5);
        objc_msgSend(v28, "crlaxViewScale");
        v113.a = CGAffineTransformIdentity.a;
        v113.b = v98;
        v113.c = v97;
        v113.d = v96;
        v113.tx = v95;
        v113.ty = v94;
        CGAffineTransformScale((CGAffineTransform *)v114, &v113, v32, v32);
        pointa = *(double *)&v114[32] + v30 * *(double *)&v114[16] + *(double *)v114 * v31;
        loga = *(double *)&v114[40] + v30 * *(double *)&v114[24] + *(double *)&v114[8] * v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
        v34 = v33;
        if (v33)
        {
          objc_msgSend(v33, "transform");
          v35 = v112;
          objc_msgSend(v34, "transform");
          v36 = v111;
        }
        else
        {
          v36 = 0.0;
          v35 = 0.0;
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
        objc_msgSend(v37, "crlaxScreenPointFromUnscaledCanvas:", v35, v36);
        v39 = v38;
        v41 = v40;

        v113.a = CGAffineTransformIdentity.a;
        v113.b = v98;
        v113.c = v97;
        v113.d = v96;
        v113.tx = v95;
        v113.ty = v94;
        CGAffineTransformTranslate((CGAffineTransform *)v114, &v113, v39, v41);
        point = (CGPoint)vaddq_f64(*(float64x2_t *)&v114[32], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v114[16], loga), *(float64x2_t *)v114, pointa));
        -[CRLCanvasRepAccessibility accessibilityFrame](self, "accessibilityFrame");
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v49 = v48;
        -[CRLCanvasRepAccessibility accessibilityFrame](self, "accessibilityFrame");
        if (!CGRectContainsPoint(v116, point))
        {
          v50 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124AC18);
          v51 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            logc = v51;
            v88 = NSStringFromCGPoint(point);
            v101 = (void *)objc_claimAutoreleasedReturnValue(v88);
            v120.origin.x = v43;
            v120.origin.y = v45;
            v120.size.width = v47;
            v120.size.height = v49;
            v89 = NSStringFromCGRect(v120);
            v99 = (void *)objc_claimAutoreleasedReturnValue(v89);
            *(_DWORD *)v114 = 67110402;
            *(_DWORD *)&v114[4] = v50;
            *(_WORD *)&v114[8] = 2082;
            *(_QWORD *)&v114[10] = "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]";
            *(_WORD *)&v114[18] = 2082;
            *(_QWORD *)&v114[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessi"
                                   "bility/iOS/CRLAudioRepAccessibility+iOS.m";
            *(_WORD *)&v114[28] = 1024;
            *(_DWORD *)&v114[30] = 143;
            *(_WORD *)&v114[34] = 2112;
            *(_QWORD *)&v114[36] = v101;
            *(_WORD *)&v114[44] = 2112;
            *(_QWORD *)&v114[46] = v99;
            _os_log_error_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to compute an accessibilityVisiblePoint but it was outside the accessibilityFrame. (Point: %@, frame: %@)", v114, 0x36u);

          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124AC38);
          v52 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE87A4(v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLAudioRepAccessibility+iOS.m"));
          v55 = NSStringFromCGPoint(point);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v117.origin.x = v43;
          v117.origin.y = v45;
          v117.size.width = v47;
          v117.size.height = v49;
          v57 = NSStringFromCGRect(v117);
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v53, v54, 143, 0, "Attempted to compute an accessibilityVisiblePoint but it was outside the accessibilityFrame. (Point: %@, frame: %@)", v56, v58);

        }
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility accessibilityPath](self, "accessibilityPath"));
        v60 = v59;
        if (v59 && (objc_msgSend(v59, "containsPoint:", point) & 1) == 0)
        {
          logb = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124AC58);
          v61 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v90 = v61;
            v91 = NSStringFromCGPoint(point);
            v102 = (void *)objc_claimAutoreleasedReturnValue(v91);
            *(_DWORD *)v114 = 67110402;
            *(_DWORD *)&v114[4] = logb;
            *(_WORD *)&v114[8] = 2082;
            *(_QWORD *)&v114[10] = "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]";
            *(_WORD *)&v114[18] = 2082;
            *(_QWORD *)&v114[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessi"
                                   "bility/iOS/CRLAudioRepAccessibility+iOS.m";
            *(_WORD *)&v114[28] = 1024;
            *(_DWORD *)&v114[30] = 149;
            *(_WORD *)&v114[34] = 2112;
            *(_QWORD *)&v114[36] = v102;
            *(_WORD *)&v114[44] = 2112;
            *(_QWORD *)&v114[46] = v60;
            _os_log_error_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to compute an accessibilityVisiblePoint but it was outside the non-nil accessibilityPath. (Point: %@, path: %@)", v114, 0x36u);

          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124AC78);
          v62 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE87A4(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLAudioRepAccessibility+iOS.m"));
          v65 = NSStringFromCGPoint(point);
          v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 149, 0, "Attempted to compute an accessibilityVisiblePoint but it was outside the non-nil accessibilityPath. (Point: %@, path: %@)", v66, v60);

        }
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
        v68 = objc_msgSend(v67, "i_playButtonFitsInFrame");

        if (v68)
        {
          -[CRLAudioRepAccessibility _accessibilityFrameOfPlayPauseButton](self, "_accessibilityFrameOfPlayPauseButton");
          v70 = v69;
          v72 = v71;
          v74 = v73;
          v76 = v75;
          -[CRLAudioRepAccessibility _accessibilityFrameOfPlayPauseButton](self, "_accessibilityFrameOfPlayPauseButton");
          if (CGRectContainsPoint(v118, point))
          {
            v77 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124AC98);
            v78 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              logd = v78;
              v92 = NSStringFromCGPoint(point);
              v103 = (void *)objc_claimAutoreleasedReturnValue(v92);
              v121.origin.x = v70;
              v121.origin.y = v72;
              v121.size.width = v74;
              v121.size.height = v76;
              v93 = NSStringFromCGRect(v121);
              v100 = (void *)objc_claimAutoreleasedReturnValue(v93);
              *(_DWORD *)v114 = 67110402;
              *(_DWORD *)&v114[4] = v77;
              *(_WORD *)&v114[8] = 2082;
              *(_QWORD *)&v114[10] = "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]";
              *(_WORD *)&v114[18] = 2082;
              *(_QWORD *)&v114[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Acces"
                                     "sibility/iOS/CRLAudioRepAccessibility+iOS.m";
              *(_WORD *)&v114[28] = 1024;
              *(_DWORD *)&v114[30] = 156;
              *(_WORD *)&v114[34] = 2112;
              *(_QWORD *)&v114[36] = v103;
              *(_WORD *)&v114[44] = 2112;
              *(_QWORD *)&v114[46] = v100;
              _os_log_error_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to compute an accessibilityVisiblePoint but it was inside of the play/pause button. (Point: %@, button frame: %@)", v114, 0x36u);

            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124ACB8);
            v79 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE87A4(v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLAudioRepAccessibility+iOS.m"));
            v82 = NSStringFromCGPoint(point);
            v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
            v119.origin.x = v70;
            v119.origin.y = v72;
            v119.size.width = v74;
            v119.size.height = v76;
            v84 = NSStringFromCGRect(v119);
            v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v80, v81, 156, 0, "Attempted to compute an accessibilityVisiblePoint but it was inside of the play/pause button. (Point: %@, button frame: %@)", v83, v85);

          }
        }
        log = point.y;

      }
      v5 = log;
    }
    goto LABEL_43;
  }
LABEL_44:
  x = point.x;
  v87 = v5;
  result.y = v87;
  result.x = x;
  return result;
}

- (CGRect)_accessibilityFrameOfPlayPauseButton
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioImageRenderable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  objc_msgSend(v4, "accessibilityFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_isInQuickSelectMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));
  v6 = objc_msgSend(v5, "isCurrentlyInQuickSelectMode");

  return v6;
}

@end
