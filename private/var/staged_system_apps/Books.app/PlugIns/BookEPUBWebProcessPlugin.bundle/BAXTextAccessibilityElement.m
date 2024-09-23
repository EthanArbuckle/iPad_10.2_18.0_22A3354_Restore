@implementation BAXTextAccessibilityElement

- (NSTimer)_baxIsSettingSelectionTimer
{
  return (NSTimer *)__BAXGetAssociatedObject(self, &unk_271A0);
}

- (void)_baxSetIsSettingSelectionTimer:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_271A0, a3);
}

- (BAXTextAccessibilityElement)initWithReferenceElement:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  BAXTextAccessibilityElement *v8;
  BAXTextAccessibilityElement *v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)BAXTextAccessibilityElement;
    v8 = -[BAXTextAccessibilityElement initWithAccessibilityContainer:](&v13, "initWithAccessibilityContainer:", v7);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BAXTextAccessibilityElement;
    v8 = -[BAXTextAccessibilityElement init](&v12, "init");
  }
  v9 = v8;
  if (v8)
  {
    -[BAXTextAccessibilityElement setReferenceElement:](v8, "setReferenceElement:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityAttributedValue"));
    -[BAXTextAccessibilityElement setAccessibilityAttributedValue:](v9, "setAccessibilityAttributedValue:", v10);

    objc_msgSend(v6, "accessibilityFrame");
    -[BAXTextAccessibilityElement setAccessibilityFrame:](v9, "setAccessibilityFrame:");
    -[BAXTextAccessibilityElement setAccessibilityTraits:](v9, "setAccessibilityTraits:", objc_msgSend(v6, "accessibilityTraits"));
  }

  return v9;
}

- (BAXTextAccessibilityElement)initWithReferenceElement:(id)a3 container:(id)a4 attributedValue:(id)a5 accessibilityFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  BAXTextAccessibilityElement *v16;
  BAXTextAccessibilityElement *v17;
  objc_super v19;
  objc_super v20;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v14)
  {
    v20.receiver = self;
    v20.super_class = (Class)BAXTextAccessibilityElement;
    v16 = -[BAXTextAccessibilityElement initWithAccessibilityContainer:](&v20, "initWithAccessibilityContainer:", v14);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)BAXTextAccessibilityElement;
    v16 = -[BAXTextAccessibilityElement init](&v19, "init");
  }
  v17 = v16;
  if (v16)
  {
    -[BAXTextAccessibilityElement setReferenceElement:](v16, "setReferenceElement:", v13);
    -[BAXTextAccessibilityElement setAccessibilityAttributedValue:](v17, "setAccessibilityAttributedValue:", v15);
    -[BAXTextAccessibilityElement setAccessibilityFrame:](v17, "setAccessibilityFrame:", x, y, width, height);
    -[BAXTextAccessibilityElement setAccessibilityTraits:](v17, "setAccessibilityTraits:", objc_msgSend(v13, "accessibilityTraits"));
  }

  return v17;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  UIAccessibilityTraits v6;
  UIAccessibilityTraits v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BAXTextAccessibilityElement;
  v3 = UIAccessibilityTraitWebContent | -[BAXTextAccessibilityElement accessibilityTraits](&v9, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v5 = (unint64_t)objc_msgSend(v4, "accessibilityTraits");
  v6 = UIAccessibilityTraitHeader;

  if ((v6 & v5) != 0)
    v7 = v6;
  else
    v7 = 0;
  return v3 | v7;
}

- (id)accessibilityPreviousTextNavigationElement
{
  return -[BAXTextAccessibilityElement previousNavigableElement](self, "previousNavigableElement");
}

- (id)accessibilityNextTextNavigationElement
{
  return -[BAXTextAccessibilityElement nextNavigableElement](self, "nextNavigableElement");
}

- (_NSRange)_accessibilityRangeForTextMarker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = objc_msgSend(v5, "_accessibilityRangeForTextMarker:", v4);
  v8 = v7;

  v9 = (NSUInteger)v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_accessibilityTextMarkerRange
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_accessibilityTextMarkerRange"));

  return v3;
}

- (id)stringForTextMarkers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForTextMarkers:", v4));

  return v6;
}

- (id)accessibilityStringForTextMarkers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityStringForTextMarkers:", v4));

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumber:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = objc_opt_respondsToSelector(v5, "_accessibilityRangeForLineNumber:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
    v8 = objc_msgSend(v7, "_accessibilityRangeForLineNumber:", a3);
    v10 = v9;

    v11 = (NSUInteger)v8;
    v12 = v10;
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)accessibilityContentForLineNumber:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = objc_opt_respondsToSelector(v5, "accessibilityContentForLineNumber:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityContentForLineNumber:", a3));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)accessibilityAttributedContentForLineNumber:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = objc_opt_respondsToSelector(v5, "accessibilityAttributedContentForLineNumber:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityAttributedContentForLineNumber:", a3));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = objc_opt_respondsToSelector(v5, "accessibilityFrameForLineNumber:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
    objc_msgSend(v7, "accessibilityFrameForLineNumber:", a3);
    x = v8;
    y = v10;
    width = v12;
    height = v14;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)accessibilityBoundsForTextMarkers:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
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
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v5, "accessibilityBoundsForTextMarkers:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)_accessibilityLineEndMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityLineEndMarker:", v4));

  return v6;
}

- (id)_accessibilityLineStartMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityLineStartMarker:", v4));

  return v6;
}

- (id)accessibilityArrayOfTextForTextMarkers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityArrayOfTextForTextMarkers:", v4));

  return v6;
}

- (id)_accessibilityNextMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityNextMarker:", v4));

  return v6;
}

- (id)_accessibilityPreviousMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityPreviousMarker:", v4));

  return v6;
}

- (id)_accessibilityObjectForTextMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityObjectForTextMarker:", v4));

  return v6;
}

- (id)_accessibilityTextMarkerForPosition:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_accessibilityTextMarkerForPosition:", a3));

  return v5;
}

- (BOOL)accessibilitySupportsTextSelection
{
  return 1;
}

- (BOOL)_accessibilityHasTextOperations
{
  return 1;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "performableOperations"));

  v6 = objc_msgSend(v5, "containsObject:", v3);
  if (v6)
    +[BEAXWebContentUtilities performNativeAction:](BEAXWebContentUtilities, "performNativeAction:", v3);

  return v6;
}

- (id)_accessibilityTextOperations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "performableOperations"));

  return v3;
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v5, "_accessibilityIncreaseSelection:", v4);

}

- (void)_accessibilityDecreaseSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v5, "_accessibilityDecreaseSelection:", v4);

}

- (void)_accessibilityModifySelection:(id)a3 increase:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v7, "_accessibilityModifySelection:increase:", v6, v4);

}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v3 = objc_msgSend(v2, "_accessibilitySelectedTextRange");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);

}

- (id)_accessibilityTextMarkerRangeForSelection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_accessibilityTextMarkerRangeForSelection"));

  return v3;
}

- (id)textMarkerForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textMarkerForPoint:", x, y));

  return v6;
}

- (void)_accessibilityMoveSelectionToMarker:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BAXTextAccessibilityElement _checkActions](self, "_checkActions");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v5, "_accessibilityMoveSelectionToMarker:", v4);

}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  return 1;
}

- (id)accessibilityTextualContext
{
  return UIAccessibilityTextualContextNarrative;
}

- (void)_checkActions
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_111E4;
  block[3] = &unk_20768;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)trimElementSpanningPageBoundary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[BAXTextAccessibilityElement _rangeForVisibleContent](self, "_rangeForVisibleContent");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedStringForRange:", v3, v5));

  -[BAXTextAccessibilityElement setAccessibilityAttributedValue:](self, "setAccessibilityAttributedValue:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v7, "frameForRange:", v3, v5);
  -[BAXTextAccessibilityElement setAccessibilityFrame:](self, "setAccessibilityFrame:");

}

- (BOOL)isVisible
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  void *v10;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  BOOL v21;
  void *v22;
  double v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[BAXTextAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  -[BAXTextAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v6 = v4 + v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  objc_msgSend(v7, "accessibilityVisibleContentRect");
  v9 = v6 > v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  objc_msgSend(v10, "secondaryVisibleContentRect");
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v27.origin.x = CGRectZero.origin.x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v14 = CGRectEqualToRect(v25, v27);

  if (!v14)
  {
    -[BAXTextAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
    v16 = v15;
    -[BAXTextAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
    v18 = v16 + v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
    objc_msgSend(v19, "accessibilityVisibleContentRect");
    v9 = v18 < v20;

  }
  -[BAXTextAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v28.origin.x = CGRectZero.origin.x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v21 = CGRectEqualToRect(v26, v28);
  if (!v21 && v9)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
    objc_msgSend(v22, "accessibilityFrame");
    v21 = v23 == 0.0;

  }
  return !v21;
}

- (BOOL)_accessibilitySpeakThisCanBeHighlighted
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_accessibilitySpeakThisString
{
  return -[BAXTextAccessibilityElement _stringForVisibleContent](self, "_stringForVisibleContent");
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:", location, length, v9, v5));

  return v11;
}

- (_NSRange)_rangeForVisibleContent
{
  void *v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v4 = objc_msgSend(v3, "accessibilityVisibleCharacterRange");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v8 = objc_msgSend(v7, "elementTextRange");

  v9 = (NSUInteger)v4 + (_QWORD)v8;
  v10 = v6;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_stringForVisibleContent
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXTextAccessibilityElement referenceElement](self, "referenceElement"));
  v4 = -[BAXTextAccessibilityElement _rangeForVisibleContent](self, "_rangeForVisibleContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedStringForRange:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  return v7;
}

- (BAXTextAccessibilityElement)previousNavigableElement
{
  return self->_previousNavigableElement;
}

- (void)setPreviousNavigableElement:(id)a3
{
  objc_storeStrong((id *)&self->_previousNavigableElement, a3);
}

- (BAXTextAccessibilityElement)nextNavigableElement
{
  return self->_nextNavigableElement;
}

- (void)setNextNavigableElement:(id)a3
{
  objc_storeStrong((id *)&self->_nextNavigableElement, a3);
}

- (BAXObjectWrapper)referenceElement
{
  return self->_referenceElement;
}

- (void)setReferenceElement:(id)a3
{
  objc_storeStrong((id *)&self->_referenceElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceElement, 0);
  objc_storeStrong((id *)&self->_nextNavigableElement, 0);
  objc_storeStrong((id *)&self->_previousNavigableElement, 0);
}

@end
