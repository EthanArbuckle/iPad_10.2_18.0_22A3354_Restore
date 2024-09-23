@implementation BAXWebPageAccessibilityObjectWrapper

+ (id)baxTargetClassName
{
  return CFSTR("WKAccessibilityWebPageObject");
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(BAXSafeCategory, a2);
}

- (NSArray)_baxCachedAccessibilityElementTree
{
  return (NSArray *)__BAXGetAssociatedObject(self, &unk_27158);
}

- (void)_baxSetCachedAccessibilityElementTree:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27158, a3);
}

- (int64_t)_baxIsTurningCounter
{
  return (int64_t)__BAXGetAssociatedInteger(self, &unk_27159);
}

- (void)_baxSetIsTurningCounter:(int64_t)a3
{
  __BAXSetAssociatedInteger(self, &unk_27159, (void *)a3);
}

- (UIAccessibilityCustomRotor)baxStoredLinkRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_2715A);
}

- (void)baxSetStoredLinkRotor:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2715A, a3);
}

- (NSNumber)baxStoredLinkRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_2715B);
}

- (void)baxSetStoredLinkRotorIndex:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2715B, a3);
}

- (UIAccessibilityCustomRotor)baxStoredHeadingsRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_2715C);
}

- (void)baxSetStoredHeadingsRotor:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2715C, a3);
}

- (NSNumber)baxStoredHeadingsRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_2715D);
}

- (void)baxSetStoredHeadingsRotorIndex:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2715D, a3);
}

- (NSMutableArray)baxStoredVisibleLinkInfos
{
  return (NSMutableArray *)__BAXGetAssociatedObject(self, &unk_2715E);
}

- (void)baxSetStoredVisibleLinkInfos:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2715E, a3);
}

- (UIAccessibilityCustomRotor)baxStoredHighlightRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_2715F);
}

- (void)baxSetStoredHighlightRotor:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_2715F, a3);
}

- (NSNumber)baxStoredHighlightRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_27160);
}

- (void)baxSetStoredHighlightRotorIndex:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27160, a3);
}

- (NSMutableArray)baxStoredVisibleLinkElements
{
  return (NSMutableArray *)__BAXGetAssociatedObject(self, &unk_27161);
}

- (void)baxSetStoredVisibleLinkElements:(id)a3
{
  __BAXSetAssociatedObject(self, &unk_27161, a3);
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  if (BEBooksWebKitAccessibility())
    +[BEAccessibilityReadingState registerBookContentWrapper:](BEAccessibilityReadingState, "registerBookContentWrapper:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _iosAccessibilityAttributeValue:](self, "_iosAccessibilityAttributeValue:", 2025));
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
  return -[BAXWebPageAccessibilityObjectWrapper isAccessibilityElement](&v6, "isAccessibilityElement");
}

- (id)accessibilityElements
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_super v10;

  +[BEAccessibilityReadingState registerBookContentWrapper:](BEAccessibilityReadingState, "registerBookContentWrapper:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((BEBooksWebKitAccessibility() & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    v4 = -[BAXWebPageAccessibilityObjectWrapper accessibilityElements](&v10, "accessibilityElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

    v3 = (void *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper bkaxAdditionalAXElementsForCurrentPage](self, "bkaxAdditionalAXElementsForCurrentPage"));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[BAXWebPageAccessibilityObjectWrapper _baxSetIsTurningCounter:](self, "_baxSetIsTurningCounter:", 0);
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (int64_t)accessibilityContainerType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
  return -[BAXWebPageAccessibilityObjectWrapper accessibilityContainerType](&v3, "accessibilityContainerType");
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  if (BEBooksWebKitAccessibility())
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper bkaxAdditionalAXElementsForCurrentPage](self, "bkaxAdditionalAXElementsForCurrentPage"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "accessibilityFrame");
          v21.x = x;
          v21.y = y;
          if (CGRectContainsPoint(v22, v21))
          {
            v12 = v11;

            return v12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    v13 = -[BAXWebPageAccessibilityObjectWrapper accessibilityHitTest:](&v15, "accessibilityHitTest:", x, y);
    v12 = (id)objc_claimAutoreleasedReturnValue(v13);
  }
  return v12;
}

- (id)bkaxAdditionalAXElementsForCurrentPage
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BAXTextAccessibilityElement *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  id v28;
  objc_super v30;
  BAXTextAccessibilityElement *v31;
  CGRect v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_opt_class(BAXObjectWrapper, v4);
  v30.receiver = self;
  v30.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
  v6 = -[BAXWebPageAccessibilityObjectWrapper accessibilityElements](&v30, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = __BAXCastAsSafeCategory(v5, v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    v12 = objc_msgSend(v11, "isPaginated");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v10, "accessibilityVisibleContentRect");
      if (CGRectGetMaxY(v32) < 0.0)
      {
        v28 = &__NSArray0__struct;
        goto LABEL_18;
      }
    }
    v13 = objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree"));
    if (!v13
      || (v14 = (void *)v13,
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree")), v16 = objc_msgSend(v15, "count"), v15, v14, !v16))
    {
      if ((BEBooksWebKitAccessibility() & 1) == 0)
        -[BAXWebPageAccessibilityObjectWrapper _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("CurrentlyFindingInteractiveDescendants"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredVisibleLinkInfos](self, "baxStoredVisibleLinkInfos"));

      if (!v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        -[BAXWebPageAccessibilityObjectWrapper baxSetStoredVisibleLinkInfos:](self, "baxSetStoredVisibleLinkInfos:", v18);

      }
      -[BAXWebPageAccessibilityObjectWrapper _addInteractiveDescendantsOfElement:toArray:rootElement:](self, "_addInteractiveDescendantsOfElement:toArray:rootElement:", v10, v3, v10);
      if ((BEBooksWebKitAccessibility() & 1) == 0)
        -[BAXWebPageAccessibilityObjectWrapper _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CurrentlyFindingInteractiveDescendants"));
      -[BAXWebPageAccessibilityObjectWrapper _baxSetCachedAccessibilityElementTree:](self, "_baxSetCachedAccessibilityElementTree:", v3);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree"));
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      v21 = -[BAXTextAccessibilityElement initWithAccessibilityContainer:]([BAXTextAccessibilityElement alloc], "initWithAccessibilityContainer:", v10);
      v22 = BAXLocString(CFSTR("swipe.hint"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[BAXTextAccessibilityElement setAccessibilityHint:](v21, "setAccessibilityHint:", v23);

      v31 = v21;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      -[BAXWebPageAccessibilityObjectWrapper _baxSetCachedAccessibilityElementTree:](self, "_baxSetCachedAccessibilityElementTree:", v24);

    }
  }
  -[BAXWebPageAccessibilityObjectWrapper _handlePageTurnTraitForRootElement:](self, "_handlePageTurnTraitForRootElement:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v26 = objc_msgSend(v25, "isPaginated");

  if ((v26 & 1) == 0)
    -[BAXWebPageAccessibilityObjectWrapper _sanitizedCachedElements](self, "_sanitizedCachedElements");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree"));
  v28 = objc_msgSend(v27, "copy");

LABEL_18:
  return v28;
}

- (void)_sanitizedCachedElements
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "accessibilityFrame");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
        v20 = (double)(uint64_t)objc_msgSend(v19, "screenHeight");

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
        v22 = (double)(uint64_t)objc_msgSend(v21, "screenWidth");

        v28.origin.x = 0.0;
        v28.origin.y = 0.0;
        v28.size.width = v22;
        v28.size.height = v20;
        v29.origin.x = v12;
        v29.origin.y = v14;
        v29.size.width = v16;
        v29.size.height = v18;
        if (CGRectIntersectsRect(v28, v29))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  -[BAXWebPageAccessibilityObjectWrapper _baxSetCachedAccessibilityElementTree:](self, "_baxSetCachedAccessibilityElementTree:", v3);
}

- (void)_appendPageTurnToLastElementIgnoringImages:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (v3)
        {
          v12 = objc_opt_class(BAXTextAccessibilityElement, v7);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
            continue;
        }
        objc_msgSend(v11, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v11, "accessibilityTraits") | UIAccessibilityTraitCausesPageTurn);
        goto LABEL_12;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)_addInteractiveDescendantsOfElement:(id)a3 toArray:(id)a4 rootElement:(id)a5
{
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  char **v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  BOOL v67;
  double v68;
  CGFloat x;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  CGFloat v82;
  CGFloat v83;
  char v84;
  CGFloat v85;
  CGFloat v86;
  id v87;
  id v88;
  CGPoint v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v88 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (char *)objc_msgSend(v88, "accessibilityElementCount");
  if (v10)
  {
    v12 = v10;
    v84 = 0;
    v13 = 0;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v17 = &selRef_baxStoredLinkRotorIndex;
    do
    {
      v18 = (void *)objc_opt_class(v17 + 365, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "accessibilityElementAtIndex:", v13));
      v20 = __BAXCastAsSafeCategory(v18, v19, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      if (v21)
      {
        if (!BEBooksWebKitAccessibility())
        {
          if (-[BAXWebPageAccessibilityObjectWrapper _bkaxIsInteractiveElement:](self, "_bkaxIsInteractiveElement:", v21))
          {
            objc_msgSend(v9, "accessibilityVisibleContentRect");
            v31 = v30;
            v33 = v32;
            v35 = v34;
            v37 = v36;
            objc_msgSend(v21, "accessibilityFrame");
            v89.x = v38;
            v89.y = v39;
            v90.origin.x = v31;
            v90.origin.y = v33;
            v90.size.width = v35;
            v90.size.height = v37;
            if (CGRectContainsPoint(v90, v89))
            {
              if (!-[BAXWebPageAccessibilityObjectWrapper _isElementImage:](self, "_isElementImage:", v21))
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
                v41 = objc_msgSend(v40, "isFixedLayoutBook");

                if (!v41)
                  goto LABEL_22;
              }
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accessibilityAttributedValue"));
              objc_msgSend(v21, "accessibilityFrame");
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v21, v42, v8, v9);

            }
          }
LABEL_44:
          -[BAXWebPageAccessibilityObjectWrapper _addInteractiveDescendantsOfElement:toArray:rootElement:](self, "_addInteractiveDescendantsOfElement:toArray:rootElement:", v21, v8, v9);
          goto LABEL_45;
        }
        if (!-[BAXWebPageAccessibilityObjectWrapper _isElementVisible:forRootElement:](self, "_isElementVisible:forRootElement:", v21, v9)|| !objc_msgSend(v21, "isAccessibilityElement"))
        {
          goto LABEL_44;
        }
        objc_msgSend(v21, "accessibilityFrame");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        if (-[BAXWebPageAccessibilityObjectWrapper _isElementLink:](self, "_isElementLink:", v21))
          -[BAXWebPageAccessibilityObjectWrapper _linkSubElementForElement:](self, "_linkSubElementForElement:", v88);
        if (!-[BAXWebPageAccessibilityObjectWrapper _isElementStaticText:](self, "_isElementStaticText:", v21))
        {
          if ((objc_msgSend(v8, "containsObject:", v21) & 1) == 0)
          {
            if (-[BAXWebPageAccessibilityObjectWrapper _isElementImage:](self, "_isElementImage:", v21)
              || (v43 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState")), v44 = objc_msgSend(v43, "isFixedLayoutBook"), v43, v44))
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accessibilityLabel"));
              v46 = objc_alloc((Class)NSAttributedString);
              v47 = v8;
              if (v45)
              {
                v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accessibilityLabel"));
              }
              else
              {
                v79 = BAXLocString(CFSTR("image"));
                v48 = objc_claimAutoreleasedReturnValue(v79);
              }
              v80 = (void *)v48;
              v81 = objc_msgSend(v46, "initWithString:", v48);

              objc_msgSend(v21, "accessibilityFrame");
              v8 = v47;
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v21, v81, v47, v9);

              goto LABEL_43;
            }
LABEL_22:
            objc_msgSend(v8, "addObject:", v21);
          }
          goto LABEL_44;
        }
        if ((v84 & 1) == 0)
        {
          if (v12 == (_BYTE *)&dword_0 + 1)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
            if (!-[BAXWebPageAccessibilityObjectWrapper _isElementLink:](self, "_isElementLink:", v21))
              goto LABEL_39;
            objc_msgSend(v21, "accessibilityFrame");
            v85 = v51;
            v86 = v50;
            v82 = v53;
            v83 = v52;
            objc_msgSend(v49, "accessibilityFrame");
            v95.origin.x = v54;
            v95.origin.y = v55;
            v95.size.width = v56;
            v95.size.height = v57;
            v91.origin.y = v85;
            v91.origin.x = v86;
            v91.size.height = v82;
            v91.size.width = v83;
            if (CGRectIntersectsRect(v91, v95))
            {
              -[BAXWebPageAccessibilityObjectWrapper _linkSubElementForElement:](self, "_linkSubElementForElement:", v21);
            }
            else
            {
LABEL_39:
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accessibilityAttributedValue"));
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v21, v78, v8, v9, v23, v25, v27, v29);

            }
            v84 = 0;
          }
          else
          {
            v87 = v8;
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accessibilityLabel"));
            v59 = objc_msgSend(v58, "mutableCopy");

            for (i = 1; (char *)i != v12; ++i)
            {
              v62 = (void *)objc_opt_class(BAXObjectWrapper, v60);
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "accessibilityElementAtIndex:", i));
              v64 = __BAXCastAsSafeCategory(v62, v63, 0, 0);
              v65 = (void *)objc_claimAutoreleasedReturnValue(v64);

              if (-[BAXWebPageAccessibilityObjectWrapper _isElementStaticText:](self, "_isElementStaticText:", v65))
              {
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "accessibilityLabel"));
                if (v66)
                  objc_msgSend(v59, "appendString:", v66);
                v92.origin.x = v23;
                v92.origin.y = v25;
                v92.size.width = v27;
                v92.size.height = v29;
                v96.origin.x = CGRectZero.origin.x;
                v96.origin.y = y;
                v96.size.width = width;
                v96.size.height = height;
                v67 = CGRectEqualToRect(v92, v96);
                objc_msgSend(v65, "accessibilityFrame");
                x = v68;
                v71 = v70;
                v73 = v72;
                v75 = v74;
                if (!v67)
                {
                  v93.origin.x = v23;
                  v93.origin.y = v25;
                  v93.size.width = v27;
                  v93.size.height = v29;
                  v94 = CGRectUnion(v93, *(CGRect *)&x);
                  x = v94.origin.x;
                  v71 = v94.origin.y;
                  v73 = v94.size.width;
                  v75 = v94.size.height;
                }
                v29 = v75;
                v27 = v73;
                v25 = v71;
                v23 = x;
              }
              else
              {
                v76 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v59);
                -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v88, v76, v87, v9, v23, v25, v27, v29);

                v66 = v59;
                v59 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_20B88);
                v29 = height;
                v27 = width;
                v25 = y;
                v23 = CGRectZero.origin.x;
              }

            }
            v8 = v87;
            if (objc_msgSend(v59, "length"))
            {
              v77 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v59);
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v88, v77, v87, v9, v23, v25, v27, v29);

            }
            v84 = 1;
LABEL_43:
            v17 = &selRef_baxStoredLinkRotorIndex;
          }
          goto LABEL_44;
        }
        v84 = 1;
      }
LABEL_45:

      ++v13;
    }
    while (v13 != v12);
  }

}

- (void)baxInvalidateCaches
{
  if (BEBooksWebKitAccessibility())
  {
    -[BAXWebPageAccessibilityObjectWrapper _baxSetCachedAccessibilityElementTree:](self, "_baxSetCachedAccessibilityElementTree:", 0);
    -[BAXWebPageAccessibilityObjectWrapper _baxSetIsTurningCounter:](self, "_baxSetIsTurningCounter:", (char *)-[BAXWebPageAccessibilityObjectWrapper _baxIsTurningCounter](self, "_baxIsTurningCounter") - 1);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredLinkRotor:](self, "baxSetStoredLinkRotor:", 0);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredHighlightRotor:](self, "baxSetStoredHighlightRotor:", 0);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredHighlightRotorIndex:](self, "baxSetStoredHighlightRotorIndex:", &off_21818);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredVisibleLinkInfos:](self, "baxSetStoredVisibleLinkInfos:", 0);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredLinkRotorIndex:](self, "baxSetStoredLinkRotorIndex:", &off_21818);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredHeadingsRotor:](self, "baxSetStoredHeadingsRotor:", 0);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredHeadingsRotorIndex:](self, "baxSetStoredHeadingsRotorIndex:", &off_21818);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredVisibleLinkElements:](self, "baxSetStoredVisibleLinkElements:", 0);
    -[BAXWebPageAccessibilityObjectWrapper _dispatchPageScrolledNotification](self, "_dispatchPageScrolledNotification");
  }
}

- (void)_handlePageTurnTraitForRootElement:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v5 = objc_msgSend(v4, "isSpreadWithChapterBoundary");

  if (!v5)
    goto LABEL_5;
  objc_msgSend(v10, "accessibilityFrame");
  if (v6 != 0.0)
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  if ((objc_msgSend(v7, "isRTL") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v10, "accessibilityFrame");
  v9 = v8;

  if (v9 == 0.0)
LABEL_5:
    -[BAXWebPageAccessibilityObjectWrapper _appendPageTurnToLastElementIgnoringImages:](self, "_appendPageTurnToLastElementIgnoringImages:", AXRequestingClient() == 11);
LABEL_6:

}

- (BOOL)_bkaxIsInteractiveElement:(id)a3
{
  id v3;
  id AssociatedObject;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  AssociatedObject = objc_getAssociatedObject(v3, objc_msgSend(CFSTR("StoredIsInteractiveElement"), "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    if (objc_msgSend(v3, "isAccessibilityElement"))
      v7 = objc_msgSend(v3, "baxElementIsInteractive");
    else
      v7 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    v9 = v3;
    objc_setAssociatedObject(v9, objc_msgSend(CFSTR("StoredIsInteractiveElement"), "hash"), v8, (char *)&dword_0 + 1);

  }
  return (char)v7;
}

- (void)_linkSubElementForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = objc_msgSend(objc_alloc((Class)UIAccessibilityLinkSubelement), "initWithAccessibilityContainer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));
  objc_msgSend(v8, "setAccessibilityLabel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredVisibleLinkInfos](self, "baxStoredVisibleLinkInfos"));
  objc_msgSend(v6, "addObject:", v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredVisibleLinkElements](self, "baxStoredVisibleLinkElements"));
  objc_msgSend(v7, "addObject:", v4);

}

- (BOOL)_isElementLink:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "accessibilityTraits");
  return (UIAccessibilityTraitLink & ~v3) == 0;
}

- (BOOL)_isElementImage:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "accessibilityTraits");
  return (UIAccessibilityTraitImage & ~v3) == 0;
}

- (BOOL)_isElementStaticText:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "accessibilityTraits");
  return (UIAccessibilityTraitStaticText & ~v3) == 0;
}

- (id)_previousInteractiveElement:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator", 0));
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v10 = objc_opt_class(BAXTextAccessibilityElement, v5);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_modifySyntheticElement:(id)a3 withRootElement:(id)a4 forInteractiveElements:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  BOOL v30;
  BOOL v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  CGRect v38;
  CGRect v39;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "trimElementSpanningPageBoundary");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accessibilityValue", (_QWORD)v33));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityValue"));
          if (objc_msgSend(v16, "isEqualToString:", v17))
          {
            objc_msgSend(v15, "accessibilityFrame");
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v25 = v24;
            objc_msgSend(v7, "accessibilityFrame");
            v39.origin.x = v26;
            v39.origin.y = v27;
            v39.size.width = v28;
            v39.size.height = v29;
            v38.origin.x = v19;
            v38.origin.y = v21;
            v38.size.width = v23;
            v38.size.height = v25;
            v30 = CGRectEqualToRect(v38, v39);

            if (v30)
            {

              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    objc_msgSend(v10, "addObject:", v7);
    v31 = 1;
  }
  else
  {
LABEL_14:
    v31 = 0;
  }

  return v31;
}

- (void)_handleSyntheticElementFor:(id)a3 attributedValue:(id)a4 accessibilityFrame:(CGRect)a5 interactiveElements:(id)a6 rootElement:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  unint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  BOOL v38;
  BAXTextAccessibilityElement *v39;
  void *v40;
  id v41;
  CGRect v42;
  CGRect v43;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v41 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (objc_msgSend(v16, "count"))
  {
    for (i = 0; (unint64_t)objc_msgSend(v16, "count") > i; ++i)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", i));
      v21 = objc_opt_class(BAXTextAccessibilityElement, v20);
      isKindOfClass = objc_opt_isKindOfClass(v19, v21);

      if ((isKindOfClass & 1) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", i));
        if (-[BAXWebPageAccessibilityObjectWrapper _isElementLink:](self, "_isElementLink:", v41))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "accessibilityLabel"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessibilityLabel"));
          if ((objc_msgSend(v24, "isEqualToString:", v25) & 1) != 0)
          {
            objc_msgSend(v41, "accessibilityFrame");
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;
            objc_msgSend(v23, "accessibilityFrame");
            v43.origin.x = v34;
            v43.origin.y = v35;
            v43.size.width = v36;
            v43.size.height = v37;
            v42.origin.x = v27;
            v42.origin.y = v29;
            v42.size.width = v31;
            v42.size.height = v33;
            v38 = CGRectEqualToRect(v42, v43);

            if (v38)
              goto LABEL_14;
            continue;
          }

        }
      }
    }
  }
  v39 = -[BAXTextAccessibilityElement initWithReferenceElement:container:attributedValue:accessibilityFrame:]([BAXTextAccessibilityElement alloc], "initWithReferenceElement:container:attributedValue:accessibilityFrame:", v41, self, v15, x, y, width, height);
  if (-[BAXWebPageAccessibilityObjectWrapper _modifySyntheticElement:withRootElement:forInteractiveElements:](self, "_modifySyntheticElement:withRootElement:forInteractiveElements:", v39, v17, v16))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _previousInteractiveElement:](self, "_previousInteractiveElement:", v16));
    -[BAXTextAccessibilityElement setPreviousNavigableElement:](v39, "setPreviousNavigableElement:", v40);
    objc_msgSend(v40, "setNextNavigableElement:", v39);

  }
LABEL_14:

}

- (void)_handleSyntheticImageElementFor:(id)a3 attributedValue:(id)a4 accessibilityFrame:(CGRect)a5 interactiveElements:(id)a6 rootElement:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;
  BAXTextAccessibilityElement *v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v18 = -[BAXTextAccessibilityElement initWithReferenceElement:container:attributedValue:accessibilityFrame:]([BAXTextAccessibilityElement alloc], "initWithReferenceElement:container:attributedValue:accessibilityFrame:", v16, self, v15, x, y, width, height);

  objc_msgSend(v14, "addObject:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _previousInteractiveElement:](self, "_previousInteractiveElement:", v14));

  -[BAXTextAccessibilityElement setPreviousNavigableElement:](v18, "setPreviousNavigableElement:", v17);
  objc_msgSend(v17, "setNextNavigableElement:", v18);

}

- (BOOL)_isElementVisible:(id)a3 forRootElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v25;
  CGRect v26;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_accessibilityTextMarkerRange"));
  objc_msgSend(v6, "accessibilityBoundsForTextMarkers:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v5, "accessibilityVisibleContentRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v25.origin.x = v17;
  v25.origin.y = v19;
  v25.size.width = v21;
  v25.size.height = v23;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  LOBYTE(v6) = CGRectIntersectsRect(v25, v26);

  return (char)v6;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  __CFString *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int v14;
  id v15;
  __CFString *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  _QWORD *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v43;
  _QWORD *v44;
  __CFString *v45;
  id v46;
  id v47;
  objc_super v48;
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[2];

  if (BEBooksWebKitAccessibility())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    v6 = objc_msgSend(v5, "isVisiblePageBookmarked");
    v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    if (v6)
      v8 = CFSTR("unbookmark.page");
    else
      v8 = CFSTR("bookmark.page");
    if (v6)
      v9 = CFSTR("bookmark.fill");
    else
      v9 = CFSTR("bookmark");
    v10 = BAXLocString(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v9, v3));
    v13 = objc_msgSend(v7, "initWithName:image:actionHandler:", v11, v12, &stru_20650);

    objc_msgSend(v4, "addObject:", v13);
    v14 = objc_msgSend(v5, "hasVisibleControls");
    v15 = objc_alloc((Class)UIAccessibilityCustomAction);
    if (v14)
      v16 = CFSTR("hide.controls");
    else
      v16 = CFSTR("show.controls");
    if (v14)
      v17 = CFSTR("eye.slash");
    else
      v17 = CFSTR("eye");
    v18 = BAXLocString(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v17, v3));
    v21 = objc_msgSend(v15, "initWithName:image:actionHandler:", v19, v20, &stru_20670);

    objc_msgSend(v4, "addObject:", v21);
    if (UIAccessibilityIsSwitchControlRunning())
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
      v23 = objc_msgSend(v22, "isRTL");

      v24 = CFSTR("arrow.left");
      v47 = v13;
      if (v23)
        v25 = CFSTR("arrow.right");
      else
        v25 = CFSTR("arrow.left");
      if (!v23)
        v24 = CFSTR("arrow.right");
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_728C;
      v50[3] = &unk_20698;
      if (v23)
        v26 = 5;
      else
        v26 = 6;
      v46 = v21;
      if (v23)
        v27 = 6;
      else
        v27 = 5;
      v50[4] = self;
      v50[5] = v26;
      v45 = v24;
      v28 = v25;
      v29 = objc_retainBlock(v50);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_72AC;
      v49[3] = &unk_20698;
      v49[4] = self;
      v49[5] = v27;
      v44 = objc_retainBlock(v49);
      v30 = objc_alloc((Class)UIAccessibilityCustomAction);
      v31 = BAXLocString(CFSTR("turn.to.previous.page.action"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v28, v3));

      v34 = objc_msgSend(v30, "initWithName:image:actionHandler:", v32, v33, v29);
      v21 = v46;
      v35 = objc_alloc((Class)UIAccessibilityCustomAction);
      v36 = BAXLocString(CFSTR("turn.to.next.page.action"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v45, v3));

      v39 = objc_msgSend(v35, "initWithName:image:actionHandler:", v37, v38, v44);
      v51[0] = v34;
      v51[1] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
      objc_msgSend(v4, "addObjectsFromArray:", v40);

      v13 = v47;
    }
    v41 = objc_msgSend(v4, "copy", v44);

    return v41;
  }
  else
  {
    v48.receiver = self;
    v48.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    v43 = -[BAXWebPageAccessibilityObjectWrapper accessibilityCustomActions](&v48, "accessibilityCustomActions");
    return (id)objc_claimAutoreleasedReturnValue(v43);
  }
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _accessibilityInternalTextLinkCustomRotors](self, "_accessibilityInternalTextLinkCustomRotors"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredLinkRotor](self, "baxStoredLinkRotor"));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxHighlightRotor](self, "_baxHighlightRotor"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredHighlightRotor](self, "baxStoredHighlightRotor"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _baxHeadingsRotor](self, "_baxHeadingsRotor"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredHeadingsRotor](self, "baxStoredHeadingsRotor"));
    objc_msgSend(v3, "addObject:", v9);

  }
  if (objc_msgSend(v3, "count"))
    v10 = objc_msgSend(v3, "copy");
  else
    v10 = 0;

  return v10;
}

- (id)_baxHeadingsRotor
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredHeadingsRotor](self, "baxStoredHeadingsRotor"));
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_74D4;
    v6[3] = &unk_206C0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    v3 = objc_msgSend(v4, "initWithSystemType:itemSearchBlock:", 3, v6);
    objc_msgSend(v3, "setVisibleInTouchRotor:", 1);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredHeadingsRotor:](self, "baxSetStoredHeadingsRotor:", v3);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)_baxHighlightRotor
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredHighlightRotor](self, "baxStoredHighlightRotor"));
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v5 = BAXLocString(CFSTR("highlights"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7838;
    v8[3] = &unk_206C0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    v3 = objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, v8);

    objc_msgSend(v3, "setVisibleInTouchRotor:", 1);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredHighlightRotor:](self, "baxSetStoredHighlightRotor:", v3);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)_accessibilityInternalTextLinkCustomRotors
{
  void *v3;
  id v4;
  id v5;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  id v14;

  if (!BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    v5 = -[BAXWebPageAccessibilityObjectWrapper _accessibilityInternalTextLinkCustomRotors](&v9, "_accessibilityInternalTextLinkCustomRotors");
    return (id)objc_claimAutoreleasedReturnValue(v5);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredVisibleLinkInfos](self, "baxStoredVisibleLinkInfos"));
  if (!objc_msgSend(v3, "count"))
    goto LABEL_8;
  objc_initWeak(&location, self);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper baxStoredLinkRotor](self, "baxStoredLinkRotor"));
  if (!v4)
  {
    v7 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_7D08;
    v10[3] = &unk_206C0;
    objc_copyWeak(&v12, &location);
    v11 = v3;
    v4 = objc_msgSend(v7, "initWithSystemType:itemSearchBlock:", 1, v10);
    -[BAXWebPageAccessibilityObjectWrapper baxSetStoredLinkRotor:](self, "baxSetStoredLinkRotor:", v4);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    if (v4)
      goto LABEL_7;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  objc_destroyWeak(&location);
LABEL_7:
  v14 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

LABEL_9:
  return v8;
}

- (BOOL)_accessibilityScrollWithDirection:(int64_t)a3
{
  int v5;
  objc_super v7;
  objc_super v8;

  v5 = BEBooksWebKitAccessibility();
  if (v5)
  {
    if (a3 == 6)
    {
      LOBYTE(v5) = -[BAXWebPageAccessibilityObjectWrapper accessibilityScroll:](&v7, "accessibilityScroll:", 3, self, BAXWebPageAccessibilityObjectWrapper, v8.receiver, v8.super_class);
    }
    else if (a3 == 5)
    {
      LOBYTE(v5) = -[BAXWebPageAccessibilityObjectWrapper accessibilityScroll:](&v8, "accessibilityScroll:", 4, v7.receiver, v7.super_class, self, BAXWebPageAccessibilityObjectWrapper);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  objc_super v15;

  v5 = BEBooksWebKitAccessibility();
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    if (objc_msgSend(v6, "bookLayout") == (char *)&dword_0 + 2)
    {

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
      v8 = (char *)objc_msgSend(v7, "bookLayout");

      if (v8 != (_BYTE *)&dword_0 + 3)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
        v10 = objc_msgSend(v9, "isRTL");

        if (a3 == 1)
        {
LABEL_14:
          v11 = CFSTR("previous");
          goto LABEL_23;
        }
        if (a3 != 2)
        {
          if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
          {
            v12 = CFSTR("next");
            v13 = CFSTR("previous");
          }
          else
          {
            if (a3 != 6 && a3 != 3)
              goto LABEL_24;
            v12 = CFSTR("previous");
            v13 = CFSTR("next");
          }
          if (v10)
            v11 = v13;
          else
            v11 = v12;
          goto LABEL_23;
        }
LABEL_13:
        v11 = CFSTR("next");
LABEL_23:
        +[BEAXWebContentUtilities turnPageWithDirection:](BEAXWebContentUtilities, "turnPageWithDirection:", v11);
LABEL_24:
        -[BAXWebPageAccessibilityObjectWrapper _baxSetIsTurningCounter:](self, "_baxSetIsTurningCounter:", (char *)-[BAXWebPageAccessibilityObjectWrapper _baxIsTurningCounter](self, "_baxIsTurningCounter") + 1);
        -[BAXWebPageAccessibilityObjectWrapper _baxSetCachedAccessibilityElementTree:](self, "_baxSetCachedAccessibilityElementTree:", 0);
        return v5;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    if (-[BAXWebPageAccessibilityObjectWrapper accessibilityScroll:](&v15, "accessibilityScroll:", a3)
      || -[BAXWebPageAccessibilityObjectWrapper _accessibilityScrollWithDirection:](self, "_accessibilityScrollWithDirection:", a3)|| (unint64_t)a3 > 6)
    {
      goto LABEL_24;
    }
    if (((1 << a3) & 0x34) == 0)
    {
      if (((1 << a3) & 0x4A) == 0)
        goto LABEL_24;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  return v5;
}

- (void)_dispatchPageScrolledNotification
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[BAXWebPageAccessibilityObjectWrapper _baxIsTurningCounter](self, "_baxIsTurningCounter") <= 0)
  {
    v3 = UIAccessibilityPageScrolledNotification;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _axPageScrollString](self, "_axPageScrollString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
    -[BAXWebPageAccessibilityObjectWrapper postWebAXNotification:notificationData:](self, "postWebAXNotification:notificationData:", v3, v5);

    -[BAXWebPageAccessibilityObjectWrapper _baxSetIsTurningCounter:](self, "_baxSetIsTurningCounter:", 0);
  }
}

- (void)postWebAXNotification:(unsigned int)a3 notificationData:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper accessibilityElements](self, "accessibilityElements"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "referenceElement"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
  BEAXPostWebProcessNotification(v10, v4);

}

- (id)_accessibilityScrollStatus
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v4 = objc_msgSend(v3, "pageCount");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v6 = objc_msgSend(v5, "currentPageNumber");

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = BAXLocString(CFSTR("loading.book"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v9 = BAXLocString(CFSTR("page.num.of %@ %@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BAXWebPageAccessibilityObjectWrapper BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:](BAXWebPageAccessibilityObjectWrapper, "BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v11, 1, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BAXWebPageAccessibilityObjectWrapper BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:](BAXWebPageAccessibilityObjectWrapper, "BAXLocalizedNumberForNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v13, 1, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAXWebPageAccessibilityObjectWrapper _axPageScrollString](self, "_axPageScrollString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12, v14, v15));
    v24 = __BAXStringForVariables(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)CFSTR("__BAXStringForVariablesSentinel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v24);

  }
  return v8;
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
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
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
  const __CFString *v53;
  void *v54;
  id v55;
  const __CFString *v57;
  CFBooleanRef v58;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleAnnotations"));

  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v6 = objc_msgSend(v5, "pageCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v8 = objc_msgSend(v7, "currentPage");
  v10 = v9;

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    v8 = objc_msgSend(v12, "currentPageNumber");

  }
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v6 == 0)
  {
    v14 = BAXLocString(CFSTR("page.num.of.loading"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!v4)
      goto LABEL_19;
  }
  else
  {
    v15 = BAXLocString(CFSTR("page.num.of.with.total.single %lu %lu"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v8, v6));

    if (!v4)
      goto LABEL_19;
  }
  v18 = BAXLocString(CFSTR("%lu note(s)"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v4));
    v28 = __BAXStringForVariables(0, v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
    v4 = (id)objc_claimAutoreleasedReturnValue(v28);

  }
  else
  {
    v4 = 0;
  }

LABEL_19:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  v30 = objc_msgSend(v29, "isVisiblePageBookmarked");

  if ((v30 & 1) != 0)
  {
    v31 = BAXLocString(CFSTR("has.bookmark"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v40 = __BAXStringForVariables(v4, v33, v34, v35, v36, v37, v38, v39, (uint64_t)v32);
    v41 = objc_claimAutoreleasedReturnValue(v40);

    v4 = (id)v41;
  }
  v42 = objc_alloc((Class)NSMutableAttributedString);
  v50 = __BAXStringForVariables(v17, v43, v44, v45, v46, v47, v48, v49, (uint64_t)v4);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  v52 = (void *)v51;
  if (v51)
    v53 = (const __CFString *)v51;
  else
    v53 = &stru_20B88;
  v57 = CFSTR("UIAccessibilityTokenLowPitch");
  v58 = kCFBooleanTrue;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v55 = objc_msgSend(v42, "initWithString:attributes:", v53, v54);

  return v55;
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
