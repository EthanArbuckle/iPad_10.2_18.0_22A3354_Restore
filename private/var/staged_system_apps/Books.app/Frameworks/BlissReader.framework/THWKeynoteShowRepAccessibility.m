@implementation THWKeynoteShowRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWKeynoteShowRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THContainerRepAccessibility, a2);
}

- (NSString)thaxLabelForCurrentEvent
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("kpfPlayer")));
  v8 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tsaxValueForKey:", CFSTR("accessibilityLabelForCurrentEvent")));
  v5 = __TSAccessibilityCastAsClass(v3, (uint64_t)v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();

  return (NSString *)v6;
}

- (NSArray)thaxAccessibilityRegions
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_25C648;
  v12 = sub_25C658;
  v13 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25C660;
  v5[3] = &unk_43C440;
  v7 = &v8;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("kpfPlayer")));
  v6 = v2;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();

  v3 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v3;
}

- (CALayer)thaxShowLayer
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(CALayer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_showLayer")));
  v5 = __TSAccessibilityCastAsClass(v3, (uint64_t)v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return (CALayer *)v6;
}

- (void)thaxGotoNextEvent
{
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_25C7A4;
  v3[3] = &unk_426D30;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("kpfPlayer")));
  v4 = v2;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();

}

- (void)thaxGotoPreviousEvent
{
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_25C830;
  v3[3] = &unk_426D30;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("kpfPlayer")));
  v4 = v2;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();

}

- (NSString)thaxLastSpokenAnnouncement
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_543A39);
}

- (void)thaxSetLastSpokenAnnouncement:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_543A39, a3);
}

- (NSString)thaxLastSeenEventIdentifier
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_543A3A);
}

- (void)thaxSetLastSeenEventIdentifier:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_543A3A, a3);
}

- (NSArray)thaxCachedElements
{
  return (NSArray *)__TSAccessibilityGetAssociatedObject(self, &unk_543A3B);
}

- (void)thaxSetCachedElements:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_543A3B, a3);
}

- (void)p_keynoteShowDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  UIAccessibilityNotifications v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWKeynoteShowRepAccessibility;
  -[THWKeynoteShowRepAccessibility p_keynoteShowDidUpdate:](&v10, "p_keynoteShowDidUpdate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxLabelForCurrentEvent](self, "thaxLabelForCurrentEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxLastSpokenAnnouncement](self, "thaxLastSpokenAnnouncement"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v4);
    v7 = UIAccessibilityLayoutChangedNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility accessibilityElements](self, "accessibilityElements"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    UIAccessibilityPostNotification(v7, v9);

  }
  -[THWKeynoteShowRepAccessibility thaxSetLastSpokenAnnouncement:](self, "thaxSetLastSpokenAnnouncement:", v4);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  THWKeynoteShowRepAccessibility *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  THWKeynoteShowRepAccessibilityElement *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  THWKeynoteShowRepAccessibility *v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  CGRect v42;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxLabelForCurrentEvent](self, "thaxLabelForCurrentEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxLastSeenEventIdentifier](v2, "thaxLastSeenEventIdentifier"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v34 = (void *)objc_opt_new(NSMutableArray, v6);
    v35 = v2;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxAccessibilityRegions](v2, "thaxAccessibilityRegions"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v36 = 0;
          v13 = (objc_class *)objc_opt_class(NSString);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("text")));
          v15 = __TSAccessibilityCastAsClass(v13, (uint64_t)v14, 1, &v36);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          if (v36
            || (v36 = 0,
                v17 = (objc_class *)objc_opt_class(NSValue),
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("targetRectangle"))),
                v19 = __TSAccessibilityCastAsClass(v17, (uint64_t)v18, 1, &v36),
                v20 = (void *)objc_claimAutoreleasedReturnValue(v19),
                v18,
                v36))
          {
            abort();
          }
          objc_msgSend(v20, "CGRectValue");
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;

          if (objc_msgSend(v16, "length"))
          {
            v42.origin.x = v22;
            v42.origin.y = v24;
            v42.size.width = v26;
            v42.size.height = v28;
            if (!CGRectIsEmpty(v42))
            {
              v29 = -[THWKeynoteShowRepAccessibilityElement initWithAccessibilityContainer:]([THWKeynoteShowRepAccessibilityElement alloc], "initWithAccessibilityContainer:", v35);
              -[THWKeynoteShowRepAccessibilityElement setIsAccessibilityElement:](v29, "setIsAccessibilityElement:", 1);
              -[THWKeynoteShowRepAccessibilityElement setAccessibilityLabel:](v29, "setAccessibilityLabel:", v16);
              -[THWKeynoteShowRepAccessibilityElement setFrameInShowLayer:](v29, "setFrameInShowLayer:", v22, v24, v26, v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxShowLayer](v35, "thaxShowLayer"));
              -[THWKeynoteShowRepAccessibilityElement setShowLayer:](v29, "setShowLayer:", v30);

              objc_msgSend(v34, "addObject:", v29);
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v9);
    }

    v2 = v35;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxLabelForCurrentEvent](v35, "thaxLabelForCurrentEvent"));
    -[THWKeynoteShowRepAccessibility thaxSetLastSeenEventIdentifier:](v35, "thaxSetLastSeenEventIdentifier:", v31);

    v32 = objc_msgSend(v34, "copy");
    -[THWKeynoteShowRepAccessibility thaxSetCachedElements:](v35, "thaxSetCachedElements:", v32);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[THWKeynoteShowRepAccessibility thaxCachedElements](v2, "thaxCachedElements"));
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    -[THWKeynoteShowRepAccessibility thaxGotoPreviousEvent](self, "thaxGotoPreviousEvent");
    return 1;
  }
  if (a3 == 2)
  {
    -[THWKeynoteShowRepAccessibility thaxGotoNextEvent](self, "thaxGotoNextEvent");
    return 1;
  }
  return 0;
}

@end
