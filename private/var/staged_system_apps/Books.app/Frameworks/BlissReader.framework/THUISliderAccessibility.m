@implementation THUISliderAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UISlider");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_thaxValueHandler
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A42);
}

- (void)_thaxSetValueHandler:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A42, a3);
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THUISliderAccessibility;
  objc_msgSendSuper2(&v4, "tsaxAddSafeCategoryDependenciesToCollection:");
  objc_msgSend(a3, "addObject:", CFSTR("TSUISliderAccessibility"));
}

- (float)thaxValue
{
  float result;

  -[THUISliderAccessibility tsaxFloatValueForKey:](self, "tsaxFloatValueForKey:", CFSTR("value"));
  return result;
}

- (float)thaxMinimumValue
{
  float result;

  -[THUISliderAccessibility tsaxFloatValueForKey:](self, "tsaxFloatValueForKey:", CFSTR("minimumValue"));
  return result;
}

- (float)thaxMaximumValue
{
  float result;

  -[THUISliderAccessibility tsaxFloatValueForKey:](self, "tsaxFloatValueForKey:", CFSTR("maximumValue"));
  return result;
}

- (id)thaxValueHandler
{
  return -[THUISliderAccessibility _thaxValueHandler](self, "_thaxValueHandler");
}

- (void)thaxSetValueHandler:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  -[THUISliderAccessibility _thaxSetValueHandler:](self, "_thaxSetValueHandler:", v4);
}

- (id)accessibilityValue
{
  uint64_t (**v3)(id, THUISliderAccessibility *);
  objc_super v5;

  v3 = -[THUISliderAccessibility thaxValueHandler](self, "thaxValueHandler");
  if (v3)
    return (id)v3[2](v3, self);
  v5.receiver = self;
  v5.super_class = (Class)THUISliderAccessibility;
  return -[THUISliderAccessibility accessibilityValue](&v5, "accessibilityValue");
}

- (void)accessibilityIncrement
{
  objc_super v3;

  -[THUISliderAccessibility _thaxTangierStartSlider](self, "_thaxTangierStartSlider");
  if (objc_msgSend(-[THUISliderAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqualToString:", CFSTR("PageScrubber")))
  {
    -[THUISliderAccessibility _thaxPageScrubberModify:](self, "_thaxPageScrubberModify:", 1);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)THUISliderAccessibility;
    -[THUISliderAccessibility accessibilityIncrement](&v3, "accessibilityIncrement");
  }
  -[THUISliderAccessibility _thaxTangierEndSlider](self, "_thaxTangierEndSlider");
}

- (void)accessibilityDecrement
{
  objc_super v3;

  -[THUISliderAccessibility _thaxTangierStartSlider](self, "_thaxTangierStartSlider");
  if (objc_msgSend(-[THUISliderAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqualToString:", CFSTR("PageScrubber")))
  {
    -[THUISliderAccessibility _thaxPageScrubberModify:](self, "_thaxPageScrubberModify:", 0);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)THUISliderAccessibility;
    -[THUISliderAccessibility accessibilityDecrement](&v3, "accessibilityDecrement");
  }
  -[THUISliderAccessibility _thaxTangierEndSlider](self, "_thaxTangierEndSlider");
}

- (void)_thaxPerformTargetActionsForControlEvents:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  char *v12;
  char *v13;
  SEL v14;
  id obj;
  uint64_t v16;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = -[THUISliderAccessibility allTargets](self, "allTargets");
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(obj);
        v19 = v4;
        v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v4);
        v6 = -[THUISliderAccessibility actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", v5, a3);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
              v12 = (char *)objc_msgSend(v11, "rangeOfString:", CFSTR(":"));
              v13 = (char *)objc_msgSend(v11, "length") - 1;
              v14 = NSSelectorFromString((NSString *)v11);
              if (v12 == v13)
                objc_msgSend(v5, "performSelector:withObject:", v14, self);
              else
                objc_msgSend(v5, "performSelector:", v14);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v8);
        }
        v4 = v19 + 1;
      }
      while ((id)(v19 + 1) != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
}

- (void)_thaxTangierStartSlider
{
  -[THUISliderAccessibility _thaxPerformTargetActionsForControlEvents:](self, "_thaxPerformTargetActionsForControlEvents:", 1);
}

- (void)_thaxTangierEndSlider
{
  -[THUISliderAccessibility _thaxPerformTargetActionsForControlEvents:](self, "_thaxPerformTargetActionsForControlEvents:", 448);
}

- (void)_thaxPageScrubberModify:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;

  v3 = a3;
  if (-[THUISliderAccessibility isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    v5 = objc_msgSend(-[THUISliderAccessibility allTargets](self, "allTargets"), "anyObject");
    v6 = objc_msgSend(objc_msgSend(v5, "tsaxValueForKey:", CFSTR("pageNumberLabel")), "tsaxValueForKey:", CFSTR("text"));
    v7 = objc_opt_class(NSString);
    v8 = (objc_opt_isKindOfClass(v6, v7) & 1) != 0 ? (char *)objc_msgSend(v6, "integerValue") : 0;
    if ((objc_opt_respondsToSelector(v5, "p_scrollToAbsolutePageIndex:") & 1) != 0)
    {
      if (v3)
        v9 = v8;
      else
        v9 = v8 - 2;
      objc_msgSend(v5, "p_scrollToAbsolutePageIndex:", v9);
      objc_msgSend(v5, "tsaxValueForKey:", CFSTR("p_fadeOutSingleThumbViewController"));
    }
  }
}

@end
