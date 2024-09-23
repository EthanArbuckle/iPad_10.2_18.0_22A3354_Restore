@implementation UIView(TVMLKitAdditions)

+ (uint64_t)tv_performByPreventingAdditiveAnimations:()TVMLKitAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2048, a3, 0, 0.0, 0.0);
}

- (void)setValue:()TVMLKitAdditions forTVViewStyle:
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "tv_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_layoutPropertySetterForStyle:", v6);
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v8)
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

}

- (id)valueForTVViewStyle:()TVMLKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "tv_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "tv_layoutPropertyGetterForStyle:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tv_setValue:()TVMLKitAdditions forTVViewTag:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)tv_valueForTVViewTag:()TVMLKitAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tv_disableAnimation:()TVMLKitAdditions forProperty:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  if (tv_disableAnimation_forProperty__onceToken != -1)
    dispatch_once(&tv_disableAnimation_forProperty__onceToken, &__block_literal_global_68);
  objc_getAssociatedObject(a1, "TVMLDisabledAnimations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if (a3)
    objc_msgSend(v10, "addObject:", v12);
  else
    objc_msgSend(v10, "removeObject:", v12);
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_setAssociatedObject(a1, "TVMLDisabledAnimations", v11, (void *)0x301);

}

- (uint64_t)tv_isAnimationDisabledForProperty:()TVMLKitAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_getAssociatedObject(a1, "TVMLDisabledAnimations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)transferLayoutStylesFromElement:()TVMLKitAdditions
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = +[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v4);
    objc_msgSend(a1, "tv_layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class layoutWithLayout:element:](v5, "layoutWithLayout:element:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(a1, "tv_setLayout:", v7);
    objc_msgSend(a1, "_transferAttributesFromElement:", v8);

    v4 = v8;
  }

}

- (uint64_t)tv_sizeThatFits:()TVMLKitAdditions
{
  _QWORD v7[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "tv_textSizeForSize:", a2, a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__UIView_TVMLKitAdditions__tv_sizeThatFits___block_invoke;
  v7[3] = &unk_24EB850E0;
  v7[4] = a1;
  return objc_msgSend(a1, "tv_sizeThatFits:withSizeCalculation:", v7, a2, a3);
}

- (double)tv_sizeThatFits:()TVMLKitAdditions withSizeCalculation:
{
  double (**v7)(_QWORD, double, double);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;

  v7 = a5;
  objc_msgSend(a1, "tv_minWidth");
  v9 = v8;
  objc_msgSend(a1, "tv_minHeight");
  objc_msgSend(a1, "tv_maxWidth");
  v11 = v10;
  objc_msgSend(a1, "tv_maxHeight");
  v13 = v12;
  objc_msgSend(a1, "tv_itemWidth");
  v15 = v14;
  objc_msgSend(a1, "tv_itemHeight");
  v17 = v16;
  if (v15 <= 0.0 || v16 <= 0.0)
  {
    v18 = v15;
    v19 = v15;
    if (v15 <= 0.0)
    {
      if (a2 > 0.0 && (a2 < v11 || v11 <= 0.0))
      {
        v15 = a2;
        v18 = v9;
        v19 = a2;
      }
      else
      {
        if (v11 <= 0.0)
          v15 = a2;
        else
          v15 = v11;
        v18 = v9;
        v19 = v11;
      }
    }
    if (v16 <= 0.0)
    {
      if (a3 > 0.0 && (a3 < v13 || v13 <= 0.0))
      {
        v17 = a3;
      }
      else if (v13 > 0.0)
      {
        v17 = v13;
      }
      else
      {
        v17 = a3;
      }
    }
    v20 = v7[2](v7, v15, v17);
    if (v20 <= v19 || v19 <= 0.0)
      v22 = v20;
    else
      v22 = v19;
    if (v20 >= v18)
      v15 = v22;
    else
      v15 = v18;
  }

  return v15;
}

- (uint64_t)tv_shouldReuseCachedSizeThatFits:()TVMLKitAdditions previousTargetSize:newTargetSize:
{
  BOOL v8;
  _BOOL4 v10;

  if (a1 == *MEMORY[0x24BDBF148] && a2 == *(double *)(MEMORY[0x24BDBF148] + 8))
    return 1;
  if (a3 == a5 && a4 == a6)
    return 0;
  if (a5 > a3)
  {
    v8 = a1 < a3;
    return !v8;
  }
  if (a5 < a3)
  {
    v8 = a1 < a5;
    return !v8;
  }
  if (a6 == 0.0)
  {
    v8 = a2 < a4;
    return !v8;
  }
  v10 = a2 > a6;
  if (a6 >= a4)
    v10 = 0;
  if (a6 > a4)
    v10 = a2 >= a4;
  if (a4 == 0.0)
    return a2 > a6;
  else
    return v10;
}

- (double)tv_alignmentInsetsForExpectedWidth:()TVMLKitAdditions
{
  return *MEMORY[0x24BDF7718];
}

- (double)tv_margin
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("margin"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "UIEdgeInsetsValue");
    v3 = v2;
  }
  else
  {
    v3 = *MEMORY[0x24BDF7718];
  }

  return v3;
}

- (double)tv_nonDirectionalMargin
{
  double v2;
  double v3;

  objc_msgSend(a1, "tv_margin");
  v3 = v2;
  objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  return v3;
}

- (double)tv_focusMargin
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-focus-margin"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "UIEdgeInsetsValue");
    v3 = v2;
  }
  else
  {
    v3 = *MEMORY[0x24BDF7718];
  }

  return v3;
}

- (double)tv_padding
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("padding"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "UIEdgeInsetsValue");
    v3 = v2;
  }
  else
  {
    v3 = *MEMORY[0x24BDF7718];
  }

  return v3;
}

- (int64_t)tv_alignment
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-align"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", objc_msgSend(v2, "unsignedIntegerValue"), objc_msgSend(a1, "semanticContentAttribute"));

  return v3;
}

- (uint64_t)tv_contentAlignment
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-content-align"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (int64_t)tv_position
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-position"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TVMLUtilities semanticPositionForPosition:semanticContentAttribute:](TVMLUtilities, "semanticPositionForPosition:semanticContentAttribute:", objc_msgSend(v2, "unsignedIntegerValue"), objc_msgSend(a1, "semanticContentAttribute"));

  return v3;
}

- (double)tv_itemWidth
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_itemHeight
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_maxHeight
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("max-height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_maxWidth
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("max-width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_minHeight
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("min-height"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_minWidth
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("min-width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_interitemSpacing
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-interitem-spacing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)tv_lineSpacing
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-line-spacing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)tv_backgroundColor
{
  return objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("background-color"));
}

- (uint64_t)tv_highlightColor
{
  return objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-highlight-color"));
}

- (uint64_t)tv_elementType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForTVViewTag:", CFSTR("TVMLElementTypeTag"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)tv_elementName
{
  return objc_msgSend(a1, "tv_valueForTVViewTag:", CFSTR("TVMLElementTypeName"));
}

- (uint64_t)tv_isPrototypeView
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tv_valueForTVViewTag:", CFSTR("TVMLElementIsPrototypeViewTag"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)tv_showOnHighlight
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-highlight-style"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("show-on-highlight")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-text-highlight-style"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("show-on-highlight")) & 1) != 0)
        v3 = 1;
      else
        v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("marquee-and-show-on-highlight"));
      v2 = v4;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (uint64_t)tv_marqueeOnHighlight
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForTVViewStyle:", CFSTR("tv-text-highlight-style"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("marquee-on-highlight")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("marquee-and-show-on-highlight"));

  return v2;
}

- (id)tv_siriData
{
  return objc_getAssociatedObject(a1, "TVMLSiriDataString");
}

- (void)tv_setSiriData:()TVMLKitAdditions
{
  objc_setAssociatedObject(a1, "TVMLSiriDataString", a3, (void *)0x303);
}

- (void)tv_setAccessibilityText:()TVMLKitAdditions
{
  objc_setAssociatedObject(a1, "TVMLAccessibilityText", a3, (void *)0x303);
}

- (id)tv_AccessibilityText
{
  return objc_getAssociatedObject(a1, "TVMLAccessibilityText");
}

- (void)tv_setLayout:()TVMLKitAdditions
{
  objc_setAssociatedObject(a1, "TVMLViewLayout", a3, (void *)0x301);
}

- (id)tv_layout
{
  return objc_getAssociatedObject(a1, "TVMLViewLayout");
}

- (uint64_t)tv_shouldAnimatePropertyWithKey:()TVMLKitAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if ((objc_msgSend(a1, "tv_isAnimationDisabledForProperty:", v4) & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(a1, "tv_shouldAnimatePropertyWithKey:", v4);

  return v5;
}

- (void)_transferAttributesFromElement:()TVMLKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "setSemanticContentAttribute:", objc_msgSend(v4, "tv_semanticContentAttribute"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "tv_elementType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tv_setValue:forTVViewTag:", v5, CFSTR("TVMLElementTypeTag"));

  objc_msgSend(v4, "elementName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tv_setValue:forTVViewTag:", v6, CFSTR("TVMLElementTypeName"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v4, "isPartOfPrototypeElement");

  objc_msgSend(v7, "numberWithBool:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tv_setValue:forTVViewTag:", v9, CFSTR("TVMLElementIsPrototypeViewTag"));

}

@end
