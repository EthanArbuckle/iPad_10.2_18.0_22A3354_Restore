@implementation THFlowPageLayout

- (THFlowPageLayout)initWithInfo:(id)a3
{
  THFlowPageLayout *v3;
  THFlowPageLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THFlowPageLayout;
  v3 = -[THPageLayout initWithInfo:](&v6, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(-[THFlowPageLayout info](v3, "info"), "autosizes") & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout initWithInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 69, CFSTR("flow pages must autosize"));
    v4->mLayoutManager = (TSWPLayoutManager *)objc_msgSend(objc_alloc((Class)TSWPLayoutManager), "initWithStorage:owner:", objc_msgSend(-[THFlowPageLayout info](v4, "info"), "bodyStorage"), v4);
    v4->mFirstBodyIndexNeedingGutterLayout = 0x7FFFFFFFFFFFFFFFLL;
    v4->_assignedGutterLayouts = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->mLayoutTimer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 80, CFSTR("layout timer should have been destroyed when we were removed from the layout controller"));

  self->mLayoutManager = 0;
  self->mSortedGutterDrawables = 0;

  self->_assignedGutterLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFlowPageLayout;
  -[THPageLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THFlowPageRep, a2);
}

- (THModelBodyTextInfo)bodyInfo
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(-[THFlowPageLayout info](self, "info"), "modelBodyInfos");
  if (objc_msgSend(v2, "count") != (char *)&dword_0 + 1)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout bodyInfo]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 99, CFSTR("should only have one body info"));
  v3 = objc_opt_class(THModelBodyTextInfo);
  return (THModelBodyTextInfo *)TSUCheckedDynamicCast(v3, objc_msgSend(v2, "lastObject"));
}

- (BOOL)wantsNormalBodyLayouts
{
  return 0;
}

- (id)dependentLayouts
{
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
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
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = -[THPageLayout bodyLayouts](self, "bodyLayouts", 0);
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "firstCharacterIndexOverlappingPageRect:", x, y, width, height);
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
          return (unint64_t)v13;
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (CGRect)bodyRectForChildLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_rectForBodyIndex:", objc_msgSend(a3, "bodyIndex"));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3
{
  CGFloat x;
  CGFloat y;
  NSMutableArray *mBodyLayouts;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  unint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  mBodyLayouts = self->super.mBodyLayouts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyLayouts, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(mBodyLayouts);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = -[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", objc_msgSend(v12, "bodyIndex"));
        if (a3 >= (unint64_t)v13 && a3 - (unint64_t)v13 < v14)
        {
          -[THFlowPageLayout p_layoutBodyLayout:](self, "p_layoutBodyLayout:", v12);
          -[THFlowPageLayout p_layoutGutterDrawables](self, "p_layoutGutterDrawables");
          objc_msgSend(v12, "pageOriginOfCharacterIndex:", a3);
          x = v16;
          y = v17;
          goto LABEL_13;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyLayouts, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
LABEL_13:
  v18 = x;
  v19 = y;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)layoutContentAtBodyIndex:(unint64_t)a3 offsetFromTop:(double)a4 padAbove:(double *)a5 padBelow:(double *)a6
{
  id v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;

  if (!-[NSMutableArray count](self->super.mBodyLayouts, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentAtBodyIndex:offsetFromTop:padAbove:padBelow:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 170, CFSTR("must have body layouts to layout into"));
  if ((unint64_t)-[NSMutableArray count](self->super.mBodyLayouts, "count") <= a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentAtBodyIndex:offsetFromTop:padAbove:padBelow:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 171, CFSTR("invalid body index"));
  if ((unint64_t)-[NSMutableArray count](self->super.mBodyLayouts, "count") > a3)
  {
    v11 = -[NSMutableArray objectAtIndex:](self->super.mBodyLayouts, "objectAtIndex:", a3);
    -[THFlowPageLayout p_layoutBodyLayout:](self, "p_layoutBodyLayout:", v11);
    *a5 = *a5 - a4;
    objc_msgSend(v11, "textHeight");
    *a6 = *a6 - (v12 - a4);
    if (a3)
      -[THFlowPageLayout p_layoutContentUpwardFromBodyIndex:amount:](self, "p_layoutContentUpwardFromBodyIndex:amount:", a3 - 1, a5);
    v13 = *a5;
    if (*a5 > 0.0)
    {
      -[THPageController bodyOffset](-[THPageLayout pageController](self, "pageController", v13), "bodyOffset");
      v13 = *a5 - v14;
      *a5 = v13;
    }
    v15 = a3 + 1;
    if (v15 < (unint64_t)-[NSMutableArray count](self->super.mBodyLayouts, "count", v13))
      -[THFlowPageLayout p_layoutContentDownwardFromBodyIndex:amount:](self, "p_layoutContentDownwardFromBodyIndex:amount:", v15, a6);
  }
  -[THFlowPageLayout p_layoutGutterDrawables](self, "p_layoutGutterDrawables");
  -[THPageController i_gutterOverhang](-[THPageLayout pageController](self, "pageController"), "i_gutterOverhang");
  *a6 = *a6 - v16;
}

- (void)layoutContentFromBottom:(double *)a3
{
  double v5;

  if (!-[NSMutableArray count](self->super.mBodyLayouts, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentFromBottom:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 205, CFSTR("must have body layouts to layout into"));
  if (-[NSMutableArray count](self->super.mBodyLayouts, "count"))
  {
    -[THFlowPageLayout p_layoutContentUpwardFromBodyIndex:amount:](self, "p_layoutContentUpwardFromBodyIndex:amount:", (char *)-[NSMutableArray count](self->super.mBodyLayouts, "count") - 1, a3);
    if (*a3 > 0.0)
    {
      -[THPageController bodyOffset](-[THPageLayout pageController](self, "pageController", *a3), "bodyOffset");
      *a3 = *a3 - v5;
    }
  }
}

- (void)layoutContentFromTop:(double *)a3
{
  double v5;

  if (!-[NSMutableArray count](self->super.mBodyLayouts, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentFromTop:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 220, CFSTR("must have body layouts to layout into"));
  if (-[NSMutableArray count](self->super.mBodyLayouts, "count"))
  {
    -[THPageController bodyOffset](-[THPageLayout pageController](self, "pageController"), "bodyOffset");
    *a3 = *a3 - v5;
    -[THFlowPageLayout p_layoutContentDownwardFromBodyIndex:amount:](self, "p_layoutContentDownwardFromBodyIndex:amount:", 0, a3);
  }
}

- (_NSRange)firstLineInRect:(CGRect)a3 fromCharIndex:(unint64_t)a4
{
  unint64_t v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  id v28;
  uint64_t v29;
  double MaxY;
  id v31;
  void *v32;
  id v33;
  id v34;
  char *v35;
  char *v36;
  char *v37;
  id v38;
  NSUInteger v39;
  NSUInteger v40;
  double MidY;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  NSUInteger v45;
  id v46;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _NSRange result;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[NSMutableArray count](self->super.mBodyLayouts, "count"))
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout firstLineInRect:fromCharIndex:]");
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm");
    v13 = v11;
    v4 = a4;
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v13, v12, 232, CFSTR("must have body layouts to lookup line ranges"));
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = -[NSMutableArray copy](self->super.mBodyLayouts, "copy");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v15)
  {
    v40 = 0;
    goto LABEL_27;
  }
  v16 = v15;
  v45 = 0;
  v46 = v14;
  v17 = *(_QWORD *)v51;
  v48 = *(_QWORD *)v51;
  while (2)
  {
    v18 = 0;
    v49 = v16;
    do
    {
      if (*(_QWORD *)v51 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v18);
      -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController", v44), "i_rectForBodyIndex:", objc_msgSend(v19, "bodyIndex"));
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v28 = -[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", objc_msgSend(v19, "bodyIndex"));
      if ((unint64_t)v28 + v29 > v4)
      {
        v56.origin.x = v21;
        v56.origin.y = v23;
        v56.size.width = v25;
        v56.size.height = v27;
        MaxY = CGRectGetMaxY(v56);
        v57.origin.x = x;
        v57.origin.y = y;
        v57.size.width = width;
        v57.size.height = height;
        if (MaxY > CGRectGetMinY(v57))
        {
          if (objc_msgSend(v19, "isLaidOut"))
          {
            v31 = objc_msgSend(objc_msgSend(v19, "columns"), "lastObject");
            if (v31)
            {
              v32 = v31;
              v33 = objc_msgSend(v31, "range");
              v34 = (id)v4;
              if ((unint64_t)v33 >= v4)
                v34 = objc_msgSend(v32, "range", v4);
              v35 = (char *)objc_msgSend(v32, "lineIndexForCharIndex:eol:", v34, 1);
              v36 = (char *)objc_msgSend(v32, "countLines");
              if (v35 == (char *)0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_19;
              v37 = v36;
              if (v35 >= v36)
              {
LABEL_18:
                v14 = v46;
                v4 = a4;
                v16 = v49;
LABEL_19:
                v17 = v48;
                goto LABEL_22;
              }
              while (1)
              {
                v38 = objc_msgSend(v32, "rangeOfLineFragmentAtIndex:", v35);
                v40 = v39;
                +[TSWPColumn rectForSelection:withColumns:](TSWPColumn, "rectForSelection:withColumns:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v38, v39), objc_msgSend(v19, "columns"));
                objc_msgSend(v19, "rectInParent:");
                MidY = CGRectGetMidY(v58);
                v59.origin.x = x;
                v59.origin.y = y;
                v59.size.width = width;
                v59.size.height = height;
                if (MidY > CGRectGetMinY(v59))
                  break;
                if (v37 == ++v35)
                  goto LABEL_18;
              }
              v14 = v46;
              v17 = v48;
              v16 = v49;
              if (v38 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v44 = (uint64_t)v38;
                goto LABEL_27;
              }
              v45 = v40;
              v4 = a4;
            }
          }
        }
      }
LABEL_22:
      v18 = (char *)v18 + 1;
    }
    while (v18 != v16);
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v16)
      continue;
    break;
  }
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  v40 = v45;
LABEL_27:
  v42 = v44;
  v43 = v40;
  result.length = v43;
  result.location = v42;
  return result;
}

- (void)canvasDidScroll
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  NSMutableArray *mBodyLayouts;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double MaxY;
  _QWORD rect[5];
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  objc_msgSend(-[THFlowPageLayout interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRectForContent");
  rect[0] = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  memset(&rect[1], 0, 32);
  v23 = 0u;
  v24 = 0u;
  mBodyLayouts = self->super.mBodyLayouts;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyLayouts, "countByEnumeratingWithState:objects:count:", &rect[1], v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)rect[3];
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)rect[3] != v13)
        objc_enumerationMutation(mBodyLayouts);
      v15 = *(void **)(rect[2] + 8 * v14);
      objc_msgSend(v15, "frameInRoot");
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      MinY = CGRectGetMinY(v26);
      *(_QWORD *)&v27.origin.x = rect[0];
      v27.origin.y = v5;
      v27.size.width = v7;
      v27.size.height = v9;
      if (MinY > CGRectGetMaxY(v27))
        break;
      if ((objc_msgSend(v15, "isLaidOut") & 1) == 0)
      {
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        MaxY = CGRectGetMaxY(v28);
        *(_QWORD *)&v29.origin.x = rect[0];
        v29.origin.y = v5;
        v29.size.width = v7;
        v29.size.height = v9;
        if (MaxY >= CGRectGetMinY(v29))
        {
          objc_msgSend(-[THFlowPageLayout interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayoutInBackground:", self);
          return;
        }
      }
      if (v12 == (id)++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyLayouts, "countByEnumeratingWithState:objects:count:", &rect[1], v25, 16);
        if (v12)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (void)validate
{
  NSMutableArray *mBodyLayouts;
  char *v4;
  char *v5;
  char *i;
  id v7;
  id v8;
  objc_super v9;

  if (self->mFirstBodyIndexNeedingGutterLayout != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout validate]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 312, CFSTR("should have laid out gutter drawables immediately after body layouts so our current geometry can account for overhanging gutter drawables"));
  v9.receiver = self;
  v9.super_class = (Class)THFlowPageLayout;
  -[THPageLayout validate](&v9, "validate");
  mBodyLayouts = self->super.mBodyLayouts;
  if (!mBodyLayouts)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout validate]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 316, CFSTR("invalid nil value for '%s'"), "mBodyLayouts");
    mBodyLayouts = self->super.mBodyLayouts;
  }
  if (!-[NSMutableArray count](mBodyLayouts, "count"))
  {
    v4 = (char *)-[THPageController i_bodyCount](-[THPageLayout pageController](self, "pageController"), "i_bodyCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = -[THPageController i_infoForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_infoForBodyIndex:", i);
        v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "layoutClass")), "initWithInfo:", v7);
        objc_msgSend(v8, "setBodyIndex:", i);
        -[NSMutableArray addObject:](self->super.mBodyLayouts, "addObject:", v8);
        -[THFlowPageLayout addChild:](self, "addChild:", v8);

      }
    }
  }
  objc_msgSend(-[THFlowPageLayout layoutController](self, "layoutController"), "validateOrderedLayouts:", -[NSMutableArray copy](self->super.mBodyLayouts, "copy"));
}

- (id)computeLayoutGeometry
{
  double v2;
  double v3;
  double v4;
  double v5;

  -[THPageController i_rectForPageLayout](-[THPageLayout pageController](self, "pageController"), "i_rectForPageLayout");
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v2, v3, v4, v5);
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THFlowPageLayout;
  -[THPageLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  if ((objc_msgSend(-[THFlowPageLayout layoutController](self, "layoutController"), "isLayoutOffscreen") & 1) == 0)
  {
    if (self->mLayoutTimer)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout wasAddedToLayoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 346, CFSTR("expected nil value for '%s'"), "mLayoutTimer");
    self->mLayoutTimer = +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_layoutNextBodyLayout", 0, 1, 0.25);
    -[NSRunLoop addTimer:forMode:](+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"), "addTimer:forMode:", self->mLayoutTimer, NSDefaultRunLoopMode);
  }
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THFlowPageLayout;
  -[THPageLayout willBeRemovedFromLayoutController:](&v4, "willBeRemovedFromLayoutController:", a3);
  if ((objc_msgSend(-[THFlowPageLayout layoutController](self, "layoutController"), "isLayoutOffscreen") & 1) == 0)
  {
    -[NSTimer invalidate](self->mLayoutTimer, "invalidate");

    self->mLayoutTimer = 0;
  }
}

- (BOOL)caresAboutStorageChanges
{
  return 1;
}

- (id)textWrapper
{
  return 0;
}

- (id)lineHintsForTarget:(id)a3
{
  return 0;
}

- (BOOL)invalidateOnExactTextRangeLayout
{
  return 1;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_msgSend(-[THFlowPageLayout info](self, "info"), "bodyStorage"), "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
  if (objc_msgSend(v4, "definesProperty:", 91)
    && objc_msgSend(v4, "intValueForProperty:", 91))
  {
    v5 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithPropertiesAndValues:", 91, 0, 0, 0);
    v4 = objc_msgSend(objc_msgSend(v4, "stylesheet"), "variationOfStyle:propertyMap:", v4, v5);

  }
  return v4;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)THFlowPageLayout;
  -[THFlowPageLayout maximumFrameSizeForChild:](&v5, "maximumFrameSizeForChild:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)layoutGeometryForLayout:(id)a3
{
  return 0;
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  double v7;
  double v8;
  id v9;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  objc_msgSend(-[THPageController pagePositionController](-[THPageLayout pageController](self, "pageController"), "pagePositionController"), "pageSize");
  v8 = v7;
  if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController"), "delegate"), "shouldScaleFlowLayoutsForPageController:", -[THPageLayout pageController](self, "pageController"))&& v8 != 768.0&& -[NSArray containsObject:](-[THPageLayout floatingDrawableLayouts](self, "floatingDrawableLayouts"), "containsObject:", a4))
  {
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeScale(&v15, v8 / 768.0, v8 / 768.0);
    if (a3)
      objc_msgSend(a3, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v15;
    CGAffineTransformConcat(&v14, &t1, &t2);
    v15 = v14;
    v9 = objc_alloc((Class)TSDLayoutGeometry);
    objc_msgSend(a3, "size");
    v11 = v15;
    return objc_msgSend(v9, "initWithSize:transform:", &v11);
  }
  return a3;
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  id v6;
  double v8;
  id v9;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v6 = a3;
  if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController", a3, a4), "delegate"), "shouldScaleFlowLayoutsForPageController:", -[THPageLayout pageController](self, "pageController")))
  {
    if (-[NSArray containsObject:](-[THPageLayout floatingDrawableLayouts](self, "floatingDrawableLayouts"), "containsObject:", a5))
    {
      objc_msgSend(-[THPageController pagePositionController](-[THPageLayout pageController](self, "pageController"), "pagePositionController"), "pageSize");
      if (v8 != 768.0)
      {
        memset(&v15, 0, sizeof(v15));
        CGAffineTransformMakeScale(&v15, v8 / 768.0, v8 / 768.0);
        if (v6)
          objc_msgSend(v6, "transform");
        else
          memset(&t1, 0, sizeof(t1));
        t2 = v15;
        CGAffineTransformConcat(&v14, &t1, &t2);
        v15 = v14;
        v9 = objc_alloc((Class)TSDLayoutGeometry);
        objc_msgSend(v6, "size");
        v11 = v15;
        return objc_msgSend(v9, "initWithSize:transform:", &v11);
      }
    }
  }
  return v6;
}

- (void)p_assignGutterInfo:(id)a3 toBodyLayout:(id)a4
{
  if (!-[THFlowPageLayout p_isGutterInfoAssigned:](self, "p_isGutterInfoAssigned:"))
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THFlowPageLayout assignedGutterLayouts](self, "assignedGutterLayouts"), "setObject:forUncopiedKey:", a4, a3);
}

- (BOOL)p_isGutterInfo:(id)a3 assgnedToBodyLayout:(id)a4
{
  return -[TSUPointerKeyDictionary objectForKey:](-[THFlowPageLayout assignedGutterLayouts](self, "assignedGutterLayouts"), "objectForKey:", a3) == a4;
}

- (BOOL)p_isGutterInfoAssigned:(id)a3
{
  return objc_msgSend(-[TSUPointerKeyDictionary allKeys](-[THFlowPageLayout assignedGutterLayouts](self, "assignedGutterLayouts"), "allKeys"), "tsu_containsObjectIdenticalTo:", a3);
}

- (double)p_offsetForGutterDrawableLayout:(id)a3 forBody:(id)a4 atOffset:(double)a5
{
  double v6;

  objc_msgSend(objc_msgSend(a3, "geometry"), "frame");
  return v6 + a5 + 24.0;
}

- (double)p_heightOfGutterDrawablesForBodyLayout:(id)a3
{
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v11;
  id v12;
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  char *v19;
  BOOL v20;
  unsigned int v21;
  BOOL v22;
  id v23;
  double v24;
  id v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = -[THFlowPageLayout gutterDrawableStorage](self, "gutterDrawableStorage");
  v6 = -[THFlowPageLayout sortedGutterDrawables](self, "sortedGutterDrawables");
  v7 = (char *)-[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", objc_msgSend(a3, "bodyIndex"));
  v9 = v8;
  v10 = 0.0;
  if (objc_msgSend(-[THFlowPageLayout info](self, "info"), "hasBodyFlow"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v6;
    v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = &v7[v9];
      v14 = *(_QWORD *)v32;
      do
      {
        v15 = 0;
        v16 = obj;
        do
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v16);
          v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v15);
          v18 = objc_msgSend(v5, "positioningOfDrawable:", v17);
          if (v18)
          {
            v19 = (char *)objc_msgSend(v18, "bodyCharIndex");
            v20 = v7 <= v19 && v13 >= v19;
            if (v20
              || v19 == (char *)0x7FFFFFFFFFFFFFFFLL
              && (v21 = objc_msgSend(a3, "bodyIndex"),
                  v22 = (char *)-[NSMutableArray count](self->super.mBodyLayouts, "count") - 1 == (_BYTE *)v21,
                  v16 = obj,
                  v22))
            {
              if (!-[THFlowPageLayout p_isGutterInfoAssigned:](self, "p_isGutterInfoAssigned:", v17)
                || -[THFlowPageLayout p_isGutterInfo:assgnedToBodyLayout:](self, "p_isGutterInfo:assgnedToBodyLayout:", v17, a3))
              {
                v23 = -[THPageLayout insertValidatedChildLayoutForInfo:](self, "insertValidatedChildLayoutForInfo:", v17);
                if (v23)
                {
                  -[THFlowPageLayout p_offsetForGutterDrawableLayout:forBody:atOffset:](self, "p_offsetForGutterDrawableLayout:forBody:atOffset:", v23, a3, v10);
                  v10 = v24;
                  -[THFlowPageLayout p_assignGutterInfo:toBodyLayout:](self, "p_assignGutterInfo:toBodyLayout:", v17, a3);
                }
                else
                {
                  v25 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
                  v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_heightOfGutterDrawablesForBodyLayout:]");
                  v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm");
                  v28 = v25;
                  v16 = obj;
                  objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 536, CFSTR("invalid nil value for '%s'"), "gutterLayout");
                }
              }
            }
          }
          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v12);
    }
  }
  return v10;
}

- (void)p_layoutBodyLayout:(id)a3
{
  unsigned __int8 v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  double v9;
  double v10;
  THPageController *v11;
  double v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t mFirstBodyIndexNeedingGutterLayout;
  unint64_t v17;
  NSRange v18;
  NSRange v19;

  v5 = objc_msgSend(a3, "isLaidOut");
  v6 = -[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", objc_msgSend(a3, "bodyIndex"));
  v8 = v7;
  v18.location = (NSUInteger)-[TSWPLayoutManager dirtyRange](self->mLayoutManager, "dirtyRange");
  v19.location = (NSUInteger)v6;
  v19.length = v8;
  if (NSIntersectionRange(v18, v19).length || (v5 & 1) == 0)
  {
    objc_msgSend(a3, "layoutWithLayoutManager:range:", self->mLayoutManager, v6, v8);
    if ((v5 & 1) == 0)
    {
      v9 = 0.0;
      if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController"), "delegate"), "isCompactFlowPresentationForPageController:", -[THPageLayout pageController](self, "pageController")))
      {
        -[THFlowPageLayout p_heightOfGutterDrawablesForBodyLayout:](self, "p_heightOfGutterDrawablesForBodyLayout:", a3);
        v9 = v10;
      }
      v11 = -[THPageLayout pageController](self, "pageController");
      objc_msgSend(a3, "textHeight");
      -[THPageController i_setHeight:forBodyIndex:](v11, "i_setHeight:forBodyIndex:", objc_msgSend(a3, "bodyIndex"), v9 + v12);
      LODWORD(v13) = objc_msgSend(a3, "bodyIndex");
      v14 = -[NSMutableArray count](self->super.mBodyLayouts, "count");
      if ((unint64_t)v14 > v13)
      {
        v15 = (unint64_t)v14;
        v13 = v13;
        do
          objc_msgSend(-[NSMutableArray objectAtIndex:](self->super.mBodyLayouts, "objectAtIndex:", v13++), "invalidatePosition");
        while (v15 != v13);
      }
      mFirstBodyIndexNeedingGutterLayout = self->mFirstBodyIndexNeedingGutterLayout;
      if (mFirstBodyIndexNeedingGutterLayout >= objc_msgSend(a3, "bodyIndex"))
        v17 = objc_msgSend(a3, "bodyIndex");
      else
        v17 = self->mFirstBodyIndexNeedingGutterLayout;
      self->mFirstBodyIndexNeedingGutterLayout = v17;
    }
    -[THFlowPageLayout invalidateFrame](self, "invalidateFrame");
    objc_msgSend(-[THFlowPageLayout parent](self, "parent"), "invalidateFrame");
  }
}

- (void)p_layoutNextBodyLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableArray *mBodyLayouts;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *i;
  void *v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (-[NSMutableArray count](self->super.mBodyLayouts, "count")
    && (objc_msgSend(-[THFlowPageLayout interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0)
  {
    objc_msgSend(-[THFlowPageLayout interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRectForContent");
    TSDCenterOfRect(v3, v4, v5, v6);
    v8 = v7;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    mBodyLayouts = self->super.mBodyLayouts;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyLayouts, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      v14 = 1.79769313e308;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(mBodyLayouts);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v16, "isLaidOut") & 1) == 0)
          {
            objc_msgSend(v16, "frameInRoot");
            x = v28.origin.x;
            y = v28.origin.y;
            width = v28.size.width;
            height = v28.size.height;
            if (CGRectGetMaxY(v28) > v8)
            {
              v30.origin.x = x;
              v30.origin.y = y;
              v30.size.width = width;
              v30.size.height = height;
              v21 = CGRectGetMinY(v30) - v8;
              goto LABEL_16;
            }
            v29.origin.x = x;
            v29.origin.y = y;
            v29.size.width = width;
            v29.size.height = height;
            v14 = v8 - CGRectGetMaxY(v29);
            v12 = v16;
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyLayouts, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
      v16 = 0;
      v21 = 1.79769313e308;
    }
    else
    {
      v16 = 0;
      v12 = 0;
      v21 = 1.79769313e308;
      v14 = 1.79769313e308;
    }
LABEL_16:
    if (v14 >= v21)
      v22 = v16;
    else
      v22 = v12;
    if (v22)
    {
      -[THFlowPageLayout p_layoutBodyLayout:](self, "p_layoutBodyLayout:");
      -[THFlowPageLayout p_layoutGutterDrawables](self, "p_layoutGutterDrawables");
    }
    else
    {
      -[NSTimer invalidate](self->mLayoutTimer, "invalidate");

      self->mLayoutTimer = 0;
    }
  }
}

- (void)p_layoutContentUpwardFromBodyIndex:(unint64_t)a3 amount:(double *)a4
{
  unint64_t v6;
  double v7;
  id v8;
  double v9;
  double v10;

  if (a3 != -1)
  {
    v6 = a3;
    v7 = *a4;
    do
    {
      if (v7 <= 0.0)
        break;
      v8 = -[NSMutableArray objectAtIndex:](self->super.mBodyLayouts, "objectAtIndex:", v6);
      -[THFlowPageLayout p_layoutBodyLayout:](self, "p_layoutBodyLayout:", v8);
      objc_msgSend(v8, "textHeight");
      v7 = *a4 - v9;
      *a4 = v7;
      --v6;
    }
    while (v6 != -1);
  }
  -[THFlowPageLayout p_layoutGutterDrawables](self, "p_layoutGutterDrawables");
  -[THPageController i_gutterOverhang](-[THPageLayout pageController](self, "pageController"), "i_gutterOverhang");
  *a4 = *a4 - v10;
}

- (void)p_layoutContentDownwardFromBodyIndex:(unint64_t)a3 amount:(double *)a4
{
  id v7;
  id v8;
  double v9;
  id v10;
  double v11;
  double v12;

  v7 = -[NSMutableArray count](self->super.mBodyLayouts, "count");
  if ((unint64_t)v7 > a3)
  {
    v8 = v7;
    v9 = *a4;
    do
    {
      if (v9 <= 0.0)
        break;
      v10 = -[NSMutableArray objectAtIndex:](self->super.mBodyLayouts, "objectAtIndex:", a3);
      -[THFlowPageLayout p_layoutBodyLayout:](self, "p_layoutBodyLayout:", v10);
      objc_msgSend(v10, "textHeight");
      v9 = *a4 - v11;
      *a4 = v9;
      ++a3;
    }
    while (v8 != (id)a3);
  }
  -[THFlowPageLayout p_layoutGutterDrawables](self, "p_layoutGutterDrawables");
  -[THPageController i_gutterOverhang](-[THPageLayout pageController](self, "pageController"), "i_gutterOverhang");
  *a4 = *a4 - v12;
}

- (id)gutterDrawableStorage
{
  return objc_msgSend(objc_msgSend(-[THFlowPageLayout info](self, "info"), "parent"), "gutterStorageForPresentationType:", -[THPageController presentationType](-[THPageLayout pageController](self, "pageController"), "presentationType"));
}

- (id)sortedGutterDrawables
{
  id result;

  result = self->mSortedGutterDrawables;
  if (!result)
  {
    result = objc_msgSend(-[THFlowPageLayout gutterDrawableStorage](self, "gutterDrawableStorage"), "orderedDrawables");
    self->mSortedGutterDrawables = (NSArray *)result;
  }
  return result;
}

- (void)p_placeGutterDrawableLayout:(id)a3 withPositioning:(id)a4 inColumn:(id)a5 inBody:(id)a6
{
  id v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;

  v11 = objc_msgSend(a4, "bodyCharIndex");
  v12 = 0.0;
  if (a5)
  {
    objc_msgSend(a5, "topOfLineAtCharIndex:", v11);
    v12 = v13;
  }
  v14 = objc_msgSend(a3, "geometry");
  objc_msgSend(a4, "offset");
  v16 = v15;
  objc_msgSend(v14, "frame");
  v18 = v17;
  -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_rectForBodyIndex:", objc_msgSend(a6, "bodyIndex"));
  v20 = v19;
  v21 = v16 + v12 + v19;
  v22 = objc_msgSend(a6, "bodyIndex");
  if ((_DWORD)v22)
    v23 = 0.0;
  else
    v23 = v20;
  if (v21 > v23)
    v23 = v21;
  objc_msgSend(a3, "offsetGeometryBy:", 0.0, TSURound(v22, v23) - v18);
}

- (double)p_placeCompactGutterDrawableLayout:(id)a3 forBody:(id)a4 atOffset:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  objc_msgSend(objc_msgSend(a3, "geometry"), "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_rectForBodyIndex:", objc_msgSend(a4, "bodyIndex"));
  v16 = v15;
  objc_msgSend(a4, "textHeight");
  v18 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v10, v17 + v16 + a5, v12, v14);
  objc_msgSend(a3, "setGeometry:", v18);

  return v14 + a5 + 24.0;
}

- (void)p_layoutGutterDrawablesForBodyLayout:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *i;
  uint64_t v11;
  id v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[THFlowPageLayout sortedGutterDrawables](self, "sortedGutterDrawables");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (-[THFlowPageLayout p_isGutterInfo:assgnedToBodyLayout:](self, "p_isGutterInfo:assgnedToBodyLayout:", v11, a3))
        {
          v12 = -[THPageLayout insertValidatedChildLayoutForInfo:](self, "insertValidatedChildLayoutForInfo:", v11);
          if (v12)
          {
            -[THFlowPageLayout p_placeCompactGutterDrawableLayout:forBody:atOffset:](self, "p_placeCompactGutterDrawableLayout:forBody:atOffset:", v12, a3, v9);
            v9 = v13;
          }
          else
          {
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawablesForBodyLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 733, CFSTR("invalid nil value for '%s'"), "gutterLayout");
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
}

- (void)p_layoutGutterDrawables
{
  unint64_t mFirstBodyIndexNeedingGutterLayout;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v14;
  char *v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  char *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char *v29;
  id v30;
  char *v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  id v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  char v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double MaxY;
  THPageController *v62;
  double v63;
  unint64_t rect_8;
  CGFloat rect_16;
  id rect_24;
  id v67;
  char *v68;
  id v69;
  unsigned int v70;
  CGFloat v71;
  id v72;
  void *v73;
  char *v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  if (objc_msgSend(-[THFlowPageLayout info](self, "info"), "hasBodyFlow"))
  {
    if (self->mFirstBodyIndexNeedingGutterLayout == 0x7FFFFFFFFFFFFFFFLL)
      return;
    if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController"), "delegate"), "isCompactFlowPresentationForPageController:", -[THPageLayout pageController](self, "pageController")))
    {
      mFirstBodyIndexNeedingGutterLayout = self->mFirstBodyIndexNeedingGutterLayout;
      v4 = -[NSMutableArray count](self->super.mBodyLayouts, "count");
      if (mFirstBodyIndexNeedingGutterLayout < (unint64_t)v4)
      {
        v5 = v4;
        do
        {
          v6 = -[NSMutableArray objectAtIndex:](self->super.mBodyLayouts, "objectAtIndex:", mFirstBodyIndexNeedingGutterLayout);
          if (objc_msgSend(v6, "isLaidOut"))
            -[THFlowPageLayout p_layoutGutterDrawablesForBodyLayout:](self, "p_layoutGutterDrawablesForBodyLayout:", v6);
          ++mFirstBodyIndexNeedingGutterLayout;
        }
        while (v5 != (id)mFirstBodyIndexNeedingGutterLayout);
      }
    }
    else
    {
      v7 = -[THFlowPageLayout layoutController](self, "layoutController");
      v8 = -[THFlowPageLayout gutterDrawableStorage](self, "gutterDrawableStorage");
      v9 = -[THFlowPageLayout sortedGutterDrawables](self, "sortedGutterDrawables");
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
      v73 = v9;
      v74 = (char *)objc_msgSend(v9, "count");
      v14 = self->mFirstBodyIndexNeedingGutterLayout;
      v72 = -[NSMutableArray count](self->super.mBodyLayouts, "count");
      if (v14 < (unint64_t)v72)
      {
        v15 = 0;
        rect_24 = v8;
        v67 = v7;
        do
        {
          v16 = -[NSMutableArray objectAtIndex:](self->super.mBodyLayouts, "objectAtIndex:", v14);
          v70 = objc_msgSend(v16, "isLaidOut");
          v17 = (id)(v14 + 1);
          rect_8 = v14;
          v18 = (char *)-[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", v14);
          if (v15 < v74)
          {
            v20 = v18;
            v68 = &v18[v19];
            v69 = v17;
            do
            {
              v21 = objc_msgSend(v73, "objectAtIndex:", v15);
              v22 = objc_msgSend(v8, "positioningOfDrawable:", v21);
              v23 = (char *)objc_msgSend(v22, "bodyCharIndex");
              if (v23 >= v20)
              {
                v29 = v23;
                if (v17 != v72 && v23 >= v68)
                  goto LABEL_35;
                if (v70)
                {
                  if (objc_msgSend(objc_msgSend(v16, "columns"), "count") != (char *)&dword_0 + 1)
                  {
                    v17 = v69;
                    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawables]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 804, CFSTR("should only have one column in flow"));
                  }
                  v30 = objc_msgSend(objc_msgSend(v16, "columns"), "lastObject");
                  v31 = (char *)objc_msgSend(v30, "range");
                  if (v29 < v31 || v29 - v31 >= v32)
                  {
                    if (v17 != v72 || (v33 = (char *)objc_msgSend(v30, "range"), v29 != &v33[v34]))
                    {
                      v17 = v69;
                      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawables]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 807, CFSTR("column range should include drawable range"));
                    }
                  }
                  v35 = -[THPageLayout insertValidatedChildLayoutForInfo:](self, "insertValidatedChildLayoutForInfo:", v21);
                  if (!v35)
                  {
                    v17 = v69;
                    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawables]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"), 810, CFSTR("invalid nil value for '%s'"), "gutterLayout");
                  }
                  -[THFlowPageLayout p_placeGutterDrawableLayout:withPositioning:inColumn:inBody:](self, "p_placeGutterDrawableLayout:withPositioning:inColumn:inBody:", v35, v22, v30, v16);
                  v75.origin.x = x;
                  v75.origin.y = y;
                  v75.size.width = width;
                  v75.size.height = height;
                  if (!CGRectIsNull(v75))
                  {
                    objc_msgSend(v35, "frame");
                    v37 = v36;
                    rect_16 = v38;
                    v40 = v39;
                    v42 = v41;
                    v76.origin.x = x;
                    v76.origin.y = y;
                    v76.size.width = width;
                    v76.size.height = height;
                    v43 = height;
                    v44 = width;
                    v45 = y;
                    v46 = x;
                    v47 = CGRectGetMaxY(v76) + 24.0;
                    v77.origin.x = v37;
                    v77.origin.y = rect_16;
                    v77.size.width = v40;
                    v77.size.height = v42;
                    if (v47 > CGRectGetMinY(v77))
                    {
                      v78.origin.x = v46;
                      v78.origin.y = v45;
                      v78.size.width = v44;
                      v78.size.height = v43;
                      v48 = CGRectGetMaxY(v78) + 24.0;
                      v79.origin.x = v37;
                      v79.origin.y = rect_16;
                      v79.size.width = v40;
                      v79.size.height = v42;
                      objc_msgSend(v35, "offsetGeometryBy:", 0.0, v48 - CGRectGetMinY(v79));
                    }
                  }
                  objc_msgSend(v35, "frame");
                  x = v49;
                  y = v50;
                  width = v51;
                  height = v52;
                  v8 = rect_24;
                  v7 = v67;
                }
              }
              else
              {
                v24 = objc_msgSend(v7, "layoutForInfo:childOfLayout:", v21, self);
                if (v24)
                {
                  objc_msgSend(v24, "frame");
                  x = v25;
                  y = v26;
                  width = v27;
                  height = v28;
                }
              }
              ++v15;
            }
            while (v74 != v15);
            v15 = v74;
          }
LABEL_35:
          v53 = v70 ^ 1;
          if (v17 != v72)
            v53 = 1;
          if ((v53 & 1) == 0)
          {
            -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_rectForBodyIndex:", rect_8);
            v71 = v54;
            v56 = v55;
            v58 = v57;
            v60 = v59;
            v80.origin.x = x;
            v80.origin.y = y;
            v80.size.width = width;
            v80.size.height = height;
            if (!CGRectIsNull(v80))
            {
              v81.origin.x = x;
              v81.origin.y = y;
              v81.size.width = width;
              v81.size.height = height;
              MaxY = CGRectGetMaxY(v81);
              v82.origin.x = v71;
              v82.origin.y = v56;
              v82.size.width = v58;
              v82.size.height = v60;
              if (MaxY > CGRectGetMaxY(v82))
              {
                v62 = -[THPageLayout pageController](self, "pageController");
                v83.origin.x = x;
                v83.origin.y = y;
                v83.size.width = width;
                v83.size.height = height;
                v63 = CGRectGetMaxY(v83);
                v84.origin.x = v71;
                v84.origin.y = v56;
                v84.size.width = v58;
                v84.size.height = v60;
                -[THPageController i_setGutterOverhang:](v62, "i_setGutterOverhang:", v63 - CGRectGetMaxY(v84));
              }
            }
          }
          v14 = (unint64_t)v17;
        }
        while (v17 != v72);
      }
    }
  }
  self->mFirstBodyIndexNeedingGutterLayout = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isMaxXEdgeObscured
{
  return self->_maxXEdgeObscured;
}

- (void)setMaxXEdgeObscured:(BOOL)a3
{
  self->_maxXEdgeObscured = a3;
}

- (TSUPointerKeyDictionary)assignedGutterLayouts
{
  return self->_assignedGutterLayouts;
}

- (void)setAssignedGutterLayouts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

@end
