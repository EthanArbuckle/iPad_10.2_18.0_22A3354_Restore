@implementation THWDrawablesWidgetInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWDrawablesWidgetInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (NSString)thaxWidgetDescription
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  Class v9;
  char isKindOfClass;
  const __CFString *v11;
  Class v12;
  char v13;
  Class v14;
  char v15;
  Class v16;
  char v17;
  Class v18;
  char v19;
  Class v20;
  char v21;
  Class v22;
  char v23;
  NSString *v24;
  NSString *v25;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "tsaxAddObjectIfNotNil:", -[THWDrawablesWidgetInfoAccessibility thaxExpandedStageDrawable](self, "thaxExpandedStageDrawable"));
  objc_msgSend(v3, "tsaxAddObjectIfNotNil:", -[THWDrawablesWidgetInfoAccessibility thaxStageDrawable](self, "thaxStageDrawable"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v9 = NSClassFromString(CFSTR("THImageInfo"));
        isKindOfClass = objc_opt_isKindOfClass(v8, v9);
        v11 = CFSTR("widgets.image.roledescription");
        if ((isKindOfClass & 1) != 0)
          goto LABEL_23;
        v12 = NSClassFromString(CFSTR("THWMovieInfo"));
        v13 = objc_opt_isKindOfClass(v8, v12);
        v11 = CFSTR("widgets.movie.roledescription");
        if ((v13 & 1) != 0)
          goto LABEL_23;
        v14 = NSClassFromString(CFSTR("THWKeynoteInfo"));
        v15 = objc_opt_isKindOfClass(v8, v14);
        v11 = CFSTR("widgets.keynote.roledescription");
        if ((v15 & 1) != 0)
          goto LABEL_23;
        v16 = NSClassFromString(CFSTR("THWViewportInfo"));
        v17 = objc_opt_isKindOfClass(v8, v16);
        v11 = CFSTR("widgets.viewport.roledescription");
        if ((v17 & 1) != 0)
          goto LABEL_23;
        v18 = NSClassFromString(CFSTR("THWReviewInfo"));
        v19 = objc_opt_isKindOfClass(v8, v18);
        v11 = CFSTR("widgets.review.roledescription");
        if ((v19 & 1) == 0)
        {
          v20 = NSClassFromString(CFSTR("THWSceneInfo"));
          v21 = objc_opt_isKindOfClass(v8, v20);
          v11 = CFSTR("widgets.3D.roledescription");
          if ((v21 & 1) == 0)
          {
            v22 = NSClassFromString(CFSTR("THWWebInfo"));
            v23 = objc_opt_isKindOfClass(v8, v22);
            v11 = CFSTR("widgets.html.roledescription");
            if ((v23 & 1) == 0)
              continue;
          }
        }
LABEL_23:
        v24 = THAccessibilityLocalizedString((uint64_t)v11);
        if (v24)
          return v24;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v5)
        continue;
      break;
    }
  }
  v25 = THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.unknown.roledescription"));
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Failed to create a description for widget: %@"), v27, v28, v29, v30, v31, (uint64_t)self))abort();
  }
  return v25;
}

- (id)thaxStageDrawable
{
  return -[THWDrawablesWidgetInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("stageDrawable"));
}

- (id)thaxExpandedStageDrawable
{
  return -[THWDrawablesWidgetInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expandedStageDrawable"));
}

@end
