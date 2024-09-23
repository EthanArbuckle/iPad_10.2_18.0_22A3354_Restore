@implementation THImageRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THImageRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDImageRepAccessibility, a2);
}

- (int)thaxPressableAction
{
  return -[THImageRepAccessibility tsaxIntValueForKey:](self, "tsaxIntValueForKey:", CFSTR("pressableAction"));
}

- (BOOL)thaxIsContainedInAudioRep
{
  return -[THImageRepAccessibility thaxParentAudioRep](self, "thaxParentAudioRep") != 0;
}

- (THWAudioRepAccessibility)thaxParentAudioRep
{
  void *v3;

  v3 = (void *)objc_opt_class(THWAudioRepAccessibility);
  return (THWAudioRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
}

- (BOOL)thaxIsPartOfAGallery
{
  return -[THImageRepAccessibility thaxRelatedGalleryRep](self, "thaxRelatedGalleryRep") != 0;
}

- (THWGalleryRepAccessibility)thaxRelatedGalleryRep
{
  void *v3;
  Class v4;
  Class v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  Class v10;
  uint64_t v11;

  v3 = (void *)objc_opt_class(THWPagedCanvasControllerAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxDelegate"), 0, 0);
  if (v4)
  {
    v5 = v4;
    v6 = objc_opt_class(THWGalleryRepAccessibility);
    v7 = -[objc_class thaxDelegate](v5, "thaxDelegate");
    v8 = (void *)v6;
  }
  else
  {
    v9 = (void *)objc_opt_class(THWZoomableCanvasControllerAccessibility);
    v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxDelegate"), 0, 0);
    v11 = objc_opt_class(THWGalleryRepAccessibility);
    v7 = -[objc_class thaxDelegate](v10, "thaxDelegate");
    v8 = (void *)v11;
  }
  return (THWGalleryRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 0, 0);
}

- (NSString)thaxSibilingCaptionText
{
  void *v3;
  Class v4;
  Class v5;
  char isKindOfClass;
  NSString *result;
  id v8;
  NSString *v9;
  uint64_t v10;
  NSString *i;
  uint64_t v12;
  void *v13;
  Class v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_opt_class(TSDContainerRepAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  v5 = NSClassFromString(CFSTR("THWDrawablesWidgetRep"));
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  result = 0;
  if ((isKindOfClass & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(-[objc_class tsaxChildReps](v4, "tsaxChildReps"), "reverseObjectEnumerator", 0);
    result = (NSString *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (NSString *)((char *)i + 1))
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_opt_class(TSWPShapeRepAccessibility);
          v14 = __TSAccessibilityCastAsSafeCategory(v13, v12, 0, 0);
          if (v14)
            return (NSString *)objc_msgSend(objc_msgSend(-[objc_class tsaxContainedRep](v14, "tsaxContainedRep"), "tsaxStorage"), "tsaxString");
        }
        v9 = (NSString *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        result = 0;
        if (v9)
          continue;
        break;
      }
    }
  }
  return result;
}

- (id)tsaxLabel
{
  void *v3;
  Class v4;
  NSString *v5;
  void *v6;
  Class v7;
  Class v8;
  void *v9;
  Class v10;
  Class v11;
  char v13;
  char v14;
  char v15;

  v15 = 0;
  v3 = (void *)objc_opt_class(TSDDrawableInfoAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), 1, &v15);
  if (v15)
    goto LABEL_21;
  v5 = (NSString *)-[objc_class tsaxUserProvidedDescription](v4, "tsaxUserProvidedDescription");
  if (!-[NSString length](v5, "length")
    && -[THImageRepAccessibility thaxIsContainedInAudioRep](self, "thaxIsContainedInAudioRep"))
  {
    v5 = -[THWAudioRepAccessibility thaxMediaLabel](-[THImageRepAccessibility thaxParentAudioRep](self, "thaxParentAudioRep"), "thaxMediaLabel");
  }
  if (!-[NSString length](v5, "length")
    && -[THImageRepAccessibility thaxIsPartOfAGallery](self, "thaxIsPartOfAGallery"))
  {
    v5 = -[THWGalleryRepAccessibility thaxCaptionForCurrentItem](-[THImageRepAccessibility thaxRelatedGalleryRep](self, "thaxRelatedGalleryRep"), "thaxCaptionForCurrentItem");
  }
  if (!-[NSString length](v5, "length"))
    v5 = (NSString *)-[THImageRepAccessibility thaxContainingGutterRepLabel](self, "thaxContainingGutterRepLabel");
  if (!-[NSString length](v5, "length"))
    v5 = -[THImageRepAccessibility thaxSibilingCaptionText](self, "thaxSibilingCaptionText");
  v14 = 0;
  v6 = (void *)objc_opt_class(THImageInfoAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), 1, &v14);
  if (v14)
    goto LABEL_21;
  v8 = v7;
  if (!-[NSString length](v5, "length") && -[objc_class thaxPopUpInfo](v8, "thaxPopUpInfo"))
    v5 = THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.popup.image"));
  v13 = 0;
  v9 = (void *)objc_opt_class(THTSDLayoutAccessibility);
  v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[TSDRepAccessibility tsaxLayout](self, "tsaxLayout"), 1, &v13);
  if (v13)
LABEL_21:
    abort();
  v11 = v10;
  if (!-[NSString length](v5, "length") && -[objc_class thaxIsExpanded](v11, "thaxIsExpanded"))
    return THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.expanded.image"));
  return v5;
}

- (BOOL)p_shouldHitTest
{
  unsigned __int8 v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THImageRepAccessibility;
  v2 = -[THImageRepAccessibility p_shouldHitTest](&v4, "p_shouldHitTest");
  return -[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements") | v2;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THImageRepAccessibility;
  v3 = -[TSDRepAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[THImageRepAccessibility thaxIsContainedInAudioRep](self, "thaxIsContainedInAudioRep");
  v5 = UIAccessibilityTraitStartsMediaSession;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityHint
{
  THWGalleryRepAccessibility *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  objc_super v13;

  if (-[THImageRepAccessibility thaxIsContainedInAudioRep](self, "thaxIsContainedInAudioRep"))
  {
    if (-[THWAudioRepAccessibility thaxIsPlaying](-[THImageRepAccessibility thaxParentAudioRep](self, "thaxParentAudioRep"), "thaxIsPlaying"))
    {
      return THAccessibilityLocalizedString((uint64_t)CFSTR("av.pause.playing.hint.ios"));
    }
    else
    {
      return THAccessibilityLocalizedString((uint64_t)CFSTR("av.play.stopped.hint.ios"));
    }
  }
  else if (-[THImageRepAccessibility thaxIsPartOfAGallery](self, "thaxIsPartOfAGallery"))
  {
    v4 = -[THImageRepAccessibility thaxRelatedGalleryRep](self, "thaxRelatedGalleryRep");
    v5 = -[THWGalleryRepAccessibility thaxItemCountDescriptionForCurrentItem](v4, "thaxItemCountDescriptionForCurrentItem");
    if (-[THWGalleryRepAccessibility thaxTotalItemCount](v4, "thaxTotalItemCount") < 2)
      v12 = 0;
    else
      v12 = THAccessibilityLocalizedString((uint64_t)CFSTR("gallery.item.hint.ios"));
    return __TSAccessibilityStringForVariables(1, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)THImageRepAccessibility;
    return -[TSDRepAccessibility accessibilityHint](&v13, "accessibilityHint");
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _BOOL4 v5;
  THWGalleryRepAccessibility *v6;
  __CFString *v7;
  UIUserInterfaceLayoutDirection v8;
  _QWORD v11[6];

  v5 = -[THImageRepAccessibility thaxIsPartOfAGallery](self, "thaxIsPartOfAGallery");
  if (v5)
  {
    v6 = -[THImageRepAccessibility thaxRelatedGalleryRep](self, "thaxRelatedGalleryRep");
    if (-[THWGalleryRepAccessibility thaxTotalItemCount](v6, "thaxTotalItemCount") < 2
      || (a3 & 0xFFFFFFFFFFFFFFFBLL) - 1 > 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      if (a3 == 5)
      {
        v7 = CFSTR("handleNavigateNextCommand");
      }
      else
      {
        v8 = -[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "userInterfaceLayoutDirection");
        v7 = CFSTR("handleNavigateNextCommand");
        if ((a3 != 2 || v8)
          && ((char *)-[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "userInterfaceLayoutDirection") != (char *)&dword_0 + 1|| a3 != 1))
        {
          v7 = CFSTR("handleNavigatePreviousCommand");
        }
      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_25B094;
      v11[3] = &unk_427240;
      v11[4] = v6;
      v11[5] = NSSelectorFromString(&v7->isa);
      __TSAccessibilityPerformSafeBlock((uint64_t)v11);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)_accessibilityEquivalenceTag
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THImageRepAccessibility;
  v3 = -[THImageRepAccessibility _accessibilityEquivalenceTag](&v5, "_accessibilityEquivalenceTag");
  if (-[THImageRepAccessibility thaxIsPartOfAGallery](self, "thaxIsPartOfAGallery"))
    return -[THWGalleryRepAccessibility thaxItemCountDescriptionForCurrentItem](-[THImageRepAccessibility thaxRelatedGalleryRep](self, "thaxRelatedGalleryRep"), "thaxItemCountDescriptionForCurrentItem");
  return v3;
}

- (BOOL)thaxIsElementIgnored
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THImageRepAccessibility;
  v3 = -[THTSDImageRepAccessibility thaxIsElementIgnored](&v5, "thaxIsElementIgnored");
  if (v3)
  {
    if (-[THImageRepAccessibility thaxPressableAction](self, "thaxPressableAction"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[THImageRepAccessibility thaxIsPartOfAGallery](self, "thaxIsPartOfAGallery");
  }
  return v3;
}

@end
