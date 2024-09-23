@implementation TSUILabelAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  TSUILabelAccessibility *v17;
  uint64_t v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;

  v3 = objc_msgSend(objc_msgSend(-[TSUILabelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("text")), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), "length");
  if (v3)
  {
    if (!-[TSUILabelAccessibility tsaxViewAncestorOfType:](self, "tsaxViewAncestorOfType:", NSClassFromString(CFSTR("TSADocumentManagerPopoverView"))))
    {
      if (!-[TSUILabelAccessibility tsaxViewAncestorOfType:](self, "tsaxViewAncestorOfType:", NSClassFromString(CFSTR("TSADocumentManagerPopoverView"))))goto LABEL_15;
      -[TSUILabelAccessibility frame](self, "frame");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v12 = objc_msgSend(-[TSUILabelAccessibility superview](self, "superview"), "subviews");
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v13)
      {
LABEL_15:
        v20.receiver = self;
        v20.super_class = (Class)TSUILabelAccessibility;
        LOBYTE(v3) = -[TSUILabelAccessibility isAccessibilityElement](&v20, "isAccessibilityElement");
        return (char)v3;
      }
      v14 = v13;
      v15 = *(_QWORD *)v22;
LABEL_7:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(TSUILabelAccessibility **)(*((_QWORD *)&v21 + 1) + 8 * v16);
        if (v17 != self)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "frame");
          v27.origin.x = v5;
          v27.origin.y = v7;
          v27.size.width = v9;
          v27.size.height = v11;
          if (CGRectContainsRect(v26, v27))
          {
            v18 = objc_opt_class(UIButton);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
              break;
          }
        }
        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            goto LABEL_7;
          goto LABEL_15;
        }
      }
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

@end
