@implementation BKAVRouteButtonAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AVRoutePickerView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (NSString)bkaxAccessibilityLabelOverride
{
  return (NSString *)__IMAccessibilityGetAssociatedObject(self, &unk_1009F5070);
}

- (void)bkaxSetAccessibilityLabelOverride:(id)a3
{
  __IMAccessibilitySetAssociatedObject(self, &unk_1009F5070, a3);
}

- (id)accessibilityLabel
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVRouteButtonAccessibility bkaxAccessibilityLabelOverride](self, "bkaxAccessibilityLabelOverride"));

  if (v3)
    return (id)objc_claimAutoreleasedReturnValue(-[BKAVRouteButtonAccessibility bkaxAccessibilityLabelOverride](self, "bkaxAccessibilityLabelOverride"));
  v16.receiver = self;
  v16.super_class = (Class)BKAVRouteButtonAccessibility;
  v5 = -[BKAVRouteButtonAccessibility accessibilityLabel](&v16, "accessibilityLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVRouteButtonAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("subviews"), 0));
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(UIButton);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessibilityLabel"));
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKAVRouteButtonAccessibility bkaxSetAccessibilityLabelOverride:](self, "bkaxSetAccessibilityLabelOverride:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAVRouteButtonAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_routePickerButton")));
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

@end
