@implementation THWAudioRepAccessibility

- (BOOL)isAccessibilityElement
{
  return !-[THWAudioRepAccessibility thaxHasAudioControls](self, "thaxHasAudioControls");
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  unsigned __int8 v3;

  v3 = -[THWAudioRepAccessibility thaxHasAudioControls](self, "thaxHasAudioControls");
  if ((v3 & 1) == 0)
    -[THWAudioRepAccessibility thaxTogglePlaying](self, "thaxTogglePlaying");
  return v3 ^ 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWAudioRepAccessibility;
  v3 = -[TSDRepAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[THWAudioRepAccessibility thaxHasAudioControls](self, "thaxHasAudioControls");
  v5 = UIAccessibilityTraitButton | UIAccessibilityTraitStartsMediaSession;
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityHint
{
  objc_super v4;

  if (-[THWAudioRepAccessibility thaxHasAudioControls](self, "thaxHasAudioControls"))
  {
    v4.receiver = self;
    v4.super_class = (Class)THWAudioRepAccessibility;
    return -[THTSDRepAccessibility accessibilityHint](&v4, "accessibilityHint");
  }
  else if (-[THWAudioRepAccessibility thaxIsPlaying](self, "thaxIsPlaying"))
  {
    return THAccessibilityLocalizedString((uint64_t)CFSTR("av.pause.playing.hint.ios"));
  }
  else if (-[THWAudioRepAccessibility thaxIsPaused](self, "thaxIsPaused"))
  {
    return THAccessibilityLocalizedString((uint64_t)CFSTR("av.play.paused.hint.ios"));
  }
  else
  {
    return THAccessibilityLocalizedString((uint64_t)CFSTR("av.play.stopped.hint.ios"));
  }
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAudioRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (void)thaxTogglePlaying
{
  _QWORD *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (-[THWAudioRepAccessibility thaxIsPlaying](self, "thaxIsPlaying"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_26FE50;
    v4[3] = &unk_426DD0;
    v4[4] = self;
    v3 = v4;
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_26FE48;
    v5[3] = &unk_426DD0;
    v5[4] = self;
    v3 = v5;
  }
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (NSString)thaxMediaLabel
{
  return (NSString *)objc_msgSend(-[THWAudioRepAccessibility _thaxMovieInfo](self, "_thaxMovieInfo"), "thaxMediaLabel");
}

- (BOOL)thaxIsPlaying
{
  return -[THWAudioRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isPlaying"));
}

- (BOOL)thaxIsPaused
{
  return -[THWAudioRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isPaused"));
}

- (BOOL)thaxHasAudioControls
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = -[THWAudioRepAccessibility _thaxChildReps](self, "_thaxChildReps", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_opt_class(THWAVTransportRepAccessibility);
        if (__TSAccessibilityCastAsSafeCategory(v8, v7, 0, 0))
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (BOOL)thaxShouldHideChildReps
{
  return !-[THWAudioRepAccessibility thaxHasAudioControls](self, "thaxHasAudioControls");
}

- (id)_thaxMovieInfo
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWMovieInfoAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("movieInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxChildReps
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("childReps")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
