@implementation PUInterfaceManager

+ (PUInterfaceTheme)currentTheme
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_msgSend(v2, "interfaceThemeClass");

  if (!v3)
    v3 = (objc_class *)objc_opt_class();
  if ((objc_msgSend((id)currentTheme_currentTheme, "isMemberOfClass:", v3) & 1) == 0)
  {
    v4 = objc_alloc_init(v3);
    v5 = (void *)currentTheme_currentTheme;
    currentTheme_currentTheme = (uint64_t)v4;

  }
  return (PUInterfaceTheme *)(id)currentTheme_currentTheme;
}

+ (id)beginDisablingUserInteractionForReason:(int64_t)a3
{
  return (id)objc_msgSend(a1, "beginDisablingUserInteractionForReason:withExpectedTimeout:", a3, 10.0);
}

+ (id)beginDisablingUserInteractionForReason:(int64_t)a3 withExpectedTimeout:(double)a4
{
  _PUDisabledUserInteractionToken *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v21;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUInterfaceManager.m"), 66, CFSTR("Need a valid interaction disabling reason."));

  }
  v7 = objc_alloc_init(_PUDisabledUserInteractionToken);
  if (MEMORY[0x1AF429AFC](-[_PUDisabledUserInteractionToken setReason:](v7, "setReason:", a3)))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PUDisabledUserInteractionToken setIdentifier:](v7, "setIdentifier:", v9);
  }
  if (!objc_msgSend((id)__disabledUserInteractionTokens, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_firstKeyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginIgnoringInteractionEvents");
    objc_msgSend(v11, "beginDisablingInterfaceAutorotation");
    v12 = (void *)MEMORY[0x1E0C99E88];
    UIAnimationDragCoefficient();
    objc_msgSend(v12, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__disabledUserInteractionRequestDidTimeOut_, 0, 0, v13 * a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)__disabledUserInteractionTimeoutTimer;
    __disabledUserInteractionTimeoutTimer = v14;

  }
  v16 = (void *)__disabledUserInteractionTokens;
  if (!__disabledUserInteractionTokens)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    v18 = (void *)__disabledUserInteractionTokens;
    __disabledUserInteractionTokens = v17;

    v16 = (void *)__disabledUserInteractionTokens;
  }
  objc_msgSend(v16, "addObject:", v7);
  return v7;
}

+ (void)endDisablingUserInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend((id)__disabledUserInteractionTokens, "containsObject:") & 1) != 0)
  {
    objc_msgSend((id)__disabledUserInteractionTokens, "removeObject:", v6);
    if (!objc_msgSend((id)__disabledUserInteractionTokens, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "px_firstKeyWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endIgnoringInteractionEvents");
      objc_msgSend(v4, "endDisablingInterfaceAutorotation");
      objc_msgSend((id)__disabledUserInteractionTimeoutTimer, "invalidate");
      v5 = (void *)__disabledUserInteractionTimeoutTimer;
      __disabledUserInteractionTimeoutTimer = 0;

    }
  }
  else if (MEMORY[0x1AF429AFC]())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Call to +endDisablingUserInteraction: without corresponding call to +beginDisablingUserInteraction"));
  }
  else
  {
    NSLog(CFSTR("Ignore unbalanaced call to reenable disabled user interaction"));
  }

}

+ (void)_disabledUserInteractionRequestDidTimeOut:(id)a3
{
  id v4;

  objc_msgSend((id)__disabledUserInteractionTokens, "anyObject", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "reason"))
  {
    case 0:
      objc_msgSend(a1, "_handleInteractionDisablingTimeout");
      break;
    case 1:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoBrowserZoomTransition");
      break;
    case 2:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForStartSlideshowFromGrid");
      break;
    case 3:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForBannerViewImagesJump");
      break;
    case 4:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForSearchSelectResult");
      break;
    case 5:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForSearchSelectSuggestion");
      break;
    case 6:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForAlbumStackTransition");
      break;
    case 7:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoBrowserToPhotoEditorTransition");
      break;
    case 8:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoEditorToPhotoBrowserTransition");
      break;
    case 9:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForOneUpToPhotoEditorTransition");
      goto LABEL_12;
    case 10:
LABEL_12:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForOverOneUpTransition");
      break;
    case 11:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoEditorSavingChanges");
      break;
    case 12:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoEditorRevertingChanges");
      break;
    case 13:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoEditorWaitingToDismiss");
      break;
    case 14:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForPhotoEditorComputingAutoEnhance");
      break;
    case 16:
      objc_msgSend(a1, "_handleInteractionDisablingTimeoutForBurningInTrim");
      break;
    default:
      break;
  }

}

+ (void)_handleInteractionDisablingTimeoutForPhotoBrowserZoomTransition
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForStartSlideshowFromGrid
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForBannerViewImagesJump
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForSearchSelectResult
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForSearchSelectSuggestion
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForAlbumStackTransition
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForPhotoBrowserToPhotoEditorTransition
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorToPhotoBrowserTransition
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorSavingChanges
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorRevertingChanges
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorWaitingToDismiss
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorComputingAutoEnhance
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForOneUpToPhotoEditorTransition
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForOverOneUpTransition
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeoutForBurningInTrim
{
  if (MEMORY[0x1AF429AFC](a1, a2))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("No call to +endDisablingUserInteraction: did occur in time for: %@"), __disabledUserInteractionTokens);
  objc_msgSend(a1, "_handleInteractionDisablingTimeout");
}

+ (void)_handleInteractionDisablingTimeout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("Disabled user interaction timed out."), a2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_msgSend((id)__disabledUserInteractionTokens, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(a1, "endDisablingUserInteraction:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 1 || objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

+ (BOOL)shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:(id)a3
{
  void *v4;
  id v5;
  NSString *v6;
  int v7;

  v4 = (void *)*MEMORY[0x1E0DC4730];
  v5 = a3;
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "shouldUsePhoneLayoutWithTraitCollection:", v5);

  if (v7)
    LOBYTE(v7) = UIContentSizeCategoryIsAccessibilityCategory(v6);

  return v7;
}

@end
