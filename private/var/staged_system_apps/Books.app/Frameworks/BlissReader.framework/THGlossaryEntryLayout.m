@implementation THGlossaryEntryLayout

- (void)setLayoutStyleProvider:(id)a3
{
  self->mLayoutStyleProvider = (THGlossaryEntryLayoutStyleProvider *)a3;
  -[THGlossaryEntryLayout updateChildrenFromInfo](self, "updateChildrenFromInfo");
}

- (void)dealloc
{
  objc_super v3;

  -[THGlossaryWPLayout setParent:](self->mHeaderLayout, "setParent:", 0);

  self->mHeaderLayout = 0;
  -[THGlossaryWPLayout setLayoutRequirementsProvider:](self->mBodyLayout, "setLayoutRequirementsProvider:", 0);
  -[THGlossaryWPLayout setParent:](self->mBodyLayout, "setParent:", 0);

  self->mBodyLayout = 0;
  -[THGlossaryWPLayout setParent:](self->mRelatedTermsLayout, "setParent:", 0);

  self->mRelatedTermsLayout = 0;
  -[THGlossaryWPLayout setParent:](self->mIndexLayout, "setParent:", 0);

  self->mIndexLayout = 0;
  -[THGlossaryEntryFloatingLayout setParent:](self->mFloatingLayout, "setParent:", 0);

  self->mFloatingLayout = 0;
  -[THWLabelControlLayout setParent:](-[THGlossaryEntryLayout relatedTermsLabelLayout](self, "relatedTermsLabelLayout"), "setParent:", 0);
  -[THGlossaryEntryLayout setRelatedTermsLabelLayout:](self, "setRelatedTermsLabelLayout:", 0);
  -[THGlossaryDividerLayout setParent:](-[THGlossaryEntryLayout relatedTermsDividerLayout](self, "relatedTermsDividerLayout"), "setParent:", 0);
  -[THGlossaryEntryLayout setRelatedTermsDividerLayout:](self, "setRelatedTermsDividerLayout:", 0);
  -[THWLabelControlLayout setParent:](-[THGlossaryEntryLayout indexLabelLayout](self, "indexLabelLayout"), "setParent:", 0);
  -[THGlossaryEntryLayout setIndexLabelLayout:](self, "setIndexLabelLayout:", 0);
  -[THGlossaryDividerLayout setParent:](-[THGlossaryEntryLayout indexDividerLayout](self, "indexDividerLayout"), "setParent:", 0);
  -[THGlossaryEntryLayout setIndexDividerLayout:](self, "setIndexDividerLayout:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryLayout;
  -[THGlossaryEntryLayout dealloc](&v3, "dealloc");
}

- (BOOL)p_shouldHaveFloatingLayout
{
  return -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutFloatingStyle](self->mLayoutStyleProvider, "glossaryEntryLayoutFloatingStyle") != 0;
}

- (BOOL)shouldWrapAgainstFloatingDrawables
{
  return -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutFloatingStyle](self->mLayoutStyleProvider, "glossaryEntryLayoutFloatingStyle") == 1;
}

- (THGlossaryWPLayout)headerLayout
{
  id v3;
  THGlossaryWPLayout *result;
  BOOL v5;
  THGlossaryWPLayout *v6;

  v3 = objc_msgSend(-[THGlossaryEntryLayout info](self, "info"), "headerInfo");
  result = self->mHeaderLayout;
  if (result)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = -[THGlossaryWPLayout initWithInfo:]([THGlossaryWPLayout alloc], "initWithInfo:", v3);
    self->mHeaderLayout = v6;
    -[THGlossaryWPLayout setParent:](v6, "setParent:", self);
    -[THGlossaryWPLayout setLayoutRequirementsProvider:](self->mHeaderLayout, "setLayoutRequirementsProvider:", self);
    return self->mHeaderLayout;
  }
  return result;
}

- (THGlossaryWPLayout)bodyLayout
{
  id v3;
  THGlossaryWPLayout *result;
  BOOL v5;
  THGlossaryWPLayout *v6;

  v3 = objc_msgSend(-[THGlossaryEntryLayout info](self, "info"), "bodyStorage");
  result = self->mBodyLayout;
  if (result)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = -[THGlossaryWPLayout initWithInfo:]([THGlossaryWPLayout alloc], "initWithInfo:", v3);
    self->mBodyLayout = v6;
    -[THGlossaryWPLayout setParent:](v6, "setParent:", self);
    -[THGlossaryWPLayout setLayoutRequirementsProvider:](self->mBodyLayout, "setLayoutRequirementsProvider:", self);
    return self->mBodyLayout;
  }
  return result;
}

- (THGlossaryWPLayout)relatedTermsLayout
{
  id v3;
  THGlossaryWPLayout *result;
  BOOL v5;
  THGlossaryWPLayout *v6;

  v3 = objc_msgSend(-[THGlossaryEntryLayout info](self, "info"), "relatedTermsInfo");
  result = self->mRelatedTermsLayout;
  if (result)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = -[THGlossaryWPLayout initWithInfo:]([THGlossaryWPLayout alloc], "initWithInfo:", v3);
    self->mRelatedTermsLayout = v6;
    -[THGlossaryWPLayout setParent:](v6, "setParent:", self);
    -[THGlossaryWPLayout setLayoutRequirementsProvider:](self->mRelatedTermsLayout, "setLayoutRequirementsProvider:", self);
    return self->mRelatedTermsLayout;
  }
  return result;
}

- (THGlossaryWPLayout)indexLayout
{
  id v3;
  THGlossaryWPLayout *result;
  BOOL v5;
  THGlossaryWPLayout *v6;

  v3 = objc_msgSend(-[THGlossaryEntryLayout info](self, "info"), "linksInfo");
  result = self->mIndexLayout;
  if (result)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = -[THGlossaryWPLayout initWithInfo:]([THGlossaryWPLayout alloc], "initWithInfo:", v3);
    self->mIndexLayout = v6;
    -[THGlossaryWPLayout setParent:](v6, "setParent:", self);
    -[THGlossaryWPLayout setLayoutRequirementsProvider:](self->mIndexLayout, "setLayoutRequirementsProvider:", self);
    return self->mIndexLayout;
  }
  return result;
}

- (THGlossaryEntryFloatingLayout)floatingLayout
{
  id v3;
  BOOL v4;
  void *v5;
  THGlossaryEntryFloatingLayout *v6;

  v3 = objc_msgSend(-[THGlossaryEntryLayout info](self, "info"), "floatingInfo");
  if (self->mFloatingLayout)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (!v4)
  {
    v5 = v3;
    if (-[THGlossaryEntryLayout p_shouldHaveFloatingLayout](self, "p_shouldHaveFloatingLayout"))
    {
      v6 = (THGlossaryEntryFloatingLayout *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "layoutClass")), "initWithInfo:", v5);
      self->mFloatingLayout = v6;
      -[THGlossaryEntryFloatingLayout setParent:](v6, "setParent:", self);
    }
  }
  return self->mFloatingLayout;
}

- (THWLabelControlLayout)relatedTermsLabelLayout
{
  THWLabelControlLayout *result;

  result = self->_relatedTermsLabelLayout;
  if (!result)
  {
    result = -[THWControlLayout initWithTag:]([THWLabelControlLayout alloc], "initWithTag:", 0);
    self->_relatedTermsLabelLayout = result;
  }
  return result;
}

- (THGlossaryDividerLayout)relatedTermsDividerLayout
{
  THGlossaryDividerLayout *result;

  result = self->_relatedTermsDividerLayout;
  if (!result)
  {
    result = objc_alloc_init(THGlossaryDividerLayout);
    self->_relatedTermsDividerLayout = result;
  }
  return result;
}

- (THWLabelControlLayout)indexLabelLayout
{
  THWLabelControlLayout *result;

  result = self->_indexLabelLayout;
  if (!result)
  {
    result = -[THWControlLayout initWithTag:]([THWLabelControlLayout alloc], "initWithTag:", 1);
    self->_indexLabelLayout = result;
  }
  return result;
}

- (THGlossaryDividerLayout)indexDividerLayout
{
  THGlossaryDividerLayout *result;

  result = self->_indexDividerLayout;
  if (!result)
  {
    result = objc_alloc_init(THGlossaryDividerLayout);
    self->_indexDividerLayout = result;
  }
  return result;
}

- (int)p_portionForLayout:(id)a3
{
  if (self->mHeaderLayout == a3)
    return 1;
  if (self->mBodyLayout == a3)
    return 2;
  if (self->mRelatedTermsLayout == a3)
    return 3;
  return 4 * (self->mIndexLayout == a3);
}

- (id)p_layoutForPortion:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return *(id *)&self->TSDLayout_opaque[*off_428FD8[a3 - 1]];
}

- (double)p_heightForPortion:(int)a3
{
  uint64_t v3;
  double v5;
  id v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  double MaxY;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;

  v3 = *(_QWORD *)&a3;
  v5 = 0.0;
  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:"))
  {
    v6 = -[THGlossaryEntryLayout p_layoutForPortion:](self, "p_layoutForPortion:", v3);
    -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutDefaultHeightForPortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutDefaultHeightForPortion:", v3);
    if (v6)
    {
      objc_msgSend(objc_msgSend(v6, "geometry"), "size");
      v5 = v8;
    }
    else
    {
      v5 = v7;
    }
    if ((_DWORD)v3 == 2)
    {
      -[THGlossaryEntryLayout p_updateFloatingPositionsIfRequired](self, "p_updateFloatingPositionsIfRequired");
      v9 = -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutFloatingStyle](self->mLayoutStyleProvider, "glossaryEntryLayoutFloatingStyle");
      if (v9 == 1)
      {
        -[THGlossaryEntryFloatingLayout boundingBoxForChildren](self->mFloatingLayout, "boundingBoxForChildren");
        MaxY = CGRectGetMaxY(v17);
      }
      else
      {
        if (v9 != 2)
          return v5;
        -[THGlossaryEntryFloatingLayout boundingBoxForChildren](self->mFloatingLayout, "boundingBoxForChildren");
        v10 = CGRectGetMaxY(v16);
        -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutValueForDistance:](self->mLayoutStyleProvider, "glossaryEntryLayoutValueForDistance:", 6);
        MaxY = v10 + v11;
      }
      -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 2);
      v14 = MaxY - v13;
      if (v14 > v5)
        return v14;
    }
  }
  return v5;
}

- (double)p_topCoordinateForPortion:(int)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;

  -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutTopMarginForPortion:");
  v6 = (uint64_t)v5;
  if (a3 >= 2)
  {
    v7 = 1;
    do
    {
      -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutTopMarginForPortion:", v7);
      v9 = v8 + (double)v6;
      -[THGlossaryEntryLayout p_heightForPortion:](self, "p_heightForPortion:", v7);
      v7 = (v7 + 1);
      v6 = (uint64_t)(v10 + (double)(uint64_t)v9);
    }
    while (a3 != (_DWORD)v7);
  }
  return (double)v6;
}

- (void)updateChildrenFromInfo
{
  id v3;
  id v4;
  THGlossaryWPLayout *v5;
  THGlossaryWPLayout *v6;
  THGlossaryWPLayout *v7;
  THGlossaryWPLayout *v8;
  THGlossaryEntryFloatingLayout *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_msgSend(-[THGlossaryEntryLayout info](self, "info"), "childInfos");
  v4 = objc_msgSend(objc_alloc((Class)TSUNoCopyDictionary), "initWithCapacity:", 5);
  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:", 1))
  {
    v5 = -[THGlossaryEntryLayout headerLayout](self, "headerLayout");
    if (-[THGlossaryWPLayout info](v5, "info"))
      objc_msgSend(v4, "setObject:forUncopiedKey:", v5, -[THGlossaryWPLayout info](v5, "info"));
  }
  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:", 2))
  {
    v6 = -[THGlossaryEntryLayout bodyLayout](self, "bodyLayout");
    if (-[THGlossaryWPLayout info](v6, "info"))
      objc_msgSend(v4, "setObject:forUncopiedKey:", v6, -[THGlossaryWPLayout info](v6, "info"));
  }
  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:", 3))
  {
    v7 = -[THGlossaryEntryLayout relatedTermsLayout](self, "relatedTermsLayout");
    if (-[THGlossaryWPLayout info](v7, "info"))
      objc_msgSend(v4, "setObject:forUncopiedKey:", v7, -[THGlossaryWPLayout info](v7, "info"));
  }
  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:", 4))
  {
    v8 = -[THGlossaryEntryLayout indexLayout](self, "indexLayout");
    if (-[THGlossaryWPLayout info](v8, "info"))
      objc_msgSend(v4, "setObject:forUncopiedKey:", v8, -[THGlossaryWPLayout info](v8, "info"));
  }
  v9 = -[THGlossaryEntryLayout floatingLayout](self, "floatingLayout");
  if (-[THGlossaryEntryFloatingLayout info](v9, "info"))
    objc_msgSend(v4, "setObject:forUncopiedKey:", v9, -[THGlossaryEntryFloatingLayout info](v9, "info"));
  v10 = objc_msgSend(-[THGlossaryEntryLayout children](self, "children"), "count");
  if (v10 != objc_msgSend(v4, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v3);
          v16 = objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15));
          if (v16)
            objc_msgSend(v11, "addObject:", v16);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }
    if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:", 3))
    {
      objc_msgSend(v11, "addObject:", -[THGlossaryEntryLayout relatedTermsLabelLayout](self, "relatedTermsLabelLayout"));
      objc_msgSend(v11, "addObject:", -[THGlossaryEntryLayout relatedTermsDividerLayout](self, "relatedTermsDividerLayout"));
    }
    if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutIncludePortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutIncludePortion:", 4))
    {
      objc_msgSend(v11, "addObject:", -[THGlossaryEntryLayout indexLabelLayout](self, "indexLabelLayout"));
      objc_msgSend(v11, "addObject:", -[THGlossaryEntryLayout indexDividerLayout](self, "indexDividerLayout"));
    }
    -[THGlossaryEntryLayout setChildren:](self, "setChildren:", v11);

    -[THGlossaryEntryLayout invalidate](self, "invalidate");
  }

  objc_msgSend(-[THGlossaryEntryLayout children](self, "children"), "makeObjectsPerformSelector:", "updateChildrenFromInfo");
}

- (double)p_columnMargin
{
  double result;

  -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutValueForDistance:](self->mLayoutStyleProvider, "glossaryEntryLayoutValueForDistance:", 0);
  return result;
}

- (CGRect)p_viewFrameBasedOnStyle
{
  THGlossaryEntryLayoutStyleProvider *mLayoutStyleProvider;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  mLayoutStyleProvider = self->mLayoutStyleProvider;
  if (mLayoutStyleProvider)
  {
    -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutViewFrame](mLayoutStyleProvider, "glossaryEntryLayoutViewFrame");
  }
  else
  {
    v3 = 0.0;
    v5 = 100.0;
    v4 = 0.0;
    v6 = 100.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_unscaledViewFrameBasedOnStyle
{
  double v3;
  double v4;
  double v5;
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
  CGRect result;

  -[THGlossaryEntryLayout p_viewFrameBasedOnStyle](self, "p_viewFrameBasedOnStyle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(objc_msgSend(-[THGlossaryEntryLayout layoutController](self, "layoutController"), "canvas"), "viewScale");
  v12 = v10 / v11;
  v13 = v8 / v11;
  v14 = v4;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)p_columnFrameBasedOnStyle
{
  double v3;
  CGFloat v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  -[THGlossaryEntryLayout p_columnMargin](self, "p_columnMargin");
  v4 = v3;
  -[THGlossaryEntryLayout p_unscaledViewFrameBasedOnStyle](self, "p_unscaledViewFrameBasedOnStyle");
  v14 = CGRectInset(v13, v4, 0.0);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (CGRectIsNull(v14))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryLayout p_columnFrameBasedOnStyle]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryLayout.m"), 385, CFSTR("Column frame is NULL. Margin is probably too big."));
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)footerIndexTitleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
  v4 = v3;
  v6 = v5;
  -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 4);
  v8 = 28.0;
  v9 = v7 + self->mFooterOffset - 28.0;
  v10 = v4;
  v11 = v6;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (CGRect)footerIndexDividerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double mFooterOffset;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
  v4 = v3;
  v6 = v5;
  -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 4);
  v8 = v7;
  mFooterOffset = self->mFooterOffset;
  -[THGlossaryEntryLayout contentsScale](self, "contentsScale");
  v10 = 1.0;
  if (v11 > 1.0)
  {
    -[THGlossaryEntryLayout contentsScale](self, "contentsScale");
    v10 = 1.0 / v12;
  }
  v13 = v8 + mFooterOffset - (23.0 + 28.0);
  v14 = v4;
  v15 = v6;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGRect)footerTermsTitleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
  v4 = v3;
  v6 = v5;
  -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 3);
  v8 = 28.0;
  v9 = v7 + self->mFooterOffset - 28.0;
  v10 = v4;
  v11 = v6;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (CGRect)footerTermsDividerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double mFooterOffset;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
  v4 = v3;
  v6 = v5;
  -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 3);
  v8 = v7;
  mFooterOffset = self->mFooterOffset;
  -[THGlossaryEntryLayout contentsScale](self, "contentsScale");
  v10 = 1.0;
  if (v11 > 1.0)
  {
    -[THGlossaryEntryLayout contentsScale](self, "contentsScale");
    v10 = 1.0 / v12;
  }
  v13 = v8 + mFooterOffset - (23.0 + 28.0);
  v14 = v4;
  v15 = v6;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (id)reliedOnLayouts
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", -[THGlossaryEntryLayout children](self, "children"));
}

- (void)p_updateFloatingPositionsIfRequired
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __n128 v29;
  __n128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutFloatingStyle](self->mLayoutStyleProvider, "glossaryEntryLayoutFloatingStyle") == 2)
  {
    -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
    v4 = v3;
    v6 = v5;
    -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutValueForDistance:](self->mLayoutStyleProvider, "glossaryEntryLayoutValueForDistance:", 5);
    v8 = v7;
    -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutValueForDistance:](self->mLayoutStyleProvider, "glossaryEntryLayoutValueForDistance:", 4);
    v10 = v9;
    -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 2);
    v12 = v11;
    objc_msgSend(-[THGlossaryWPLayout geometry](-[THGlossaryEntryLayout bodyLayout](self, "bodyLayout"), "geometry"), "size");
    v14 = v13;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = -[THGlossaryEntryFloatingLayout floatingLayouts](-[THGlossaryEntryLayout floatingLayout](self, "floatingLayout", 0), "floatingLayouts");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = v10 + v12 + v14;
      v19 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          objc_msgSend(objc_msgSend(v21, "geometry"), "frame");
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29.n128_f64[0] = v4 + (v6 - v28) * 0.5;
          v30.n128_f64[0] = v18;
          objc_msgSend(v21, "offsetGeometryBy:", TSDSubtractPoints(v29, v30, v23, v25));
          v18 = v18 + v8 + v27;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v17);
    }
  }
}

- (int64_t)p_portionCount
{
  if (-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutHasFooter](self->mLayoutStyleProvider, "glossaryEntryLayoutHasFooter"))return 5;
  else
    return 3;
}

- (id)computeLayoutGeometry
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  double v15;
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
  double mFooterOffset;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double v37;
  double v38;
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
  double v54;
  double v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutValueForDistance:](self->mLayoutStyleProvider, "glossaryEntryLayoutValueForDistance:", 1);
  v4 = v3;
  v5 = -[THGlossaryEntryLayout p_portionCount](self, "p_portionCount");
  v6 = v5;
  if (v5 >= 3)
    v7 = 3;
  else
    v7 = v5;
  if (v7 < 2)
  {
    v9 = v4;
  }
  else
  {
    v8 = 1;
    v9 = v4;
    do
    {
      -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutTopMarginForPortion:", v8);
      v11 = v9 + v10;
      -[THGlossaryEntryLayout p_heightForPortion:](self, "p_heightForPortion:", v8);
      v9 = v11 + v12;
      ++v8;
    }
    while (v7 != v8);
  }
  v13 = 0.0;
  if (v6 >= 4)
  {
    for (i = 3; i < v6; i = (i + 1))
    {
      -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutTopMarginForPortion:", i);
      v16 = v13 + v15;
      -[THGlossaryEntryLayout p_heightForPortion:](self, "p_heightForPortion:", i);
      v13 = v16 + v17;
    }
  }
  v18 = v4 + v13;
  v19 = v9 + v4 + v13;
  -[THGlossaryEntryLayout p_unscaledViewFrameBasedOnStyle](self, "p_unscaledViewFrameBasedOnStyle");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  self->mFooterOffset = 0.0;
  if ((-[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutHasFooter](self->mLayoutStyleProvider, "glossaryEntryLayoutHasFooter") & 1) != 0)
  {
    mFooterOffset = v25 - v19;
    self->mFooterOffset = v25 - v19;
  }
  else
  {
    mFooterOffset = self->mFooterOffset;
  }
  if (mFooterOffset > 0.0)
  {
    -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutValueForDistance:](self->mLayoutStyleProvider, "glossaryEntryLayoutValueForDistance:", 2);
    v28 = v4 + v27;
    mFooterOffset = self->mFooterOffset;
    if (v28 > v18)
      mFooterOffset = mFooterOffset - (v28 - v18);
  }
  v29 = fmax(mFooterOffset, 0.0);
  self->mFooterOffset = v29;
  if (self->mRelatedTermsLayout)
  {
    -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 3);
    v31 = v30 + self->mFooterOffset;
    v32 = -[THGlossaryWPLayout geometry](self->mRelatedTermsLayout, "geometry");
    if (v32)
    {
      objc_msgSend(v32, "transform");
      v33 = *((double *)&v62 + 1);
    }
    else
    {
      v61 = 0u;
      v62 = 0u;
      v60 = 0u;
      v33 = 0.0;
    }
    -[THGlossaryWPLayout offsetGeometryBy:](self->mRelatedTermsLayout, "offsetGeometryBy:", 0.0, v31 - v33);
  }
  if (self->mIndexLayout)
  {
    -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", 4);
    v35 = v34 + self->mFooterOffset;
    v36 = -[THGlossaryWPLayout geometry](self->mIndexLayout, "geometry");
    if (v36)
    {
      objc_msgSend(v36, "transform");
      v37 = *((double *)&v59 + 1);
    }
    else
    {
      v58 = 0u;
      v59 = 0u;
      v57 = 0u;
      v37 = 0.0;
    }
    -[THGlossaryWPLayout offsetGeometryBy:](self->mIndexLayout, "offsetGeometryBy:", 0.0, v35 - v37, v57, v58, v59, v60, v61, v62);
  }
  -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutContentSize](self->mLayoutStyleProvider, "glossaryEntryLayoutContentSize");
  v39 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v21, v23, v38, v19 + v29);
  -[THGlossaryEntryLayout footerTermsTitleFrame](self, "footerTermsTitleFrame");
  -[THWLabelControlLayout setGeometry:](-[THGlossaryEntryLayout relatedTermsLabelLayout](self, "relatedTermsLabelLayout"), "setGeometry:", objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v40, v41, v42, v43));
  -[THGlossaryEntryLayout footerTermsDividerFrame](self, "footerTermsDividerFrame");
  -[THGlossaryDividerLayout setGeometry:](-[THGlossaryEntryLayout relatedTermsDividerLayout](self, "relatedTermsDividerLayout"), "setGeometry:", objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v44, v45, v46, v47));
  -[THGlossaryEntryLayout footerIndexTitleFrame](self, "footerIndexTitleFrame");
  -[THWLabelControlLayout setGeometry:](-[THGlossaryEntryLayout indexLabelLayout](self, "indexLabelLayout"), "setGeometry:", objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v48, v49, v50, v51));
  -[THGlossaryEntryLayout footerIndexDividerFrame](self, "footerIndexDividerFrame");
  -[THGlossaryDividerLayout setGeometry:](-[THGlossaryEntryLayout indexDividerLayout](self, "indexDividerLayout"), "setGeometry:", objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v52, v53, v54, v55));
  return v39;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;

  result = 0.0;
  if (!a3)
    objc_msgSend(objc_msgSend(-[THGlossaryEntryLayout info](self, "info", 0.0, v4, v5), "geometry"), "size");
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  return 0.0;
}

- (CGSize)adjustedInsets
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v5 = -[THGlossaryEntryLayout p_portionForLayout:](self, "p_portionForLayout:");
  if ((_DWORD)v5)
  {
    v6 = v5;
    -[THGlossaryEntryLayout p_viewFrameBasedOnStyle](self, "p_viewFrameBasedOnStyle");
    v8 = v7;
    -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutDefaultHeightForPortion:](self->mLayoutStyleProvider, "glossaryEntryLayoutDefaultHeightForPortion:", v6);
    -[THGlossaryEntryLayout autosizedFrameForTextLayout:textSize:](self, "autosizedFrameForTextLayout:textSize:", a3, v8, v9);
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  CGFloat height;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a4.height;
  v6 = -[THGlossaryEntryLayout p_portionForLayout:](self, "p_portionForLayout:", a3, a4.width);
  -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
  v8 = v7;
  v10 = v9;
  -[THGlossaryEntryLayout p_topCoordinateForPortion:](self, "p_topCoordinateForPortion:", v6);
  v12 = v11;
  v13 = v8;
  v14 = v10;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  return (Class)objc_msgSend(objc_msgSend(a3, "info"), "repClass");
}

- (double)maxAutoGrowHeightForTextLayout:(id)a3
{
  return 4096.0;
}

- (id)textWrapper
{
  return objc_alloc_init(THGlossaryTextWrapController);
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  if (-[THGlossaryEntryLayout floatingLayout](self, "floatingLayout") == a3)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self);
  else
    return 0;
}

- (id)reliedOnLayoutsForLayout:(id)a3
{
  id v5;
  THGlossaryEntryFloatingLayout *v6;

  v5 = +[NSMutableSet set](NSMutableSet, "set");
  if (-[THGlossaryEntryLayout bodyLayout](self, "bodyLayout") == a3)
  {
    if (!-[THGlossaryEntryLayout floatingLayout](self, "floatingLayout"))
      goto LABEL_11;
    objc_msgSend(v5, "addObjectsFromArray:", -[THGlossaryEntryFloatingLayout childrenForWrappingDependents](-[THGlossaryEntryLayout floatingLayout](self, "floatingLayout"), "childrenForWrappingDependents"));
    v6 = -[THGlossaryEntryLayout floatingLayout](self, "floatingLayout");
    goto LABEL_10;
  }
  if (-[THGlossaryEntryLayout relatedTermsLayout](self, "relatedTermsLayout") != a3)
  {
    if (-[THGlossaryEntryLayout indexLayout](self, "indexLayout") != a3)
      return v5;
    if (-[THGlossaryEntryLayout relatedTermsLayout](self, "relatedTermsLayout"))
      objc_msgSend(v5, "addObject:", -[THGlossaryEntryLayout relatedTermsLayout](self, "relatedTermsLayout"));
  }
  if (-[THGlossaryEntryLayout bodyLayout](self, "bodyLayout"))
  {
    v6 = -[THGlossaryEntryLayout bodyLayout](self, "bodyLayout");
LABEL_10:
    objc_msgSend(v5, "addObject:", v6);
  }
LABEL_11:
  if (-[THGlossaryEntryLayout headerLayout](self, "headerLayout"))
    objc_msgSend(v5, "addObject:", -[THGlossaryEntryLayout headerLayout](self, "headerLayout"));
  return v5;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  THGlossaryEntryFloatingLayout *v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)THGlossaryEntryLayout;
  -[THGlossaryEntryLayout maximumFrameSizeForChild:](&v13, "maximumFrameSizeForChild:");
  v6 = v5;
  v8 = v7;
  v9 = (THGlossaryEntryFloatingLayout *)objc_msgSend(a3, "parent");
  if (v9 == -[THGlossaryEntryLayout floatingLayout](self, "floatingLayout")
    && -[THGlossaryEntryLayoutStyleProvider glossaryEntryLayoutFloatingStyle](self->mLayoutStyleProvider, "glossaryEntryLayoutFloatingStyle") == 2)
  {
    -[THGlossaryEntryLayout p_columnFrameBasedOnStyle](self, "p_columnFrameBasedOnStyle");
    v6 = v10;
    v8 = v10;
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (THGlossaryEntryLayoutStyleProvider)layoutStyleProvider
{
  return self->mLayoutStyleProvider;
}

- (void)setRelatedTermsLabelLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (void)setIndexLabelLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (void)setRelatedTermsDividerLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (void)setIndexDividerLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

@end
