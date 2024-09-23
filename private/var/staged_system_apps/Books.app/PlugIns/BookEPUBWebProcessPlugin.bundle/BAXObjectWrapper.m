@implementation BAXObjectWrapper

+ (id)baxTargetClassName
{
  return CFSTR("WebAccessibilityObjectWrapper");
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(BAXSafeCategory, a2);
}

- (UIAccessibilityCustomRotor)baxStoredHighlightRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_27162);
}

- (void)baxSetStoredHighlightRotor:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27162, a3);
}

- (NSNumber)baxStoredHighlightRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_27163);
}

- (void)baxSetStoredHighlightRotorIndex:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27163, a3);
}

- (UIAccessibilityCustomRotor)baxStoredLinkRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_27164);
}

- (void)baxSetStoredLinkRotor:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27164, a3);
}

- (NSMutableArray)baxStoredLinkInfos
{
  return (NSMutableArray *)__BAXGetAssociatedObject(self, &unk_27165);
}

- (void)baxSetStoredLinkInfos:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27165, a3);
}

- (NSNumber)baxStoredLinkRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_27166);
}

- (void)baxSetStoredLinkRotorIndex:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27166, a3);
}

- (NSArray)baxStoredLineInfos
{
  return (NSArray *)__BAXGetAssociatedObject(self, &unk_27167);
}

- (void)baxSetStoredLineInfos:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27167, a3);
}

- (NSAttributedString)baxStoredAttributedPageContent
{
  return (NSAttributedString *)__BAXGetAssociatedObject(self, &unk_27168);
}

- (void)baxSetStoredAttributedPageContent:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27168, a3);
}

- (_NSRange)baxStoredVisibleContentRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = __BAXGetAssociatedRange(self, &unk_27169);
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)baxSetStoredVisibleContentRange:(_NSRange)a3
{
  __BAXSetAssociatedRange(self, &unk_27169, a3.location, a3.length);
}

- (BEAttachmentElement)_baxCachedAttachmentElement
{
  return (BEAttachmentElement *)__BAXGetAssociatedObject(self, &unk_2716A);
}

- (void)_baxSetCachedAttachmentElement:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2716A, a3);
}

- (NSTimer)_baxIsSettingSelectionTimer
{
  return (NSTimer *)__BAXGetAssociatedObject(self, &unk_2716B);
}

- (void)_baxSetIsSettingSelectionTimer:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2716B, a3);
}

- (BOOL)_baxIsTurning
{
  return __BAXGetAssociatedBool(self, &unk_2716C);
}

- (void)_baxSetIsTurning:(BOOL)a3
{
  __BAXSetAssociatedBool(self, &unk_2716C, a3);
}

- (id)baxBookContentElement
{
  BAXObjectWrapper *v2;
  Class v3;
  uint64_t v4;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      v3 = NSClassFromString(CFSTR("WebAccessibilityObjectWrapper"));
      if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
      {
        if (-[BAXObjectWrapper baxIsBookContentElement](v2, "baxIsBookContentElement"))
          break;
      }
      v4 = objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityContainer](v2, "accessibilityContainer"));

      v2 = (BAXObjectWrapper *)v4;
      if (!v4)
        goto LABEL_7;
    }
    v2 = v2;
  }
LABEL_7:

  return v2;
}

- (void)baxInvalidateCaches
{
  BAXObjectWrapper *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[BAXObjectWrapper baxSetStoredLinkRotorIndex:](self, "baxSetStoredLinkRotorIndex:", 0);
  -[BAXObjectWrapper baxSetStoredLinkRotorIndex:](self, "baxSetStoredLinkRotorIndex:", 0);
  -[BAXObjectWrapper baxSetStoredLinkRotor:](self, "baxSetStoredLinkRotor:", 0);
  -[BAXObjectWrapper baxSetStoredHighlightRotor:](self, "baxSetStoredHighlightRotor:", 0);
  -[BAXObjectWrapper baxSetStoredLinkInfos:](self, "baxSetStoredLinkInfos:", 0);
  -[BAXObjectWrapper baxSetStoredAttributedPageContent:](self, "baxSetStoredAttributedPageContent:", 0);
  -[BAXObjectWrapper _baxSetCachedAttachmentElement:](self, "_baxSetCachedAttachmentElement:", 0);
  -[BAXObjectWrapper _baxSetIsTurning:](self, "_baxSetIsTurning:", 0);
  v3 = self;
  objc_setAssociatedObject(v3, objc_msgSend(CFSTR("StoredIsInteractiveElement"), "hash"), 0, (char *)&dword_0 + 1);

  if ((uint64_t)-[BAXObjectWrapper accessibilityElementCount](v3, "accessibilityElementCount") >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityElementAtIndex:](v3, "accessibilityElementAtIndex:", v4));
      v7 = (void *)objc_opt_class(BAXObjectWrapper, v6);
      v8 = __BAXCastAsSafeCategory(v7, v5, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "baxInvalidateCaches");

      ++v4;
    }
    while (v4 < (uint64_t)-[BAXObjectWrapper accessibilityElementCount](v3, "accessibilityElementCount"));
  }
}

- (void)baxInvalidateLineInfos
{
  -[BAXObjectWrapper baxSetStoredLineInfos:](self, "baxSetStoredLineInfos:", 0);
}

- (BEAttachmentElement)baxAttachmentElement
{
  BEAttachmentElement *v3;

  v3 = (BEAttachmentElement *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _baxCachedAttachmentElement](self, "_baxCachedAttachmentElement"));
  if (v3)
    goto LABEL_4;
  if (-[BAXObjectWrapper baxNeedsAttachmentElement](self, "baxNeedsAttachmentElement"))
  {
    v3 = -[BEAttachmentElement initWithObjectWrapperElement:]([BEAttachmentElement alloc], "initWithObjectWrapperElement:", self);
    -[BAXObjectWrapper _baxSetCachedAttachmentElement:](self, "_baxSetCachedAttachmentElement:", v3);
LABEL_4:

  }
  return -[BAXObjectWrapper _baxCachedAttachmentElement](self, "_baxCachedAttachmentElement");
}

- (BOOL)baxNeedsAttachmentElement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BAXObjectWrapper;
  return (UIAccessibilityTraitImage & -[BAXObjectWrapper accessibilityTraits](&v3, "accessibilityTraits")) != 0;
}

- (NSAttributedString)baxRawAttributedString
{
  return (NSAttributedString *)-[BAXObjectWrapper baxValueForKey:](self, "baxValueForKey:", CFSTR("attributedStringForElement"));
}

- (BOOL)baxElementIsInteractive
{
  unint64_t v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BAXObjectWrapper;
  v2 = -[BAXObjectWrapper accessibilityTraits](&v4, "accessibilityTraits");
  if ((UIAccessibilityTraitStaticText & v2) != 0)
    return 0;
  if (((UIAccessibilityTraitAdjustable | UIAccessibilityTraitButton | UIAccessibilityTraitPopupButton | UIAccessibilityTraitRadioButton | UIAccessibilityTraitStartsMediaSession) & v2) != 0)
    return (UIAccessibilityTraitImage & v2) == 0;
  return 0;
}

- (BOOL)isAccessibilityElement
{
  unint64_t v4;
  unsigned __int8 v5;
  UIAccessibilityTraits v6;
  unsigned __int8 v7;
  char v8;
  objc_super v9;

  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    return -[BAXObjectWrapper isAccessibilityElement](&v9, "isAccessibilityElement");
  }
  else
  {
    v4 = -[BAXObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    v5 = -[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement");
    v6 = UIAccessibilityTraitLink;
    v7 = -[BAXObjectWrapper baxElementIsInteractive](self, "baxElementIsInteractive");
    if ((v6 & ~v4) != 0)
      v8 = v7;
    else
      v8 = 1;
    return v8 | v5;
  }
}

- (BOOL)accessibilityActivate
{
  unint64_t v3;
  BOOL v4;
  objc_super v6;

  v3 = -[BAXObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  v4 = (UIAccessibilityTraitLink & ~v3) != 0;
  if (-[BAXObjectWrapper baxElementIsInteractive](self, "baxElementIsInteractive"))
  {
    v6.receiver = self;
    v6.super_class = (Class)BAXObjectWrapper;
    return -[BAXObjectWrapper accessibilityActivate](&v6, "accessibilityActivate");
  }
  return v4;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  if (BEBooksWebKitAccessibility())
  {
    v3 = -[BAXObjectWrapper accessibilityValue](&v8, "accessibilityValue", v6.receiver, v6.super_class, v7.receiver, v7.super_class, self, BAXObjectWrapper);
LABEL_8:
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    return v4;
  }
  if (-[BAXObjectWrapper baxElementIsInteractive](self, "baxElementIsInteractive"))
  {
    v3 = -[BAXObjectWrapper accessibilityValue](&v7, "accessibilityValue", v6.receiver, v6.super_class, self, BAXObjectWrapper, v8.receiver, v8.super_class);
    goto LABEL_8;
  }
  if (!-[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement"))
  {
    v3 = -[BAXObjectWrapper accessibilityValue](&v6, "accessibilityValue", self, BAXObjectWrapper, v7.receiver, v7.super_class, v8.receiver, v8.super_class);
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityPageContent](self, "accessibilityPageContent"));
  return v4;
}

- (id)accessibilityAttributedValue
{
  id v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (BEBooksWebKitAccessibility())
  {
    v3 = -[BAXObjectWrapper accessibilityAttributedValue](&v7, "accessibilityAttributedValue", v6.receiver, v6.super_class, self, BAXObjectWrapper);
LABEL_6:
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    return v4;
  }
  if (!-[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement"))
  {
    v3 = -[BAXObjectWrapper accessibilityAttributedValue](&v6, "accessibilityAttributedValue", self, BAXObjectWrapper, v7.receiver, v7.super_class);
    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityAttributedPageContent](self, "accessibilityAttributedPageContent"));
  return v4;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  objc_super v21;
  objc_super v22;

  v6 = a4;
  if (BEBooksWebKitAccessibility())
  {
    v7 = -[BAXObjectWrapper _iosAccessibilityAttributeValue:forParameter:](&v22, "_iosAccessibilityAttributeValue:forParameter:", a3, v6, v21.receiver, v21.super_class, self, BAXObjectWrapper);
LABEL_11:
    v19 = (void *)objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_12;
  }
  if (a3 != 92700)
  {
    v7 = -[BAXObjectWrapper _iosAccessibilityAttributeValue:forParameter:](&v21, "_iosAccessibilityAttributeValue:forParameter:", a3, v6, self, BAXObjectWrapper, v22.receiver, v22.super_class);
    goto LABEL_11;
  }
  objc_msgSend(v6, "pointValue");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityParentView](self, "_accessibilityParentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
    objc_msgSend(v14, "convertPoint:toView:", v12, v9, v11);
    v9 = v15;
    v11 = v16;

  }
  v17 = -[BAXObjectWrapper accessibilityLineNumberForPoint:](self, "accessibilityLineNumberForPoint:", v9, v11);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFLL;
  else
    v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));

LABEL_12:
  return v19;
}

- (BOOL)accessibilitySupportsTextSelection
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BAXObjectWrapper;
  v3 = -[BAXObjectWrapper accessibilityTraits](&v5, "accessibilityTraits");
  if ((BEBooksWebKitAccessibility() & 1) == 0
    && -[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement"))
  {
    return v3 & ~UIAccessibilityTraitWebContent | UIAccessibilityTraitBookContent | UIAccessibilityTraitCausesPageTurn;
  }
  return v3;
}

- (id)accessibilityTextualContext
{
  return UIAccessibilityTextualContextNarrative;
}

- (id)accessibilityLanguage
{
  return 0;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v5 = +[BEAXWebContentUtilities lineRangeForCharacterPosition:forBookContentElement:](BEAXWebContentUtilities, "lineRangeForCharacterPosition:forBookContentElement:", a3, v4);
  v7 = v6;

  v8 = (NSUInteger)v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  char *v9;
  _BOOL4 v11;
  _BOOL4 v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v4 = +[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:](BEAXWebContentUtilities, "visibleTextRangeInChapterForBookContentElement:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityTextMarkerRangeForSelection](self, "_accessibilityTextMarkerRangeForSelection"));
  if (objc_msgSend(v5, "count") == (char *)&dword_0 + 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (char *)((_BYTE *)-[BAXObjectWrapper _accessibilityRangeForTextMarker:](self, "_accessibilityRangeForTextMarker:", v6)- v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    v9 = (char *)((_BYTE *)-[BAXObjectWrapper _accessibilityRangeForTextMarker:](self, "_accessibilityRangeForTextMarker:", v8)- v4);

    v11 = v7 != (char *)0x7FFFFFFFFFFFFFFFLL && v9 != (char *)0x7FFFFFFFFFFFFFFFLL;
    v12 = (uint64_t)v9 > (uint64_t)v7;
    if (v11 && v12)
      v13 = v9 - v7;
    else
      v13 = 0;
    if (v11 && v12)
      v14 = (uint64_t)v7;
    else
      v14 = 0x7FFFFFFFLL;
  }
  else
  {
    v13 = 0;
    v14 = 0x7FFFFFFFLL;
  }

  v15 = v14;
  v16 = v13;
  result.length = v16;
  result.location = v15;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v7 = (char *)+[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:](BEAXWebContentUtilities, "visibleTextRangeInChapterForBookContentElement:", v6);

  v8 = &v7[location];
  -[BAXObjectWrapper checkActions](self, "checkActions");
  if (length)
  {
    v18.receiver = self;
    v18.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilitySetSelectedTextRange:](&v18, "_accessibilitySetSelectedTextRange:", v8, length);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    +[BEAXWebContentUtilities frameForRange:forBookContentElement:](BEAXWebContentUtilities, "frameForRange:forBookContentElement:", v8, 0, v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    +[BEAXWebContentUtilities jsSetSelectionWithFrame:](BEAXWebContentUtilities, "jsSetSelectionWithFrame:", v11, v13, v15, v17);
  }
}

- (void)checkActions
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9314;
  block[3] = &unk_20768;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_oldAccessibilitySetSelectedTextRange:(_NSRange)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BAXObjectWrapper;
  -[BAXObjectWrapper _accessibilitySetSelectedTextRange:](&v3, "_accessibilitySetSelectedTextRange:", a3.location, a3.length);
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v5;
  void *v7;
  void *v8;
  objc_super v9;

  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    v5 = -[BAXObjectWrapper _accessibilityAttributedValueForRange:](&v9, "_accessibilityAttributedValueForRange:", a3);
    return (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXWebContentUtilities attributedValueForRange:forBookContentElement:](BEAXWebContentUtilities, "attributedValueForRange:forBookContentElement:", a3->location, a3->length, v7));

    return v8;
  }
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (BEBooksWebKitAccessibility())
  {
    v23.receiver = self;
    v23.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilityBoundsForRange:](&v23, "_accessibilityBoundsForRange:", location, length);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    +[BEAXWebContentUtilities frameForRange:forBookContentElement:](BEAXWebContentUtilities, "frameForRange:forBookContentElement:", location, length, v14);
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;

  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)baxBoundsForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)BAXObjectWrapper;
  -[BAXObjectWrapper _accessibilityBoundsForRange:](&v7, "_accessibilityBoundsForRange:", a3.location, a3.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
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

- (id)_accessibilitySupportsReadingContent
{
  void *v3;

  v3 = &__kCFBooleanFalse;
  if ((BEBooksWebKitAccessibility() & 1) == 0
    && -[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement"))
  {
    return &__kCFBooleanTrue;
  }
  return v3;
}

- (id)accessibilityContainer
{
  id v3;
  void *v4;
  BAXObjectWrapper *v5;
  id AssociatedObject;
  void *v7;
  id v8;
  void *v9;
  Class v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BAXObjectWrapper;
  v3 = -[BAXObjectWrapper accessibilityContainer](&v20, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = self;
  AssociatedObject = objc_getAssociatedObject(v5, objc_msgSend(CFSTR("StoredIsInteractiveElement"), "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  if (objc_msgSend(v7, "BOOLValue"))
  {
    v8 = v4;
    v4 = v8;
    if (v8)
    {
      v9 = v8;
      while (1)
      {
        v10 = NSClassFromString(CFSTR("WKAccessibilityWebPageObject"));
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          break;
        v12 = (void *)objc_opt_class(BAXObjectWrapper, v11);
        v13 = __BAXCastAsSafeCategory(v12, v9, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = v14;
        if (v14)
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_bkaxSuperAccessibilityContainer"));
        else
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessibilityContainer"));
        v17 = (void *)v16;

        v9 = v17;
        if (!v17)
          goto LABEL_11;
      }
      v18 = v9;

      v4 = v18;
    }
  }
LABEL_11:

  return v4;
}

- (id)_bkaxSuperAccessibilityContainer
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BAXObjectWrapper;
  v2 = -[BAXObjectWrapper accessibilityContainer](&v4, "accessibilityContainer");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)accessibilityPageContent
{
  id v3;
  void *v5;
  void *v6;
  objc_super v7;

  if (BEBooksWebKitAccessibility())
  {
    v7.receiver = self;
    v7.super_class = (Class)BAXObjectWrapper;
    v3 = -[BAXObjectWrapper accessibilityPageContent](&v7, "accessibilityPageContent");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }
  else if (-[BAXObjectWrapper baxElementIsInteractive](self, "baxElementIsInteractive"))
  {
    return 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityAttributedPageContent](self, "accessibilityAttributedPageContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));

    return v6;
  }
}

- (id)accessibilityAttributedPageContent
{
  id v3;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  void *v10;

  if ((BEBooksWebKitAccessibility() & 1) == 0
    && !-[BAXObjectWrapper baxNeedsAttachmentElement](self, "baxNeedsAttachmentElement"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v3 = (id)objc_claimAutoreleasedReturnValue(+[BEAXWebContentUtilities attributedPageContentForBookContentElement:](BEAXWebContentUtilities, "attributedPageContentForBookContentElement:", v5));

    if (v3)
      return v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v7 = -[BAXObjectWrapper _elementContainsImageForSpeakScreen:](self, "_elementContainsImageForSpeakScreen:", v6);

    if (v7)
    {
      v8 = objc_alloc((Class)NSAttributedString);
      v9 = BAXLocString(CFSTR("image"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v3 = objc_msgSend(v8, "initWithString:", v10);

      return v3;
    }
  }
  v3 = 0;
  return v3;
}

- (int64_t)accessibilityLineNumberForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  int64_t v8;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    return -[BAXObjectWrapper accessibilityLineNumberForPoint:](&v9, "accessibilityLineNumberForPoint:", x, y);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v8 = +[BEAXWebContentUtilities lineNumberForPoint:forBookContentElement:](BEAXWebContentUtilities, "lineNumberForPoint:forBookContentElement:", v7, x, y);

    return v8;
  }
}

- (id)accessibilityContentForLineNumber:(int64_t)a3
{
  id v5;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (BEBooksWebKitAccessibility())
  {
    v10.receiver = self;
    v10.super_class = (Class)BAXObjectWrapper;
    v5 = -[BAXObjectWrapper accessibilityContentForLineNumber:](&v10, "accessibilityContentForLineNumber:", a3);
    return (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXWebContentUtilities attributedStringForLineNumber:forBookContentElement:](BEAXWebContentUtilities, "attributedStringForLineNumber:forBookContentElement:", a3, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));

    return v9;
  }
}

- (id)accessibilityAttributedContentForLineNumber:(int64_t)a3
{
  id v5;
  void *v7;
  void *v8;
  objc_super v9;

  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    v5 = -[BAXObjectWrapper accessibilityAttributedContentForLineNumber:](&v9, "accessibilityAttributedContentForLineNumber:", a3);
    return (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXWebContentUtilities attributedStringForLineNumber:forBookContentElement:](BEAXWebContentUtilities, "attributedStringForLineNumber:forBookContentElement:", a3, v7));

    return v8;
  }
}

- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect result;

  if (BEBooksWebKitAccessibility())
  {
    v22.receiver = self;
    v22.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper accessibilityFrameForLineNumber:](&v22, "accessibilityFrameForLineNumber:", a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    +[BEAXWebContentUtilities frameForLineNumber:forBookContentElement:](BEAXWebContentUtilities, "frameForLineNumber:forBookContentElement:", a3, v13);
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = v17;

  }
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_accessibilityFrameForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  _QWORD v37[2];
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (BEBooksWebKitAccessibility())
  {
    v36.receiver = self;
    v36.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilityFrameForRange:](&v36, "_accessibilityFrameForRange:", location, length);
    x = v6;
    y = v8;
    width = v10;
    height = v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v15 = (char *)+[BEAXWebContentUtilities chapterRangeForRange:forBookContentElement:](BEAXWebContentUtilities, "chapterRangeForRange:forBookContentElement:", location, length, v14);
    v17 = v16;

    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:", v15));
    v19 = objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:", &v15[v17]));
    v20 = (void *)v19;
    if (v18)
      v21 = v19 == 0;
    else
      v21 = 1;
    if (!v21)
    {
      v37[0] = v18;
      v37[1] = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v22));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lineRectsAndText"));

      if (objc_msgSend(v25, "count"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("rect")));
        objc_msgSend(v27, "CGRectValue");
        x = v28;
        y = v29;
        width = v30;
        height = v31;

      }
    }

  }
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (_NSRange)_accessibilityRangeForLineNumber:(int64_t)a3
{
  id v5;
  NSUInteger v6;
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  objc_super v11;
  _NSRange result;

  if (BEBooksWebKitAccessibility())
  {
    v11.receiver = self;
    v11.super_class = (Class)BAXObjectWrapper;
    v5 = -[BAXObjectWrapper _accessibilityRangeForLineNumber:](&v11, "_accessibilityRangeForLineNumber:", a3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    v8 = +[BEAXWebContentUtilities lineRangeForLineNumber:forBookContentElement:](BEAXWebContentUtilities, "lineRangeForLineNumber:forBookContentElement:", a3, v7);
    v10 = v9;

    v5 = v8;
    v6 = v10;
  }
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (BOOL)_accessibilityReadAllContinuesWithScroll
{
  objc_super v4;

  if (!BEBooksWebKitAccessibility())
    return -[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement");
  v4.receiver = self;
  v4.super_class = (Class)BAXObjectWrapper;
  return -[BAXObjectWrapper _accessibilityReadAllContinuesWithScroll](&v4, "_accessibilityReadAllContinuesWithScroll");
}

- (id)_accessibilityInternalTextLinks
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo linkElementsForElement:](BEAXLineInfo, "linkElementsForElement:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        if (v10)
        {
          v11 = objc_alloc((Class)UIAccessibilityLinkSubelement);
          v12 = objc_msgSend(v11, "initWithAccessibilityContainer:", v10, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
          objc_msgSend(v12, "setAccessibilityLabel:", v13);

          objc_msgSend(v4, "addObject:", v12);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v14 = objc_msgSend(v4, "copy");
  else
    v14 = 0;

  return v14;
}

- (id)visibleLinkElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  CGPoint v31;
  CGRect v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  if ((objc_msgSend(v6, "isFixedLayoutBook") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    objc_msgSend(v7, "accessibilityVisibleContentRect");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    objc_msgSend(v7, "primaryVisibleContentRect");
  }
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "accessibilityFrame", (_QWORD)v26);
        v31.x = v22;
        v31.y = v23;
        v32.origin.x = v12;
        v32.origin.y = v13;
        v32.size.width = v14;
        v32.size.height = v15;
        if (CGRectContainsPoint(v32, v31))
          objc_msgSend(v5, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v5, "count"))
    v24 = objc_msgSend(v5, "copy");
  else
    v24 = 0;

  return v24;
}

- (id)_accessibilityInternalTextLinkCustomRotors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(id *, void *);
  void *v15;
  BAXObjectWrapper *v16;
  id v17;
  id v18;
  id location;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkInfos](self, "baxStoredLinkInfos"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityInternalTextLinks](self, "_accessibilityInternalTextLinks"));
    v5 = objc_msgSend(v4, "mutableCopy");
    -[BAXObjectWrapper baxSetStoredLinkInfos:](self, "baxSetStoredLinkInfos:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkInfos](self, "baxStoredLinkInfos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper visibleLinkElements:](self, "visibleLinkElements:", v6));

  if (!objc_msgSend(v7, "count"))
    goto LABEL_8;
  objc_initWeak(&location, self);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkRotor](self, "baxStoredLinkRotor"));
  if (!v8)
  {
    v9 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_A478;
    v15 = &unk_20790;
    objc_copyWeak(&v18, &location);
    v16 = self;
    v17 = v7;
    v8 = objc_msgSend(v9, "initWithSystemType:itemSearchBlock:", 1, &v12);
    -[BAXObjectWrapper baxSetStoredLinkRotor:](self, "baxSetStoredLinkRotor:", v8, v12, v13, v14, v15, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    if (v8)
      goto LABEL_7;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_destroyWeak(&location);
LABEL_7:
  v20 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

LABEL_9:
  return v10;
}

- (id)_baxHighlightRotor
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredHighlightRotor](self, "baxStoredHighlightRotor"));
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v5 = BAXLocString(CFSTR("highlights"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_A6C8;
    v11 = &unk_207B8;
    objc_copyWeak(&v12, &location);
    v3 = objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[BAXObjectWrapper baxSetStoredHighlightRotor:](self, "baxSetStoredHighlightRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)baxHighlightInfos
{
  return &__NSArray0__struct;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityInternalTextLinkCustomRotors](self, "_accessibilityInternalTextLinkCustomRotors"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkRotor](self, "baxStoredLinkRotor"));
      objc_msgSend(v3, "addObject:", v5);

    }
    v6 = objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _baxHighlightRotor](self, "_baxHighlightRotor"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[BAXObjectWrapper baxIsInPictureBook](self, "baxIsInPictureBook");

      if ((v8 & 1) == 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredHighlightRotor](self, "baxStoredHighlightRotor"));
        objc_msgSend(v3, "addObject:", v9);

      }
    }
  }
  if (objc_msgSend(v3, "count"))
    v10 = objc_msgSend(v3, "copy");
  else
    v10 = 0;

  return v10;
}

- (BOOL)_accessibilityPublicCustomRotorVisibleInTouchRotor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkRotor](self, "baxStoredLinkRotor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baxValueForKey:", CFSTR("uuid")));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredHighlightRotor](self, "baxStoredHighlightRotor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baxValueForKey:", CFSTR("uuid")));
  v10 = objc_msgSend(v9, "isEqual:", v4);

  return v10 | v7;
}

- (id)_accessibilitySpeakThisString
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  objc_msgSend(v3, "baxSetStoredAttributedPageContent:", 0);

  return -[BAXObjectWrapper accessibilityPageContent](self, "accessibilityPageContent");
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  objc_super v38;
  void *v39;
  _QWORD v40[2];

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  if ((objc_opt_respondsToSelector(v10, "lineRectsAndText") & 1) == 0)
  {

    goto LABEL_10;
  }
  v11 = objc_msgSend(v9, "length");

  if (!v11)
  {
LABEL_10:
    v38.receiver = self;
    v38.super_class = (Class)BAXObjectWrapper;
    v25 = -[BAXObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:](&v38, "_accessibilityTextRectsForSpeakThisStringRange:string:", location, length, v9);
    v24 = (id)objc_claimAutoreleasedReturnValue(v25);
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v13 = (char *)+[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:](BEAXWebContentUtilities, "visibleTextRangeInChapterForBookContentElement:", v12)+ location;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_AF5C;
  v36 = sub_AF6C;
  v37 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:", v13));
  v15 = objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:", &v13[length]));
  v16 = (void *)v15;
  v17 = 0;
  if (v14 && v15)
  {
    v40[0] = v14;
    v40[1] = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_accessibilityConvertDataArrayToTextMarkerArray:", v18));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_AF74;
    v27[3] = &unk_207E0;
    v31 = a5;
    v30 = &v32;
    v28 = v12;
    v17 = v19;
    v29 = v17;
    __BAXPerformSafeBlock(v27);

  }
  if (!objc_msgSend((id)v33[5], "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
    +[BEAXWebContentUtilities frameForRange:forBookContentElement:](BEAXWebContentUtilities, "frameForRange:forBookContentElement:", v13, length, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
    v39 = v21;
    v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    v23 = (void *)v33[5];
    v33[5] = v22;

  }
  v24 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
LABEL_11:

  return v24;
}

- (BOOL)_elementContainsImageForSpeakScreen:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;
  UIAccessibilityTraits v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "accessibilityElementCount");
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = 0;
    v10 = UIAccessibilityTraitImage;
    while (1)
    {
      v11 = (void *)objc_opt_class(BAXObjectWrapper, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityElementAtIndex:", v9));
      v13 = __BAXCastAsSafeCategory(v11, v12, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        if ((v10 & (unint64_t)objc_msgSend(v14, "accessibilityTraits")) != 0)
        {

          v8 = 1;
          goto LABEL_10;
        }
        v8 = -[BAXObjectWrapper _elementContainsImageForSpeakScreen:](self, "_elementContainsImageForSpeakScreen:", v14);
      }

      if (v7 == (id)++v9)
        goto LABEL_10;
    }
  }
  v8 = 0;
LABEL_10:

  return v8 & 1;
}

- (BOOL)baxIsBookContentElement
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxWebPageObject](self, "baxWebPageObject"));
  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityContainer](self, "accessibilityContainer")),
        v4,
        v4 == v3))
  {
    +[BEAccessibilityReadingState registerBookContentElement:](BEAccessibilityReadingState, "registerBookContentElement:", self);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)baxWebPageObject
{
  id v2;
  void *v3;
  Class v4;
  char isKindOfClass;
  uint64_t v6;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityContainer](self, "accessibilityContainer"));
  if (v2)
  {
    while (1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityContainer"));
      v4 = NSClassFromString(CFSTR("WKAccessibilityWebPageObject"));
      isKindOfClass = objc_opt_isKindOfClass(v3, v4);

      if ((isKindOfClass & 1) != 0)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityContainer"));

      v2 = (id)v6;
      if (!v6)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (BOOL)baxIsInTableOfContents
{
  return 0;
}

- (BOOL)baxIsInPictureBook
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v3 = objc_msgSend(v2, "isFixedLayoutBook");

  return v3;
}

- (id)baxVisibleLineInfos
{
  void *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char *v14;
  void *i;
  void *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v4 = (char *)+[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:](BEAXWebContentUtilities, "visibleTextRangeInChapterForBookContentElement:", v3);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "baxStoredLineInfos"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    v14 = &v4[v6];
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v17 = (char *)objc_msgSend(v16, "rangeInChapter", (_QWORD)v25);
        v18 = (char *)objc_msgSend(v16, "rangeInChapter");
        v20 = &v18[v19];
        if (v4 <= v17 && v17 < v14 && v4 <= v20 && v20 < v14)
          objc_msgSend(v9, "addObject:", v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)text
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper textMarkerRange](self, "textMarkerRange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper stringForTextMarkers:](self, "stringForTextMarkers:", v3));

  return v4;
}

- (id)rects
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper lineRectsAndText](self, "lineRectsAndText"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "valueForKey:", CFSTR("rect"), (_QWORD)v12));
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      v10 = v3;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  objc_super v15;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper text](self, "text"));
  if ((unint64_t)objc_msgSend(v3, "length") > 0x3B)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 30));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", (char *)objc_msgSend(v3, "length") - 30));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@...%@"), v5, v6));

  }
  else
  {
    v4 = v3;
  }
  -[BAXObjectWrapper accessibilityFrame](self, "accessibilityFrame");
  v7 = NSStringFromCGRect(v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[BAXObjectWrapper baxIsBookContentElement](self, "baxIsBookContentElement");
  v15.receiver = self;
  v15.super_class = (Class)BAXObjectWrapper;
  v10 = -[BAXObjectWrapper accessibilityTraits](&v15, "accessibilityTraits");
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p isBookContentElement=%d frame=%@ superTraits=%d text=\"%@\"), objc_opt_class(self, v11), self, v9, v8, v10, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v4 = objc_msgSend(v3, "isVisiblePageBookmarked");

  v5 = objc_alloc((Class)UIAccessibilityCustomAction);
  if (v4)
    v6 = CFSTR("unbookmark.page");
  else
    v6 = CFSTR("bookmark.page");
  v7 = BAXLocString(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithName:actionHandler:", v8, &stru_20800);

  objc_msgSend(v2, "addObject:", v9);
  v10 = objc_msgSend(v2, "copy");

  return v10;
}

- (BOOL)_accessibilityScrollNextPage
{
  return -[BAXObjectWrapper accessibilityScroll:](self, "accessibilityScroll:", 5);
}

- (BOOL)_accessibilityScrollPreviousPage
{
  return -[BAXObjectWrapper accessibilityScroll:](self, "accessibilityScroll:", 6);
}

- (BOOL)_accessibilityScrollWithDirection:(int64_t)a3
{
  objc_super v4;
  objc_super v5;

  if (a3 == 6)
    return -[BAXObjectWrapper accessibilityScroll:](&v4, "accessibilityScroll:", 3, self, BAXObjectWrapper, v5.receiver, v5.super_class);
  if (a3 == 5)
    return -[BAXObjectWrapper accessibilityScroll:](&v5, "accessibilityScroll:", 4, v4.receiver, v4.super_class, self, BAXObjectWrapper);
  return 0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  BOOL v9;
  void *v10;
  char *v11;
  const __CFString *v12;
  objc_super v13;

  v5 = -[BAXObjectWrapper _accessibilityIsRTL](self, "_accessibilityIsRTL");
  if (a3 == 1 && (v5 & 1) != 0 || a3 == 2 && ((v5 ^ 1) & 1) != 0)
  {
    v6 = CFSTR("next");
  }
  else
  {
    v9 = a3 == 2;
    if (!v5)
      v9 = a3 == 1;
    v6 = CFSTR("previous");
    if (!v9)
    {
      if (a3 == 5)
      {
        v6 = CFSTR("next");
      }
      else if (a3 != 6)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
        v11 = (char *)objc_msgSend(v10, "bookLayout");

        if (v11 != (_BYTE *)&dword_0 + 2)
        {
          v13.receiver = self;
          v13.super_class = (Class)BAXObjectWrapper;
          return -[BAXObjectWrapper accessibilityScroll:](&v13, "accessibilityScroll:", a3);
        }
        if (a3 == 3)
          v12 = CFSTR("previous");
        else
          v12 = 0;
        if (a3 == 4)
          v6 = CFSTR("next");
        else
          v6 = v12;
      }
    }
  }
  +[BEAXWebContentUtilities turnPageWithDirection:](BEAXWebContentUtilities, "turnPageWithDirection:", v6);
  -[BAXObjectWrapper _dispatchPageScrolledNotification](self, "_dispatchPageScrolledNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxBookContentElement](self, "baxBookContentElement"));
  objc_msgSend(v7, "baxSetStoredAttributedPageContent:", 0);

  if (BEBooksWebKitAccessibility())
    -[BAXObjectWrapper baxInvalidateContainerCaches](self, "baxInvalidateContainerCaches");
  return 1;
}

- (void)baxInvalidateContainerCaches
{
  uint64_t v2;
  void *v3;
  Class v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper accessibilityContainer](self, "accessibilityContainer"));
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      v4 = NSClassFromString(CFSTR("WKAccessibilityWebPageObject"));
      if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityContainer"));

      v3 = (void *)v6;
      if (!v6)
        return;
    }
    v7 = (void *)objc_opt_class(BAXWebPageAccessibilityObjectWrapper, v5);
    v8 = __BAXCastAsSafeCategory(v7, v3, 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "_baxSetCachedAccessibilityElementTree:", 0);

  }
}

- (void)_dispatchPageScrolledNotification
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[BAXObjectWrapper _baxSetIsTurning:](self, "_baxSetIsTurning:", 1);
  v3 = dispatch_time(0, 150000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BB20;
  block[3] = &unk_20768;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v3 = objc_msgSend(v2, "pageCount");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v5 = objc_msgSend(v4, "currentPage");

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = BAXLocString(CFSTR("loading.book"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v8 = BAXLocString(CFSTR("page.num.of %@ %@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BAXObjectWrapper BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:](BAXObjectWrapper, "BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v10, 1, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BAXObjectWrapper BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:](BAXObjectWrapper, "BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v12, 1, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11, v13));
    v22 = __BAXStringForVariables(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)CFSTR("__BAXStringForVariablesSentinel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v22);

  }
  return v7;
}

+ (id)BAXLocalizedNumberForNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = a3;
  v9 = (void *)objc_opt_new(NSNumberFormatter, v8);
  objc_msgSend(v9, "setNumberStyle:", a4);
  objc_msgSend(v9, "setMaximumFractionDigits:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromNumber:", v7));

  return v10;
}

- (id)_axPageScrollString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  _UNKNOWN **v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  unsigned __int8 v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  id v78;
  const __CFString *v80;
  CFBooleanRef v81;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkInfos](self, "baxStoredLinkInfos"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper _accessibilityInternalTextLinks](self, "_accessibilityInternalTextLinks"));
    v5 = objc_msgSend(v4, "copy");
    -[BAXObjectWrapper baxSetStoredLinkInfos:](self, "baxSetStoredLinkInfos:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper baxStoredLinkInfos](self, "baxStoredLinkInfos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXObjectWrapper visibleLinkElements:](self, "visibleLinkElements:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleAnnotations"));

  v10 = objc_msgSend(v7, "count");
  v11 = objc_msgSend(v9, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v13 = objc_msgSend(v12, "pageCount");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v15 = (char *)objc_msgSend(v14, "currentPage");
  v17 = v16;

  v18 = &AXRequestingClient_ptr;
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = BAXLocString(CFSTR("page.num.of.loading"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }
  else if (v17 < 2)
  {
    v25 = BAXLocString(CFSTR("page.num.of.with.total.single %lu %lu"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v15, v13));

  }
  else
  {
    v21 = BAXLocString(CFSTR("page.num.of.with.total.spread %lu %lu %lu"));
    v22 = v9;
    v23 = v7;
    v24 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v15, &v15[v17 - 1], v13));

    v7 = v23;
    v9 = v22;
    v18 = &AXRequestingClient_ptr;
  }
  if (v10)
  {
    v27 = v18[49];
    v28 = BAXLocString(CFSTR("%lu link(s)"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringWithFormat:", v29, v10));

    v38 = __BAXStringForVariables(0, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v30);
    v10 = (id)objc_claimAutoreleasedReturnValue(v38);

  }
  if (v11)
  {
    v39 = v18[49];
    v40 = BAXLocString(CFSTR("%lu note(s)"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringWithFormat:", v41, v11));

    v50 = __BAXStringForVariables(v10, v43, v44, v45, v46, v47, v48, v49, (uint64_t)v42);
    v51 = objc_claimAutoreleasedReturnValue(v50);

    v10 = (id)v51;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v53 = objc_msgSend(v52, "isVisiblePageBookmarked");

  if ((v53 & 1) != 0)
  {
    v54 = BAXLocString(CFSTR("has.bookmark"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v63 = __BAXStringForVariables(v10, v56, v57, v58, v59, v60, v61, v62, (uint64_t)v55);
    v64 = objc_claimAutoreleasedReturnValue(v63);

    v10 = (id)v64;
  }
  v65 = objc_alloc((Class)NSMutableAttributedString);
  v73 = __BAXStringForVariables(v20, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v10);
  v74 = objc_claimAutoreleasedReturnValue(v73);
  v75 = (void *)v74;
  if (v74)
    v76 = (const __CFString *)v74;
  else
    v76 = &stru_20B88;
  v80 = CFSTR("UIAccessibilityTokenLowPitch");
  v81 = kCFBooleanTrue;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1));
  v78 = objc_msgSend(v65, "initWithString:attributes:", v76, v77);

  return v78;
}

- (BOOL)_accessibilityIsRTL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v3 = objc_msgSend(v2, "isRTL");

  return v3;
}

@end
