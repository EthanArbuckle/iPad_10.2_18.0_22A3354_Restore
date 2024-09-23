@implementation TSDSwatchGridViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDSwatchGridView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return -[TSDSwatchGridViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("window")) != 0;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v4;
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  unint64_t i;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  TSDSwatchAccessibilityElement *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIAccessibilityTraits v28;
  UIAccessibilityTraits v29;
  id v31;

  v31 = -[TSDSwatchGridViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mItems"));
  v4 = objc_msgSend(v31, "count");
  v5 = -[TSDSwatchGridViewAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("mRowCount"));
  v6 = -[TSDSwatchGridViewAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("mItemsPerRow"));
  v7 = -[TSDSwatchGridViewAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("mSwatchSize"));
  if (v6)
  {
    v8 = v7;
    v9 = 0;
    v28 = UIAccessibilityTraitSelected | UIAccessibilityTraitButton;
    v29 = UIAccessibilityTraitButton;
    do
    {
      if (v5)
      {
        for (i = 0; (id)i != v5; ++i)
        {
          if (v8 == 3)
          {
            v11 = (unint64_t)objc_msgSend(-[TSDSwatchGridViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("swatchGridViewDelegate")), "tsaxUnsignedIntegerValueForKey:", CFSTR("itemCountPerSwatch"));
            v12 = i % v11 + (_QWORD)&v9[i / v11 * (_QWORD)v6] * v11;
          }
          else
          {
            v12 = (unint64_t)&v9[i * (_QWORD)v6];
          }
          if (v12 >= (unint64_t)v4)
            break;
          v13 = objc_msgSend(v31, "objectAtIndex:");
          v14 = objc_msgSend(v13, "accessibilityLabel");
          if (objc_msgSend(v14, "length"))
          {
            v15 = -[TSAccessibilityElement initWithAccessibilityParent:]([TSDSwatchAccessibilityElement alloc], "initWithAccessibilityParent:", self);
            -[TSDSwatchAccessibilityElement setAccessibilityTraits:](v15, "setAccessibilityTraits:", v29);
            if (-[TSDSwatchGridViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("selectedItem")) == v13)
              -[TSDSwatchAccessibilityElement setAccessibilityTraits:](v15, "setAccessibilityTraits:", v28);
            -[TSDSwatchAccessibilityElement setSwatchElement:](v15, "setSwatchElement:", v13);
            -[TSDSwatchGridViewAccessibility bounds](self, "bounds");
            v17 = v16;
            v19 = v18;
            v21 = v20;
            v23 = v22;
            if ((objc_opt_respondsToSelector(self, "p_swatchRectForSwatchAtRow:column:") & 1) != 0)
            {
              -[TSDSwatchGridViewAccessibility p_swatchRectForSwatchAtRow:column:](self, "p_swatchRectForSwatchAtRow:column:", i, v9);
              v17 = v24;
              v19 = v25;
              v21 = v26;
              v23 = v27;
            }
            -[TSDSwatchGridViewAccessibility tsaxFrameFromBounds:](self, "tsaxFrameFromBounds:", v17, v19, v21, v23);
            -[TSDSwatchAccessibilityElement setAccessibilityFrame:](v15, "setAccessibilityFrame:");
            -[TSDSwatchAccessibilityElement setAccessibilityLabel:](v15, "setAccessibilityLabel:", v14);
            objc_msgSend(a3, "addObject:", v15);

          }
        }
      }
      ++v9;
    }
    while (v9 != v6);
  }
}

- (void)setSelectedItem:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  UIAccessibilityTraits v9;
  UIAccessibilityTraits v10;
  void *i;
  void *v12;
  UIAccessibilityTraits v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)TSDSwatchGridViewAccessibility;
  -[TSDSwatchGridViewAccessibility setSelectedItem:](&v18, "setSelectedItem:");
  v5 = -[TSDSwatchGridViewAccessibility tsaxChildren](self, "tsaxChildren");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = UIAccessibilityTraitButton;
    v10 = UIAccessibilityTraitSelected;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "swatchElement") == a3)
          v13 = v10;
        else
          v13 = 0;
        objc_msgSend(v12, "setAccessibilityTraits:", v9 | v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }
}

@end
