@implementation THWPageControlRep

- (THWPageControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWPageControlRep *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPageControlRep;
  result = -[THWPageControlRep initWithLayout:canvas:](&v5, "initWithLayout:canvas:", a3, a4);
  if (result)
  {
    *(unint64_t *)((char *)&result->_highlightedPageIndex + 1) = 0x7FFFFFFFFFFFFFFFLL;
    *(unint64_t *)((char *)&result->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPageControlRep;
  -[THWPageControlRep dealloc](&v3, "dealloc");
}

- (id)p_nearestIndicatorToLocation:(CGPoint)a3
{
  double x;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double y;
  double height;
  double width;
  double v13;
  void *i;
  void *v15;
  id v16;
  void *v17;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  x = a3.x;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v36;
  y = CGRectZero.origin.y;
  v34 = CGRectZero.origin.x;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = 1.79769313e308;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v36 != v9)
        objc_enumerationMutation(v5);
      v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
      v16 = objc_msgSend(v15, "layer", *(_QWORD *)&v34);
      v17 = v16;
      v18 = y;
      v19 = width;
      v20 = height;
      v21 = v34;
      if (v16)
        objc_msgSend(v16, "bounds", v34, y, width, height);
      v22 = CGRectGetWidth(*(CGRect *)&v21);
      objc_msgSend(-[THWPageControlRep layout](self, "layout"), "spacing");
      v24 = v23;
      objc_msgSend(v17, "frame");
      v29 = TSDCenterOfRect(v25, v26, v27, v28);
      v30 = TSDDistanceSquared();
      v31 = vabdd_f64(v29, x);
      if (v30 < v13 && v31 <= (v22 + v24) * 0.5)
      {
        v8 = v15;
        v13 = v30;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v7);
  return v8;
}

- (id)p_indicatorAtIndex:(unint64_t)a3
{
  if ((unint64_t)objc_msgSend(*(id *)((char *)&self->_indicators + 1), "count") <= a3)
    return 0;
  else
    return objc_msgSend(*(id *)((char *)&self->_indicators + 1), "objectAtIndex:", a3);
}

+ (id)dotLayerUsingColor:(id)a3 diameter:(double)a4
{
  id v6;

  v6 = +[TSDNoDefaultImplicitActionLayer layer](TSDNoDefaultImplicitActionLayer, "layer");
  objc_msgSend(v6, "setMasksToBounds:", 1);
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(a3, "CGColor"));
  objc_msgSend(v6, "setCornerRadius:", a4 * 0.5);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, a4, a4);
  return v6;
}

- (id)p_layerForState:(int)a3 pageIndex:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = *(_QWORD *)&a3;
  v7 = *(TSUIntegerKeyDictionary **)((char *)&self->_cachedLayers + 1);
  if (!v7)
    *(TSUIntegerKeyDictionary **)((char *)&self->_cachedLayers + 1) = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
  if ((objc_opt_respondsToSelector(-[THWPageControlRep delegate](self, "delegate"), "pageControl:layerForState:pageIndex:") & 1) == 0)
  {
    v12 = v5;
    v13 = objc_msgSend(v7, "objectForKey:", v5);
    if (v13)
      return v13;
    v14 = -[THWPageControlDelegate pageControl:layerForState:](-[THWPageControlRep delegate](self, "delegate"), "pageControl:layerForState:", self, v5);
    goto LABEL_10;
  }
  v8 = objc_opt_class(TSUIntegerKeyDictionary);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, objc_msgSend(*(id *)((char *)&self->_cachedLayers + 1), "objectForKey:", a4)).n128_u64[0];
  v7 = v10;
  if (!v10)
  {
    v7 = objc_alloc_init((Class)TSUIntegerKeyDictionary);
    objc_msgSend(*(id *)((char *)&self->_cachedLayers + 1), "setObject:forKey:", v7, a4);
    v11 = v7;
  }
  v12 = v5;
  v13 = objc_msgSend(v7, "objectForKey:", v5, v9);
  if (!v13)
  {
    v14 = -[THWPageControlDelegate pageControl:layerForState:pageIndex:](-[THWPageControlRep delegate](self, "delegate"), "pageControl:layerForState:pageIndex:", self, v5, a4);
LABEL_10:
    v13 = v14;
    if (v14)
      objc_msgSend(v7, "setObject:forKey:", v14, v12);
  }
  return v13;
}

- (void)updateFromLayout
{
  id v3;
  char *v4;
  void *v5;
  THWPageControlDelegate *v6;
  const __CTFont *v7;
  id v8;
  CFStringRef v9;
  void *v10;
  void *v11;
  char *i;
  THWPageIndicator *v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)THWPageControlRep;
  -[THWPageControlRep updateFromLayout](&v18, "updateFromLayout");
  v3 = -[THWPageControlRep layout](self, "layout");
  v4 = (char *)objc_msgSend(v3, "numberOfPages");
  if ((unint64_t)v4 > 0xA || objc_msgSend(v3, "forceTextOnly"))
  {
    v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);
    if (v5)
    {
      *(unint64_t *)((char *)&self->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
      v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);
    }

    *(NSMutableArray **)((char *)&self->_indicators + 1) = 0;
    if (!*(THWLabelLayer **)((char *)&self->_textIndicator + 1))
    {
      *(THWLabelLayer **)((char *)&self->_textIndicator + 1) = objc_alloc_init(THWLabelLayer);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
      objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "contentsScale");
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setContentsScale:");
      v6 = -[THWPageControlRep delegate](self, "delegate");
      v7 = (const __CTFont *)-[THWPageControlDelegate pageControlCreateFont:](v6, "pageControlCreateFont:", self);
      v8 = -[THWPageControlDelegate pageControlTextColor:](v6, "pageControlTextColor:", self);
      v9 = CTFontCopyPostScriptName(v7);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setFontName:", v9);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setFontSize:", 14.0);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setTextColor:", v8);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setVerticalAlignment:", 1);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setHorizontalAlignment:", 1);
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setVerticalAlignmentRule:", 1);
      if (v7)
        CFRelease(v7);
      if (v9)
        CFRelease(v9);
    }
  }
  else
  {
    v10 = *(THWLabelLayer **)((char *)&self->_textIndicator + 1);
    if (v10)
    {
      *(unint64_t *)((char *)&self->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
      v10 = *(THWLabelLayer **)((char *)&self->_textIndicator + 1);
    }

    *(THWLabelLayer **)((char *)&self->_textIndicator + 1) = 0;
    if (!*(NSMutableArray **)((char *)&self->_indicators + 1))
      *(NSMutableArray **)((char *)&self->_indicators + 1) = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  v11 = *(NSMutableArray **)((char *)&self->_indicators + 1);
  if (v11)
  {
    if (objc_msgSend(v11, "count") != v4)
    {
      objc_msgSend(*(id *)((char *)&self->_indicators + 1), "removeAllObjects");
      *(unint64_t *)((char *)&self->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          v13 = -[THWPageIndicator initWithLayer:]([THWPageIndicator alloc], "initWithLayer:", -[THWPageControlRep p_layerForState:pageIndex:](self, "p_layerForState:pageIndex:", 0, i));
          objc_msgSend(*(id *)((char *)&self->_indicators + 1), "addObject:", v13);

        }
      }
    }
    v14 = objc_msgSend(v3, "currentPage");
    v15 = *(id *)((char *)&self->_currentPage + 1);
    if (v15 != v14)
    {
      v16 = (unint64_t)v14;
      if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(-[THWPageControlRep p_indicatorAtIndex:](self, "p_indicatorAtIndex:"), "setLayer:", -[THWPageControlRep p_layerForState:pageIndex:](self, "p_layerForState:pageIndex:", 0, *(unint64_t *)((char *)&self->_currentPage + 1)));
      *(unint64_t *)((char *)&self->_currentPage + 1) = v16;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(-[THWPageControlRep p_indicatorAtIndex:](self, "p_indicatorAtIndex:", v16), "setLayer:", -[THWPageControlRep p_layerForState:pageIndex:](self, "p_layerForState:pageIndex:", 1, *(unint64_t *)((char *)&self->_currentPage + 1)));
    }
  }
  if (*(THWLabelLayer **)((char *)&self->_textIndicator + 1))
  {
    v17 = objc_msgSend(v3, "currentPage");
    if (*(id *)((char *)&self->_currentPage + 1) != v17)
    {
      *(unint64_t *)((char *)&self->_currentPage + 1) = (unint64_t)v17;
      objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("%lu of %lu"), &stru_43D7D8, 0), *(unint64_t *)((char *)&self->_currentPage + 1) + 1, v4));
    }
  }
}

- (void)screenScaleDidChange
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPageControlRep;
  -[THWPageControlRep screenScaleDidChange](&v5, "screenScaleDidChange");
  objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "contentsScale");
  objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setContentsScale:");
  objc_msgSend(*(id *)((char *)&self->_cachedLayers + 1), "removeAllObjects");
  v3 = *(NSMutableArray **)((char *)&self->_indicators + 1);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_148BBC;
  v4[3] = &unk_429F40;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  char v5;
  id v6;
  id v7;
  double v8;
  double width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  float v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  void *i;
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  THWPageControlDelegate *v54;
  void *v55;
  double v56;
  CATransform3D v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CATransform3D v62;
  _BYTE v63[128];

  if (*(NSMutableArray **)((char *)&self->_indicators + 1))
  {
    v54 = -[THWPageControlRep delegate](self, "delegate");
    v5 = objc_opt_respondsToSelector(v54, "pageControl:updateLayer:forHighlight:");
    v6 = -[THWPageControlRep layout](self, "layout");
    v7 = -[THWPageControlRep p_layerForState:pageIndex:](self, "p_layerForState:pageIndex:", 0, 0);
    if (v7)
    {
      objc_msgSend(v7, "bounds");
      width = v8;
      height = v10;
    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
    objc_msgSend(v6, "spacing", v54);
    v13 = v12;
    v14 = objc_msgSend(*(id *)((char *)&self->_indicators + 1), "count");
    v56 = v13;
    v15 = v13 * (double)((unint64_t)v14 - 1);
    if ((unint64_t)v14 <= 1)
      v15 = 0.0;
    v16 = v15 + width * (double)(unint64_t)v14;
    if (v14 && *(unint64_t *)((char *)&self->_currentPage + 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = -[THWPageControlRep p_layerForState:pageIndex:](self, "p_layerForState:pageIndex:", 1, 0);
      if (v17)
        objc_msgSend(v17, "bounds");
      else
        v18 = CGSizeZero.width;
      v16 = v16 + v18 - width;
    }
    objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "contentsScale");
    v20 = v19;
    objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "viewScale");
    v22 = v21;
    memset(&v62, 0, sizeof(v62));
    CATransform3DMakeScale(&v62, v21, v21, 1.0);
    objc_msgSend(v6, "frame");
    v24 = v23;
    v26 = v25;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v27 = *(NSMutableArray **)((char *)&self->_indicators + 1);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = (v24 - v16) * 0.5;
      v32 = floorf(v31);
      v33 = *(_QWORD *)v59;
      v34 = height;
      v35 = width * v22;
      v36 = v34 * v22;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v33)
            objc_enumerationMutation(v27);
          v38 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), "layer");
          v39 = objc_msgSend(v38, "bounds");
          v41 = v40;
          v43 = TSDRoundedPointForScale(v39, v22 * v32, v22 * ((v26 - v42) * 0.5), v20);
          objc_msgSend(v38, "setPosition:", v43 + v35 * 0.5, v44 + v36 * 0.5);
          v57 = v62;
          objc_msgSend(v38, "setTransform:", &v57);
          if (v38)
          {
            if ((v5 & 1) != 0)
              objc_msgSend(v55, "pageControl:updateLayer:forHighlight:", self, v38, (char *)i + v30 == *(void **)((char *)&self->_highlightedPageIndex + 1));
            objc_msgSend(a3, "addObject:", v38);
          }
          v32 = v32 + v56 + v41;
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        v30 += (uint64_t)i;
      }
      while (v29);
    }
  }
  if (*(THWLabelLayer **)((char *)&self->_textIndicator + 1))
  {
    v45 = TSDRectWithSize(-[THWPageControlRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas"));
    v47 = v46;
    v49 = v48;
    v51 = v50;
    objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "viewScale");
    v53 = v52;
    objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setFrame:", v45, v47, v49, v51);
    objc_msgSend(*(id *)((char *)&self->_textIndicator + 1), "setFontSize:", v53 * 14.0);
    objc_msgSend(a3, "addObject:", *(THWLabelLayer **)((char *)&self->_textIndicator + 1));
  }
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5;
  unsigned int v6;
  id v7;

  v5 = -[THWControlRep controlHostRep](self, "controlHostRep");
  if ((objc_opt_respondsToSelector(v5, "control:isInteractionEnabledForRep:") & 1) == 0
    || (v6 = objc_msgSend(v5, "control:isInteractionEnabledForRep:", -[THWPageControlRep layout](self, "layout"), self)) != 0)
  {
    LOBYTE(v6) = *(NSMutableArray **)((char *)&self->_indicators + 1)
              && (v7 = objc_msgSend(a3, "gestureKind"), v7 == (id)TSWPImmediatePress)
              && objc_msgSend(-[THWPageControlRep layout](self, "layout"), "numberOfPages") != 0;
  }
  return v6;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  char *v13;
  id v14;
  char *v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  double v19;
  id v20;
  THWPageControlRep *v21;
  uint64_t v22;
  CGRect v24;

  if (!*(NSMutableArray **)((char *)&self->_indicators + 1)
    || (v5 = -[THWPageControlRep layout](self, "layout"),
        v6 = objc_msgSend(a3, "gestureKind"),
        v6 != (id)TSWPImmediatePress))
  {
    LOBYTE(v7) = 0;
    return (char)v7;
  }
  v7 = objc_msgSend(v5, "numberOfPages");
  if (!v7)
    return (char)v7;
  objc_msgSend(a3, "naturalLocationForRep:", self);
  v9 = v8;
  -[THWPageControlRep convertNaturalPointToLayerRelative:](self, "convertNaturalPointToLayerRelative:");
  v10 = -[THWPageControlRep p_nearestIndicatorToLocation:](self, "p_nearestIndicatorToLocation:");
  if (v10)
    v11 = (uint64_t)objc_msgSend(*(id *)((char *)&self->_indicators + 1), "indexOfObject:", v10);
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = objc_msgSend(a3, "gestureState");
  if (v12 - 1 < 2)
  {
    if (!objc_msgSend(objc_msgSend(-[THWPageControlRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "isAncestorScrollViewDragging"))
    {
      v21 = self;
      v22 = v11;
      goto LABEL_23;
    }
    v18 = objc_opt_class(UIGestureRecognizer);
    *(_QWORD *)&v19 = TSUDynamicCast(v18, a3).n128_u64[0];
    objc_msgSend(v20, "cancel", v19);
  }
  else if (v12 - 4 >= 2)
  {
    if (v12 == 3)
    {
      -[THWPageControlRep setHighlightedPageIndex:](self, "setHighlightedPageIndex:", 0x7FFFFFFFFFFFFFFFLL);
      v13 = (char *)objc_msgSend(v5, "currentPage");
      if (!-[THWPageControlRep pageDirectlyToIndex](self, "pageDirectlyToIndex"))
      {
        v14 = -[THWPageControlRep p_indicatorAtIndex:](self, "p_indicatorAtIndex:", *(unint64_t *)((char *)&self->_currentPage + 1));
        v15 = (char *)objc_msgSend(v5, "numberOfPages");
        if (v14
          && (objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "viewScale"),
              v17 = v9 * v16,
              objc_msgSend(objc_msgSend(v14, "layer"), "frame"),
              v17 > CGRectGetMidX(v24)))
        {
          v11 = (uint64_t)(v13 + 1);
          if (v13 + 1 == v15)
          {
            if (objc_msgSend(v5, "wrapEnabled"))
              v11 = 0;
            else
              v11 = (uint64_t)v13;
          }
        }
        else if (!objc_msgSend(v5, "wrapEnabled") || v13)
        {
          if (v13)
            v11 = (uint64_t)(v13 - 1);
          else
            v11 = 0;
        }
        else
        {
          v11 = (uint64_t)(v15 - 1);
        }
      }
      -[THWPageControlRep p_changeToPageAtIndex:](self, "p_changeToPageAtIndex:", v11);
    }
    goto LABEL_31;
  }
  v21 = self;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:
  -[THWPageControlRep setHighlightedPageIndex:](v21, "setHighlightedPageIndex:", v22);
LABEL_31:
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (void)p_changeToPageAtIndex:(unint64_t)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(-[THWPageControlRep layout](self, "layout"), "currentPage");
  if (v5 != (id)a3)
  {
    v6 = v5;
    objc_msgSend(-[THWPageControlRep layout](self, "layout"), "setCurrentPage:", a3);
    -[THWPageControlDelegate pageControl:didChangeInteractivelyFromPageIndex:toPageIndex:](-[THWPageControlRep delegate](self, "delegate"), "pageControl:didChangeInteractivelyFromPageIndex:toPageIndex:", self, v6, a3);
  }
}

- (void)setHighlightedPageIndex:(unint64_t)a3
{
  uint64_t v3;
  THWPageControlDelegate *v5;

  v3 = *(unint64_t *)((char *)&self->_highlightedPageIndex + 1);
  if (v3 != a3)
  {
    *(unint64_t *)((char *)&self->_highlightedPageIndex + 1) = a3;
    v5 = -[THWPageControlRep delegate](self, "delegate");
    if ((objc_opt_respondsToSelector(v5, "pageControl:didChangeHighlightedFromPageIndex:toPageIndex:") & 1) != 0)
      -[THWPageControlDelegate pageControl:didChangeHighlightedFromPageIndex:toPageIndex:](v5, "pageControl:didChangeHighlightedFromPageIndex:toPageIndex:", self, v3, *(unint64_t *)((char *)&self->_highlightedPageIndex + 1));
  }
}

- (THWPageControlDelegate)delegate
{
  return *(THWPageControlDelegate **)((char *)&self->_delegate + 1);
}

- (void)setDelegate:(id)a3
{
  *(THWPageControlDelegate **)((char *)&self->_delegate + 1) = (THWPageControlDelegate *)a3;
}

- (BOOL)pageDirectlyToIndex
{
  return self->_pageDirectlyToIndex;
}

- (void)setPageDirectlyToIndex:(BOOL)a3
{
  self->_pageDirectlyToIndex = a3;
}

- (unint64_t)highlightedPageIndex
{
  return *(unint64_t *)((char *)&self->_highlightedPageIndex + 1);
}

- (NSMutableArray)indicators
{
  return *(NSMutableArray **)((char *)&self->_indicators + 1);
}

- (unint64_t)currentPage
{
  return *(unint64_t *)((char *)&self->_currentPage + 1);
}

- (THWLabelLayer)textIndicator
{
  return *(THWLabelLayer **)((char *)&self->_textIndicator + 1);
}

- (TSUIntegerKeyDictionary)cachedLayers
{
  return *(TSUIntegerKeyDictionary **)((char *)&self->_cachedLayers + 1);
}

@end
