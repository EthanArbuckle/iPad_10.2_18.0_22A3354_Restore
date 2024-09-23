@implementation THPageLayout

- (THPageLayout)initWithInfo:(id)a3
{
  THPageLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THPageLayout;
  v3 = -[THPageLayout initWithInfo:](&v5, "initWithInfo:", a3);
  if (v3)
    v3->mBodyLayouts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mBodyLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageLayout;
  -[THPageLayout dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

- (BOOL)isExpanded
{
  THWWidgetLayoutDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    LOBYTE(delegate) = -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self) == 1;
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THPageLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THPageLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (Class)repClassOverride
{
  uint64_t v3;

  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THPageLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", 0, &OBJC_PROTOCOL___THPageLayerAndSubviewHostProvider))
  {
    return (Class)objc_opt_class(THHostingPageRep, v3);
  }
  else
  {
    return (Class)objc_msgSend(-[THPageLayout info](self, "info"), "repClass");
  }
}

- (unint64_t)relativePageIndex
{
  return (unint64_t)objc_msgSend(-[THPageLayout info](self, "info"), "relativePageIndexInParent");
}

- (THPageController)pageController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(TSDLayout, a2);
  v4 = (void *)TSUDynamicCast(v3, -[THPageLayout parent](self, "parent"));
  v6 = objc_opt_class(THSectionInfo, v5);
  v7 = (void *)TSUDynamicCast(v6, objc_msgSend(v4, "info"));
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayout pageController]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayout.mm"), 108, CFSTR("invalid nil value for '%s'"), "parentSection");
  return (THPageController *)objc_msgSend(v7, "pageController");
}

- (NSArray)bodyLayouts
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->mBodyLayouts);
}

- (CGRect)bodyRectForChildLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "geometry"), "boundsBeforeRotation");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)floatingDrawableInfos
{
  return objc_msgSend(-[THPageLayout info](self, "info"), "floatingDrawables");
}

- (NSArray)floatingDrawableLayouts
{
  NSArray *v3;

  v3 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  -[THPageLayout p_addLayoutsForInfos:toArray:](self, "p_addLayoutsForInfos:toArray:", -[THPageLayout floatingDrawableInfos](self, "floatingDrawableInfos"), v3);
  return v3;
}

- (void)addAttachmentLayout:(id)a3
{
  char *v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  char *v10;
  id v11;

  if (objc_msgSend(objc_msgSend(a3, "info"), "owningAttachment"))
  {
    v5 = 0;
LABEL_3:
    -[THPageLayout insertChild:atIndex:](self, "insertChild:atIndex:", a3, v5);
    objc_msgSend(a3, "updateChildrenFromInfo");
    return;
  }
  v6 = objc_msgSend(-[THPageLayout info](self, "info"), "drawablesZOrder");
  v7 = objc_msgSend(v6, "zOrderOfDrawable:", objc_msgSend(a3, "info"));
  v8 = -[THPageLayout children](self, "children");
  v9 = (char *)objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v5 = 0;
    while (1)
    {
      v11 = objc_msgSend(v6, "zOrderOfDrawable:", objc_msgSend(objc_msgSend(v8, "objectAtIndex:", v5), "info"));
      if (v7 < v11)
        break;
      if (v7 == v11)
        return;
      if (v10 == ++v5)
      {
        v5 = v10;
        break;
      }
    }
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_3;
  }
}

- (unint64_t)pageIndex
{
  return (unint64_t)objc_msgSend(-[THPageLayout info](self, "info"), "relativePageIndexInParent");
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  -[THPageLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THPageController i_registerPageLayout:](-[THPageLayout pageController](self, "pageController"), "i_registerPageLayout:", self);
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  -[THPageLayout willBeRemovedFromLayoutController:](&v4, "willBeRemovedFromLayoutController:", a3);
  -[THPageController i_unregisterPageLayout:](-[THPageLayout pageController](self, "pageController"), "i_unregisterPageLayout:", self);
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  if (objc_msgSend(-[THPageLayout floatingDrawableInfos](self, "floatingDrawableInfos"), "containsObject:", objc_msgSend(a3, "info")))return -[THPageLayout bodyLayouts](self, "bodyLayouts");
  else
    return 0;
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *i;
  id v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = -[THPageLayout bodyLayouts](self, "bodyLayouts", 0);
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = v8;
  v10 = *(_QWORD *)v17;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "firstCharacterIndexOverlappingPageRect:", x, y, width, height);
      if ((unint64_t)v13 >= v11)
        v14 = v11;
      else
        v14 = (unint64_t)v13;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v14 = (unint64_t)v13;
      if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
        v11 = v14;
    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v9);
  return v11;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3
{
  NSArray *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  uint64_t v14;
  id v16;
  unint64_t v17;
  void *v19;
  double x;
  double y;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGPoint result;

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = -[THPageLayout bodyLayouts](self, "bodyLayouts", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "columnRange");
        if ((unint64_t)v13 <= a3 && (unint64_t)v13 + v14 >= a3 + 1)
        {
          v19 = v12;
          goto LABEL_22;
        }
        if (v14)
          v8 = v12;
        v9 |= v14 != 0;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
    if ((v9 & 1) != 0)
    {
      if (a3)
      {
        --a3;
        v16 = objc_msgSend(v8, "columnRange");
        if (a3 >= (unint64_t)v16 && a3 - (unint64_t)v16 < v17)
        {
          v19 = v8;
LABEL_22:
          objc_msgSend(v19, "pageOriginOfCharacterIndex:", a3);
          goto LABEL_26;
        }
        goto LABEL_24;
      }
      if (-[NSArray count](-[THPageLayout bodyLayouts](self, "bodyLayouts"), "count"))
LABEL_24:
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayout originOfCharacterIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayout.mm"), 304, CFSTR("Couldn't find character on page"));
    }
  }
  x = CGPointZero.x;
  y = CGPointZero.y;
LABEL_26:
  result.y = y;
  result.x = x;
  return result;
}

- (id)p_orderedChildInfos
{
  id v3;
  id v4;
  id v5;

  v3 = -[THPageLayout info](self, "info");
  v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", -[THPageLayout floatingDrawableInfos](self, "floatingDrawableInfos"));
  objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(v3, "modelBodyInfos"));
  v5 = objc_msgSend(objc_msgSend(objc_msgSend(v3, "drawablesZOrder"), "orderedDrawables:", v4), "mutableCopy");

  return v5;
}

- (void)p_insertBodyAndValidatedFloatingLayouts
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = objc_msgSend(-[THPageLayout info](self, "info"), "modelBodyInfos");
  v4 = -[THPageLayout p_orderedChildInfos](self, "p_orderedChildInfos");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v3, "containsObject:", v9))
        {
          if (-[THPageLayout wantsNormalBodyLayouts](self, "wantsNormalBodyLayouts"))
            -[THPageLayout p_insertChildLayoutForInfo:](self, "p_insertChildLayoutForInfo:", v9);
        }
        else
        {
          -[THPageLayout insertValidatedChildLayoutForInfo:](self, "insertValidatedChildLayoutForInfo:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)validate
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)THPageLayout;
  -[THPageLayout validate](&v12, "validate");
  if (!self->mChildLayoutsValid)
  {
    -[THPageLayout setChildren:](self, "setChildren:", 0);
    -[THPageLayout p_insertBodyAndValidatedFloatingLayouts](self, "p_insertBodyAndValidatedFloatingLayouts");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[THPageLayout bodyLayouts](self, "bodyLayouts", 0);
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(-[THPageLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i));
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
      }
      while (v5);
    }
    self->mChildLayoutsValid = 1;
  }
}

- (id)computeLayoutGeometry
{
  id v3;
  id v4;
  id v5;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = -[THPageLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  if (v3)
    return objc_msgSend(v3, "layoutGeometryForLayout:", self);
  v4 = objc_msgSend(-[THPageLayout info](self, "info"), "relativePageIndexInParent");
  v5 = objc_msgSend(-[THPageLayout info](self, "info"), "geometry");
  y = CGRectZero.origin.y;
  objc_msgSend(v5, "size");
  v8 = v7;
  v10 = v9;
  -[THPageController pageOriginForRelativePageIndex:pageFrame:](-[THPageLayout pageController](self, "pageController"), "pageOriginForRelativePageIndex:pageFrame:", v4, CGRectZero.origin.x, y, v7, v9);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v11, v12, v8, v10);
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (id)p_insertChildLayoutForInfo:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = objc_msgSend(-[THPageLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", a3, self);
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "layoutClass")), "initWithInfo:", a3);
    if (v5)
    {
      v7 = objc_opt_class(THModelBodyTextInfo, v6);
      if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
        -[NSMutableArray addObject:](self->mBodyLayouts, "addObject:", v5);
      -[THPageLayout addChild:](self, "addChild:", v5);
      v8 = v5;
    }
  }
  return v5;
}

- (id)insertValidatedChildLayoutForInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = -[THPageLayout p_insertChildLayoutForInfo:](self, "p_insertChildLayoutForInfo:", a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "updateChildrenFromInfo");
    objc_msgSend(-[THPageLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", v5);
  }
  return v5;
}

- (void)p_addLayoutsForInfos:(id)a3 toArray:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a3);
        objc_msgSend(a4, "addObject:", -[THPageLayout p_insertChildLayoutForInfo:](self, "p_insertChildLayoutForInfo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10)));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (BOOL)wantsNormalBodyLayouts
{
  return 1;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (id)firstTarget
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  result = -[THPageLayout firstTarget](&v4, "firstTarget");
  if (!result)
    return -[THGuidedPanPageTarget initWithLayout:targeted:]([THGuidedPanPageTarget alloc], "initWithLayout:targeted:", self, 1);
  return result;
}

- (id)firstChildTarget
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPageLayout;
  return -[THPageLayout firstTarget](&v3, "firstTarget");
}

- (id)lastTarget
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  result = -[THPageLayout lastTarget](&v4, "lastTarget");
  if (!result)
    return -[THGuidedPanPageTarget initWithLayout:targeted:]([THGuidedPanPageTarget alloc], "initWithLayout:targeted:", self, 1);
  return result;
}

- (id)lastChildTarget
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPageLayout;
  return -[THPageLayout lastTarget](&v3, "lastTarget");
}

@end
